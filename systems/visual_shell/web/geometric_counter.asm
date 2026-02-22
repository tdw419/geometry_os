# geometric_counter.asm
# Simple RISC-V program to increment a counter in memory-mapped I/O
# and print to console.

.text
main:
    addi x10, x0, 0      # x10 = counter = 0
    addi x11, x0, 10     # x11 = max cycles
    
loop:
    # 1. Increment counter
    addi x10, x10, 1
    
    # 2. Print '!' to console for each increment
    addi x12, x0, 33     # '!'
    # Store to console output (0x20000000)
    # SimplePixelCPU uses STORE with src1=0x20, src2=0x00 for console
    # In RISC-V bit-format, this is harder to encode as a single instruction
    # with immediate, but our transpiler handles it.
    
    # For now, let's just use regular registers for calculation
    # and use ecall for "sys_write_char"
    mv a0, x12
    ecall
    
    # 3. Check loop condition
    addi x11, x11, -1
    bne x11, x0, loop
    
    # Exit
    addi x10, x0, 0
    addi x17, x0, 93    # sys_exit
    ecall
