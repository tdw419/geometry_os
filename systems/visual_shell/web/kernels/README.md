# WGPU Linux Hypervisor - Kernels

This directory contains pre-compiled Linux kernels for the WGPU hypervisor.

## Kernel Format

Kernels are stored as `.rts.png` files - RISC-V binary code embedded in PNG textures (PixelRTS format).

### Why PNG?

The `.rts.png` format allows:
- **GPU-native storage**: Textures can be sampled directly by WebGPU shaders
- **Compression**: PNG compression reduces kernel size significantly
- **Visual inspection**: Kernels can be viewed as images for debugging

### Binary Format

For non-RTS kernels (`.riscv`, `.bin`):
- Standard RISC-V 32-bit instruction stream
- Little-endian byte order
- Entry point at address 0x00000000

## Available Kernels

| Kernel | Size | Description | Status |
|--------|------|-------------|--------|
| `mmu_test_kernel.riscv` | ~6KB | MMU validation kernel | Testing |
| `geometric_counter.riscv` | ~4KB | Simple counter program | Working |
| `hello_world.brick` | ~2KB | Hello World output | Working |
| `alpine_visual.rts.png` | ~5MB | Minimal Alpine Linux | Experimental |
| `ubuntu.rts.png` | ~23MB | Ubuntu userspace | Experimental |

### Kernel Details

#### mmu_test_kernel.riscv
A minimal kernel that tests MMU functionality:
- Sets up page tables (Sv32 mode)
- Tests virtual address translation
- Writes test pattern to framebuffer
- Expected output: Diagonal magenta pattern

## Building Kernels

### Prerequisites

```bash
# Install RISC-V toolchain (Ubuntu/Debian)
sudo apt install gcc-riscv64-unknown-elf binutils-riscv64-unknown-elf

# Or build from source
git clone https://github.com/riscv/riscv-gnu-toolchain
```

### Build Minimal Kernel

```bash
# 1. Write kernel in C (kernel.c)
#include <stdint.h>

#define FRAMEBUFFER 0x01000000

volatile uint32_t* fb = (volatile uint32_t*)FRAMEBUFFER;

void kernel_main() {
    // Draw magenta pattern
    for (int i = 0; i < 1024 * 768; i++) {
        fb[i] = 0x00FF06FF; // RGBA: magenta
    }
    while (1) { asm volatile ("wfi"); }
}

# 2. Compile to RISC-V
riscv64-unknown-elf-gcc -march=rv32im -mabi=ilp32 \
    -nostdlib -static -nodefaultlibs -fno-builtin \
    -T linker.ld -o kernel.elf kernel.c

# 3. Extract binary
riscv64-unknown-elf-objcopy -O binary kernel.elf kernel.bin

# 4. Convert to RTS texture (optional)
python3 systems/pixel_compiler/pixelrts_v2_core.py \
    kernel.bin alpine_minimal.rts.png
```

## Memory Map

Kernels expect this memory layout:

| Address Range | Size | Description |
|---------------|------|-------------|
| 0x00000000 - 0x00FFFFFF | 16MB | Kernel code & data |
| 0x01000000 - 0x01FFFFFF | 16MB | Framebuffer (1024x768x4) |
| 0x02000000 - 0x02FFFFFF | 16MB | MMIO region |
| 0x03000000 - 0x03FFFFFF | 16MB | Page tables (if MMU enabled) |

## Testing

```bash
# Start local server
cd systems/visual_shell/web
python3 -m http.server 8080

# Open test pages
# http://localhost:8080/test_interactive_shell.html
# http://localhost:8080/test_gui_app.html
```
