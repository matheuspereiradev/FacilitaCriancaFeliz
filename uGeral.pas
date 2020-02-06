unit uGeral;

interface

uses Data.Win.ADODB,Clipbrd;

type
  TGeral = class

  function pegaSQL(qry: TADOQuery):string;
  function volte (sql:String;campo: string):string;
    private
      { private declarations }
    public
      { public declarations }
  end;

implementation

uses UMenu;

{ TGeral }

function TGeral.pegaSQL(qry: TADOQuery): string;
begin
   Clipboard.AsText := qry.SQL.GetText;
   Result :='Copiado para área de tranferência';
end;

function TGeral.volte(sql, campo: string): string;
var qryVolte: TADOQuery;
    resultado:string;
begin
    qryVolte:=TADOQuery.Create(nil);
    qryVolte.Connection:=frmMenu.conexao;
    qryVolte.SQL.Add(sql);
    qryVolte.Open;
    resultado:=qryVolte.FieldByName(campo).AsString;
    qryVolte.Close;

    result:= resultado;
end;

end.
