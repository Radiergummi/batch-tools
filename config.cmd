:: Sets a variable by fetching the value of a given key.
:: Comments and sections will be ignored, so you can store your configuration in neatly organized .ini-files.
:: Attention: The quotation marks (") around the key are important!
::
:: Example: 
:: call :config settings.ini "key"    :: %key% will be value
::
:: Parameters:
:: %1: The ini file to search in
:: %2: The key to look for
:: %3 (optional): The name of the variable to set the value in
::
:: Return codes:
:: 0: The requested value could be returned.
:: 1: The specified key could not be found.
:: 99: The process did not finish as expected.


:config
	set configfile=%~1
	:: You could also provide a hardcoded filename here instead of using the first parameter.
	:: To do so, swap the two "%~2" below with "%~1".
	if not [%3] == [] ( 
		set variable=%3
	)

	for /F "eol=; eol=[ tokens=1,2* delims==" %%i in ('findstr /b /l /i %~2= "%~dp0%configfile%"') do (
		if %errorlevel% == 1 (
			exit /B 1
		)
		set %variable%=%%~j
		exit /B 0
	)
exit /B 99
