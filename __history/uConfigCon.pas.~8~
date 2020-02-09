unit uConfigCon;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,IniFiles;

type
  TfrmConfuguraCon = class(TForm)
    edtUser: TEdit;
    Label1: TLabel;
    edtSenha: TEdit;
    Label2: TLabel;
    edtBanco: TEdit;
    Label3: TLabel;
    edtServidor: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtEstacao: TEdit;
    btnSalvar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfuguraCon: TfrmConfuguraCon;

implementation

{$R *.dfm}

procedure TfrmConfuguraCon.btnSalvarClick(Sender: TObject);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create('C:\CriancaFeliz\configPCF.ini');
  try
    ArqIni.WriteString('Configuracoes', 'user', edtUser.Text);
    ArqIni.WriteString('Configuracoes', 'senha', edtSenha.Text);
    ArqIni.WriteString('Configuracoes', 'banco', edtBanco.Text);
    ArqIni.WriteString('Configuracoes', 'servidor', edtServidor.Text);
    ArqIni.WriteString('Configuracoes', 'NomeEstacao', edtEstacao.Text);
  finally
    ArqIni.Free;
    ShowMessage('Será necessário reiniciar o programa!');
    frmConfuguraCon.Close;
    Halt(0);
  end;
end;

procedure TfrmConfuguraCon.FormCreate(Sender: TObject);
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create('C:\CriancaFeliz\configPCF.ini');
  try
    edtUser.Text := ArqIni.ReadString('Configuracoes', 'user', '');
    edtSenha.Text:= ArqIni.ReadString('Configuracoes', 'senha', '');
    edtBanco.Text:= ArqIni.ReadString('Configuracoes', 'banco', '');
    edtServidor.Text:= ArqIni.ReadString('Configuracoes', 'servidor', '');
    edtEstacao.Text:= ArqIni.ReadString('Configuracoes', 'NomeEstacao', '');
  finally
    ArqIni.Free;
  end;
end;

end.
