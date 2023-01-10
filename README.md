# Working Hard - Hardly Working
This script will keep your machine awake throughout the day.  
Very useful when running programs for an extended period of time and don't want your screen to turn off or lose connection to server.

## Parameters
* `$day_start`: Keep machine awake starting from this time
* `$day_end`: Do not keep machine awake after this time
* `$interval`: Seconds between each toggle to prevent machine locks

## Errors
Script may not run if execution policy on your machine is set to `AllSigned`.

You can check this by running the following script:
```PS
Get-ExecutionPolicy -List

Scope          ExecutionPolicy
-----          ---------------
MachinePolicy  AllSigned
UserPolicy     Undefined
Process        Undefined
CurrentUser    AllSigned
LocalMachine   Undefined
```
If this is the case, you will get this error:
``` PS
PS> .\worker.ps1

.\worker.ps1 : File .\worker.ps1 cannot be loaded.
The file .\worker.ps1 is not digitally signed.
The script will not execute on the system.
```

Microsoft's solution can be found [here](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/get-executionpolicy?view=powershell-7.3).
```PS
Unblock-File -Path .\worker.ps1
```

## Disclaimer
This code is to be used solely for educational or entertainment purposes.  
The use of this code does not eliminate the need to carry out your usual duties.