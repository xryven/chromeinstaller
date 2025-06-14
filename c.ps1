Write-Host "[*] Downloading Chrome installer..." -ForegroundColor Cyan

$chromeUrl = "https://dl.google.com/chrome/install/latest/chrome_installer.exe"
$installerPath = "$env:TEMP\chrome_installer.exe"

# Delete old file if exists
if (Test-Path $installerPath) {
    Remove-Item $installerPath -Force
    Write-Host "[*] Removed old installer."
}

# Correctly download .exe as binary
try {
    Invoke-WebRequest -Uri $chromeUrl -OutFile $installerPath -UseBasicParsing
    Write-Host "[+] Download complete."
} catch {
    Write-Host "[!] Failed to download Chrome." -ForegroundColor Red
    exit 1
}

# Start installer silently
Write-Host "[*] Starting installer..." -ForegroundColor Cyan
try {
    Start-Process -FilePath $installerPath -ArgumentList "/silent /install"
    Write-Host "[✓] Chrome installation started." -ForegroundColor Green
} catch {
    Write-Host "[!] Failed to start installer." -ForegroundColor Red
    exit 1
}
