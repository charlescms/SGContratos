Select
  USER_NOMES.Usuario AS Usuario,
  USER_NOMES.Senha AS Senha,
  USER_NOMES.Master AS Master,
  USER_NOMES.Grupo AS Grupo
from USER_NOMES
Where 
usuario = 'QFST@N'
and senha = ''
Order By USER_NOMES.Usuario
