object Form1: TForm1
  Left = 123
  Top = 194
  Width = 781
  Height = 402
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 53
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 136
    Top = 53
    Width = 54
    Height = 13
    Caption = 'Sobrenome'
  end
  object Label3: TLabel
    Left = 264
    Top = 53
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object Label4: TLabel
    Left = 391
    Top = 50
    Width = 18
    Height = 13
    Caption = 'Site'
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 96
    Width = 740
    Height = 265
    ColCount = 4
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 600
    Top = 8
    Width = 148
    Height = 25
    Caption = 'Excluir Linha Selecionada'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Preecher'
    TabOrder = 2
  end
  object Edit1: TEdit
    Left = 8
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit2: TEdit
    Left = 136
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object Edit3: TEdit
    Left = 264
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object Edit4: TEdit
    Left = 391
    Top = 69
    Width = 357
    Height = 21
    TabOrder = 6
  end
  object Button3: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 7
    OnClick = Button3Click
  end
  object CheckBox1: TCheckBox
    Left = 170
    Top = 12
    Width = 191
    Height = 17
    Caption = 'Inserir na primeira linha'
    TabOrder = 8
  end
  object Button4: TButton
    Left = 456
    Top = 8
    Width = 138
    Height = 25
    Caption = 'Excluir Primeira Linha'
    TabOrder = 9
    OnClick = Button4Click
  end
end
