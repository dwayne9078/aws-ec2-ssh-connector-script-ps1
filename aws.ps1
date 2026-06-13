# Find ini file
$INIPath = Join-Path $PSScriptRoot "config.ini"

if (-not (Test-Path $INIPath)) {
    Write-Host "=====================================================" -ForegroundColor Red
    Write-Host " ERROR: Could not find 'config.ini'" -ForegroundColor Red
    Write-Host " Make sure the file exists in the same directory" -ForegroundColor Yellow
    Write-Host "=====================================================" -ForegroundColor Red
    Exit
}

# Load Configuration
$cfg = Get-Content $INIPath | ConvertFrom-StringData

if ($null -eq $cfg -or $cfg.Count -eq 0) {
    Write-Host "=====================================================" -ForegroundColor Red
    Write-Host " ERROR: Could not load 'config.ini'" -ForegroundColor Red
    Write-Host "=====================================================" -ForegroundColor Red
    Exit
}

$user = $cfg.user
$hostName = $cfg.hostName
$keyPath = $cfg.keyPath

icacls "$keyPath" /inheritance:r /grant:r "${env:USERNAME}:R" | Out-Null

# MOTD
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "  Starting SSH connection to EC2 instance via AWS" -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "User: $user"
Write-Host "Hostname:    $hostName"
Write-Host "Private Key Path:   $keyPath"
Write-Host "-----------------------------------------------------"


try {
    ssh -i $keyPath "$($user)@$($hostName)"
} catch {
    Write-Error "Something went wrong"
}

Write-Host "=====================================================" -ForegroundColor Cyan
Write-Host "                   Have a nice day                   " -ForegroundColor Cyan
Write-Host "=====================================================" -ForegroundColor Cyan