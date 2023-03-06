﻿unit Unit1;

interface

uses

  //InterfaceAutomacao_v1_6_0_0,
  InterfaceAutomacao_v2_1,

  Unit2,

  GEDIPrinter,    //Esta unit inicializa o Modulo de impressao G700.
  G700Interface,
  ACBrPosPrinterGEDI,

  Androidapi.JNI.JavaTypes,
  Androidapi.Helpers,
  Androidapi.Log,

  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,

  FMX.Platform.Android,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Layouts,
  FMX.Edit,
  FMX.Objects,
  FMX.ListBox,
  FMX.DialogService,
  ACBrTEFComum,
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.Widget,
  Androidapi.Jni.GraphicsContentViewText,
  Androidapi.JNI.Util,
  Androidapi.Jni.OS, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, ACBrBase,
  ACBrTEFAPIComum, ACBrTEFAndroid,ACBrTEFPayGoComum, ACBrTEFAndroidPayGo, ACBrPosPrinter;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    editValor: TEdit;
    GroupBox2: TGroupBox;
    rbEstabelecimento: TRadioButton;
    rbEmissor: TRadioButton;
    rbAVista: TRadioButton;
    rbParcelamentoNaoDef: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    editParcelas: TEdit;
    cbAdquirente: TComboBox;
    cbConfManual: TCheckBox;
    cbViasDif: TCheckBox;
    cbViaReduz: TCheckBox;
    cbInterfaceAlternativa: TCheckBox;
    btnPagar: TButton;
    btnCancelamento: TButton;
    btnAdministrativo: TButton;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    ListBoxItem9: TListBoxItem;
    ListBoxItem10: TListBoxItem;
    ListBoxItem11: TListBoxItem;
    ListBoxItem12: TListBoxItem;
    ListBoxItem13: TListBoxItem;
    ListBoxItem14: TListBoxItem;
    ListBoxItem15: TListBoxItem;
    ListBoxItem16: TListBoxItem;
    ListBoxItem17: TListBoxItem;
    ListBoxItem18: TListBoxItem;
    ListBoxItem19: TListBoxItem;
    ListBoxItem20: TListBoxItem;
    ListBoxItem21: TListBoxItem;
    ListBoxItem22: TListBoxItem;
    GroupBox1: TGroupBox;
    cbNaoDefinido: TCheckBox;
    cbCredito: TCheckBox;
    cbDebito: TCheckBox;
    cbVoucher: TCheckBox;
    lay_teste: TLayout;
    Rectangle2: TRectangle;
    Memo1: TMemo;
    bt_fechar: TButton;
    ACBrTEFAndroid: TACBrTEFAndroid;
    ACBrPosPrinter: TACBrPosPrinter;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnCancelamentoClick(Sender: TObject);
    procedure btnAdministrativoClick(Sender: TObject);
    procedure cbNaoDefinidoChange(Sender: TObject);
    procedure cbCreditoChange(Sender: TObject);
    procedure cbDebitoChange(Sender: TObject);
    procedure cbVoucherChange(Sender: TObject);
    procedure ACBrTEFAndroidQuandoFinalizarOperacao(RespostaTEF: TACBrTEFResp);
    procedure ACBrTEFAndroidQuandoDetectarTransacaoPendente(
      RespostaTEF: TACBrTEFResp; const MsgErro: string);
    procedure Button1Click(Sender: TObject);
    procedure ACBrTEFAndroidQuandoFinalizarTransacao(RespostaTEF: TACBrTEFResp;
      AStatus: TACBrTEFStatusTransacao);
  private
    fGEDIPrinter: TACBrPosPrinterGEDI;
    procedure IniciaTEFACBR;
    procedure ExecutarAdministrativo(Operacao: String = '');
    procedure ImprimirComprovantes(ATEFResp: TACBrTEFResp);
    procedure ImprimirRelatorio(ATexto: String);
    procedure Toast(const AMsg: string; ShortDuration: Boolean);
    procedure ConfiguraImpressora;
    { Private declarations }
  public
    { Public declarations }

    mensagemErro : string;

    nsu, codigoAutorizacao, valorOperacao : string;

    GediPrint : TGEDIPrinter;

    procedure setTexLisBox;
    procedure iniPayGoInterface(mudacor : Boolean; ViaDeferenciada : Boolean; ViaReduzida: Boolean);
    procedure efetuaOperacao(operacoes : JOperacoes);
    procedure efetuaOperacaoPayGo(operacoes : JOperacoes);

    procedure LogAplicacao(msg: String);
    procedure traduzResultadoOperacao;

    procedure ConfirmaOperacao;
    procedure ImpressaoComprovantes(titulo, cupom : string);
    procedure trataComprovante;
    procedure existeTransacaoPendente;

    procedure mensagemFim(mensagem : string);

    function resultadoOperacacao : JRunnable;
    function setPersonalizacao(mudacor: Boolean): JPersonalizacao;
    function trataMensagemResultado : string;

  end;

var
  mHandler          : JHandler;
  mConfimacoes      : JConfirmacoes;
  mDadosAutomacao   : JDadosAutomacao;
  mPersonalizacao   : JPersonalizacao;
  mTransacoes       : JTransacoes;
  mSaidaTransacao   : JSaidaTransacao;
  mEntradaTransacao : JEntradaTransacao;
  mViasImpressao    : JViasImpressao;
  Form1             : TForm1;

implementation

uses
IniFiles,IOUtils;
{$R *.fmx}

// **********************************************
procedure TForm1.LogAplicacao(msg: String);
var
  M: TMarshaller;
