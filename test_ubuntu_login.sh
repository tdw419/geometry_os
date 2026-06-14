#!/bin/bash

# Ubuntu RISC-V Desktop - use serial console for login (works with socket API)
set -e

DISK_IMAGE="$HOME/.geometry_os/vmfs/ubuntu_disk.img"
KERNEL_PATH="$HOME/.geometry_os/fs/linux/rv64/Image"

echo "=== Ubuntu RISC-V Desktop - Serial Console Login ==="

# 1. Check kernel
echo "[1/5] Verifying kernel..."
if strings "$KERNEL_PATH" | grep -q "virtio_gpu"; then
    echo "✓ virtio-gpu driver present"
else
    echo "✗ virtio-gpu driver NOT found"
    exit 1
fi

# 2. Launch geometry_os
echo "[2/5] Launching geometry_os..."
./target/release/geometry_os --cli > /tmp/geos_output.log 2>&1 &
GEOS_PID=$!
sleep 2

if [ ! -S /tmp/geo_cmd.sock ]; then
    echo "✗ Socket not found"
    exit 1
fi

# 3. Boot Ubuntu with display=none (serial console only)
echo "[3/5] Booting Ubuntu..."
echo "hypervisor_boot arch=riscv64 kernel=$KERNEL_PATH ram=256M display=none append=console=ttyS0 root=/dev/vda append=rw disk=$DISK_IMAGE" | nc -U /tmp/geo_cmd.sock

# 4. Wait for boot
echo "[4/5] Waiting for boot (~30s)..."
sleep 30

# 5. Login via serial console
echo "[5/5] Logging in..."
echo "hypervisor_input root" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input " | nc -U /tmp/geo_cmd.sock > /dev/null  # Empty password
sleep 2

# 6. Verify login and check graphics hardware
echo ""
echo "=== Verification ==="
echo "hypervisor_input echo 'Login successful'" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input ls -l /dev/fb0" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2
echo "hypervisor_input ls -l /dev/dri" | nc -U /tmp/geo_cmd.sock > /dev/null
sleep 2

# 7. Get console output
echo ""
echo "=== Console Output ==="
echo "hypervisor_console" | nc -U /tmp/geo_cmd.sock | tail -50

# Cleanup
kill $GEOS_PID 2>/dev/null || true
rm -f /tmp/geo_cmd.sock

echo ""
echo "=== Test Complete ==="
echo ""
echo "Note: Graphics hardware (virtio-gpu) is present but not actively used."
echo "For graphical desktop, connect VNC client and login on /dev/tty1"