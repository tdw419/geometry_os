# WGPU Linux Hypervisor - MMU Architecture

## Overview

The MMU (Memory Management Unit) enables virtual memory support in the WGPU RISC-V shader, allowing standard Linux kernels to run with process isolation and memory protection.

## Why MMU?

Without an MMU:
- All programs access physical memory directly
- No memory protection between processes
- No virtual address space for user programs
- Linux cannot run standard desktop GUI applications

With an MMU:
- Each process has its own virtual address space
- Kernel controls memory mapping and protection
- User programs can use standard 2GB/2GB split
- Standard Linux distributions can boot and run GUI apps

## Sv32 Page Table Format

Sv32 is RISC-V's 32-bit virtual memory scheme using 2-level page tables.

### Virtual Address Layout (32 bits)

```
┌────────────────┬────────────────┬────────────────┐
│  VPN[1]       │  VPN[0]       │  Offset        │
│  (10 bits)     │  (10 bits)     │  (12 bits)     │
│  31:22         │  21:12         │  11:0          │
└────────────────┴────────────────┴────────────────┘
```

- **VPN[1]**: Level 1 page table index (0-1023)
- **VPN[0]**: Level 0 page table index (0-1023)
- **Offset**: Byte offset within 4KB page (0-4095)

### Page Table Entry (PTE) Format (32 bits)

```
┌─────────────────┬─────┬────┬────┬────┬────┬────┐
│  PPN[1:0]      │ RSW │ D  │ A  │ G  │ U  │ XWR│ V  │
│  (22 bits)      │(2b) │(1b)│(1b)│(1b)│(1b)│(3b)│(1b)│
│  31:10          │ 9:8 │ 7  │ 6  │ 5  │ 4  │ 3:1│ 0  │
└─────────────────┴─────┴────┴────┴────┴────┴────┴────┘
```

| Field | Bits | Description |
|-------|-------|-------------|
| V     | 0     | Valid - PTE is valid if set |
| R     | 1     | Readable - Page can be read |
| W     | 2     | Writable - Page can be written |
| X     | 3     | Executable - Page can be executed |
| U     | 4     | User - Page accessible in user mode |
| G     | 5     | Global - Page not flushed on SFENCE.VMA |
| A     | 6     | Accessed - Hardware sets on first access |
| D     | 7     | Dirty - Hardware sets on first write |
| RSW   | 8:9   | Reserved for Software |
| PPN   | 10:31 | Physical Page Number |

### Translation Example

**Goal**: Translate VA `0x80000000` to PA

1. **Extract components**:
   - VPN[1] = (0x80000000 >> 22) & 0x3FF = 0x200
   - VPN[0] = (0x80000000 >> 12) & 0x3FF = 0x000
   - Offset = 0x80000000 & 0xFFF = 0x000

2. **Level 1 walk** (satp contains root):
   - PTE1 address = root + (VPN[1] * 4)
   - PTE1 address = 0x03000000 + (0x200 * 4) = 0x03000800
   - Read PTE1: `0x03001001` (V=1, points to level 2)

3. **Level 2 walk**:
   - PTE0 address = (PPN_from_PTE1 * 4096) + (VPN[0] * 4)
   - PTE0 address = 0x03001000 + (0x000 * 4) = 0x03001000
   - Read PTE0: `0x0000000F` (V=1, R=1, W=1, X=1, PPN=0)

4. **Calculate PA**:
   - PA = (PPN_from_PTE0 * 4096) | Offset
   - PA = (0 * 4096) | 0x000 = 0x00000000

**Result**: VA `0x80000000` maps to PA `0x00000000`

## CSR Registers

| CSR | Address | Purpose | Format |
|-----|---------|---------|--------|
| satp | 0x180 | Page table root + mode | `[mode(1)][asid(9)][ppn(22)]` |
| stvec | 0x105 | Trap handler address | `[mode(1)][pad(1)][base(30)]` |
| sscratch | 0x140 | Trap scratch register | 32-bit value |
| mstatus | 0x300 | Machine status | Privilege mode, interrupts |

