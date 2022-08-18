Select
  ContratoTransporte.Contrato AS Contrato,
  ContratoTransporte.Cadastro AS Cadastro,
  ContratoTransporte.StatusCT AS StatusCT,
  ContratoTransporte.CLICOD AS CLICOD,
  Clientes.RAZAO AS RAZAO,
  ContratoTransporte.seq AS seq,
  DIVISOES.NOME AS NOME,
  ContratoTransporte.FORCOD AS FORCOD,
  Fornecedores.RAZAO AS RAZAOEXPOSTADOR,
  ContratoTransporte.ID AS ID,
  TAB_PAIS.NOME AS NOME_PAIS,
  ContratoTransporte.C_C AS C_C,
  ContratoTransporte.SDataEmbarque AS SDataEmbarque,
  ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,
  ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,
  ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,
  ContratoTransporte.QuantadePendente AS QuantadePendente,
  ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,
  ContratoTransporte.ValorTotalExp AS ValorTotalExp,
  ContratoTransporte.ValorTotalPendente AS ValorTotalPendente,
  ContratoTransporte.Comissao AS Comissao,
  ContratoTransporte.FormComissao AS FormComissao,
  ContratoTransporte.ValorTotalComissao AS ValorTotalComissao,
  ContratoTransporte.ValorTotalComissaoExecutado AS ValorTotalComissaoExecutado,
  ContratoTransporte.OBS AS OBS,
  ContratoTransporte.DataAss AS DataAss,
  ContratoTransporte.NomeMix AS NomeMix,
  ContratoTransporte.Comentario AS Comentario,
  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,
  Produtos.QUANT_PREVISTA AS QUANT_PREVISTA,
  Produtos.VALOR_PREVISTO AS VALOR_PREVISTO,
  ContratoTransporte.VlTotalComissaoPendente AS VlTotalComissaoPendente,
  Fornecedores.ID AS ID_FORN,
  ContratoTransporte.Usuario AS Usuario
from ContratoTransporte
Left Outer Join TbCondicaoCompra on
  ContratoTransporte.C_C = TbCondicaoCompra.C_C
Left Outer Join Clientes on
  ContratoTransporte.CLICOD = Clientes.CLICOD
Left Outer Join Fornecedores on
  ContratoTransporte.FORCOD = Fornecedores.FORCOD
Left Outer Join DIVISOES on
  ContratoTransporte.seq = DIVISOES.seq
  and ContratoTransporte.CLICOD = DIVISOES.CLICOD
Left Outer Join TAB_PAIS on
  ContratoTransporte.ID = TAB_PAIS.ID
Left Outer Join Produtos on
  ContratoTransporte.NomeMix = Produtos.Produto
Order By ContratoTransporte.Cadastro DESC
