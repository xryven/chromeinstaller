# download-chrome.ps1
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$out = "$env:TEMP\chrome_installer.exe"

Invoke-WebRequest -Uri $chromeUrl -OutFile $out
Start-Process $out -ArgumentList "/silent /install"
