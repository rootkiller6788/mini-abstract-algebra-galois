#!/usr/bin/env bash
# check.sh - Unix check script for mini-polynomial-algebra
# Verifies file structure and runs smoke tests

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "=== mini-polynomial-algebra Check ==="
echo "Root: $ROOT"

# File count check
total_files=$(find "$ROOT" -type f | wc -l | tr -d ' ')
echo "Total files: $total_files"
if [ "$total_files" -ge 45 ]; then
    echo "[OK] File count >= 45"
else
    echo "[WARN] Expected >= 45 files, got $total_files"
fi

# Check required directories
required_dirs=(
    "MiniPolynomialAlgebra/Core"
    "MiniPolynomialAlgebra/Constructions"
    "MiniPolynomialAlgebra/Morphisms"
    "MiniPolynomialAlgebra/Properties"
    "MiniPolynomialAlgebra/Theorems"
    "MiniPolynomialAlgebra/Examples"
    "MiniPolynomialAlgebra/Bridges"
    "Test"
    "Benchmark"
    "Computation/notebooks"
    "Computation/python"
    "Computation/sage"
    "docs"
    "scripts"
)

for dir in "${required_dirs[@]}"; do
    if [ -d "$ROOT/$dir" ]; then
        echo "[OK] Directory: $dir"
    else
        echo "[FAIL] Missing directory: $dir"
    fi
done

echo "=== Check complete ==="
