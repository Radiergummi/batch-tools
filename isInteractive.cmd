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

:isInteractive
	echo %cmdcmdline% | find /i "/c"
	if %errorlevel% == 0 (
		exit /B 1
	) else (
		exit /B 0
	)
exit /B 1
