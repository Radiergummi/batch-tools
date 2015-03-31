# batch-tools
> A collection of useful batch snippets  

These helpers were developed in productive environments and do their job pretty solid.  
The process is streamlined - each helper can be `call`ed and will return an errorlevel. That way, they pretty much work as functions in programming languages do.  
Parameters, possible return codes and their meaning as well as a description and an example of the script can be found in each individual cmd file.

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
