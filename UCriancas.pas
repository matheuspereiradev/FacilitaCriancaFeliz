unit UCriancas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmGerCriancas = class(TForm)
    lblTitulo: TLabel;
    btnCadCrianca: TButton;
    btnEdtCrianca: TButton;
    btnExcCriancas: TButton;
    dbgCriancas: TDBGrid;
    qryCriancas: TADOQuery;
    dtsCriancas: TDataSource;
    btnAtualizar: TButton;
    lblTotalCriancas: TLabel;
    qryOperacoesCrianca: TADOQuery;
    Image1: TImage;
    Image2: TImage;
    procedure pesquisarCriancas;
    procedure ExcluirCrianca;
    procedure btnAtualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcCriancasClick(Sender: TObject);
    procedure btnCadCriancaClick(Sender: TObject);
    procedure btnEdtCriancaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerCriancas: TfrmGerCriancas;

implementation

{$R *.dfm}

uses UMenu, UCadCrianca, UCadEdtCrianca;

procedure TfrmGerCriancas.btnAtualizarClick(Sender: TObject);
    begin
        pesquisarCriancas;
    end;

procedure TfrmGerCriancas.btnCadCriancaClick(Sender: TObject);
    begin
        frmCadEdtCrianca:=TfrmCadEdtCrianca.Create(self,'c','0');
        frmCadEdtCrianca.ShowModal;
    end;

procedure TfrmGerCriancas.btnEdtCriancaClick(Sender: TObject);
    begin
        frmCadEdtCrianca:=TfrmCadEdtCrianca.Create(self,'e',dbgCriancas.DataSource.DataSet.FieldByName('idCrianca').AsString);
        frmCadEdtCrianca.ShowModal;
    end;

procedure TfrmGerCriancas.btnExcCriancasClick(Sender: TObject);
    begin
        try
         ExcluirCrianca;
        except
           on e:exception do
           ShowMessage('Erro ao excluir crian�a: '+e.Message);
        end;
    end;

procedure TfrmGerCriancas.ExcluirCrianca;
var botaoSelecionado:integer;
    begin
        botaoSelecionado:= messagedlg('Deseja excluir o a crian�a '+dbgCriancas.DataSource.DataSet.FieldByName('nomeCrianca').AsString+'?',mtConfirmation, [mbYes,mbCancel], 0);
        if botaoSelecionado=6 then
            begin
              qryOperacoesCrianca.Close;
              with qryOperacoesCrianca do
                begin
                  qryOperacoesCrianca.SQL.Clear;
                  qryOperacoesCrianca.SQL.Add('delete crianca');
                  qryOperacoesCrianca.SQL.Add('where idCrianca='+dbgCriancas.DataSource.DataSet.FieldByName('idCrianca').AsString);
                end;
              if qryOperacoesCrianca.ExecSQL=1 then
                begin
                    ShowMessage('Excluido com sucesso!');
                    pesquisarCriancas;
                end;

         end;
    end;

procedure TfrmGerCriancas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmGerCriancas.FormCreate(Sender: TObject);
    begin
        qryCriancas.Close;
        pesquisarCriancas;
    end;

procedure TfrmGerCriancas.pesquisarCriancas;
    begin
        qryCriancas.Close;
        with qryCriancas do
          begin
              qryCriancas.SQL.Clear;
              qryCriancas.SQL.Add('select *                                 ');
              qryCriancas.SQL.Add('from vwCriancaGrupo c                    ');
              qryCriancas.SQL.Add('where c.idVisitador='+frmMenu.idUsuario);
          end;
        qryCriancas.Open;
        lblTotalCriancas.Caption:= 'Total de crian�as: '+IntToStr(qryCriancas.RecordCount);
    end;

end.
