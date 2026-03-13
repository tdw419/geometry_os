#!/bin/bash
#
# Geometry OS Hardware Test Runner
#
# Validates glyph→GPU→display pipeline on real AMD hardware.

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║     Geometry OS Hardware Test Suite                        ║"
echo "║     AMD GPU Validation                                     ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Check for AMD GPU
if ! lspci | grep -q "AMD.*VGA\|AMD.*3D"; then
    echo "⚠️  No AMD GPU detected - tests will be skipped"
    echo "   Tests require AMD GPU with DRM support"
    exit 0
fi

echo "✓ AMD GPU detected"
echo ""

# Check DRM devices
if [ ! -e /dev/dri/renderD128 ]; then
    echo "⚠️  No DRM render device found at /dev/dri/renderD128"
    echo "   Checking for alternatives..."
    for i in $(seq 128 144); do
        if [ -e "/dev/dri/renderD$i" ]; then
            echo "   Found /dev/dri/renderD$i"
            break
        fi
    done
fi

# Check permissions
if [ ! -r /dev/dri/renderD128 ] || [ ! -w /dev/dri/renderD128 ]; then
    echo "⚠️  Insufficient permissions for DRM device"
    echo "   Run with: sudo $0"
    echo "   Or add user to 'render' group"
    exit 1
fi

echo "✓ DRM device accessible"
echo ""

# Build all packages
echo "▶ Building packages..."
cargo build --release --package glyph_compiler --features vulkan 2>&1 | grep -E "Compiling|Finished|error"
cargo build --release --package infinite_map_rs 2>&1 | grep -E "Compiling|Finished|error"

echo ""
echo "▶ Running unit tests..."
cargo test --release --package glyph_compiler 2>&1 | tail -10

echo ""
echo "▶ Running hardware tests..."
python3 -m pytest tests/hardware/ -v --tb=short 2>&1 | tail -30

echo ""
echo "═════════════════════════════════════════════════════════════"
echo "Hardware test suite complete"
