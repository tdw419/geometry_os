#!/bin/bash

# Test VNC connection
set -e

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

# Launch geometry_os
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

# Boot Ubuntu with VNC
echo "Booting with VNC..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK_IMAGE" | nc -U /tmp/geo_cmd.sock

sleep 5

# Check what ports QEMU is listening on
echo ""
echo "=== QEMU Process ==="
ps aux | grep qemu-system-riscv64 | grep -v grep

echo ""
echo "=== Listening Ports ==="
lsof -p $(pgrep qemu-system-riscv64) -i 2>/dev/null | grep LISTEN || echo "No LISTEN sockets found"

# Check QEMU args
echo ""
echo "=== Full QEMU Command ==="
cat /proc/$(pgrep qemu-system-riscv64)/cmdline | tr '\0' ' '

echo ""
echo "=== Trying VNC connection ==="
echo "vncviewer localhost:5900"  # Just show the command, don't run it

# Cleanup
kill $GEOS_PID 2>/dev/null || true
echo ""
echo "VM kept running for manual VNC testing. Kill with: killall qemu-system-riscv64"