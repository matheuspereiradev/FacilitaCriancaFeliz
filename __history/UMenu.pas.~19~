unit UMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmMenu = class(TForm)
    conexao: TADOConnection;
    ADOQuery1: TADOQuery;
    lblIdUsr: TLabel;
    btnGerGrupos: TButton;
    btnGerCrianca: TButton;
    Label4: TLabel;
    Label3: TLabel;
    btnRelatorios: TButton;
    edtGeraRelatorios: TButton;
    btnConfig: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnGerGruposClick(Sender: TObject);
    procedure btnGerCriancaClick(Sender: TObject);
    procedure btnRelatoriosClick(Sender: TObject);
    procedure edtGeraRelatoriosClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfigClick(Sender: TObject);
  private
    { Private declarations }
  public
    idUsuario:string;
  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses ULogin, UGrupos, UCriancas, UCadCrianca, UGerRelatorios,
  UImprimirRelatorio, UEntrarConfig;

procedure TfrmMenu.btnConfigClick(Sender: TObject);
    begin
        frmEntrarConfig:=TfrmEntrarConfig.create(self);
        frmEntrarConfig.ShowModal;
    end;

procedure TfrmMenu.btnGerCriancaClick(Sender: TObject);
    begin
       frmGerCriancas:= TfrmGerCriancas.Create(self);
       frmGerCriancas.ShowModal;

    end;

procedure TfrmMenu.btnGerGruposClick(Sender: TObject);
    begin
        frmGerGrupos:= TfrmGerGrupos.Create(self);
        frmGerGrupos.ShowModal;
    end;

procedure TfrmMenu.btnRelatoriosClick(Sender: TObject);
    begin
        frmGerRelatorios:=TfrmGerRelatorios.Create(self);
        frmGerRelatorios.ShowModal;
    end;

procedure TfrmMenu.edtGeraRelatoriosClick(Sender: TObject);
    begin
        frmGerarRelatorio:=TfrmGerarRelatorio.Create(self);
        frmGerarRelatorio.ShowModal;
    end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
    begin
        idUsuario:='';
        while idUsuario='' do
          begin
              frmLogin:=TfrmLogin.Create(self);
              frmLogin.ShowModal;
          end;
       lblIdUsr.Caption:='IdUsr:.'+idUsuario;
       lblIdUsr.Font.Color:=clGreen;
    end;

end.
