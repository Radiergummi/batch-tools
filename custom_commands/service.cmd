:::
 :: Service command
 :: Controls services
 ::
 ::
 :: Usage: service <name> [<action>]
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
	echo You must specify a service

	:: exit dirty
	exit /b 1
) 

:: if we have the server specified as an argument
if [%1] neq [] (

	set service_name=%1

	:: if we have the action specified as an argument
	if [%2] == [] (
		:: we are lacking an action, so print the available ones
		echo Usage: %service_name% {start ^| stop ^| restart ^| status ^| pause ^| resume ^| disable ^| enable}
		
		:: exit dirty
		exit /b 1
	) else (
		:: we have a service and an action. let's do this!
		call :service_%2 %service_name%
		exit /b %errorlevel%
	)
)

:: Actions
	:: %1: service name
	:service_start 
		net start "%~1" >nul 2>&1
		if %errorlevel% neq 0 (
			echo The service could not be started.
		) else (
			echo The service was started successfully.
		)
	exit /b %errorlevel%

	:: %1: service name
	:service_stop
		net stop "%~1" >nul 2>&1
		if errorlevel 1 (
			echo The service could not be stopped.
		) else (
			echo The service was stopped successfully.
		)
	exit /b %errorlevel%

	:: %1: service name
	:service_restart
		net stop "%~1" >nul 2>&1
		if errorlevel 1 (
			echo The service is already stopped.
			exit /b 1
		)
		net start "%~1" >nul 2>&1
		if errorlevel 1 (
			echo The service could not be started again.
		) else (
			echo The service was restarted successfully.
		)
	exit /b %errorlevel%
	
	:: %1: service name
	:service_status
		for /f "tokens=4 delims=: " %%H in ('sc query "%~1" ^| findstr "        STATE"') do (
			if /i "%%H" == "running" (
				echo %servicename% is running.
			) else if /i "%%H" == "stopped" (
				echo %servicename% is stopped.
			) else if /i "%%H" == "paused" (
				echo %servicename% is paused.
			) else (
				echo %servicename% is %%H
			)
		)
	exit /b %errorlevel%

	:: %1: service name
	:service_pause
		net pause "%~1" >nul 2>&1
		if errorlevel 1 (
			echo The service could not be paused.
		) else (
			echo The service was paused successfully.
		)
	exit /b %errorlevel%

	:: %1: service name
	:service_resume
		net resume "%~1" >nul 2>&1
		if errorlevel 1 (
			echo The service could not be resumed.
		) else (
			echo The service was resumed successfully.
		)
	exit /b %errorlevel%

	:: %1: service name
	:service_disable
		sc config "%~1" start= disabled >nul 2>&1
		if errorlevel 1 (
			echo The service could not be disabled.
		) else (
			echo The service was disabled successfully.
		)
	exit /b %errorlevel%

	:: %1: service name
	:service_enable
		sc config "%~1" start= auto >nul 2>&1
		if errorlevel 1 (
			echo The service could not enabled.
		) else (
			echo The service was set to start automatically.
		)
	exit /b %errorlevel%




:helptext
	echo Usage: service ^<name^> [{start ^| stop ^| restart ^| status ^| pause ^| resume ^| disable ^| enable}]
	echo Allows to control services by performing several actions:
	echo      start                 starts a service
	echo      stop                  stops a service
	echo      restart               stops and starts a service
	echo      status                shows whether a service is running or stopped
	echo      pause                 pauses a service (stop without discarding its data)
	echo      resume                resumes a paused service
	echo      disable               sets a services start mode to disabled
	echo      enable                sets a services start mode to auto
	echo.
	echo.
	echo      --help                display this help and exit
	echo      --version             display version information and exit
	echo.
	echo Report bugs at Github ^<github.com/Radiergummi/batch-tools^>
exit /b 0

:version
	echo Service command for Windows, version 0.1
	echo.
	echo Written by Moritz Friedrich.
exit /b 0