begin
  LOGI(M.AsUtf8(msg).ToPointer);
end;
// **********************************************
procedure TForm1.Toast(const AMsg: string; ShortDuration: Boolean);
var
  ToastLength: Integer;
begin

  TDialogService.ShowMessage(AMsg);
  {{$IfNDef ANDROID
   TDialogService.ShowMessage(AMsg);
   {$Else
   if ShortDuration then
     ToastLength := TJToast.JavaClass.LENGTH_SHORT
   else
     ToastLength := TJToast.JavaClass.LENGTH_LONG;

   TJToast.JavaClass.makeText(SharedActivityContext, StrToJCharSequence(AMsg), ToastLength).show;
   Application.ProcessMessages;
  $EndIf}
end;
// **********************************************
procedure TForm1.FormCreate(Sender: TObject);
begin
    fGEDIPrinter := TACBrPosPrinterGEDI.Create(ACBrPosPrinter);

    //iniPayGoInterface(false, false, false);

    setTexLisBox;
    mHandler := TJHandler.Create;


  // dateFormat := TJDate
end;
// **********************************************

// **********************************************
procedure TForm1.setTexLisBox;
begin
  ListBoxItem1.Text  := 'PROVEDOR DESCONHECIDO';
  ListBoxItem2.Text  := 'LIBERCARD';
  ListBoxItem3.Text  := 'ELAVON';
  ListBoxItem4.Text  := 'CIELO';
  ListBoxItem5.Text  := 'RV';
  ListBoxItem6.Text  := 'BIN';
  ListBoxItem7.Text  := 'FDCORBAN';
  ListBoxItem8.Text  := 'REDE';
  ListBoxItem9.Text  := 'INFOCARDS';
  ListBoxItem10.Text := 'CREDSYSTEM';
  ListBoxItem11.Text := 'NDDCARD';
  ListBoxItem12.Text := 'VERO';
  ListBoxItem13.Text := 'GLOBAL';
  ListBoxItem14.Text := 'GAX';
  ListBoxItem15.Text := 'STONE';
  ListBoxItem16.Text := 'DMCARD';
  ListBoxItem17.Text := 'CTF';
  ListBoxItem18.Text := 'TICKETLOG';
  ListBoxItem19.Text := 'GETNET';
  ListBoxItem20.Text := 'VCMAIS';
  ListBoxItem21.Text := 'SAFRA';
  ListBoxItem22.Text := 'PAGSEGURO';
  ListBoxItem22.Text := 'CONDUCTOR';
end;
// **********************************************

// **********************************************
procedure TForm1.iniPayGoInterface(mudacor : Boolean; ViaDeferenciada : Boolean; ViaReduzida: Boolean);
var
  versao : JString;
begin

  versao := MainActivity.getPackageManager.getPackageInfo(MainActivity.getPackageName, 0).versionName;

  mPersonalizacao := setPersonalizacao(mudacor);

  mDadosAutomacao := TJDadosAutomacao.JavaClass.init(
                                         StringToJString('Gertec'),             // Empresa Automa��o
                                         StringToJString('Automa��o Demo'),     // Nome Automa��o
                                         versao,                                // Vers�o
                                         true,                                  // Suporta Troco
                                         true,                                  // Suporta Desconto
                                         ViaDeferenciada,                       // Via Diferenciada
                                         ViaReduzida,                           // Via Reduzida
                                         mPersonalizacao);                      // Personaliza Tela

  mTransacoes := TJTransacoes.JavaClass.obtemInstancia(mDadosAutomacao, MainActivity);

end;
// **********************************************

// **********************************************
function TForm1.setPersonalizacao(mudacor : Boolean): JPersonalizacao;
var
  pb : JPersonalizacao_Builder;
begin

  pb := TJPersonalizacao_Builder.Create;

  if mudacor then
  begin
    pb.informaCorFonte(StringToJString('#000000'));
    pb.informaCorFonteTeclado(StringToJString('#000000'));
    pb.informaCorFundoCaixaEdicao(StringToJString('#FFFFFF'));
    pb.informaCorFundoTela(StringToJString('#F4F4F4'));
    pb.informaCorFundoTeclado(StringToJString('#F4F4F4'));
    pb.informaCorFundoToolbar(StringToJString('#2F67F4'));
    pb.informaCorTextoCaixaEdicao(StringToJString('#000000'));
    pb.informaCorTeclaPressionadaTeclado(StringToJString('#e1e1e1'));
    pb.informaCorTeclaLiberadaTeclado(StringToJString('#dedede'));
    pb.informaCorSeparadorMenu(StringToJString('#2F67F4'));

  end;

  result := pb.build;

end;
// **********************************************

// **********************************************
procedure TForm1.ACBrTEFAndroidQuandoDetectarTransacaoPendente(
  RespostaTEF: TACBrTEFResp; const MsgErro: string);
var
  AStatus: TACBrTEFStatusTransacao;
  i: Integer;
  ATEFResp: TACBrTEFResp;
  aMsgErro: String;
begin
  // Aqui você pode Confirmar ou Desfazer as transações pendentes de acordo com
  // a sua regra de negócios

  // Exemplo 0 - Deixe o ACBrTEFAndroid CONFIRMAR todas transações pendentes automaticamente
  // ACBrTEFAndroid1.AutoConfirmarTransacoesPendente := True;
  // Nesse caso... esse evento não será disparado.

  // Exemplo 1 -  Envio de confirmação automática:
  // AStatus := stsSucessoManual;
  // ACBrTEFAndroid1.ResolverOperacaoPendente(AStatus);

  // Exemplo 2 -  Fazer uma pergunta ao usuário:
  if (MsgErro = '') then
    AMsgErro := RespostaTEF.TextoEspecialOperador
  else
    AMsgErro := MsgErro;

  TDialogService.MessageDialog( AMsgErro + sLineBreak+sLineBreak +
                                'Confirmar ?',
                                TMsgDlgType.mtConfirmation,
                                [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
                                TMsgDlgBtn.mbYes, 0,

    procedure(const AResult: TModalResult)
    begin
        if (AResult = mrYes) then
          AStatus := TACBrTEFStatusTransacao.tefstsSucessoManual
        else
          AStatus := TACBrTEFStatusTransacao.tefstsErroDiverso;

        ACBrTEFAndroid.ResolverTransacaoPendente(AStatus);
      end
  );

  // Se confirmou, vamos re-imprimir a transação que ficou pendente
  if (AStatus in [tefstsSucessoAutomatico, tefstsSucessoManual]) then
  begin
    ATEFResp := RespostaTEF;
    // Achando a transação original...
    for i := 0 to ACBrTEFAndroid.RespostasTEF.Count-1 do
    begin
      if (ACBrTEFAndroid.RespostasTEF[i].NSU = RespostaTEF.NSU) and
         (ACBrTEFAndroid.RespostasTEF[i].Rede = RespostaTEF.Rede) then
      begin
        ATEFResp := ACBrTEFAndroid.RespostasTEF[i];
        Break;
      end;
    end;

    ImprimirComprovantes(ATEFResp);
  end;

end;

procedure TForm1.ImprimirRelatorio(ATexto: String);
var
  ComandoInicial, ComandoFinal: string;
begin

  {GertecPrinter.textSize := 18;
  GertecPrinter.FlagBold := true;
  GertecPrinter.textFamily := 0;
  GertecPrinter.PrintString(ESQUERDA, ATexto);
  GertecPrinter.printBlankLine(150);
  GertecPrinter.printOutput;}

  comandoInicial := '</zera>';
  if false then
    ComandoInicial := ComandoInicial + '<c>';
  if true then
    ComandoInicial := ComandoInicial + '<n>';
  ComandoFinal := '</lf></corte_total>';

  ConfiguraImpressora;
  ACBrPosPrinter.Ativar;
  ACBrPosPrinter.Imprimir(ComandoInicial + ATexto + ComandoFinal);
  ACBrPosPrinter.desAtivar;


end;

procedure TForm1.ConfiguraImpressora;
begin

  ACBrPosPrinter.ConfigLogo.KeyCode1 := 1;
  ACBrPosPrinter.ConfigLogo.KeyCode2 := 0;
  ACBrPosPrinter.ModeloExterno  := fGEDIPrinter;
  ACBrPosPrinter.PaginaDeCodigo := TACBrPosPaginaCodigo(0);//TACBrPosPaginaCodigo(pcNone);//(pcNone, pc437, pc850, pc852, pc860, pcUTF8, pc1252);
  ACBrPosPrinter.ColunasFonteNormal := 32;
  ACBrPosPrinter.Inicializar;


end;

procedure TForm1.ImprimirComprovantes(ATEFResp: TACBrTEFResp);
begin
  if not Assigned(ATEFResp) then
    Exit;

  if (ATEFResp.ImagemComprovante2aVia.Count > 0) then
    ImprimirRelatorio( ATEFResp.ImagemComprovante2aVia.Text );

  if (ATEFResp.ImagemComprovante1aVia.Count > 0) then
  begin
    if true or         // Configurado para sempre Imprimir
       (ATEFResp.ImagemComprovante2aVia.Count = 0) then  // Só recebeu a via do Cliente
    begin
      ImprimirRelatorio( ATEFResp.ImagemComprovante1aVia.Text )
    end else if true then   // Perguntar
    begin

         TDialogService.MessageDialog( 'Imprimir Via do Cliente ?',
                                    TMsgDlgType.mtConfirmation,
                                    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
                                    TMsgDlgBtn.mbYes, 0,
        procedure(const AResult: TModalResult)
        var
          AStatus: LongWord;
        begin
          if (AResult = mrYes) then
            ImprimirRelatorio( ATEFResp.ImagemComprovante1aVia.Text );
        end);



    end;
  end;
end;

procedure TForm1.ACBrTEFAndroidQuandoFinalizarOperacao(
  RespostaTEF: TACBrTEFResp);
var
  i, nINFO: Integer;
  TheKey, TheValue: string;
  MsgFinal: String;
begin

  LogAplicacao('FINAL ACBrTEFAndroidQuandoFinalizarOperacao');
  //  if swExibirLogAposTransacao.IsChecked then
  //    MostrarTelaUltimaTransacao;

  {with memoDadosUltimaTransacao.Lines do
  begin
    Clear;

    MsgFinal := RespostaTEF.TextoEspecialOperador;

    Add('');
    Add('');
    Add('------ Fim da Transação ------');
    Add('Sucesso: '+IfThen(RespostaTEF.Sucesso, 'SIM', 'NÃO'));
    Add('Resultado: '+MsgFinal);

    // Usando as propriedades de TACBrTEFResp
    Add('');
    Add('- Rede: '  + RespostaTEF.Rede );
    Add('- NSU: '  + RespostaTEF.NSU );
    Add('- Parcelas: '+ IntToStr(RespostaTEF.QtdParcelas) +
                  ', parcelado por: '+
                  GetEnumName(TypeInfo(TACBrTEFRespParceladoPor), integer(RespostaTEF.ParceladoPor) ));
    Add('- Tipo Cartão: '+IfThen(RespostaTEF.Debito, 'Debito',
                                  IfThen(RespostaTEF.Credito, 'Crédito', '')) );
    Add(' - Valor: '+ FormatFloat(',0.00',RespostaTEF.ValorTotal)) ;

    // Lendo um Campo Específico //
    Add('- PWINFO_REQNUM: ' + RespostaTEF.LeInformacao(PWINFO_REQNUM,0).AsString );
  end;}

  {memoViaEstabelecimento.Lines.Text := RespostaTEF.ImagemComprovante2aVia.Text;
  memoViaCliente.Lines.Text  := RespostaTEF.ImagemComprovante1aVia.Text;}

  // Exemplo de como processar a Impressão dos comprovantes
  ShowMessage('sucesso:'+booltostr(RespostaTEF.Sucesso));

  if not RespostaTEF.Sucesso then
  begin
    if MsgFinal.ToUpper.Contains('PENDENTE') then
    begin
      if (ACBrTEFAndroid.TratamentoTransacaoPendente = tefpenConfirmar) then
        MsgFinal := MsgFinal + sLineBreak + 'Transação será CONFIRMADA'
      else if (ACBrTEFAndroid.TratamentoTransacaoPendente = tefpenEstornar) then
          MsgFinal := MsgFinal + sLineBreak + 'Transação será ESTORNADA'
      else
        MsgFinal := '';  // Ignora esse erro, pois será tratado em QuandoDetectarTransacaoPendente
    end;
  end
  else
  begin
    // Para Confirmar a transação Automáticamento... use:
    //      "ConfirmarTransacoesAutomaticamente := True"
    // Para Confirmar Manualmente a trasação, use o exemplo abaixo...
    if cbConfManual.IsChecked and RespostaTEF.Confirmar then
    begin
      MsgFinal := '';
      TDialogService.MessageDialog( 'Transação Autorizada'+sLineBreak+sLineBreak+
                                    'Deseja Confirmar ?',
                                    TMsgDlgType.mtConfirmation,
                                    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
                                    TMsgDlgBtn.mbYes, 0,

        procedure(const AResult: TModalResult)
        var
          AStatus: TACBrTEFStatusTransacao;
        begin
            if (AResult = mrYes) then
              AStatus := TACBrTEFStatusTransacao.tefstsSucessoManual
            else
              AStatus := TACBrTEFStatusTransacao.tefstsErroDiverso;

            ACBrTEFAndroid.FinalizarTransacao(AStatus);

            if (AResult = mrYes) then
              ImprimirComprovantes(RespostaTEF);
        end);

    end
    else
      ShowMessage('fiuu');
      ImprimirComprovantes(RespostaTEF);
  end;

  if (MsgFinal <> '') then
  begin
    if not RespostaTEF.Sucesso then
      TDialogService.MessageDialog( MsgFinal,
                                    TMsgDlgType.mtError,
                                    [TMsgDlgBtn.mbOK],
                                    TMsgDlgBtn.mbOK, 0, nil)
    else
      Toast(MsgFinal, False);
  end;

  // Exemplo de como usar as Propriedades da API, fazendo TypeCast
  if (ACBrTEFAndroid.TEF is TACBrTEFAndroidPayGoClass) then
  begin
    //memoDadosUltimaTransacao.Lines.Add('');
    //memoDadosUltimaTransacao.Lines.Add( '-- Retornos do PayGo API --');
    with TACBrTEFAndroidPayGoClass(ACBrTEFAndroid.TEF) do
    begin
      for i := 0 to TEFPayGoAPI.DadosDaTransacao.Count-1 do
      begin
        ParseKeyValue(TEFPayGoAPI.DadosDaTransacao[i], TheKey, TheValue);
        nINFO := StrToIntDef(TheKey,-1);
        if (nINFO >= 0) then
          //memoDadosUltimaTransacao.Lines.Add(PWINFOToString(nINFO) + ' = ' + TheValue );
      end;
    end;
  end;
end;

procedure TForm1.ACBrTEFAndroidQuandoFinalizarTransacao(
  RespostaTEF: TACBrTEFResp; AStatus: TACBrTEFStatusTransacao);
begin
  LogAplicacao('ACBrTEFAndroidQuandoFinalizarTransacao********************************************');
end;

procedure TForm1.btnAdministrativoClick(Sender: TObject);
begin
  //efetuaOperacao(TJOperacoes.JavaClass.ADMINISTRATIVA);
  ExecutarAdministrativo;
end;
// **********************************************

// **********************************************
procedure TForm1.btnCancelamentoClick(Sender: TObject);
var
  arq: TextFile;
  linha :string;
begin
  inherited;

  {Memo1.Lines.clear;
  //AssignFile(arq, TPath.Combine(TPath.GetPublicPath,'logPAYGOTEF.log'));
  AssignFile(arq, TPath.Combine(TPath.GetDocumentsPath,'arquivologtef.txt'));

  {$I- */         // desativa a diretiva de Input
  Reset(arq);   // [ 3 ] Abre o arquivo texto para leitura
  {$I+ */         // ativa a diretiva de Input

  if (IOResult <> 0) // verifica o resultado da operação de abertura
  then
  begin
    Memo1.Lines.Add('Erro na abertura do arquivo !!!')
  end else
  begin

    // [ 11 ] verifica se o ponteiro de arquivo atingiu a marca de final de arquivo
    while (not eof(arq)) do
    begin
     readln(arq, linha); // [ 6 ] Lê uma linha do arquivo

     Memo1.Lines.Add(linha);
    end;

    CloseFile(arq); // [ 8 ] Fecha o arquivo texto aberto
  end;

  lay_teste.Visible := true;}
  Form2.show;
end;
// **********************************************

// **********************************************
procedure TForm1.btnPagarClick(Sender: TObject);
var
  TEFOK:Boolean;
  DateTimeValue: TDateTime;
  msg,horaTransacao,IdentificadorTransacao:string;
begin
  //efetuaOperacao(TJOperacoes.JavaClass.VENDA);
  //efetuaOperacaoPayGo(TJOperacoes.JavaClass.VENDA);
  Msg   := '';

  LogAplicacao('INICOU*********************************************************************');
  {horaTransacao := FormatDateTime('hh:nn:ss.zzz', now);
  Msg:= Msg+'Status:'+BoolToStr(TefOK)+#10+#13;
  TefOK := false;
  Msg:= Msg+'Inicio:'+horaTransacao+#10+#13;
  Msg:= Msg+'Status:'+BoolToStr(TefOK)+#10+#13;}

  IniciaTEFACBR;
  IdentificadorTransacao := FormatDateTime('hhnnss',now);
  ACBrTEFAndroid.EfetuarPagamento(IdentificadorTransacao,
                                    strtofloat(editValor.text),
                                    TACBrTEFModalidadePagamento.tefmpCartao,
                                    [TACBrTEFTipoCartao.teftcDebito],
                                    TACBrTEFModalidadeFinanciamento.tefmfAVista,
                                    0,
                                    0);

  //ShowMessage(inttostr(ACBrTEFAndroid.UltimaRespostaTEF.ID));

  {horaTransacao := FormatDateTime('hh:nn:ss.zzz', now);
  Msg:= Msg+'Fim:'+horaTransacao+#10+#13;
  Msg:= Msg+'Status:'+BoolToStr(TefOK)+#10+#13;
  ShowMessage(msg);}

end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  LogAplicacao('botão clicado');
end;

procedure TForm1.ExecutarAdministrativo(Operacao: String = '');
begin
  IniciaTEFACBR;
  ACBrTEFAndroid.EfetuarAdministrativa(Operacao);
end;

Procedure  TForm1.IniciaTEFACBR;
begin

  with ACBrTEFAndroid do
  begin


    if Inicializado then  Exit;

    DesInicializar;

    DiretorioTrabalho := TPath.Combine(TPath.GetPublicPath, 'tef');
    ArqLOG := TPath.Combine(DiretorioTrabalho, 'acbrtefandroid.log');

    if not DirectoryExists(DiretorioTrabalho) then  ForceDirectories(DiretorioTrabalho);

    Modelo := tefPayGo;

    DadosAutomacao.NomeSoftwareHouse := 'Giro';
    DadosAutomacao.CNPJSoftwareHouse := '06922188000101';
    DadosAutomacao.NomeAplicacao     := 'GoParking-PayGoTeste';
    DadosAutomacao.VersaoAplicacao   := '1';
    DadosAutomacao.SuportaSaque := false;
    DadosAutomacao.SuportaDesconto := false;
    DadosAutomacao.SuportaViasDiferenciadas := true;
    DadosAutomacao.ImprimeViaClienteReduzida := false;
    DadosAutomacao.UtilizaSaldoTotalVoucher := false;
    DadosEstabelecimento.RazaoSocial := 'Jap Estacionamentos';
    DadosEstabelecimento.CNPJ        := '06922188000101';
    ConfirmarTransacaoAutomaticamente := cbConfManual.IsChecked;
    TratamentoTransacaoPendente := TACBrTEFTratamentoTransacaoPendente(0);
    TratamentoTransacaoInicializacao := TACBrTEFTratamentoTransacaoInicializacao(1);
    Inicializar;

  end;

end;

// **********************************************

// **********************************************
procedure TForm1.cbCreditoChange(Sender: TObject);
begin
  if cbCredito.IsChecked then
    begin
      editParcelas.Enabled    := True;
      cbNaoDefinido.IsChecked := False;
      cbDebito.IsChecked      := False;
      cbVoucher.IsChecked     := False;
    end;

end;
// **********************************************

// **********************************************
procedure TForm1.cbDebitoChange(Sender: TObject);
begin
  if cbDebito.IsChecked then
    begin
      editParcelas.Enabled    := False;
      cbNaoDefinido.IsChecked := False;
      cbCredito.IsChecked     := False;
      cbVoucher.IsChecked     := False;
    end;
end;
// **********************************************

// **********************************************
procedure TForm1.cbNaoDefinidoChange(Sender: TObject);
begin
  if cbNaoDefinido.IsChecked then
    begin
      editParcelas.Enabled := False;
      cbCredito.IsChecked  := False;
      cbDebito.IsChecked   := False;
      cbVoucher.IsChecked  := False;
    end;

end;
// **********************************************

// **********************************************
procedure TForm1.cbVoucherChange(Sender: TObject);
begin
  if cbVoucher.IsChecked then
    begin
      editParcelas.Enabled := False;
      cbNaoDefinido.IsChecked := False;
      cbCredito.IsChecked := False;
      cbDebito.IsChecked := False;
    end;
end;
// **********************************************

// **********************************************
procedure TForm1.efetuaOperacao(operacoes : JOperacoes);
var
  NumeroOperacao : integer;
  datajava       : JDate;
begin
  // OK
    tthread.CreateAnonymousThread(
    procedure
    begin

      NumeroOperacao := Round(random(99999)); // 99999 � o limite do numero randomico

      iniPayGoInterface(cbInterfaceAlternativa.IsChecked, cbViasDif.IsChecked, cbViaReduz.IsChecked);

      mEntradaTransacao := TJEntradaTransacao.JavaClass.init(operacoes, StringToJString(IntToStr(NumeroOperacao)));

      // Start da opera��o

      // Se for venda informa o n�mero da opera��o
      if operacoes = TJOperacoes.JavaClass.VENDA then
        mEntradaTransacao.informaDocumentoFiscal(StringToJString(IntToStr(NumeroOperacao)));

      // Valor Total da Opera��o
      mEntradaTransacao.informaValorTotal(StringToJString(editValor.Text.Replace(',', '').Replace('.','')));

      // Case seja um cancelamento
      if operacoes = TJOperacoes.JavaClass.CANCELAMENTO then
      begin
         mEntradaTransacao.informaNsuTransacaoOriginal(StringToJString(Form2.editNSU.Text));
         mEntradaTransacao.informaCodigoAutorizacaoOriginal(StringToJString(form2.editCodigoAutorizacao.text));
         datajava := TJDate.JavaClass.init(StringToJString(Form2.editDataTransacao.text));
         mEntradaTransacao.informaDataHoraTransacaoOriginal(datajava);
         //Informa novamente o valor para realizar a opera��o de cancelamento
         mEntradaTransacao.informaValorTotal(StringToJString(Form2.editValorTransacao.text));
      end;

      mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_DEBITO);

      // Defini o tipo de cart�o que vai ser usado na opera��o
      if cbNaoDefinido.IsChecked then
        begin
          mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_DESCONHECIDO);
        end
      else if cbCredito.IsChecked then
        begin
          mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_CREDITO);
        end
      else if cbDebito.IsChecked then
        begin
          mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_DEBITO);
        end
      else if cbVoucher.IsChecked then
        begin
          mEntradaTransacao.informaTipoCartao(TJCartoes.JavaClass.CARTAO_VOUCHER);
        end;

      mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.A_VISTA);

      // Define o tipo de parcelamento ou se a opera��o vai ser A Vista
      if rbParcelamentoNaoDef.IsChecked then
        begin
          mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.FINANCIAMENTO_NAO_DEFINIDO);
        end
      else if rbAVista.IsChecked then
        begin
          mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.A_VISTA);
        end

      else if rbEmissor.IsChecked then
        begin
          mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.PARCELADO_EMISSOR);
          mEntradaTransacao.informaNumeroParcelas(StrToInt(editParcelas.Text));
        end

      else if rbEstabelecimento.IsChecked then
        begin
          mEntradaTransacao.informaTipoFinanciamento(TJFinanciamentos.JavaClass.PARCELADO_ESTABELECIMENTO);
          mEntradaTransacao.informaNumeroParcelas(StrToInt(editParcelas.Text));
        end;

      // Define o provedor que sera usado
      if cbAdquirente.Selected.Text = '' then
        // OK
      else if cbAdquirente.Selected.Text = 'PROVEDOR DESCONHECIDO' then
        // OK
      else
        mEntradaTransacao.informaNomeProvedor(StringToJString(cbAdquirente.Selected.Text));

      try
        try
          begin
            // Moeda que esta sendo usada na opera��o
            mEntradaTransacao.informaCodigoMoeda(StringToJString('986')); // Real
            mConfimacoes := TJConfirmacoes.Create;

            mSaidaTransacao := mTransacoes.realizaTransacao(mEntradaTransacao);

            if mSaidaTransacao = nil then
                LogAplicacao('mSaidaTransacao esta NIL');

            if  mSaidaTransacao.obtemResultadoTransacao() = 0 then
            begin
              mConfimacoes.informaIdentificadorConfirmacaoTransacao(
                  mSaidaTransacao.obtemIdentificadorConfirmacaoTransacao
                );
            end;

          end;

        except
          on e : EJNIException do
          begin
            mensagemErro := e.Message;
          end;
          on e : Exception do
          begin
            mensagemErro := e.Message;
          end;

        end;
      finally
        mHandler.post(resultadoOperacacao);
      end;
    end
  ).Start;

