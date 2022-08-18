Select
  USER_LOG.Usuario AS Usuario,
  USER_LOG.Data AS Data,
  USER_LOG.Hora AS Hora,
  USER_LOG.Tabela AS Tabela,
  USER_LOG.Tipo AS Tipo,
  USER_LOG.Comando AS Comando,
  USER_LOG.Estacao AS Estacao
from USER_LOG
Left Outer Join USER_NOMES on
  USER_LOG.Usuario = USER_NOMES.Usuario
