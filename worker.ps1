<#
.SETUP
Input parameters to define online time interval
Machine won't remain awake after $day_end time
#>
Clear-Host
$WShell = New-Object -com "Wscript.Shell"
$num_loops = 0
$day_start = Get-Date '09:00'
$day_end = Get-Date '17:00'
$interval = 175

<#
.LOOP
Infinite loop for sleep prevention
#>
while ($true) {
    $num_loops++
    $nl_str = $num_loops.ToString("000")
    $now = Get-Date

    <#
    .AWAKE
    Keeps machine awake by toggling SCROLLOCK
    #>
    if ($now.TimeOfDay -ge $day_start.TimeOfDay -and $now.TimeOfDay -le $day_end.TimeOfDay) {
            Echo "Loop $nl_str, $now, Online"
            $Wshell.sendkeys("{SCROLLLOCK}")
            Start-Sleep -Milliseconds 100
            $Wshell.sendkeys("{SCROLLLOCK}")
        }
    }
    <#
    .SLEEP
    No action after $day_end time - machine locks / goes to sleep
    #>
    else {
        Echo "Loop $nl_str, $now, Offline"
    }

    <#
    .MINIMISE
    Window will minimise to reduce distraction
    #>
    powershell -window minimized -command "Start-Sleep -Milliseconds 100"

    <#
    .INTERVAL
    Time limit before machine locks / goes to sleep
    #>
    Start-Sleep -Seconds $interval
}