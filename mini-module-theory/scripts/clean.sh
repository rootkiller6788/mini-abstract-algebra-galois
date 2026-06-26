#!/bin/bash
# Clean MiniModuleTheory build artifacts
set -euo pipefail
echo "Cleaning MiniModuleTheory..."
cd "$(dirname "$0")/.."
lake clean
echo "MiniModuleTheory clean complete."
