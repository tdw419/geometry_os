# WGPU Linux Hypervisor - Kernels

This directory contains pre-compiled Linux kernels for WGPU hypervisor.

## Kernel Format

Kernels are stored as `.rts.png` files - RISC-V binary code embedded in PNG textures.

## Available Kernels

| Kernel | Size | Description |
|--------|------|-------------|
| `mmu_test_kernel.riscv` | 6KB | MMU validation kernel |
| `alpine_minimal.rts.png` | ~5MB | Minimal Alpine Linux (Milestone 1) |
| `alpine_gui.rts.png` | ~10MB | Alpine with SDL support (Milestone 3) |

## Building Kernels

### Prerequisites
```bash
# Install RISC-V toolchain
sudo apt install gcc-riscv64-unknown-elf
```

### Build Minimal Kernel
```bash
# Compile kernel
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 \
    -nostdlib -static -o kernel.elf kernel.c

# Convert to binary
riscv64-unknown-elf-objcopy -O binary kernel.elf kernel.bin

# Convert to RTS texture
python3 pixelrts_v2_converter.py kernel.bin alpine_minimal.rts.png
```

## Testing

```bash
# Start local server
python3 -m http.server 8080 --directory ..

# Open test page
# http://localhost:8080/test_boot_shell.html
```
