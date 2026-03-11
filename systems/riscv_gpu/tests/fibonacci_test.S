# Fibonacci Test - Compute first 10 Fibonacci numbers
# Expected output: "1 1 2 3 5 8 13 21 34 55\n"
# Each Fibonacci number is printed as space-separated ASCII digits to UART at 0x10000000
#
# NOTE: Inlines all printing to avoid subroutine call issues.
# Uses repeated subtraction for division (no M extension).

.section .text
.global _start
.type _start, @function

_start:
    # Load UART address
    lui t0, 0x10000        # t0 = 0x10000000 (UART base)

    # Initialize Fibonacci
    # Standard approach: fib_prev=0, fib_curr=1
    # Print fib_curr, then: next = prev + curr, prev = curr, curr = next
    li t1, 0               # fib_prev = 0
    li t2, 1               # fib_curr = 1
    li t3, 10              # count = 10

fib_loop:
    # Print fib_curr (t2)
    # Check if >= 100
    li t4, 100
    blt t2, t4, p_check_10

    # Handle 100+
    mv t5, t2
    li t6, 0
p_div100:
    blt t5, t4, p_pr_h
    addi t5, t5, -100
    addi t6, t6, 1
    j p_div100
p_pr_h:
    addi t6, t6, 0x30
    sw t6, 0(t0)
    j p_check_10_v

p_check_10:
    mv t5, t2
p_check_10_v:
    li t4, 10
    blt t5, t4, p_pr_s
    li t6, 0
p_div10:
    blt t5, t4, p_pr_t
    addi t5, t5, -10
    addi t6, t6, 1
    j p_div10
p_pr_t:
    addi t6, t6, 0x30
    sw t6, 0(t0)
    addi t5, t5, 0x30
    sw t5, 0(t0)
    j p_done
p_pr_s:
    addi t5, t5, 0x30
    sw t5, 0(t0)
p_done:

    # Print space (except last)
    addi t4, t3, -1
    beqz t4, p_skip
    li t4, 0x20
    sw t4, 0(t0)

p_skip:
    # Advance Fibonacci
    add t4, t1, t2         # next = prev + curr
    mv t1, t2              # prev = curr
    mv t2, t4              # curr = next

    # Decrement and loop
    addi t3, t3, -1
    bnez t3, fib_loop

    # Print newline
    li t4, 0x0A
    sw t4, 0(t0)

halt:
    j halt

.size _start, .-_start
