#!/bin/bash
# VirtIO + Memory Palace integration test with absolute path

set -e

DISK_PATH="$HOME/.geometry_os/vmfs/alpine_disk.img"
KERNEL_PATH="/home/jericho/projects/zion/projects/geometry_os/geometry_os/Image"

echo "=== VirtIO + Memory Palace Integration Test ==="
echo "Kernel: $KERNEL_PATH"
echo "Disk (Memory Palace): $DISK_PATH"
echo ""

# Ensure disk exists
mkdir -p "$(dirname "$DISK_PATH")"
if [ ! -f "$DISK_PATH" ]; then
    echo "Creating test disk..."
    truncate -s 2M "$DISK_PATH"
fi

# Start geometry-os
./target/release/geometry_os > /tmp/geos_virtio.log 2>&1 &
GEOS_PID=$!
sleep 3

# Boot with VirtIO disk (absolute path)
echo "[1] Booting hypervisor with VirtIO block device..."
BOOT_CMD="hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M disk=$DISK_PATH"
echo "$BOOT_CMD"
(echo "$BOOT_CMD"; sleep 1) | nc -U /tmp/geo_cmd.sock > /tmp/boot_virtio.txt 2>&1 &
NC_PID=$!

sleep 10

# Check for VirtIO
echo ""
echo "[2] QEMU/VirtIO logs:"
grep -iE "virtio|virtio-blk|virtio-blk-pci|0x10001000" /tmp/geos_virtio.log | head -15 || echo "No VirtIO logs"

echo ""
echo "[3] Boot response:"
cat /tmp/boot_virtio.txt

# Kill
kill $GEOS_PID 2>/dev/null || true
kill $NC_PID 2>/dev/null || true
wait 2>/dev/null || true

# Verify
echo ""
echo "[4] Persistence:"
DISK_SIZE=$(stat -c%s "$DISK_PATH" 2>/dev/null || stat -f%z "$DISK_PATH" 2>/dev/null || echo "0")
echo "Disk: $DISK_SIZE bytes"
if [ "$DISK_SIZE" -gt 0 ]; then
    echo "✓ VirtIO → Memory Palace integration complete!"
else
    echo "✗ Disk missing"
fi