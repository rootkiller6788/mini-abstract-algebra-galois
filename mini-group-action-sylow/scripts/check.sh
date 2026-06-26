#!/bin/bash
set -e
echo "=== mini-group-action-sylow ==="

echo ""
echo "[1/4] lake build ..."
lake build

echo ""
echo "[2/4] Smoke tests ..."
lake env lean --run Test/Smoke.lean

echo ""
echo "[3/4] Example tests ..."
lake env lean --run Test/Examples.lean

echo ""
echo "[4/4] Regression tests ..."
lake env lean --run Test/Regression.lean

echo ""
echo "=== All checks passed ==="
