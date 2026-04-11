use geometry_os::assembler;
use geometry_os::opcodes::op;
use geometry_os::vm::{Vm, IVT_SIZE};

/// Helper: build pixels from bytes (each byte = one pixel)
fn pixels(bytes: &[u8]) -> Vec<u32> {
    bytes.iter().map(|&b| b as u32).collect()
}

// ═══════════════════════════════════════════════════════════════════
// Basic INT / STI / IRET tests
// ═══════════════════════════════════════════════════════════════════

#[test]
fn test_int_no_handler_is_nop() {
    // INT with no handler registered (IVT entry = 0) should be a NOP
    let mut vm = Vm::new(64);
    // [INT 0] [HALT]
    vm.load_program(&pixels(&[op::INT, 0, op::HALT]));
    vm.run();
    // Should not halt due to error — just skip INT and hit HALT
    assert!(vm.halted);
    assert_eq!(vm.pc, 3);
}

#[test]
fn test_sti_sets_ivt_entry() {
    // STI stores a handler address into IVT[vector]
    let src = "\
        STI 0, handler\n\
        HALT\n\
    handler:\n\
        LDI r0, 42\n\
        HALT\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.step(); // STI 0, handler

    // handler label should be at offset 4 (STI=3 + HALT=1)
    assert_eq!(vm.ivt[0], 4);
}

#[test]
fn test_int_calls_handler() {
    // Set up IVT[0] to point to a handler, then INT 0 should jump there
    let src = "\
        STI 0, handler\n\
        INT 0\n\
        HALT\n\
    handler:\n\
        LDI r0, 42\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.run();

    // Handler should have set r0 = 42, then IRET returns to HALT
    assert!(vm.halted);
    assert_eq!(vm.regs[0], 42);
}

#[test]
fn test_iret_pops_return_address() {
    // Verify IRET pops the return address pushed by INT
    let src = "\
        STI 0, handler\n\
        LDI r0, 0\n\
        INT 0\n\
        LDI r1, 99\n\
        HALT\n\
    handler:\n\
        LDI r0, 77\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.run();

    // After INT 0, handler runs, IRET returns to instruction after INT
    // which is LDI r1, 99
    assert!(vm.halted);
    assert_eq!(vm.regs[0], 77); // handler set r0
    assert_eq!(vm.regs[1], 99); // post-return code set r1
}

#[test]
fn test_int_pushes_correct_return_address() {
    // Manually check that INT pushes PC + width(INT) = PC + 2
    let mut vm = Vm::new(256);
    // Layout:
    // addr 0: LDI r0, 0   (width 3)
    // addr 3: INT 0        (width 2) -> return addr = 3 + 2 = 5
    // addr 5: HALT          (width 1)
    // addr 6: handler: LDI r1, 10  (width 3)
    // addr 9: IRET           (width 1)

    // Set handler at address 6
    vm.ivt[0] = 6;

    let prog = pixels(&[
        op::LDI, 0x30, 0,    // LDI r0, 0
        op::INT, 0,           // INT 0 -> pushes 5, jumps to 6
        op::HALT,             // addr 5: HALT (return target)
        op::LDI, 0x31, 10,   // addr 6: LDI r1, 10 (handler)
        op::IRET,             // addr 9: IRET -> pops 5, jumps to 5
    ]);
    vm.load_program(&prog);

    vm.step(); // LDI r0, 0
    vm.step(); // INT 0

    // Should have jumped to handler (addr 6)
    assert_eq!(vm.pc, 6);
    // Stack should have return address 5
    assert_eq!(vm.stack.len(), 1);
    assert_eq!(vm.stack[0], 5);

    vm.step(); // LDI r1, 10
    assert_eq!(vm.regs[1], 10);

    vm.step(); // IRET -> pops 5, jumps to 5
    assert_eq!(vm.pc, 5);
    assert_eq!(vm.stack.len(), 0);

    vm.step(); // HALT
    assert!(vm.halted);
}

#[test]
fn test_multiple_vectors() {
    // Set up two different interrupt vectors and invoke both
    let src = "\
        STI 0, handler0\n\
        STI 1, handler1\n\
        LDI r0, 0\n\
        LDI r1, 0\n\
        INT 0\n\
        INT 1\n\
        HALT\n\
    handler0:\n\
        LDI r0, 10\n\
        IRET\n\
    handler1:\n\
        LDI r1, 20\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 10);
    assert_eq!(vm.regs[1], 20);
}

#[test]
fn test_nested_interrupts() {
    // Handler 0 triggers INT 1, creating nested interrupt calls
    let src = "\
        STI 0, handler0\n\
        STI 1, handler1\n\
        LDI r0, 0\n\
        INT 0\n\
        HALT\n\
    handler0:\n\
        LDI r0, 1\n\
        INT 1\n\
        IRET\n\
    handler1:\n\
        LDI r1, 2\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1); // handler0 set r0
    assert_eq!(vm.regs[1], 2); // handler1 set r1
}

#[test]
fn test_ivt_initially_zero() {
    let vm = Vm::new(64);
    for i in 0..IVT_SIZE {
        assert_eq!(vm.ivt[i], 0, "IVT[{}] should be 0 initially", i);
    }
}

