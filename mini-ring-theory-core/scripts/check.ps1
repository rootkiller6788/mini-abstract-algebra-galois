# Smoke check script for mini-ring-theory-core
Write-Output "mini-ring-theory-core check..."
lake build 2>&1
if ($LASTEXITCODE -eq 0) { Write-Output "BUILD OK" } else { Write-Output "BUILD FAILED" }
