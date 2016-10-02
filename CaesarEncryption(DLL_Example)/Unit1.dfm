object Form1: TForm1
  Left = 1131
  Top = 243
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Caesar'
  ClientHeight = 240
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 19
    Width = 38
    Height = 13
    Caption = 'Key (k):'
  end
  object bruteLBl: TLabel
    Left = 16
    Top = 280
    Width = 30
    Height = 13
    Caption = 'Brute:'
  end
  object bvl1: TBevel
    Left = 16
    Top = 264
    Width = 505
    Height = 1
  end
  object encBtn: TButton
    Left = 16
    Top = 88
    Width = 249
    Height = 33
    Caption = 'Encrypt'
    TabOrder = 0
    OnClick = encBtnClick
  end
  object decBtn: TButton
    Left = 272
    Top = 88
    Width = 249
    Height = 33
    Caption = 'Decrypt'
    TabOrder = 1
    OnClick = decBtnClick
  end
  object frText: TEdit
    Left = 16
    Top = 56
    Width = 505
    Height = 21
    TabOrder = 2
  end
  object toText: TEdit
    Left = 16
    Top = 136
    Width = 505
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object key: TEdit
    Left = 64
    Top = 16
    Width = 41
    Height = 21
    TabOrder = 4
  end
  object moreBtn: TButton
    Left = 16
    Top = 208
    Width = 505
    Height = 17
    Caption = 'More'
    TabOrder = 5
    OnClick = moreBtnClick
  end
  object bruteBtn: TButton
    Left = 16
    Top = 488
    Width = 505
    Height = 25
    Caption = 'Brute'
    TabOrder = 6
    OnClick = bruteBtnClick
  end
  object brute: TListBox
    Left = 16
    Top = 304
    Width = 505
    Height = 177
    ItemHeight = 13
    TabOrder = 7
  end
  object clr: TButton
    Left = 444
    Top = 280
    Width = 75
    Height = 17
    Caption = 'Clear'
    TabOrder = 8
    OnClick = clrClick
  end
end
