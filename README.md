# batch-tools
A collection of useful batch snippets

### Check for administrative privileges
```batchfile
call :isAdmin
if errorlevel 1 (
  echo This script has to be run as administrator!
)
```


### Check for interactive session
```batchfile
call :isInteractive
if errorlevel 1 (
  echo Hi, %username%!
)
```


### Check if a machine is available in LAN
```batchfile
call :isAvailable %client_netbios_name_or_IP%
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


### Retrieve and set a value from an INI config file
```batchfile
call :config %config_ini% "foo"
if errorlevel 1 (
  echo Config value not set! Falling back to default...
  set foo=bar
)

echo %foo%     :: will be bar
```
