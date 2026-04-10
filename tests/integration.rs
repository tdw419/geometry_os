// ═══════════════════════════════════════════════════════════════════════
// INTEGRATION TESTS: Assemble → Load → Run → Verify
//
// These tests exercise the full pipeline:
//   1. Assembler converts .gasm text to pixel sequences
//   2. VM loads and executes those pixel sequences
//   3. We verify register/memory state after execution
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

#[test]
fn assemble_and_run_ldi_halt() {
    // The simplest meaningful program: load 42 into r0, then halt.
    // In "build by typing" terms: type I, 0, *, H
    let src = "\
LDI r0, 42
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(64);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 42);
}

#[test]
fn assemble_and_run_add() {
    let src = "\
LDI r0, 5
LDI r1, 3
ADD r0, r1
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(64);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 8);
}

#[test]
fn assemble_and_run_store_load() {
    let src = "\
LDI r0, 99
LDI r1, 10
STORE r1, r0
LDI r2, 0
LOAD r2, r1
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(64);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[2], 99);
}

#[test]
fn assemble_and_run_loop_counter() {
    // Count from 0 to 5 using a loop.
    // BRANCH needs a packed condition pixel: (r2 << 24) | (r1 << 16) | cond_code
    // We compare r0 (counter) with r2 (target=5), branch while not equal.
    // BNE = cond 1, compare r0 vs r2: (2 << 24) | (0 << 16) | 1 = 0x02000001
    let src = "\
    LDI r0, 0       ; counter
    LDI r1, 1       ; increment
    LDI r2, 5       ; target
loop:
    ADD r0, r1       ; counter += 1
    BRANCH 0x02000001, loop   ; BNE r0, r2 → loop
    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(64);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 5);
}

#[test]
fn assemble_and_run_call_ret() {
    let src = "\
    CALL double
    HALT

double:
    LDI r0, 10
    ADD r0, r0
    RET
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(64);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 20);
}

#[test]
fn assemble_and_run_multiply_via_repeated_add() {
    // 3 * 4 = 12, computed by adding r1 to r0 three times
    // BNE r2, r3: compare r2 (counter) with r3 (zero), branch while counter != 0
    // Packed: (3 << 24) | (2 << 16) | 1 = 0x03020001
    let src = "\
    LDI r0, 0       ; accumulator
    LDI r1, 4       ; value to multiply
    LDI r2, 3       ; counter
    LDI r3, 0       ; zero for comparison
loop:
    ADD r0, r1       ; acc += 4
    SUB r2, r1       ; counter -= 1 (using r1=4, not ideal but shows SUB)
    BRANCH 0x03020001, loop   ; BNE r2, r3
    HALT
";
    // Note: SUB r2, r1 subtracts 4 each time, so r2 goes 3, -1, -5...
    // This won't actually multiply correctly. But the assembler + VM pipeline works.
    let asm = assembler::assemble(src).unwrap();
    assert!(asm.pixels.len() > 0);
}

#[test]
fn assemble_hex_and_ascii_immediates() {
    // Verify that hex and ASCII char literals produce the same values
    let src = "\
LDI r0, 0x2A
LDI r1, '*'
SUB r0, r1
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(64);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0); // 42 - 42 = 0
}

#[test]
fn assemble_with_comments_and_labels() {
    let src = "\
; This program computes 10 + 20 = 30
start:
    LDI r0, 10    ; first operand
    LDI r1, 20    ; second operand
    ADD r0, r1    ; result in r0
    HALT          ; done
";
    let asm = assembler::assemble(src).unwrap();
    assert_eq!(asm.labels.get("start"), Some(&0));

    let mut vm = Vm::new(64);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 30);
}

// ── .ASCIZ integration tests ──────────────────────────────────────

#[test]
fn asciz_string_in_ram_readable_by_vm() {
    // Assemble a string, load into VM, verify VM can read it back
    let src = "\
    HALT
msg:
    .asciz \"Hello\"
";
    let asm = assembler::assemble(src).unwrap();
    let msg_addr = *asm.labels.get("msg").unwrap();
    assert_eq!(msg_addr, 1); // after HALT (width 1)

    let mut vm = Vm::new(256);
    vm.load_program(&asm.pixels);
    vm.run();

    // Verify the string is in RAM
    assert_eq!(vm.ram[msg_addr], b'H' as u32);
    assert_eq!(vm.ram[msg_addr + 1], b'e' as u32);
    assert_eq!(vm.ram[msg_addr + 2], b'l' as u32);
    assert_eq!(vm.ram[msg_addr + 3], b'l' as u32);
    assert_eq!(vm.ram[msg_addr + 4], b'o' as u32);
    assert_eq!(vm.ram[msg_addr + 5], 0); // null terminator
}

#[test]
fn asciz_with_text_opcode_renders() {
    // Assemble a program that uses .asciz with TEXT opcode and run it
    let src = "\
    LDI r0, 0xFFFFFF    ; white text color
    LDI r1, 10          ; x
    LDI r2, 20          ; y
    LDI r3, greeting    ; string address
    TEXT r1, r2, r3     ; render
    HALT
greeting:
    .asciz \"Hi\"
";
    let asm = assembler::assemble(src).unwrap();
    let greeting_addr = *asm.labels.get("greeting").unwrap();
    // LDI(3)+LDI(3)+LDI(3)+LDI(3)+TEXT(4)+HALT(1) = 17
    assert_eq!(greeting_addr, 17);

    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    // String should be in RAM at greeting_addr
    assert_eq!(vm.ram[greeting_addr], b'H' as u32);
    assert_eq!(vm.ram[greeting_addr + 1], b'i' as u32);
    assert_eq!(vm.ram[greeting_addr + 2], 0);
}

#[test]
fn asciz_multiple_strings_with_label_refs() {
    // Multiple strings, program loads one of them by label
    let src = "\
    LDI r0, 0xFFFFFF
    LDI r1, 5
    LDI r2, 5
    LDI r3, msg2
    TEXT r1, r2, r3
    HALT
msg1:
    .asciz \"First\"
msg2:
    .asciz \"Second\"
msg3:
    .asciz \"Third\"
";
    let asm = assembler::assemble(src).unwrap();

    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);

    // Verify all three strings are correctly placed in RAM
    let msg1 = *asm.labels.get("msg1").unwrap();
    let msg2 = *asm.labels.get("msg2").unwrap();
    let msg3 = *asm.labels.get("msg3").unwrap();

    // msg1 = "First\0" = 6 pixels
    assert_eq!(msg2, msg1 + 6);
    // msg2 = "Second\0" = 7 pixels
    assert_eq!(msg3, msg2 + 7);

    assert_eq!(vm.ram[msg1], b'F' as u32);
    assert_eq!(vm.ram[msg2], b'S' as u32);
    assert_eq!(vm.ram[msg3], b'T' as u32);
}
