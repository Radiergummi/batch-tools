# batch-tools
A collection of useful batch snippets

### Check for administrative privileges
```
call :isAdmin
if errorlevel 1 (
  echo This script has to be run as administrator!
)
```


### Check for interactive session
```
call :isInteractive
if errorlevel 1 (
  echo Hi, %username%!
)
```


### Check if a machine is available in LAN
```
call :isAvailable
if errorlevel 1 (
  if %errorlevel% == 1 (
    echo Machine is not available at all.
  ) else (
    echo Machine is connected via WIFI or VPN.
  )
) else (
  echo Machine is available in LAN.
)
```
