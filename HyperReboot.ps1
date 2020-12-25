<#
.PARAMETER DownAllVM
全てのVMを停止します

.PARAMETER RebootSBRouter
ソフトバンクのルーターを再起動します

.PARAMETER OSReboot
OSを再起動します

.PARAMETER WaitSBRouter
ソフトバンクのルーターの起動を待機します

.PARAMETER UpAllVM
全てのVMを起動します
#>

Param(
    [Switch]$DownAllVM,
    [Switch]$RebootSBRouter,
    [Switch]$OSReboot,
    [Switch]$WaitSBRouter,
    [Switch]$UpAllVM
)

if ($DownAllVM) {
    Get-VM | ? {$_.State -eq "Running"} | Stop-VM
}

if ($RebootSBRouter) {
    Invoke-WebRequest -UseBasicParsing "http://192.168.3.1/stay.html"
}

if ($OSReboot) {
    shutdown /r /t 0 /f /d p:4:1
}

if ($WaitSBRouter) {
    do {
        Write-Host "Waiting..."
    } until (Test-Connection "192.168.3.1" -Count 1 -Quiet)
}

if ($UpAllVM) {
    Get-VM | ? {$_.State -eq "Off"} | Start-VM
}
