# Phase 18: The Nursery - Quick Start Guide

## Overview

The Nursery enables recursive compilation of Geometry OS components from within visual containers.

## Prerequisites

- [`ubuntu.rts.png`](systems/visual_shell/web/ubuntu.rts.png) from Phase 17
- [`pixelrts_v2_extractor.py`](pixelrts_v2_extractor.py)
- QEMU installed: `sudo apt-get install qemu-system-x86`

## Quick Start

### 1. Run Recursive Compilation Test

```bash
python3 systems/visual_shell/tools/nursery_launcher_simple.py
```

This will:
- Extract the ubuntu.rts.png artifact
- Launch a VM with 9p filesystem support
- Install build tools (gcc, python3, rustc)
- Compile the test component
- Verify and execute the compiled binary

### 2. Expected Results

After successful completion, you'll find:
- `/tmp/geometry_os/shared/recursive_test_binary` - Compiled Rust binary
- `/tmp/geometry_os/shared/test_result.txt` - Test output
- `/tmp/geometry_os/shared/compilation_report.txt` - Compilation report

### 3. Manual Testing

If you want to test manually:

```bash
# 1. Extract artifact
python3 pixelrts_v2_extractor.py systems/visual_shell/web/ubuntu.rts.png /tmp/geometry_os/runtime

# 2. Create shared directory
mkdir -p /tmp/geometry_os/shared

# 3. Write test source
cat > /tmp/geometry_os/shared/recursive_test.rs << 'EOF'
fn main() {
    println!("Hello from Geometry OS Nursery!");
}
EOF

# 4. Launch VM with 9p filesystem
qemu-system-x86_64 \
  -m 2048 \
  -kernel /tmp/geometry_os/runtime/kernel_extracted \
  -initrd /tmp/geometry_os/runtime/initrd_extracted \
  -append "console=ttyS0 boot=live user=tc" \
  -virtfs local,path=/tmp/geometry_os/shared,mount_tag=host_shared,security_model=mapped \
  -device virtio-9p-pci,fsdev=fsdev0,mount_tag=host_shared \
  -fsdev local,id=fsdev0,path=/tmp/geometry_os/shared,security_model=mapped \
  -nographic

# 5. In the VM (after boot):
sudo mkdir -p /mnt/host_shared
sudo mount -t 9p -o trans=virtio,version=9p2000.L host_shared /mnt/host_shared
cd /mnt/host_shared
# Install build tools and compile
```

## Architecture

```
Host System                    VM (ubuntu.rts.png)
┌─────────────────┐          ┌─────────────────┐
│  /tmp/geometry/ │          │  /mnt/host_    │
│  os/shared/      │◄────────►│  shared/       │
│                 │  9p      │                 │
│  - source.rs    │          │  - source.rs    │
│  - binary       │          │  - binary       │
└─────────────────┘          └─────────────────┘
```

## Troubleshooting

### Issue: VM doesn't boot

**Solution**: Check if QEMU is installed and kernel/initrd were extracted correctly.

### Issue: Build tools fail to install

**Solution**: Ensure VM has network access. The build script runs `setup-network` automatically.

### Issue: 9p filesystem doesn't mount

**Solution**: Check QEMU command includes both `-virtfs` and `-fsdev` parameters with matching paths.

### Issue: Compilation fails

**Solution**: Ensure VM has enough memory (2GB minimum for Rust compilation).

## Customization

### Using Your Own Source Code

1. Place your source code in `/tmp/geometry_os/shared/`
2. Modify the launcher to compile your specific file
3. Run the launcher

### Adding More Build Tools

Edit the `install_build_tools.sh` script to add more Tiny Core extensions:

```bash
tce-load -wi <extension_name>.tcz
```

## Performance Tips

- Use SSD for better I/O performance with 9p filesystem
- Increase VM memory for larger projects
- Pre-download Tiny Core extensions to reduce network dependency
- Use multiple VMs for parallel compilation (Phase 19)

## Next Steps

- **Phase 19**: Distributed Build System
- **Phase 20**: Self-Optimizing Compiler
- **Phase 21**: Neural Build System

## References

- [Phase 18 Complete Documentation](PHASE_18_THE_NURSERY_COMPLETE.md)
- [Phase 18 Plan](PHASE_18_THE_NURSERY_PLAN.md)
- [Phase 17 Complete](PHASE_17_INCEPTION_PROTOCOL_COMPLETE.md)
