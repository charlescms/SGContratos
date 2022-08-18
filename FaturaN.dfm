object FormFaturaN: TFormFaturaN
  Left = 68
  Top = 70
  Width = 1630
  Height = 686
  Caption = 'Entrada de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
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
  PixelsPerInch = 144
  TextHeight = 20
  object PagePrincipal: TPageControl
    Left = 0
    Top = 51
    Width = 1622
    Height = 598
    ActivePage = TabManutencao
    Align = alClient
    HotTrack = True
    TabOrder = 0
    OnChange = PAGEPRINCIPALchange
    object TabManutencao: TTabSheet
      Caption = '( &1 ) Manuten'#231#227'o'
      object PnSalva: TPanel
        Left = 0
        Top = 517
        Width = 1614
        Height = 46
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Img_Tabela: TImage
          Left = 1675
          Top = 11
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
          Left = 1488
          Top = 13
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
          Left = 13
          Top = 8
          Width = 115
          Height = 38
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
          Left = 131
          Top = 8
          Width = 115
          Height = 38
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
          Left = 1529
          Top = 8
          Width = 116
          Height = 38
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
        object BitBtn2: TBitBtn
          Left = 388
          Top = 8
          Width = 138
          Height = 38
          Caption = 'Concilia'#231#227'o'
          TabOrder = 3
          OnClick = BITBTN2click
        end
        object BitBtn3: TBitBtn
          Left = 979
          Top = 8
          Width = 139
          Height = 38
          Caption = 'Troca Situa'#231#227'o'
          TabOrder = 4
          OnClick = BITBTN3click
        end
        object BitBtn4: TBitBtn
          Left = 529
          Top = 8
          Width = 152
          Height = 38
          Caption = 'Concilia'#231#227'o Real.'
          TabOrder = 5
          OnClick = BITBTN4click
        end
        object BitBtn8: TBitBtn
          Left = 683
          Top = 8
          Width = 155
          Height = 38
          Hint = 'A'#231#245'es Sobre Fatura'
          Caption = 'Gerar Or. Coban'#231'a'
          TabOrder = 6
          OnClick = BITBTN8click
        end
        object BitBtn9: TBitBtn
          Left = 255
          Top = 8
          Width = 139
          Height = 38
          Caption = 'Filtrar'
          TabOrder = 7
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
        object BitBtn_NotaFiscal: TBitBtn
          Left = 1293
          Top = 8
          Width = 185
          Height = 38
          Caption = '&Aplicar Nota Fiscal'
          TabOrder = 8
          Visible = False
          OnClick = BITBTN_NOTAFISCALclick
          Kind = bkAll
        end
        object BitBtn_Rate: TBitBtn
          Left = 838
          Top = 8
          Width = 137
          Height = 38
          Caption = '&Aplicar Rate'
          TabOrder = 9
          OnClick = BITBTN_RATEclick
          Kind = bkAll
        end
        object Panel2: TPanel
          Left = 0
          Top = 3
          Width = 1614
          Height = 43
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 10
          object Image1: TImage
            Left = 1675
            Top = 11
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
          object Image2: TImage
            Left = 1599
            Top = 13
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
          object BitBtn15: TBitBtn
            Left = 21
            Top = 1
            Width = 128
            Height = 39
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
            Spacing = 0
          end
          object BitBtn18: TBitBtn
            Left = 149
            Top = 1
            Width = 129
            Height = 39
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
          object BitBtn19: TBitBtn
            Left = 1749
            Top = 5
            Width = 116
            Height = 38
            Hint = 'Tabelas relacionadas ...'
            Caption = '&Tabelas'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
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
          object BitBtn20: TBitBtn
            Left = 431
            Top = 1
            Width = 150
            Height = 39
            Caption = 'Concilia'#231#227'o'
            TabOrder = 3
            OnClick = BITBTN2click
          end
          object BitBtn21: TBitBtn
            Left = 1031
            Top = 43
            Width = 138
            Height = 38
            Caption = 'Troca Situa'#231#227'o'
            TabOrder = 9
            OnClick = BITBTN3click
          end
          object BitBtn22: TBitBtn
            Left = 583
            Top = 1
            Width = 165
            Height = 39
            Caption = 'Concilia'#231#227'o Real.'
            TabOrder = 4
            OnClick = BITBTN4click
          end
          object BitBtn23: TBitBtn
            Left = 749
            Top = 1
            Width = 166
            Height = 39
            Hint = 'A'#231#245'es Sobre Fatura'
            Caption = 'Gerar Or. Coban'#231'a'
            TabOrder = 5
            OnClick = BITBTN8click
          end
          object BitBtn24: TBitBtn
            Left = 278
            Top = 1
            Width = 150
            Height = 39
            Caption = 'Filtrar'
            TabOrder = 2
            OnClick = BITBTN1click
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
          object BitBtn25: TBitBtn
            Left = 1374
            Top = 0
            Width = 185
            Height = 39
            Caption = '&Aplicar Nota Fiscal'
            TabOrder = 10
            Visible = False
            OnClick = BITBTN_NOTAFISCALclick
            Kind = bkAll
            Spacing = 9
          end
          object BitBtn26: TBitBtn
            Left = 914
            Top = 1
            Width = 151
            Height = 39
            Caption = '&Aplicar Taxa'
            TabOrder = 6
            OnClick = BITBTN_RATEclick
            Kind = bkAll
          end
          object BitBtn27: TBitBtn
            Left = 1068
            Top = 1
            Width = 151
            Height = 39
            Caption = 'Rel. Fatura'
            TabOrder = 7
            OnClick = BITBTN10click
          end
          object BitBtn28: TBitBtn
            Left = 1220
            Top = 1
            Width = 151
            Height = 39
            Caption = 'Corrigir Comiss'#227'o'
            TabOrder = 8
            OnClick = BitBtn28Click
          end
        end
      end
      object TabPaginas: TTabSet
        Left = 0
        Top = 483
        Width = 1614
        Height = 34
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
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
        Width = 1614
        Height = 483
        Align = alClient
        BorderStyle = bsNone
        Color = clBtnFace
        ParentColor = False
        TabOrder = 0
        object NoManutencao: TNotebook
          Left = 0
          Top = 0
          Width = 1614
          Height = 483
          Align = alClient
          TabOrder = 0
          object PgPrincipal: TPage
            Left = 0
            Top = 0
            Caption = 'Principal'
            object Pagina0: TScrollBox
              Left = 0
              Top = 0
              Width = 1614
              Height = 483
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
              object DBG_FATURA: TDBGrid
                Left = 14
                Top = 490
                Width = 1569
                Height = 223
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -17
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnColExit = DBG_FATURAcolexit
                OnDrawColumnCell = DBG_FATURAdrawcolumncell
                OnDblClick = DBG_FATURAdblclick
                OnKeyPress = DBG_FATURAkeypress
              end
              object Panel1: TPanel
                Left = 13
                Top = 9
                Width = 1700
                Height = 452
                TabOrder = 1
                object LbcComentario: TLabel
                  Left = 1
                  Top = 371
                  Width = 82
                  Height = 20
                  Caption = 'Coment'#225'rio'
                  ParentShowHint = False
                  ShowHint = True
                end
                object Comentario: TDBMemo
                  Left = 1
                  Top = 391
                  Width = 1698
                  Height = 60
                  Align = alBottom
                  ParentShowHint = False
                  ScrollBars = ssVertical
                  ShowHint = True
                  TabOrder = 0
                  OnExit = COMENTARIOexit
                end
                object GroupBox_Contrato: TGroupBox
                  Left = 1
                  Top = 1
                  Width = 1698
                  Height = 199
                  Align = alTop
                  Caption = 'Contrato'
                  Enabled = False
                  TabOrder = 1
                  object LbcFORCOD: TLabel
                    Left = 13
                    Top = 138
                    Width = 78
                    Height = 20
                    Caption = 'Exportador'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcRAZAO: TLabel
                    Left = 119
                    Top = 138
                    Width = 94
                    Height = 20
                    Alignment = taRightJustify
                    Caption = 'Raz'#227'o Social'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcFormPago: TLabel
                    Left = 13
                    Top = 80
                    Width = 110
                    Height = 20
                    Caption = 'F. Pag p/Fatura'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcContrato: TLabel
                    Left = 13
                    Top = 21
                    Width = 62
                    Height = 20
                    Caption = 'Contrato'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcSeq: TLabel
                    Left = 166
                    Top = 21
                    Width = 33
                    Height = 20
                    Caption = 'Seq.'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcNavio: TLabel
                    Left = 206
                    Top = 21
                    Width = 39
                    Height = 20
                    Caption = 'Navio'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcPrecoFOB: TLabel
                    Left = 198
                    Top = 80
                    Width = 109
                    Height = 20
                    Caption = 'Pre'#231'o FOB Exp'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcComissao: TLabel
                    Left = 533
                    Top = 80
                    Width = 70
                    Height = 20
                    Caption = 'Comiss'#227'o'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcDataEmbarque: TLabel
                    Left = 494
                    Top = 21
                    Width = 113
                    Height = 20
                    Caption = 'Data Embarque'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcCadastro: TLabel
                    Left = 360
                    Top = 21
                    Width = 65
                    Height = 20
                    Caption = 'Cadastro'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcETADestino: TLabel
                    Left = 618
                    Top = 21
                    Width = 90
                    Height = 20
                    Caption = 'ETA Destino'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcFatura: TLabel
                    Left = 751
                    Top = 21
                    Width = 107
                    Height = 20
                    Caption = 'N'#250'mero Fatura'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcQuantidade: TLabel
                    Left = 949
                    Top = 21
                    Width = 83
                    Height = 20
                    Caption = 'Quantidade'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcValor: TLabel
                    Left = 1134
                    Top = 21
                    Width = 123
                    Height = 20
                    Caption = 'Valor Fatura Exp.'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcStatus: TLabel
                    Left = 1305
                    Top = 21
                    Width = 47
                    Height = 20
                    Caption = 'Status'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcOBS: TLabel
                    Left = 754
                    Top = 138
                    Width = 80
                    Height = 20
                    Caption = 'Obseva'#231#227'o'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcMOEDACOMISSAO: TLabel
                    Left = 568
                    Top = 138
                    Width = 123
                    Height = 20
                    Caption = 'Moeda Comiss'#227'o'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcFormComissao: TLabel
                    Left = 346
                    Top = 80
                    Width = 120
                    Height = 20
                    Caption = 'Forma Comiss'#227'o'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcComisaoSFatura: TLabel
                    Left = 681
                    Top = 80
                    Width = 125
                    Height = 20
                    Caption = 'Comis'#227'o s/Fatura'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcNomeMix: TLabel
                    Left = 841
                    Top = 80
                    Width = 69
                    Height = 20
                    Caption = 'Nome Mix'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object FormComissao: TDBComboBox
                    Left = 346
                    Top = 101
                    Width = 182
                    Height = 28
                    ItemHeight = 20
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 0
                    OnDrawItem = FORMCOMISSAOdrawitem
                    OnExit = FORMCOMISSAOexit
                  end
                  object RAZAO: TXDBEdit
                    Left = 103
                    Top = 155
                    Width = 456
                    Height = 24
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 1
                    Text = 'RAZAO'
                    OnExit = RAZAOexit
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
                  object FORCOD: TXDBNumEdit
                    Left = 13
                    Top = 155
                    Width = 88
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
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 2
                    OnExit = FORCODexit
                  end
                  object FormPago: TXDBLookUp
                    Left = 13
                    Top = 101
                    Width = 180
                    Height = 28
                    DropDownRows = 14
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 3
                    OnExit = FORMPAGOexit
                  end
                  object Contrato: TXDBEdit
                    Left = 13
                    Top = 45
                    Width = 148
                    Height = 24
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 4
                    Text = 'Contrato'
                    OnExit = CONTRATOexit
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
                  object Seq: TXDBNumEdit
                    Left = 166
                    Top = 45
                    Width = 35
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
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 5
                    OnExit = SEQexit
                  end
                  object Navio: TXDBEdit
                    Left = 206
                    Top = 45
                    Width = 149
                    Height = 24
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 6
                    Text = 'Navio'
                    OnExit = NAVIOexit
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
                  object Cadastro: TXDBDateEdit
                    Left = 360
                    Top = 45
                    Width = 131
                    Height = 24
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 7
                    Text = 'Cadastro'
                    OnExit = CADASTROexit
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    ShowButton = True
                  end
                  object PrecoFOB: TXDBNumEdit
                    Left = 198
                    Top = 101
                    Width = 143
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
                    ShowButton = True
                    TabOrder = 8
                    OnExit = PRECOFOBexit
                  end
                  object Comissao: TXDBNumEdit
                    Left = 533
                    Top = 101
                    Width = 145
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
                    ReadOnly = True
                    ShowHint = True
                    ShowButton = True
                    TabOrder = 9
                    OnExit = COMISSAOexit
                  end
                  object DataEmbarque: TXDBDateEdit
                    Left = 494
                    Top = 45
                    Width = 117
                    Height = 24
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 10
                    Text = 'DataEmbarque'
                    OnExit = DATAEMBARQUEexit
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    ShowButton = True
                  end
                  object Status: TDBComboBox
                    Left = 1293
                    Top = 45
                    Width = 112
                    Height = 28
                    ItemHeight = 20
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 11
                    OnDrawItem = STATUSdrawitem
                    OnExit = STATUSexit
                  end
                  object Valor: TXDBNumEdit
                    Left = 1134
                    Top = 45
                    Width = 154
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
                    ReadOnly = True
                    ShowHint = True
                    ShowButton = True
                    TabOrder = 12
                    OnExit = VALORexit
                  end
                  object QuantidadeExp: TXDBNumEdit
                    Left = 954
                    Top = 45
                    Width = 177
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
                    ShowButton = True
                    TabOrder = 13
                    OnExit = QUANTIDADEEXPexit
                  end
                  object Fatura: TXDBEdit
                    Left = 751
                    Top = 45
                    Width = 192
                    Height = 24
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 14
                    Text = 'Fatura'
                    OnExit = FATURAexit
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
                  object ComisaoSFatura: TXDBNumEdit
                    Left = 681
                    Top = 101
                    Width = 144
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
                    ShowButton = True
                    TabOrder = 15
                    OnExit = COMISAOSFATURAexit
                  end
                  object NomeMix: TXDBLookUp
                    Left = 843
                    Top = 101
                    Width = 230
                    Height = 28
                    DropDownRows = 14
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 16
                    OnExit = NOMEMIXexit
                  end
                  object StDocumento: TDBRadioGroup
                    Left = 1095
                    Top = 83
                    Width = 186
                    Height = 80
                    Caption = 'Status Documentos'
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 17
                    OnExit = STDOCUMENTOexit
                  end
                  object OBS: TXDBEdit
                    Left = 753
                    Top = 155
                    Width = 306
                    Height = 24
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 18
                    Text = 'OBS'
                    OnExit = OBSexit
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
                  object MOEDACOMISSAO: TDBComboBox
                    Left = 568
                    Top = 155
                    Width = 181
                    Height = 28
                    ItemHeight = 20
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 19
                    OnDrawItem = MOEDACOMISSAOdrawitem
                    OnExit = MOEDACOMISSAOexit
                  end
                  object ETADestino: TXDBDateEdit
                    Left = 618
                    Top = 45
                    Width = 123
                    Height = 24
                    ParentShowHint = False
                    ReadOnly = True
                    ShowHint = True
                    TabOrder = 20
                    Text = 'ETADestino'
                    OnExit = ETADESTINOexit
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    ShowButton = True
                  end
                end
                object GroupBox_Fatura: TGroupBox
                  Left = 1
                  Top = 200
                  Width = 1698
                  Height = 89
                  Align = alTop
                  Caption = 'Dados Ordem Cobran'#231'a'
                  TabOrder = 2
                  object LbcDataLiq: TLabel
                    Left = 21
                    Top = 19
                    Width = 64
                    Height = 20
                    Caption = 'Data Liq.'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcRate: TLabel
                    Left = 158
                    Top = 19
                    Width = 35
                    Height = 20
                    Caption = 'Rate'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcValorConvertido: TLabel
                    Left = 475
                    Top = 19
                    Width = 117
                    Height = 20
                    Caption = 'Valor Convertido'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcValorDesconto: TLabel
                    Left = 941
                    Top = 19
                    Width = 69
                    Height = 20
                    Caption = 'Desconto'
                    ParentShowHint = False
                    ShowHint = True
                    Visible = False
                  end
                  object LbcDataOrdCobranca: TLabel
                    Left = 766
                    Top = 19
                    Width = 142
                    Height = 20
                    Caption = 'Data Ord. Cobran'#231'a'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcNumOrdCobranca: TLabel
                    Left = 639
                    Top = 19
                    Width = 103
                    Height = 20
                    Caption = 'Ord. Cobran'#231'a'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcMOEDACOMISSAOTAXA: TLabel
                    Left = 334
                    Top = 19
                    Width = 87
                    Height = 20
                    Caption = 'Moeda Taxa'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object DataLiq: TXDBDateEdit
                    Left = 18
                    Top = 35
                    Width = 128
                    Height = 24
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    Text = 'DataLiq'
                    OnExit = DATALIQexit
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    ShowButton = True
                  end
                  object Rate: TXDBNumEdit
                    Left = 154
                    Top = 35
                    Width = 167
                    Height = 24
                    AutoHideCalculator = False
                    Decimals = 11
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
                    ShowButton = True
                    TabOrder = 1
                    OnExit = RATEexit
                  end
                  object ValorConvertido: TXDBNumEdit
                    Left = 478
                    Top = 35
                    Width = 153
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
                    ShowButton = True
                    TabOrder = 3
                    OnExit = VALORCONVERTIDOexit
                  end
                  object ValorDesconto: TXDBNumEdit
                    Left = 911
                    Top = 35
                    Width = 150
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
                    ShowButton = True
                    TabOrder = 6
                    Visible = False
                    OnExit = VALORDESCONTOexit
                  end
                  object DataOrdCobranca: TXDBDateEdit
                    Left = 769
                    Top = 35
                    Width = 134
                    Height = 24
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 5
                    Text = 'DataOrdCobranca'
                    OnExit = DATAORDCOBRANCAexit
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    ShowButton = True
                  end
                  object NumOrdCobranca: TXDBEdit
                    Left = 640
                    Top = 35
                    Width = 119
                    Height = 24
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 4
                    Text = 'NumOrdCobranca'
                    OnExit = NUMORDCOBRANCAexit
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
                  object MOEDACOMISSAOTAXA: TDBComboBox
                    Left = 333
                    Top = 35
                    Width = 136
                    Height = 28
                    ItemHeight = 20
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    OnDrawItem = MOEDACOMISSAOTAXAdrawitem
                    OnExit = MOEDACOMISSAOTAXAexit
                  end
                  object Panel3: TPanel
                    Left = 1325
                    Top = 22
                    Width = 371
                    Height = 65
                    Align = alRight
                    TabOrder = 7
                    object BitBtn16: TBitBtn
                      Left = 193
                      Top = 35
                      Width = 138
                      Height = 30
                      Caption = 'Selecionar Todos'
                      TabOrder = 0
                      OnClick = BITBTN16click
                    end
                    object BitBtn17: TBitBtn
                      Left = 190
                      Top = 3
                      Width = 111
                      Height = 31
                      Caption = 'Deselecionar'
                      TabOrder = 1
                      OnClick = BITBTN17click
                    end
                    object Selecionado: TDBCheckBox
                      Left = 3
                      Top = 3
                      Width = 186
                      Height = 26
                      Caption = 'Selecionar Individual'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 2
                      ValueChecked = 'True'
                      ValueUnchecked = 'False'
                      OnClick = SELECIONADOclick
                      OnExit = SELECIONADOexit
                    end
                    object Button1: TButton
                      Left = 4
                      Top = 31
                      Width = 84
                      Height = 24
                      Caption = '->'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -22
                      Font.Name = 'MS Sans Serif'
                      Font.Style = [fsBold]
                      ParentFont = False
                      TabOrder = 3
                      OnClick = BUTTON1click
                    end
                  end
                end
                object GroupBox_NotaF: TGroupBox
                  Left = 1
                  Top = 289
                  Width = 1698
                  Height = 87
                  Align = alTop
                  Caption = 'Nota Fiscal'
                  TabOrder = 3
                  object LbcDataNF: TLabel
                    Left = 153
                    Top = 19
                    Width = 60
                    Height = 20
                    Caption = 'Data NF'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcNumNFEmit: TLabel
                    Left = 13
                    Top = 19
                    Width = 79
                    Height = 20
                    Caption = 'Nota Fiscal'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcValor_NF: TLabel
                    Left = 329
                    Top = 19
                    Width = 62
                    Height = 20
                    Alignment = taRightJustify
                    Caption = 'Valor NF'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LbcRecebimento: TLabel
                    Left = 480
                    Top = 19
                    Width = 95
                    Height = 20
                    Alignment = taRightJustify
                    Caption = 'Recebimento'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object DataNF: TXDBDateEdit
                    Left = 153
                    Top = 43
                    Width = 156
                    Height = 24
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    Text = 'DataNF'
                    OnExit = DATANFexit
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    ShowButton = True
                  end
                  object NumNFEmit: TXDBNumEdit
                    Left = 13
                    Top = 43
                    Width = 136
                    Height = 24
                    AutoHideCalculator = False
                    Decimals = 0
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
                    OnExit = NUMNFEMITexit
                  end
                  object Valor_NF: TXDBNumEdit
                    Left = 318
                    Top = 41
                    Width = 136
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
                    ShowButton = True
                    TabOrder = 2
                    OnExit = VALOR_NFexit
                  end
                  object Recebimento: TXDBDateEdit
                    Left = 468
                    Top = 43
                    Width = 147
                    Height = 24
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 3
                    Text = 'Recebimento'
                    OnExit = RECEBIMENTOexit
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    ShowButton = True
                  end
                end
                object GroupBox_CalcularRate: TGroupBox
                  Left = 698
                  Top = 309
                  Width = 502
                  Height = 125
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 4
                  Visible = False
                  object Label5: TLabel
                    Left = 49
                    Top = 15
                    Width = 35
                    Height = 20
                    Caption = 'Rate'
                  end
                  object Label6: TLabel
                    Left = 234
                    Top = 13
                    Width = 64
                    Height = 20
                    Caption = 'Data Liq.'
                  end
                  object Label10: TLabel
                    Left = 359
                    Top = 13
                    Width = 87
                    Height = 20
                    Caption = 'Moeda Taxa'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object BitBtn11: TBitBtn
                    Left = 113
                    Top = 78
                    Width = 115
                    Height = 37
                    TabOrder = 0
                    OnClick = BITBTN11click
                    Kind = bkOK
                  end
                  object BitBtn12: TBitBtn
                    Left = 283
                    Top = 78
                    Width = 116
                    Height = 37
                    TabOrder = 1
                    OnClick = BITBTN12click
                    Kind = bkCancel
                  end
                  object XDateEdit_DataLiq: TXDateEdit
                    Left = 198
                    Top = 38
                    Width = 136
                    Height = 24
                    DateText = '00/00/0000'
                    DateValue = -693594.000000000000000000
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    TabOrder = 2
                  end
                  object XNumEdit_Rate: TXNumEdit
                    Left = 25
                    Top = 38
                    Width = 161
                    Height = 24
                    Decimals = 11
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
                    TabOrder = 3
                    ValueInt = 0
                  end
                  object cmb_moeda: TComboBox
                    Left = 345
                    Top = 38
                    Width = 149
                    Height = 28
                    ItemHeight = 20
                    TabOrder = 4
                  end
                end
                object GroupBox_notaFiscal: TGroupBox
                  Left = 1229
                  Top = 308
                  Width = 482
                  Height = 125
                  Color = 16776176
                  ParentColor = False
                  TabOrder = 5
                  Visible = False
                  object Label7: TLabel
                    Left = 38
                    Top = 13
                    Width = 79
                    Height = 20
                    Caption = 'Nota Fiscal'
                  end
                  object Label8: TLabel
                    Left = 198
                    Top = 13
                    Width = 60
                    Height = 20
                    Caption = 'Data NF'
                  end
                  object Label9: TLabel
                    Left = 369
                    Top = 13
                    Width = 62
                    Height = 20
                    Caption = 'Valor NF'
                  end
                  object BitBtn13: TBitBtn
                    Left = 99
                    Top = 74
                    Width = 115
                    Height = 39
                    TabOrder = 0
                    OnClick = BITBTN13click
                    Kind = bkOK
                  end
                  object BitBtn14: TBitBtn
                    Left = 271
                    Top = 74
                    Width = 115
                    Height = 39
                    TabOrder = 1
                    OnClick = BITBTN14click
                    Kind = bkCancel
                  end
                  object XDateEdit_DataNF: TXDateEdit
                    Left = 173
                    Top = 38
                    Width = 136
                    Height = 24
                    DateText = '00/00/0000'
                    DateValue = -693594.000000000000000000
                    Glyph.Data = {
                      56060000424D560600000000000036000000280000001C0000000E0000000100
                      2000000000002006000000000000000000000000000000000000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000080
                      8000008080000080800000808000008080000080800000808000008080000080
                      80000080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000FF000000FF00FFFFFF000000FF000000FF0000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FFFFFF000000000000000000FFFF
                      FF000000000000000000FFFFFF00000000000000000000808000C0C0C000C0C0
                      C000C0C0C00080808000FFFFFF008080800080808000FFFFFF00808080008080
                      8000FFFFFF00808080008080800080808000C0C0C000C0C0C000C0C0C0008080
                      8000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0
                      C000C0C0C00000808000C0C0C000C0C0C000C0C0C00080808000FFFFFF00C0C0
                      C000C0C0C000FFFFFF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                      FF00FF00000000808000C0C0C000C0C0C000C0C0C00080808000C0C0C000FFFF
                      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008080
                      8000C0C0C000C0C0C000C0C0C00080808000FF000000FF000000FF000000FF00
                      0000FF000000FF000000FF000000FF000000FF00000000808000C0C0C000C0C0
                      C000C0C0C00080808000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C00080808000C0C0C000C0C0C000C0C0C0008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      80008080800000808000C0C0C000C0C0C000C0C0C00080808000808080008080
                      8000808080008080800080808000808080008080800080808000808080008080
                      8000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
                      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000}
                    Hora = False
                    TabOrder = 2
                  end
                  object XNumEdit_NotaFiscal: TXNumEdit
                    Left = 13
                    Top = 38
                    Width = 136
                    Height = 24
                    Decimals = 0
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
                    TabOrder = 3
                    ValueInt = 0
                  end
                  object XNumEdit_ValorNF: TXNumEdit
                    Left = 333
                    Top = 38
                    Width = 136
                    Height = 24
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
                    TabOrder = 4
                    ValueInt = 0
                  end
                end
              end
              object Ck_Selecionado: TDBCheckBox
                Left = 714
                Top = 406
                Width = 51
                Height = 27
                Caption = 'Ck_Selecionado'
                TabOrder = 2
                ValueChecked = 'True'
                ValueUnchecked = 'False'
                Visible = False
                OnClick = CK_SELECIONADOclick
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
              Width = 1614
              Height = 483
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
              Width = 1614
              Height = 483
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
              Width = 1614
              Height = 483
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
              Width = 1614
              Height = 483
              Align = alClient
              BorderStyle = bsNone
              TabOrder = 0
            end
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
      end
    end
    object TabConsulta: TTabSheet
      Caption = '( &2 ) Consulta'
      ImageIndex = 1
      object PnInfConsulta: TPanel
        Left = 0
        Top = 517
        Width = 1614
        Height = 46
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        object BtnRelac_2: TBitBtn
          Left = 726
          Top = 8
          Width = 115
          Height = 38
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
        object BitBtn5: TBitBtn
          Left = 159
          Top = 8
          Width = 139
          Height = 38
          Caption = 'Concilia'#231#227'o'
          TabOrder = 1
        end
        object BitBtn6: TBitBtn
          Left = 309
          Top = 8
          Width = 139
          Height = 38
          Caption = 'Concilia'#231#227'o Real.'
          TabOrder = 2
        end
        object BitBtn7: TBitBtn
          Left = 451
          Top = 8
          Width = 138
          Height = 38
          Hint = 'A'#231#245'es Sobre Fatura'
          Caption = 'Gerar Ord. Comb.'
          TabOrder = 3
        end
        object BitBtn1: TBitBtn
          Left = 9
          Top = 8
          Width = 139
          Height = 38
          Caption = 'Filtrar'
          TabOrder = 4
          OnClick = BITBTN1click
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
        object BitBtn10: TBitBtn
          Left = 589
          Top = 8
          Width = 139
          Height = 38
          Caption = 'Rel. Fatura'
          TabOrder = 5
          OnClick = BITBTN10click
        end
      end
      object GridConsulta: TDBGrid
        Left = 0
        Top = 0
        Width = 1614
        Height = 356
        Align = alClient
        BorderStyle = bsNone
        DataSource = DataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
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
        OnDrawColumnCell = GRIDCONSULTAdrawcolumncell
        OnDblClick = GRIDCONSULTAdblclick
      end
      object AbaConsulta: TTabSet
        Left = 0
        Top = 483
        Width = 1614
        Height = 34
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Tabs.Strings = (
          'Principal')
        TabIndex = 0
        OnClick = ABACONSULTAclick
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 356
        Width = 1614
        Height = 127
        Align = alBottom
        TabOrder = 3
        object GroupBox2: TGroupBox
          Left = 459
          Top = 13
          Width = 232
          Height = 100
          Caption = 'Periodo Embarque'
          TabOrder = 0
          object Label3: TLabel
            Left = 11
            Top = 26
            Width = 40
            Height = 20
            Caption = 'Inicial'
          end
          object Label4: TLabel
            Left = 13
            Top = 63
            Width = 34
            Height = 20
            Caption = 'Final'
          end
          object DT_INCIAL: TDateEdit
            Left = 60
            Top = 19
            Width = 153
            Height = 27
            ButtonWidth = 26
            NumGlyphs = 2
            TabOrder = 0
          end
          object DT_FINAL: TDateEdit
            Left = 61
            Top = 58
            Width = 153
            Height = 27
            ButtonWidth = 26
            NumGlyphs = 2
            TabOrder = 1
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 13
          Width = 458
          Height = 100
          TabOrder = 1
          object Label1: TLabel
            Left = 25
            Top = 26
            Width = 78
            Height = 20
            Caption = 'Exportador'
          end
          object Label2: TLabel
            Left = 25
            Top = 63
            Width = 63
            Height = 20
            Caption = 'Situa'#231#227'o'
          end
          object CMB_SITUACAO: TComboBox
            Left = 115
            Top = 58
            Width = 336
            Height = 24
            ItemHeight = 0
            TabOrder = 0
          end
          object CMB_EXP: TComboBox
            Left = 115
            Top = 19
            Width = 336
            Height = 24
            ItemHeight = 0
            TabOrder = 1
            OnChange = CMB_EXPchange
          end
        end
        object GroupBox4: TGroupBox
          Left = 693
          Top = 11
          Width = 285
          Height = 102
          Caption = 'Fatura Exporta'#231#227'o'
          TabOrder = 2
          object CMB_FATURA: TComboBox
            Left = 13
            Top = 25
            Width = 260
            Height = 24
            ItemHeight = 0
            TabOrder = 0
          end
        end
      end
    end
  end
  object PnSuperior: TPanel
    Left = 0
    Top = 0
    Width = 1622
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object BtnIncluir: TSpeedButton
      Left = 6
      Top = 5
      Width = 115
      Height = 38
      Hint = 'Incluir novo registro'
      Caption = '&Incluir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333300000000000033333FFFFFFFFFFFF3330FFFFFFFFF
        F03333777777777777F3330FFFFFFFFFF033337F3333333337F3330FFFFFFFFF
        F033337F3333333337F3330FFFFFFFFFF033337F3333333337F3330FFFFFFFFF
        F033337F3333333337F3330FFFFFFFFFF033337F3333333337F3330FFFFFFFFF
        F033337F3333333337F3330FFFFFFFFFF033337F3333333337F3330FFFFFF000
        0033337F3333377777F3330FFFFFF0FF0333337F333337FFFFF3330FFFFFF0F0
        3333337F333337F33333330FFFFFF0033333337FFFFFF7F33333330000000033
        3333337777777733333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = BTNINCLUIRclick
    end
    object BtnModificar: TSpeedButton
      Left = 121
      Top = 5
      Width = 117
      Height = 38
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
    object BtnExcluir: TSpeedButton
      Left = 238
      Top = 5
      Width = 115
      Height = 38
      Hint = 'Excluir registro'
      Caption = '&Excluir'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333338808833
        3333333338FF88333333333880F00883333333388F3FF883333333800FF0F088
        3333338FF33F3F883333300FFFF0FF0883333FF3333F33F8833330FFFFF0FFFC
        88333F33333F33FF883330FFFFF0FFFCC8833F33333F33F3F88330FFFF0F0FFC
        CC883F3333F3F3F33F8830FF00FFF0FCCCC83F33FF333FF333F83000FFFFFFCC
        CCC83FFF33333F3333F830FFFFFFFFCFCCC83F333333FF3F33F8330FFFFFCCCC
        FCC833F333FF3333F3F83330FFCCCCCCCFC8333F3F3333333FF83333CCCCCCCC
        CCC83333F333333333F833333CCCCCCCCCC333333F33333333F3333333CCCCCC
        CC33333333F33333FF333333333CCCCC33333333333FFFFF3333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = BTNEXCLUIRclick
    end
    object BtnLocalizar: TSpeedButton
      Left = 353
      Top = 5
      Width = 115
      Height = 38
      Hint = 'Localizar registro(s)'
      Caption = '&Localizar'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333300
        3333333333333333FF333333333330EC033333333333333FE7F3330000000ECC
        00333333FFFFFFFE77FF33033330ECC330333333F8888FE7788F330FFF0ECC3F
        30333333F333FE77838F3300003CC3FF30333333FFFF8778338F303E30003FFF
        3033333F8E8FFF83338F0FE3E303FFFF303333F3E8E8F833338F0EFE3E03FFFF
        303333FE3E8EF833338F0FEFE303FFFF303333F3E3E8F833338F30FEF03FFFFF
        3033333F3E3F8333338F330003FFFFFF30333333FFF83333338F330FFFFFFF00
        00333333F3333333FFFF330FFFFFFF3F03333333F333333383F3330FFFFFFF30
        33333333F33333338F3333000000000333333333FFFFFFFFF333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = BTNLOCALIZARclick
    end
    object BtnTabela: TSpeedButton
      Left = 480
      Top = 54
      Width = 115
      Height = 39
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
    object BtnPrimeiro: TSpeedButton
      Left = 583
      Top = 5
      Width = 37
      Height = 38
      Hint = 'Posicionar no primeiro registro'
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
      Left = 620
      Top = 5
      Width = 38
      Height = 38
      Hint = 'Posicionar no registro anterior'
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
      Left = 658
      Top = 5
      Width = 36
      Height = 38
      Hint = 'Posicionar no pr'#243'ximo registro'
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
      Left = 694
      Top = 5
      Width = 37
      Height = 38
      Hint = 'Posicionar no '#250'ltimo registro'
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
    object BtnRefresh: TSpeedButton
      Left = 731
      Top = 5
      Width = 37
      Height = 38
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
      Top = 46
      Width = 1622
      Height = 5
      Align = alBottom
      TabOrder = 0
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
