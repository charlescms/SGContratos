object FormTrocaContrato: TFormTrocaContrato
  Left = 589
  Top = 200
  Width = 374
  Height = 199
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
  OnClose = formclose
  OnKeyPress = formkeypress
  OnShow = formshow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 74
    Top = 115
    Width = 75
    Height = 25
    TabOrder = 0
    OnClick = BITBTN1click
    Kind = bkOK
  end
  object BitBtn3: TBitBtn
    Left = 214
    Top = 118
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkClose
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 18
    Width = 323
    Height = 77
    Caption = 'Contrato '
    TabOrder = 2
    object Label1: TLabel
      Left = 52
      Top = 21
      Width = 27
      Height = 13
      Caption = 'Velho'
    end
    object Label2: TLabel
      Left = 229
      Top = 23
      Width = 26
      Height = 13
      Caption = 'Novo'
    end
    object Ed_CONTRATO_NV: TEdit
      Left = 178
      Top = 40
      Width = 121
      Height = 21
      TabOrder = 0
      OnExit = ED_CONTRATO_NVexit
    end
    object CMB_CONTRATO: TComboBox
      Left = 22
      Top = 41
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnExit = CMB_CONTRATOexit
    end
  end
end
