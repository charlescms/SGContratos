object FormParametro: TFormParametro
  Left = 335
  Top = 125
  Width = 610
  Height = 419
  Caption = 'Entrada de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnActivate = formactivate
  OnClose = formclose
  OnCloseQuery = formclosequery
  OnKeyPress = formkeypress
  OnShow = formshow
  PixelsPerInch = 120
  TextHeight = 16
  object PageForm: TNotebook
    Left = 0
    Top = 41
    Width = 602
    Height = 326
    Align = alClient
    TabOrder = 1
    object TPage
      Left = 0
      Top = 0
      Caption = 'Manutencao'
      object TabPaginas: TTabSet
        Left = 0
        Top = 259
        Width = 602
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
      object PnInferior: TPanel
        Left = 0
        Top = 285
        Width = 602
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Img_Tabela: TImage
          Left = 542
          Top = 9
          Width = 32
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617076010000424D760100000000000076000000280000002000
            0000100000000100040000000000000100000000000000000000100000001000
            000000000000000080000080000000808000800000008000800080800000C0C0
            C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF00777777777777777777777777777777777888888888888888788888888888
            88880000000000000000FFFFFFFFFFFFFFFF0FFFF0FFFF0FFFF0F7777F7777F7
            777F0FFFF0FFFF0FFFF0F7777F7777F7777F0000000000000000FFFFFFFFFFFF
            FFFF0FFFF0FFFF0FFFF0F7777F7777F7777F0FFFF0FFFF0FFFF0F7777F7777F7
            777F0000000000000000FFFFFFFFFFFFFFFF0FFFF0FFFF0FFFF0F7777F7777F7
            777F0FFFF0FFFF0FFFF0F7777F7777F7777F0000000000000000FFFFFFFFFFFF
            FFFF0AAAAAAAAAAAAAA0FAAAAAAAAAAAAAAF0AAAAAAAAAAAAAA0FAAAAAAAAAAA
            AAAF0000000000000000FFFFFFFFFFFFFFFF7777777777777777777777777777
            7777}
          Visible = False
        end
        object Img_Form: TImage
          Left = 591
          Top = 9
          Width = 32
          Height = 16
          AutoSize = True
          Picture.Data = {
            07544269746D617076010000424D760100000000000076000000280000002000
            000010000000010004000000000000010000120B0000120B0000100000000000
            0000000000000000800000800000008080008000000080008000808000007F7F
            7F00BFBFBF000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
            FF0033333333333333333FFFFFFFFFFFFFFF0000000000000000777777777777
            77770FFFFFFFFFFFFFF07F3FF3FF3FFF3FF70F00F00F000F00F07F7737737773
            77370FFFFFFFFFFFFFF07F3FF3FF33FFFFF70F00F00FF00000F07F7737733777
            77F70FEEEEEFF0F9FCF07F33333337F7F7F70FFFFFFFF0F9FCF07F3FFFF337F7
            37F70F0000FFF0FFFCF07F7777F337F337370F0000FFF0FFFFF07F7777333733
            33370FFFFFFFFFFFFFF07FFFFFFFFFFFFFF70CCCCCCCCCCCCCC0777777777777
            7777088CCCCCCCCCC88073377777777773370000000000000000777777777777
            7777333333333333333333333333333333333333333333333333333333333333
            3333}
          Visible = False
        end
        object BtnSalvar: TBitBtn
          Left = 5
          Top = 6
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
          Left = 106
          Top = 6
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
      object PgPagina1: TScrollBox
        Left = 0
        Top = 0
        Width = 602
        Height = 257
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        ParentColor = False
        TabOrder = 2
        object NoManutencao: TNotebook
          Left = 0
          Top = 0
          Width = 602
          Height = 257
          Align = alClient
          TabOrder = 0
          object PgPrincipal: TPage
            Left = 0
            Top = 0
            Caption = 'Principal'
            object Pagina0: TScrollBox
              Left = 0
              Top = 0
              Width = 602
              Height = 257
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              object LbcTEXTOFATURA: TLabel
                Left = 10
                Top = 1
                Width = 75
                Height = 16
                Caption = 'Texto Fatura'
                ParentShowHint = False
                ShowHint = True
              end
              object LbcNumNFEmit: TLabel
                Left = 14
                Top = 198
                Width = 68
                Height = 16
                Caption = 'Nota Fiscal'
                ParentShowHint = False
                ShowHint = True
              end
              object LbcNumFatura: TLabel
                Left = 148
                Top = 204
                Width = 89
                Height = 16
                Caption = 'N'#250'mero Fatura'
                ParentShowHint = False
                ShowHint = True
              end
              object LbcENDERECOEMPRESA: TLabel
                Left = 12
                Top = 87
                Width = 117
                Height = 16
                Alignment = taRightJustify
                Caption = 'Endereco Relat'#243'rio'
                ParentShowHint = False
                ShowHint = True
              end
              object TEXTOFATURA: TDBMemo
                Left = 14
                Top = 16
                Width = 563
                Height = 66
                ParentShowHint = False
                ScrollBars = ssVertical
                ShowHint = True
                TabOrder = 0
                OnChange = TEXTOFATURAchange
                OnExit = TEXTOFATURAexit
              end
              object NumNFEmit: TXDBNumEdit
                Left = 14
                Top = 212
                Width = 70
                Height = 24
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
                TabOrder = 2
                OnExit = NUMNFEMITexit
              end
              object NumFatura: TXDBNumEdit
                Left = 148
                Top = 218
                Width = 80
                Height = 24
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
                TabOrder = 3
                OnExit = NUMFATURAexit
              end
              object ENDERECOEMPRESA: TDBMemo
                Left = 14
                Top = 101
                Width = 564
                Height = 89
                ParentShowHint = False
                ScrollBars = ssVertical
                ShowHint = True
                TabOrder = 1
                OnExit = ENDERECOEMPRESAexit
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
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento2: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 2'
            object Pagina2: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento3: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 3'
            object Pagina3: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento4: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 4'
            object Pagina4: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento5: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 5'
            object Pagina5: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento6: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 6'
            object Pagina6: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento7: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 7'
            object Pagina7: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento8: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 8'
            object Pagina8: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento9: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 9'
            object Pagina9: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
          object PgComplemento10: TPage
            Left = 0
            Top = 0
            Caption = 'Complemento 10'
            object Pagina10: TScrollBox
              Left = 0
              Top = 0
              Width = 585
              Height = 409
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
        end
      end
      object Divisao_inf: TPanel
        Left = 0
        Top = 257
        Width = 602
        Height = 2
        Align = alBottom
        TabOrder = 3
        Visible = False
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Consulta'
      object AbaConsulta: TTabSet
        Left = 0
        Top = 357
        Width = 631
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
        OnClick = ABACONSULTAclick
      end
      object GridConsulta: TDBGrid
        Left = 0
        Top = 0
        Width = 631
        Height = 357
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PopConsulta
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clBlue
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = GRIDCONSULTAdblclick
      end
    end
  end
  object PnSuperior: TPanel
    Left = 0
    Top = 0
    Width = 602
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object BtnModificar: TSpeedButton
      Left = 5
      Top = 4
      Width = 92
      Height = 30
      Hint = 'Modificar registro'
      Caption = '&Modificar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555775777777
        57705557757777775FF7555555555555000755555555555F777F555555555550
        87075555555555F7577F5555555555088805555555555F755F75555555555033
        805555555555F755F75555555555033B05555555555F755F75555555555033B0
        5555555555F755F75555555555033B05555555555F755F75555555555033B055
        55555555F755F75555555555033B05555555555F755F75555555555033B05555
        555555F75FF75555555555030B05555555555F7F7F75555555555000B0555555
        5555F777F7555555555501900555555555557777755555555555099055555555
        5555777755555555555550055555555555555775555555555555}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNMODIFICARclick
    end
    object BtnTabela: TSpeedButton
      Left = 97
      Top = 4
      Width = 93
      Height = 30
      Hint = 'Visualizar registros em forma de tabela'
      Caption = 'Tabela'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777778888888888888887888888888888888000000000000
        0000FFFFFFFFFFFFFFFF0FFFF0FFFF0FFFF0F7777F7777F7777F0FFFF0FFFF0F
        FFF0F7777F7777F7777F0000000000000000FFFFFFFFFFFFFFFF0FFFF0FFFF0F
        FFF0F7777F7777F7777F0FFFF0FFFF0FFFF0F7777F7777F7777F000000000000
        0000FFFFFFFFFFFFFFFF0FFFF0FFFF0FFFF0F7777F7777F7777F0FFFF0FFFF0F
        FFF0F7777F7777F7777F0000000000000000FFFFFFFFFFFFFFFF0AAAAAAAAAAA
        AAA0FAAAAAAAAAAAAAAF0AAAAAAAAAAAAAA0FAAAAAAAAAAAAAAF000000000000
        0000FFFFFFFFFFFFFFFF77777777777777777777777777777777}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNTABELAclick
    end
    object BtnRefresh: TSpeedButton
      Left = 190
      Top = 4
      Width = 29
      Height = 30
      Hint = 'Atualizar registros'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333444443333333333F77777FFF333333444444444
        3333333777333777FF3333444333334443333377333333777FF3344433333334
        443337733333333377F3344333333333443337733333333337FF443333333333
        344377F333333333377F443333333333344377F3333333333373443333333333
        333377F3333333333333443333333333333377F33333333FFFFF443333333344
        444377FF33333377777F3443333333344443373FF3333337777F344433333333
        44433773FF33333F777F334443333344444333773F333377777F333444444444
        3343333777333777337333333444443333333333377777333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNREFRESHclick
    end
    object Divisao_sup: TPanel
      Left = 0
      Top = 38
      Width = 602
      Height = 3
      Align = alBottom
      TabOrder = 0
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 367
    Width = 602
    Height = 19
    Panels = <
      item
        Text = 'Opera'#231#227'o:'
        Width = 120
      end
      item
        Text = 'Filtragem:'
        Width = 120
      end
      item
        Text = 'Ordena'#231#227'o:'
        Width = 150
      end>
  end
  object DataSource: TDataSource
  end
  object PopConsulta: TPopupMenu
    object mnu_Filtrar: TMenuItem
      Caption = 'Filtrar Registros'
      Hint = 'Filtrar Registros'
      OnClick = MNU_FILTRARclick
    end
    object mnu_Ordenar: TMenuItem
      Caption = 'Ordenar Registros'
      Hint = 'Ordena registros, cria uma nova ordem'
      OnClick = MNU_ORDENARclick
    end
    object mnu_OrdenarComposto: TMenuItem
      Caption = 'Ordena'#231#227'o Composta'
      Hint = 'Cria ordena'#231#227'o composta, n'#227'o apaga ordena'#231#227'o j'#225' definida'
      OnClick = MNU_ORDENARCOMPOSTOclick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnu_ApagarColuna: TMenuItem
      Caption = 'Apagar Coluna Selecionada'
      Hint = 'Apaga coluna selecionada'
      OnClick = MNU_APAGARCOLUNAclick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnu_Quantificar: TMenuItem
      Caption = 'Quantificar Registros'
      Hint = 'Quantificar registros apresentados'
      OnClick = MNU_QUANTIFICARclick
    end
    object mnu_TotalizarColuna: TMenuItem
      Caption = 'Totalizar Coluna Selecionada'
      Hint = 'Totaliza coluna n'#250'merica selecionada'
      OnClick = MNU_TOTALIZARCOLUNAclick
    end
    object mnu_CalcularMedia: TMenuItem
      Caption = 'Calcular M'#233'dia da Coluna'
      Hint = 'Calcula a m'#233'dia da coluna selecionada'
      OnClick = MNU_CALCULARMEDIAclick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnu_Imprimir: TMenuItem
      Caption = 'Imprimir Consulta'
      Hint = 'Imprimir consulta'
      OnClick = MNU_IMPRIMIRclick
    end
    object mnu_SalvarConsulta: TMenuItem
      Caption = 'Salvar Consulta'
      Hint = 'Salvar consulta'
      OnClick = MNU_SALVARCONSULTAclick
    end
    object mnu_ExcluirConsulta: TMenuItem
      Caption = 'Excluir Consulta'
      Hint = 'Excluir consulta'
      OnClick = MNU_EXCLUIRCONSULTAclick
    end
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
