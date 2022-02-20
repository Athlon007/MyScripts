@echo off

set MscPath=D:\SteamLibrary\steamapps\common\My Summer Car
set ModsPath=%MscPath%\Mods
set ReposPath=C:\Users\aathl\source\repos

echo.

CALL :copy_file "%ReposPath%\MOP\MOP\bin\Debug\MOP.dll"
CALL :copy_file "%ReposPath%\Fifth Gear\bin\Debug\FifthGear.dll"
CALL :copy_file "%ReposPath%\SaveSlots\SaveSlots\bin\Debug\SaveSlots.dll"

echo.
echo Done!

start "" /D "%MscPath%" "%MscPath%\mysummercar.exe"

:copy_file
    if exist %~1 (
        echo "%~1 => %ModsPath%"
        xcopy /Y /Q "%~1" "%ModsPath%" > Nul
    ) else (
        echo File %~1 does not exist!
    )
    EXIT /B 0