@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

for /f %%i in ('git rev-parse HEAD') do (
    SET "commitHash=%%i"
    typst watch ../main.typ --input commit=!commitHash:~0,8!
)

ENDLOCAL