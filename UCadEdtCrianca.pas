unit UCadEdtCrianca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadEdtCrianca = class(TForm)
    lblTitulo: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edtCodCrianca: TEdit;
    edtNome: TEdit;
    edtNIS: TEdit;
    dtNasc: TDateTimePicker;
    edtTerritorioCrianca: TEdit;
    cbxGrupos: TComboBox;
    btnSalvarCrianca: TButton;
    Label6: TLabel;
    qryCrianca: TADOQuery;
    Label2: TLabel;
    procedure carregarGrupos;
    procedure carregarDados;
    procedure btnSalvarCriancaClick(Sender: TObject);
    procedure salvarNovaCrianca;
    procedure salvarEdicaoCrianca;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    idCrianca:string;
    operacao:char;
  public
    constructor Create(AOwner : TComponent; paramOP:char; paramId:string);
  end;

var
  frmCadEdtCrianca: TfrmCadEdtCrianca;

implementation

{$R *.dfm}

uses UMenu;

{ TfrmCadEdtCrianca }

procedure TfrmCadEdtCrianca.btnSalvarCriancaClick(Sender: TObject);
    begin
        if operacao='c' then
              begin
                    try
                      salvarNovaCrianca;
                    except
                       on e:exception do
                       ShowMessage('Erro: '+e.Message);
                    end;
              end
        else if operacao = 'e' then
              begin
                    try
                       salvarEdicaoCrianca;
                    except
                       on e:exception do
                       ShowMessage('Erro: '+e.Message);
                    end;
              end
    end;

procedure TfrmCadEdtCrianca.carregarDados;
    begin
        qryCrianca.Close;
        with qryCrianca do
        begin
          qryCrianca.SQL.Clear;
          qryCrianca.SQL.Add('select c.idCrianca, c.nomeCrianca, c.nisCrianca, c.territorioCrianca,c.idGrupo,');
          qryCrianca.SQL.Add('concat(DAY(c.dtNascCrianca),'+QuotedStr('/')+',MONTH(c.dtNascCrianca),'+QuotedStr('/')+', YEAR(c.dtNascCrianca)) as data');
          qryCrianca.SQL.Add('from crianca c');
          qryCrianca.SQL.Add('where idCrianca='+idCrianca);
        end;
        qryCrianca.Open;
        edtNome.Text:=qryCrianca.FieldByName('nomeCrianca').AsString;
        edtNis.Text:=qryCrianca.FieldByName('nisCrianca').AsString;
        edtTerritorioCrianca.Text:=qryCrianca.FieldByName('territorioCrianca').AsString;
        dtNasc.date:= StrToDate( qryCrianca.FieldByName('data').AsString );
    end;

procedure TfrmCadEdtCrianca.carregarGrupos;
var i:integer;
    begin
       qryCrianca.Close;
       with qryCrianca do
       begin
         qryCrianca.SQL.Add('select g.idGrupo         ');
         qryCrianca.SQL.Add('      ,g.nomeGrupo       ');
         qryCrianca.SQL.Add('from grupo g             ');
         qryCrianca.SQL.Add('where g.idVisitador='+frmMenu.idUsuario);
       end;
       qryCrianca.Open;

       i:=0;
       while i<qryCrianca.RecordCount do
       begin
         cbxGrupos.Items.AddObject( qryCrianca.FieldByName('nomeGrupo').asString,
          tObject(qryCrianca.FieldByName('idGrupo').asInteger) );
         qryCrianca.Next;
         i:=i+1;
       end;
       cbxGrupos.ItemIndex:=0;
    end;

constructor TfrmCadEdtCrianca.Create(AOwner: TComponent; paramOP: char;
  paramId: string);
    begin
        inherited Create(AOwner);
        operacao:=paramOP;
        carregarGrupos;
        if operacao='e' then
          begin
             idCrianca:=paramId;
             edtCodCrianca.Text:=idCrianca;
             lblTitulo.Caption:='Editar criança';
             carregarDados;
          end;

    end;

procedure TfrmCadEdtCrianca.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCadEdtCrianca.salvarEdicaoCrianca;
    begin
        qryCrianca.close;
        with qryCrianca do
          begin
              qryCrianca.SQL.Clear;
              qryCrianca.SQL.Add('UPDATE crianca ');
              qryCrianca.SQL.Add('set nomeCrianca='+QuotedStr(edtNome.Text));
              qryCrianca.SQL.Add(',dtNascCrianca='+QuotedStr(DateToStr(dtNasc.Date)));
              qryCrianca.SQL.Add(',nisCrianca='+QuotedStr(edtNis.text));
              qryCrianca.SQL.Add(',territorioCrianca='+QuotedStr(edtTerritorioCrianca.text));
              qryCrianca.SQL.Add(',idGrupo='+inttostr(Integer(cbxGrupos.items.objects[cbxGrupos.ItemIndex])));
              qryCrianca.SQL.Add('where idCrianca='+idCrianca);
          end;
        if qryCrianca.ExecSQL=1 then
          begin
             ShowMessage('Editado com sucesso');
             frmCadEdtCrianca.Close;
          end;
    end;

procedure TfrmCadEdtCrianca.salvarNovaCrianca;
    begin
        qryCrianca.Close;
        with qryCrianca do
        begin
          qryCrianca.SQL.Clear;
          qryCrianca.SQL.Add('insert into crianca ');
          qryCrianca.SQL.Add('(nomeCrianca,dtNascCrianca,nisCrianca,');
          qryCrianca.SQL.Add('territorioCrianca,idGrupo)');
          qryCrianca.SQL.Add('values ('+QuotedStr(edtNome.Text));
          qryCrianca.SQL.Add(','+QuotedStr(DateToStr(dtNasc.Date)));
          qryCrianca.SQL.Add(','+QuotedStr(edtNIS.text));
          qryCrianca.SQL.Add(','+QuotedStr(edtTerritorioCrianca.text));
          qryCrianca.SQL.Add(','+inttostr(Integer(cbxGrupos.items.objects[cbxGrupos.ItemIndex]))+')');
        end;
        if qryCrianca.ExecSQL=1 then
          begin
             ShowMessage('Cadastrado com sucesso');
             frmCadEdtCrianca.Close;
          end;
    end;

end.
