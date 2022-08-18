Select
  ProdutoContratoT.Contrato AS Contrato,
  ProdutoContratoT.Sequencia AS Sequencia,
  ProdutoContratoT.Produto AS Produto,
  ProdutoContratoT.FormPago AS FormPago,
  ProdutoContratoT.CodTbPorto AS CodTbPorto,
  TbPorto.NomePorto AS NomePorto,
  ProdutoContratoT.PrecoFOB AS PrecoFOB,
  ProdutoContratoT.PrecoSCC AS PrecoSCC,
  ProdutoContratoT.Quantidade AS Quantidade,
  ProdutoContratoT.ValorSCC AS ValorSCC,
  ProdutoContratoT.ComisaoSFatura AS ComisaoSFatura,
  ProdutoContratoT.OBS AS OBS,
  ProdutoContratoT.Complemento AS Complemento,
  ProdutoContratoT.Cadastro AS Cadastro,
  ContratoTransporte.FormComissao AS FormComissao,
  ContratoTransporte.Comissao AS Comissao,
  ProdutoContratoT.Usuario AS Usuario
from ProdutoContratoT
Left Outer Join ContratoTransporte on
  ProdutoContratoT.Contrato = ContratoTransporte.Contrato
Left Outer Join TbFormaPagamento on
  ProdutoContratoT.FormPago = TbFormaPagamento.FormPago
Left Outer Join TbPorto on
  ProdutoContratoT.CodTbPorto = TbPorto.CodTbPorto
Left Outer Join Produtos on
  ProdutoContratoT.Produto = Produtos.Produto
Order By ProdutoContratoT.Contrato,ProdutoContratoT.Sequencia
