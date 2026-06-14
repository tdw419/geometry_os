#!/bin/bash
# Ubuntu Desktop - launch and keep running

echo "=== Ubuntu RISC-V Desktop Launcher ==="
echo ""
echo "VNC will be on: localhost:5900"
echo "Connect after ~50s with: vncviewer localhost:5900"
echo ""
echo "Press Ctrl+C to stop VM"
echo ""

# Cleanup
killall -9 qemu-system-riscv64 geometry_os 2>/dev/null
sleep 2
rm -f /tmp/geo_cmd.sock /tmp/geos_output.log

# Launch geometry_os
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

# Boot Ubuntu with VNC
DISK="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "[1/4] Booting Ubuntu with VNC..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL ram=256M display=vnc append=console=ttyS0 root=/dev/vda append=rw disk=$DISK" | nc -U /tmp/geo_cmd.sock

# Wait for VNC
echo "[2/4] Waiting for VNC server..."
for i in {1..20}; do
    if nc -z localhost 5900 2>/dev/null; then
        echo "✓ VNC ready"
        break
    fi
    if [ $i -eq 20 ]; then
        echo "✗ VNC failed to start"
        kill $GEOS_PID 2>/dev/null
        exit 1
    fi
    echo "  Waiting... ($i/20)"
    sleep 2
done

# Wait for Ubuntu boot
echo "[3/4] Waiting for Ubuntu boot (~30s)..."
sleep 30

# Login and start X11
echo "[4/4] Logging in and starting X11..."
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input startx &" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 5

echo ""
echo "=== Desktop Ready ==="
echo ""
echo "Connect NOW: vncviewer localhost:5900"
echo ""
echo "VM is running. Press Ctrl+C to stop."
echo ""

# Keep running
trap "echo ''; echo 'Stopping VM...'; kill $GEOS_PID 2>/dev/null; exit 0" INT TERM

wait $GEOS_PID