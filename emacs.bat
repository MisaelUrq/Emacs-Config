@echo off
SET TEMP=%HOME%
SET HOME=C:\dev\Emacs-Config
"C:/ProgramData/chocolatey/bin/runemacs.exe" %*
SET HOME=%TEMP%
