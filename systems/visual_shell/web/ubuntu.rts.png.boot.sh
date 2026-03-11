#!/bin/bash
# Auto-generated QEMU boot script for PixelRTS v2
# Generated from: systems/visual_shell/web/ubuntu.rts.png

KERNEL="kernel_extracted"
INITRD="initrd_extracted"

# Verify hashes before boot
echo "Verifying extracted binaries..."
KERNEL_HASH=$(sha256sum $KERNEL | awk '{print $1}')
INITRD_HASH=$(sha256sum $INITRD | awk '{print $1}')

EXPECTED_KERNEL="7cc182440d5ee0964917970acb2f2bfb316e82184df5896c7f0523727c8748d9"
EXPECTED_INITRD="307c3e06ffa7650931a2f5da42937a3b282b95ee088799d420135f0da43ee113"

if [ "$KERNEL_HASH" != "$EXPECTED_KERNEL" ]; then
    echo "❌ Kernel hash mismatch!"
    echo "   Expected: $EXPECTED_KERNEL"
    echo "   Got:      $KERNEL_HASH"
    exit 1
fi

if [ "$INITRD_HASH" != "$EXPECTED_INITRD" ]; then
    echo "❌ Initrd hash mismatch!"
    echo "   Expected: $EXPECTED_INITRD"
    echo "   Got:      $INITRD_HASH"
    exit 1
fi

echo "✅ Hashes verified - booting..."

# Boot with QEMU
qemu-system-x86_64 \
  -m 1024 \
  -kernel $KERNEL \
  -initrd $INITRD \
  -append "console=ttyS0 panic=1" \
  -nographic
