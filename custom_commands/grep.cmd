:::
 :: Grep command
 :: Search for a pattern in a file or STDIN
 ::
 :: Usage: grep <pattern> <input>
 :: Example: echo 123|grep "[0-9]"
 :: 
 :: Report bugs at Github <github.com/Radiergummi/batch-tools>

:: disable command output
@echo off

:: if we have no arguments specified, quit
if [%1] == [] (
  echo You must provide a pattern.
	
	:: exit dirty
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

:: start findstr
findstr /r /c:"%*"
exit /b 0

:helptext
	echo Usage: grep ^<pattern^> ^<input^>
	echo Run a command in an elevated shell.
	echo.
	echo.
	echo      --help                display this help and exit
	echo      --version             display version information and exit
	echo.
	echo Report bugs at Github ^<github.com/Radiergummi/batch-tools^>
exit /b 0

:version
	echo Grep command for Windows, version 0.1
	echo.
	echo Written by Moritz Friedrich.
exit /b 0
