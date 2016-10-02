object KMP: TKMP
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Knutt-Morris-Pratt substring searching example'
  ClientHeight = 285
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object stLbl: TLabel
    Left = 16
    Top = 16
    Width = 26
    Height = 13
    Caption = 'Text:'
  end
  object ssLbl: TLabel
    Left = 16
    Top = 175
    Width = 49
    Height = 13
    Caption = 'Substring:'
  end
  object pfx: TLabel
    Left = 16
    Top = 293
    Width = 24
    Height = 13
    Caption = 'Info:'
  end
  object SText: TMemo
    Left = 16
    Top = 35
    Width = 601
    Height = 134
    TabOrder = 0
  end
  object Substring: TEdit
    Left = 16
    Top = 194
    Width = 601
    Height = 21
    TabOrder = 1
  end
  object searchBtn: TButton
    Left = 16
    Top = 221
    Width = 601
    Height = 35
    Caption = 'Search'
    TabOrder = 2
    OnClick = searchBtnClick
  end
  object Button1: TButton
    Left = 16
    Top = 262
    Width = 601
    Height = 13
    Caption = '...'
    TabOrder = 3
    OnClick = Button1Click
  end
  object vprefix: TMemo
    Left = 16
    Top = 312
    Width = 601
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 4
  end
end
