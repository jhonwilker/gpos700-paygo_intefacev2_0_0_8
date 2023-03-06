
unit InterfaceAutomacao_v2_1;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Os,
  Androidapi.JNI.Util;

type
// ===== Forward declarations =====

  JAnimator = interface;//android.animation.Animator
  JAnimator_AnimatorListener = interface;//android.animation.Animator$AnimatorListener
  JAnimator_AnimatorPauseListener = interface;//android.animation.Animator$AnimatorPauseListener
  JKeyframe = interface;//android.animation.Keyframe
  JLayoutTransition = interface;//android.animation.LayoutTransition
  JLayoutTransition_TransitionListener = interface;//android.animation.LayoutTransition$TransitionListener
  JPropertyValuesHolder = interface;//android.animation.PropertyValuesHolder
  JStateListAnimator = interface;//android.animation.StateListAnimator
  JTimeInterpolator = interface;//android.animation.TimeInterpolator
  JTypeConverter = interface;//android.animation.TypeConverter
  JTypeEvaluator = interface;//android.animation.TypeEvaluator
  JValueAnimator = interface;//android.animation.ValueAnimator
  JValueAnimator_AnimatorUpdateListener = interface;//android.animation.ValueAnimator$AnimatorUpdateListener
  JPathMotion = interface;//android.transition.PathMotion
  JScene = interface;//android.transition.Scene
  JTransition = interface;//android.transition.Transition
  JTransition_EpicenterCallback = interface;//android.transition.Transition$EpicenterCallback
  JTransition_TransitionListener = interface;//android.transition.Transition$TransitionListener
  JTransitionManager = interface;//android.transition.TransitionManager
  JTransitionPropagation = interface;//android.transition.TransitionPropagation
  JTransitionValues = interface;//android.transition.TransitionValues
  JInterpolator = interface;//android.view.animation.Interpolator
  JToolbar_LayoutParams = interface;//android.widget.Toolbar$LayoutParams
  JAplicacaoNaoInstaladaExcecao = interface;//br.com.setis.interfaceautomacao.AplicacaoNaoInstaladaExcecao
  Jinterfaceautomacao_BuildConfig = interface;//br.com.setis.interfaceautomacao.BuildConfig
  JCartoes = interface;//br.com.setis.interfaceautomacao.Cartoes
  JComunicacaoServico = interface;//br.com.setis.interfaceautomacao.ComunicacaoServico
  JComunicacaoServico_IncomingHandler = interface;//br.com.setis.interfaceautomacao.ComunicacaoServico$IncomingHandler
  JConfirmacao = interface;//br.com.setis.interfaceautomacao.Confirmacao
  JConfirmacoes = interface;//br.com.setis.interfaceautomacao.Confirmacoes
  JDadosAutomacao = interface;//br.com.setis.interfaceautomacao.DadosAutomacao
  JEntradaTransacao = interface;//br.com.setis.interfaceautomacao.EntradaTransacao
  JFinanciamentos = interface;//br.com.setis.interfaceautomacao.Financiamentos
  JGlobalDefs = interface;//br.com.setis.interfaceautomacao.GlobalDefs
  JIdentificacaoPortadorCarteira = interface;//br.com.setis.interfaceautomacao.IdentificacaoPortadorCarteira
  JModalidadesPagamento = interface;//br.com.setis.interfaceautomacao.ModalidadesPagamento
  JModalidadesTransacao = interface;//br.com.setis.interfaceautomacao.ModalidadesTransacao
  JOperacoes = interface;//br.com.setis.interfaceautomacao.Operacoes
  JPersonalizacao = interface;//br.com.setis.interfaceautomacao.Personalizacao
  JPersonalizacao_1 = interface;//br.com.setis.interfaceautomacao.Personalizacao$1
  JPersonalizacao_Builder = interface;//br.com.setis.interfaceautomacao.Personalizacao$Builder
  JProvedores = interface;//br.com.setis.interfaceautomacao.Provedores
  JQuedaConexaoTerminalExcecao = interface;//br.com.setis.interfaceautomacao.QuedaConexaoTerminalExcecao
  JSaidaTransacao = interface;//br.com.setis.interfaceautomacao.SaidaTransacao
  JStatusTransacao = interface;//br.com.setis.interfaceautomacao.StatusTransacao
  JTransacao = interface;//br.com.setis.interfaceautomacao.Transacao
  JTransacaoPendenteDados = interface;//br.com.setis.interfaceautomacao.TransacaoPendenteDados
  JTransacoes = interface;//br.com.setis.interfaceautomacao.Transacoes
  JTransacoes_1 = interface;//br.com.setis.interfaceautomacao.Transacoes$1
  JTransacoes_TransacaoResultReceiver = interface;//br.com.setis.interfaceautomacao.Transacoes$TransacaoResultReceiver
  JVersoes = interface;//br.com.setis.interfaceautomacao.Versoes
  JViasImpressao = interface;//br.com.setis.interfaceautomacao.ViasImpressao
  JCustomization = interface;//br.com.setis.interfaceautomacao.espec.Customization
  JPendingTransactionData = interface;//br.com.setis.interfaceautomacao.espec.PendingTransactionData
  JPosData = interface;//br.com.setis.interfaceautomacao.espec.PosData
  JTransactionConfirmation = interface;//br.com.setis.interfaceautomacao.espec.TransactionConfirmation
  JTransactionInput = interface;//br.com.setis.interfaceautomacao.espec.TransactionInput
  JTransactionOutput = interface;//br.com.setis.interfaceautomacao.espec.TransactionOutput
  JDateParser = interface;//br.com.setis.interfaceautomacao.parser.DateParser
  JEnumType = interface;//br.com.setis.interfaceautomacao.parser.EnumType
  JInputParser = interface;//br.com.setis.interfaceautomacao.parser.InputParser
  JOutputParser = interface;//br.com.setis.interfaceautomacao.parser.OutputParser
  Jparser_ParseException = interface;//br.com.setis.interfaceautomacao.parser.ParseException
  JUriArrayFieldName = interface;//br.com.setis.interfaceautomacao.parser.UriArrayFieldName
  Jparser_UriClass = interface;//br.com.setis.interfaceautomacao.parser.UriClass
  JUriCustomizeFieldName = interface;//br.com.setis.interfaceautomacao.parser.UriCustomizeFieldName
  JUriDateFieldName = interface;//br.com.setis.interfaceautomacao.parser.UriDateFieldName
  JUriEnumFieldName = interface;//br.com.setis.interfaceautomacao.parser.UriEnumFieldName
  JUriFileFieldName = interface;//br.com.setis.interfaceautomacao.parser.UriFileFieldName
  JUriMethodName = interface;//br.com.setis.interfaceautomacao.parser.UriMethodName
  JUriObjectFieldName = interface;//br.com.setis.interfaceautomacao.parser.UriObjectFieldName
  JUriPrimitiveFieldName = interface;//br.com.setis.interfaceautomacao.parser.UriPrimitiveFieldName

