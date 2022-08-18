Select
  USER_AGENDA.Sequencia AS Sequencia,
  USER_AGENDA.Usuario AS Usuario,
  USER_AGENDA.Nome AS Nome,
  USER_AGENDA.Telefone AS Telefone,
  USER_AGENDA.Complemento AS Complemento,
  USER_AGENDA.Compartilhado AS Compartilhado
from USER_AGENDA
Left Outer Join USER_NOMES on
  USER_AGENDA.Usuario = USER_NOMES.Usuario
Order By USER_AGENDA.Sequencia
