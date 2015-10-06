# Custom batch commands
This is a collection of linux-y aliases for batch commands which ease working with different OSes.  

### What's this all about?
If you have to work on many operating systems, you tend to mix commands in your head and get annoyed. These batch commands serve as a kind of aliases, but with more functionality: You can add help messages which remind you about the parameter details on Windows, add custom return codes and such.

### How to use
All files in this folder are supposed to be put somewhere in your `PATH` variable so they can be called as normal batch commands. That way, you can expand batch functionality without even noticing.  
Download the repo, store the files in a folder to your liking (technically, somewhere under `%windir%` would be good) and perform the following steps. They are copy-paste ready, by the way.

```batchfile
    :: define a folder for your custom commands
    set custom_folder=%windir%\custom_commands
    
    :: create a folder named "C:\Windows\custom_commands"
    mkdir %custom_folder%
    
    :: add the folder to your path variable
    set path=%path%;%custom_folder%
    
    :: update the path variable in your registry
    reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /f /v "Path" /t REG_SZ /d "%path%"
```



### What does what, and how does it do it?
So far, I've built only a few commands, which you'll find described in the following list:

#### `cat <text>`
Simple alias for `type`. Serves the exact same purpose and is pipable.

#### `clear`
Simple alias for `cls`. Serves the exact same purpose.

#### `cp <source> <destination>`
Simple alias for `copy`. Serves the exact same purpose.

#### `grep <term>`
Favourite utility of all time. Compacts a `findstr` and is pipable.

#### `kill <PID>|<task name>`
Kills a process. This one is a bit cooler than the usual implementation, though: It takes either a number or a string as an argument. A number is being interpreted as a PID while a string is interpreted as an image name. Either way, the corresponding process is force-killed.

#### `less <text>`
Simple alias for `more`. Kinda stupid, considering `less` is more than `more`, but in this case, `less` is literally `more`.

#### `ln <source> <destination>`
Simple alias for `mklink`. Makes symbolic links.

#### `locate [--onshares] <pattern>`
Searches for a file on all physical drives, optionally also on mounted network shares using the parameter `--onshares`.
Will return a each found file on a new line. You can also use an asterisk (`*`) as a substitution char for multiple or a question mark as a substitution char for a single character in the search pattern  

#### `ls [-a] <directory>`
Alias for `dir`. Allows to show detailed information by providing the parameter `-a`, otherwise returns simply each file on a new line.

#### `mv <source> <destination>`
Simple alias for `move`. Serves the exact same purpose.

#### `passwd [<username> [, <password>]]`
Alias for `net user`. Allows to set a new password for the current user (no parameters) or another user (first parameter). If a second parameter is specified, it is used as the new password without further questions.  
Due to the restrictions of Batch, the input is visible in plain text, so this should not be used in unsafe public environments.

#### `ps`
Simple alias for `tasklist`. Serves the exact same purpose.

#### `rm [[-f],[-r]] <file 1> ... <file n>`
Not-that-bad-but-incomplete implementation of `rm`. It has support for `-r`, `-f` or `-rf`/`-fr` so you can delete recursively and force deletion without prompt.

#### `su [<username>]`
Alias for `runas`. Tries to start an elevated shell. If no username is given as an argument, it will run it as `administrator`.

#### `sudo <command>`
Alias for `runas`. Tries to run a command with elevated privileges.

#### `tee [-a, --append] <file>`
Real tee implementation for Windows. [Originally](http://www.robvanderwoude.com/unixports.php#TEE) written by [Rob van der Woude](http://www.robvanderwoude.com), modified by me. I only removed the Windows NT checks, reformatted the code and messages thrown to fit with the rest of these commands.  
Can be used to redirect any input stream or file to the console and a file simultaneously. By using the `append` parameter, the text is appended instead of the file being overwritten.

#### `top`
Totally shitty implementation of top on Windows. Uses PS.

#### `touch <file>`
Uses the pretty unknown (but [documented](https://technet.microsoft.com/en-us/library/bb490886.aspx)) `+,,` operator of the copy command to update the access timestamp of a file. If it does not exist, it will be created.


<br>
<br>
