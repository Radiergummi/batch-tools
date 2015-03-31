:: Downloads a file to a specified location.
:: Note: bitsadmin has recently been marked deprecated. In the future, it will be replaced with powershell cmdlets.
:: 
:: Example:
:: call :download
::
:: Parameters:
:: %1: 
:: %2: 
::
:: Return codes:
:: 0:
:: 1:
:: 99: The process did not finish as expected.

:download
  bitsadmin.exe /transfer "Download in progress" %url% %localfile%
  
exit /B 99
