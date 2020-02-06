program Facilita;

uses
  Vcl.Forms,
  ULogin in 'ULogin.pas' {frmLogin},
  UMenu in 'UMenu.pas' {frmMenu},
  UGrupos in 'UGrupos.pas' {frmGerGrupos},
  UCadGrupo in 'UCadGrupo.pas' {frmCadEdtGrupo},
  UCriancas in 'UCriancas.pas' {frmGerCriancas},
  UCadEdtCrianca in 'UCadEdtCrianca.pas' {frmCadEdtCrianca},
  UCadRelatorio in 'UCadRelatorio.pas' {frmCadRelatorio},
  UGerRelatorios in 'UGerRelatorios.pas' {frmGerRelatorios},
  UImprimirRelatorio in 'UImprimirRelatorio.pas' {frmGerarRelatorio},
  UEntrarConfig in 'UEntrarConfig.pas' {frmEntrarConfig},
  UConfig in 'UConfig.pas' {frmConfig},
  UEdtSenha in 'UEdtSenha.pas' {frmEdtSenha},
  uConnection in 'uConnection.pas',
  uConfigCon in 'uConfigCon.pas' {frmConfuguraCon},
  uSelVisitas in 'uSelVisitas.pas' {frmSelecionarRel},
  uScriptSQL in 'uScriptSQL.pas' {frmExecScript},
  uConsSQL in 'uConsSQL.pas' {frmConsSQL},
  uVisitador in 'uVisitador.pas' {frmVisitador},
  uRecuperar in 'uRecuperar.pas' {frmRecuperar},
  uGeral in 'uGeral.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmExecScript, frmExecScript);
  Application.CreateForm(TfrmConsSQL, frmConsSQL);
  Application.CreateForm(TfrmVisitador, frmVisitador);
  Application.CreateForm(TfrmRecuperar, frmRecuperar);
  Application.Run;
end.
