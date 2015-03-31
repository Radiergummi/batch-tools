
:: Checks wether a client is available in LAN, only via WIFI/VPN or not at all
:: by using a ping and parsing its return value. That is the currently best 
:: way of reliably checking the connection to a client using batch only.
::
:: Example:
:: call :isAvailable laptop01
:: if errorlevel 1 (
::   if %errorlevel% == 1 (
::     echo Machine is not available at all.
::   ) else (
::     echo Machine is connected via WIFI or VPN.
::   )
:: ) else (
::   echo Machine is available in LAN.
:: )
::
:: Parameters:
:: %1: The network client to check
::
:: Return codes:
:: 0: The client is available in LAN.
:: 1: The client is not available in the network.
:: 2: The client is available, but only connected to WIFI or VPN (slow connection).


:isAvailable
	ping %~1 -n 2 -4 > %temp%\ping.tmp
	findstr /C:"<1ms" %temp%\ping.tmp 1>nul
	if errorlevel 1 (
		findstr /C:"TTL=" %temp%\ping.tmp 1>nul
		if errorlevel 1 (
			exit /B 1
		) else (
			exit /B 2
		)
	) else (
		exit /B 0
	)
exit /B 1
