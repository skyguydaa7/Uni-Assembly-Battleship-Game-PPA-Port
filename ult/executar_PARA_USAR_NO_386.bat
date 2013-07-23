@echo off
cd c:\lucas
echo Compilando... 
C:\TASM\BIN\TASM.EXE /z /zi bat_nav.asm
Pause
echo Linkando...
C:\TASM\BIN\TLINK.EXE /x /v bat_nav
Pause
bat_nav.exe
Pause
