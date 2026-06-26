#!/bin/bash
# Smoke check script for mini-ring-theory-core
echo "mini-ring-theory-core check..."
lake build 2>&1 && echo "BUILD OK" || echo "BUILD FAILED"
