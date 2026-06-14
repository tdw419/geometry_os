#!/bin/bash

# Desktop test - use serial console for login (not VNC)
set -e

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "=== Testing Ubuntu Desktop (Serial Console Login) ==="

# Check kernel
if ! strings "$KERNEL_PATH" | grep -q "virtio_gpu"; then
    echo "✗ virtio-gpu driver NOT found"
    exit 1
fi

# Launch geometry_os
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

# Boot Ubuntu with nographic (serial console)
echo "Booting Ubuntu with nographic console..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M display=none append=console=ttyS0 root=/dev/vda append=rw disk=$DISK_IMAGE" | nc -U /tmp/geo_cmd.sock

# Wait for boot
echo "Waiting for boot (~30s)..."
sleep 30

# Login via serial console
echo ""
echo "=== Logging in as root ==="
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null  # Empty password
sleep 2

# Check if login worked
echo "hypervisor_input echo 'Login successful'" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Check framebuffer (graphics still works)
echo ""
echo "=== Checking framebuffer (X11 can use this) ==="
echo "hypervisor_input ls -l /dev/fb0" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Check X11 status
echo ""
echo "=== Checking if X11 can start ==="
echo "hypervisor_input which X" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Get console output
echo ""
echo "=== Console Output ==="
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | grep -E "Login successful|fb0|root@ubuntu-mp|which X"

# Cleanup
kill $GEOS_PID 2>/dev/null || true
rm -f /tmp/geo_cmd.sock

echo ""
echo "=== Test complete ==="