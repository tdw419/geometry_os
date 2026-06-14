#!/bin/bash

# Full VNC test with wait
echo "=== VNC Boot Test ==="

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

# Clean up
killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock

# Launch geometry_os
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

# Boot Ubuntu with VNC
echo "Booting Ubuntu with VNC display..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK_IMAGE" | nc -U /tmp/geo_cmd.sock

# Wait for VNC to be ready
echo "Waiting for VNC server to start (10s)..."
for i in {1..10}; do
    if nc -z localhost 5900 2>/dev/null; then
        echo "✓ VNC ready on port 5900"
        break
    fi
    echo "Waiting... ($i/10)"
    sleep 1
done

# Check VNC port
echo ""
echo "VNC Port Check:"
lsof -i :5900 2>/dev/null | grep LISTEN || echo "Not listening"

# Show connection command
echo ""
echo "=== Connect with: ==="
echo "vncviewer localhost:5900"
echo ""
echo "Press Ctrl+C to stop (VM keeps running)"

# Keep VM running
wait $GEOS_PID