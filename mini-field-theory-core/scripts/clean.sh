#!/bin/bash
# Clean MiniFieldTheoryCore build artifacts
set -euo pipefail
echo "Cleaning MiniFieldTheoryCore..."
cd "$(dirname "$0")/.."
lake clean
echo "MiniFieldTheoryCore clean complete."
