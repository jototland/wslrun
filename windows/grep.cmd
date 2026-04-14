@echo off
set scriptname=%~n0
wsl --exec wslrun %scriptname% %*
