// Integration test: .gasm text assembler end-to-end
//
// Parse .gasm text -> Vec<u32> -> load into SoftwareVm -> execute -> verify.

use pixels_move_pixels::assembler::{self, parse_gasm};
use pixels_move_pixels::software_vm::SoftwareVm;

#[test]
fn gasm_ldi_add_execute() {
    let src = "\
        LDI r0, 10\n\
        LDI r1, 20\n\
        ADD r0, r1\n\
        HALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    assert_eq!(vm.regs[0], 30, "r0 should be 10 + 20 = 30");
    assert_eq!(vm.regs[1], 20, "r1 should be unchanged");
    assert_eq!(vm.halted, 1, "VM should have halted");
}

#[test]
fn gasm_sub_execute() {
    let src = "\
        LDI r0, 50\n\
        LDI r1, 20\n\
        SUB r0, r1\n\
        HALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    assert_eq!(vm.regs[0], 30);
    assert_eq!(vm.halted, 1);
}

#[test]
fn gasm_mul_execute() {
    let src = "\
        LDI r0, 6\n\
        LDI r1, 7\n\
        MUL r0, r1\n\
        HALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    assert_eq!(vm.regs[0], 42);
    assert_eq!(vm.halted, 1);
}

#[test]
fn gasm_div_execute() {
    let src = "\
        LDI r0, 100\n\
        LDI r1, 5\n\
        DIV r0, r1\n\
        HALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    assert_eq!(vm.regs[0], 20);
    assert_eq!(vm.halted, 1);
}

#[test]
fn gasm_mov_execute() {
    let src = "\
        LDI r0, 77\n\
        MOV r1, r0\n\
        HALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    assert_eq!(vm.regs[0], 77);
    assert_eq!(vm.regs[1], 77);
    assert_eq!(vm.halted, 1);
}

#[test]
fn gasm_memory_store_load_execute() {
    let src = "\
        LDI r0, 42\n\
        LDI r1, 200\n\
        STORE r1, r0\n\
        LDI r2, 0\n\
        LOAD r2, r1\n\
        HALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    // r2 should now contain what was stored at address 200
    assert_eq!(vm.regs[2], 42, "r2 should have loaded the stored value 42");
    assert_eq!(vm.halted, 1);
}

#[test]
fn gasm_loop_counter() {
    // Count from 0 to 10 in a loop
    // Layout: 0-1:LDI r0,0  2-3:LDI r1,1  4-5:LDI r2,10  6:ADD  7-8:BNE(offset=-1)  9:HALT
    // BNE at pixel 7, jump to pixel 6: offset = 6 - 7 = -1
    let src = "\
        LDI r0, 0\n\
        LDI r1, 1\n\
        LDI r2, 10\n\
        ADD r0, r1\n\
        BNE r0, r2, -1\n\
        HALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    assert_eq!(vm.regs[0], 10, "r0 should count up to 10");
    assert_eq!(vm.halted, 1);
}

#[test]
fn gasm_self_replicator_execute() {
    // The canonical self-replicator, written as text
    let src = "\
        LDI r0, 0\n\
        LDI r1, 100\n\
        LDI r2, 0\n\
        LDI r3, 1\n\
        LDI r4, 18\n\
        LOAD r5, r0\n\
        STORE r1, r5\n\
        ADD r0, r3\n\
        ADD r1, r3\n\
        ADD r2, r3\n\
        BNE r2, r4, -7\n\
        HALT";
    let program = parse_gasm(src).unwrap();

    // Verify it produces the same pixels as the Rust builder
    let expected = assembler::self_replicator();
    assert_eq!(program.pixels, expected.pixels, "parsed .gasm should match builder output");
    assert_eq!(program.len(), 18);

    // Execute and verify
    let mut svm = SoftwareVm::new();
    svm.load_program(0, &program.pixels);
    svm.spawn_vm(0, 0);
    svm.execute_frame();

    let vm = svm.vm_state(0);
    assert_eq!(vm.halted, 1, "VM should have halted");

    // Verify the copy: memory at address 100-117 should match 0-17
    for i in 0..18 {
        let original = svm.peek(i);
        let copy = svm.peek(100 + i);
        assert_eq!(
            original, copy,
            "pixel at addr {} should match copy at addr {}",
            i, 100 + i
        );
    }
}

#[test]
fn gasm_char_literal_execute() {
    // Load ASCII 'H' (72) into r0 and verify
    let src = "LDI r0, 'H'\nHALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    assert_eq!(vm.regs[0], 72, "r0 should be ASCII 'H' = 72");
    assert_eq!(vm.halted, 1);
}

#[test]
fn gasm_hex_values_execute() {
    let src = "LDI r0, 0xFF\nLDI r1, 0x01\nADD r0, r1\nHALT";
    let program = parse_gasm(src).unwrap();
    let vm = SoftwareVm::run_program(&program.pixels, 0);
    assert_eq!(vm.regs[0], 256, "0xFF + 1 = 256");
}
