unit UGerRelatorios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmGerRelatorios = class(TForm)
    dbgRelatorios: TDBGrid;
    lblTitulo: TLabel;
    btnCadRelatorio: TButton;
    btnEdtRel: TButton;
    btnExcluirRel: TButton;
    dtsRelatorio: TDataSource;
    qryRelatorios: TADOQuery;
    Label3: TLabel;
    Label2: TLabel;
    cbxMes: TComboBox;
    cbxAno: TComboBox;
    btnPesquisar: TButton;
    Button1: TButton;
    lblTotal: TLabel;
    qryOperacoesRelatorio: TADOQuery;
    Label24343: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pesquisarRelatorios;
    procedure excluirRelatorio;
    procedure btnPesquisarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnExcluirRelClick(Sender: TObject);
    procedure btnCadRelatorioClick(Sender: TObject);
    procedure btnEdtRelClick(Sender: TObject);
    procedure dbgRelatoriosDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGerRelatorios: TfrmGerRelatorios;

implementation

{$R *.dfm}

uses UMenu, UCadRelatorio;

procedure TfrmGerRelatorios.btnCadRelatorioClick(Sender: TObject);
    begin
        frmCadRelatorio:=TfrmCadRelatorio.Create(self,'c','0');
        frmCadRelatorio.ShowModal;
    end;

procedure TfrmGerRelatorios.btnEdtRelClick(Sender: TObject);
    begin
        frmCadRelatorio:=TfrmCadRelatorio.Create(self,'e',dbgRelatorios.DataSource.DataSet.FieldByName('idVisita').AsString);
        frmCadRelatorio.ShowModal;
    end;

procedure TfrmGerRelatorios.btnExcluirRelClick(Sender: TObject);
    begin
        try
         excluirRelatorio;
        except
           on e:exception do
           ShowMessage('Erro ao excluir relatório: '+e.Message);
        end;
    end;

procedure TfrmGerRelatorios.btnPesquisarClick(Sender: TObject);
    begin
       pesquisarRelatorios;
    end;

procedure TfrmGerRelatorios.Button1Click(Sender: TObject);
    begin
        pesquisarRelatorios;
    end;

procedure TfrmGerRelatorios.dbgRelatoriosDblClick(Sender: TObject);
    begin
        frmCadRelatorio:=TfrmCadRelatorio.Create(self,'v',dbgRelatorios.DataSource.DataSet.FieldByName('idVisita').AsString);
        frmCadRelatorio.ShowModal;
    end;

procedure TfrmGerRelatorios.excluirRelatorio;
var botaoSelecionado:integer;
    begin
        botaoSelecionado:= messagedlg('Deseja excluir o relatório '+dbgRelatorios.DataSource.DataSet.FieldByName('idVisita').AsString+'?',mtConfirmation, [mbYes,mbCancel], 0);
        if botaoSelecionado=6 then
            begin
              qryOperacoesRelatorio.Close;
              with qryOperacoesRelatorio do
                begin
                  qryOperacoesRelatorio.SQL.Clear;
                  qryOperacoesRelatorio.SQL.Add('update visita set dtExcluido=getdate()');
                  qryOperacoesRelatorio.SQL.Add('where idVisita='+dbgRelatorios.DataSource.DataSet.FieldByName('idVisita').AsString);
                end;
              if qryOperacoesRelatorio.ExecSQL=1 then
                begin
                    ShowMessage('Excluido com sucesso!');
                    pesquisarRelatorios;
                end;

         end;
    end;

procedure TfrmGerRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmGerRelatorios.FormCreate(Sender: TObject);
    begin
        qryRelatorios.Close;
        pesquisarRelatorios;
    end;

procedure TfrmGerRelatorios.pesquisarRelatorios;
    begin
        qryRelatorios.Close;
        with qryRelatorios.SQL do
          begin
             Clear;
             Add('select  v.idVisita ');
             Add('       ,v.tituloVisita ');
             Add('       ,(v.mesVisita+'+QuotedStr('/')+'+CONVERT(varchar, v.anoVisita)) as dataVisita ');
             Add('       ,g.nomeGrupo');
             Add('from visita v      ');
             Add('inner join grupo g on v.idGrupo=g.idGrupo');
             Add('where g.idVisitador='+frmMenu.idUsuario);
             add('and v.dtExcluido is null');
             if cbxMes.ItemIndex<>0 then
                begin
                    case cbxMes.ItemIndex of
                        1: Add('and v.mesVisita='+QuotedStr('JAN'));
                        2: Add('and v.mesVisita='+QuotedStr('FEV'));
                        3: Add('and v.mesVisita='+QuotedStr('MAR'));
                        4: Add('and v.mesVisita='+QuotedStr('ABR'));
                        5: Add('and v.mesVisita='+QuotedStr('MAI'));
                        6: Add('and v.mesVisita='+QuotedStr('JUN'));
                        7: Add('and v.mesVisita='+QuotedStr('JUL'));
                        8: Add('and v.mesVisita='+QuotedStr('AGO'));
                        9: Add('and v.mesVisita='+QuotedStr('SET'));
                        10:Add('and v.mesVisita='+QuotedStr('OUT'));
                        11:Add('and v.mesVisita='+QuotedStr('NOV'));
                        12:Add('and v.mesVisita='+QuotedStr('DEZ'));
                    end;
                end;
             if cbxAno.ItemIndex<>0 then
                begin
                    case cbxAno.ItemIndex of
                       1: qryRelatorios.SQL.Add('and v.anoVisita='+inttostr(2019));
                       2: qryRelatorios.SQL.Add('and v.anoVisita='+inttostr(2020));
                    end;
                end;
              qryRelatorios.SQL.Add('order by v.dtVisita');
          end;
          qryRelatorios.Open;
          lblTotal.Caption:='Total de relatórios:'+inttostr(qryRelatorios.RecordCount);
          if qryRelatorios.RecordCount>0 then
          begin
            btnEdtRel.Enabled:=true;
            btnExcluirRel.Enabled:=true;
          end
          else
          begin
             btnEdtRel.Enabled:=false;
            btnExcluirRel.Enabled:=false;
          end;
    end;

end.
