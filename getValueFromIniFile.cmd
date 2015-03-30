:: Sets a variable by fetching the value of a given key.
:: Comments and sections will be ignored, so you can store your configuration in neatly organized .ini-files.
::
:: Example: 
:: call :getINI settings.ini "key" // %key% == value

:getINI
	set configfile=%~1
  :: You could also provide a hardcoded filename here instead of using the first parameter.
  :: To do so, swap the two "%~2" below with "%~1".

	FOR /F "eol=; eol=[ tokens=1,2* delims==" %%i in ('findstr /b /l /i %~2= "%~dp0%configfile%"') DO set %~2=%%~j
	exit /B 0
