Write-Host "[*] Starting Chrome installation..." -ForegroundColor Cyan

# Define the download URL and output path
$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$installerPath = "$env:TEMP\chrome_installer.exe"

# Check for existing file
if (Test-Path $installerPath) {
    Write-Host "[*] Removing previous installer..." -ForegroundColor DarkYellow
    Remove-Item $installerPath -Force
}

# Download Chrome installer
Write-Host "[*] Downloading Chrome installer..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $chromeUrl -OutFile $installerPath -UseBasicParsing
    Write-Host "[+] Download complete: $installerPath" -ForegroundColor Green
} catch {
    Write-Host "[!] Failed to download Chrome installer." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}

# Run installer silently
Write-Host "[*] Running installer (silent mode)..." -ForegroundColor Cyan
try {
    Start-Process -FilePath $installerPath -ArgumentList "/silent /install" -NoNewWindow
    Write-Host "[+] Installer started." -ForegroundColor Green
} catch {
    Write-Host "[!] Failed to start installer." -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    exit 1
}

Write-Host "[✓] Done. Chrome should be installing now." -ForegroundColor Cyan
