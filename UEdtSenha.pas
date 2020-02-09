unit UEdtSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Data.DB,
  Data.Win.ADODB, dxGDIPlusClasses, Vcl.ExtCtrls;

type
  TfrmEdtSenha = class(TForm)
    edtSenha1: TMaskEdit;
    Label1: TLabel;
    edtSenha2: TMaskEdit;
    Label2: TLabel;
    Button1: TButton;
    qrySenha: TADOQuery;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure salvarSenha;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEdtSenha: TfrmEdtSenha;

implementation

{$R *.dfm}

uses UMenu;

procedure TfrmEdtSenha.Button1Click(Sender: TObject);
    begin
      if edtSenha1.Text<>'' then
          begin
           if edtSenha1.Text=edtSenha2.Text then
              begin
                 salvarSenha;
              end
            else
              ShowMessage('As senhas não coincidem');
          end
       else
          ShowMessage('Digite a senha');

    end;

procedure TfrmEdtSenha.salvarSenha;
    begin
        qrySenha.Close;
        with qrySenha do
          begin
            qrySenha.SQL.Clear;
            qrySenha.SQL.Add('update visitador set senhaVisitador='+quotedstr(edtSenha1.Text));
            qrySenha.SQL.Add('where idVisitador='+frmMenu.idUsuario);
          end;
         if qrySenha.ExecSQL=1 then
            begin
               ShowMessage('Senha alterada com sucesso');
               frmEdtSenha.Close;
            end
          else
            ShowMessage('Falha ao editar senha');
    end;

end.
