function Show-Menu
{
     param (
           [string]$Title = 'zuphps written by @zuphzuph | IIS/MSSQL Server Stats'
     )
     cls
     Write-Host "================ $Title ================"
     Write-Host "1: List IIS ciphers supported on host."
     Write-Host "2: List IIS sites on host."
     Write-Host "3: List active server connections and open ports via 0.0.0.0."
     Write-Host "4: List active server connections and shows process usage."
     Write-Host "5: Returns MSSQL instances on host"
     Write-Host "6: Returns MSSQL user accounts host. (Reqs Sys Admin Role within MSSQL)"
     Write-Host "7: Returns MSSQL DBs on host."
     Write-Host "Q: Press 'Q' to quit."
}

do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                Get-TlsCipherSuite
                'These are the ciphers supported on the host.'
           } '2' {
                cls
                Get-IISSite
                'Shows all IIS Sites and Port Bindings.'
           } '3' {
                cls
                netstat -a
           } '4' {
                cls
                netstat -a -b
           } '5' {
                cls
                Get-SqlInstance
                'These are instances listed on MSSQL.'
           } '6' {
                cls
                Get-SqlLogin
                'Here is an output of all logins for MSSQL.'
           } '7' {
                cls
                Get-SqlDatabase
                'These are all Databases within the MSSQL host. Regardless of status.'
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')