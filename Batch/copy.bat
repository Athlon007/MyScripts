@echo off

set MSCLoaderPath=C:\Program Files (x86)\Steam\steamapps\common\My Summer Car
set MLPPath=C:\Program Files (x86)\Steam\steamapps\common\My Summer Car ProLoader
set ToPath=%MSCLoaderPath%\Mods
set ToMLP=%MLPPath%\Mods
echo.

CALL :copy_file_to "\\Mac\Home\Developer\MOP\MOP\bin\Debug\MOP.dll" "%ToPath%"
CALL :copy_file_to "\\Mac\Home\Developer\SaveSlots\SaveSlots\bin\Debug\SaveSlots.dll" "%ToPath%"

CALL :copy_file_to "\\Mac\Home\Developer\MOP\MOP\bin\ProRelease\MOP.dll" "%ToMLP%"
CALL :copy_file_to "\\Mac\Home\Developer\SaveSlots\SaveSlots\bin\ProRelease\SaveSlots.dll" "%ToMLP%"

echo.
echo Done!

ECHO 1 - MSCLoader
ECHO 2 - MLP
ECHO 3 - EXIT
ECHO.
SET /P M=Type 1, 2, or 3 then press ENTER: 

IF %M%==1 start "" "%MSCLoaderPath%\mysummercar.exe"
IF %M%==2 start "" "%MLPPath%\mysummercar.exe"
IF %M%==3 GOTO EOF

EXIT

:copy_file_to
    if exist %~1 (
        echo "%~1 => %~2"
        xcopy /Y /Q "%~1" "%~2" > Nul
    ) else (
        echo File %~1 does not exist!
    )
    EXIT /B 0

:EOF

