#!/bin/bash

# Simple desktop test - check for /dev/fb0
set -e

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "=== Testing Ubuntu Desktop with Virtio-GPU ==="

# Check kernel
echo "Checking kernel..."
if strings "$KERNEL_PATH" | grep -q "virtio_gpu"; then
    echo "✓ virtio-gpu driver found"
else
    echo "✗ virtio-gpu driver NOT found"
    exit 1
fi

# Launch geometry_os
echo "Launching geometry_os..."
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

# Boot Ubuntu
echo "Booting Ubuntu with display=vnc..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK_IMAGE" | nc -U /tmp/geo_cmd.sock

# Wait for boot
echo "Waiting for boot (~35s)..."
sleep 35

# Login
echo "Logging in as root..."
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 3
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null  # Empty password
sleep 2

# Check /dev/fb0
echo ""
echo "=== Checking framebuffer ==="
echo "hypervisor_input ls -l /dev/fb0" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Check /dev/dri
echo "hypervisor_input ls -l /dev/dri" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Try to start X11
echo ""
echo "=== Testing X11 ==="
echo "hypervisor_input startx &" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 5

# Get console output
echo ""
echo "=== Console Output (last 50 lines) ==="
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | tail -50

# Cleanup
kill $GEOS_PID 2>/dev/null || true
rm -f /tmp/geo_cmd.sock

echo ""
echo "=== Test complete ==="