end;

procedure TForm1.efetuaOperacaoPayGo(operacoes: JOperacoes);
var
  NumeroOperacao : integer;
  datajava       : JDate;
begin
//
end;

// **********************************************
function TForm1.resultadoOperacacao : JRunnable;
begin

  LogAplicacao('Ate aqui OK.');
  traduzResultadoOperacao;

end;
// **********************************************

procedure TForm1.traduzResultadoOperacao();
var

  mensagemAlert : string;
  mensagemRetorno : string;

  resultado : Integer;

  confirmaOperacaoManual : Boolean;
  TransacaoPendente : Boolean;

begin

  resultado := -999999;

  if mSaidaTransacao = nil then
    resultado := -999999
  else
    begin

      confirmaOperacaoManual := false;
      TransacaoPendente := false;

      resultado := mSaidaTransacao.obtemResultadoTransacao();

      if resultado = 0 then
      begin

        if mSaidaTransacao.obtemInformacaoConfirmacao() then
        begin
          if cbConfManual.IsChecked then
            begin
              LogAplicacao('CONFIRMADO_MANUAL');
              confirmaOperacaoManual := true;
            end
          else
            begin
              LogAplicacao('CONFIRMADO_AUTOMATICO');
              mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.CONFIRMADO_AUTOMATICO);
              mTransacoes.confirmaTransacao(mConfimacoes);
            end;

        end else if mSaidaTransacao.existeTransacaoPendente then
        begin
          LogAplicacao('Tratar');
        end

      end else if mSaidaTransacao.existeTransacaoPendente then
      begin
        LogAplicacao('Existe Transa��o Pendente');
        mConfimacoes := TJConfirmacoes.Create;
        TransacaoPendente := true
      end else
      begin
        LogAplicacao('Aconteceu algum erro no processo');
        mensagemAlert := 'Erro';
      end;

      mensagemRetorno := JStringToString(TJString.Wrap(mSaidaTransacao.obtemMensagemResultado.intern));

      if mensagemRetorno.length > 0 then
        begin
          LogAplicacao('At� aqui esta tudo certo');
          LogAplicacao(mensagemRetorno);
          if resultado = 0 then
            begin
              nsu        := JStringToString(mSaidaTransacao.obtemNsuHost);
              codigoAutorizacao := JStringToString(mSaidaTransacao.obtemCodigoAutorizacao);
              valorOperacao     := editValor.Text;

              mensagemAlert := mensagemRetorno;
              mensagemAlert := mensagemAlert + #13#10 + #13#10 + trataMensagemResultado();

            end
          else
            mensagemAlert := mensagemAlert + #13#10 + #13#10 +  mensagemRetorno;

        end
      else if (mensagemErro.length = 0) then
        begin
          if resultado = 0 then
            mensagemAlert := 'Opera��o OK'
          else
            mensagemAlert := 'Erro: ' + IntToStr(resultado);
        end

      else
        begin
          mensagemAlert := mensagemRetorno;
        end;


      if resultado = 0 then
        begin
          if(confirmaOperacaoManual) then
            begin
              mensagemFim(mensagemAlert);
              ConfirmaOperacao;
            end
          else
            begin
              trataComprovante;
              mensagemFim(mensagemAlert);
            end
        end
      else
        if(TransacaoPendente) then
          existeTransacaoPendente
        else
          mensagemFim(mensagemAlert);

    end;

