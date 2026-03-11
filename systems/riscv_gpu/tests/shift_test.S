# Shift Operations Test - Tests all 6 RV32I shift types
# Expected output: "S1S2S3S4S5S6\n" if all shift operations work correctly
# Output is sent to UART at 0x10000000
#
# Tests:
#   S1: SLLI (shift left logical immediate) - 1 << 4 = 16
#   S2: SRLI (shift right logical immediate) - 256 >> 4 = 16 (fills with zeros)
#   S3: SRAI (shift right arithmetic immediate) - -256 >> 4 = -16 (preserves sign)
#   S4: SLL  (shift left logical register) - 1 << 4 = 16
#   S5: SRL  (shift right logical register) - 256 >> 4 = 16 (fills with zeros)
#   S6: SRA  (shift right arithmetic register) - -256 >> 4 = -16 (preserves sign)

.section .text
.global _start
.type _start, @function

_start:
    # Load UART address
    lui t0, 0x10000        # t0 = 0x10000000 (UART base)

    # Initialize test counter
    li t1, 0               # passed = 0

    #=========================================
    # Test S1: SLLI (shift left logical immediate)
    # 1 << 4 = 16
    #=========================================
    li t2, 1
    slli t3, t2, 4         # t3 = 1 << 4 = 16
    li t4, 16
    bne t3, t4, s1_done
    addi t1, t1, 1         # passed++
s1_done:

    #=========================================
    # Test S2: SRLI (shift right logical immediate)
    # 256 >> 4 = 16 (logical shift fills with zeros)
    #=========================================
    li t2, 256
    srli t3, t2, 4         # t3 = 256 >> 4 = 16
    li t4, 16
    bne t3, t4, s2_done
    addi t1, t1, 1         # passed++
s2_done:

    #=========================================
    # Test S3: SRAI (shift right arithmetic immediate)
    # -256 >> 4 = -16 (arithmetic shift preserves sign bit)
    # Load 0xFFFFFF00 which is -256 in two's complement
    #=========================================
    li t2, 0xFFFFFF00      # -256 signed
    srai t3, t2, 4         # t3 = -256 >> 4 = -16 (arithmetic)
    li t4, 0xFFFFFFF0      # -16 signed
    bne t3, t4, s3_done
    addi t1, t1, 1         # passed++
s3_done:

    #=========================================
    # Test S4: SLL (shift left logical register)
    # 1 << 4 = 16 (shift amount from register)
    #=========================================
    li t2, 1
    li t5, 4               # shift amount in register
    sll t3, t2, t5         # t3 = 1 << 4 = 16
    li t4, 16
    bne t3, t4, s4_done
    addi t1, t1, 1         # passed++
s4_done:

    #=========================================
    # Test S5: SRL (shift right logical register)
    # 256 >> 4 = 16 (logical shift fills with zeros)
    #=========================================
    li t2, 256
    li t5, 4               # shift amount in register
    srl t3, t2, t5         # t3 = 256 >> 4 = 16
    li t4, 16
    bne t3, t4, s5_done
    addi t1, t1, 1         # passed++
s5_done:

    #=========================================
    # Test S6: SRA (shift right arithmetic register)
    # -256 >> 4 = -16 (arithmetic shift preserves sign bit)
    # This tests that SRA fills with sign bit, not zeros
    #=========================================
    li t2, 0xFFFFFF00      # -256 signed
    li t5, 4               # shift amount in register
    sra t3, t2, t5         # t3 = -256 >> 4 = -16 (arithmetic)
    li t4, 0xFFFFFFF0      # -16 signed
    bne t3, t4, s6_done
    addi t1, t1, 1         # passed++
s6_done:

    #=========================================
    # Output results
    #=========================================
    # t1 should be 6 if all tests passed
    # Output S1..S6 for each passed test

    li t6, 6
    bne t1, t6, fail

    # All tests passed - output "S1S2S3S4S5S6\n"
    li t2, 0x53            # 'S'
    sw t2, 0(t0)
    li t2, 0x31            # '1'
    sw t2, 0(t0)
    li t2, 0x53            # 'S'
    sw t2, 0(t0)
    li t2, 0x32            # '2'
    sw t2, 0(t0)
    li t2, 0x53            # 'S'
    sw t2, 0(t0)
    li t2, 0x33            # '3'
    sw t2, 0(t0)
    li t2, 0x53            # 'S'
    sw t2, 0(t0)
    li t2, 0x34            # '4'
    sw t2, 0(t0)
    li t2, 0x53            # 'S'
    sw t2, 0(t0)
    li t2, 0x35            # '5'
    sw t2, 0(t0)
    li t2, 0x53            # 'S'
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
