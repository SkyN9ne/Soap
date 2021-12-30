function Block-TrafficToIpAddress {
    param([Parameter(Mandatory)][ipaddress]$IpAddress)
    New-NetFirewallRule -DisplayName "Block $IpAddress" -Direction Outbound -Action Block -RemoteAddress $IpAddress
}

function Get-ProcessToKill {
    param([Parameter(Mandatory)]$Name)
    $Process = Get-Process | Where-Object { $_.Name -like $Name }
    $Process.Kill()
}

function Start-Panic {
    param([string]$ComputerName = 'localhost')
    #shutdown /r /f /m ComputerName /d P:0:1 /c "Your comment"
    Stop-Computer -ComputerName $ComputerName
}

function Unblock-TrafficToIpAddress {
    param([Parameter(Mandatory)][ipaddress]$IpAddress)
    Remove-NetFirewallRule -DisplayName "Block $IpAddress"
}