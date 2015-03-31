:: Downloads a file to a specified location.
:: Note: bitsadmin has recently been marked deprecated. In the future, it will be replaced with powershell cmdlets.
:: 
:: Example:
:: call :download %url% %cd%\%file% 
:: if errorlevel 1 (
::    echo %file% couldn't be downloaded, please do it manually.
::    echo Reason: %errorlevel%
:: )
::
:: Parameters:
:: %1: The complete URL to the file.
:: %2: The local path including the filename to store the download at.
::
:: Return codes:
:: 0: The file was downloaded correctly.
:: (not 0 or 99): There were problems downloading the file. The errorlevel is patched through from Bitsadmin.
:: 99: The process did not finish as expected.

:download
  bitsadmin.exe /transfer "Download in progress" %~1 %~2
  if %errorlevel% == 0 (
    exit /B 0
  ) else (
    exit /B %errorlevel%
  )
exit /B 99
