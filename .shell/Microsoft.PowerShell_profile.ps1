# *** Must add this to $profile or load the below line***
# $fileContents = [string]::join([environment]::newline, (get-content -path ~/cfig/shell/Microsoft.PowerShell_profile.ps1))
# invoke-expression $fileContents

# >> Plugins
Import-Module posh-git
Import-Module oh-my-posh
# Install-Module -Name PSFz

# >> Settings
Set-Theme Star # Darkblood # Robbyrussell 
Set-PSReadlineOption -EditMode vi -BellStyle None

$env:PATHEXT += ";.py"

# >> Startup Logo
$date = Get-Date
$time = Get-Date -Format "hh:mm tt"
Write-Host "                                  ---------------- " 
Write-Host "    __ _   _    _             _ " -foregroundColor Blue
Write-Host "   /  | \_/ \  (_) _ __    __| |  Never Surrender " -foregroundColor Blue
Write-Host "    | |_   _ \ | || '_ \  / _  |  $($date.ToLongDateString())" -foregroundColor Blue
Write-Host "    | | \_/ \ \| || | | || (_| |  $time" -foregroundColor Blue
Write-Host "    |_|      \/|_||_| |_| \__,_|" -foregroundColor Blue
Write-Host "                                  -------------------------"

# >> Alias and Vars
$nvim = "C:/Program Files/Neovim/bin/nvim.exe"
Set-Alias -name v -value $nvim
# $qmk = "C:/QMK_MSYS/user/bin/bash.exe"
# Set-Alias -name qmk -value $qmk

Set-Alias -name upT -value Get-Uptime

$ws = "D:\websites\"
Function wsPath {Set-Location -Path $ws}
Set-Alias -name ws -value wsPath

$cf = "~\cfig\"
Function configPath {Set-Location -Path $cf}
Set-Alias -name cf -value configPath

# $qmk = "C:\QMK_MSYS\conemu\ConEmu64.exe"
# Function qmkTerminal {Set-Location -Path $qmk}
# Set-Alias -name qmk -value qmkTerminal

$keys = "~\qmk_firmware\keyboards\pinky\4\keymaps\b1m1nd\"
Function keyMaps {Set-Location -Path $keys}
Set-Alias -name keys -value keyMaps

Function nukenode {Get-ChildItem -Path "." -Include "node_modules" -Recruse -Directory | Remove-Item -Recruse -Force}
Set-Alias -name nukenode -value nukenode

$vrc = "~/cfig/_vimrc"
# $prof = "~\cfig\.shell\Microsoft.PowerShell_profile.ps1"

$ahkScript = "~\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\capsEsacpeSwitch.ahk"
$nostromo = "~\AppData\Roaming\Belkin\Nostromo\Profiles\*.*"
$keysticks = "~\Documents\Keysticks\Profiles\*.*"
