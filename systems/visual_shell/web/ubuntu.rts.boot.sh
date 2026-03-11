#!/bin/bash
# Auto-generated QEMU boot script for PixelRTS v2
# Generated from: systems/visual_shell/web/ubuntu.rts.png

KERNEL="kernel_extracted"
INITRD="initrd_extracted"

# Verify hashes before boot
echo "Verifying extracted binaries..."
KERNEL_HASH=$(sha256sum $KERNEL | awk '{print $1}')
INITRD_HASH=$(sha256sum $INITRD | awk '{print $1}')

EXPECTED_KERNEL="255b9bcfd69050aa86f780c64349bfb8b95749c5d869cc67f41809241286f001"
EXPECTED_INITRD="00a1a1765538f0e65b1e83df7d57174a6cffeb7bd9826a097bc6e48a43a9d55d"

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
  -append "console=ttyS0 boot=live user=tc quiet disable_vmx=1" \
  -nographic
