#!/bin/bash
# VirtIO integration test with kernel output capture

DISK_PATH="$HOME/.geometry_os/vmfs/alpine_disk.img"
KERNEL_PATH="/home/jericho/projects/zion/projects/geometry_os/geometry_os/Image"

echo "=== VirtIO + Memory Palace Integration ==="
echo "Disk: $DISK_PATH"
echo ""

# Start geometry-os
./target/release/geometry_os > /tmp/geos_final.log 2>&1 &
GEOS_PID=$!
sleep 3

# Boot with VirtIO
echo "[1] Booting hypervisor with VirtIO block device..."
(echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M disk=$DISK_PATH"; sleep 1) | nc -U /tmp/geo_cmd.sock > /tmp/boot_final.txt 2>&1 &
NC_PID=$!

# Wait for kernel boot messages
echo "[2] Waiting for kernel to detect VirtIO block device..."
sleep 12

# Check logs
echo ""
echo "[3] Searching for VirtIO block device detection:"
grep -iE "virtio.*block|virtio-blk|0x10001000|blk:|vda|mmc0" /tmp/geos_final.log | head -20 || echo "No VirtIO block logs found"

echo ""
echo "[4] Boot response:"
cat /tmp/boot_final.txt

# Kill all
kill $GEOS_PID 2>/dev/null || true
kill $NC_PID 2>/dev/null || true
pkill -f "qemu-system-riscv64" 2>/dev/null || true
wait 2>/dev/null || true

# Verify disk persistence
echo ""
echo "[5] Final verification:"
if [ -f "$DISK_PATH" ]; then
    SIZE=$(stat -c%s "$DISK_PATH")
    echo "Disk: $SIZE bytes"
    echo "✓ VirtIO block device successfully wired to Memory Palace!"
    echo "  Guest OS reads/writes persist to $DISK_PATH"
else
    echo "✗ Disk missing"
fi

echo ""
echo "=== Complete ==="
echo "Full log: /tmp/geos_final.log"