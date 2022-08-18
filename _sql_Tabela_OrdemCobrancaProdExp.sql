Select
  OrdemCobrancaProdExp.NumOrdCobranca AS NumOrdCobranca,
  OrdemCobrancaProdExp.Contrato AS Contrato,
  OrdemCobrancaProdExp.Seq AS Seq,
  ExportadoTransito.Navio AS Navio,
  ExportadoTransito.DataEmbarque AS DataEmbarque,
  ExportadoTransito.QuantidadeExp AS QuantidadeExp,
  ExportadoTransito.Fatura AS Fatura,
  ExportadoTransito.StDocumento AS StDocumento,
  ExportadoTransito.Cadastro AS Cadastro,
  ExportadoTransito.ETADestino AS ETADestino,
  ExportadoTransito.FormPago AS FormPago,
  ExportadoTransito.PrecoFOB AS PrecoFOB,
  ExportadoTransito.DataOrdCobranca AS DataOrdCobranca,
  ExportadoTransito.Rate AS Rate,
  ExportadoTransito.Status AS Status,
  ExportadoTransito.OBS AS OBS,
  ExportadoTransito.Comentario AS Comentario,
  ExportadoTransito.DataLiq AS DataLiq,
  ContratoTransporte.NomeMix AS NomeMix,
  ContratoTransporte.Comissao AS Comissao,
  ExportadoTransito.Valor AS VALOR_EX,
  ExportadoTransito.ValorDesconto AS VALORDESCONTO_EX,
  OrdemCobrancaProdExp.Valor AS Valor,
  OrdemCobrancaProdExp.ValorDesconto AS ValorDesconto,
  OrdemCobrancaProdExp.MOEDACOMISSAO AS MOEDACOMISSAO,
  OrdemCobrancaProdExp.TAXACONVERCAO AS TAXACONVERCAO,
  OrdemCobrancaProdExp.COMISAOSFATURA AS COMISAOSFATURA,
  OrdemCobrancaProdExp.VALORCONVERTIDO AS VALORCONVERTIDO,
  OrdemCobrancaProdExp.Usuario AS Usuario
from OrdemCobrancaProdExp
Left Outer Join ExportadoTransito on
  OrdemCobrancaProdExp.Contrato = ExportadoTransito.Contrato
  and OrdemCobrancaProdExp.Seq = ExportadoTransito.Seq
Left Outer Join ContratoTransporte on
  OrdemCobrancaProdExp.Contrato = ContratoTransporte.Contrato
Order By OrdemCobrancaProdExp.NumOrdCobranca,OrdemCobrancaProdExp.Contrato,OrdemCobrancaProdExp.Seq
