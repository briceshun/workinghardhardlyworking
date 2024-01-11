<#
.SETUP
Input parameters to define online time interval
Machine won't remain awake after $work_end time
#>
Clear-Host
$WShell = New-Object -com "Wscript.Shell"
$num_loops = 0
$interval = 175

<#
.LOOP
Infinite loop for sleep prevention
#>
while ($true) {
    $num_loops++
    $nl_str = $num_loops.ToString("000")
    $dt = Get-Date -Format "yyyy-MM-dd HH:mm:ss K"

    <#
    .INDEFINITEAWAKE
    Keeps machine PERMANENTLY awake by toggling SCROLLOCK
    #>
    Echo "Loop $nl_str, $dt"
    $Wshell.sendkeys("{SCROLLLOCK}")
    Start-Sleep -Milliseconds 100
    $Wshell.sendkeys("{SCROLLLOCK}")
    
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
