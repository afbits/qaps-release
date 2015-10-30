@echo off

SET "mypath=%~dp0"
SET "mypath=%mypath:~0,-1%"

if "%1" == "--gui" (
    start javaw -jar "%mypath%\qaps.jar" %*
) else (
    java -jar "%mypath%\qaps.jar" %*
)

SET mypath=
