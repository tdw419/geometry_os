#!/bin/bash

# Test Ubuntu desktop with virtio-gpu support
set -e

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "=== Testing Ubuntu Desktop with Virtio-GPU ==="

# 1. Check kernel
echo "[1/5] Checking kernel configuration..."
KERNEL_SIZE=$(ls -lh "$KERNEL_PATH" | awk '{print $5}')
echo "Kernel size: $KERNEL_SIZE"

if strings "$KERNEL_PATH" | grep -q "virtio_gpu"; then
    echo "✓ virtio-gpu driver found in kernel"
else
    echo "✗ virtio-gpu driver NOT found in kernel"
    exit 1
fi

# 2. Launch geometry_os and boot Ubuntu
echo "[2/5] Launching geometry_os..."
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!

sleep 2

if [ ! -S /tmp/geo_cmd.sock ]; then
    echo "✗ geometry_os socket not found"
    exit 1
fi

# 3. Send boot command with display=vnc
echo "[3/5] Booting Ubuntu with display=vnc..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK_IMAGE" | nc -U /tmp/geo_cmd.sock

# 4. Wait for boot
echo "[4/5] Waiting for boot (~35s)..."
sleep 35

# 5. Check for framebuffer and X11
echo "[5/5] Checking for desktop support..."

# Login as root (empty password for Enter key)
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock
sleep 1
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock
sleep 2

# Check framebuffer
echo ""
echo "=== Checking /dev/fb* ==="
echo "hypervisor_input ls -l /dev/fb* 2>&1" | nc -U /tmp/geo_cmd.sock
sleep 2

# Check DRI devices
echo ""
echo "=== Checking /dev/dri/ ==="
echo "hypervisor_input ls -l /dev/dri/ 2>&1" | nc -U /tmp/geo_cmd.sock
sleep 2

# Check X11 version
echo ""
echo "=== Checking X11 ==="
echo "hypervisor_input X -version 2>&1" | nc -U /tmp/geo_cmd.sock
sleep 2

# Check drm messages
echo ""
echo "=== DRM Kernel Messages ==="
echo "hypervisor_input dmesg | grep -i drm | head -10" | nc -U /tmp/geo_cmd.sock
sleep 2

# Get console output and filter for virtio/fb/dri
echo ""
echo "=== Console Output Summary ==="
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | grep -E "virtio.*gpu|fb0|dri|card|Initialized virtio_gpu" | head -20

# Cleanup
kill $GEOS_PID 2>/dev/null || true
rm -f /tmp/geo_cmd.sock

echo ""
echo "=== Desktop test complete ==="