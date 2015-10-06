:::
 :: Sudo command
 :: Run a command in an elevated shell.
 ::
 :: Usage: sudo <command>
 ::
 :: Report bugs at Github <github.com/Radiergummi/batch-tools>

:: disable command output
@echo off

:: if we have no arguments specified, quit
if [%1] == [] (
  echo You must enter a command.
	
	:: exit
	exit /b 1

)

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

:: execute elevated command
runas /user:administrator %1
exit /b 0

:helptext
	echo Usage: sudo ^<command^>
	echo Run a command in an elevated shell.
	echo.
	echo.
	echo      --help                display this help and exit
	echo      --version             display version information and exit
	echo.
	echo Report bugs at Github ^<github.com/Radiergummi/batch-tools^>
exit /b 0

:version
	echo Sudo command for Windows, version 0.1
	echo.
	echo Written by Moritz Friedrich.
exit /b 0
