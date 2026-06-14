#!/bin/bash
# Test VirtIO block device with Alpine boot through Memory Palace

set -e

echo "=== VirtIO Memory Palace Integration Test ==="
echo "Disk path: ~/.geometry_os/vmfs/alpine_disk.img"
echo "Architecture: Hypervisor → VirtIO → Memory Palace"
echo ""

# Build geometry-os
echo "Building geometry-os..."
cargo build --release 2>&1 | tail -5

echo ""
echo "=== Launching Alpine boot test ==="
echo "Expected: Guest should see virtio-blk at 0x10001000"
echo "Expected: Disk reads/writes persist to ~/.geometry_os/vmfs/alpine_disk.img"
echo ""

# Run with Alpine kernel
./target/release/geometry_os --boot-alpine

echo ""
echo "=== Test complete ==="
echo "Check ~/.geometry_os/vmfs/alpine_disk.img for persistence"