// ═══════════════════════════════════════════════════════════════════════
// Mouse input tests: memory-mapped registers at 0xFFA0-0xFFA2
//
// Tests that programs can read mouse position and button state via LOAD
// from the memory-mapped mouse registers.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::{Vm, MOUSE_X_ADDR, MOUSE_Y_ADDR, MOUSE_BUTTONS_ADDR};

/// Verify that reading mouse X register returns the value set by the host.
#[test]
fn mouse_x_register_read() {
    // Program: read mouse_x into r0, then halt
    let src = "\
LDI r5, 0xFFA0
LOAD r0, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);

    // Simulate host setting mouse position
    vm.mouse_x = 128;
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 128, "r0 should contain mouse_x=128");
}

/// Verify that reading mouse Y register returns the value set by the host.
#[test]
fn mouse_y_register_read() {
    let src = "\
LDI r5, 0xFFA1
LOAD r0, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);

    vm.mouse_y = 200;
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 200, "r0 should contain mouse_y=200");
}

/// Verify that reading mouse buttons register returns the button bitmask.
#[test]
fn mouse_buttons_register_read() {
    let src = "\
LDI r5, 0xFFA2
LOAD r0, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);

    // Left button down (bit 0)
    vm.mouse_buttons = 1;
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1, "r0 should contain mouse_buttons=1 (left)");

    // Right button (bit 1)
    let mut vm2 = Vm::new(1024);
    vm2.load_program(&asm.pixels);
    vm2.mouse_buttons = 2;
    vm2.run();
    assert_eq!(vm2.regs[0], 2, "r0 should contain mouse_buttons=2 (right)");

    // Left + Right (bits 0+1)
    let mut vm3 = Vm::new(1024);
    vm3.load_program(&asm.pixels);
    vm3.mouse_buttons = 3;
    vm3.run();
    assert_eq!(vm3.regs[0], 3, "r0 should contain mouse_buttons=3 (left+right)");
}

/// Verify all three mouse registers can be read in one program.
#[test]
fn mouse_read_all_registers() {
    let src = "\
LDI r5, 0xFFA0
LOAD r0, r5
LDI r5, 0xFFA1
LOAD r1, r5
LDI r5, 0xFFA2
LOAD r2, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);

    vm.mouse_x = 42;
    vm.mouse_y = 99;
    vm.mouse_buttons = 5; // left + middle
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 42, "r0 should be mouse_x=42");
    assert_eq!(vm.regs[1], 99, "r1 should be mouse_y=99");
    assert_eq!(vm.regs[2], 5, "r2 should be mouse_buttons=5");
}

/// Verify that mouse registers default to 0 on a fresh VM.
#[test]
fn mouse_registers_default_zero() {
    let vm = Vm::new(1024);
    assert_eq!(vm.mouse_x, 0);
    assert_eq!(vm.mouse_y, 0);
    assert_eq!(vm.mouse_buttons, 0);
}

/// Verify that STORE to mouse registers does not change them (read-only).
#[test]
fn mouse_registers_read_only() {
    let src = "\
LDI r0, 100
LDI r5, 0xFFA0
STORE r5, r0
LDI r6, 0xFFA0
LOAD r1, r6
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);

    vm.mouse_x = 42;
    vm.run();

    assert!(vm.halted);
    // mouse_x should still be 42 (STORE ignored, LOAD returns host-set value)
    assert_eq!(vm.regs[1], 42, "mouse_x should still be 42 after STORE attempt");
}

/// Verify that a child VM does not inherit parent mouse state.
#[test]
fn mouse_not_inherited_by_child() {
    let mut vm = Vm::new(1024);
    vm.mouse_x = 100;
    vm.mouse_y = 200;
    vm.mouse_buttons = 3;

    let child = vm.spawn_child(&geometry_os::vm::ChildVm {
        start_addr: 0,
        arg: 0,
    });
    assert_eq!(child.mouse_x, 0, "child should start with mouse_x=0");
    assert_eq!(child.mouse_y, 0, "child should start with mouse_y=0");
    assert_eq!(child.mouse_buttons, 0, "child should start with mouse_buttons=0");
}

/// Verify mouse registers work in a loop (YIELD + re-read).
#[test]
fn mouse_loop_with_yield() {
    // Program reads mouse, increments counter, yields, loops
    let src = "\
LDI r10, 0
LDI r11, 1
loop:
    LDI r5, 0xFFA0
    LOAD r0, r5
    LDI r5, 0xFFA1
    LOAD r1, r5
    ADD r10, r11
    YIELD
    JMP loop
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);

    // First run: mouse at (10, 20)
    vm.mouse_x = 10;
    vm.mouse_y = 20;
    vm.run(); // runs until YIELD
    assert!(!vm.halted);
    assert!(vm.yielded);
    assert_eq!(vm.regs[0], 10);
    assert_eq!(vm.regs[1], 20);
    assert_eq!(vm.regs[10], 1); // counter = 1

    // Second run: update mouse position
    vm.mouse_x = 50;
    vm.mouse_y = 60;
    vm.yielded = false;
    vm.run(); // runs until next YIELD
    assert_eq!(vm.regs[0], 50);
    assert_eq!(vm.regs[1], 60);
    assert_eq!(vm.regs[10], 2); // counter = 2
}

/// Test that mouse registers survive snapshot/restore.
#[test]
fn mouse_snapshot_restore() {
    let mut vm = Vm::new(1024);
    vm.mouse_x = 100;
    vm.mouse_y = 150;
    vm.mouse_buttons = 7; // all buttons

    let snap = vm.snapshot();
    assert_eq!(snap.mouse_x, 100);
    assert_eq!(snap.mouse_y, 150);
    assert_eq!(snap.mouse_buttons, 7);

    // Restore into a fresh VM
    let mut vm2 = Vm::new(1024);
    vm2.restore(&snap);
    assert_eq!(vm2.mouse_x, 100);
    assert_eq!(vm2.mouse_y, 150);
    assert_eq!(vm2.mouse_buttons, 7);
}

/// Integration test: mousepaint.gasm assembles without errors.
#[test]
fn mousepaint_assembles() {
    let src = std::fs::read_to_string("programs/mousepaint.gasm")
        .expect("mousepaint.gasm should exist");
    let asm = assembler::assemble(&src).expect("mousepaint.gasm should assemble");
    assert!(asm.pixels.len() > 0, "mousepaint should produce bytecode");
    assert!(asm.labels.contains_key("main"), "should have a 'main' label");
    assert!(asm.labels.contains_key("loop"), "should have a 'loop' label");
}

/// Test that the mouse registers don't collide with normal RAM.
/// Mouse addresses (0xFFA0) are much higher than typical RAM (4096 words).
#[test]
fn mouse_register_constants_are_correct() {
    assert_eq!(MOUSE_X_ADDR, 0xFFA0);
    assert_eq!(MOUSE_Y_ADDR, 0xFFA1);
    assert_eq!(MOUSE_BUTTONS_ADDR, 0xFFA2);
}