end;
// **********************************************

function TForm1.trataMensagemResultado : string;
var
  mensagem : string;
begin

  mensagem := 'ID do Cart�o: ' + JStringToString(mSaidaTransacao.obtemAidCartao);

  mensagem := mensagem + #13#10 + #13#10 + 'Nome Portador Cart�o: ' + JStringToString( mSaidaTransacao.obtemNomePortadorCartao());
  mensagem := mensagem + #13#10 + 'Nome Cart�o Padr�o: ' + JStringToString( mSaidaTransacao.obtemNomeCartaoPadrao());
  mensagem := mensagem + #13#10 + 'Nome Estabelecimento: ' + JStringToString( mSaidaTransacao.obtemNomeEstabelecimento());

  mensagem := mensagem + #13#10 + #13#10 + 'Pan Mascarado Cart�o: ' + JStringToString( mSaidaTransacao.obtemPanMascaradoPadrao());
  mensagem := mensagem + #13#10 + 'Pan Mascarado: ' + JStringToString( mSaidaTransacao.obtemPanMascarado());

  mensagem := mensagem + #13#10 + #13#10 + 'Identificador Transa��o: ' + JStringToString( mSaidaTransacao.obtemIdentificadorConfirmacaoTransacao());

  mensagem := mensagem + #13#10 + #13#10 + 'NSU Original: ' + JStringToString( mSaidaTransacao.obtemNsuLocalOriginal());
  mensagem := mensagem + #13#10 + 'NSU Local: ' + JStringToString( mSaidaTransacao.obtemNsuLocal());
  mensagem := mensagem + #13#10 + 'NSU Transa��o: ' + JStringToString( mSaidaTransacao.obtemNsuHost());

  mensagem := mensagem + #13#10 + #13#10 + 'Nome Cart�o: ' + JStringToString( mSaidaTransacao.obtemNomeCartao());
  mensagem := mensagem + #13#10 + 'Nome Provedor: ' + JStringToString( mSaidaTransacao.obtemNomeProvedor());

  mensagem := mensagem + #13#10 + #13#10 + 'Modo Verifica��o Senha: ' + JStringToString( mSaidaTransacao.obtemModoVerificacaoSenha());

  mensagem := mensagem + #13#10 + #13#10 + 'Cod Autoriza��o: ' + JStringToString( mSaidaTransacao.obtemCodigoAutorizacao());
  mensagem := mensagem + #13#10 + 'Cod Autoriza��o Original: ' + JStringToString( mSaidaTransacao.obtemCodigoAutorizacaoOriginal());
  mensagem := mensagem + #13#10 + 'Ponto Captura: ' + JStringToString( mSaidaTransacao.obtemIdentificadorPontoCaptura());

  mensagem := mensagem + #13#10 + #13#10 + 'Valor da Opera��o: ' + JStringToString( mSaidaTransacao.obtemValorTotal());
  mensagem := mensagem + #13#10 + 'Salvo Voucher: ' + JStringToString( mSaidaTransacao.obtemSaldoVoucher());

  LogAplicacao(mensagem);

  result := mensagem;

