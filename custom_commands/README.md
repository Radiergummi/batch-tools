# Custom batch commands
All files in this folder are supposed to be put somewhere in your `PATH` variable so they can be called as normal batch commands. That way, you can expand batch functionality without even noticing.  
To keep things organized, you could do the following:

    :: define a folder for your custom commands
    set custom_folder=%windir%\custom_commands
    
    :: create a folder named "C:\Windows\custom_commands"
    mkdir %custom_folder%
    
    :: add the folder to your path variable
    set path=%path%;%custom_folder%
    
    :: update the path variable in your registry
    reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /f /v "Path" /t REG_SZ /d "%path%"
