# Build script for mini-algebraic-structures
# Usage: .\scripts\build.ps1

$ErrorActionPreference = "Stop"

Write-Host "Building mini-algebraic-structures..." -ForegroundColor Cyan

# Check if lake is available
$lakePath = Get-Command lake -ErrorAction SilentlyContinue
if (-not $lakePath) {
    Write-Error "lake not found. Make sure Lean 4 is installed and in PATH."
    exit 1
}

# Clean previous build
Write-Host "Cleaning previous build..." -ForegroundColor Yellow
lake clean

# Update dependencies
Write-Host "Updating dependencies..." -ForegroundColor Yellow
lake update

# Build the package
Write-Host "Building package..." -ForegroundColor Yellow
lake build

if ($LASTEXITCODE -eq 0) {
    Write-Host "Build successful!" -ForegroundColor Green

    # Run smoke tests
    Write-Host "Running smoke tests..." -ForegroundColor Cyan
    lake env lean --run Test/Smoke.lean

    if ($LASTEXITCODE -eq 0) {
        Write-Host "All tests passed!" -ForegroundColor Green
    } else {
        Write-Host "Tests failed!" -ForegroundColor Red
    }
} else {
    Write-Host "Build failed!" -ForegroundColor Red
    exit 1
}
