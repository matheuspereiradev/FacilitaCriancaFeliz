object frmCadEdtGrupo: TfrmCadEdtGrupo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastrar/editar grupo'
  ClientHeight = 216
  ClientWidth = 361
  Color = clMenuHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 26
    Top = 48
    Width = 72
    Height = 18
    Caption = 'C'#243'd. grupo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 26
    Top = 106
    Width = 102
    Height = 18
    Caption = 'Nome do grupo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTitulo: TLabel
    Left = 118
    Top = 8
    Width = 153
    Height = 22
    Caption = 'Cadastrar grupo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNomeGrupo: TEdit
    Left = 26
    Top = 125
    Width = 303
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtCodGrupo: TEdit
    Left = 26
    Top = 69
    Width = 119
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnSalvarGrupo: TButton
    Left = 118
    Top = 168
    Width = 139
    Height = 40
    Cursor = crHandPoint
    Caption = 'SALVAR'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ImageIndex = 5
    ImageMargins.Left = 8
    Images = frmMenu.cxImageList1
    ParentFont = False
    TabOrder = 2
    OnClick = btnSalvarGrupoClick
  end
  object qryPesqGrupo: TADOQuery
    Connection = frmMenu.conexao
    Parameters = <>
    Left = 280
    Top = 48
  end
end
