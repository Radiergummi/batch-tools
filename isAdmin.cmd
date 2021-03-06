:: This checks wether the user the shell is running under has administrative privileges.
::
:: Example:
:: call :isAdmin
:: if errorlevel 1 (
::    echo This script must be run as administrator.
::    exit
:: )
::
:: Parameters:
:: (none)
::
:: Return codes:
:: 0: The current session is run with administrative privileges.
:: 1: The current session is run without administrative privileges.
:: 99: The process did not finish as expected.


:isAdmin
	net session >nul 2>&1
	if errorlevel 1 (
		exit /B 1
	) else (
		exit /B 0
	)
exit /B 99
