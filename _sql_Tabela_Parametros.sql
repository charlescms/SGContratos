Select
  Parametros.SeqPara AS SeqPara,
  Parametros.NumFatura AS NumFatura,
  Parametros.NumNFEmit AS NumNFEmit,
  Parametros.NumOrdCobranca AS NumOrdCobranca,
  Parametros.IRRF AS IRRF,
  Parametros.PIS_COF_CSSL AS PIS_COF_CSSL,
  Parametros.TEXTOFATURA AS TEXTOFATURA,
  Parametros.ENDERECOEMPRESA AS ENDERECOEMPRESA,
  Parametros.Usuario AS Usuario
from Parametros
Order By Parametros.SeqPara
