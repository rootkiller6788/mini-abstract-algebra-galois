# Clean script for mini-algebraic-structures
# Usage: .\scripts\clean.ps1

$ErrorActionPreference = "Stop"

Write-Host "Cleaning mini-algebraic-structures..." -ForegroundColor Cyan

# Run lake clean
lake clean

# Remove .lake directory
if (Test-Path ".lake") {
    Write-Host "Removing .lake directory..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force ".lake"
}

# Remove olean files
Write-Host "Removing .olean files..." -ForegroundColor Yellow
Get-ChildItem -Recurse -Filter "*.olean" -ErrorAction SilentlyContinue | Remove-Item -Force

# Remove trace files
Write-Host "Removing .trace files..." -ForegroundColor Yellow
Get-ChildItem -Recurse -Filter "*.trace" -ErrorAction SilentlyContinue | Remove-Item -Force

Write-Host "Clean complete!" -ForegroundColor Green