end;
// **********************************************

procedure TForm1.mensagemFim(mensagem : string);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      TDialogService.MessageDialog
              (mensagem,
              System.UITypes.TMsgDlgType.mtConfirmation,
              [System.UITypes.TMsgDlgBtn.mbOK],
              System.UITypes.TMsgDlgBtn.mbOK, 0,
              procedure(const AResult: TModalResult)
              begin
                LogAplicacao('Mensagem FIM');
              end);
            end);
end;


// **********************************************
procedure TForm1.ConfirmaOperacao;
begin
  TThread.Synchronize(nil,
    procedure
    begin
      TDialogService.MessageDialog
              ('Deseja confirmar a opera��o?',
              System.UITypes.TMsgDlgType.mtConfirmation,
              [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
              System.UITypes.TMsgDlgBtn.mbYes, 0,
              procedure(const AResult: TModalResult)
              begin
                LogAplicacao('CONFIRMADO_MANUAL');
                if (AResult = mrYES) then
                  begin
                    LogAplicacao('Operador acabou de confirmar a opera��o.');
                    mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.CONFIRMADO_MANUAL);
                    mTransacoes.confirmaTransacao(mConfimacoes);
                    trataComprovante;
                  end
                else
                  begin
                    LogAplicacao('Operador acabou de cancelar a opera��o.');
                    mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.DESFEITO_MANUAL);
                    mTransacoes.confirmaTransacao(mConfimacoes);
                    trataComprovante;
                  end;
              end);
            end);
