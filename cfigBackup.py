import shutil, os, os.path
from pathlib import Path
home = str(Path.home())

files =  [
  {
    "basePath": "/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json",
    "cfigPath": "/cfig/.shell/settings.json",
  },

  {
    "basePath": "/Documents/PowerShell/Microsoft.PowerShell_profile.ps1",
    "cfigPath": "/cfig/.shell/Microsoft.PowerShell_profile.ps1",
  },

  {
    "basePath": "/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/capsEscapeSwitch.ahk",
    "cfigPath": "/cfig/AutoHotKey/capsEscapeSwitch.ahk",
  },

  { 
    "basePath": "/AppData/Roaming/Belkin/Nostromo/",
    "cfigPath": "/cfig/Nostromo/"
  },

  { 
    "basePath": "/Documents/AntiMicro/",
    "cfigPath": "/cfig/AntiMicro/"
  },
  { 
    "basePath": "/AppData/Roaming/Code/User/keybindings.json",
    "cfigPath": "/cfig/.code/"
  },
]
print("Starting cfig backup")

for f in files:
  cPath = str(Path(f["cfigPath"]))
  bPath = str(Path(f["basePath"]))

  if bPath.__contains__('.'):
    shutil.copy(home + bPath, home + cPath)
  else:
    shutil.copytree(home + bPath, home + cPath, ignore_dangling_symlinks=True, dirs_exist_ok=True)

print("Files copied, backup complete")
