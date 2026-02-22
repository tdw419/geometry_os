# Memory Load/Store Test - Tests all 8 RV32I load/store types
# Expected output: "ML1ML2ML3ML4ML5\n" if all memory operations work correctly
# Output is sent to UART at 0x10000000
#
# Tests:
#   ML1: SW/LW (32-bit word store/load)
#   ML2: SB/LB (8-bit signed - tests sign extension)
#   ML3: SB/LBU (8-bit unsigned - no sign extension)
#   ML4: SH/LH (16-bit signed - tests sign extension)
#   ML5: SH/LHU (16-bit unsigned - no sign extension)
#
# Note: We use a memory region at 0x80010000 for test data
# (well within the VM's memory, above code region)

.section .text
.global _start
.type _start, @function

_start:
    # Load UART address
    lui t0, 0x10000        # t0 = 0x10000000 (UART base)

    # Load test memory address
    lui t5, 0x80010        # t5 = 0x80010000 (test data area)

    # Initialize test counter
    li t1, 0               # passed = 0

    #=========================================
    # Test ML1: SW/LW (32-bit word)
    #=========================================
    li t2, 0xDEADBEEF      # Test pattern
    sw t2, 0(t5)           # Store word
    lw t3, 0(t5)           # Load word back
    beq t2, t3, ml1_pass
    j ml1_done
ml1_pass:
    addi t1, t1, 1         # passed++
ml1_done:

    #=========================================
    # Test ML2: SB/LB (8-bit signed - sign extension)
    # Store 0xFF (-1 signed), LB should return -1 (0xFFFFFFFF sign-extended)
    #=========================================
    li t2, -1              # t2 = 0xFFFFFFFF
    sb t2, 4(t5)           # Store byte 0xFF
    lb t3, 4(t5)           # Load byte signed (should sign-extend to 0xFFFFFFFF)
    li t2, -1              # Reset t2 = 0xFFFFFFFF (expected)
    beq t2, t3, ml2_pass
    j ml2_done
ml2_pass:
    addi t1, t1, 1         # passed++
ml2_done:

    #=========================================
    # Test ML3: SB/LBU (8-bit unsigned - no sign extension)
    # Store 0xFF, LBU should return 0x000000FF (zero-extended)
    #=========================================
    li t2, 0xFF            # Pattern: 0xFF
    sb t2, 8(t5)           # Store byte 0xFF
    lbu t3, 8(t5)          # Load byte unsigned (should zero-extend to 0x000000FF)
    li t2, 0xFF            # Reset t2 = 0xFF (expected)
    beq t2, t3, ml3_pass
    j ml3_done
ml3_pass:
    addi t1, t1, 1         # passed++
ml3_done:

    #=========================================
    # Test ML4: SH/LH (16-bit signed - sign extension)
    # Store 0xFFFF (-1 signed), LH should return -1 (0xFFFFFFFF sign-extended)
    #=========================================
    li t2, -1              # t2 = 0xFFFFFFFF
    sh t2, 12(t5)          # Store halfword 0xFFFF
    lh t3, 12(t5)          # Load halfword signed (should sign-extend to 0xFFFFFFFF)
    li t2, -1              # Reset t2 = 0xFFFFFFFF (expected)
    beq t2, t3, ml4_pass
    j ml4_done
ml4_pass:
    addi t1, t1, 1         # passed++
ml4_done:

    #=========================================
    # Test ML5: SH/LHU (16-bit unsigned - no sign extension)
    # Store 0xFFFF, LHU should return 0x0000FFFF (zero-extended)
    #=========================================
    li t2, 0xFFFF          # Pattern: 0xFFFF
    sh t2, 16(t5)          # Store halfword 0xFFFF
    lhu t3, 16(t5)         # Load halfword unsigned (should zero-extend to 0x0000FFFF)
    li t2, 0xFFFF          # Reset t2 = 0xFFFF (expected)
    beq t2, t3, ml5_pass
    j ml5_done
ml5_pass:
    addi t1, t1, 1         # passed++
ml5_done:

    #=========================================
    # Output results
    #=========================================
    # t1 should be 5 if all tests passed

    li t6, 5
    bne t1, t6, fail

    # All tests passed - output "ML1ML2ML3ML4ML5\n"
    li t2, 0x4D            # 'M'
    sw t2, 0(t0)
    li t2, 0x4C            # 'L'
    sw t2, 0(t0)
    li t2, 0x31            # '1'
    sw t2, 0(t0)
    li t2, 0x4D            # 'M'
    sw t2, 0(t0)
    li t2, 0x4C            # 'L'
    sw t2, 0(t0)
    li t2, 0x32            # '2'
    sw t2, 0(t0)
    li t2, 0x4D            # 'M'
    sw t2, 0(t0)
    li t2, 0x4C            # 'L'
    sw t2, 0(t0)
    li t2, 0x33            # '3'
    sw t2, 0(t0)
    li t2, 0x4D            # 'M'
    sw t2, 0(t0)
    li t2, 0x4C            # 'L'
    sw t2, 0(t0)
    li t2, 0x34            # '4'
    sw t2, 0(t0)
    li t2, 0x4D            # 'M'
    sw t2, 0(t0)
    li t2, 0x4C            # 'L'
    sw t2, 0(t0)
    li t2, 0x35            # '5'
    sw t2, 0(t0)
    li t2, 0x0A            # '\n'
    sw t2, 0(t0)
    j halt

fail:
    # Failed - output "FAIL\n" followed by number of passed tests
    li t2, 0x46            # 'F'
    sw t2, 0(t0)
    li t2, 0x41            # 'A'
    sw t2, 0(t0)
    li t2, 0x49            # 'I'
    sw t2, 0(t0)
    li t2, 0x4C            # 'L'
    sw t2, 0(t0)
    li t2, 0x30            # '0' + passed count
    add t2, t2, t1
    sw t2, 0(t0)
    li t2, 0x0A            # '\n'
    sw t2, 0(t0)

halt:
    j halt

.size _start, .-_start
