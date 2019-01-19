@echo off
SET TEMP=%HOME%
SET HOME=.\
"C:/Program Files/Emacs/bin/runemacs.exe" %*
SET HOME=%TEMP%




