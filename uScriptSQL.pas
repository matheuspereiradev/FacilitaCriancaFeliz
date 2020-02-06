unit uScriptSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.Win.ADODB;

type
  TfrmExecScript = class(TForm)
    edtScript: TMemo;
    btnExec: TButton;
    procedure btnExecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure executarSQL;
  end;

var
  frmExecScript: TfrmExecScript;

implementation

{$R *.dfm}

uses UMenu;

procedure TfrmExecScript.btnExecClick(Sender: TObject);
begin
    executarSQL;
end;

procedure TfrmExecScript.executarSQL;
    var ADOCommand : TADOCommand;

begin

    ADOCommand := TADOCommand.Create(nil); //Cria o objeto de comando para executar a rotina de backup do SQL SERVER 2000
    with ADOCommand do begin
    //ADOCommand.Name := 'ADOGeraBackup'; //Nome do objeto
    ADOCommand.ConnectionString := frmMenu.conexao.ConnectionString; //Cria a conexão com o Provider do SQL Server
    //ADOCommand.CommandType := cmdText; //Define como command Text para execução de linhas de comando
    ADOCommand.CommandText := edtScript.Lines.Text;

    try
      begin
         ADOCommand.Execute; //Executa a linha de comando
      end;
    finally
        ShowMessage('SCRIPT EXECUTADO COM SUCESSO');
    end;


  end;
end;

end.
