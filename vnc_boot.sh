#!/bin/bash

# Simple VNC boot test
echo "=== Boot Ubuntu with VNC ==="

killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock

./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

echo "Booting..."
DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK" | nc -U /tmp/geo_cmd.sock

echo "Waiting 15s for VNC..."
sleep 15

echo "VNC status:"
lsof -i :5900 2>/dev/null | grep LISTEN || echo "Not listening yet"

echo ""
echo "Console output (last 20 lines):"
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | tail -20

echo ""
echo "VM running. Connect with: vncviewer localhost:5900"
echo "Press Ctrl+C to stop"
wait