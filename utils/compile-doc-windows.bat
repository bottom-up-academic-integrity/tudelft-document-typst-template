@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

for /f %%i in ('git -C ../../ rev-parse HEAD') do (
    SET "commitHash=%%i"
    typst watch ../main.typ ../../document.pdf --root ../../ --input commit=!commitHash:~0,8!
)

ENDLOCAL