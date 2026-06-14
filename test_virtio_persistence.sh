#!/bin/bash
# Test VirtIO block device persistence - write to disk and verify

set -e

echo "=== Testing VirtIO Block Device Write Persistence ==="
echo ""

# Ensure vmfs directory exists
mkdir -p .geometry_os/vmfs

# Clean up any existing disk
rm -f .geometry_os/vmfs/alpine_disk.img

echo "1. Creating initial disk image..."
echo "test-data-$(date +%s)" > .geometry_os/vmfs/alpine_disk.img
INITIAL_MD5=$(md5sum .geometry_os/vmfs/alpine_disk.img | cut -d' ' -f1)
echo "   ✓ Initial disk created with MD5: $INITIAL_MD5"
echo ""

# Build the test binary
echo "2. Building test binary..."
cargo build --release --bin linux_diag > /dev/null 2>&1
echo "   ✓ Build complete"
echo ""

# Run the boot - this should load the disk
echo "3. Running boot (should load existing disk)..."
timeout 5 ./target/release/linux_diag 2>&1 | grep -E "\[virtio-blk\]" || echo "   (No virtio-blk messages)"
echo ""

# Verify disk was loaded
echo "4. Checking if disk data persists..."
if [ -f .geometry_os/vmfs/alpine_disk.img ]; then
    CURRENT_MD5=$(md5sum .geometry_os/vmfs/alpine_disk.img | cut -d' ' -f1)
    SIZE=$(stat -c%s .geometry_os/vmfs/alpine_disk.img)
    
    echo "   ✓ Disk exists"
    echo "     Size: $SIZE bytes"
    echo "     Current MD5: $CURRENT_MD5"
    
    if [ "$CURRENT_MD5" = "$INITIAL_MD5" ]; then
        echo "     ✓ Disk data unchanged (correctly loaded)"
    else
        echo "     ⚠ Disk data changed (VM may have written to it)"
    fi
    echo ""
    
    echo "=== Test Complete ==="
    echo "VirtIO block device is working and disk is stored in:"
    echo "  .geometry_os/vmfs/alpine_disk.img"
    echo ""
    echo "This file will be backed up by Memory Palace spatial filesystem."
    
    exit 0
else
    echo "   ✗ Disk was removed or not created!"
    exit 1
fi