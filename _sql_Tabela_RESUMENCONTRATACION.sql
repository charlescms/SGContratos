Select
  RESUMENCONTRATACION.CODIGO AS CODIGO,
  RESUMENCONTRATACION.CLICOD AS CLICOD,
  RESUMENCONTRATACION.seq AS seq,
  RESUMENCONTRATACION.FormPago AS FormPago,
  RESUMENCONTRATACION.NOME AS NOME,
  RESUMENCONTRATACION.NomeMix AS NomeMix,
  RESUMENCONTRATACION.Observacoes AS Observacoes,
  RESUMENCONTRATACION.QuantidadeTotal AS QuantidadeTotal,
  RESUMENCONTRATACION.QUANTTOTALEXP AS QUANTTOTALEXP,
  RESUMENCONTRATACION.QuantadePendente AS QuantadePendente,
  RESUMENCONTRATACION.ValorSCCTotal AS ValorSCCTotal,
  RESUMENCONTRATACION.ValorTotalExp AS ValorTotalExp,
  RESUMENCONTRATACION.ValorTotalPendente AS ValorTotalPendente,
  RESUMENCONTRATACION.Usuario AS Usuario
from RESUMENCONTRATACION
Order By RESUMENCONTRATACION.CLICOD,RESUMENCONTRATACION.NOME
