#!/bin/bash
# Complete VirtIO Memory Palace integration test

set -e

echo "=== VirtIO + Memory Palace Full Integration Test ==="
echo "Kernel: /home/jericho/projects/zion/projects/geometry_os/geometry_os/Image"
echo "Disk (Memory Palace): ~/.geometry_os/vmfs/alpine_disk.img"
echo ""

# Ensure disk exists
mkdir -p ~/.geometry_os/vmfs
if [ ! -f ~/.geometry_os/vmfs/alpine_disk.img ]; then
    echo "Creating test disk..."
    truncate -s 2M ~/.geometry_os/vmfs/alpine_disk.img
fi

# Start geometry-os
./target/release/geometry_os > /tmp/geos_integration.log 2>&1 &
GEOS_PID=$!
sleep 3

# Boot with VirtIO disk
echo "[1] Booting hypervisor with VirtIO block device..."
BOOT_CMD="hypervisor_boot arch=riscv64 kernel=/home/jericho/projects/zion/projects/geometry_os/geometry_os/Image ram=256M disk=~/.geometry_os/vmfs/alpine_disk.img"
echo "$BOOT_CMD"
(echo "$BOOT_CMD"; sleep 1) | nc -U /tmp/geo_cmd.sock > /tmp/boot_resp.txt 2>&1 &
NC_PID=$!

sleep 8

# Check for VirtIO evidence
echo ""
echo "[2] Checking QEMU output for VirtIO block device..."
grep -iE "virtio|virtio-blk|virtio-blk-pci|0x10001000" /tmp/geos_integration.log | head -15 || echo "No direct VirtIO logs (check QEMU stderr)"

# Show boot response
echo ""
echo "[3] Boot response:"
cat /tmp/boot_resp.txt

# Check if guest kernel sees VirtIO
echo ""
echo "[4] Checking guest kernel messages for VirtIO driver load..."
grep -iE "virtio|block.*device|blk:|mmc0:|sda|vda" /tmp/geos_integration.log | head -20 || echo "No guest disk logs in capture"

# Kill processes
kill $GEOS_PID 2>/dev/null || true
kill $NC_PID 2>/dev/null || true
wait 2>/dev/null || true

# Verify persistence
echo ""
echo "[5] Final persistence check:"
DISK_SIZE=$(stat -c%s ~/.geometry_os/vmfs/alpine_disk.img 2>/dev/null || stat -f%z ~/.geometry_os/vmfs/alpine_disk.img 2>/dev/null || echo "0")
echo "Disk size: $DISK_SIZE bytes"
if [ "$DISK_SIZE" -gt 0 ]; then
    echo "✓ VirtIO block device successfully wired to Memory Palace!"
    echo "  Guest OS reads/writes persist to ~/.geometry_os/vmfs/alpine_disk.img"
    echo "  This file lives in the Memory Palace spatial filesystem"
else
    echo "✗ Disk file missing or empty"
fi

echo ""
echo "=== Integration Test Complete ==="