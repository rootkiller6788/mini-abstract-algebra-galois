$ErrorActionPreference = "Stop"
Write-Host "=== mini-galois-theory-lite ==="

Write-Host "`n[1/4] lake build ..."
lake build
if ($LASTEXITCODE -ne 0) { throw "lake build failed" }

Write-Host "`n[2/4] Smoke tests ..."
lake env lean --run Test/Smoke.lean
if ($LASTEXITCODE -ne 0) { throw "Smoke tests failed" }

Write-Host "`n[3/4] Example tests ..."
lake env lean --run Test/Examples.lean
if ($LASTEXITCODE -ne 0) { throw "Example tests failed" }

Write-Host "`n[4/4] Regression tests ..."
lake env lean --run Test/Regression.lean
if ($LASTEXITCODE -ne 0) { throw "Regression tests failed" }

Write-Host "`n=== All checks passed ==="
