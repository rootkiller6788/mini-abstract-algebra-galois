$ErrorActionPreference = "Stop"
Write-Host "=== mini-group-theory-core: Clean ==="

Write-Host "`n[1/2] lake clean ..."
lake clean
if ($LASTEXITCODE -ne 0) { throw "lake clean failed" }

Write-Host "`n[2/2] Removing build artifacts ..."
if (Test-Path "build") { Remove-Item -Recurse -Force "build" }
if (Test-Path "lake-packages") { Remove-Item -Recurse -Force "lake-packages" }
if (Test-Path ".lake") { Remove-Item -Recurse -Force ".lake" }

Write-Host "`n=== Clean complete ==="
