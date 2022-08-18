object Form1: TForm1
  Left = 355
  Top = 255
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 360
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 185
    Height = 25
    Caption = 'Abrir um arquivo existente'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 8
    Width = 185
    Height = 25
    Caption = 'Criar um novo arquivo'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 40
    Width = 185
    Height = 25
    Caption = 'Inserir todos os dados'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 200
    Top = 40
    Width = 185
    Height = 25
    Caption = 'Inserir dados selecionados'
    TabOrder = 3
    OnClick = Button4Click
  end
  object dbgPaises: TDBGrid
    Left = 8
    Top = 72
    Width = 561
    Height = 281
    DataSource = dtsPaises
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = dbgPaisesDrawColumnCell
  end
  object Button5: TButton
    Left = 392
    Top = 8
    Width = 185
    Height = 25
    Caption = 'Inserir uma imagem'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 392
    Top = 40
    Width = 185
    Height = 25
    Caption = 'Abrir um arquivo protegido'
    TabOrder = 6
    OnClick = Button6Click
  end
  object BitBtn1: TBitBtn
    Left = 504
    Top = 328
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 7
  end
  object xlsApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 208
    Top = 120
  end
  object opgDialogo: TOpenDialog
    Left = 32
    Top = 120
  end
  object xlsSheet: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 256
    Top = 120
  end
  object tblPaises: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'country.db'
    Left = 96
    Top = 120
    object tblPaisesName: TStringField
      FieldName = 'Name'
      Size = 24
    end
    object tblPaisesCapital: TStringField
      FieldName = 'Capital'
      Size = 24
    end
    object tblPaisesContinent: TStringField
      FieldName = 'Continent'
      Size = 24
    end
    object tblPaisesArea: TFloatField
      FieldName = 'Area'
    end
    object tblPaisesPopulation: TFloatField
      FieldName = 'Population'
    end
  end
  object dtsPaises: TDataSource
    DataSet = tblPaises
    Left = 152
    Top = 120
  end
end
