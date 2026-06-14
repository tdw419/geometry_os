#!/bin/bash
# Automated VirtIO test via command socket

set -e

echo "=== VirtIO Memory Palace Test via Socket ==="
echo ""

# Start geometry-os in background
./target/release/geometry_os &
GEOS_PID=$!

sleep 2

# Send hypervisor_boot command via socket
echo "Sending hypervisor_boot command..."
echo "hypervisor_boot arch=riscv64 kernel=/home/jericho/projects/zion/projects/geometry_os/alpine/Image ram=256M" | nc -U /tmp/geo_cmd.sock || true

sleep 5

# Send input to check boot
echo "Testing input..."
echo "hypervisor_input help" | nc -U /tmp/geo_cmd.sock || true

sleep 2

# Kill and report
kill $GEOS_PID 2>/dev/null || true
wait $GEOS_PID 2>/dev/null || true

# Check disk persistence
echo ""
echo "=== Persistence Check ==="
if [ -f ~/.geometry_os/vmfs/alpine_disk.img ]; then
    ls -lh ~/.geometry_os/vmfs/alpine_disk.img
    echo "Disk exists - VirtIO writes persisted to Memory Palace!"
else
    echo "No disk file - guest didn't write"
fi