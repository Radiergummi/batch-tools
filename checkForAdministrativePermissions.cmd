:: This checks wether the user the shell is running under has administrative privileges.
::
:: Example:
:: call :checkadmin
:: if errorlevel 1 (
::    echo This script must be run as administrator.
::    exit
:: )

:checkadmin
	net session >nul 2>&1
	if errorlevel 1 (
		exit /B 1
	) else (
		exit /B 0
	)
exit /B 1
