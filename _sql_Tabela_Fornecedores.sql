Select
  Fornecedores.FORCOD AS FORCOD,
  Fornecedores.DATCAD AS DATCAD,
  Fornecedores.RAZAO AS RAZAO,
  Fornecedores.NOMCON AS NOMCON,
  Fornecedores.TIPPESSOA AS TIPPESSOA,
  Fornecedores.CNPJ AS CNPJ,
  Fornecedores.CPF AS CPF,
  Fornecedores.IEST AS IEST,
  Fornecedores.IMUN AS IMUN,
  Fornecedores.CDPAIS AS CDPAIS,
  Fornecedores.DDD AS DDD,
  Fornecedores.TEL1 AS TEL1,
  Fornecedores.TEL2 AS TEL2,
  Fornecedores.FAX AS FAX,
  Fornecedores.ENDERECO AS ENDERECO,
  Fornecedores.BAI AS BAI,
  Fornecedores.CEP AS CEP,
  Fornecedores.CID AS CID,
  Fornecedores.UF AS UF,
  Fornecedores.EMAIL1 AS EMAIL1,
  Fornecedores.EMAIL2 AS EMAIL2,
  Fornecedores.SITE AS SITE,
  Fornecedores.TBATIVCOD AS TBATIVCOD,
  Fornecedores.OBS AS OBS,
  Fornecedores.ID AS ID,
  TAB_PAIS.NOME AS NOME,
  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,
  Fornecedores.Usuario AS Usuario
from Fornecedores
Left Outer Join TbAtividades on
  Fornecedores.TBATIVCOD = TbAtividades.TBATIVCOD
Left Outer Join TAB_PAIS on
  Fornecedores.ID = TAB_PAIS.ID
Order By Fornecedores.FORCOD DESC