end;
// **********************************************

procedure TForm1.existeTransacaoPendente;
begin
  TThread.Synchronize(nil,
    procedure
    begin
      TDialogService.MessageDialog
              ('Deseja confirmar a transa��o que esta PENDENTE?',
              System.UITypes.TMsgDlgType.mtConfirmation,
              [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
              System.UITypes.TMsgDlgBtn.mbYes, 0,
              procedure(const AResult: TModalResult)
              begin
                LogAplicacao('CONFIRMADO_MANUAL');
                if (AResult = mrYES) then
                  begin
                    LogAplicacao('Transa��o Pendente foi CONFIRMADO_MANUAL.');
                    mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.CONFIRMADO_MANUAL);
                    mTransacoes.resolvePendencia(mSaidaTransacao.obtemDadosTransacaoPendente, mConfimacoes);
                  end
                else
                  begin
                    LogAplicacao('Transa��o Pendente foi DESFEITO_ERRO_IMPRESSAO_AUTOMATICO.');
                    mConfimacoes.informaStatusTransacao(TJStatusTransacao.JavaClass.DESFEITO_ERRO_IMPRESSAO_AUTOMATICO);
                    mTransacoes.confirmaTransacao(mConfimacoes);
                  end;
              end);
            end);
end;
// **********************************************

