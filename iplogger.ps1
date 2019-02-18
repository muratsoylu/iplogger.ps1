while (1) {

$scriptpath = $MyInvocation.MyCommand.Definition  
[string]$dir = Split-Path $scriptpath   
set-location $dir 
 
$oldip = gc .\ip.txt 
Write-Host "Your previous IP was: $oldip" 
$currentip = (New-Object net.webclient).downloadstring("http://api.ipify.org") 
while ($currentip -eq '') {$currentip = (New-Object net.webclient).downloadstring("http://api.ipify.org")} 
Write-Host "Your current IP is: $currentip" 
 
 
 
if ($oldip -ne $currentip) { 
     
   
   [System.Windows.MessageBox]::Show($currentip)
   $currentip | Out-File .\ip_log.txt -Append 
     
} 
 
$currentip | Out-File .\ip.txt -Force 
Write-Host "New IP saved in file is: $currentip"

  Start-Sleep -s 3000

}

