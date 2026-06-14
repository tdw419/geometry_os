#!/bin/bash

# Desktop test - check X11 status
set -e

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "=== Testing Ubuntu Desktop X11 ==="

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
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Check X11 log
echo ""
echo "=== Checking Xorg log ==="
echo "hypervisor_input cat /var/log/Xorg.0.log | grep -E 'EE|WW|virtio|fb' | head -30" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Check if X11 process is running
echo ""
echo "=== Checking X11 process ==="
echo "hypervisor_input ps aux | grep Xorg" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# Get console output
echo ""
echo "=== Console Output ==="
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | grep -A 5 -E "EE|virtio|fb0|card0"

# Cleanup
kill $GEOS_PID 2>/dev/null || true
rm -f /tmp/geo_cmd.sock

echo ""
echo "=== Test complete ==="