unit UEntrarConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Mask;

type
  TfrmEntrarConfig = class(TForm)
    Button1: TButton;
    qryAbrirConfig: TADOQuery;
    edtSenha: TMaskEdit;
    procedure Button1Click(Sender: TObject);
    procedure verificarSenha;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEntrarConfig: TfrmEntrarConfig;

implementation

{$R *.dfm}

uses UMenu, UConfig;

procedure TfrmEntrarConfig.Button1Click(Sender: TObject);
    begin
        if edtSenha.Text<>'' then
          begin
              verificarSenha;
              if qryAbrirConfig.RecordCount=1 then
                begin
                   frmConfig:=TfrmConfig.create(self);
                   frmConfig.ShowModal;
                   frmEntrarConfig.Close;
                end
              else
                ShowMessage('Verifique a senha!');
          end
          else
              ShowMessage('Digite a senha');
    end;

procedure TfrmEntrarConfig.FormClose(Sender: TObject; var Action: TCloseAction);
    begin
       Action := caFree;
    end;

procedure TfrmEntrarConfig.verificarSenha;
    begin
       qryAbrirConfig.Close;
       with qryAbrirConfig do
         begin
           qryAbrirConfig.SQL.Clear;
           qryAbrirConfig.SQL.Add('select v.idVisitador from visitador v where v.idVisitador='+frmMenu.idUsuario);
           qryAbrirConfig.SQL.Add('and v.senhaVisitador='+edtSenha.Text);
         end;
       qryAbrirConfig.Open;
    end;

end.
