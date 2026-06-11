@echo off
chcp 65001 >nul
cd /d "%~dp0"
title SE2 - Publicar no GitHub (SE2LUCAS)

set "PY=C:\Users\lucas\AppData\Local\Programs\Python\Python312\python.exe"
if exist "%PY%" (
    "%PY%" "%~dp0deploy.py" %*
    goto :fim
)
where python >nul 2>&1
if %errorlevel%==0 (
    python "%~dp0deploy.py" %*
    goto :fim
)
where py >nul 2>&1
if %errorlevel%==0 (
    py "%~dp0deploy.py" %*
    goto :fim
)
echo Python nao encontrado. Instale em https://www.python.org/downloads/

:fim
echo.
pause
