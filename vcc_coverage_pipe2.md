# VCC Coverage Analysis - pipe2 Implementation

## Current Status

**Total Syscalls in Traces:** 494
**Pixel-Native Coverage:** 362/494 (73.3%)
**Previous Coverage:** 469/662 (70.8% - from different metric)

## pipe2 Impact

**Pipe Calls in Traces:** 3 (now covered ✓)

## Top Syscalls by Frequency

| Syscall     | Calls | %     | Coverage |
|------------|-------|-------|----------|
| write      | 308   | 62.35%| ✓        |
| fstat      | 122   | 24.70%| ✗ (fstatat covers) |
| openat     | 11    | 2.23% | ✓        |
| unlink     | 10    | 2.02% | ✓        |
| exit       | 8     | 1.62% | ✓        |
| read       | 8     | 1.62% | ✓        |
| wait       | 8     | 1.62% | ✗ PRIORITY |
| close      | 7     | 1.42% | ✓        |
| fork       | 7     | 1.42% | ✓        |
| pipe       | 3     | 0.61% | ✓ (NEW) |
| rmdir      | 1     | 0.20% | ✗        |
| getpid     | 1     | 0.20% | ✗        |

## Pixel-Native Syscalls Implemented (14)

✓ write (syscall 16, 64)
✓ fork (syscall 2, 220)
✓ openat (syscall 56)
✓ close (syscall 57)
✓ read (syscall 63)
✓ exit (syscall 93)
✓ execve (syscall 221)
✓ getdents (syscall 78)
✓ fstatat (syscall 79)
✓ unlink (syscall 87)
✓ brk (syscall 214)
✓ munmap (syscall 215)
✓ pipe2 (syscall 59) - NEW
✓ mmap (syscall 222)

## Next Priority: wait4/waitpid

**Calls:** 8 (1.62%)
**Impact:** Enables proper parent-child process synchronization
**Use cases:** Shell command sequences, process completion checking
**Syscall:** wait4 (260 in RISC-V Linux) or waitpid

## Technical Notes

- fstat (122 calls) should be covered by fstatat (syscall 79) with AT_FDCWD
- Pipe buffer region: 0x80020000+ (4KB per pipe)
- Atomic pipe ID allocation prevents race conditions
- Guest memory writes properly translated through MMU