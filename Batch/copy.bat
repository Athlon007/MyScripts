@echo off

set MSCLoaderPath=D:\SteamLibrary\steamapps\common\My Summer Car
set MLPPath=D:\SteamLibrary\steamapps\common\My Summer Car ProLoader
set ToPath=%MSCLoaderPath%\Mods
set ToMLP=%MLPPath%\Mods
echo.

CALL :copy_file "C:\Users\aathl\source\repos\MOP\MOP\bin\Debug\MOP.dll"
CALL :copy_file "C:\Users\aathl\source\repos\Fifth Gear\bin\Debug\FifthGear.dll"
CALL :copy_file "C:\Users\aathl\source\repos\SaveSlots\SaveSlots\bin\Debug\SaveSlots.dll"

CALL :copy_file_to "C:\Users\aathl\source\repos\MOP\MOP\bin\ProRelease\MOP.dll" "%ToMLP%"

echo.
echo Done!

ECHO 1 - MSCLoader
ECHO 2 - MLP
ECHO 3 - EXIT
ECHO.
SET /P M=Type 1, 2, or 3 then press ENTER: 

IF %M%==1 start "" /D "%MSCLoaderPath%\mysummercar.exe"
IF %M%==2 start "" /D "%MLPPath%\mysummercar.exe"
IF %M%==3 GOTO EOF

EXIT



:copy_file
    if exist %~1 (
        echo "%~1 => %ToPath%"
        xcopy /Y /Q "%~1" "%ToPath%" > Nul
    ) else (
        echo File %~1 does not exist!
    )
    EXIT /B 0

:copy_file_to
    if exist %~1 (
        echo "%~1 => %~2"
        xcopy /Y /Q "%~1" "%~2" > Nul
    ) else (
        echo File %~1 does not exist!
    )
    EXIT /B 0

:EOF

