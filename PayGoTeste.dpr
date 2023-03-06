program PayGoTeste;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  G700Interface in 'G700Interface.pas',
  GEDIPrinter in 'GEDIPrinter.pas',
  InterfaceAutomacao_v1_6_0_0 in 'InterfaceAutomacao_v1_6_0_0.pas',
  Unit2 in 'Unit2.pas' {Form2},
  InterfaceAutomacao_v2_0_0_8 in 'InterfaceAutomacao_v2_0_0_8.pas',
  InterfaceAutomacao_v2_1_0_4 in 'InterfaceAutomacao_v2_1_0_4.pas',
  InterfaceAutomacao_v2_1 in 'InterfaceAutomacao_v2_1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
