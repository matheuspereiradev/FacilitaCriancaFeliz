object frmEntrarConfig: TfrmEntrarConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Entrar'
  ClientHeight = 93
  ClientWidth = 292
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
  object Label1: TLabel
    Left = 96
    Top = 8
    Width = 116
    Height = 19
    Caption = 'Digite sua senha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 112
    Top = 60
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Entrar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtSenha: TMaskEdit
    Left = 8
    Top = 33
    Width = 276
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    Text = ''
  end
  object qryAbrirConfig: TADOQuery
    Connection = frmMenu.conexao
    Parameters = <>
    Left = 224
    Top = 40
  end
end
