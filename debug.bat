@echo off
cd %NAVAL% 
echo Compilando... 
TASM /z /zi bat_nav.asm
Pause
echo Linkando...
TLINK /x /v bat_nav
Pause
TD bat_nav
Pause
