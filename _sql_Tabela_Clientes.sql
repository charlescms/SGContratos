Select
  Clientes.CLICOD AS CLICOD,
  Clientes.RAZAO AS RAZAO,
  Clientes.NOMFAN AS NOMFAN,
  Clientes.NOMRES AS NOMRES,
  Clientes.CONTATO AS CONTATO,
  Clientes.TIPPESSOA AS TIPPESSOA,
  Clientes.CPF AS CPF,
  Clientes.RG AS RG,
  Clientes.CNPJ AS CNPJ,
  Clientes.IEST AS IEST,
  Clientes.IMUN AS IMUN,
  Clientes.DDD AS DDD,
  Clientes.TEL1 AS TEL1,
  Clientes.TEL2 AS TEL2,
  Clientes.FAX AS FAX,
  Clientes.ENDERECO AS ENDERECO,
  Clientes.BAI AS BAI,
  Clientes.CEP AS CEP,
  Clientes.CID AS CID,
  Clientes.UF AS UF,
  Clientes.DATCAD AS DATCAD,
  Clientes.EMAIL1 AS EMAIL1,
  Clientes.EMAIL2 AS EMAIL2,
  Clientes.SITE AS SITE,
  Clientes.ENDERECO_COB AS ENDERECO_COB,
  Clientes.BAI_COB AS BAI_COB,
  Clientes.CEP_COB AS CEP_COB,
  Clientes.CID_COB AS CID_COB,
  Clientes.UF_COB AS UF_COB,
  Clientes.SITCLICOD AS SITCLICOD,
  Clientes.CATCLICOD AS CATCLICOD,
  Clientes.TBATIVCOD AS TBATIVCOD,
  Clientes.LIMCRE AS LIMCRE,
  Clientes.LIMCREUSA AS LIMCREUSA,
  Clientes.OBS AS OBS,
  Clientes.ID AS ID,
  TAB_PAIS.NOME AS NOME,
  Clientes.Usuario AS Usuario
from Clientes
Left Outer Join TbAtividades on
  Clientes.TBATIVCOD = TbAtividades.TBATIVCOD
Left Outer Join TbSitClientes on
  Clientes.SITCLICOD = TbSitClientes.SITCLICOD
Left Outer Join TbCategClientes on
  Clientes.CATCLICOD = TbCategClientes.CATCLICOD
Left Outer Join TAB_PAIS on
  Clientes.ID = TAB_PAIS.ID
Order By Clientes.CLICOD DESC
