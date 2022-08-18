Select
  Produtos.Produto AS Produto,
  Produtos.QUANT_PREVISTA AS QUANT_PREVISTA,
  Produtos.VALOR_PREVISTO AS VALOR_PREVISTO,
  Produtos.Usuario AS Usuario,
  Produtos.Observacoes AS Observacoes
from Produtos
Order By Produtos.Produto
