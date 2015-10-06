:::
 :: Tee command
 :: 
 :: Copy standard input to a file, and also to standard output.
 ::
 :: Usage: STDIN | tee [-a, --append] <file>
 ::
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

:: if we have no target file specified, print help
if not [%2]==[] (
	call :helptext

	:: exit dirty
	exit /b 1
)

:: of we have the append parameter specified, enable append mode
set append=0
if /i [%1] == [-a] (
	set append=1
	shift
) else if /i [%1] == [--append] (
	set append=1
	shift
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

:: test for invalid wildcards
set invalid=0
for /f %%a in ('dir /a /b %1 2^>nul') do call :count "%%~fa"
if %invalid% gtr 1 (
	set invalid=
	call :helptext
	
	:: exit dirty
	exit /b 1
)

:: a valid filename seems to have been specified
set file=%1

:: check if a directory with the specified name exists
dir /ad %file% >nul 2>&1
if not errorlevel 1 (
	set file=
	call :helptext
	
	:: exit dirty
	exit /b 1
)

:: flush existing file or create new one if -a wasn't specified
if %append% == 0 (
	copy /y nul %file% >nul 2>&1
)


:: this is where the actual magic happens. data is redirected to the 
:: console and to the file, one per each line input.
for /f "tokens=1* delims=]" %%a in ('find /n /v ""') do (
	>  con    echo.%%b
	>> %file% echo.%%b
)

:: done
endlocal
exit /b 0

:: simple counter
:count
	set /a counter += 1
	set file=%1
exit /b 0

:helptext
	echo Usage: STDIN ^| tee [-a, --append] ^<file^>
	echo Copy standard input to a file, and also to standard output.
	echo.
	echo.
	echo  -a, --append              append to the given FILEs, do not overwrite
	echo      --help                display this help and exit
	echo      --version             display version information and exit
	echo.
	echo Report bugs at Github ^<github.com/Radiergummi/batch-tools^>
exit /b 0

	
:version
	echo Tee for Windows, Version 2.2
	echo written Rob van der Woude
	echo http://www.robvanderwoude.com
	echo.
	echo modified by Kees Couprie
	echo http://kees.couprie.org
	echo.
	echo and Andrew Cameron
	echo.
	echo and Moritz Friedrich
	echo http://www.moritzfriedrich.com
exit /b 0
