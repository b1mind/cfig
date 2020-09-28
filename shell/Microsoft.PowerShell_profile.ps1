# *** Must add this to default profile location to load this ***
# $fileContents = [string]::join([environment]::newline, (get-content -path ~/cfig/shell/Microsoft.PowerShell_profile.ps1))
# invoke-expression $fileContents

# >> Plugins
Import-Module posh-git
Import-Module oh-my-posh
# Install-Module -Name PSFz

# >> Settings
Set-Theme Star # Darkblood # Robbyrussell 
Set-PSReadlineOption -EditMode vi -BellStyle None

# >> Startup Logo
$date = Get-Date
$time = Get-Date -Format "hh:mm tt"
Write-Host "                                  ---------------- " 
Write-Host "    __          _             _ " -foregroundColor Blue
Write-Host "   /  |  /\/\  (_) _ __    __| |  Never Surrender " -foregroundColor Blue
Write-Host "    | | /    \ | || '_ \  / _  |  $($date.ToLongDateString())" -foregroundColor Blue
Write-Host "    | |/ /\/\ \| || | | || (_| |  $time" -foregroundColor Blue
Write-Host "    |_|\/    \/|_||_| |_| \__,_|" -foregroundColor Blue
Write-Host "                                  -------------------------"

# >> Alias and Vars
Function wsPath {Set-Location -Path D:\websites\}
Set-Alias -name ws -value wsPath
Function configPath {Set-Location -Path ~\cfig\}
Set-Alias -name cf -value configPath