#[test]
fn test_sti_multiple_vectors() {
    let mut vm = Vm::new(256);
    let src = "\
        STI 3, h3\n\
        STI 7, h7\n\
        HALT\n\
    h3:\n\
        LDI r0, 3\n\
        IRET\n\
    h7:\n\
        LDI r0, 7\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    vm.load_program(&asm.pixels);
    vm.step(); // STI 3, h3
    vm.step(); // STI 7, h7

    // Verify IVT entries are non-zero and different
    assert_ne!(vm.ivt[3], 0);
    assert_ne!(vm.ivt[7], 0);
    assert_ne!(vm.ivt[3], vm.ivt[7]); // Different handlers
    // h3 at offset 7 (STI=3 + STI=3 + HALT=1 = 7)
    // h7 at offset 10 (h3 body: LDI=3 + IRET=1 = 4 more)
    assert_eq!(vm.ivt[3], 7);
    assert_eq!(vm.ivt[7], 11);
}

#[test]
fn test_int_out_of_range_checked() {
    // INT with vector >= IVT_SIZE should error in checked mode
    let mut vm = Vm::new(64);
    // INT 16 (out of range)
    vm.load_program(&pixels(&[op::INT, 16]));
    let result = vm.run_checked();
    assert!(result.is_err());
}

#[test]
fn test_sti_out_of_range_checked() {
    // STI with vector >= IVT_SIZE should error in checked mode
    let mut vm = Vm::new(64);
    // STI 16, 0x50
    vm.load_program(&pixels(&[op::STI, 16, 0x50]));
    let result = vm.run_checked();
    assert!(result.is_err());
}

#[test]
fn test_iret_empty_stack_halts() {
    // IRET with empty stack should halt (like RET with empty stack)
    let mut vm = Vm::new(64);
    vm.load_program(&pixels(&[op::IRET]));
    vm.step();
    assert!(vm.halted);
}

#[test]
fn test_iret_width_is_1() {
    assert_eq!(geometry_os::opcodes::width(op::IRET), 1);
}

#[test]
fn test_sti_width_is_3() {
    assert_eq!(geometry_os::opcodes::width(op::STI), 2 + 1); // Hmm, STI is width 3
    assert_eq!(geometry_os::opcodes::width(op::STI), 3);
}

#[test]
fn test_int_width_is_2() {
    assert_eq!(geometry_os::opcodes::width(op::INT), 2);
}

#[test]
fn test_interrupt_counter() {
    // A loop that calls INT 0 three times, each incrementing a counter in the handler
    let src = "\
        STI 0, inc_handler\n\
        LDI r0, 0\n\
        INT 0\n\
        INT 0\n\
        INT 0\n\
        HALT\n\
    inc_handler:\n\
        LDI r2, 1\n\
        ADD r0, r2\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 3); // Handler called 3 times, incrementing each time
}

#[test]
fn test_assembler_sti_int_iret() {
    // Verify the assembler produces correct bytecode for STI, INT, IRET
    let src = "\
        STI 2, target\n\
        INT 2\n\
        HALT\n\
    target:\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();

    // STI 2, target: opcode=0x74, arg1=2, arg2=absolute_addr_of_target
    assert_eq!(asm.pixels[0], op::STI as u32); // 't' = 0x74
    assert_eq!(asm.pixels[1], 2); // vector number
    // target is at offset 6 (STI=3 + INT=2 + HALT=1 = 6), with bit 31 set
    assert_eq!(asm.pixels[2], 6 | 0x80000000);

    // INT 2: opcode=0x69, arg=2
    assert_eq!(asm.pixels[3], op::INT as u32); // 'i' = 0x69
    assert_eq!(asm.pixels[4], 2);

    // HALT: opcode=0x48
    assert_eq!(asm.pixels[5], op::HALT as u32);

    // IRET: opcode=0x68
    assert_eq!(asm.pixels[6], op::IRET as u32); // 'h' = 0x68
}

#[test]
fn test_snapshot_restore_preserves_ivt() {
    let mut vm = Vm::new(256);
    vm.ivt[0] = 42;
    vm.ivt[5] = 100;
    vm.ivt[15] = 200;

    let snap = vm.snapshot();
    let mut vm2 = Vm::new(256);
    vm2.restore(&snap);

    assert_eq!(vm2.ivt[0], 42);
    assert_eq!(vm2.ivt[5], 100);
    assert_eq!(vm2.ivt[15], 200);
    for i in [1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 14] {
        assert_eq!(vm2.ivt[i], 0);
    }
}

#[test]
fn test_int_uses_existing_stack() {
    // Verify INT works correctly when there are already items on the stack
    let src = "\
        STI 0, handler\n\
        LDI r0, 10\n\
        PUSH r0\n\
        INT 0\n\
        POP r1\n\
        HALT\n\
    handler:\n\
        LDI r2, 99\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[1], 10); // POP should recover the pushed value
    assert_eq!(vm.regs[2], 99); // Handler set r2
}

#[test]
fn test_int_with_max_vector() {
    // INT 15 should work (max valid vector)
    let src = "\
        STI 15, handler\n\
        INT 15\n\
        HALT\n\
    handler:\n\
        LDI r0, 255\n\
        IRET\n\
    ";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 255);
}
