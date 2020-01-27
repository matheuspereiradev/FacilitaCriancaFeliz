unit UConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Mask;

type
  TfrmConfig = class(TForm)
    edtNome: TEdit;
    edtLogin: TEdit;
    edtCpf: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    qryConfig: TADOQuery;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure preencherCampos;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses UMenu, UEdtSenha;

procedure TfrmConfig.Button1Click(Sender: TObject);
    begin
        qryConfig.Close;
        with qryConfig do
          begin
            qryConfig.SQL.Clear;
            qryConfig.SQL.Add('UPDATE visitador set cpfVisitador ='+quotedstr(edtCpf.Text));
            qryConfig.SQL.Add(', loginVisitador ='+quotedstr(edtLogin.Text));
            qryConfig.SQL.Add(', nomeVisitador ='+quotedstr(edtNome.Text));
            qryConfig.SQL.Add('where idVisitador='+frmMenu.idUsuario);
          end;
         if qryConfig.ExecSQL=1 then
          begin
            ShowMessage('Editado com sucesso!');
            frmConfig.Close;
          end
         else
            ShowMessage('Falha ao editar!');
    end;

procedure TfrmConfig.FormClose(Sender: TObject; var Action: TCloseAction);
    begin
        Action := caFree;
    end;

procedure TfrmConfig.FormCreate(Sender: TObject);
    begin
        preencherCampos;
    end;

procedure TfrmConfig.Label4Click(Sender: TObject);
    begin
        frmEdtSenha:=TfrmEdtSenha.Create(self);
        frmEdtSenha.ShowModal
    end;

procedure TfrmConfig.preencherCampos;
    begin
        qryConfig.Close;
        with qryConfig do
          begin
            qryConfig.SQL.Clear;
            qryConfig.SQL.Add('select v.cpfVisitador, v.loginVisitador, v.nomeVisitador from visitador v where v.idVisitador='+frmMenu.idUsuario);
          end;
         qryConfig.Open;

         edtNome.Text:=qryConfig.FieldByName('nomeVisitador').AsString;
         edtLogin.Text:=qryConfig.FieldByName('loginVisitador').AsString;
         edtCpf.Text:=qryConfig.FieldByName('cpfVisitador').AsString;
    end;

end.
