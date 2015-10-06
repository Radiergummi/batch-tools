:::
 :: Clear command
 :: Clears the terminal window buffer.
 ::
 :: Usage: clear
 ::
 :: Report bugs at Github <github.com/Radiergummi/batch-tools>

:: disable command output
@echo off

:: if we have the help parameter specified, print help
if [%1] == [--help] (
	call :helptext
	
	:: exit dirty
	exit /b 1
)

:: if we have the version parameter specified, print version
if [%1] == [--version] (
	call :version
	
	:: exit dirty
	exit /b 1
)

:: clear the buffer
cls
exit /b 0

:helptext
	echo Usage: clear
	echo Clears the terminal window buffer.
	echo.
	echo.
	echo      --help                display this help and exit
	echo      --version             display version information and exit
	echo.
	echo Report bugs at Github ^<github.com/Radiergummi/batch-tools^>
exit /b 0

:version
	echo Clear command for Windows, version 0.1
	echo.
	echo Written by Moritz Friedrich.
exit /b 0
