:::
 :: Cat command
 :: Concatenate FILE(s), or standard input, to standard output.
 ::
 :: Usage: cat [option] <input 1> ... <input n>
 :: With no file, read standard input.
 ::
 :: Report bugs at Github <github.com/Radiergummi/batch-tools>

:: disable command output
@echo off
setlocal enableDelayedExpansion

:: if we have no arguments specified, redirect STDIN to STDOUT
if [%1] == [] (

	:: redirect STDIN to STDOUT
	for /F "tokens=*" %%a in ('findstr /n $') do (
		set "line=%%a"
		setlocal EnableDelayedExpansion
		set "line=!line:*:=!"
		echo(!line!
		endlocal
	)

	:: exit
	exit /b 0

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

:: type STDIN
type %*
goto :eof

:helptext
	echo Usage: cat [option] ^<file 1^> ... ^<file n^>
	echo Copy standard input to a file, and also to standard output.
	echo.
	echo.
	echo      --help                display this help and exit
	echo      --version             display version information and exit
	echo.
	echo Report bugs at Github ^<github.com/Radiergummi/batch-tools^>
exit /b 0

:version
	echo Cat command for Windows, version 0.1
	echo.
	echo Written by Moritz Friedrich.
exit /b 0
