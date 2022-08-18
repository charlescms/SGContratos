object Form1: TForm1
  Left = 216
  Top = 252
  Width = 944
  Height = 457
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 936
    Height = 344
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 936
    Height = 25
    DataSource = DataSource1
    Align = alTop
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'D:\trabalho\SURIMPEx\Database\BASE.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 40
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = True
    Left = 72
    Top = 8
  end
  object DContratoTransporte: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    SQL.Strings = (
      'select distinct'
      '       ContratoTransporte.contrato  as "Contrato"  ,'
      '       Fornecedores.razao as "Provedor",'
      '       ContratoTransporte.nomemix as "Produto",'
      
        '       ROUND(ContratoTransporte.Comissao, 2)  || '#39' / '#39'|| Contrat' +
        'oTransporte.FormComissao    as "% Comission"         ,'
      '       ContratoTransporte.FormComissao as "Unid.",'
      '       ContratoTransporte.ValorTotalExp as "Valor Ejecutado",'
      '       ExpotadoTransito.NumFatura as "No Factura",'
      '       ContratoTransporte.QUANTTOTALEXP as "Cantidad",'
      
        '       ExpotadoTransito.ComisaoSFatura as "Valor de La Comision"' +
        ' ,'
      '       ExpotadoTransito.NumNFEmit as "No Nota Fiscal",'
      '       ExpotadoTransito.datanf as "Fecha de Emision NF",'
      '       ExpotadoTransito.Valor_NF as "Valor Fechamento"  ,'
      '       ExpotadoTransito.Recebimento  as   "Fecha de Cobro"'
      'from  ContratoTransporte, ExpotadoTransito,Fornecedores'
      'where ContratoTransporte.contrato = ExpotadoTransito.contrato'
      '  and ContratoTransporte.forcod =  Fornecedores.forcod')
    Left = 8
    Top = 8
    object DContratoTransporteContrato: TIBStringField
      FieldName = 'Contrato'
      Origin = '"CONTRATOTRANSPORTE"."CONTRATO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object DContratoTransporteProvedor: TIBStringField
      FieldName = 'Provedor'
      Origin = '"FORNECEDORES"."RAZAO"'
      Size = 50
    end
    object DContratoTransporteProduto: TIBStringField
      FieldName = 'Produto'
      Origin = '"CONTRATOTRANSPORTE"."NOMEMIX"'
      Size = 30
    end
    object DContratoTransporteComission: TIBStringField
      FieldName = '% Comission'
      ProviderFlags = []
      Size = 29
    end
    object DContratoTransporteUnid: TIBStringField
      FieldName = 'Unid.'
      Origin = '"CONTRATOTRANSPORTE"."FORMCOMISSAO"'
      Size = 2
    end
    object DContratoTransporteValorEjecutado: TFloatField
      FieldName = 'Valor Ejecutado'
      Origin = '"CONTRATOTRANSPORTE"."VALORTOTALEXP"'
    end
    object DContratoTransporteNoFactura: TIBStringField
      FieldName = 'No Factura'
      Origin = '"EXPOTADOTRANSITO"."NUMFATURA"'
      Size = 8
    end
    object DContratoTransporteCantidad: TFloatField
      FieldName = 'Cantidad'
      Origin = '"CONTRATOTRANSPORTE"."QUANTTOTALEXP"'
    end
    object DContratoTransporteValordeLaComision: TFloatField
      FieldName = 'Valor de La Comision'
      Origin = '"EXPOTADOTRANSITO"."COMISAOSFATURA"'
    end
    object DContratoTransporteNoNotaFiscal: TIntegerField
      FieldName = 'No Nota Fiscal'
      Origin = '"EXPOTADOTRANSITO"."NUMNFEMIT"'
    end
    object DContratoTransporteFechadeEmisionNF: TDateTimeField
      FieldName = 'Fecha de Emision NF'
      Origin = '"EXPOTADOTRANSITO"."DATANF"'
    end
    object DContratoTransporteValorFechamento: TFloatField
      FieldName = 'Valor Fechamento'
      Origin = '"EXPOTADOTRANSITO"."VALOR_NF"'
    end
    object DContratoTransporteFechadeCobro: TDateTimeField
      FieldName = 'Fecha de Cobro'
      Origin = '"EXPOTADOTRANSITO"."RECEBIMENTO"'
    end
  end
  object DataSource1: TDataSource
    DataSet = DContratoTransporte
    Left = 112
    Top = 8
  end
  object frReport1: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 184
    Top = 8
    ReportForm = {17000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = DContratoTransporte
    Left = 216
    Top = 8
  end
  object frDesigner1: TfrDesigner
    Left = 152
    Top = 8
  end
end
