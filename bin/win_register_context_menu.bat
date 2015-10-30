@echo off

SET "mypath=%~dp0"

mkdir ..\temp > nul 2>&1
set REG_FILE=..\temp\register_context_menu.reg

echo Windows Registry Editor Version 5.00 > "%REG_FILE%"
echo. >> "%REG_FILE%"
echo [HKEY_CLASSES_ROOT\Folder\shell\QAPS - copy to lab\command] >> "%REG_FILE%"
echo @="javaw -jar \"%mypath:\=\\%qaps.jar\" --gui copy \"%%1\"" >> "%REG_FILE%"

@rem run it
%REG_FILE%
@rem delete it after using
del %REG_FILE%

echo Done.
