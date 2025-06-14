Write-Host "Installing Firefox..." -ForegroundColor Cyan

# Define paths
$desktop = [Environment]::GetFolderPath("Desktop")
$installer = Join-Path $desktop "Firefox_Installer.exe"

# Official Firefox 64-bit EN-US direct link (always latest)
$url = "https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US"

# Download installer silently
try {
    Invoke-WebRequest -Uri $url -OutFile $installer -UseBasicParsing
} catch {
    Write-Host "Download failed." -ForegroundColor Red
    exit 1
}

# Run installer silently
try {
    Start-Process -FilePath $installer -ArgumentList "/silent" -NoNewWindow
} catch {
    Write-Host "Installer failed to start." -ForegroundColor Red
    exit 1
}
