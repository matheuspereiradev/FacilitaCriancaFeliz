unit uRecuperar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmRecuperar = class(TForm)
    Label1: TLabel;
    dbRec: TDBGrid;
    qryRec: TADOQuery;
    DataSource1: TDataSource;
    qry2: TADOQuery;
    procedure dbRecDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    operacao:char;
    constructor Create(AOwner : TComponent; paramOP:char);
    procedure pesquisarCrianca;
    procedure pesquisarGrupo;
    procedure pesquisarVisita;
    procedure atualizaCrianca;
    procedure atualizaGrupo;
    procedure atualizaVisita;
  end;

var
  frmRecuperar: TfrmRecuperar;

implementation

{$R *.dfm}

uses UMenu;

{ TfrmRecuperar }

procedure TfrmRecuperar.atualizaCrianca;
begin
    qry2.Close;
    with qry2.SQL do
    begin
      clear;
      add('UPDATE crianca set dtExcluido = null');
      add('where idCrianca='+dbRec.DataSource.DataSet.FieldByName('idCrianca').AsString);
    end;
    qry2.ExecSQL;
    pesquisarCrianca;
end;

procedure TfrmRecuperar.atualizaGrupo;
begin
    qry2.Close;
    with qry2.SQL do
    begin
      clear;
      add('UPDATE grupo set dtExcluido = null');
      add('where idGrupo='+dbRec.DataSource.DataSet.FieldByName('idGrupo').AsString);
    end;
    qry2.ExecSQL;
    pesquisarGrupo
end;

procedure TfrmRecuperar.atualizaVisita;
begin
    qry2.Close;
    with qry2.SQL do
    begin
      clear;
      add('UPDATE visita set dtExcluido = null');
      add('where idVisita='+dbRec.DataSource.DataSet.FieldByName('idVisita').AsString);
    end;
    qry2.ExecSQL;
    pesquisarVisita;
end;

constructor TfrmRecuperar.Create(AOwner: TComponent; paramOP: char);
begin
    inherited Create(AOwner);
    operacao:=paramOP;
     if paramOP='c' then
     begin
       pesquisarCrianca;
     end
     else if paramOP='g' then
     begin
         pesquisarGrupo;
     end else if paramOP='v' then
     begin
         pesquisarVisita;
     end;
end;

procedure TfrmRecuperar.dbRecDblClick(Sender: TObject);
begin
    if operacao='c' then
     begin
       atualizaCrianca;
     end
     else if operacao='g' then
     begin
         atualizaGrupo;
     end else if operacao='v' then
     begin
         atualizaVisita;
     end;
end;

procedure TfrmRecuperar.pesquisarCrianca;
begin
    qryRec.Close;
    with qryRec.SQL do
    begin
      clear;
      add('select * from crianca where dtExcluido is not null');
      add('and idVisitador='+frmMenu.idUsuario);
    end;
    qryRec.Open;
end;

procedure TfrmRecuperar.pesquisarGrupo;
begin
    qryRec.Close;
    with qryRec.SQL do
    begin
      clear;
      add('select * from grupo where dtExcluido is not null');
      add('and idVisitador='+frmMenu.idUsuario);
    end;
    qryRec.Open;
end;

procedure TfrmRecuperar.pesquisarVisita;
begin
    qryRec.Close;
    with qryRec.SQL do
    begin
      clear;
      add('select * from visita where dtExcluido is not null');
      add('and idVisitador='+frmMenu.idUsuario);
    end;
    qryRec.Open;
end;

end.
