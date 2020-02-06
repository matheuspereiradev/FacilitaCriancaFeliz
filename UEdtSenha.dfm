object frmEdtSenha: TfrmEdtSenha
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Editar senha'
  ClientHeight = 161
  ClientWidth = 303
  Color = clMenuHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 18
    Width = 68
    Height = 13
    Caption = 'Digite a senha'
  end
  object Label2: TLabel
    Left = 8
    Top = 74
    Width = 125
    Height = 13
    Caption = 'Digite a senha novamente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtSenha1: TMaskEdit
    Left = 8
    Top = 40
    Width = 287
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    Text = ''
  end
  object edtSenha2: TMaskEdit
    Left = 8
    Top = 96
    Width = 287
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
  object Button1: TButton
    Left = 120
    Top = 131
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Salvar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object qrySenha: TADOQuery
    Connection = frmMenu.conexao
    Parameters = <>
    Left = 264
    Top = 8
  end
end
