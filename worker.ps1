<#
.SETUP
Input parameters to define online time interval
Machine won't remain awake after $work_end time
#>
Clear-Host
$WShell = New-Object -com "Wscript.Shell"
$num_loops = 0
$indefinite = $true
$work_start = Get-Date '09:00'
$work_end = Get-Date '17:00'
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
    .INDEFINITEAWAKE
    Keeps machine PERMANENTLY awake by toggling SCROLLOCK
    #>
    if ($indefinite -eq $true) {
        Echo "Loop $nl_str, $now, Wake - Indefinite"
        $Wshell.sendkeys("{SCROLLLOCK}")
        Start-Sleep -Milliseconds 100
        $Wshell.sendkeys("{SCROLLLOCK}")
    }
    <#
    .TIMEAWAKE
    Keeps machine awake by toggling SCROLLOCK during specified interval
    #>
    else {
        if ($now.TimeOfDay -ge $work_start.TimeOfDay -and $now.TimeOfDay -le $work_end.TimeOfDay){
            Echo "Loop $nl_str, $now, Wake"
            $Wshell.sendkeys("{SCROLLLOCK}")
            Start-Sleep -Milliseconds 100
            $Wshell.sendkeys("{SCROLLLOCK}")
        }
        else {
            Echo "Loop $nl_str, $now, Sleep"
        }
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