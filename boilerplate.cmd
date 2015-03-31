:: This is a template for usual batch scripts. It gives a simple but powerful
:: structure to embed your scripts in.
::
::
:::::::::::::::::::::::::::::::: References :::::::::::::::::::::::::::::::::
:: Argument loop:
:: http://stackoverflow.com/a/19837690
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: supresses the output
  @echo off

:: Enable delayed variable expansion for this section only
  setlocal enabledelayedexpansion

:: Set an argCount variable
  set argCount=0
  for %%x in (%*) do (
     set /A argCount+=1
     set "argVec[!argCount!]=%%~x"
  )
  :: Total number of arguments: %argCount%

:: Loop through all the arguments
  for /L %%i in (1,1,%argCount%) do (
  	:: Current parameter number: %%i
  	:: Current parameter value: !argVec[%%i]!
  )

:: Disable delayed variable expansion
  endlocal
