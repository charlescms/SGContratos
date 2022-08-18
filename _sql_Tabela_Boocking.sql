Select
  Boocking.Contrato AS Contrato,
  Boocking.Seq AS Seq,
  Boocking.Navio AS Navio,
  Boocking.Cadastro AS Cadastro,
  Boocking.DataPrevista AS DataPrevista,
  Boocking.StatusBK AS StatusBK,
  Boocking.Quantidade AS Quantidade,
  Boocking.QuntTransp AS QuntTransp,
  Boocking.Usuario AS Usuario
from Boocking
Left Outer Join ContratoTransporte on
  Boocking.Contrato = ContratoTransporte.Contrato
Order By Boocking.Contrato,Boocking.Seq
