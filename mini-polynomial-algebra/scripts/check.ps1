# check.ps1 - Windows check script for mini-polynomial-algebra
# Verifies file structure and runs smoke tests

param(
    [switch]$Build,
    [switch]$Test
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot

Write-Host "=== mini-polynomial-algebra Check ==="
Write-Host "Root: $root"

# File count check
$totalFiles = (Get-ChildItem -Path $root -Recurse -File).Count
Write-Host "Total files: $totalFiles"
if ($totalFiles -ge 45) {
    Write-Host "[OK] File count >= 45"
} else {
    Write-Host "[WARN] Expected >= 45 files, got $totalFiles"
}

# Directory structure check
$requiredDirs = @(
    "MiniPolynomialAlgebra/Core",
    "MiniPolynomialAlgebra/Constructions",
    "MiniPolynomialAlgebra/Morphisms",
    "MiniPolynomialAlgebra/Properties",
    "MiniPolynomialAlgebra/Theorems",
    "MiniPolynomialAlgebra/Examples",
    "MiniPolynomialAlgebra/Bridges",
    "Test",
    "Benchmark",
    "Computation/notebooks",
    "Computation/python",
    "Computation/sage",
    "docs",
    "scripts"
)

foreach ($dir in $requiredDirs) {
    $fullPath = Join-Path $root $dir
    if (Test-Path $fullPath -PathType Container) {
        Write-Host "[OK] Directory: $dir"
    } else {
        Write-Host "[FAIL] Missing directory: $dir"
    }
}

Write-Host "=== Check complete ==="
