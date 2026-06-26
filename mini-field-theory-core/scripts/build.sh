#!/bin/bash
# Build MiniFieldTheoryCore
set -euo pipefail
echo "Building MiniFieldTheoryCore..."
cd "$(dirname "$0")/.."
lake build "$@"
echo "MiniFieldTheoryCore build complete."
