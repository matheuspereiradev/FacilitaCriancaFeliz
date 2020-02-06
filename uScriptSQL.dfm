object frmExecScript: TfrmExecScript
  Left = 0
  Top = 0
  Caption = 'EXECUTAR SCRIPT'
  ClientHeight = 451
  ClientWidth = 834
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtScript: TMemo
    Left = 8
    Top = 39
    Width = 818
    Height = 404
    TabOrder = 0
  end
  object btnExec: TButton
    Left = 8
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Executar'
    TabOrder = 1
    OnClick = btnExecClick
  end
end
