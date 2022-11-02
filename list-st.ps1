$complist = Get-AdComputer -filter * -SearchBase "OU=**,DC=**,DC=**"
foreach ($comp in $complist) {
Write-Host "`r`nServer:"$comp.DNSHostName
Invoke-Command -ComputerName $comp.DNSHostName -ScriptBlock { Get-ScheduledTask | Where-Object { $_.Author -eq "DOMAIN\username" } }
}