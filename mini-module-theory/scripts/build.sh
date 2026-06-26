#!/bin/bash
# Build MiniModuleTheory
set -euo pipefail
echo "Building MiniModuleTheory..."
cd "$(dirname "$0")/.."
lake build "$@"
echo "MiniModuleTheory build complete."
