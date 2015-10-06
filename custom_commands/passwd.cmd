:::
 :: Passwd command
 :: With no username given, will set current users password. With
 :: username given, will set given users password. With username 
 :: and password given, will set the password for this user 
 :: without further queries.
 ::
 ::
 :: Usage: passwd [<username> [, <password>]]
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

:: if we have no arguments specified
if [%1] == [] (
	
	:: retrieve current user name from environment variable
	set passwd_username=%username%
	
	:: retrieve new password from input
	set /p passwd_password=New Windows password: 
) 

:: if we have the username specified as an argument
if [%1] neq [] (

	:: retrieve username from parameter
	set passwd_username=%1

	:: retrieve new password from input
	set /p passwd_password=New Windows password: 
)

:: if we have the username and password specified as an argument
if [%2] neq [] (

	:: retrieve username from parameter
	set passwd_username=%1

	:: retrieve new password from parameter
	set passwd_password=%2
)

:: check password length
for /f %%l in ('Powershell $Env:MY_STRING.Length') do (
	if %%l LEQ 6 (
		echo BAD PASSWORD: it is WAY too short
	)
)

:: throw password warning

net user %passwd_username% %passwd_password% >nul
if errorlevel 1 (
	echo Password could not be changed
	exit /b 1
) else (
	echo Password updated successfully
	exit /b 0
)

:helptext
	echo Usage: passwd [^<username^> [, ^<password^>]]
	echo Set a new user password. Username is optional. If it is omitted,
	echo current user will be assumed.
	echo If a second parameter is given, it will directly be used as the 
	echo new password for the given user without further prompt.
	echo.
	echo.
	echo      --help                display this help and exit
	echo      --version             display version information and exit
	echo.
	echo Report bugs at Github ^<github.com/Radiergummi/batch-tools^>
exit /b 0

:version
	echo Passwd command for Windows, version 0.1
	echo.
	echo Written by Moritz Friedrich.
exit /b 0
