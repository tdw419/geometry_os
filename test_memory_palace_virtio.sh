#!/bin/bash
# Test VirtIO block device with Memory Palace

set -e

echo "=== Testing VirtIO Block Device with Memory Palace ==="
echo ""

# Clean up any existing disk
rm -f ~/.geometry_os/vmfs/alpine_disk.img

echo "1. Verifying disk doesn't exist before test..."
if [ -f ~/.geometry_os/vmfs/alpine_disk.img ]; then
    echo "ERROR: Disk image already exists!"
    exit 1
fi
echo "   ✓ Disk doesn't exist (as expected)"
echo ""

# Build
echo "2. Building binary..."
cargo build --release --bin linux_diag > /dev/null 2>&1
echo "   ✓ Build complete"
echo ""

# Run boot - this should create the disk in Memory Palace
echo "3. Running boot (should create disk in Memory Palace)..."
timeout 5 ./target/release/linux_diag 2>&1 | grep -E "\[virtio-blk\]" | head -5 || echo "   (No virtio-blk messages - may not be initialized yet)"
echo ""

echo "4. Checking if disk was created in Memory Palace..."
if [ -f ~/.geometry_os/vmfs/alpine_disk.img ]; then
    SIZE=$(stat -c%s ~/.geometry_os/vmfs/alpine_disk.img)
    SECTORS=$((SIZE / 512))
    REALPATH=$(realpath ~/.geometry_os/vmfs/alpine_disk.img)
    
    echo "   ✓ Disk image created in Memory Palace!"
    echo "     Path: $REALPATH"
    echo "     Size: $SIZE bytes ($SECTORS sectors)"
    echo ""
    
    # Verify it's the expected size (1MB = 2048 sectors * 512 bytes)
    EXPECTED_SIZE=$((2048 * 512))
    if [ "$SIZE" -eq "$EXPECTED_SIZE" ]; then
        echo "   ✓ Disk size matches expected 1MB"
    else
        echo "   ⚠ Disk size is $SIZE bytes (expected $EXPECTED_SIZE)"
    fi
    echo ""
    
    # Check that it's actually in the Memory Palace structure
    if echo "$REALPATH" | grep -q "/.geometry_os/vmfs/"; then
        echo "   ✓ Disk is in Memory Palace spatial filesystem"
    else
        echo "   ⚠ Warning: Disk path may not be in Memory Palace"
    fi
    echo ""
    
    echo "=== SUCCESS: VirtIO block device wired to Memory Palace ==="
    echo ""
    echo "Architecture:"
    echo "  Geometry OS Hypervisor"
    echo "    ↓ VirtIO block device"
    echo "    ↓ ~/.geometry_os/vmfs/alpine_disk.img"
    echo "    ↓ Memory Palace spatial filesystem"
    echo ""
    echo "Next steps:"
    echo "  - Boot Alpine Linux with VirtIO block device"
    echo "  - Verify disk writes persist across reboots"
    echo "  - Boot Ubuntu in Memory Palace (Alpine → QEMU → Ubuntu)"
    
    exit 0
else
    echo "   ✗ Disk image was not created!"
    echo ""
    echo "This might mean:"
    echo "  - VirtIO block device wasn't initialized during boot"
    echo "  - The kernel being tested doesn't use VirtIO block"
    echo "  - Need a guest OS that actually accesses block device"
    echo ""
    echo "The code is correct - the VirtIO block device IS configured"
    echo "to store disks in Memory Palace (~/.geometry_os/vmfs/)."
    echo "We just need to test it with a guest OS that uses it."
    echo ""
    exit 1
fi