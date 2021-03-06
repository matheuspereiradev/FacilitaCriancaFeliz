object frmGerRelatorios: TfrmGerRelatorios
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Gerenciar Relat'#243'rios'
  ClientHeight = 517
  ClientWidth = 721
  Color = clMenuHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TLabel
    Left = 288
    Top = 2
    Width = 175
    Height = 22
    Caption = 'Gerenciar relat'#243'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 458
    Top = 59
    Width = 27
    Height = 16
    Caption = 'M'#234's:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 547
    Top = 59
    Width = 26
    Height = 16
    Caption = 'Ano:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTotal: TLabel
    Left = 579
    Top = 487
    Width = 117
    Height = 13
    Caption = 'Total de relat'#243'rios: 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label24343: TLabel
    Left = 256
    Top = 26
    Width = 225
    Height = 13
    Caption = 'Clique duas vezes para obter mais informa'#231#245'es'
  end
  object dbgRelatorios: TDBGrid
    Left = 8
    Top = 88
    Width = 707
    Height = 393
    DataSource = dtsRelatorio
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = dbgRelatoriosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'idVisita'
        Title.Caption = 'C'#243'd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tituloVisita'
        Title.Caption = 'Titulo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'dataVisita'
        Title.Caption = 'Data'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeGrupo'
        Title.Caption = 'Grupo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 190
        Visible = True
      end>
  end
  object btnCadRelatorio: TButton
    Left = 8
    Top = 40
    Width = 139
    Height = 42
    Cursor = crHandPoint
    Caption = 'Criar relat'#243'rio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ImageIndex = 7
    Images = frmMenu.cxImageList1
    ParentFont = False
    TabOrder = 1
    OnClick = btnCadRelatorioClick
  end
  object btnEdtRel: TButton
    Left = 149
    Top = 40
    Width = 146
    Height = 42
    Cursor = crHandPoint
    Caption = 'Editar relat'#243'rio'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ImageIndex = 9
    Images = frmMenu.cxImageList1
    ParentFont = False
    TabOrder = 2
    OnClick = btnEdtRelClick
  end
  object btnExcluirRel: TButton
    Left = 297
    Top = 40
    Width = 159
    Height = 42
    Cursor = crHandPoint
    Caption = 'Excluir relat'#243'rio'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ImageIndex = 8
    Images = frmMenu.cxImageList1
    ParentFont = False
    TabOrder = 3
    OnClick = btnExcluirRelClick
  end
  object cbxMes: TComboBox
    Left = 488
    Top = 54
    Width = 54
    Height = 21
    ItemIndex = 0
    TabOrder = 4
    Text = 'TODOS'
    Items.Strings = (
      'TODOS'
      'JAN'
      'FEV'
      'MAR'
      'ABR'
      'MAI'
      'JUN'
      'JUL'
      'AGO'
      'SET'
      'OUT'
      'NOV'
      'DEZ')
  end
  object cbxAno: TComboBox
    Left = 576
    Top = 54
    Width = 57
    Height = 21
    ItemIndex = 0
    TabOrder = 5
    Text = 'TODOS'
    Items.Strings = (
      'TODOS'
      '2019'
      '2020')
  end
  object btnPesquisar: TButton
    Left = 639
    Top = 48
    Width = 74
    Height = 28
    Cursor = crHandPoint
    Caption = 'buscar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ImageIndex = 12
    Images = frmMenu.cxImageList1
    ParentFont = False
    TabOrder = 6
    OnClick = btnPesquisarClick
  end
  object Button1: TButton
    Left = 8
    Top = 485
    Width = 97
    Height = 28
    Caption = 'Atualizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImageIndex = 13
    Images = frmMenu.cxImageList1
    ParentFont = False
    TabOrder = 7
    OnClick = Button1Click
  end
  object dtsRelatorio: TDataSource
    DataSet = qryRelatorios
    Left = 544
  end
  object qryRelatorios: TADOQuery
    Connection = frmMenu.conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  v.idVisita '
      #9'  ,'#9'v.tituloVisita'
      
        #9'  , (v.mesVisita+'#39'/'#39'+CONVERT(varchar, v.anoVisita)) as '#39'dataVis' +
        'ita'#39
      #9'  , g.nomeGrupo'
      'from visita v'
      'inner join grupo g on v.idGrupo=g.idGrupo'
      'where g.idVisitador=1')
    Left = 608
  end
  object qryOperacoesRelatorio: TADOQuery
    Connection = frmMenu.conexao
    Parameters = <>
    Left = 72
  end
end
