@echo off
SET TEMP=%HOME%
SET HOME=C:\dev\Emacs-Config
rem "C:/ProgramData/chocolatey/bin/runemacs.exe" %*
"c:/emacs/bin/runemacs.exe" %*
SET HOME=%TEMP%