### satp Register Format

```
┌─────┬─────────────────┬─────────────────┐
│mode │     ASID        │      PPN        │
│(1b) │    (9b)        │     (22b)       │
│ 31  │    30:22       │     21:0        │
└─────┴─────────────────┴─────────────────┘
```

- **mode=0**: Bare metal (no translation)
- **mode=1**: Sv32 (32-bit virtual memory)
- **mode>=8**: Reserved

## Memory Layout

### Physical Memory (64MB)

```
┌─────────────────────────────────────────────────────┐
│ 0x00000000 - 0x00FFFFFF  (16MB)  Kernel      │
│ 0x01000000 - 0x01FFFFFF  (16MB)  Framebuffer │
│ 0x02000000 - 0x02FFFFFF  (16MB)  MMIO       │
│ 0x03000000 - 0x03FFFFFF  (16MB)  Page Tables │
└─────────────────────────────────────────────────────┘
```

### Virtual Address Space (Per-Process)

```
┌─────────────────────────────────────────────────────┐
│ 0x00000000 - 0x7FFFFFFF  (2GB)   User Space │
│ 0x80000000 - 0xFFFFFFFF  (2GB)   Kernel Space│
└─────────────────────────────────────────────────────┘
```

## Usage

### Enabling MMU

```javascript
// 1. Set up page tables in physical memory
const rootPA = 0x03000000;

// 2. Set satp to enable Sv32
const satp = (1 << 31) | (rootPA >> 12);  // mode=1, ppn=rootPA>>12
device.queue.writeBuffer(stateBuffer, 34 * 4, new Uint32Array([satp]));
```

### Mapping a Page

```javascript
// Map VA 0x80000000 -> PA 0x00000000 with R+W+X
const pte = 0x0000000F;  // PPN=0, V+R+W+X
device.queue.writeBuffer(memoryBuffer, 0x03001000, new Uint32Array([pte]));
```

### WebMCP Tools

```javascript
// Enable MMU
await webmcp.executeTool('hypervisor_set_page_table', {
    kernel_id: 'main',
    root_pa: 0x03000000
});

// Map virtual page
await webmcp.executeTool('hypervisor_map_page', {
    kernel_id: 'main',
    va: 0x80000000,
    pa: 0x00000000,
    flags: 0x07  // R+W+X
});
```

## Shader Implementation

The MMU is implemented in `visual_cpu_riscv.wgsl`:

```wgsl
// CSR indices in cpu_states array
const CSR_SATP: u32 = 34u;
const CSR_STVEC: u32 = 35u;
const CSR_SSCRATCH: u32 = 36u;
const CSR_MODE: u32 = 37u;
const CSR_HALT: u32 = 38u;

// Page table translation function
fn translate_address(vaddr: u32, is_write: u32, core_id: u32) -> u32 {
    let satp = cpu_states[base_idx + CSR_SATP];
    let mode = (satp >> 31u) & 1u;

    if (mode == 0u) {
        return vaddr;  // Bare metal
    }

    // Sv32 translation...
    let vpn1 = (vaddr >> 22u) & 0x3FFu;
    let vpn0 = (vaddr >> 12u) & 0x3FFu;
    let offset = vaddr & 0xFFFu;

    // Walk page tables...
    // (See full implementation in shader)
}
```

## Testing

Run the MMU integration tests:

```bash
# Start web server
python3 -m http.server 8080 --directory systems/visual_shell/web

# Open in browser
open http://localhost:8080/test_mmu_integration.html
```

### Test Coverage

- CSR register presence
- CSRRW instruction execution
- CSRRS instruction execution
- Page table walk calculation
- Full VA-to-PA translation
- Page fault handling

## References

- [RISC-V Privileged Architecture v1.12](https://riscv.org/technical/specifications/)
- [Sv32 Memory Mapping](https://github.com/riscv/riscv-isa-manual)
- WGPU MMU Implementation Plan: `docs/plans/2026-02-13-wgpu-linux-hypervisor-mmu.md`
