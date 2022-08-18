Select
  OrdemCobrancaDescont.NumOrdCobranca AS NumOrdCobranca,
  OrdemCobrancaDescont.Seq AS Seq,
  OrdemCobrancaDescont.Observacao AS Observacao,
  OrdemCobrancaDescont.Valor AS Valor,
  OrdemCobrancaDescont.Usuario AS Usuario
from OrdemCobrancaDescont
Order By OrdemCobrancaDescont.NumOrdCobranca,OrdemCobrancaDescont.Seq
