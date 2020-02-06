unit uConsSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Data.Win.ADODB, Vcl.StdCtrls;

type
  TfrmConsSQL = class(TForm)
    edtScript: TMemo;
    qrySQL: TADOQuery;
    dtsSQL: TDataSource;
    DBGrid1: TDBGrid;
    EXECUTAR: TButton;
    procedure EXECUTARClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsSQL: TfrmConsSQL;

implementation

{$R *.dfm}

uses UMenu;

procedure TfrmConsSQL.EXECUTARClick(Sender: TObject);
begin
    qrySQL.Close;
    with qrySQL.SQL do
    begin
      Clear;
      add(edtScript.Lines.Text);
    end;
    qrySQL.Open;
end;

end.
