rem SQL Manager for InterBase & Firebird
rem XCOPY BASE.GDB BASE.ppp

rem del  BDADMIN.GDB
rem GBAK -R BASE.bak BASE.GDB  -PASS masterkey  -user  SYSDBA  

rem verificando banco 
rem gfix -m -i BASE.GDB  -password masterkey  -user  SYSDBA

rem criando backup debanco  verificando banco
rem  GBAK -B BASE.GDB BASE.bak -PASS masterkey  -user  SYSDBA
rem ren  BASE.GDB BASE_old.GDB
GBAK -R BASE.bak BASE.GDB  -PASS masterkey  -user  SYSDBA  




