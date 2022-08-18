Select
  OrdemCobranca.NumOrdCobranca AS NumOrdCobranca,
  OrdemCobranca.FORCOD AS FORCOD,
  OrdemCobranca.Cadastro AS Cadastro,
  OrdemCobranca.FATURA AS FATURA,
  OrdemCobranca.DataFatura AS DataFatura,
  OrdemCobranca.Status AS Status,
  OrdemCobranca.CTTO AS CTTO,
  OrdemCobranca.MOEDACOMISSAO AS MOEDACOMISSAO,
  OrdemCobranca.Valor AS Valor,
  OrdemCobranca.ValorDesconto AS ValorDesconto,
  OrdemCobranca.VALOR_LIQ AS VALOR_LIQ,
  OrdemCobranca.NumNFEmit AS NumNFEmit,
  OrdemCobranca.DataNF AS DataNF,
  OrdemCobranca.Comentario AS Comentario,
  OrdemCobranca.VALOR_NF AS VALOR_NF,
  OrdemCobranca.VALOR_IRRF AS VALOR_IRRF,
  OrdemCobranca.VALOR_PIS_COF AS VALOR_PIS_COF,
  OrdemCobranca.VALOR_NF_LIQ AS VALOR_NF_LIQ,
  OrdemCobranca.DataLiq AS DataLiq,
  OrdemCobranca.DataProtesto AS DataProtesto,
  OrdemCobranca.Recebimento AS Recebimento,
  OrdemCobranca.VALORRECEBIDO AS VALORRECEBIDO,
  Fornecedores.RAZAO AS RAZAO,
  Tab_pais.NOME AS NOME,
  OrdemCobranca.TEXTO_PADRAO AS TEXTO_PADRAO,
  OrdemCobranca.Usuario AS Usuario,
  Fornecedores.ID AS ID,
  OrdemCobranca.TextoDsconto AS TextoDsconto
from OrdemCobranca
Left Outer Join Fornecedores on
  OrdemCobranca.FORCOD = Fornecedores.FORCOD
Left Outer Join Tab_pais on
  Fornecedores.ID = Tab_pais.ID
Order By OrdemCobranca.NumOrdCobranca DESC
