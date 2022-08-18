object FormTBSTATUS: TFormTBSTATUS
  Left = 687
  Top = 102
  Width = 574
  Height = 393
  Caption = 'Entrada de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  WindowState = wsMaximized
  OnActivate = formactivate
  OnClose = formclose
  OnCloseQuery = formclosequery
  OnKeyPress = formkeypress
  OnResize = formresize
  OnShow = formshow
  PixelsPerInch = 96
  TextHeight = 13
  object PagePrincipal: TPageControl
    Left = 0
    Top = 20
    Width = 558
    Height = 335
    ActivePage = TabManutencao
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = PAGEPRINCIPALchange
    object TabManutencao: TTabSheet
      Caption = '( &1 ) Manuten'#231#227'o'
      object PnSalva: TPanel
        Left = 0
        Top = 276
        Width = 550
        Height = 31
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object BtnSalvar: TBitBtn
          Left = 8
          Top = 5
          Width = 75
          Height = 25
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
          Left = 98
          Top = 5
          Width = 75
          Height = 25
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
        object BtnRelac_1: TBitBtn
          Left = 188
          Top = 5
          Width = 75
          Height = 25
          Hint = 'Tabelas relacionadas ...'
          Caption = '&Tabelas'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Visible = False
          OnClick = BTNRELAC_1click
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
        end
      end
      object TabPaginas: TTabSet
        Left = 0
        Top = 255
        Width = 550
        Height = 21
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Tabs.Strings = (
          'Principal')
        TabIndex = 0
        OnClick = TABPAGINASclick
      end
      object PgPagina1: TScrollBox
        Left = 0
        Top = 0
        Width = 550
        Height = 255
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object NoManutencao: TNotebook
          Left = 0
          Top = 0
          Width = 550
          Height = 255
          Align = alClient
          TabOrder = 0
          object PgPrincipal: TPage
            Left = 0
            Top = 0
            Caption = 'Principal'
            object Pagina0: TScrollBox
              Left = 0
              Top = 0
              Width = 550
              Height = 255
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              object LbcStatusCT: TLabel
                Left = 10
                Top = 1
                Width = 30
                Height = 13
                Caption = 'Status'
                ParentShowHint = False
                ShowHint = True
              end
              object LbcDescricao: TLabel
                Left = 10
                Top = 40
                Width = 48
                Height = 13
                Caption = 'Descri'#231#227'o'
                ParentShowHint = False
                ShowHint = True
              end
              object StatusCT: TXDBEdit
                Left = 10
                Top = 15
                Width = 28
                Height = 21
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Text = 'StatusCT'
                OnExit = STATUSCTExit
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
              object Descricao: TXDBEdit
                Left = 10
                Top = 54
                Width = 119
                Height = 21
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                Text = 'Descricao'
                OnExit = DESCRICAOExit
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
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
              Width = 571
              Height = 286
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
          end
        end
      end
    end
    object TabConsulta: TTabSheet
      Caption = '( &2 ) Consulta'
      ImageIndex = 1
      object PnInfConsulta: TPanel
        Left = 0
        Top = 307
        Width = 571
        Height = 31
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object BtnRelac_2: TBitBtn
          Left = 8
          Top = 5
          Width = 75
          Height = 25
          Hint = 'Tabelas relacionadas ...'
          Caption = '&Tabelas'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = False
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
        end
      end
      object GridConsulta: TDBGrid
        Left = 0
        Top = 0
        Width = 571
        Height = 286
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
      object AbaConsulta: TTabSet
        Left = 0
        Top = 286
        Width = 571
        Height = 21
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Tabs.Strings = (
          'Principal')
        TabIndex = 0
        OnClick = ABACONSULTAclick
      end
    end
  end
  object PnSup: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object ShapeSup: TShape
      Left = 0
      Top = 0
      Width = 558
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
      Width = 558
      Height = 20
      Align = alClient
      Alignment = taCenter
      Caption = 'Entrada de Dados'
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
      Left = 529
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
      OnClick = BTNAJUDAclick
    end
    object BtnFechar: TSpeedButton
      Left = 547
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
      OnClick = BTNFECHARclick
    end
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
  object PopRelacionados: TPopupMenu
  end
end
