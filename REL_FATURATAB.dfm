object FormREL_FATURATAB: TFormREL_FATURATAB
  Left = 330
  Top = 158
  Width = 746
  Height = 379
  Caption = 'Relat'#243'rio'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnSup: TPanel
    Left = 0
    Top = 0
    Width = 730
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ShapeSup: TShape
      Left = 0
      Top = 0
      Width = 730
      Height = 20
      Align = alClient
      Brush.Color = 14743792
      ParentShowHint = False
      Pen.Color = 7021576
      ShowHint = True
    end
    object LbTituloForm: TLabel
      Left = 0
      Top = 0
      Width = 730
      Height = 20
      Align = alClient
      Alignment = taCenter
      Caption = 'Relat'#243'rio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
    end
    object BtnAjuda: TSpeedButton
      Left = 421
      Top = 2
      Width = 16
      Height = 14
      Hint = 'Ajuda'
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = False
    end
    object BtnFechar: TSpeedButton
      Left = 439
      Top = 2
      Width = 16
      Height = 14
      Hint = 'Fechar'
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = False
      OnClick = BtnFecharClick
    end
  end
  object Selecao_1: TScrollBox
    Left = 0
    Top = 20
    Width = 730
    Height = 265
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    object Label1: TLabel
      Left = 336
      Top = 213
      Width = 76
      Height = 13
      Caption = 'Fatura Surimpex'
    end
    object ComboBox1: TComboBox
      Left = 312
      Top = 232
      Width = 145
      Height = 21
      Cursor = crArrow
      ItemHeight = 13
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 24
      Top = 24
      Width = 681
      Height = 57
      DataSource = DataSource1
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 24
      Top = 88
      Width = 337
      Height = 120
      DataSource = DataSource2
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object DBGrid3: TDBGrid
      Left = 368
      Top = 88
      Width = 337
      Height = 120
      DataSource = DataSource3
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object Divisao: TTabSet
    Left = 0
    Top = 285
    Width = 730
    Height = 21
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 306
    Width = 730
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object BtnVisualizar: TBitBtn
      Left = 346
      Top = 6
      Width = 75
      Height = 25
      Hint = 'Visualizar impress'#227'o'
      Caption = '&Visualizar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BtnVisualizarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333300
        3333333333333338833333333333330033333333333333388333333333333300
        3333333333333338833333333333300003333333333333888833300003380000
        003333888833F8888883FFFFF080000070033FFFFF8F88888788F0F00F00FFF0
        78033F8F88F88FFF87F8FFFFF80FFFF077803FFFFF78FFFF8778F0F0080000F0
        77803F8F8878888F8778FFFFF80F0FF077803FFFFF78F8FF8778F0F0008000F0
        70033F8F8887888F8788FFFFFF800FF070033FFFFFF788FF8788F0F000080000
        00333F8F888878888883FFFFFFFF033333333FFFFFFFF8333333F4FCCCCF0333
        33333F7F7777F8333333FFFFFFFF333333333FFFFFFFF3333333}
      NumGlyphs = 2
    end
    object BtnCancelar: TBitBtn
      Left = 436
      Top = 6
      Width = 75
      Height = 25
      Hint = 'Cancelar relat'#243'rio'
      Caption = '&Cancelar'
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C0007D654F00B199
        8300000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000D9CCC100A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303F8F80303030303030303030303030303030303FF03030303030303030303
        0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
        03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
        030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
        FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
        030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
        F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
        010101F8030303030303030303F8FF030303030303FFF8030303030303030303
        030101010101F80303030303030303030303F8FF0303030303F8030303030303
        0303030303F901010101F8030303030303030303030303F8FF030303F8030303
        0303030303030303F90101010101F8030303030303030303030303F803030303
        F8FF030303030303030303F9010101F8010101F803030303030303030303F803
        03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
        03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
        03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
        0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
        030303F901F903030303030303F8FC0303030303F8FFFFFFF803030303030303
        03030303030303030303030303030303030303030303030303F8F8F803030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 264
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Filtro'
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333300000333330
        00003FFFFF33333FFFFF30F000333330F0003F7FFF33333F7FFF30F000333330
        F0003F7FFF33333F7FFF30000000300000003FFFFFFF3FFFFFFF300F000000F0
        00003FF7FFFFFF7FFFFF300F000700F000003FF7FFF7FF7FFFFF300F000700F0
        00003FF7FFF7FF7FFFFF330000000000000333FFFFFFFFFFFFF33330F00030F0
        0033333F7FFF3F7FFF333330000030000033333FFFFF3FFFFF33333300033300
        03333333FFF333FFF33333330F03330F03333333F7F333F7F333333300033300
        03333333FFF333FFF33333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  object frDBDataSet: TfrDBDataSet
    Left = 225
    Top = 237
  end
  object frDesigner: TfrDesigner
    Left = 192
    Top = 238
  end
  object frReport: TfrReport
    Dataset = frDBDataSet
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Left = 13
    Top = 233
    ReportForm = {
      17000000FB1E000017000000001D004D6963726F736F66742058505320446F63
      756D656E742057726974657200FF09000000340800009A0B0000000000000000
      0000000000000000000000000000000000000000000000020000000000000000
      12000000F0020000680000003100020001000000000000000000FFFFFF1F0000
      0000090066724461746153657400000000000000FFFF0200070042414D444131
      30000000000090000000F0020000670000003100050001000000000000000000
      FFFFFF1F000000000B00667244424461746153657400000000000000FFFF0200
      0000000000000005030000F00200007700000031000100010000000000000000
      00FFFFFF1F00000000090066724461746153657400000000000000FFFF020000
      000000000000B7030000F0020000760000003000030001000000000000000000
      FFFFFF1F00000000090066724461746153657400000000000000FFFF02000D00
      526F646170E94D657374726531000000000000020000F0020000270000003100
      060001000000000000000000FFFFFF1F00000000000000000000000000FFFF02
      00080042414D444131303100000000003D010000F00200001300000031000800
      01000000000000000000FF00FF00000000001A0066724442446174615365745F
      4446617475726150726F6445787000000000000000FFFF0200110043616265E7
      616C686F446574616C68653100000000000E010000F002000019000000300007
      0001000000000000000000FF00FF0000000000000000000000000000FFFF0200
      1100526F646170E9446520446574616C68653100000000006C010000F0020000
      1C0000003100090001000000000000000000FF00FF0000000000000000000000
      000000FFFF0200080042414D444131303200000000009C010000F00200001300
      00003100080001000000000000000000FF00FF00000000001E00667244424461
      74615365745F44436F6D706C656D656E746F46617475726100000000000000FF
      FF000006004D656D6F3136000A00000008020000DA0200001A00000003000F00
      01000000000000000000FFFFFF002C020000000000000000000000FFFF050041
      7269616C000A000000000000008000000000000000020000000000FFFFFF0000
      0000000006004D656D6F3336000A0000006C010000DA02000013000000030000
      0001000000000000000000FFFFFF002C020000000000000000000000FFFF0500
      417269616C000A000000020000000000010000000000020000000000FFFFFF00
      000000000005004D656D6F31000A00000094000000240100005A00000003000F
      0001000000000000000000FFFFFF1F2C020000000000000000000000FFFF0500
      417269616C000A000000020000FF0000010000000000020000FF000000FF0000
      00000000000000000A00000012000000DA020000640000000B00000001000000
      000000000000C0C0C0002C020000000000000000000000FFFF0500417269616C
      000A000000000000000000020000000000020000000000FFFFFF000000000000
      0000000002000095000000DF0000005200000003000000010000000000000000
      00FFFFFF1F2C0200000000000400160046415455524120434F4D495353C34F20
      4147454E54450D40004E5220202020202020202020205B4D617363546578746F
      285B444F7264656D436F6272616E63612E22464154555241225D2C2027393939
      392F3939393927295D0D46004E2E462E20202020202020202020205B4D617363
      546578746F285B444F7264656D436F6272616E63612E224E756D4E46456D6974
      225D2C2027393939392F3939393927295D2E0D0F004441544120202020205B44
      6174655D00000000FFFF0500417269616C000800000000000000000000000000
      0000020000000000FFFFFF0000000000000000006F0200001500000070000000
      120000000300000001000000000000000000FFFFFF1F2C02000000000001000D
      0050E1672E3A205B50616765235D00000000FFFF0500417269616C000A000000
      000000000000010000000000020000000000FFFFFF0000000000000000008D00
      00004000000051020000120000000300000001000000000000000000FFFFFF1F
      2C02000000000001000A005B546974756C6F5F315D00000000FFFF0500417269
      616C000A000000000000000000020000000000020000000000FFFFFF00000000
      00000000008D0000005B00000051020000120000000300000001000000000000
      000000FFFFFF1F2C02000000000001000A005B546974756C6F5F325D00000000
      FFFF0500417269616C000A000000000000000000020000000000020000000000
      FFFFFF0000000000000000000A0000000E010000DA0200001900000003000F00
      01000000000000000000FFFFFF1F2C020000000000000000000000FFFF050041
      7269616C0006000000000000000000020000000000020000000000FFFFFF0000
      000000000000000A0000003D010000DA0200001200000003000F000100000000
      0000000000FFFFFF1F2C020000000000000000000000FFFF0500417269616C00
      06000000000000000000020000000000020000000000FFFFFF00000000000000
      00000A000000BF030000DA0200001E0000000300000001000000000000000000
      FFFFFF1F2C020000000000000000000000FFFF0500417269616C000A00000000
      0000000000020000000000020000000000FFFFFF00000000010009004C6F676F
      6D61726361000B000000140000006C0000006200000005000000010000000000
      00000000FFFFFF1F2C020000000000000000000000FFFF00F407000000000500
      4D656D6F34000A0000000E0100005A0000001900000003000F00010000000000
      00000000FFFFFF1F2C0200000000000100080050726F647563746F00000000FF
      FF0500417269616C00080000000200000000000A0000000000020000000000FF
      FFFF00000000000005004D656D6F35000A0000003D0100005A00000012000000
      03000F0001000000000000000000FFFFFF1F2C020000000000010021005B444F
      7264656D436F6272616E636150726F644578702E224E6F6D654D6978225D0000
      0000FFFF0500417269616C000700000000000000000000000000000002000000
      0000FFFFFF00000000000005004D656D6F3600640000000E0100004600000019
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000400
      4374746F00000000FFFF0500417269616C00080000000200000000000A000000
      0000020000000000FFFFFF00000000000005004D656D6F3700640000003D0100
      00460000001200000003000F0001000000000000000000FFFFFF1F2C02000000
      0000010022005B444F7264656D436F6272616E636150726F644578702E22436F
      6E747261746F225D00000000FFFF0500417269616C0007000000000000000000
      000000000000020000000000FFFFFF00000000000005004D656D6F3800AA0000
      000E010000500000001900000003000F0001000000000000000000FFFFFF1F2C
      02000000000001000500427571756500000000FFFF0500417269616C00080000
      000200000000000A0000000000020000000000FFFFFF00000000000005004D65
      6D6F3900AA0000003D010000500000001200000003000F000100000000000000
      0000FFFFFF1F2C02000000000001001F005B444F7264656D436F6272616E6361
      50726F644578702E224E6176696F225D00000000FFFF0500417269616C000700
      0000000000000000000000000000020000000000FFFFFF00000000000006004D
      656D6F313000FA0000000E0100003C0000001900000003000F00010000000000
      00000000FFFFFF1F2C02000000000001000200424C00000000FFFF0500417269
      616C00080000000200000000000A0000000000020000000000FFFFFF00000000
      000006004D656D6F313100FA0000003D0100003C0000001200000003000F0001
      000000000000000000FFFFFF1F2C02000000000001007B005B20696628205B44
      4F7264656D436F6272616E636150726F644578702E2244617461456D62617271
      7565225D203E2030202C205B4D61736344617461285B444F7264656D436F6272
      616E636150726F644578702E2244617461456D626172717565225D2C20276464
      2F6D6D2F7979797927295D202C27202729205D00000000FFFF0500417269616C
      0007000000000000000000020000000000020000000000FFFFFF000000000000
      06004D656D6F313200360100000E0100004C0000001900000003000F00010000
      00000000000000FFFFFF1F2C0200000000000100060046617475726100000000
      FFFF0500417269616C00080000000200000000000A0000000000020000000000
      FFFFFF00000000000006004D656D6F313300360100003D0100004C0000001200
      000003000F0001000000000000000000FFFFFF1F2C020000000000010020005B
      444F7264656D436F6272616E636150726F644578702E22466174757261225D00
      000000FFFF0500417269616C0007000000000000000000000000000000020000
      000000FFFFFF00000000000006004D656D6F313400820100000E010000240000
      001900000003000F0001000000000000000000FFFFFF1F2C0200000000000100
      0400436F6D2E00000000FFFF0500417269616C00080000000200000000000A00
      00000000020000000000FFFFFF00000000000006004D656D6F31350082010000
      3D010000240000001200000003000F0001000000000000000000FFFFFF1F2C02
      04011000232C2323232C2323232C2323302E303000010022005B444F7264656D
      436F6272616E636150726F644578702E22436F6D697373616F225D00000000FF
      FF0500417269616C0007000000000000000000020000000000020000000000FF
      FFFF00000000000006004D656D6F313700A60100003D0100005A000000120000
      0003000F0001000000000000000000FFFFFF1F2C020000000000010028005B44
      4F7264656D436F6272616E636150726F644578702E22434F4D4953414F534641
      54555241225D00000000FFFF0500417269616C00070000000000000000000100
      00000000020000000000FFFFFF00000000000006004D656D6F3138005A020000
      0E0100002F0000001900000003000F0001000000000000000000FFFFFF1F2C02
      0000000000010004005461786100000000FFFF0500417269616C000800000002
      00000000000A0000000000020000000000FFFFFF00000000000006004D656D6F
      3139005A0200003D0100002F0000001200000003000F00010000000000000000
      00FFFFFF1F2C0204011000232C2323232C2323232C2323302E30300001001E00
      5B444F7264656D436F6272616E636150726F644578702E2252617465225D0000
      0000FFFF0500417269616C000700000000000000000002000000000002000000
      0000FFFFFF00000000000006004D656D6F323000890200000E0100005B000000
      1900000003000F0001000000000000000000FFFFFF1F2C020000000000010020
      005B444F7264656D436F6272616E63612E224D4F454441434F4D495353414F22
      5D00000000FFFF0500417269616C00080000000200000000000A000000000002
      0000000000FFFFFF00000000000006004D656D6F323100890200003D0100005B
      0000001200000003000F0001000000000000000000FFFFFF1F2C020301100023
      2C2323232C2323232C2323302E303000010029005B444F7264656D436F627261
      6E636150726F644578702E2256414C4F52434F4E5645525449444F225D000000
      00FFFF0500417269616C00070000000000000000000100000000000200000000
      00FFFFFF00000000000006004D656D6F323700C7000000CB0300009401000010
      00000003000F0001000000000000000000FFFFFF1F2C02000000000001000600
      4147454E544500000000FFFF0500417269616C00080000000000000000000200
      00000000020000000000FFFFFF00000000000006004D656D6F32390010000000
      99000000A80000001200000003000F0001000000000000000000FFFFFF1F2C02
      000000000001001400544F4D41444F52204445205345525649C74F533A000000
      00FFFF0500417269616C00080000000200000000000000000000000200000000
      00FFFFFF00000000000006004D656D6F33300010000000AD0000001001000012
      0000000300000001000000000000000000FFFFFF1F2C02000000000001001800
      5B444F7264656D436F6272616E63612E2252415A414F225D00000000FFFF0500
      417269616C0008000000000000000000000000000000020000000000FFFFFF00
      000000000006004D656D6F33310010000000C000000010010000260000000100
      000001000000000000000000FFFFFF1F2C02000000000001000E005B454E4445
      5245434F5F4558505D00000000FFFF0500417269616C00080000000000000000
      00000000000000020000000000FFFFFF00000000000005004D656D6F32000002
      00000E0100005A0000001900000003000F0001000000000000000000FFFFFF1F
      2C02000000000001000B00466563686120207061676F00000000FFFF05004172
      69616C00080000000200000000000A0000000000020000000000FFFFFF000000
      00000005004D656D6F3300000200003D0100005A0000001200000003000F0001
      000000000000000000FFFFFF1F2C020000000000010071005B20696628205B44
      4F7264656D436F6272616E636150726F644578702E22446174614C6971225D20
      3E2030202C205B4D61736344617461285B444F7264656D436F6272616E636150
      726F644578702E22446174614C6971225D2C202764642F6D6D2F797979792729
      5D202C27202729205D00000000FFFF0500417269616C00070000000000000000
      00020000000000020000000000FFFFFF00000000000006004D656D6F33340089
      0200006C0100005B000000120000000000070001000000000000000000FFFFFF
      1F2C020301000000010039005B73756D285B444F7264656D436F6272616E6361
      50726F644578702E2256414C4F52434F4E5645525449444F225D2C42414D4441
      313031295D00000000FFFF0500417269616C0008000000020000000000010000
      000000020000000000FFFFFF00000000000006004D656D6F333500A60100006C
      0100005A000000120000000000070001000000000000000000FFFFFF1F2C0303
      01000000010039005B73756D285B444F7264656D436F6272616E636150726F64
      4578702E22434F4D4953414F53464154555241225D2C2042414D444131303129
      5D00000000FFFF0500417269616C000800000002000000000001000000000002
      0000000000FFFFFF00000000000006004D656D6F333700A60100000E0100005A
      0000001900000003000F0001000000000000000000FFFFFF1F2C020000000000
      0100030055534400000000FFFF0500417269616C00080000000200000000000A
      0000000000020000000000FFFFFF00000000000006004D656D6F3338000A0000
      009C0100007F0200001200000003000F0001000000000000000000FFFFFF002C
      020000000000010024005B444F7264656D436F6272616E6361446573636F6E74
      2E224F42534552564143414F225D00000000FFFF0500417269616C0007000000
      020000000000000000000000020000000000FFFFFF00000000000006004D656D
      6F343000890200009C0100005B0000001200000003000F000100000000000000
      0000FFFFFF1F2C02030100000001001F005B444F7264656D436F6272616E6361
      446573636F6E742E2256616C6F72225D00000000FFFF0500417269616C000700
      0000020000000000010000000000020000000000FFFFFF00000000000006004D
      656D6F3339000C00000009020000D40200001200000003000000010000000000
      00000000FFFFFF1F2C02000000000001001F005B444F7264656D436F6272616E
      63612E22544558544F5F50414452414F225D00000000FFFF0500417269616C00
      07000000000000000000000000000000020000000000FFFFFF00000000000006
      004D656D6F3236000A000000E0030000DA020000460000000300000001000000
      000000000000FFFFFF1F2C02000000000001000E005B454E44455245434F5F52
      454C5D00000000FFFF0500417269616C00070000000000000000000A00000000
      00020000000000FFFFFF00000000000006004D656D6F3432000A000000100300
      00DA020000660000000300000001000000000000000000FFFFFF1F2C02000000
      0000000000000000FFFF0500417269616C000A00000000000000000000000000
      00000200C0C0C000FFFFFF00000000000006004D656D6F323200760200001903
      000069000000120000000300000001000000000000000000FFFFFF1F2C020301
      000000010039005B73756D285B444F7264656D436F6272616E636150726F6445
      78702E22434F4D4953414F53464154555241225D2C2042414D4441313031295D
      00000000FFFF0500417269616C00080000000200000000000100000000000200
      00000000FFFFFF00000000000006004D656D6F323300760200002F0300006900
      0000120000000300000001000000000000000000FFFFFF1F2C02030100000001
      0039005B73756D285B444F7264656D436F6272616E636150726F644578702E22
      56414C4F52434F4E5645525449444F225D2C42414D4441313031295D00000000
      FFFF0500417269616C0008000000020000000000010000000000020000000000
      FFFFFF00000000000006004D656D6F323400E001000019030000780000001200
      00000300000001000000000000000000FFFFFF1F2C0200000000000100090054
      4F54414C2055534400000000FFFF0500417269616C0008000000000000000000
      010000000000020000000000FFFFFF00000000000006004D656D6F3235003401
      00002F03000024010000120000000300000001000000000000000000FFFFFF1F
      2C02000000000001002800544F54414C2020205B444F7264656D436F6272616E
      63612E224D4F454441434F4D495353414F225D00000000FFFF0500417269616C
      0008000000000000000000010000000000020000000000FFFFFF000000000000
      06004D656D6F3332000C000000450300004C0200001200000003000000010000
      00000000000000FFFFFF1F2C02000000000001001F005B444F7264656D436F62
      72616E63612E22544558544F4453434F4E544F225D00000000FFFF0500417269
      616C0008000000000000000000010000000000020000000000FFFFFF00000000
      000006004D656D6F333300760200004503000069000000120000000300000001
      000000000000000000FFFFFF1F2C02030100000001003100205B53554D285B44
      4F7264656D436F6272616E6361446573636F6E742E2256414C4F52225D2C2042
      414D4441313032295D00000000FFFF0500417269616C00080000000200000000
      00010000000000020000000000FFFFFF00000000000006004D656D6F32380076
      0200005C03000069000000120000000300000001000000000000000000FFFFFF
      1F2C02030100000002006F00205B5B73756D285B444F7264656D436F6272616E
      636150726F644578702E2256414C4F52434F4E5645525449444F225D2C42414D
      4441313031295D202B205B53554D285B444F7264656D436F6272616E63614465
      73636F6E742E2256414C4F52225D2C2042414D4441313032295D5D0D00000000
      0000FFFF0500417269616C000800000002000000000001000000000002000000
      0000FFFFFF00000000000006004D656D6F343100C80100005C03000090000000
      120000000300000001000000000000000000FFFFFF1F2C02000000000001000D
      00544F54414C204120504147415200000000FFFF0500417269616C0008000000
      000000000000010000000000020000000000FFFFFF00000000000006004D656D
      6F34330064020000440300001000000012000000030000000100000000000000
      0000FFFFFF1F2C020000000000010071005B49462820444F7264656D436F6272
      616E63612E224D4F454441434F4D495353414F22203D274575726F272C5B2780
      275D2C5B49462820444F7264656D436F6272616E63612E224D4F454441434F4D
      495353414F22203D27446F6C6172272C5B2724275D2C205B275224275D295D20
      295D00000000FFFF0500417269616C000A000000000000000000000000000000
      020000000000FFFFFF00000000000006004D656D6F343400640200005C030000
      10000000120000000300000001000000000000000000FFFFFF1F2C0200000000
      00010072005B49462820444F7264656D436F6272616E63612E224D4F45444143
      4F4D495353414F22203D274575726F272C5B2780275D2C5B49462820444F7264
      656D436F6272616E63612E224D4F454441434F4D495353414F22203D27446F6C
      6172272C5B2724275D2C205B275224275D295D20295D2000000000FFFF050041
      7269616C000A000000000000000000000000000000020000000000FFFFFF0000
      0000000006004D656D6F343500640200002C0300001000000012000000030000
      0001000000000000000000FFFFFF1F2C020000000000010072005B4946282044
      4F7264656D436F6272616E63612E224D4F454441434F4D495353414F22203D27
      4575726F272C5B2780275D2C5B49462820444F7264656D436F6272616E63612E
      224D4F454441434F4D495353414F22203D27446F6C6172272C5B2724275D2C20
      5B275224275D295D20295D2000000000FFFF0500417269616C000A0000000000
      00000000000000000000020000000000FFFFFF00000000000006004D656D6F34
      3600640200001803000010000000120000000300000001000000000000000000
      FFFFFF1F2C020000000000010001002400000000FFFF0500417269616C000A00
      0000000000000000000000000000020000000000FFFFFF00000000FE00000000
      000000}
  end
  object DataSource1: TDataSource
    Left = 360
    Top = 100
  end
  object DataSource2: TDataSource
    Left = 160
    Top = 236
  end
  object DataSource3: TDataSource
    Left = 72
    Top = 236
  end
  object frDBDataSet_DFaturaProdExp: TfrDBDataSet
    Left = 257
    Top = 237
  end
  object frDBDataSet_DComplementoFatura: TfrDBDataSet
    Left = 41
    Top = 237
  end
end
