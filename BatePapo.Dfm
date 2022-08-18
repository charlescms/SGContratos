object FormBatePapo: TFormBatePapo
  Left = 1115
  Top = 316
  Width = 587
  Height = 413
  Caption = 'Bate Papo ( Rede Local )'
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
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 144
  TextHeight = 20
  object PnSup: TPanel
    Left = 0
    Top = 0
    Width = 579
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ShapeSup: TShape
      Left = 0
      Top = 0
      Width = 579
      Height = 31
      Align = alClient
      Brush.Color = 14743792
      ParentShowHint = False
      Pen.Color = 7021576
      ShowHint = True
    end
    object LbTituloForm: TLabel
      Left = 0
      Top = 0
      Width = 579
      Height = 31
      Align = alClient
      Alignment = taCenter
      Caption = 'Bate Papo ( Rede Local )'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      Layout = tlCenter
      OnClick = LbTituloFormClick
    end
    object BtnAjuda: TSpeedButton
      Left = 834
      Top = 3
      Width = 24
      Height = 22
      Hint = 'Ajuda'
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = False
    end
    object BtnFechar: TSpeedButton
      Left = 862
      Top = 3
      Width = 24
      Height = 22
      Hint = 'Fechar'
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Transparent = False
      OnClick = BtnFecharClick
    end
  end
  object PnInferior: TPanel
    Left = 0
    Top = 177
    Width = 579
    Height = 199
    Align = alBottom
    BevelOuter = bvNone
    Color = 13608528
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 132
      Width = 79
      Height = 20
      Caption = 'Mensagem'
    end
    object Label2: TLabel
      Left = 5
      Top = 74
      Width = 72
      Height = 20
      Caption = 'Falar para'
    end
    object Label3: TLabel
      Left = 5
      Top = 14
      Width = 107
      Height = 20
      Caption = 'Nome / Apelido'
    end
    object Label5: TLabel
      Left = 325
      Top = 43
      Width = 153
      Height = 24
      Caption = 'Nome da esta'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LbEstacao: TLabel
      Left = 466
      Top = 43
      Width = 15
      Height = 24
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object EdTexto: TEdit
      Left = 5
      Top = 154
      Width = 592
      Height = 21
      TabOrder = 2
    end
    object BtnEnviar: TButton
      Left = 603
      Top = 151
      Width = 115
      Height = 38
      Hint = 'Enviar mensagem'
      Caption = 'Enviar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BtnEnviarClick
    end
    object CbDestino: TComboBox
      Left = 5
      Top = 95
      Width = 255
      Height = 28
      Style = csDropDownList
      ItemHeight = 20
      TabOrder = 0
    end
    object EdApelido: TEdit
      Left = 5
      Top = 35
      Width = 255
      Height = 21
      TabOrder = 4
      OnExit = EdApelidoExit
    end
    object CheckTodos: TCheckBox
      Left = 271
      Top = 98
      Width = 89
      Height = 27
      Hint = 'Enviar mensagens para todos usu'#225'rios'
      Caption = 'TODOS'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object BtnFinalizar: TButton
      Left = 268
      Top = 40
      Width = 41
      Height = 26
      Hint = 'Sair do bate papo'
      Caption = 'Sair'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BtnFecharClick
    end
  end
  object MemoMensagem: TRichEdit
    Left = 0
    Top = 31
    Width = 579
    Height = 137
    Align = alClient
    BorderStyle = bsNone
    Color = 14671839
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -22
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object PnDivisao: TPanel
    Left = 0
    Top = 168
    Width = 579
    Height = 9
    Align = alBottom
    BevelInner = bvRaised
    TabOrder = 3
  end
end
