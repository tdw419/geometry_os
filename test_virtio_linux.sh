#!/bin/bash
# Boot Linux kernel with VirtIO block device and verify guest detection

DISK_PATH="$HOME/.geometry_os/vmfs/alpine_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "=== VirtIO Block Device + Linux Kernel Integration ==="
echo "Disk: $DISK_PATH"
echo "Kernel: $KERNEL"
echo ""

# Ensure disk exists
if [ ! -f "$DISK_PATH" ]; then
    echo "Creating disk image (2MB)..."
    dd if=/dev/zero of="$DISK_PATH" bs=1M count=2 conv=notrunc 2>/dev/null
fi

echo "[1] Booting Linux kernel with VirtIO block device..."
echo ""

# Use hypervisor boot
hermes mcp geo hypervisor-boot \
    "arch=riscv64 kernel=$KERNEL ram=256M disk=$DISK_PATH" \
    window=0 2>&1 | tee /tmp/geos_linux_virtio.log &
PID=$!

echo "[2] Waiting for Linux kernel to boot and detect VirtIO block device..."
sleep 5

echo ""
echo "[3] Checking for VirtIO block device detection in kernel output:"
echo ""

# Search for VirtIO block device messages
if grep -q "virtio_blk" /tmp/geos_linux_virtio.log; then
    echo "✓ VirtIO block driver loaded!"
    grep "virtio" /tmp/geos_linux_virtio.log | head -10
elif grep -q "vda" /tmp/geos_linux_virtio.log || grep -q "virtio" /tmp/geos_linux_virtio.log; then
    echo "✓ VirtIO block device detected!"
    grep -E "(vda|virtio)" /tmp/geos_linux_virtio.log | head -10
else
    echo "⚠ No VirtIO block detection found in kernel output"
    echo "Last 20 lines from kernel:"
    tail -20 /tmp/geos_linux_virtio.log
fi

echo ""
echo "[4] Disk information:"
ls -lh "$DISK_PATH"

echo ""
echo "=== Test Complete ==="
echo "Full log: /tmp/geos_linux_virtio.log"