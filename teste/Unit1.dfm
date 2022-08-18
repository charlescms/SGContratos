object Form1: TForm1
  Left = 202
  Top = 217
  Width = 783
  Height = 540
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
    Left = 16
    Top = 48
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 16
    Top = 200
    Width = 320
    Height = 120
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 24
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBNavigator2: TDBNavigator
    Left = 16
    Top = 168
    Width = 240
    Height = 25
    DataSource = DataSource3
    TabOrder = 3
  end
  object DBGrid3: TDBGrid
    Left = 408
    Top = 24
    Width = 320
    Height = 120
    DataSource = DataSource3
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid4: TDBGrid
    Left = 432
    Top = 184
    Width = 320
    Height = 120
    DataSource = DataSource4
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'D:\trabalho\SURIMPEx\Database\BASE.GDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    Left = 24
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    Active = True
    Left = 56
    Top = 8
  end
  object IBQuery1: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    SQL.Strings = (
      '  Select distinct'
      '    Situacao.Contrato AS Contrato,'
      '    Situacao.NomeMix AS NomeMix,'
      '    Situacao.FORCOD AS FORCOD,'
      '    Fornecedores.RAZAO AS RAZAO,'
      '    Situacao.C_C AS C_C,'
      '    Situacao.QuantidadeTotal AS QuantidadeTotal,'
      '    Situacao.PrecoFOBTotal AS PrecoFOBTotal,'
      '    Situacao.ValorSCCTotal AS ValorSCCTotal,'
      '    Situacao.QUANTTOTALEXP AS QUANTTOTALEXP,'
      '    Situacao.ValorTotalExp AS ValorTotalExp'
      '  from ( select'
      '         ContratoTransporte.Contrato AS Contrato,'
      '         ContratoTransporte.NomeMix AS NomeMix,'
      '         ContratoTransporte.FORCOD AS FORCOD,'
      '         ContratoTransporte.C_C AS C_C,'
      '         ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,'
      '         ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,'
      '         ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,'
      '         ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,'
      '         ContratoTransporte.ValorTotalExp AS ValorTotalExp'
      '         from  ContratoTransporte'
      '       ) as  Situacao'
      '  Left Outer Join Fornecedores on'
      '    Situacao.FORCOD = Fornecedores.FORCOD'
      '  Left Outer Join ExportadoTransito on'
      '    Situacao.Contrato = ExportadoTransito.Contrato'
      '  order by Situacao.NomeMix,Situacao.Contrato')
    Left = 32
    Top = 328
  end
  object IBQuery2: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    DataSource = DataSource4
    SQL.Strings = (
      '  Select  distinct'
      '    ExportadoTransito.Contrato as Contrato,'
      '    ExportadoTransito.Navio AS Navio,'
      '    ExportadoTransito.DataEmbarque AS DataEmbarque,'
      '    ExportadoTransito.QuantidadeExp AS QuantidadeExp,'
      '    ExportadoTransito.Valor AS Valor'
      '  from ExportadoTransito   , ( select'
      '         ContratoTransporte.Contrato AS Contrato,'
      '         ContratoTransporte.NomeMix AS NomeMix,'
      '         ContratoTransporte.FORCOD AS FORCOD,'
      '         ContratoTransporte.C_C AS C_C,'
      '         ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,'
      '         ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,'
      '         ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,'
      '         ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,'
      '         ContratoTransporte.ValorTotalExp AS ValorTotalExp'
      '         from  ContratoTransporte'
      '       ) as  Situacao , Fornecedores'
      '  where  ExportadoTransito.Contrato =  Situacao.Contrato'
      '    and  Situacao.FORCOD = Fornecedores.FORCOD'
      '    and  ExportadoTransito.Contrato = :Contrato'
      '  order by    ExportadoTransito.Contrato')
    Left = 64
    Top = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'CONTRATO'
        ParamType = ptUnknown
        Size = 16
      end>
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 32
    Top = 360
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 64
    Top = 360
  end
  object IBTable1: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    FieldDefs = <
      item
        Name = 'CONTRATO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'STATUSCT'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CLICOD'
        DataType = ftInteger
      end
      item
        Name = 'SEQ'
        DataType = ftSmallint
      end
      item
        Name = 'FORCOD'
        DataType = ftInteger
      end
      item
        Name = 'ID'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'C_C'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SDATAEMBARQUE'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'PRECOFOBTOTAL'
        DataType = ftFloat
      end
      item
        Name = 'QUANTIDADETOTAL'
        DataType = ftFloat
      end
      item
        Name = 'QUANTTOTALEXP'
        DataType = ftFloat
      end
      item
        Name = 'VALORSCCTOTAL'
        DataType = ftFloat
      end
      item
        Name = 'COMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'FORMCOMISSAO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'VALORTOTALCOMISSAO'
        DataType = ftFloat
      end
      item
        Name = 'VALORTOTALCOMISSAOEXECUTADO'
        DataType = ftFloat
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'DATAASS'
        DataType = ftDateTime
      end
      item
        Name = 'NOMEMIX'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COMENTARIO'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'QUANTADEPENDENTE'
        DataType = ftFloat
      end
      item
        Name = 'VALORTOTALEXP'
        DataType = ftFloat
      end
      item
        Name = 'VALORTOTALPENDENTE'
        DataType = ftFloat
      end
      item
        Name = 'VLTOTALCOMISSAOPENDENTE'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'ICONTRATOTRANSPORTE0'
        Fields = 'CONTRATO'
      end
      item
        Name = 'ICONTRATOTRANSPORTE'
        Fields = 'CONTRATO'
        Options = [ixUnique]
      end>
    MasterSource = DataSource2
    StoreDefs = True
    TableName = 'CONTRATOTRANSPORTE'
    Left = 368
    Top = 360
  end
  object DataSource3: TDataSource
    DataSet = IBTable1
    Left = 504
    Top = 264
  end
  object IBTable2: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    Active = True
    FieldDefs = <
      item
        Name = 'CONTRATO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'SEQ'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'NAVIO'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DATAEMBARQUE'
        DataType = ftDateTime
      end
      item
        Name = 'ETADESTINO'
        DataType = ftDateTime
      end
      item
        Name = 'FATURA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QUANTIDADEEXP'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'VALORDESCONTO'
        DataType = ftFloat
      end
      item
        Name = 'FORMPAGO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PRECOFOB'
        DataType = ftFloat
      end
      item
        Name = 'COMISAOSFATURA'
        DataType = ftFloat
      end
      item
        Name = 'STDOCUMENTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBS'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMENTARIO'
        DataType = ftMemo
        Size = 8
      end
      item
        Name = 'RATE'
        DataType = ftFloat
      end
      item
        Name = 'DATALIQ'
        DataType = ftDateTime
      end
      item
        Name = 'NUMNFEMIT'
        DataType = ftInteger
      end
      item
        Name = 'NUMFATURA'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DATAFATURA'
        DataType = ftDateTime
      end
      item
        Name = 'DATANF'
        DataType = ftDateTime
      end
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VALORCONVERTIDO'
        DataType = ftFloat
      end
      item
        Name = 'RECEBIMENTO'
        DataType = ftDateTime
      end
      item
        Name = 'VALOR_NF'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'IEXPORTADOTRANSITO'
        Fields = 'CONTRATO;SEQ'
        Options = [ixUnique]
      end>
    IndexFieldNames = 'CONTRATO'
    MasterFields = 'CONTRATO'
    MasterSource = DataSource1
    StoreDefs = True
    TableName = 'EXPORTADOTRANSITO'
    Left = 448
    Top = 408
  end
  object DataSource4: TDataSource
    DataSet = IBTable2
    Left = 408
    Top = 360
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 416
    Top = 272
    ReportForm = {17000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = IBQuery1
    Left = 192
    Top = 384
  end
  object frDBDataSet2: TfrDBDataSet
    DataSet = IBTable2
    Left = 328
    Top = 400
  end
  object frReport2: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Left = 192
    Top = 344
    ReportForm = {17000000}
  end
end
