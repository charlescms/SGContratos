object FormDivisao: TFormDivisao
  Left = 456
  Top = 250
  Width = 645
  Height = 166
  Caption = 'Entrada de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = formclose
  OnCloseQuery = formclosequery
  OnKeyDown = formkeydown
  OnKeyPress = formkeypress
  OnKeyUp = formkeyup
  OnShow = formshow
  PixelsPerInch = 120
  TextHeight = 16
  object NoManutencao: TNotebook
    Left = 0
    Top = 0
    Width = 637
    Height = 60
    Align = alClient
    TabOrder = 0
    object PgPrincipal: TPage
      Left = 0
      Top = 0
      Caption = 'Principal'
      object Pagina0: TScrollBox
        Left = 0
        Top = 0
        Width = 637
        Height = 60
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        object LbcCLICOD: TLabel
          Left = 10
          Top = 1
          Width = 41
          Height = 16
          Caption = 'Cliente'
          ParentShowHint = False
          ShowHint = True
        end
        object Lbcseq: TLabel
          Left = 91
          Top = 1
          Width = 25
          Height = 16
          Caption = 'Seq'
          ParentShowHint = False
          ShowHint = True
        end
        object LbcNOME: TLabel
          Left = 123
          Top = 1
          Width = 37
          Height = 16
          Caption = 'Nome'
          ParentShowHint = False
          ShowHint = True
        end
        object CLICOD: TXDBNumEdit
          Left = 9
          Top = 20
          Width = 77
          Height = 21
          AutoHideCalculator = False
          Glyph.Data = {
            7E050000424D7E0500000000000036000000280000001A0000000D0000000100
            2000000000004805000000000000000000000000000000000000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C0008040400080404000804040008040400080404000804040008040
            4000804040008040400080404000FFC0C000FFC0C000FFC0C000FFFFFF008080
            8000808080008080800080808000808080008080800080808000808080008080
            8000FFC0C000FFC0C000FFC0C000FFC00000FF406000FF406000FF406000FF40
            6000FF406000FF406000FF406000FF40600080404000FFC0C000FFC0C000FFC0
            C000FFFFFF00FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC00000FF406000FFC0
            0000FFFFFF00FFC00000FFFFFF00FFC00000FFFFFF00FF40600080404000FFC0
            C000FFC0C000FFC0C000FFFFFF00FFC0C00080808000FFFFFF0080808000FFFF
            FF0080808000FFFFFF00FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC0
            0000FF406000FF406000FF406000FF406000FF406000FF406000FF406000FF40
            600080404000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C00080808000FFC0C000FFC0
            C000FFC0C000FFC00000FF406000FFC00000FFFFFF00FFC00000FFFFFF00FFC0
            0000FFFFFF00FF40600080404000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0
            C00080808000FFFFFF0080808000FFFFFF0080808000FFFFFF00FFC0C0008080
            8000FFC0C000FFC0C000FFC0C000FFC00000FF406000FF406000FF406000FF40
            6000FF406000FF406000FF406000FF40600080404000FFC0C000FFC0C000FFC0
            C000FFFFFF00FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC00000FF4060004000
            0000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FF40600080404000FFC0
            C000FFC0C000FFC0C000FFFFFF00FFC0C00080808000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC0
            0000FF40600040000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFC0C000FF40
            600080404000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0C00080808000FFC0
            C000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0C00080808000FFC0C000FFC0
            C000FFC0C000FFC00000FF406000400000004000000040000000400000004000
            000040000000FF40600080404000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0
            C000808080008080800080808000808080008080800080808000FFC0C0008080
            8000FFC0C000FFC0C000FFC0C000FFC00000FF406000FF406000FF406000FF40
            6000FF406000FF406000FF406000FF40600080404000FFC0C000FFC0C000FFC0
            C000FFFFFF00FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC00000FFC00000FFC0
            0000FFC00000FFC00000FFC00000FFC00000FFC00000FFC0000080404000FFC0
            C000FFC0C000FFC0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = CLICODexit
        end
        object seq: TXDBNumEdit
          Left = 90
          Top = 20
          Width = 28
          Height = 21
          AutoHideCalculator = False
          Glyph.Data = {
            7E050000424D7E0500000000000036000000280000001A0000000D0000000100
            2000000000004805000000000000000000000000000000000000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C0008040400080404000804040008040400080404000804040008040
            4000804040008040400080404000FFC0C000FFC0C000FFC0C000FFFFFF008080
            8000808080008080800080808000808080008080800080808000808080008080
            8000FFC0C000FFC0C000FFC0C000FFC00000FF406000FF406000FF406000FF40
            6000FF406000FF406000FF406000FF40600080404000FFC0C000FFC0C000FFC0
            C000FFFFFF00FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC00000FF406000FFC0
            0000FFFFFF00FFC00000FFFFFF00FFC00000FFFFFF00FF40600080404000FFC0
            C000FFC0C000FFC0C000FFFFFF00FFC0C00080808000FFFFFF0080808000FFFF
            FF0080808000FFFFFF00FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC0
            0000FF406000FF406000FF406000FF406000FF406000FF406000FF406000FF40
            600080404000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C00080808000FFC0C000FFC0
            C000FFC0C000FFC00000FF406000FFC00000FFFFFF00FFC00000FFFFFF00FFC0
            0000FFFFFF00FF40600080404000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0
            C00080808000FFFFFF0080808000FFFFFF0080808000FFFFFF00FFC0C0008080
            8000FFC0C000FFC0C000FFC0C000FFC00000FF406000FF406000FF406000FF40
            6000FF406000FF406000FF406000FF40600080404000FFC0C000FFC0C000FFC0
            C000FFFFFF00FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC00000FF4060004000
            0000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FF40600080404000FFC0
            C000FFC0C000FFC0C000FFFFFF00FFC0C00080808000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC0
            0000FF40600040000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFC0C000FF40
            600080404000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0C00080808000FFC0
            C000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0C00080808000FFC0C000FFC0
            C000FFC0C000FFC00000FF406000400000004000000040000000400000004000
            000040000000FF40600080404000FFC0C000FFC0C000FFC0C000FFFFFF00FFC0
            C000808080008080800080808000808080008080800080808000FFC0C0008080
            8000FFC0C000FFC0C000FFC0C000FFC00000FF406000FF406000FF406000FF40
            6000FF406000FF406000FF406000FF40600080404000FFC0C000FFC0C000FFC0
            C000FFFFFF00FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C00080808000FFC0C000FFC0C000FFC0C000FFC00000FFC00000FFC0
            0000FFC00000FFC00000FFC00000FFC00000FFC00000FFC0000080404000FFC0
            C000FFC0C000FFC0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0C000FFC0
            C000}
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnExit = SEQexit
        end
        object NOME: TXDBEdit
          Left = 122
          Top = 20
          Width = 364
          Height = 21
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Text = 'NOME'
          OnExit = NOMEexit
          Glyph.Data = {
            7E050000424D7E0500000000000036000000280000001A0000000D0000000100
            2000000000004805000000000000000000000000000000000000008000000080
            0000008000000080000000800000008000000080000000800000008000000080
            0000008000000080000000800000008000000080000000800000008000000080
            0000008000000080000000800000008000000080000000800000008000000080
            0000000000000000000000000000008000000080000000800000008000000080
            000000000000000000000000000000800000008000000080000000800000FFFF
            FF00FFFFFF00FFFFFF000080000000800000008000000080000000800000FFFF
            FF00FFFFFF00FFFFFF0000000000008000000000000000800000008000000080
            0000008000000080000000000000008000000000000000800000008000000080
            000000800000FFFFFF0000800000FFFFFF000080000000800000008000000080
            000000800000FFFFFF0000800000FFFFFF000000000000000000000000008080
            8000008000000080000000800000808080000000000000000000000000000080
            0000008000000080000000800000FFFFFF00FFFFFF00FFFFFF00808080000080
            0000008000000080000080808000FFFFFF00FFFFFF00FFFFFF00000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000800000008000000080000000800000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00000000000080000000000000000000000000000000000000008000000000
            000000000000000000000000000000800000008000000080000000800000FFFF
            FF0000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000800000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0000000000008000000000000000000000000000000000
            0000008000000000000000000000000000000000000000800000008000000080
            000000800000FFFFFF0000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF000080
            0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000080
            0000008000000080000000800000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
            0000000000000000000000000000808080000000000000000000000000000000
            00000000000000800000008000000080000000800000FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00008000000080000000000000000000000080000000800000008000000000
            0000000000000080000000800000008000000080000000800000008000000080
            000000800000FFFFFF00FFFFFF00008000000080000000800000FFFFFF00FFFF
            FF00008000000080000000800000008000000000000000000000008000000080
            0000008000000000000000000000008000000080000000800000008000000080
            0000008000000080000000800000FFFFFF00FFFFFF0000800000008000000080
            0000FFFFFF00FFFFFF0000800000008000000080000000800000000000000000
            0000008000000080000000800000000000000000000000800000008000000080
            00000080000000800000008000000080000000800000FFFFFF00FFFFFF000080
            00000080000000800000FFFFFF00FFFFFF000080000000800000008000000080
            0000008000000080000000800000008000000080000000800000008000000080
            0000008000000080000000800000008000000080000000800000008000000080
            0000008000000080000000800000008000000080000000800000008000000080
            0000}
        end
      end
    end
    object PgComplemento1: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 1'
      object Pagina1: TScrollBox
        Left = 0
        Top = 0
        Width = 637
        Height = 60
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
      end
    end
    object PgComplemento2: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 2'
    end
    object PgComplemento3: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 3'
    end
    object PgComplemento4: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 4'
    end
    object PgComplemento5: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 5'
    end
    object PgComplemento6: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 6'
    end
    object PgComplemento7: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 7'
    end
    object PgComplemento8: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 8'
    end
    object PgComplemento9: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 9'
    end
    object PgComplemento10: TPage
      Left = 0
      Top = 0
      Caption = 'Complemento 10'
    end
  end
  object PnSalva: TPanel
    Left = 0
    Top = 86
    Width = 637
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BtnPrimeiro: TSpeedButton
      Left = 511
      Top = 10
      Width = 28
      Height = 31
      Hint = 'Primeiro registro'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333334433333033
        333333FF33333F333333334433330033333333FF3333FF333333334433307033
        333333FF333F3F333333334433077000003333FF33F33FFFFF33334430777777
        703333FF3F3333333F33334407777777703333FFF33333333F33334430777777
        703333FF3F3333333F33334433077000003333FF33F33FFFFF33334433307033
        333333FF333F3F333333334433330033333333FF3333FF333333334433333033
        333333FF33333F33333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNPRIMEIROclick
    end
    object BtnAnterior: TSpeedButton
      Left = 539
      Top = 10
      Width = 28
      Height = 31
      Hint = 'Registro anterior'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333330333
        333333333333F333333333333330033333333333333FF3333333333333070333
        3333333333F3F3333333333330770000033333333F33FFFFF333333307777777
        03333333F3333333F3333330777777770333333F33333333F333333307777777
        03333333F3333333F333333330770000033333333F33FFFFF333333333070333
        3333333333F3F333333333333330033333333333333FF3333333333333330333
        333333333333F333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNANTERIORclick
    end
    object BtnProximo: TSpeedButton
      Left = 567
      Top = 10
      Width = 29
      Height = 31
      Hint = 'Pr'#243'ximo registro'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333033333
        3333333333F3333333333333330033333333333333FF33333333333333070333
        3333333333F3F3333333330000077033333333FFFFF33F333333330777777703
        333333F3333333F33333330777777770333333F33333333F3333330777777703
        333333F3333333F33333330000077033333333FFFFF33F333333333333070333
        3333333333F3F33333333333330033333333333333FF33333333333333033333
        3333333333F33333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNPROXIMOclick
    end
    object BtnUltimo: TSpeedButton
      Left = 596
      Top = 10
      Width = 28
      Height = 31
      Hint = #250'ltimo registro'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333330333334
        433333333F33333FF333333330033334433333333FF3333FF333333330703334
        433333333F3F333FF33330000077033443333FFFFF33F33FF333307777777034
        43333F3333333F3FF33330777777770443333F33333333FFF333307777777034
        43333F3333333F3FF33330000077033443333FFFFF33F33FF333333330703334
        433333333F3F333FF333333330033334433333333FF3333FF333333330333334
        433333333F33333FF33333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNULTIMOclick
    end
    object BtnIncluir: TBitBtn
      Left = 212
      Top = 10
      Width = 92
      Height = 31
      Hint = 'Incluir registro'
      Caption = 'Incluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BTNINCLUIRclick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
    object BtnModificar: TBitBtn
      Left = 313
      Top = 10
      Width = 92
      Height = 31
      Hint = 'Modificar registro'
      Caption = 'Modificar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BTNMODIFICARclick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object BtnExcluir: TBitBtn
      Left = 414
      Top = 10
      Width = 92
      Height = 31
      Hint = 'Excluir registro'
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BTNEXCLUIRclick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
    object BtnSalvar: TBitBtn
      Left = 10
      Top = 10
      Width = 92
      Height = 31
      Hint = 'Salvar registro'
      Caption = '&Salvar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BTNSALVARclick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        66666666666666666666660000000000000666FFFFFFFFFFFFF6603300000077
        03066F66FFFFFF66F6F660330000007703066F66FFFFFF66F6F6603300000077
        03066F66FFFFFF66F6F660330000000003066F66FFFFFFFFF6F6603333333333
        33066F666666666666F660330000000033066F66FFFFFFFF66F6603077777777
        03066F6F66666666F6F660307777777703066F6F66666666F6F6603077777777
        03066F6F66666666F6F660307777777703066F6F66666666F6F6603077777777
        00066F6F66666666FFF660307777777703066F6F66666666F6F6600000000000
        00066FFFFFFFFFFFFFF666666666666666666666666666666666}
      NumGlyphs = 2
    end
    object BtnDesistir: TBitBtn
      Left = 111
      Top = 10
      Width = 92
      Height = 31
      Hint = 'Desistir da inclus'#227'o/modifica'#231#227'o'
      Caption = '&Desistir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BTNDESISTIRclick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF33339993707399933333773337F3777FF3399933000339
        9933377333777F3377F3399333707333993337733337333337FF993333333333
        399377F33333F333377F993333303333399377F33337FF333373993333707333
        333377F333777F333333993333101333333377F333777F3FFFFF993333000399
        999377FF33777F77777F3993330003399993373FF3777F37777F399933000333
        99933773FF777F3F777F339993707399999333773F373F77777F333999999999
        3393333777333777337333333999993333333333377777333333}
      NumGlyphs = 2
    end
  end
  object TabPaginas: TTabSet
    Left = 0
    Top = 60
    Width = 637
    Height = 26
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Tabs.Strings = (
      'Principal')
    TabIndex = 0
    OnClick = TABPAGINASclick
  end
  object DataSource: TDataSource
  end
  object MenuImagem: TPopupMenu
    object CortarImagem: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      OnClick = CORTARIMAGEMclick
    end
    object CopiarImagem: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      OnClick = COPIARIMAGEMclick
    end
    object ColarImagem: TMenuItem
      Caption = 'Colar'
      ShortCut = 16470
      OnClick = COLARIMAGEMclick
    end
    object MnSep01: TMenuItem
      Caption = '-'
    end
    object AbrirImagem: TMenuItem
      Caption = 'Abrir...'
      OnClick = ABRIRIMAGEMclick
    end
    object SalvarImagem: TMenuItem
      Caption = 'Salvar como...'
      OnClick = SALVARIMAGEMclick
    end
  end
  object DlgSalvarComoImagem: TSaveDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmap (*.bmp)|*.bmp|'#237'cone (*.ico)|*.ico|Metafile (*.wmf)|*.wmf'
    Title = 'Salvar Imagem Como'
  end
  object DlgAbrirImagem: TOpenDialog
    DefaultExt = 'bmp'
    Filter = 
      'Imagens (*.jpg;*.jpeg;*.bmp;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp;*.em' +
      'f;*.wmf|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*' +
      '.jpeg|Bitmaps (*.bmp)|*.bmp|Todos os arquivos (*.*)|*.*'
    Title = 'Abrir Imagem'
  end
end
