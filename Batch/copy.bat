@echo off

set MSCLoaderPath=C:\Program Files (x86)\Steam\steamapps\common\My Summer Car
set MLPPath=C:\Program Files (x86)\Steam\steamapps\common\My Summer Car ProLoader
set ToPath=%MSCLoaderPath%\Mods
set ToMLP=%MLPPath%\Mods
echo.

if "%1%"=="release" ( SET src=Release) ELSE ( SET src=Debug)

CALL :copy_file_to "\\Mac\Home\Developer\MOP\MOP\bin\%src%\MOP.dll" "%ToPath%"
CALL :copy_file_to "\\Mac\Home\Developer\SaveSlots\SaveSlots\bin\%src%\SaveSlots.dll" "%ToPath%"
CALL :copy_file_to "\\Mac\Home\Developer\ActualMop\ActualMop\bin\%src%\ActualMop.dll" "%ToPath%"

CALL :copy_file_to "\\Mac\Home\Developer\MOP\MOP\bin\ProRelease\MOP.dll" "%ToMLP%"
CALL :copy_file_to "\\Mac\Home\Developer\SaveSlots\SaveSlots\bin\ProRelease\SaveSlots.dll" "%ToMLP%"
CALL :copy_file_to "\\Mac\Home\Developer\ActualMop\ActualMop\bin\ProRelease\ActualMop.dll" "%ToMLP%"

echo.
echo Done!

GOTO StartGame

ECHO 1 - MSCLoader
ECHO 2 - MLP
ECHO 3 - MSCLoader Steam
ECHO 3 - EXIT
ECHO.
SET /P M=Type 1, 2, 3 or 4 then press ENTER:

IF %M%==1 start "" "%MSCLoaderPath%\mysummercar.exe"
IF %M%==2 start "" "%MLPPath%\mysummercar.exe"
IF %M%==3 start "" "steam://run/516750"
IF %M%==4 GOTO EOF

GOTO EOF

:copy_file_to
    if exist %~1 (
        echo "%~1 => %~2"
        xcopy /Y /Q "%~1" "%~2" > Nul
    ) else (
        echo File %~1 does not exist!
    )
    EXIT /B 0

:StartGame
	IF "%1%"=="release" (
		start "" "steam://run/516750"
    ) ELSE IF "%1%"=="prorelease" (
		start "" "%MLPPath%\mysummercar.exe"
	) ELSE IF "%1%"=="debug" (
		start "" "%MSCLoaderPath%\mysummercar.exe"
	) ELSE (
	    EXIT /B 0
    )
    GOTO EOF

:EOF
