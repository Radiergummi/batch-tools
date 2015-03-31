:: This checks wether the current script is running from a CMD window opened seperately
:: or by double clicking the script / started by the system (due to a scheduled task maybe).
::
:: Example:
:: call :isInteractive
:: if %errorlevel% 0 (
::    echo This session is interactive.
::    pause
:: ) else (
::    exit
:: )
::
:: Parameters:
:: (none)
::
:: Return codes:
:: 0: The session is interactive.
:: 1: The session is not interactive.
:: 99: The process did not finish as expected.

:isInteractive
	echo %cmdcmdline% | find /i "/c"
	if %errorlevel% == 0 (
		exit /B 1
	) else (
		exit /B 0
	)
exit /B 99