// ===== Interface declarations =====

  JAnimatorClass = interface(JObjectClass)
    ['{3F76A5DF-389E-4BD3-9861-04C5B00CEADE}']
    {class} function init: JAnimator; cdecl;//Deprecated
    {class} procedure addListener(listener: JAnimator_AnimatorListener); cdecl;//Deprecated
    {class} procedure addPauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;//Deprecated
    {class} function getDuration: Int64; cdecl;
    {class} function getInterpolator: JTimeInterpolator; cdecl;
    {class} function getListeners: JArrayList; cdecl;
    {class} function isStarted: Boolean; cdecl;
    {class} procedure pause; cdecl;
    {class} procedure removeAllListeners; cdecl;
    {class} procedure resume; cdecl;
    {class} function setDuration(duration: Int64): JAnimator; cdecl;
    {class} procedure setInterpolator(value: JTimeInterpolator); cdecl;
    {class} procedure setupStartValues; cdecl;
    {class} procedure start; cdecl;
  end;

  [JavaSignature('android/animation/Animator')]
  JAnimator = interface(JObject)
    ['{FA13E56D-1B6D-4A3D-8327-9E5BA785CF21}']
    procedure cancel; cdecl;
    function clone: JAnimator; cdecl;
    procedure &end; cdecl;
    function getStartDelay: Int64; cdecl;
    function isPaused: Boolean; cdecl;
    function isRunning: Boolean; cdecl;
    procedure removeListener(listener: JAnimator_AnimatorListener); cdecl;
    procedure removePauseListener(listener: JAnimator_AnimatorPauseListener); cdecl;
    procedure setStartDelay(startDelay: Int64); cdecl;
    procedure setTarget(target: JObject); cdecl;
    procedure setupEndValues; cdecl;
  end;
  TJAnimator = class(TJavaGenericImport<JAnimatorClass, JAnimator>) end;

  JAnimator_AnimatorListenerClass = interface(IJavaClass)
    ['{5ED6075A-B997-469C-B8D9-0AA8FB7E4798}']
    {class} procedure onAnimationCancel(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationEnd(animation: JAnimator); cdecl;//Deprecated
    {class} procedure onAnimationRepeat(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorListener')]
  JAnimator_AnimatorListener = interface(IJavaInstance)
    ['{E2DE8DD6-628B-4D84-AA46-8A1E3F00FF13}']
    procedure onAnimationStart(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorListener = class(TJavaGenericImport<JAnimator_AnimatorListenerClass, JAnimator_AnimatorListener>) end;

  JAnimator_AnimatorPauseListenerClass = interface(IJavaClass)
    ['{CB0DC3F0-63BC-4284-ADD0-2ED367AE11E5}']
    {class} procedure onAnimationPause(animation: JAnimator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Animator$AnimatorPauseListener')]
  JAnimator_AnimatorPauseListener = interface(IJavaInstance)
    ['{43C9C106-65EA-4A7D-A958-FAB9E43FA4A6}']
    procedure onAnimationResume(animation: JAnimator); cdecl;//Deprecated
  end;
  TJAnimator_AnimatorPauseListener = class(TJavaGenericImport<JAnimator_AnimatorPauseListenerClass, JAnimator_AnimatorPauseListener>) end;

  JKeyframeClass = interface(JObjectClass)
    ['{D383116E-5CCF-48D8-9EA1-B26FBF24BA39}']
    {class} function init: JKeyframe; cdecl;//Deprecated
    {class} function clone: JKeyframe; cdecl;
    {class} function getFraction: Single; cdecl;
    {class} function hasValue: Boolean; cdecl;
    {class} function ofFloat(fraction: Single; value: Single): JKeyframe; cdecl; overload;
    {class} function ofFloat(fraction: Single): JKeyframe; cdecl; overload;
    {class} function ofInt(fraction: Single; value: Integer): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofInt(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single; value: JObject): JKeyframe; cdecl; overload;//Deprecated
    {class} function ofObject(fraction: Single): JKeyframe; cdecl; overload;//Deprecated
    {class} procedure setFraction(fraction: Single); cdecl;//Deprecated
    {class} procedure setInterpolator(interpolator: JTimeInterpolator); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/Keyframe')]
  JKeyframe = interface(JObject)
    ['{9D0687A4-669E-440F-8290-154739405019}']
    function getInterpolator: JTimeInterpolator; cdecl;
    function getType: Jlang_Class; cdecl;
    function getValue: JObject; cdecl;
    procedure setValue(value: JObject); cdecl;//Deprecated
  end;
  TJKeyframe = class(TJavaGenericImport<JKeyframeClass, JKeyframe>) end;

  JLayoutTransitionClass = interface(JObjectClass)
    ['{433C5359-0A96-4796-AD7B-8084EF7EF7C4}']
    {class} function _GetAPPEARING: Integer; cdecl;
    {class} function _GetCHANGE_APPEARING: Integer; cdecl;
    {class} function _GetCHANGE_DISAPPEARING: Integer; cdecl;
    {class} function _GetCHANGING: Integer; cdecl;
    {class} function _GetDISAPPEARING: Integer; cdecl;
    {class} function init: JLayoutTransition; cdecl;//Deprecated
    {class} procedure disableTransitionType(transitionType: Integer); cdecl;//Deprecated
    {class} procedure enableTransitionType(transitionType: Integer); cdecl;//Deprecated
    {class} function getAnimator(transitionType: Integer): JAnimator; cdecl;//Deprecated
    {class} function getStartDelay(transitionType: Integer): Int64; cdecl;
    {class} function getTransitionListeners: JList; cdecl;
    {class} procedure hideChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
    {class} function isTransitionTypeEnabled(transitionType: Integer): Boolean; cdecl;
    {class} procedure removeChild(parent: JViewGroup; child: JView); cdecl;
    {class} procedure removeTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;
    {class} procedure setDuration(transitionType: Integer; duration: Int64); cdecl; overload;
    {class} procedure setInterpolator(transitionType: Integer; interpolator: JTimeInterpolator); cdecl;
    {class} procedure setStagger(transitionType: Integer; duration: Int64); cdecl;
    {class} procedure showChild(parent: JViewGroup; child: JView; oldVisibility: Integer); cdecl; overload;
    {class} property APPEARING: Integer read _GetAPPEARING;
    {class} property CHANGE_APPEARING: Integer read _GetCHANGE_APPEARING;
    {class} property CHANGE_DISAPPEARING: Integer read _GetCHANGE_DISAPPEARING;
    {class} property CHANGING: Integer read _GetCHANGING;
    {class} property DISAPPEARING: Integer read _GetDISAPPEARING;
  end;

  [JavaSignature('android/animation/LayoutTransition')]
  JLayoutTransition = interface(JObject)
    ['{42450BEE-EBF2-4954-B9B7-F8DAE7DF0EC1}']
    procedure addChild(parent: JViewGroup; child: JView); cdecl;//Deprecated
    procedure addTransitionListener(listener: JLayoutTransition_TransitionListener); cdecl;//Deprecated
    function getDuration(transitionType: Integer): Int64; cdecl;
    function getInterpolator(transitionType: Integer): JTimeInterpolator; cdecl;
    function getStagger(transitionType: Integer): Int64; cdecl;
    procedure hideChild(parent: JViewGroup; child: JView; newVisibility: Integer); cdecl; overload;
    function isChangingLayout: Boolean; cdecl;
    function isRunning: Boolean; cdecl;
    procedure setAnimateParentHierarchy(animateParentHierarchy: Boolean); cdecl;
    procedure setAnimator(transitionType: Integer; animator: JAnimator); cdecl;
    procedure setDuration(duration: Int64); cdecl; overload;
    procedure setStartDelay(transitionType: Integer; delay: Int64); cdecl;
    procedure showChild(parent: JViewGroup; child: JView); cdecl; overload;//Deprecated
  end;
  TJLayoutTransition = class(TJavaGenericImport<JLayoutTransitionClass, JLayoutTransition>) end;

  JLayoutTransition_TransitionListenerClass = interface(IJavaClass)
    ['{9FA6F1EC-8EDB-4A05-AF58-B55A525AE114}']
  end;

  [JavaSignature('android/animation/LayoutTransition$TransitionListener')]
  JLayoutTransition_TransitionListener = interface(IJavaInstance)
    ['{0FBE048F-FCDA-4692-B6F1-DE0F07FAE885}']
    procedure endTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
    procedure startTransition(transition: JLayoutTransition; container: JViewGroup; view: JView; transitionType: Integer); cdecl;
  end;
  TJLayoutTransition_TransitionListener = class(TJavaGenericImport<JLayoutTransition_TransitionListenerClass, JLayoutTransition_TransitionListener>) end;

  JPropertyValuesHolderClass = interface(JObjectClass)
    ['{36C77AFF-9C3F-42B6-88F3-320FE8CF9B25}']
    {class} function ofMultiFloat(propertyName: JString; values: TJavaBiArray<Single>): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiFloat(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiInt(propertyName: JString; values: TJavaBiArray<Integer>): JPropertyValuesHolder; cdecl; overload;
    {class} function ofMultiInt(propertyName: JString; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(propertyName: JString; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} function ofObject(property_: JProperty; converter: JTypeConverter; path: JPath): JPropertyValuesHolder; cdecl; overload;
    {class} procedure setConverter(converter: JTypeConverter); cdecl;
    {class} procedure setProperty(property_: JProperty); cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/PropertyValuesHolder')]
  JPropertyValuesHolder = interface(JObject)
    ['{12B4ABFD-CBCA-4636-AF2D-C386EF895DC3}']
    function clone: JPropertyValuesHolder; cdecl;
    function getPropertyName: JString; cdecl;
    procedure setEvaluator(evaluator: JTypeEvaluator); cdecl;//Deprecated
    procedure setPropertyName(propertyName: JString); cdecl;//Deprecated
    function toString: JString; cdecl;//Deprecated
  end;
  TJPropertyValuesHolder = class(TJavaGenericImport<JPropertyValuesHolderClass, JPropertyValuesHolder>) end;

  JStateListAnimatorClass = interface(JObjectClass)
    ['{109E4067-E218-47B1-93EB-65B8916A98D8}']
    {class} function init: JStateListAnimator; cdecl;//Deprecated
    {class} procedure addState(specs: TJavaArray<Integer>; animator: JAnimator); cdecl;//Deprecated
    {class} function clone: JStateListAnimator; cdecl;//Deprecated
    {class} procedure jumpToCurrentState; cdecl;//Deprecated
  end;

  [JavaSignature('android/animation/StateListAnimator')]
  JStateListAnimator = interface(JObject)
    ['{CA2A9587-26AA-4DC2-8DFF-A1305A37608F}']
  end;
  TJStateListAnimator = class(TJavaGenericImport<JStateListAnimatorClass, JStateListAnimator>) end;

  JTimeInterpolatorClass = interface(IJavaClass)
    ['{1E682A1C-9102-461D-A3CA-5596683F1D66}']
  end;

  [JavaSignature('android/animation/TimeInterpolator')]
  JTimeInterpolator = interface(IJavaInstance)
    ['{639F8A83-7D9B-49AF-A19E-96B27E46D2AB}']
    function getInterpolation(input: Single): Single; cdecl;
  end;
  TJTimeInterpolator = class(TJavaGenericImport<JTimeInterpolatorClass, JTimeInterpolator>) end;

  JTypeConverterClass = interface(JObjectClass)
    ['{BE2DD177-6D79-4B0C-B4F5-4E4CD9D7436D}']
    {class} function init(fromClass: Jlang_Class; toClass: Jlang_Class): JTypeConverter; cdecl;//Deprecated
    {class} function convert(value: JObject): JObject; cdecl;
  end;

  [JavaSignature('android/animation/TypeConverter')]
  JTypeConverter = interface(JObject)
    ['{BFEA4116-0766-4AD9-AA8F-4C15A583EB2E}']
  end;
  TJTypeConverter = class(TJavaGenericImport<JTypeConverterClass, JTypeConverter>) end;

  JTypeEvaluatorClass = interface(IJavaClass)
    ['{15B67CAF-6F50-4AA3-A88F-C5AF78D62FD4}']
  end;

  [JavaSignature('android/animation/TypeEvaluator')]
  JTypeEvaluator = interface(IJavaInstance)
    ['{F436383D-6F44-40D8-ACDD-9057777691FC}']
    function evaluate(fraction: Single; startValue: JObject; endValue: JObject): JObject; cdecl;
  end;
  TJTypeEvaluator = class(TJavaGenericImport<JTypeEvaluatorClass, JTypeEvaluator>) end;

  JValueAnimatorClass = interface(JAnimatorClass)
    ['{FF3B71ED-5A33-45B0-8500-7672B0B98E2C}']
    {class} function _GetINFINITE: Integer; cdecl;
    {class} function _GetRESTART: Integer; cdecl;
    {class} function _GetREVERSE: Integer; cdecl;
    {class} function init: JValueAnimator; cdecl;//Deprecated
    {class} function clone: JValueAnimator; cdecl;
    {class} procedure &end; cdecl;
    {class} function getCurrentPlayTime: Int64; cdecl;//Deprecated
    {class} function getDuration: Int64; cdecl;//Deprecated
    {class} function getFrameDelay: Int64; cdecl;//Deprecated
    {class} function getStartDelay: Int64; cdecl;//Deprecated
    {class} function getValues: TJavaObjectArray<JPropertyValuesHolder>; cdecl;//Deprecated
    {class} function isRunning: Boolean; cdecl;//Deprecated
    {class} procedure resume; cdecl;//Deprecated
    {class} procedure reverse; cdecl;//Deprecated
    {class} procedure setCurrentFraction(fraction: Single); cdecl;//Deprecated
    {class} procedure setFrameDelay(frameDelay: Int64); cdecl;
    {class} procedure setRepeatCount(value: Integer); cdecl;
    {class} procedure setRepeatMode(value: Integer); cdecl;
    {class} procedure setStartDelay(startDelay: Int64); cdecl;
    {class} property INFINITE: Integer read _GetINFINITE;
    {class} property RESTART: Integer read _GetRESTART;
    {class} property REVERSE: Integer read _GetREVERSE;
  end;

  [JavaSignature('android/animation/ValueAnimator')]
  JValueAnimator = interface(JAnimator)
    ['{70F92B14-EFD4-4DC7-91DE-6617417AE194}']
    procedure addUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;
    procedure cancel; cdecl;
    function getAnimatedFraction: Single; cdecl;//Deprecated
    function getAnimatedValue: JObject; cdecl; overload;//Deprecated
    function getAnimatedValue(propertyName: JString): JObject; cdecl; overload;//Deprecated
    function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    function getRepeatCount: Integer; cdecl;//Deprecated
    function getRepeatMode: Integer; cdecl;//Deprecated
    function isStarted: Boolean; cdecl;//Deprecated
    procedure pause; cdecl;//Deprecated
    procedure removeAllUpdateListeners; cdecl;//Deprecated
    procedure removeUpdateListener(listener: JValueAnimator_AnimatorUpdateListener); cdecl;//Deprecated
    procedure setCurrentPlayTime(playTime: Int64); cdecl;
    function setDuration(duration: Int64): JValueAnimator; cdecl;
    procedure setEvaluator(value: JTypeEvaluator); cdecl;
    procedure setInterpolator(value: JTimeInterpolator); cdecl;
    procedure start; cdecl;
    function toString: JString; cdecl;
  end;
  TJValueAnimator = class(TJavaGenericImport<JValueAnimatorClass, JValueAnimator>) end;

  JValueAnimator_AnimatorUpdateListenerClass = interface(IJavaClass)
    ['{9CA50CBF-4462-4445-82CD-13CE985E2DE4}']
  end;

  [JavaSignature('android/animation/ValueAnimator$AnimatorUpdateListener')]
  JValueAnimator_AnimatorUpdateListener = interface(IJavaInstance)
    ['{0F883491-52EF-4A40-B7D2-FC23E11E46FE}']
    procedure onAnimationUpdate(animation: JValueAnimator); cdecl;//Deprecated
  end;
  TJValueAnimator_AnimatorUpdateListener = class(TJavaGenericImport<JValueAnimator_AnimatorUpdateListenerClass, JValueAnimator_AnimatorUpdateListener>) end;

  JPathMotionClass = interface(JObjectClass)
    ['{E1CD1A94-115C-492C-A490-37F0E72956EB}']
    {class} function init: JPathMotion; cdecl; overload;//Deprecated
    {class} function init(context: JContext; attrs: JAttributeSet): JPathMotion; cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/transition/PathMotion')]
  JPathMotion = interface(JObject)
    ['{BDC08353-C9FB-42D7-97CC-C35837D2F536}']
    function getPath(startX: Single; startY: Single; endX: Single; endY: Single): JPath; cdecl;//Deprecated
  end;
  TJPathMotion = class(TJavaGenericImport<JPathMotionClass, JPathMotion>) end;

  JSceneClass = interface(JObjectClass)
    ['{8B9120CA-AEEA-4DE3-BDC9-15CFD23A7B07}']
    {class} function init(sceneRoot: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} function init(sceneRoot: JViewGroup; layout: JView): JScene; cdecl; overload;//Deprecated
    {class} function init(sceneRoot: JViewGroup; layout: JViewGroup): JScene; cdecl; overload;//Deprecated
    {class} procedure exit; cdecl;
    {class} function getSceneForLayout(sceneRoot: JViewGroup; layoutId: Integer; context: JContext): JScene; cdecl;
    {class} function getSceneRoot: JViewGroup; cdecl;
  end;

  [JavaSignature('android/transition/Scene')]
  JScene = interface(JObject)
    ['{85A60B99-5837-4F1F-A344-C627DD586B82}']
    procedure enter; cdecl;
    procedure setEnterAction(action: JRunnable); cdecl;
    procedure setExitAction(action: JRunnable); cdecl;
  end;
  TJScene = class(TJavaGenericImport<JSceneClass, JScene>) end;

  JTransitionClass = interface(JObjectClass)
    ['{60EC06BC-8F7A-4416-A04B-5B57987EB18E}']
    {class} function _GetMATCH_ID: Integer; cdecl;
    {class} function _GetMATCH_INSTANCE: Integer; cdecl;
    {class} function _GetMATCH_ITEM_ID: Integer; cdecl;
    {class} function _GetMATCH_NAME: Integer; cdecl;
    {class} function init: JTransition; cdecl; overload;//Deprecated
    {class} function init(context: JContext; attrs: JAttributeSet): JTransition; cdecl; overload;//Deprecated
    {class} function addListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    {class} function addTarget(targetId: Integer): JTransition; cdecl; overload;
    {class} function canRemoveViews: Boolean; cdecl;//Deprecated
    {class} procedure captureEndValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    {class} procedure captureStartValues(transitionValues: JTransitionValues); cdecl;//Deprecated
    {class} function excludeChildren(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeChildren(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function excludeTarget(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    {class} function getDuration: Int64; cdecl;//Deprecated
    {class} function getEpicenter: JRect; cdecl;//Deprecated
    {class} function getEpicenterCallback: JTransition_EpicenterCallback; cdecl;//Deprecated
    {class} function getPropagation: JTransitionPropagation; cdecl;//Deprecated
    {class} function getStartDelay: Int64; cdecl;//Deprecated
    {class} function getTargetIds: JList; cdecl;//Deprecated
    {class} function getTargets: JList; cdecl;
    {class} function getTransitionProperties: TJavaObjectArray<JString>; cdecl;
    {class} function getTransitionValues(view: JView; start: Boolean): JTransitionValues; cdecl;
    {class} function removeTarget(targetName: JString): JTransition; cdecl; overload;
    {class} function removeTarget(target: JView): JTransition; cdecl; overload;
    {class} function removeTarget(target: Jlang_Class): JTransition; cdecl; overload;
    {class} procedure setPathMotion(pathMotion: JPathMotion); cdecl;
    {class} procedure setPropagation(transitionPropagation: JTransitionPropagation); cdecl;
    {class} property MATCH_ID: Integer read _GetMATCH_ID;
    {class} property MATCH_INSTANCE: Integer read _GetMATCH_INSTANCE;
    {class} property MATCH_ITEM_ID: Integer read _GetMATCH_ITEM_ID;
    {class} property MATCH_NAME: Integer read _GetMATCH_NAME;
  end;

  [JavaSignature('android/transition/Transition')]
  JTransition = interface(JObject)
    ['{C2F8200F-1C83-40AE-8C5B-C0C8BFF17F88}']
    function addTarget(targetName: JString): JTransition; cdecl; overload;//Deprecated
    function addTarget(targetType: Jlang_Class): JTransition; cdecl; overload;//Deprecated
    function addTarget(target: JView): JTransition; cdecl; overload;//Deprecated
    function clone: JTransition; cdecl;//Deprecated
    function createAnimator(sceneRoot: JViewGroup; startValues: JTransitionValues; endValues: JTransitionValues): JAnimator; cdecl;//Deprecated
    function excludeChildren(targetId: Integer; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeTarget(targetName: JString; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeTarget(target: JView; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function excludeTarget(type_: Jlang_Class; exclude: Boolean): JTransition; cdecl; overload;//Deprecated
    function getInterpolator: JTimeInterpolator; cdecl;//Deprecated
    function getName: JString; cdecl;//Deprecated
    function getPathMotion: JPathMotion; cdecl;//Deprecated
    function getTargetNames: JList; cdecl;
    function getTargetTypes: JList; cdecl;
    function isTransitionRequired(startValues: JTransitionValues; endValues: JTransitionValues): Boolean; cdecl;
    function removeListener(listener: JTransition_TransitionListener): JTransition; cdecl;
    function removeTarget(targetId: Integer): JTransition; cdecl; overload;
    function setDuration(duration: Int64): JTransition; cdecl;
    procedure setEpicenterCallback(epicenterCallback: JTransition_EpicenterCallback); cdecl;
    function setInterpolator(interpolator: JTimeInterpolator): JTransition; cdecl;
    function setStartDelay(startDelay: Int64): JTransition; cdecl;
    function toString: JString; cdecl;
  end;
  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransition_EpicenterCallbackClass = interface(JObjectClass)
    ['{8141257A-130B-466C-A08D-AA3A00946F4C}']
    {class} function init: JTransition_EpicenterCallback; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Transition$EpicenterCallback')]
  JTransition_EpicenterCallback = interface(JObject)
    ['{CE004917-266F-4076-8913-F23184824FBA}']
    function onGetEpicenter(transition: JTransition): JRect; cdecl;//Deprecated
  end;
  TJTransition_EpicenterCallback = class(TJavaGenericImport<JTransition_EpicenterCallbackClass, JTransition_EpicenterCallback>) end;

  JTransition_TransitionListenerClass = interface(IJavaClass)
    ['{D5083752-E8A6-46DF-BE40-AE11073C387E}']
    {class} procedure onTransitionCancel(transition: JTransition); cdecl;//Deprecated
    {class} procedure onTransitionEnd(transition: JTransition); cdecl;//Deprecated
    {class} procedure onTransitionPause(transition: JTransition); cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/Transition$TransitionListener')]
  JTransition_TransitionListener = interface(IJavaInstance)
    ['{C32BE107-6E05-4898-AF0A-FAD970D66E29}']
    procedure onTransitionResume(transition: JTransition); cdecl;//Deprecated
    procedure onTransitionStart(transition: JTransition); cdecl;//Deprecated
  end;
  TJTransition_TransitionListener = class(TJavaGenericImport<JTransition_TransitionListenerClass, JTransition_TransitionListener>) end;

  JTransitionManagerClass = interface(JObjectClass)
    ['{4160EFA0-3499-4964-817E-46497BB5B957}']
    {class} function init: JTransitionManager; cdecl;//Deprecated
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup); cdecl; overload;
    {class} procedure beginDelayedTransition(sceneRoot: JViewGroup; transition: JTransition); cdecl; overload;
    {class} procedure endTransitions(sceneRoot: JViewGroup); cdecl;
    {class} procedure go(scene: JScene); cdecl; overload;
    {class} procedure go(scene: JScene; transition: JTransition); cdecl; overload;
    {class} procedure setTransition(scene: JScene; transition: JTransition); cdecl; overload;
    {class} procedure setTransition(fromScene: JScene; toScene: JScene; transition: JTransition); cdecl; overload;
    {class} procedure transitionTo(scene: JScene); cdecl;
  end;

  [JavaSignature('android/transition/TransitionManager')]
  JTransitionManager = interface(JObject)
    ['{FF5E1210-1F04-4F81-9CAC-3D7A5C4E972B}']
  end;
  TJTransitionManager = class(TJavaGenericImport<JTransitionManagerClass, JTransitionManager>) end;

  JTransitionPropagationClass = interface(JObjectClass)
    ['{A881388A-C877-4DD9-9BAD-1BA4F56133EE}']
    {class} function init: JTransitionPropagation; cdecl;//Deprecated
    {class} function getPropagationProperties: TJavaObjectArray<JString>; cdecl;//Deprecated
    {class} function getStartDelay(sceneRoot: JViewGroup; transition: JTransition; startValues: JTransitionValues; endValues: JTransitionValues): Int64; cdecl;//Deprecated
  end;

  [JavaSignature('android/transition/TransitionPropagation')]
  JTransitionPropagation = interface(JObject)
    ['{7595B7EF-6BCE-4281-BC67-335E2FB6C091}']
    procedure captureValues(transitionValues: JTransitionValues); cdecl;//Deprecated
  end;
  TJTransitionPropagation = class(TJavaGenericImport<JTransitionPropagationClass, JTransitionPropagation>) end;

  JTransitionValuesClass = interface(JObjectClass)
    ['{3BF98CFA-6A4D-4815-8D42-15E97C916D91}']
    {class} function _Getvalues: JMap; cdecl;
    {class} function _Getview: JView; cdecl;
    {class} function init: JTransitionValues; cdecl;//Deprecated
    {class} function toString: JString; cdecl;//Deprecated
    {class} property values: JMap read _Getvalues;
    {class} property view: JView read _Getview;
  end;

  [JavaSignature('android/transition/TransitionValues')]
  JTransitionValues = interface(JObject)
    ['{178E09E6-D32C-48A9-ADCF-8CCEA804052A}']
    function equals(other: JObject): Boolean; cdecl;//Deprecated
    function hashCode: Integer; cdecl;//Deprecated
  end;
  TJTransitionValues = class(TJavaGenericImport<JTransitionValuesClass, JTransitionValues>) end;

  JInterpolatorClass = interface(JTimeInterpolatorClass)
    ['{A575B46A-E489-409C-807A-1B8F2BE092E8}']
  end;

  [JavaSignature('android/view/animation/Interpolator')]
  JInterpolator = interface(JTimeInterpolator)
    ['{F1082403-52DA-4AF0-B017-DAB334325FC7}']
  end;
  TJInterpolator = class(TJavaGenericImport<JInterpolatorClass, JInterpolator>) end;

  JToolbar_LayoutParamsClass = interface(JActionBar_LayoutParamsClass)
    ['{6D43796C-C163-4084-BB30-6FE68AFD7ABB}']
    {class} function init(c: JContext; attrs: JAttributeSet): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(width: Integer; height: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(width: Integer; height: Integer; gravity: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(gravity: Integer): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JToolbar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JActionBar_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JViewGroup_MarginLayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
    {class} function init(source: JViewGroup_LayoutParams): JToolbar_LayoutParams; cdecl; overload;//Deprecated
  end;

  [JavaSignature('android/widget/Toolbar$LayoutParams')]
  JToolbar_LayoutParams = interface(JActionBar_LayoutParams)
    ['{BCD101F9-B7B7-4B2F-9460-056B3EA7B9F0}']
  end;
  TJToolbar_LayoutParams = class(TJavaGenericImport<JToolbar_LayoutParamsClass, JToolbar_LayoutParams>) end;

  JAplicacaoNaoInstaladaExcecaoClass = interface(JExceptionClass)
    ['{6FF3BEDE-CDD8-445E-B8DD-7381BCFD0547}']
    {class} function init: JAplicacaoNaoInstaladaExcecao; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/AplicacaoNaoInstaladaExcecao')]
  JAplicacaoNaoInstaladaExcecao = interface(JException)
    ['{843F8E4A-0280-485C-89BF-3B7922BBFFA4}']
  end;
  TJAplicacaoNaoInstaladaExcecao = class(TJavaGenericImport<JAplicacaoNaoInstaladaExcecaoClass, JAplicacaoNaoInstaladaExcecao>) end;

  Jinterfaceautomacao_BuildConfigClass = interface(JObjectClass)
    ['{CCB9BE68-55E8-4C92-BDAA-A452E78C6C9F}']
    {class} function _GetBUILD_TYPE: JString; cdecl;
    {class} function _GetDEBUG: Boolean; cdecl;
    {class} function _GetLIBRARY_PACKAGE_NAME: JString; cdecl;
    {class} function init: Jinterfaceautomacao_BuildConfig; cdecl;//Deprecated
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property LIBRARY_PACKAGE_NAME: JString read _GetLIBRARY_PACKAGE_NAME;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/BuildConfig')]
  Jinterfaceautomacao_BuildConfig = interface(JObject)
    ['{F2F0819B-3BB6-4DE5-B37F-9C3559B9EBDF}']
  end;
  TJinterfaceautomacao_BuildConfig = class(TJavaGenericImport<Jinterfaceautomacao_BuildConfigClass, Jinterfaceautomacao_BuildConfig>) end;

  JCartoesClass = interface(JEnumClass)
    ['{4951C65D-153D-43FC-B38E-232B10C70857}']
    {class} function _GetCARTAO_CREDITO: JCartoes; cdecl;
    {class} function _GetCARTAO_DEBITO: JCartoes; cdecl;
    {class} function _GetCARTAO_DESCONHECIDO: JCartoes; cdecl;
    {class} function _GetCARTAO_FROTA: JCartoes; cdecl;
    {class} function _GetCARTAO_PRIVATELABEL: JCartoes; cdecl;
    {class} function _GetCARTAO_VOUCHER: JCartoes; cdecl;
    {class} function obtemCartao(i: Integer): JCartoes; cdecl;
    {class} function valueOf(string_: JString): JCartoes; cdecl;
    {class} function values: TJavaObjectArray<JCartoes>; cdecl;//Deprecated
    {class} property CARTAO_CREDITO: JCartoes read _GetCARTAO_CREDITO;
    {class} property CARTAO_DEBITO: JCartoes read _GetCARTAO_DEBITO;
    {class} property CARTAO_DESCONHECIDO: JCartoes read _GetCARTAO_DESCONHECIDO;
    {class} property CARTAO_FROTA: JCartoes read _GetCARTAO_FROTA;
    {class} property CARTAO_PRIVATELABEL: JCartoes read _GetCARTAO_PRIVATELABEL;
    {class} property CARTAO_VOUCHER: JCartoes read _GetCARTAO_VOUCHER;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Cartoes')]
  JCartoes = interface(JEnum)
    ['{C91BF4F0-5BCB-4CB5-BFB1-2F08FC6D08F5}']
    function obtemTipoCartao: Integer; cdecl;
  end;
  TJCartoes = class(TJavaGenericImport<JCartoesClass, JCartoes>) end;

  JComunicacaoServicoClass = interface(JIntentServiceClass)
    ['{962BD32B-1C33-4655-AD13-2BEA59475FDC}']
    {class} function init: JComunicacaoServico; cdecl;
    {class} procedure setfTransInic(b: Boolean); cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/ComunicacaoServico')]
  JComunicacaoServico = interface(JIntentService)
    ['{0C5CE56A-3507-4C8F-80C6-119D887FC763}']
    function _GetmMessenger: JMessenger; cdecl;
    function onBind(intent: JIntent): JIBinder; cdecl;
    function onStartCommand(intent: JIntent; i: Integer; i1: Integer): Integer; cdecl;
    function onUnbind(intent: JIntent): Boolean; cdecl;
    procedure retornoCliente(i: Integer; string_: JString; string_1: JString); cdecl;
    property mMessenger: JMessenger read _GetmMessenger;
  end;
  TJComunicacaoServico = class(TJavaGenericImport<JComunicacaoServicoClass, JComunicacaoServico>) end;

  JComunicacaoServico_IncomingHandlerClass = interface(JHandlerClass)
    ['{5D28C315-CE56-4D7B-93BE-98EB53E3CD5D}']
    {class} function init(comunicacaoServico: JComunicacaoServico; comunicacaoServico1: JComunicacaoServico): JComunicacaoServico_IncomingHandler; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/ComunicacaoServico$IncomingHandler')]
  JComunicacaoServico_IncomingHandler = interface(JHandler)
    ['{BD759B62-9DA9-4C9F-A53A-EE58A649B959}']
    procedure handleMessage(message: JMessage); cdecl;
  end;
  TJComunicacaoServico_IncomingHandler = class(TJavaGenericImport<JComunicacaoServico_IncomingHandlerClass, JComunicacaoServico_IncomingHandler>) end;

  JConfirmacaoClass = interface(JSerializableClass)
    ['{6625A197-2970-4659-A968-1A0480A87350}']
    {class} function init: JConfirmacao; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Confirmacao')]
  JConfirmacao = interface(JSerializable)
    ['{5B99094D-52B9-4B7E-911C-14EAE8EF7B96}']
    function informaStatusTransacao(statusTransacao: JStatusTransacao): JConfirmacao; cdecl;
    function obtemStatusTransacao: JStatusTransacao; cdecl;
  end;
  TJConfirmacao = class(TJavaGenericImport<JConfirmacaoClass, JConfirmacao>) end;

  JConfirmacoesClass = interface(JConfirmacaoClass)
    ['{01093527-02C4-48AC-BF8F-185E805DFBAC}']
    {class} function init: JConfirmacoes; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Confirmacoes')]
  JConfirmacoes = interface(JConfirmacao)
    ['{7DF6B59A-0146-4C20-9A7F-0929E6E4A948}']
    function informaIdentificadorConfirmacaoTransacao(string_: JString): JConfirmacoes; cdecl;
    function obtemIdentificadorTransacao: JString; cdecl;
  end;
  TJConfirmacoes = class(TJavaGenericImport<JConfirmacoesClass, JConfirmacoes>) end;

  JDadosAutomacaoClass = interface(JSerializableClass)
    ['{6E1E9A4D-A3D7-4F5F-8FC2-6D2CD32D55B8}']
    {class} function init(string_: JString; string_1: JString; string_2: JString; b: Boolean; b1: Boolean; b2: Boolean; b3: Boolean): JDadosAutomacao; cdecl; overload;
    {class} function init(string_: JString; string_1: JString; string_2: JString; b: Boolean; b1: Boolean; b2: Boolean; b3: Boolean; personalizacao: JPersonalizacao): JDadosAutomacao; cdecl; overload;
    {class} function init(string_: JString; string_1: JString; string_2: JString; b: Boolean; b1: Boolean; b2: Boolean; b3: Boolean; b4: Boolean; personalizacao: JPersonalizacao): JDadosAutomacao; cdecl; overload;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/DadosAutomacao')]
  JDadosAutomacao = interface(JSerializable)
    ['{662D0B4A-C755-4240-8627-665691B9EF23}']
    function obtemEmpresaAutomacao: JString; cdecl;
    function obtemNomeAutomacao: JString; cdecl;
    function obtemPersonalizacaoCliente: JPersonalizacao; cdecl;
    function obtemVersaoAutomacao: JString; cdecl;
    function suportaAbatimentoSaldoVoucher: Boolean; cdecl;
    function suportaDesconto: Boolean; cdecl;
    function suportaTroco: Boolean; cdecl;
    function suportaViaReduzida: Boolean; cdecl;
    function suportaViasDiferneciadas: Boolean; cdecl;
  end;
  TJDadosAutomacao = class(TJavaGenericImport<JDadosAutomacaoClass, JDadosAutomacao>) end;

  JEntradaTransacaoClass = interface(JSerializableClass)
    ['{2130C531-5F88-47D7-A07B-A0A14FC4D661}']
    {class} function init(operacoes: JOperacoes; string_: JString): JEntradaTransacao; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/EntradaTransacao')]
  JEntradaTransacao = interface(JSerializable)
    ['{2572732F-EBBD-43EF-9D06-194929DDB48A}']
    function informaCodigoAutorizacaoOriginal(string_: JString): JEntradaTransacao; cdecl;
    function informaCodigoMoeda(string_: JString): JEntradaTransacao; cdecl;
    function informaDadosAdicionaisAutomacao1(string_: JString): JEntradaTransacao; cdecl;
    function informaDadosAdicionaisAutomacao2(string_: JString): JEntradaTransacao; cdecl;
    function informaDadosAdicionaisAutomacao3(string_: JString): JEntradaTransacao; cdecl;
    function informaDadosAdicionaisAutomacao4(string_: JString): JEntradaTransacao; cdecl;
    function informaDataHoraTransacaoOriginal(date: JDate): JEntradaTransacao; cdecl;
    function informaDataPredatado(date: JDate): JEntradaTransacao; cdecl;
    function informaDocumentoFiscal(string_: JString): JEntradaTransacao; cdecl;
    function informaEstabelecimentoCNPJouCPF(string_: JString): JEntradaTransacao; cdecl;
    procedure informaIdentificadorPontoCaptura(string_: JString); cdecl;
    function informaModalidadePagamento(modalidadesPagamento: JModalidadesPagamento): JEntradaTransacao; cdecl;
    function informaNomeProvedor(string_: JString): JEntradaTransacao; cdecl;
    function informaNsuTransacaoOriginal(string_: JString): JEntradaTransacao; cdecl;
    function informaNumeroFatura(string_: JString): JEntradaTransacao; cdecl;
    function informaNumeroParcelas(i: Integer): JEntradaTransacao; cdecl;
    function informaNumeroTelefone(string_: JString): JEntradaTransacao; cdecl;
    function informaProvedor(provedores: JProvedores): JEntradaTransacao; cdecl;
    function informaTaxaEmbarque(string_: JString): JEntradaTransacao; cdecl;
    function informaTaxaServico(string_: JString): JEntradaTransacao; cdecl;
    function informaTipoCartao(cartoes: JCartoes): JEntradaTransacao; cdecl;
    function informaTipoFinanciamento(financiamentos: JFinanciamentos): JEntradaTransacao; cdecl;
    function informaValorTotal(string_: JString): JEntradaTransacao; cdecl;
    function obtemCodigoAutorizacaoOriginal: JString; cdecl;
    function obtemCodigoMoeda: JString; cdecl;
    function obtemDadosAdicionaisAutomacao1: JString; cdecl;
    function obtemDadosAdicionaisAutomacao2: JString; cdecl;
    function obtemDadosAdicionaisAutomacao3: JString; cdecl;
    function obtemDadosAdicionaisAutomacao4: JString; cdecl;
    function obtemDataHoraTransacaoOriginal: JDate; cdecl;
    function obtemDataPredatado: JDate; cdecl;
    function obtemDocumentoFiscal: JString; cdecl;
    function obtemEstabelecimentoCNPJouCPF: JString; cdecl;
    function obtemIdTransacaoAutomacao: JString; cdecl;
    function obtemIdentificadorPontoCaptura: JString; cdecl;
    function obtemModalidadePagamento: JModalidadesPagamento; cdecl;
    function obtemNomeProvedor: JString; cdecl;
    function obtemNsuTransacaoOriginal: JString; cdecl;
    function obtemNumeroFatura: JString; cdecl;
    function obtemNumeroParcelas: Integer; cdecl;
    function obtemNumeroTelefone: JString; cdecl;
    function obtemOperacao: JOperacoes; cdecl;
    function obtemProvedor: JProvedores; cdecl;
    function obtemTaxaEmbarque: JString; cdecl;
    function obtemTaxaServico: JString; cdecl;
    function obtemTipoCartao: JCartoes; cdecl;
    function obtemTipoFinanciamento: JFinanciamentos; cdecl;
    function obtemValorTotal: JString; cdecl;
  end;
  TJEntradaTransacao = class(TJavaGenericImport<JEntradaTransacaoClass, JEntradaTransacao>) end;

  JFinanciamentosClass = interface(JEnumClass)
    ['{6F2F372B-0215-41BE-BB32-31960E6F5F49}']
    {class} function _GetA_VISTA: JFinanciamentos; cdecl;
    {class} function _GetCREDITO_EMISSOR: JFinanciamentos; cdecl;
    {class} function _GetFINANCIAMENTO_NAO_DEFINIDO: JFinanciamentos; cdecl;
    {class} function _GetPARCELADO_EMISSOR: JFinanciamentos; cdecl;
    {class} function _GetPARCELADO_ESTABELECIMENTO: JFinanciamentos; cdecl;
    {class} function _GetPRE_DATADO: JFinanciamentos; cdecl;
    {class} function obtemFinanciamento(i: Integer): JFinanciamentos; cdecl;
    {class} function valueOf(string_: JString): JFinanciamentos; cdecl;
    {class} function values: TJavaObjectArray<JFinanciamentos>; cdecl;//Deprecated
    {class} property A_VISTA: JFinanciamentos read _GetA_VISTA;
    {class} property CREDITO_EMISSOR: JFinanciamentos read _GetCREDITO_EMISSOR;
    {class} property FINANCIAMENTO_NAO_DEFINIDO: JFinanciamentos read _GetFINANCIAMENTO_NAO_DEFINIDO;
    {class} property PARCELADO_EMISSOR: JFinanciamentos read _GetPARCELADO_EMISSOR;
    {class} property PARCELADO_ESTABELECIMENTO: JFinanciamentos read _GetPARCELADO_ESTABELECIMENTO;
    {class} property PRE_DATADO: JFinanciamentos read _GetPRE_DATADO;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Financiamentos')]
  JFinanciamentos = interface(JEnum)
    ['{7A2A5412-61A7-4C2D-A8FF-2B0428AFDC7A}']
    function obtemCodigoFinanciamento: Integer; cdecl;
  end;
  TJFinanciamentos = class(TJavaGenericImport<JFinanciamentosClass, JFinanciamentos>) end;

  JGlobalDefsClass = interface(IJavaClass)
    ['{FDAACF7B-92F8-47A6-A85B-FCB14FA549B8}']
    {class} function _GetAPP_URI: JString; cdecl;
    {class} function _GetCLIENTE_NAO_INSTALADO: Integer; cdecl;
    {class} function _GetCONFIRMACAO_EXTRA: JString; cdecl;
    {class} function _GetCONFIRM_URI: JString; cdecl;
    {class} function _GetDADOS_EXTRA: JString; cdecl;
    {class} function _GetENTRADA_EXTRA: JString; cdecl;
    {class} function _GetPAYMENT_URI: JString; cdecl;
    {class} function _GetPENDENCIA_EXTRA: JString; cdecl;
    {class} function _GetPERSONALIZACAO: JString; cdecl;
    {class} function _GetRESOLVE_URI: JString; cdecl;
    {class} property APP_URI: JString read _GetAPP_URI;
    {class} property CLIENTE_NAO_INSTALADO: Integer read _GetCLIENTE_NAO_INSTALADO;
    {class} property CONFIRMACAO_EXTRA: JString read _GetCONFIRMACAO_EXTRA;
    {class} property CONFIRM_URI: JString read _GetCONFIRM_URI;
    {class} property DADOS_EXTRA: JString read _GetDADOS_EXTRA;
    {class} property ENTRADA_EXTRA: JString read _GetENTRADA_EXTRA;
    {class} property PAYMENT_URI: JString read _GetPAYMENT_URI;
    {class} property PENDENCIA_EXTRA: JString read _GetPENDENCIA_EXTRA;
    {class} property PERSONALIZACAO: JString read _GetPERSONALIZACAO;
    {class} property RESOLVE_URI: JString read _GetRESOLVE_URI;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/GlobalDefs')]
  JGlobalDefs = interface(IJavaInstance)
    ['{64DFBBED-0161-4AB2-8DDD-B2BA58EC41EA}']
  end;
  TJGlobalDefs = class(TJavaGenericImport<JGlobalDefsClass, JGlobalDefs>) end;

  JIdentificacaoPortadorCarteiraClass = interface(JEnumClass)
    ['{9C09B6F7-865E-476A-9329-BDA54458A554}']
    {class} function _GetCPF: JIdentificacaoPortadorCarteira; cdecl;
    {class} function _GetOUTROS: JIdentificacaoPortadorCarteira; cdecl;
    {class} function _GetQRCODE: JIdentificacaoPortadorCarteira; cdecl;
    {class} function obtemIdentificador(i: Integer): JIdentificacaoPortadorCarteira; cdecl; overload;
    {class} function valueOf(string_: JString): JIdentificacaoPortadorCarteira; cdecl;
    {class} function values: TJavaObjectArray<JIdentificacaoPortadorCarteira>; cdecl;//Deprecated
    {class} property CPF: JIdentificacaoPortadorCarteira read _GetCPF;
    {class} property OUTROS: JIdentificacaoPortadorCarteira read _GetOUTROS;
    {class} property QRCODE: JIdentificacaoPortadorCarteira read _GetQRCODE;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/IdentificacaoPortadorCarteira')]
  JIdentificacaoPortadorCarteira = interface(JEnum)
    ['{975F0B19-AB01-46AE-A122-1D8C4872FB40}']
    function obtemIdentificador: Integer; cdecl; overload;
  end;
  TJIdentificacaoPortadorCarteira = class(TJavaGenericImport<JIdentificacaoPortadorCarteiraClass, JIdentificacaoPortadorCarteira>) end;

  JModalidadesPagamentoClass = interface(JEnumClass)
    ['{9FD07003-42AC-4752-818E-B1D5F5718910}']
    {class} function _GetPAGAMENTO_CARTAO: JModalidadesPagamento; cdecl;
    {class} function _GetPAGAMENTO_CARTEIRA_VIRTUAL: JModalidadesPagamento; cdecl;
    {class} function _GetPAGAMENTO_CHEQUE: JModalidadesPagamento; cdecl;
    {class} function _GetPAGAMENTO_DINHEIRO: JModalidadesPagamento; cdecl;
    {class} function valueOf(string_: JString): JModalidadesPagamento; cdecl;
    {class} function values: TJavaObjectArray<JModalidadesPagamento>; cdecl;//Deprecated
    {class} property PAGAMENTO_CARTAO: JModalidadesPagamento read _GetPAGAMENTO_CARTAO;
    {class} property PAGAMENTO_CARTEIRA_VIRTUAL: JModalidadesPagamento read _GetPAGAMENTO_CARTEIRA_VIRTUAL;
    {class} property PAGAMENTO_CHEQUE: JModalidadesPagamento read _GetPAGAMENTO_CHEQUE;
    {class} property PAGAMENTO_DINHEIRO: JModalidadesPagamento read _GetPAGAMENTO_DINHEIRO;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/ModalidadesPagamento')]
  JModalidadesPagamento = interface(JEnum)
    ['{5FEDF6D7-D669-4CB3-9AE2-5D55E3F3108E}']
  end;
  TJModalidadesPagamento = class(TJavaGenericImport<JModalidadesPagamentoClass, JModalidadesPagamento>) end;

  JModalidadesTransacaoClass = interface(JEnumClass)
    ['{D86C61D5-F797-436C-8E51-3CA62EE9C3C1}']
    {class} function _GetOFF: JModalidadesTransacao; cdecl;
    {class} function _GetON: JModalidadesTransacao; cdecl;
    {class} function valueOf(string_: JString): JModalidadesTransacao; cdecl;
    {class} function values: TJavaObjectArray<JModalidadesTransacao>; cdecl;//Deprecated
    {class} property OFF: JModalidadesTransacao read _GetOFF;
    {class} property ON: JModalidadesTransacao read _GetON;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/ModalidadesTransacao')]
  JModalidadesTransacao = interface(JEnum)
    ['{1B74AAEF-5CE2-4905-8D87-45314650B581}']
  end;
  TJModalidadesTransacao = class(TJavaGenericImport<JModalidadesTransacaoClass, JModalidadesTransacao>) end;

  JOperacoesClass = interface(JEnumClass)
    ['{A7A0625F-0753-4347-91AF-78B5487628EA}']
    {class} function _GetADMINISTRATIVA: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO_PAGAMENTOCONTA: JOperacoes; cdecl;
    {class} function _GetCANCELAMENTO_PREAUTORIZACAO: JOperacoes; cdecl;
    {class} function _GetCONFIGURACAO: JOperacoes; cdecl;
    {class} function _GetCONSULTA_CHEQUE: JOperacoes; cdecl;
    {class} function _GetCONSULTA_SALDO: JOperacoes; cdecl;
    {class} function _GetDOACAO: JOperacoes; cdecl;
    {class} function _GetEXIBE_PDC: JOperacoes; cdecl;
    {class} function _GetFECHAMENTO: JOperacoes; cdecl;
    {class} function _GetGARANTIA_CHEQUE: JOperacoes; cdecl;
    {class} function _GetINSTALACAO: JOperacoes; cdecl;
    {class} function _GetMANUTENCAO: JOperacoes; cdecl;
    {class} function _GetOPERACAO_DESCONHECIDA: JOperacoes; cdecl;
    {class} function _GetPAGAMENTO_CONTA: JOperacoes; cdecl;
    {class} function _GetPREAUTORIZACAO: JOperacoes; cdecl;
    {class} function _GetRECARGA_CELULAR: JOperacoes; cdecl;
    {class} function _GetREIMPRESSAO: JOperacoes; cdecl;
    {class} function _GetRELATORIO_DETALHADO: JOperacoes; cdecl;
    {class} function _GetRELATORIO_RESUMIDO: JOperacoes; cdecl;
    {class} function _GetRELATORIO_SINTETICO: JOperacoes; cdecl;
    {class} function _GetSAQUE: JOperacoes; cdecl;
    {class} function _GetTESTE_COMUNICACAO: JOperacoes; cdecl;
    {class} function _GetVENDA: JOperacoes; cdecl;
    {class} function _GetVERSAO: JOperacoes; cdecl;
    {class} function obtemOperacao(i: Integer): JOperacoes; cdecl;
    {class} function valueOf(string_: JString): JOperacoes; cdecl;
    {class} function values: TJavaObjectArray<JOperacoes>; cdecl;//Deprecated
    {class} property ADMINISTRATIVA: JOperacoes read _GetADMINISTRATIVA;
    {class} property CANCELAMENTO: JOperacoes read _GetCANCELAMENTO;
    {class} property CANCELAMENTO_PAGAMENTOCONTA: JOperacoes read _GetCANCELAMENTO_PAGAMENTOCONTA;
    {class} property CANCELAMENTO_PREAUTORIZACAO: JOperacoes read _GetCANCELAMENTO_PREAUTORIZACAO;
    {class} property CONFIGURACAO: JOperacoes read _GetCONFIGURACAO;
    {class} property CONSULTA_CHEQUE: JOperacoes read _GetCONSULTA_CHEQUE;
    {class} property CONSULTA_SALDO: JOperacoes read _GetCONSULTA_SALDO;
    {class} property DOACAO: JOperacoes read _GetDOACAO;
    {class} property EXIBE_PDC: JOperacoes read _GetEXIBE_PDC;
    {class} property FECHAMENTO: JOperacoes read _GetFECHAMENTO;
    {class} property GARANTIA_CHEQUE: JOperacoes read _GetGARANTIA_CHEQUE;
    {class} property INSTALACAO: JOperacoes read _GetINSTALACAO;
    {class} property MANUTENCAO: JOperacoes read _GetMANUTENCAO;
    {class} property OPERACAO_DESCONHECIDA: JOperacoes read _GetOPERACAO_DESCONHECIDA;
    {class} property PAGAMENTO_CONTA: JOperacoes read _GetPAGAMENTO_CONTA;
    {class} property PREAUTORIZACAO: JOperacoes read _GetPREAUTORIZACAO;
    {class} property RECARGA_CELULAR: JOperacoes read _GetRECARGA_CELULAR;
    {class} property REIMPRESSAO: JOperacoes read _GetREIMPRESSAO;
    {class} property RELATORIO_DETALHADO: JOperacoes read _GetRELATORIO_DETALHADO;
    {class} property RELATORIO_RESUMIDO: JOperacoes read _GetRELATORIO_RESUMIDO;
    {class} property RELATORIO_SINTETICO: JOperacoes read _GetRELATORIO_SINTETICO;
    {class} property SAQUE: JOperacoes read _GetSAQUE;
    {class} property TESTE_COMUNICACAO: JOperacoes read _GetTESTE_COMUNICACAO;
    {class} property VENDA: JOperacoes read _GetVENDA;
    {class} property VERSAO: JOperacoes read _GetVERSAO;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Operacoes')]
  JOperacoes = interface(JEnum)
    ['{D493BD18-EB08-4A3C-B761-658BC24E8873}']
    function obtemTagOperacao: Integer; cdecl;
  end;
  TJOperacoes = class(TJavaGenericImport<JOperacoesClass, JOperacoes>) end;

  JPersonalizacaoClass = interface(JSerializableClass)
    ['{B5B42212-E418-4EF9-903C-BFC0D8CBA21B}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Personalizacao')]
  JPersonalizacao = interface(JSerializable)
    ['{FC0C2051-0D6D-4015-A59B-EFDFC3F6C68E}']
    function obtemCorFonte: JString; cdecl;
    function obtemCorFonteTeclado: JString; cdecl;
    function obtemCorFundoCaixaEdicao: JString; cdecl;
    function obtemCorFundoTeclado: JString; cdecl;
    function obtemCorFundoTela: JString; cdecl;
    function obtemCorFundoToolbar: JString; cdecl;
    function obtemCorSeparadorMenu: JString; cdecl;
    function obtemCorTeclaLiberadaTeclado: JString; cdecl;
    function obtemCorTeclaPressionadaTeclado: JString; cdecl;
    function obtemCorTextoCaixaEdicao: JString; cdecl;
    function obtemCorTextoToolbar: JString; cdecl;
    function obtemFonte: JFile; cdecl;
    function obtemIconeToolbar: JFile; cdecl;
  end;
  TJPersonalizacao = class(TJavaGenericImport<JPersonalizacaoClass, JPersonalizacao>) end;

  JPersonalizacao_1Class = interface(JObjectClass)
    ['{869E0015-5733-40FF-9783-7C72BC62E2A1}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Personalizacao$1')]
  JPersonalizacao_1 = interface(JObject)
    ['{8E5E5966-BE4C-4D39-B6EF-791B2655F555}']
  end;
  TJPersonalizacao_1 = class(TJavaGenericImport<JPersonalizacao_1Class, JPersonalizacao_1>) end;

  JPersonalizacao_BuilderClass = interface(JObjectClass)
    ['{9CD1BA44-589F-4F6B-906E-3CA7C5F87F8D}']
    {class} function init: JPersonalizacao_Builder; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Personalizacao$Builder')]
  JPersonalizacao_Builder = interface(JObject)
    ['{22F921BA-39B3-4D24-802B-708874CC52E2}']
    function build: JPersonalizacao; cdecl;
    function informaCorFonte(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorFonteTeclado(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorFundoCaixaEdicao(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorFundoTeclado(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorFundoTela(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorFundoToolbar(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorSeparadorMenu(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorTeclaLiberadaTeclado(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorTeclaPressionadaTeclado(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorTextoCaixaEdicao(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaCorTextoToolbar(string_: JString): JPersonalizacao_Builder; cdecl;
    function informaFonte(file_: JFile): JPersonalizacao_Builder; cdecl;
    function informaIconeToolbar(file_: JFile): JPersonalizacao_Builder; cdecl;
  end;
  TJPersonalizacao_Builder = class(TJavaGenericImport<JPersonalizacao_BuilderClass, JPersonalizacao_Builder>) end;

  JProvedoresClass = interface(JEnumClass)
    ['{59C14E6C-ED1B-4220-A7A9-379024413C24}']
    {class} function _GetACCORD: JProvedores; cdecl;
    {class} function _GetALGORIX: JProvedores; cdecl;
    {class} function _GetAMEX: JProvedores; cdecl;
    {class} function _GetBANCREDCARD: JProvedores; cdecl;
    {class} function _GetBANESE: JProvedores; cdecl;
    {class} function _GetBANRISUL: JProvedores; cdecl;
    {class} function _GetCIELO: JProvedores; cdecl;
    {class} function _GetCONDUCTOR: JProvedores; cdecl;
    {class} function _GetCOOPERCRED: JProvedores; cdecl;
    {class} function _GetCREDISHOP: JProvedores; cdecl;
    {class} function _GetELAVON: JProvedores; cdecl;
    {class} function _GetFANCARD: JProvedores; cdecl;
    {class} function _GetFILLIP: JProvedores; cdecl;
    {class} function _GetFIRSTDATA: JProvedores; cdecl;
    {class} function _GetGETNET: JProvedores; cdecl;
    {class} function _GetHIPERCARD: JProvedores; cdecl;
    {class} function _GetLIBERCARD: JProvedores; cdecl;
    {class} function _GetM4U: JProvedores; cdecl;
    {class} function _GetMUXX: JProvedores; cdecl;
    {class} function _GetNEUS: JProvedores; cdecl;
    {class} function _GetORGCARD: JProvedores; cdecl;
    {class} function _GetPOLICARD: JProvedores; cdecl;
    {class} function _GetPREMMIA: JProvedores; cdecl;
    {class} function _GetPREPAG: JProvedores; cdecl;
    {class} function _GetPROVEDOR_DESCONHECIDO: JProvedores; cdecl;
    {class} function _GetREDECARD: JProvedores; cdecl;
    {class} function _GetREPOM: JProvedores; cdecl;
    {class} function _GetRV: JProvedores; cdecl;
    {class} function _GetSENFF: JProvedores; cdecl;
    {class} function _GetTECPOINT: JProvedores; cdecl;
    {class} function _GetTICKETCAR: JProvedores; cdecl;
    {class} function _GetTRICARD: JProvedores; cdecl;
    {class} function _GetVALECARD: JProvedores; cdecl;
    {class} function _GetVERYCARD: JProvedores; cdecl;
    {class} function obtemProvedor(string_: JString): JProvedores; cdecl;
    {class} function valueOf(string_: JString): JProvedores; cdecl;
    {class} function values: TJavaObjectArray<JProvedores>; cdecl;//Deprecated
    {class} property ACCORD: JProvedores read _GetACCORD;
    {class} property ALGORIX: JProvedores read _GetALGORIX;
    {class} property AMEX: JProvedores read _GetAMEX;
    {class} property BANCREDCARD: JProvedores read _GetBANCREDCARD;
    {class} property BANESE: JProvedores read _GetBANESE;
    {class} property BANRISUL: JProvedores read _GetBANRISUL;
    {class} property CIELO: JProvedores read _GetCIELO;
    {class} property CONDUCTOR: JProvedores read _GetCONDUCTOR;
    {class} property COOPERCRED: JProvedores read _GetCOOPERCRED;
    {class} property CREDISHOP: JProvedores read _GetCREDISHOP;
    {class} property ELAVON: JProvedores read _GetELAVON;
    {class} property FANCARD: JProvedores read _GetFANCARD;
    {class} property FILLIP: JProvedores read _GetFILLIP;
    {class} property FIRSTDATA: JProvedores read _GetFIRSTDATA;
    {class} property GETNET: JProvedores read _GetGETNET;
    {class} property HIPERCARD: JProvedores read _GetHIPERCARD;
    {class} property LIBERCARD: JProvedores read _GetLIBERCARD;
    {class} property M4U: JProvedores read _GetM4U;
    {class} property MUXX: JProvedores read _GetMUXX;
    {class} property NEUS: JProvedores read _GetNEUS;
    {class} property ORGCARD: JProvedores read _GetORGCARD;
    {class} property POLICARD: JProvedores read _GetPOLICARD;
    {class} property PREMMIA: JProvedores read _GetPREMMIA;
    {class} property PREPAG: JProvedores read _GetPREPAG;
    {class} property PROVEDOR_DESCONHECIDO: JProvedores read _GetPROVEDOR_DESCONHECIDO;
    {class} property REDECARD: JProvedores read _GetREDECARD;
    {class} property REPOM: JProvedores read _GetREPOM;
    {class} property RV: JProvedores read _GetRV;
    {class} property SENFF: JProvedores read _GetSENFF;
    {class} property TECPOINT: JProvedores read _GetTECPOINT;
    {class} property TICKETCAR: JProvedores read _GetTICKETCAR;
    {class} property TRICARD: JProvedores read _GetTRICARD;
    {class} property VALECARD: JProvedores read _GetVALECARD;
    {class} property VERYCARD: JProvedores read _GetVERYCARD;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Provedores')]
  JProvedores = interface(JEnum)
    ['{FECD131D-0F6A-4E55-B7CE-DE9D49AE69BA}']
  end;
  TJProvedores = class(TJavaGenericImport<JProvedoresClass, JProvedores>) end;

  JQuedaConexaoTerminalExcecaoClass = interface(JRuntimeExceptionClass)
    ['{5292CCD4-C3CD-47D1-8190-13A832AA98AE}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/QuedaConexaoTerminalExcecao')]
  JQuedaConexaoTerminalExcecao = interface(JRuntimeException)
    ['{EE1765F4-D292-4BE2-AF64-1298B9487A9F}']
  end;
  TJQuedaConexaoTerminalExcecao = class(TJavaGenericImport<JQuedaConexaoTerminalExcecaoClass, JQuedaConexaoTerminalExcecao>) end;

  JSaidaTransacaoClass = interface(JSerializableClass)
    ['{0BDFBEA3-0B62-49FD-95FD-1DA0637EB69D}']
    {class} function _GetserialVersionUID: Int64; cdecl;
    {class} function init: JSaidaTransacao; cdecl;
    {class} property serialVersionUID: Int64 read _GetserialVersionUID;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/SaidaTransacao')]
  JSaidaTransacao = interface(JSerializable)
    ['{609C639A-4C08-4261-87AC-DAA9F6A05673}']
    function comprovanteGraficoDisponivel: Boolean; cdecl;
    function existeTransacaoPendente: Boolean; cdecl;
    function informaAidCartao(string_: JString): JSaidaTransacao; cdecl;
    function informaCodigoAutorizacao(string_: JString): JSaidaTransacao; cdecl;
    function informaCodigoAutorizacaoOriginal(string_: JString): JSaidaTransacao; cdecl;
    function informaCodigoMoeda(string_: JString): JSaidaTransacao; cdecl;
    function informaCodigoRespostaProvedor(string_: JString): JSaidaTransacao; cdecl;
    function informaComprovanteCompleto(list: JList): JSaidaTransacao; cdecl;
    function informaComprovanteDiferenciadoLoja(list: JList): JSaidaTransacao; cdecl;
    function informaComprovanteDiferenciadoPortador(list: JList): JSaidaTransacao; cdecl;
    function informaComprovanteGraficoLojista(string_: JString): JSaidaTransacao; cdecl;
    function informaComprovanteGraficoPortador(string_: JString): JSaidaTransacao; cdecl;
    function informaComprovanteReduzidoPortador(list: JList): JSaidaTransacao; cdecl;
    procedure informaDadosTransacaoPendente(transacaoPendenteDados: JTransacaoPendenteDados); cdecl;
    function informaDataHoraTransacao(date: JDate): JSaidaTransacao; cdecl;
    function informaDataHoraTransacaoOriginal(date: JDate): JSaidaTransacao; cdecl;
    function informaDataPredatado(date: JDate): JSaidaTransacao; cdecl;
    function informaDocumentoFiscal(string_: JString): JSaidaTransacao; cdecl;
    function informaExisteComprovanteGrafico(b: Boolean): JSaidaTransacao; cdecl;
    procedure informaExisteTransacaoPendente(b: Boolean); cdecl;
    procedure informaIdentificacaoPortadorCarteira(identificacaoPortadorCarteira: JIdentificacaoPortadorCarteira); cdecl;
    function informaIdentificadorConfirmacaoTransacao(string_: JString): JSaidaTransacao; cdecl;
    function informaIdentificadorEstabelecimento(string_: JString): JSaidaTransacao; cdecl;
    function informaIdentificadorPontoCaptura(string_: JString): JSaidaTransacao; cdecl;
    function informaIdentificadorTransacaoAutomacao(string_: JString): JSaidaTransacao; cdecl;
    function informaMensagemResultado(string_: JString): JSaidaTransacao; cdecl;
    procedure informaModalidadePagamento(modalidadesPagamento: JModalidadesPagamento); cdecl;
    procedure informaModalidadeTransacao(modalidadesTransacao: JModalidadesTransacao); cdecl;
    function informaModoEntradaCartao(string_: JString): JSaidaTransacao; cdecl;
    function informaModoVerificacaoSenha(string_: JString): JSaidaTransacao; cdecl;
    function informaNomeCartao(string_: JString): JSaidaTransacao; cdecl;
    function informaNomeCartaoPadrao(string_: JString): JSaidaTransacao; cdecl;
    function informaNomeEstabelecimento(string_: JString): JSaidaTransacao; cdecl;
    function informaNomePortadorCartao(string_: JString): JSaidaTransacao; cdecl;
    function informaNomeProvedor(string_: JString): JSaidaTransacao; cdecl;
    function informaNsuHost(string_: JString): JSaidaTransacao; cdecl;
    function informaNsuHostOriginal(string_: JString): JSaidaTransacao; cdecl;
    function informaNsuLocal(string_: JString): JSaidaTransacao; cdecl;
    function informaNsuLocalOriginal(string_: JString): JSaidaTransacao; cdecl;
    function informaNumeroParcelas(i: Integer): JSaidaTransacao; cdecl;
    function informaOperacao(operacoes: JOperacoes): JSaidaTransacao; cdecl;
    function informaPanMascarado(string_: JString): JSaidaTransacao; cdecl;
    function informaPanMascaradoPadrao(string_: JString): JSaidaTransacao; cdecl;
    function informaProvedor(provedores: JProvedores): JSaidaTransacao; cdecl;
    function informaRequerConfirmacao(b: Boolean): JSaidaTransacao; cdecl;
    function informaResultadoTransacao(i: Integer): JSaidaTransacao; cdecl;
    function informaSaldoVoucher(string_: JString): JSaidaTransacao; cdecl;
    function informaTipoCartao(cartoes: JCartoes): JSaidaTransacao; cdecl;
    function informaTipoFinanciamento(financiamentos: JFinanciamentos): JSaidaTransacao; cdecl;
    procedure informaUniqueID(string_: JString); cdecl;
    function informaValorDesconto(string_: JString): JSaidaTransacao; cdecl;
    function informaValorDevido(string_: JString): JSaidaTransacao; cdecl;
    function informaValorOriginal(string_: JString): JSaidaTransacao; cdecl;
    function informaValorTotal(string_: JString): JSaidaTransacao; cdecl;
    function informaValorTroco(string_: JString): JSaidaTransacao; cdecl;
    function informaViasImprimir(viasImpressao: JViasImpressao): JSaidaTransacao; cdecl;
    function obtemAidCartao: JString; cdecl;
    function obtemCodigoAutorizacao: JString; cdecl;
    function obtemCodigoAutorizacaoOriginal: JString; cdecl;
    function obtemCodigoMoeda: JString; cdecl;
    function obtemCodigoRespostaProvedor: JString; cdecl;
    function obtemComprovanteCompleto: JList; cdecl;
    function obtemComprovanteDiferenciadoLoja: JList; cdecl;
    function obtemComprovanteDiferenciadoPortador: JList; cdecl;
    function obtemComprovanteGraficoLojista: JString; cdecl;
    function obtemComprovanteGraficoPortador: JString; cdecl;
    function obtemComprovanteReduzidoPortador: JList; cdecl;
    function obtemDadosTransacaoPendente: JTransacaoPendenteDados; cdecl;
    function obtemDataHoraTransacao: JDate; cdecl;
    function obtemDataHoraTransacaoOriginal: JDate; cdecl;
    function obtemDataPredatado: JDate; cdecl;
    function obtemDocumentoFiscal: JString; cdecl;
    function obtemIdentificacaoPortadorCarteira: JIdentificacaoPortadorCarteira; cdecl;
    function obtemIdentificadorConfirmacaoTransacao: JString; cdecl;
    function obtemIdentificadorEstabelecimento: JString; cdecl;
    function obtemIdentificadorPontoCaptura: JString; cdecl;
    function obtemIdentificadorTransacaoAutomacao: JString; cdecl;
    function obtemInformacaoConfirmacao: Boolean; cdecl;
    function obtemMensagemResultado: JString; cdecl;
    function obtemModalidadePagamento: JModalidadesPagamento; cdecl;
    function obtemModalidadeTransacao: JModalidadesTransacao; cdecl;
    function obtemModoEntradaCartao: JString; cdecl;
    function obtemModoVerificacaoSenha: JString; cdecl;
    function obtemNomeCartao: JString; cdecl;
    function obtemNomeCartaoPadrao: JString; cdecl;
    function obtemNomeEstabelecimento: JString; cdecl;
    function obtemNomePortadorCartao: JString; cdecl;
    function obtemNomeProvedor: JString; cdecl;
    function obtemNsuHost: JString; cdecl;
    function obtemNsuHostOriginal: JString; cdecl;
    function obtemNsuLocal: JString; cdecl;
    function obtemNsuLocalOriginal: JString; cdecl;
    function obtemNumeroParcelas: Integer; cdecl;
    function obtemOperacao: JOperacoes; cdecl;
    function obtemPanMascarado: JString; cdecl;
    function obtemPanMascaradoPadrao: JString; cdecl;
    function obtemProvedor: JProvedores; cdecl;
    function obtemResultadoTransacao: Integer; cdecl;
    function obtemSaldoVoucher: JString; cdecl;
    function obtemTipoCartao: JCartoes; cdecl;
    function obtemTipoFinanciamento: JFinanciamentos; cdecl;
    function obtemUniqueID: JString; cdecl;
    function obtemValorDesconto: JString; cdecl;
    function obtemValorDevido: JString; cdecl;
    function obtemValorOriginal: JString; cdecl;
    function obtemValorTotal: JString; cdecl;
    function obtemValorTroco: JString; cdecl;
    function obtemViasImprimir: JViasImpressao; cdecl;
  end;
  TJSaidaTransacao = class(TJavaGenericImport<JSaidaTransacaoClass, JSaidaTransacao>) end;

  JStatusTransacaoClass = interface(JEnumClass)
    ['{B672676F-068B-4192-B729-07A0DAA2A9B7}']
    {class} function _GetCONFIRMADO_AUTOMATICO: JStatusTransacao; cdecl;
    {class} function _GetCONFIRMADO_MANUAL: JStatusTransacao; cdecl;
    {class} function _GetDESFEITO_ERRO_IMPRESSAO_AUTOMATICO: JStatusTransacao; cdecl;
    {class} function _GetDESFEITO_LIBERACAO_MERCADORIA: JStatusTransacao; cdecl;
    {class} function _GetDESFEITO_MANUAL: JStatusTransacao; cdecl;
    {class} function _GetSTATUS_TRANSACAO_NAO_DEFINIDO: JStatusTransacao; cdecl;
    {class} function valueOf(string_: JString): JStatusTransacao; cdecl;
    {class} function values: TJavaObjectArray<JStatusTransacao>; cdecl;//Deprecated
    {class} property CONFIRMADO_AUTOMATICO: JStatusTransacao read _GetCONFIRMADO_AUTOMATICO;
    {class} property CONFIRMADO_MANUAL: JStatusTransacao read _GetCONFIRMADO_MANUAL;
    {class} property DESFEITO_ERRO_IMPRESSAO_AUTOMATICO: JStatusTransacao read _GetDESFEITO_ERRO_IMPRESSAO_AUTOMATICO;
    {class} property DESFEITO_LIBERACAO_MERCADORIA: JStatusTransacao read _GetDESFEITO_LIBERACAO_MERCADORIA;
    {class} property DESFEITO_MANUAL: JStatusTransacao read _GetDESFEITO_MANUAL;
    {class} property STATUS_TRANSACAO_NAO_DEFINIDO: JStatusTransacao read _GetSTATUS_TRANSACAO_NAO_DEFINIDO;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/StatusTransacao')]
  JStatusTransacao = interface(JEnum)
    ['{66D86396-878C-4A4F-ABC0-6D52830084BD}']
  end;
  TJStatusTransacao = class(TJavaGenericImport<JStatusTransacaoClass, JStatusTransacao>) end;

  JTransacaoClass = interface(IJavaClass)
    ['{DC7AA221-8178-4058-A8AD-75689642A818}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Transacao')]
  JTransacao = interface(IJavaInstance)
    ['{4CCD6646-CAC4-4085-BDA2-3C3B77FE5AE8}']
    procedure confirmaTransacao(confirmacao: JConfirmacao); cdecl;
    function realizaTransacao(entradaTransacao: JEntradaTransacao): JSaidaTransacao; cdecl;
    procedure resolvePendencia(transacaoPendenteDados: JTransacaoPendenteDados; confirmacao: JConfirmacao); cdecl;
  end;
  TJTransacao = class(TJavaGenericImport<JTransacaoClass, JTransacao>) end;

  JTransacaoPendenteDadosClass = interface(JSerializableClass)
    ['{3EE339C4-45F2-4CF4-B9FD-48616103D1ED}']
    {class} function init: JTransacaoPendenteDados; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/TransacaoPendenteDados')]
  JTransacaoPendenteDados = interface(JSerializable)
    ['{6A913D0A-853D-46B2-8B9B-87A06617B4F9}']
    procedure informaIdentificadorEstabelecimento(string_: JString); cdecl;
    procedure informaNomeProvedor(string_: JString); cdecl;
    procedure informaNsuHost(string_: JString); cdecl;
    procedure informaNsuLocal(string_: JString); cdecl;
    procedure informaNsuTransacao(string_: JString); cdecl;
    procedure informaProvedor(provedores: JProvedores); cdecl;
    function obtemIdentificadorEstabelecimento: JString; cdecl;
    function obtemNomeProvedor: JString; cdecl;
    function obtemNsuHost: JString; cdecl;
    function obtemNsuLocal: JString; cdecl;
    function obtemNsuTransacao: JString; cdecl;
    function obtemProvedor: JProvedores; cdecl;
    function toString: JString; cdecl;
  end;
  TJTransacaoPendenteDados = class(TJavaGenericImport<JTransacaoPendenteDadosClass, JTransacaoPendenteDados>) end;

  JTransacoesClass = interface(JTransacaoClass)
    ['{3F223D2F-1BC5-41C3-8058-DA7F1A01AE4A}']
    {class} function obtemInstancia(dadosAutomacao: JDadosAutomacao; context: JContext): JTransacoes; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Transacoes')]
  JTransacoes = interface(JTransacao)
    ['{CF7B9911-AE75-4E62-8E1D-603E4AE83288}']
    procedure confirmaTransacao(confirmacao: JConfirmacao); cdecl;
    function obtemVersoes: JVersoes; cdecl;
    function realizaTransacao(entradaTransacao: JEntradaTransacao): JSaidaTransacao; cdecl;
    procedure resolvePendencia(transacaoPendenteDados: JTransacaoPendenteDados; confirmacao: JConfirmacao); cdecl;
  end;
  TJTransacoes = class(TJavaGenericImport<JTransacoesClass, JTransacoes>) end;

  JTransacoes_1Class = interface(JObjectClass)
    ['{3F19DE15-25D3-4490-8A21-0613CABB1180}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Transacoes$1')]
  JTransacoes_1 = interface(JObject)
    ['{5DEF3A4E-8AC2-48A8-B8FF-E072259E10F0}']
  end;
  TJTransacoes_1 = class(TJavaGenericImport<JTransacoes_1Class, JTransacoes_1>) end;

  JTransacoes_TransacaoResultReceiverClass = interface(JResultReceiverClass)
    ['{5AE84D76-7265-4A1B-83B1-197E05D4E72A}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Transacoes$TransacaoResultReceiver')]
  JTransacoes_TransacaoResultReceiver = interface(JResultReceiver)
    ['{08C67534-80F9-4D63-9F72-C864BC13812A}']
  end;
  TJTransacoes_TransacaoResultReceiver = class(TJavaGenericImport<JTransacoes_TransacaoResultReceiverClass, JTransacoes_TransacaoResultReceiver>) end;

  JVersoesClass = interface(JObjectClass)
    ['{D87D4816-C435-41EF-95FB-BBE97D1F6F81}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/Versoes')]
  JVersoes = interface(JObject)
    ['{59E0D5DB-87CF-4631-A361-33BD6AFCAA6A}']
    function obtemVersaoApk: JMap; cdecl;
    function obtemVersaoBiblioteca: JString; cdecl;
  end;
  TJVersoes = class(TJavaGenericImport<JVersoesClass, JVersoes>) end;

  JViasImpressaoClass = interface(JEnumClass)
    ['{62FBEEFA-4DC9-405A-A9F5-B74B026BF3E2}']
    {class} function _GetVIA_CLIENTE: JViasImpressao; cdecl;
    {class} function _GetVIA_CLIENTE_E_ESTABELECIMENTO: JViasImpressao; cdecl;
    {class} function _GetVIA_ESTABELECIMENTO: JViasImpressao; cdecl;
    {class} function _GetVIA_NENHUMA: JViasImpressao; cdecl;
    {class} function obtemViaImpressao(i: Integer): JViasImpressao; cdecl;
    {class} function valueOf(string_: JString): JViasImpressao; cdecl;
    {class} function values: TJavaObjectArray<JViasImpressao>; cdecl;//Deprecated
    {class} property VIA_CLIENTE: JViasImpressao read _GetVIA_CLIENTE;
    {class} property VIA_CLIENTE_E_ESTABELECIMENTO: JViasImpressao read _GetVIA_CLIENTE_E_ESTABELECIMENTO;
    {class} property VIA_ESTABELECIMENTO: JViasImpressao read _GetVIA_ESTABELECIMENTO;
    {class} property VIA_NENHUMA: JViasImpressao read _GetVIA_NENHUMA;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/ViasImpressao')]
  JViasImpressao = interface(JEnum)
    ['{7D671189-7F76-4D80-B4F2-040B5EE79D39}']
    function obtemTipoViaImpressao: Integer; cdecl;
  end;
  TJViasImpressao = class(TJavaGenericImport<JViasImpressaoClass, JViasImpressao>) end;

  JCustomizationClass = interface(IJavaClass)
    ['{A6564438-8131-4B85-BA4F-265589B00E17}']
    {class} function _GetEDITBOX_BACKGROUND_COLOR: JString; cdecl;
    {class} function _GetEDITBOX_TEXT_COLOR: JString; cdecl;
    {class} function _GetFONT: JString; cdecl;
    {class} function _GetFONT_COLOR: JString; cdecl;
    {class} function _GetKEYBOARD_BACKGROUND_COLOR: JString; cdecl;
    {class} function _GetKEYBOARD_FONT_COLOR: JString; cdecl;
    {class} function _GetMENU_SEPARATOR_COLOR: JString; cdecl;
    {class} function _GetPOS_CUSTOMIZATION: JString; cdecl;
    {class} function _GetPRESSED_KEY_COLOR: JString; cdecl;
    {class} function _GetRELEASED_KEY_COLOR: JString; cdecl;
    {class} function _GetSCREEN_BACKGROUND_COLOR: JString; cdecl;
    {class} function _GetTOOLBAR_BACKGROUND: JString; cdecl;
    {class} function _GetTOOLBAR_ICON: JString; cdecl;
    {class} function _GetTOOLBAR_TEXT_COLOR: JString; cdecl;
    {class} property EDITBOX_BACKGROUND_COLOR: JString read _GetEDITBOX_BACKGROUND_COLOR;
    {class} property EDITBOX_TEXT_COLOR: JString read _GetEDITBOX_TEXT_COLOR;
    {class} property FONT: JString read _GetFONT;
    {class} property FONT_COLOR: JString read _GetFONT_COLOR;
    {class} property KEYBOARD_BACKGROUND_COLOR: JString read _GetKEYBOARD_BACKGROUND_COLOR;
    {class} property KEYBOARD_FONT_COLOR: JString read _GetKEYBOARD_FONT_COLOR;
    {class} property MENU_SEPARATOR_COLOR: JString read _GetMENU_SEPARATOR_COLOR;
    {class} property POS_CUSTOMIZATION: JString read _GetPOS_CUSTOMIZATION;
    {class} property PRESSED_KEY_COLOR: JString read _GetPRESSED_KEY_COLOR;
    {class} property RELEASED_KEY_COLOR: JString read _GetRELEASED_KEY_COLOR;
    {class} property SCREEN_BACKGROUND_COLOR: JString read _GetSCREEN_BACKGROUND_COLOR;
    {class} property TOOLBAR_BACKGROUND: JString read _GetTOOLBAR_BACKGROUND;
    {class} property TOOLBAR_ICON: JString read _GetTOOLBAR_ICON;
    {class} property TOOLBAR_TEXT_COLOR: JString read _GetTOOLBAR_TEXT_COLOR;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/espec/Customization')]
  JCustomization = interface(IJavaInstance)
    ['{1A4E623C-7EF9-4685-B217-F4F876B013BF}']
  end;
  TJCustomization = class(TJavaGenericImport<JCustomizationClass, JCustomization>) end;

  JPendingTransactionDataClass = interface(IJavaClass)
    ['{0D2449B2-7130-4E88-849B-1B80111515B9}']
    {class} function _GetHOST_NSU: JString; cdecl;
    {class} function _GetLOCAL_NSU: JString; cdecl;
    {class} function _GetMERCHANT_ID: JString; cdecl;
    {class} function _GetPENDING_TRANSACTION: JString; cdecl;
    {class} function _GetPROVIDER_NAME: JString; cdecl;
    {class} function _GetTRANSACTION_NSU: JString; cdecl;
    {class} property HOST_NSU: JString read _GetHOST_NSU;
    {class} property LOCAL_NSU: JString read _GetLOCAL_NSU;
    {class} property MERCHANT_ID: JString read _GetMERCHANT_ID;
    {class} property PENDING_TRANSACTION: JString read _GetPENDING_TRANSACTION;
    {class} property PROVIDER_NAME: JString read _GetPROVIDER_NAME;
    {class} property TRANSACTION_NSU: JString read _GetTRANSACTION_NSU;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/espec/PendingTransactionData')]
  JPendingTransactionData = interface(IJavaInstance)
    ['{30892794-5132-41D0-B35B-F5858BA486F0}']
  end;
  TJPendingTransactionData = class(TJavaGenericImport<JPendingTransactionDataClass, JPendingTransactionData>) end;

  JPosDataClass = interface(IJavaClass)
    ['{0FDE38D4-0E61-4B67-AA0F-0FC47501E96A}']
    {class} function _GetALLOW_CASHBACK: JString; cdecl;
    {class} function _GetALLOW_DIFFERENT_RECEIPTS: JString; cdecl;
    {class} function _GetALLOW_DISCOUNT: JString; cdecl;
    {class} function _GetALLOW_DUE_AMOUNT: JString; cdecl;
    {class} function _GetALLOW_SHORT_RECEIPT: JString; cdecl;
    {class} function _GetCLIENT_CUSTOMIZATION: JString; cdecl;
    {class} function _GetPOS_DATA: JString; cdecl;
    {class} function _GetPOS_DEVELOPER: JString; cdecl;
    {class} function _GetPOS_NAME: JString; cdecl;
    {class} function _GetPOS_VERSION: JString; cdecl;
    {class} property ALLOW_CASHBACK: JString read _GetALLOW_CASHBACK;
    {class} property ALLOW_DIFFERENT_RECEIPTS: JString read _GetALLOW_DIFFERENT_RECEIPTS;
    {class} property ALLOW_DISCOUNT: JString read _GetALLOW_DISCOUNT;
    {class} property ALLOW_DUE_AMOUNT: JString read _GetALLOW_DUE_AMOUNT;
    {class} property ALLOW_SHORT_RECEIPT: JString read _GetALLOW_SHORT_RECEIPT;
    {class} property CLIENT_CUSTOMIZATION: JString read _GetCLIENT_CUSTOMIZATION;
    {class} property POS_DATA: JString read _GetPOS_DATA;
    {class} property POS_DEVELOPER: JString read _GetPOS_DEVELOPER;
    {class} property POS_NAME: JString read _GetPOS_NAME;
    {class} property POS_VERSION: JString read _GetPOS_VERSION;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/espec/PosData')]
  JPosData = interface(IJavaInstance)
    ['{C53B978B-4E30-4780-B9D9-114993ABB134}']
  end;
  TJPosData = class(TJavaGenericImport<JPosDataClass, JPosData>) end;

  JTransactionConfirmationClass = interface(IJavaClass)
    ['{E0523010-ACB6-43BD-9C22-5B89F269B4E3}']
    {class} function _GetCONFIRMATION: JString; cdecl;
    {class} function _GetCONFIRMATION_TRANSACTION_ID: JString; cdecl;
    {class} property CONFIRMATION: JString read _GetCONFIRMATION;
    {class} property CONFIRMATION_TRANSACTION_ID: JString read _GetCONFIRMATION_TRANSACTION_ID;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/espec/TransactionConfirmation')]
  JTransactionConfirmation = interface(IJavaInstance)
    ['{F8952062-57E1-4A12-B80B-DF0F1DA62ACC}']
  end;
  TJTransactionConfirmation = class(TJavaGenericImport<JTransactionConfirmationClass, JTransactionConfirmation>) end;

  JTransactionInputClass = interface(IJavaClass)
    ['{80B49A25-47BA-4819-AF9C-45F83A53B72A}']
    {class} function _GetADD_POSDATA1: JString; cdecl;
    {class} function _GetADD_POSDATA2: JString; cdecl;
    {class} function _GetADD_POSDATA3: JString; cdecl;
    {class} function _GetADD_POSDATA4: JString; cdecl;
    {class} function _GetAMOUNT: JString; cdecl;
    {class} function _GetBILL_NUMBER: JString; cdecl;
    {class} function _GetBOARDING_TAX: JString; cdecl;
    {class} function _GetCARD_TYPE: JString; cdecl;
    {class} function _GetCURRENCY_CODE: JString; cdecl;
    {class} function _GetFIN_TYPE: JString; cdecl;
    {class} function _GetFISCAL_DOC: JString; cdecl;
    {class} function _GetINPUT: JString; cdecl;
    {class} function _GetINSTALLMENTS: JString; cdecl;
    {class} function _GetOPERATION: JString; cdecl;
    {class} function _GetORIGINAL_AUTHORIZATION_CODE: JString; cdecl;
    {class} function _GetORIGINAL_TRANSACTION_DATE_TIME: JString; cdecl;
    {class} function _GetORIGINAL_TRANSACTION_NSU: JString; cdecl;
    {class} function _GetPAY_MODE: JString; cdecl;
    {class} function _GetPHONE_NUMBER: JString; cdecl;
    {class} function _GetPOS_ID: JString; cdecl;
    {class} function _GetPREDATED_DATE: JString; cdecl;
    {class} function _GetPROVIDER: JString; cdecl;
    {class} function _GetSERVICE_TAX: JString; cdecl;
    {class} function _GetTAX_ID: JString; cdecl;
    {class} function _GetTRANSACTION_ID: JString; cdecl;
    {class} property ADD_POSDATA1: JString read _GetADD_POSDATA1;
    {class} property ADD_POSDATA2: JString read _GetADD_POSDATA2;
    {class} property ADD_POSDATA3: JString read _GetADD_POSDATA3;
    {class} property ADD_POSDATA4: JString read _GetADD_POSDATA4;
    {class} property AMOUNT: JString read _GetAMOUNT;
    {class} property BILL_NUMBER: JString read _GetBILL_NUMBER;
    {class} property BOARDING_TAX: JString read _GetBOARDING_TAX;
    {class} property CARD_TYPE: JString read _GetCARD_TYPE;
    {class} property CURRENCY_CODE: JString read _GetCURRENCY_CODE;
    {class} property FIN_TYPE: JString read _GetFIN_TYPE;
    {class} property FISCAL_DOC: JString read _GetFISCAL_DOC;
    {class} property INPUT: JString read _GetINPUT;
    {class} property INSTALLMENTS: JString read _GetINSTALLMENTS;
    {class} property OPERATION: JString read _GetOPERATION;
    {class} property ORIGINAL_AUTHORIZATION_CODE: JString read _GetORIGINAL_AUTHORIZATION_CODE;
    {class} property ORIGINAL_TRANSACTION_DATE_TIME: JString read _GetORIGINAL_TRANSACTION_DATE_TIME;
    {class} property ORIGINAL_TRANSACTION_NSU: JString read _GetORIGINAL_TRANSACTION_NSU;
    {class} property PAY_MODE: JString read _GetPAY_MODE;
    {class} property PHONE_NUMBER: JString read _GetPHONE_NUMBER;
    {class} property POS_ID: JString read _GetPOS_ID;
    {class} property PREDATED_DATE: JString read _GetPREDATED_DATE;
    {class} property PROVIDER: JString read _GetPROVIDER;
    {class} property SERVICE_TAX: JString read _GetSERVICE_TAX;
    {class} property TAX_ID: JString read _GetTAX_ID;
    {class} property TRANSACTION_ID: JString read _GetTRANSACTION_ID;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/espec/TransactionInput')]
  JTransactionInput = interface(IJavaInstance)
    ['{F1109CCB-11F7-4E57-A254-B6815AC97C7B}']
  end;
  TJTransactionInput = class(TJavaGenericImport<JTransactionInputClass, JTransactionInput>) end;

  JTransactionOutputClass = interface(IJavaClass)
    ['{F25806D1-1E67-447E-8195-140798284CB3}']
    {class} function _GetAID: JString; cdecl;
    {class} function _GetAMOUNT: JString; cdecl;
    {class} function _GetAUTHORIZATION_CODE: JString; cdecl;
    {class} function _GetAUTHORIZATION_MODE: JString; cdecl;
    {class} function _GetAUTHORIZER_RESPONSE: JString; cdecl;
    {class} function _GetBALANCE_VOUCHER: JString; cdecl;
    {class} function _GetCARDHOLDER_GRAPHIC_RECEIPT: JString; cdecl;
    {class} function _GetCARDHOLDER_NAME: JString; cdecl;
    {class} function _GetCARDHOLDER_RECEIPT: JString; cdecl;
    {class} function _GetCARDHOLDER_VERIFICATION_MODE: JString; cdecl;
    {class} function _GetCARD_ENTRY_MODE: JString; cdecl;
    {class} function _GetCARD_NAME: JString; cdecl;
    {class} function _GetCARD_TYPE: JString; cdecl;
    {class} function _GetCASHBACK_AMOUNT: JString; cdecl;
    {class} function _GetCONFIRMATION_TRANSACTION_ID: JString; cdecl;
    {class} function _GetCURRENCY_CODE: JString; cdecl;
    {class} function _GetDATE_TIME_TRANSACTION: JString; cdecl;
    {class} function _GetDEFAULT_CARD_NAME: JString; cdecl;
    {class} function _GetDEFAULT_MASKED_PAN: JString; cdecl;
    {class} function _GetDISCOUNT_AMOUNT: JString; cdecl;
    {class} function _GetDUE_AMOUNT: JString; cdecl;
    {class} function _GetFIN_TYPE: JString; cdecl;
    {class} function _GetFISCAL_DOCUMENT: JString; cdecl;
    {class} function _GetFULL_RECEIPT: JString; cdecl;
    {class} function _GetGRAPHIC_RECEIPT_EXISTS: JString; cdecl;
    {class} function _GetINSTALLMENTS: JString; cdecl;
    {class} function _GetMASKED_PAN: JString; cdecl;
    {class} function _GetMERCHANT_GRAPHIC_RECEIPT: JString; cdecl;
    {class} function _GetMERCHANT_ID: JString; cdecl;
    {class} function _GetMERCHANT_NAME: JString; cdecl;
    {class} function _GetMERCHANT_RECEIPT: JString; cdecl;
    {class} function _GetOPERATION: JString; cdecl;
    {class} function _GetORIGINAL_AUTHORIZATION_CODE: JString; cdecl;
    {class} function _GetORIGINAL_TERMINAL_NSU: JString; cdecl;
    {class} function _GetORIGINAL_TRANSACTION_AMOUNT: JString; cdecl;
    {class} function _GetORIGINAL_TRANSACTION_DATE_TIME: JString; cdecl;
    {class} function _GetORIGINAL_TRANSACTION_NSU: JString; cdecl;
    {class} function _GetOUTPUT: JString; cdecl;
    {class} function _GetPAY_MODE: JString; cdecl;
    {class} function _GetPENDING_TRANSACTION_DATA: JString; cdecl;
    {class} function _GetPENDING_TRANSACTION_EXISTS: JString; cdecl;
    {class} function _GetPOS_ID: JString; cdecl;
    {class} function _GetPREDATED_DATE: JString; cdecl;
    {class} function _GetPRINT_RECEIPTS: JString; cdecl;
    {class} function _GetPROVIDER_NAME: JString; cdecl;
    {class} function _GetREQUIRES_CONFIRMATION: JString; cdecl;
    {class} function _GetRESULT_MESSAGE: JString; cdecl;
    {class} function _GetSHORT_RECEIPT: JString; cdecl;
    {class} function _GetTERMINAL_NSU: JString; cdecl;
    {class} function _GetTRANSACTION_ID: JString; cdecl;
    {class} function _GetTRANSACTION_NSU: JString; cdecl;
    {class} function _GetTRANSACTION_RESULT: JString; cdecl;
    {class} function _GetUNIQUE_ID: JString; cdecl;
    {class} function _GetWALLET_USER_ID: JString; cdecl;
    {class} property AID: JString read _GetAID;
    {class} property AMOUNT: JString read _GetAMOUNT;
    {class} property AUTHORIZATION_CODE: JString read _GetAUTHORIZATION_CODE;
    {class} property AUTHORIZATION_MODE: JString read _GetAUTHORIZATION_MODE;
    {class} property AUTHORIZER_RESPONSE: JString read _GetAUTHORIZER_RESPONSE;
    {class} property BALANCE_VOUCHER: JString read _GetBALANCE_VOUCHER;
    {class} property CARDHOLDER_GRAPHIC_RECEIPT: JString read _GetCARDHOLDER_GRAPHIC_RECEIPT;
    {class} property CARDHOLDER_NAME: JString read _GetCARDHOLDER_NAME;
    {class} property CARDHOLDER_RECEIPT: JString read _GetCARDHOLDER_RECEIPT;
    {class} property CARDHOLDER_VERIFICATION_MODE: JString read _GetCARDHOLDER_VERIFICATION_MODE;
    {class} property CARD_ENTRY_MODE: JString read _GetCARD_ENTRY_MODE;
    {class} property CARD_NAME: JString read _GetCARD_NAME;
    {class} property CARD_TYPE: JString read _GetCARD_TYPE;
    {class} property CASHBACK_AMOUNT: JString read _GetCASHBACK_AMOUNT;
    {class} property CONFIRMATION_TRANSACTION_ID: JString read _GetCONFIRMATION_TRANSACTION_ID;
    {class} property CURRENCY_CODE: JString read _GetCURRENCY_CODE;
    {class} property DATE_TIME_TRANSACTION: JString read _GetDATE_TIME_TRANSACTION;
    {class} property DEFAULT_CARD_NAME: JString read _GetDEFAULT_CARD_NAME;
    {class} property DEFAULT_MASKED_PAN: JString read _GetDEFAULT_MASKED_PAN;
    {class} property DISCOUNT_AMOUNT: JString read _GetDISCOUNT_AMOUNT;
    {class} property DUE_AMOUNT: JString read _GetDUE_AMOUNT;
    {class} property FIN_TYPE: JString read _GetFIN_TYPE;
    {class} property FISCAL_DOCUMENT: JString read _GetFISCAL_DOCUMENT;
    {class} property FULL_RECEIPT: JString read _GetFULL_RECEIPT;
    {class} property GRAPHIC_RECEIPT_EXISTS: JString read _GetGRAPHIC_RECEIPT_EXISTS;
    {class} property INSTALLMENTS: JString read _GetINSTALLMENTS;
    {class} property MASKED_PAN: JString read _GetMASKED_PAN;
    {class} property MERCHANT_GRAPHIC_RECEIPT: JString read _GetMERCHANT_GRAPHIC_RECEIPT;
    {class} property MERCHANT_ID: JString read _GetMERCHANT_ID;
    {class} property MERCHANT_NAME: JString read _GetMERCHANT_NAME;
    {class} property MERCHANT_RECEIPT: JString read _GetMERCHANT_RECEIPT;
    {class} property OPERATION: JString read _GetOPERATION;
    {class} property ORIGINAL_AUTHORIZATION_CODE: JString read _GetORIGINAL_AUTHORIZATION_CODE;
    {class} property ORIGINAL_TERMINAL_NSU: JString read _GetORIGINAL_TERMINAL_NSU;
    {class} property ORIGINAL_TRANSACTION_AMOUNT: JString read _GetORIGINAL_TRANSACTION_AMOUNT;
    {class} property ORIGINAL_TRANSACTION_DATE_TIME: JString read _GetORIGINAL_TRANSACTION_DATE_TIME;
    {class} property ORIGINAL_TRANSACTION_NSU: JString read _GetORIGINAL_TRANSACTION_NSU;
    {class} property OUTPUT: JString read _GetOUTPUT;
    {class} property PAY_MODE: JString read _GetPAY_MODE;
    {class} property PENDING_TRANSACTION_DATA: JString read _GetPENDING_TRANSACTION_DATA;
    {class} property PENDING_TRANSACTION_EXISTS: JString read _GetPENDING_TRANSACTION_EXISTS;
    {class} property POS_ID: JString read _GetPOS_ID;
    {class} property PREDATED_DATE: JString read _GetPREDATED_DATE;
    {class} property PRINT_RECEIPTS: JString read _GetPRINT_RECEIPTS;
    {class} property PROVIDER_NAME: JString read _GetPROVIDER_NAME;
    {class} property REQUIRES_CONFIRMATION: JString read _GetREQUIRES_CONFIRMATION;
    {class} property RESULT_MESSAGE: JString read _GetRESULT_MESSAGE;
    {class} property SHORT_RECEIPT: JString read _GetSHORT_RECEIPT;
    {class} property TERMINAL_NSU: JString read _GetTERMINAL_NSU;
    {class} property TRANSACTION_ID: JString read _GetTRANSACTION_ID;
    {class} property TRANSACTION_NSU: JString read _GetTRANSACTION_NSU;
    {class} property TRANSACTION_RESULT: JString read _GetTRANSACTION_RESULT;
    {class} property UNIQUE_ID: JString read _GetUNIQUE_ID;
    {class} property WALLET_USER_ID: JString read _GetWALLET_USER_ID;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/espec/TransactionOutput')]
  JTransactionOutput = interface(IJavaInstance)
    ['{1423585A-38D2-454A-810A-D601E049D397}']
  end;
  TJTransactionOutput = class(TJavaGenericImport<JTransactionOutputClass, JTransactionOutput>) end;

  JDateParserClass = interface(JObjectClass)
    ['{A5435998-12E3-476A-B0C8-02926028398C}']
    {class} function date2String(date: JDate): JString; cdecl;
    {class} function init: JDateParser; cdecl;
    {class} function string2Date(string_: JString): JDate; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/DateParser')]
  JDateParser = interface(JObject)
    ['{AB588612-9412-47E1-BF17-D03DC3E0D510}']
  end;
  TJDateParser = class(TJavaGenericImport<JDateParserClass, JDateParser>) end;

  JEnumTypeClass = interface(JObjectClass)
    ['{70EFB8B0-9FF2-4583-B387-3DF3F24BFCA5}']
    {class} function _GetTYPE_NAME: Integer; cdecl;
    {class} function _GetTYPE_ORDINAL: Integer; cdecl;
    {class} function _GetTYPE_VALUE: Integer; cdecl;
    {class} function init: JEnumType; cdecl;//Deprecated
    {class} property TYPE_NAME: Integer read _GetTYPE_NAME;
    {class} property TYPE_ORDINAL: Integer read _GetTYPE_ORDINAL;
    {class} property TYPE_VALUE: Integer read _GetTYPE_VALUE;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/EnumType')]
  JEnumType = interface(JObject)
    ['{6E0C3C37-E227-430A-9DED-08510462D32E}']
  end;
  TJEnumType = class(TJavaGenericImport<JEnumTypeClass, JEnumType>) end;

  JInputParserClass = interface(JObjectClass)
    ['{8613A0EB-0E52-409C-B88D-837984913DFA}']
    {class} function init(string_: JString; string_1: JString): JInputParser; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/InputParser')]
  JInputParser = interface(JObject)
    ['{D948A9BF-C63A-4214-85B4-FCD231953C84}']
    procedure addObject(object_: JObject); cdecl;
    procedure addParameter(string_: JString; string_1: JString); cdecl;
    procedure addPath(string_: JString); cdecl;
    function toString: JString; cdecl;
  end;
  TJInputParser = class(TJavaGenericImport<JInputParserClass, JInputParser>) end;

  JOutputParserClass = interface(JObjectClass)
    ['{5C98FCA9-F0A1-4ED8-8CDE-F7C0F236A8D2}']
    {class} function init(string_: JString; context: JContext): JOutputParser; cdecl;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/OutputParser')]
  JOutputParser = interface(JObject)
    ['{BED243EE-D4C8-4FB6-BD4C-425CF7446051}']
    function getObject(class_: Jlang_Class): JObject; cdecl; overload;
    function getObject(class_: Jlang_Class; object_: JObject): JObject; cdecl; overload;
  end;
  TJOutputParser = class(TJavaGenericImport<JOutputParserClass, JOutputParser>) end;

  Jparser_ParseExceptionClass = interface(JExceptionClass)
    ['{FB2F35E6-48CF-418F-93E1-158E74AF46C9}']
    {class} function init: Jparser_ParseException; cdecl; overload;
    {class} function init(throwable: JThrowable): Jparser_ParseException; cdecl; overload;
    {class} function init(string_: JString): Jparser_ParseException; cdecl; overload;
    {class} function init(string_: JString; throwable: JThrowable): Jparser_ParseException; cdecl; overload;
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/ParseException')]
  Jparser_ParseException = interface(JException)
    ['{4BC46B07-0315-4B5A-A236-BBDE88DE2719}']
  end;
  TJparser_ParseException = class(TJavaGenericImport<Jparser_ParseExceptionClass, Jparser_ParseException>) end;

  JUriArrayFieldNameClass = interface(JAnnotationClass)
    ['{19BCDDB7-B2DB-4D17-B6CB-939AFA50413D}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriArrayFieldName')]
  JUriArrayFieldName = interface(JAnnotation)
    ['{57570B44-AA29-430C-B5E0-FE92106C0895}']
    function value: JString; cdecl;
  end;
  TJUriArrayFieldName = class(TJavaGenericImport<JUriArrayFieldNameClass, JUriArrayFieldName>) end;

  Jparser_UriClassClass = interface(JAnnotationClass)
    ['{59A90D07-2369-4ED1-A1B4-DAE2CD07C8F0}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriClass')]
  Jparser_UriClass = interface(JAnnotation)
    ['{DAC610DE-FB82-4979-9EC9-2134B92F2280}']
    function value: JString; cdecl;
  end;
  TJparser_UriClass = class(TJavaGenericImport<Jparser_UriClassClass, Jparser_UriClass>) end;

  JUriCustomizeFieldNameClass = interface(JAnnotationClass)
    ['{4A811ABD-5F24-4D99-8A4E-7CF37253B49C}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriCustomizeFieldName')]
  JUriCustomizeFieldName = interface(JAnnotation)
    ['{0C625F64-4A31-4191-BD28-CC9370CCA0A7}']
    function value: JString; cdecl;
  end;
  TJUriCustomizeFieldName = class(TJavaGenericImport<JUriCustomizeFieldNameClass, JUriCustomizeFieldName>) end;

  JUriDateFieldNameClass = interface(JAnnotationClass)
    ['{5871889B-AC9D-46C1-806A-199D7E11E781}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriDateFieldName')]
  JUriDateFieldName = interface(JAnnotation)
    ['{798852F5-A44B-4FF2-8178-6A1F5C3A8BF5}']
    function value: JString; cdecl;
  end;
  TJUriDateFieldName = class(TJavaGenericImport<JUriDateFieldNameClass, JUriDateFieldName>) end;

  JUriEnumFieldNameClass = interface(JAnnotationClass)
    ['{219786D9-0D00-4435-B42B-C75817B2F68A}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriEnumFieldName')]
  JUriEnumFieldName = interface(JAnnotation)
    ['{4664C8A2-48F6-4698-9000-C405D2F98CFB}']
    function value: JString; cdecl;
  end;
  TJUriEnumFieldName = class(TJavaGenericImport<JUriEnumFieldNameClass, JUriEnumFieldName>) end;

  JUriFileFieldNameClass = interface(JAnnotationClass)
    ['{384B2465-BC28-49D1-8F9F-56B94E461C44}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriFileFieldName')]
  JUriFileFieldName = interface(JAnnotation)
    ['{DE57CE48-19E9-4B5C-960B-11D7BBF3C8F5}']
    function value: JString; cdecl;
  end;
  TJUriFileFieldName = class(TJavaGenericImport<JUriFileFieldNameClass, JUriFileFieldName>) end;

  JUriMethodNameClass = interface(JAnnotationClass)
    ['{F1AE5CCC-646C-49A2-B5FF-0B651897DDC3}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriMethodName')]
  JUriMethodName = interface(JAnnotation)
    ['{CBD6C838-857A-469C-8C65-FB8A2FA90BF2}']
    function json: TJavaObjectArray<Jparser_UriClass>; cdecl;
  end;
  TJUriMethodName = class(TJavaGenericImport<JUriMethodNameClass, JUriMethodName>) end;

  JUriObjectFieldNameClass = interface(JAnnotationClass)
    ['{3E4A48DE-61AF-4B2A-84C0-E787F0D0C625}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriObjectFieldName')]
  JUriObjectFieldName = interface(JAnnotation)
    ['{A90F2578-76E4-4978-BCD5-5CB7F6C13B22}']
    function value: JString; cdecl;
  end;
  TJUriObjectFieldName = class(TJavaGenericImport<JUriObjectFieldNameClass, JUriObjectFieldName>) end;

  JUriPrimitiveFieldNameClass = interface(JAnnotationClass)
    ['{A5517861-8E09-4969-B8C0-B9D85DE0EBA7}']
  end;

  [JavaSignature('br/com/setis/interfaceautomacao/parser/UriPrimitiveFieldName')]
  JUriPrimitiveFieldName = interface(JAnnotation)
    ['{D70F33FB-DA45-4841-BD13-E8003B2C3DA1}']
    function value: JString; cdecl;
  end;
  TJUriPrimitiveFieldName = class(TJavaGenericImport<JUriPrimitiveFieldNameClass, JUriPrimitiveFieldName>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JAnimator', TypeInfo(InterfaceAutomacao_v2_1.JAnimator));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JAnimator_AnimatorListener', TypeInfo(InterfaceAutomacao_v2_1.JAnimator_AnimatorListener));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JAnimator_AnimatorPauseListener', TypeInfo(InterfaceAutomacao_v2_1.JAnimator_AnimatorPauseListener));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JKeyframe', TypeInfo(InterfaceAutomacao_v2_1.JKeyframe));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JLayoutTransition', TypeInfo(InterfaceAutomacao_v2_1.JLayoutTransition));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JLayoutTransition_TransitionListener', TypeInfo(InterfaceAutomacao_v2_1.JLayoutTransition_TransitionListener));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JPropertyValuesHolder', TypeInfo(InterfaceAutomacao_v2_1.JPropertyValuesHolder));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JStateListAnimator', TypeInfo(InterfaceAutomacao_v2_1.JStateListAnimator));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTimeInterpolator', TypeInfo(InterfaceAutomacao_v2_1.JTimeInterpolator));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTypeConverter', TypeInfo(InterfaceAutomacao_v2_1.JTypeConverter));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTypeEvaluator', TypeInfo(InterfaceAutomacao_v2_1.JTypeEvaluator));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JValueAnimator', TypeInfo(InterfaceAutomacao_v2_1.JValueAnimator));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JValueAnimator_AnimatorUpdateListener', TypeInfo(InterfaceAutomacao_v2_1.JValueAnimator_AnimatorUpdateListener));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JPathMotion', TypeInfo(InterfaceAutomacao_v2_1.JPathMotion));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JScene', TypeInfo(InterfaceAutomacao_v2_1.JScene));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransition', TypeInfo(InterfaceAutomacao_v2_1.JTransition));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransition_EpicenterCallback', TypeInfo(InterfaceAutomacao_v2_1.JTransition_EpicenterCallback));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransition_TransitionListener', TypeInfo(InterfaceAutomacao_v2_1.JTransition_TransitionListener));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransitionManager', TypeInfo(InterfaceAutomacao_v2_1.JTransitionManager));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransitionPropagation', TypeInfo(InterfaceAutomacao_v2_1.JTransitionPropagation));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransitionValues', TypeInfo(InterfaceAutomacao_v2_1.JTransitionValues));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JInterpolator', TypeInfo(InterfaceAutomacao_v2_1.JInterpolator));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JToolbar_LayoutParams', TypeInfo(InterfaceAutomacao_v2_1.JToolbar_LayoutParams));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JAplicacaoNaoInstaladaExcecao', TypeInfo(InterfaceAutomacao_v2_1.JAplicacaoNaoInstaladaExcecao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.Jinterfaceautomacao_BuildConfig', TypeInfo(InterfaceAutomacao_v2_1.Jinterfaceautomacao_BuildConfig));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JCartoes', TypeInfo(InterfaceAutomacao_v2_1.JCartoes));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JComunicacaoServico', TypeInfo(InterfaceAutomacao_v2_1.JComunicacaoServico));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JComunicacaoServico_IncomingHandler', TypeInfo( InterfaceAutomacao_v2_1.JComunicacaoServico_IncomingHandler));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JConfirmacao', TypeInfo(InterfaceAutomacao_v2_1.JConfirmacao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JConfirmacoes', TypeInfo( InterfaceAutomacao_v2_1.JConfirmacoes));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JDadosAutomacao', TypeInfo( InterfaceAutomacao_v2_1.JDadosAutomacao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JEntradaTransacao', TypeInfo( InterfaceAutomacao_v2_1.JEntradaTransacao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JFinanciamentos', TypeInfo(InterfaceAutomacao_v2_1.JFinanciamentos));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JGlobalDefs', TypeInfo(InterfaceAutomacao_v2_1.JGlobalDefs));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JIdentificacaoPortadorCarteira', TypeInfo(InterfaceAutomacao_v2_1.JIdentificacaoPortadorCarteira));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JModalidadesPagamento', TypeInfo(InterfaceAutomacao_v2_1.JModalidadesPagamento));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JModalidadesTransacao', TypeInfo(InterfaceAutomacao_v2_1.JModalidadesTransacao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JOperacoes', TypeInfo(InterfaceAutomacao_v2_1.JOperacoes));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JPersonalizacao', TypeInfo( InterfaceAutomacao_v2_1.JPersonalizacao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JPersonalizacao_1', TypeInfo(InterfaceAutomacao_v2_1.JPersonalizacao_1));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JPersonalizacao_Builder', TypeInfo(InterfaceAutomacao_v2_1.JPersonalizacao_Builder));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JProvedores', TypeInfo(InterfaceAutomacao_v2_1.JProvedores));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JQuedaConexaoTerminalExcecao', TypeInfo( InterfaceAutomacao_v2_1.JQuedaConexaoTerminalExcecao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JSaidaTransacao', TypeInfo( InterfaceAutomacao_v2_1.JSaidaTransacao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JStatusTransacao', TypeInfo( InterfaceAutomacao_v2_1.JStatusTransacao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransacao', TypeInfo( InterfaceAutomacao_v2_1.JTransacao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransacaoPendenteDados', TypeInfo(InterfaceAutomacao_v2_1.JTransacaoPendenteDados));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransacoes', TypeInfo(InterfaceAutomacao_v2_1.JTransacoes));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransacoes_1', TypeInfo(InterfaceAutomacao_v2_1.JTransacoes_1));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransacoes_TransacaoResultReceiver', TypeInfo(InterfaceAutomacao_v2_1.JTransacoes_TransacaoResultReceiver));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JVersoes', TypeInfo(InterfaceAutomacao_v2_1.JVersoes));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JViasImpressao', TypeInfo(InterfaceAutomacao_v2_1.JViasImpressao));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JCustomization', TypeInfo(InterfaceAutomacao_v2_1.JCustomization));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JPendingTransactionData', TypeInfo(InterfaceAutomacao_v2_1.JPendingTransactionData));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JPosData', TypeInfo(InterfaceAutomacao_v2_1.JPosData));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransactionConfirmation', TypeInfo(InterfaceAutomacao_v2_1.JTransactionConfirmation));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransactionInput', TypeInfo(InterfaceAutomacao_v2_1.JTransactionInput));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JTransactionOutput', TypeInfo( InterfaceAutomacao_v2_1.JTransactionOutput));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JDateParser', TypeInfo( InterfaceAutomacao_v2_1.JDateParser));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JEnumType', TypeInfo( InterfaceAutomacao_v2_1.JEnumType));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JInputParser', TypeInfo(InterfaceAutomacao_v2_1.JInputParser));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JOutputParser', TypeInfo( InterfaceAutomacao_v2_1.JOutputParser));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.Jparser_ParseException', TypeInfo(InterfaceAutomacao_v2_1.Jparser_ParseException));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JUriArrayFieldName', TypeInfo(InterfaceAutomacao_v2_1.JUriArrayFieldName));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.Jparser_UriClass', TypeInfo(InterfaceAutomacao_v2_1.Jparser_UriClass));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JUriCustomizeFieldName', TypeInfo(InterfaceAutomacao_v2_1.JUriCustomizeFieldName));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JUriDateFieldName', TypeInfo(InterfaceAutomacao_v2_1.JUriDateFieldName));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JUriEnumFieldName', TypeInfo(InterfaceAutomacao_v2_1.JUriEnumFieldName));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JUriFileFieldName', TypeInfo(InterfaceAutomacao_v2_1.JUriFileFieldName));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JUriMethodName', TypeInfo( InterfaceAutomacao_v2_1.JUriMethodName));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JUriObjectFieldName', TypeInfo( InterfaceAutomacao_v2_1.JUriObjectFieldName));
  TRegTypes.RegisterType('InterfaceAutomacao_v2_1.JUriPrimitiveFieldName', TypeInfo( InterfaceAutomacao_v2_1.JUriPrimitiveFieldName));
end;

initialization
  RegisterTypes;
end.

