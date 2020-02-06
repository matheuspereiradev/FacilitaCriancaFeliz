object frmRecuperar: TfrmRecuperar
  Left = 0
  Top = 0
  Caption = 'Recuperar'
  ClientHeight = 462
  ClientWidth = 731
  Color = clMenuHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 8
    Width = 302
    Height = 19
    Caption = 'Clique duas vezes para restaurar o registro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dbRec: TDBGrid
    Left = 8
    Top = 48
    Width = 715
    Height = 406
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbRecDblClick
  end
  object qryRec: TADOQuery
    Connection = frmMenu.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from crianca where dtExcluido is not null')
    Left = 592
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = qryRec
    Left = 544
    Top = 8
  end
  object qry2: TADOQuery
    Connection = frmMenu.conexao
    Parameters = <>
    Left = 656
    Top = 32
  end
end
