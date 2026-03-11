# Branch Condition Test - Tests all 6 RV32I branch types
# Expected output: "B1B2B3B4B5B6\n" if all branches work correctly
# Output is sent to UART at 0x10000000
#
# Tests:
#   B1: BEQ (branch if equal)
#   B2: BNE (branch if not equal)
#   B3: BLT (branch if less than, signed)
#   B4: BGE (branch if greater or equal, signed)
#   B5: BLTU (branch if less than, unsigned)
#   B6: BGEU (branch if greater or equal, unsigned)

.section .text
.global _start
.type _start, @function

_start:
    # Load UART address
    lui t0, 0x10000        # t0 = 0x10000000 (UART base)

    # Initialize test counters
    li t1, 0               # passed = 0

    #=========================================
    # Test B1: BEQ (branch if equal)
    #=========================================
    li t2, 42
    li t3, 42
    beq t2, t3, beq_pass
    j b1_done
beq_pass:
    addi t1, t1, 1         # passed++
b1_done:

    #=========================================
    # Test B2: BNE (branch if not equal)
    #=========================================
    li t2, 10
    li t3, 20
    bne t2, t3, bne_pass
    j b2_done
bne_pass:
    addi t1, t1, 1         # passed++
b2_done:

    #=========================================
    # Test B3: BLT (branch if less than, signed)
    #=========================================
    li t2, -5              # Negative (signed)
    li t3, 5               # Positive
    blt t2, t3, blt_pass
    j b3_done
blt_pass:
    addi t1, t1, 1         # passed++
b3_done:

    #=========================================
    # Test B4: BGE (branch if greater or equal, signed)
    # Test: -1 (0xFFFFFFFF) >= 1 should be FALSE
    # In signed comparison: -1 < 1, so BGE should NOT branch
    # If BGE incorrectly treats as unsigned: 0xFFFFFFFF >= 1 would branch (wrong)
    #=========================================
    li t2, -1              # t2 = 0xFFFFFFFF (-1 signed)
    li t3, 1               # t3 = 1
    bge t2, t3, b4_fail    # Should NOT branch (signed: -1 < 1)
    addi t1, t1, 1         # passed++ (correctly did NOT branch)
    j b4_done
b4_fail:
    # BGE incorrectly branched (treated as unsigned)
b4_done:

    #=========================================
    # Test B5: BLTU (branch if less than, unsigned)
    # Test: 1 < 0xFFFFFFFF should be TRUE (unsigned comparison)
    # In unsigned: 1 < 4294967295, so BLTU SHOULD branch
    # If BLTU incorrectly treats as signed: 1 < -1 would NOT branch (wrong)
    #=========================================
    li t2, 1               # t2 = 1
    li t3, -1              # t3 = 0xFFFFFFFF (max uint, -1 signed)
    bltu t2, t3, bltu_pass # Should branch (unsigned: 1 < 0xFFFFFFFF)
    j b5_fail
bltu_pass:
    addi t1, t1, 1         # passed++ (correctly branched)
    j b5_done
b5_fail:
    # BLTU incorrectly did NOT branch (treated as signed)
b5_done:

    #=========================================
    # Test B6: BGEU (branch if greater or equal, unsigned)
    # Test: 0xFFFFFFFF >= 1 should be TRUE (unsigned comparison)
    # In unsigned: 4294967295 >= 1, so BGEU SHOULD branch
    # If BGEU incorrectly treats as signed: -1 >= 1 would NOT branch (wrong)
    #=========================================
    li t2, -1              # t2 = 0xFFFFFFFF (max uint, -1 signed)
    li t3, 1               # t3 = 1
    bgeu t2, t3, bgeu_pass # Should branch (unsigned: 0xFFFFFFFF >= 1)
    j b6_fail
bgeu_pass:
    addi t1, t1, 1         # passed++ (correctly branched)
    j b6_done
b6_fail:
    # BGEU incorrectly did NOT branch (treated as signed)
b6_done:

    #=========================================
    # Output results
    #=========================================
    # t1 should be 6 if all tests passed
    # Output B1..B6 for each passed test

    li t6, 6
    bne t1, t6, fail

    # All tests passed - output "B1B2B3B4B5B6\n"
    li t2, 0x42            # 'B'
    sw t2, 0(t0)
    li t2, 0x31            # '1'
    sw t2, 0(t0)
    li t2, 0x42            # 'B'
    sw t2, 0(t0)
    li t2, 0x32            # '2'
    sw t2, 0(t0)
    li t2, 0x42            # 'B'
    sw t2, 0(t0)
    li t2, 0x33            # '3'
    sw t2, 0(t0)
    li t2, 0x42            # 'B'
    sw t2, 0(t0)
    li t2, 0x34            # '4'
    sw t2, 0(t0)
    li t2, 0x42            # 'B'
    sw t2, 0(t0)
    li t2, 0x35            # '5'
    sw t2, 0(t0)
    li t2, 0x42            # 'B'
    sw t2, 0(t0)
    li t2, 0x36            # '6'
    sw t2, 0(t0)
    li t2, 0x0A            # '\n'
    sw t2, 0(t0)
    j halt

fail:
    # Failed - output "FAIL\n"
    li t2, 0x46            # 'F'
    sw t2, 0(t0)
    li t2, 0x41            # 'A'
    sw t2, 0(t0)
    li t2, 0x49            # 'I'
    sw t2, 0(t0)
    li t2, 0x4C            # 'L'
    sw t2, 0(t0)
    li t2, 0x0A            # '\n'
    sw t2, 0(t0)

halt:
    j halt

.size _start, .-_start
