
# XV6 Observation Training Summary

## Data Collected

- **Total syscall pairs:** 83
- **Unique syscall types:** 9
- **Commands observed:** 1 (ls)

## Syscall Distribution

- **fstat:** 22 calls (26.5%)
- **openat:** 19 calls (22.9%)
- **unlink:** 19 calls (22.9%)
- **pipe:** 18 calls (21.7%)
- **exit:** 1 calls (1.2%)
- **read:** 1 calls (1.2%)
- **wait:** 1 calls (1.2%)
- **close:** 1 calls (1.2%)
- **fork:** 1 calls (1.2%)

## Key Insights

### Console Output Pattern
- **write(fd=1/2)** dominates: 0 calls
- Char-by-char output observed (buffer_size=1)
- Returns bytes_written count

### File Operations Pattern
- **openat:** 19 calls (file opening)
- **fstat:** 22 calls (metadata queries)
- **unlink:** 19 calls (file deletion)
- **close:** 1 calls (fd cleanup)

### Process Lifecycle Pattern
- **fork:** 1 calls (process creation)
- **wait:** 1 calls (child reaping)
- **exit:** 1 calls (termination)
- **pipe:** 18 calls (IPC)

## Pixel-Native Synthesis Opportunities

### 1. Console Write (High Priority)
**Traditional:** ECALL_U → kernel → UART transmit
**Pixel-native:** Direct Hilbert coordinate write
**Savings:** Bypass CPU decode, privilege transitions

### 2. File Operations (Medium Priority)
**Traditional:** namei → inode → block cache → virtio-blk
**Pixel-native:** Direct Hilbert-space file access
**Savings:** Skip filesystem layer for known files

### 3. Process Management (Low Priority)
**Traditional:** process table → page table copy → fd table
**Pixel-native:** Direct spatial process table writes
**Savings:** Bypass kernel memory allocation

## Memory Address Patterns

### Stack Usage
- Buffer addresses: 0x7FFFEC00 - 0x7FFFEDFF (2KB stack)
- Consistent across syscalls

### Page Table Base
- User space: 0x80500000+
- Kernel space: 0x80000000+

### Block Cache
- Filesystem operations use block cache pattern
- Buffer addresses map to cache lines

## Next Steps

1. **Collect more traces:**
   - cat init (file reading)
   - fork_test (process creation)
   - tinycalc (interactive I/O)

2. **Build spatial mapping database:**
   - Map virtual addresses to Hilbert coordinates
   - Track pixel operation patterns

3. **Train synthesis model:**
   - Input: (syscall number, arguments, PC)
   - Output: (spatial operations, Hilbert coordinates)
   - Model learns: syscall → pixel operation mapping

4. **Generate pixel-native hypervisor:**
   - Replace common syscalls with WGSL shaders
   - Preserve input/output semantics
   - Optimize for GPU execution

5. **Verify with Visual Consistency Contract:**
   - Compare final memory palace states
   - Pixel-perfect verification
   - Refine until match