procedure TForm1.trataComprovante;
var
  listCupom : JList;
  iter: JIterator;
  cupom : string;
begin

  if cbViasDif.IsChecked then
    begin
      mViasImpressao := mSaidaTransacao.obtemViasImprimir();

      if ( mViasImpressao.equals(TJViasImpressao.JavaClass.VIA_CLIENTE) )
         or
          ( mViasImpressao.equals(TJViasImpressao.JavaClass.VIA_CLIENTE_E_ESTABELECIMENTO) ) then
         begin
          listCupom := mSaidaTransacao.obtemComprovanteDiferenciadoPortador;
          if listCupom.size > 0  then
            begin
              cupom := '';
              iter := listCupom.iterator;
              while iter.hasNext do
              begin
                cupom := cupom + JStringToString(TJString.Wrap(iter.next).intern);
              end;
              ImpressaoComprovantes('Via Cliente', cupom);

            end;

         end;

      if ( mViasImpressao.equals(TJViasImpressao.JavaClass.VIA_ESTABELECIMENTO) )
          or
         ( mViasImpressao.equals(TJViasImpressao.JavaClass.VIA_CLIENTE_E_ESTABELECIMENTO) ) then
        begin
          listCupom := mSaidaTransacao.obtemComprovanteDiferenciadoLoja;
          if listCupom.size > 0  then
          begin
            cupom := '';
            iter := listCupom.iterator;
            while iter.hasNext do
            begin
              cupom := cupom + JStringToString(TJString.Wrap(iter.next).intern);
            end;
            ImpressaoComprovantes('Via do Estabelecimento', cupom);

          end;

        end;

    end
  else
    begin
      listCupom := mSaidaTransacao.obtemComprovanteCompleto;
      if listCupom.size > 0  then
      begin
        iter := listCupom.iterator;
        while iter.hasNext do
        begin
          cupom := cupom + JStringToString(TJString.Wrap(iter.next).intern);
        end;
        ImpressaoComprovantes('Comprovante Full', cupom);
      end;
    end;

end;

// **********************************************
procedure TForm1.ImpressaoComprovantes(titulo, cupom : string);
begin
  TThread.Synchronize(nil,
    procedure
    begin
      TDialogService.MessageDialog
              ('Deseja imprimir ' + titulo + '?',
              System.UITypes.TMsgDlgType.mtConfirmation,
              [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
              System.UITypes.TMsgDlgBtn.mbYes, 0,
              procedure(const AResult: TModalResult)
              begin
                LogAplicacao('Imprimindo ' + titulo);
                if (AResult = mrYES) then
                  begin
                    GertecPrinter.textSize := 18;
                    GertecPrinter.FlagBold := true;
                    GertecPrinter.textFamily := 0;
                    GertecPrinter.PrintString(ESQUERDA, cupom);
                    GertecPrinter.printBlankLine(150);
                    GertecPrinter.printOutput;
                  end;
              end);
            end);
end;
// **********************************************

end.
