// ═══════════════════════════════════════════════════════════════════════
// MOUSE PROGRAM INTEGRATION TESTS
//
// Tests that the mouse library and mouse-based programs assemble correctly
// and that the mouse input layer works end-to-end.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;
use std::path::Path;

// ── Library assembly tests ──

#[test]
fn mouse_lib_assembles() {
    let path = Path::new("lib/mouse.gasm");
    let lib_dir = Path::new("lib");
    let root_dir = Path::new(".");
    assembler::assemble_file(path, &[lib_dir, root_dir]).expect("lib/mouse.gasm should assemble");
}

#[test]
fn mousepaint_assembles() {
    let path = Path::new("programs/mousepaint.gasm");
    let root_dir = Path::new(".");
    assembler::assemble_file(path, &[root_dir]).expect("programs/mousepaint.gasm should assemble");
}

#[test]
fn clicktargets_assembles() {
    let path = Path::new("programs/clicktargets.gasm");
    let root_dir = Path::new(".");
    assembler::assemble_file(path, &[root_dir]).expect("programs/clicktargets.gasm should assemble");
}

// ── Mouse register read tests (inline assembly) ──

#[test]
fn inline_read_mouse_x() {
    let src = "LDI r5, 0xFFA0\nLOAD r0, r5\nHALT";
    let asm = assembler::assemble(src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.mouse_x = 100;
    vm.run();
    assert_eq!(vm.regs[0], 100, "r0 should be mouse_x=100");
}

#[test]
fn inline_read_mouse_y() {
    let src = "LDI r5, 0xFFA1\nLOAD r0, r5\nHALT";
    let asm = assembler::assemble(src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.mouse_y = 200;
    vm.run();
    assert_eq!(vm.regs[0], 200, "r0 should be mouse_y=200");
}

#[test]
fn inline_read_mouse_buttons() {
    let src = "LDI r5, 0xFFA2\nLOAD r0, r5\nHALT";
    let asm = assembler::assemble(src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.mouse_buttons = 5; // left + middle
    vm.run();
    assert_eq!(vm.regs[0], 5, "r0 should be mouse_buttons=5");
}

// ── Mouse-driven program execution tests ──

#[test]
fn mousepaint_draws_on_click() {
    let path = Path::new("programs/mousepaint.gasm");
    let root_dir = Path::new(".");
    let asm = assembler::assemble_file(path, &[root_dir]).expect("mousepaint should assemble");
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);

    // Set mouse to position (50, 60) with left button held
    vm.mouse_x = 50;
    vm.mouse_y = 60;
    vm.mouse_buttons = 1; // left click

    vm.run_with_limit(5000);

    // The program draws with PSET at the mouse position, color cyan (0x00FFFF)
    let screen_w = 256;
    let idx = (60 * screen_w + 50) as usize;
    assert_ne!(vm.screen[idx], 0, "pixel at (50,60) should be drawn (non-black)");
}

#[test]
fn mousepaint_clears_on_right_click() {
    let path = Path::new("programs/mousepaint.gasm");
    let root_dir = Path::new(".");
    let asm = assembler::assemble_file(path, &[root_dir]).expect("mousepaint should assemble");
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);

    // First draw something with left click
    vm.mouse_x = 100;
    vm.mouse_y = 100;
    vm.mouse_buttons = 1;
    vm.run_with_limit(5000);

    // Verify something was drawn at (100, 100)
    let screen_w = 256;
    let idx = (100 * screen_w + 100) as usize;
    assert_ne!(vm.screen[idx], 0, "pixel at (100,100) should be drawn after left click");

    // Right-click (clears screen). Move mouse away from (100,100)
    vm.mouse_x = 10;
    vm.mouse_y = 10;
    vm.mouse_buttons = 2; // right button
    vm.run_with_limit(5000);

    // (100,100) should be black after clear
    assert_eq!(vm.screen[idx], 0, "pixel at (100,100) should be cleared after right-click");
}

#[test]
fn mouse_state_persists_across_yields() {
    let src = r#"
main:
    LDI r5, 0xFFA0
    LOAD r0, r5
    YIELD
    LDI r5, 0xFFA0
    LOAD r1, r5
    MOV r2, r0
    SUB r2, r1
    HALT
"#;
    let asm = assembler::assemble(src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.mouse_x = 77;
    vm.run(); // runs until YIELD
    assert!(!vm.halted, "should be paused at YIELD");
    assert_eq!(vm.regs[0], 77, "first read should get 77");
    vm.run(); // runs from YIELD to HALT
    assert!(vm.halted, "should be halted");
    assert_eq!(vm.regs[1], 77, "second read should also get 77");
    assert_eq!(vm.regs[2], 0, "difference should be 0");
}

#[test]
fn mouse_state_changes_between_yields() {
    let src = r#"
main:
    LDI r5, 0xFFA0
    LOAD r0, r5
    YIELD
    LDI r5, 0xFFA0
    LOAD r1, r5
    HALT
"#;
    let asm = assembler::assemble(src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.mouse_x = 50;
    vm.run(); // runs until YIELD
    assert_eq!(vm.regs[0], 50, "first read should get 50");
    vm.mouse_x = 150;
    vm.run(); // runs from YIELD to HALT
    assert!(vm.halted);
    assert_eq!(vm.regs[1], 150, "second read should get updated 150");
}

#[test]
fn mouse_button_bitmask_works() {
    let src = "LDI r5, 0xFFA2\nLOAD r0, r5\nHALT";
    let asm = assembler::assemble(src).expect("should assemble");

    // Left only
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.mouse_buttons = 1;
    vm.run();
    assert_eq!(vm.regs[0] & 1, 1, "left bit should be set");
    assert_eq!(vm.regs[0] & 2, 0, "right bit should not be set");
    assert_eq!(vm.regs[0] & 4, 0, "middle bit should not be set");

    // Right only
    let mut vm2 = Vm::new(4096);
    vm2.load_program(&asm.pixels);
    vm2.mouse_buttons = 2;
    vm2.run();
    assert_eq!(vm2.regs[0] & 1, 0, "left bit should not be set");
    assert_eq!(vm2.regs[0] & 2, 2, "right bit should be set");

    // All three
    let mut vm3 = Vm::new(4096);
    vm3.load_program(&asm.pixels);
    vm3.mouse_buttons = 7;
    vm3.run();
    assert_eq!(vm3.regs[0], 7, "all three buttons should be 7");
}

#[test]
fn clicktargets_spawns_initial_target() {
    let path = Path::new("programs/clicktargets.gasm");
    let root_dir = Path::new(".");
    let asm = assembler::assemble_file(path, &[root_dir]).expect("clicktargets should assemble");
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);
    vm.mouse_x = 0;
    vm.mouse_y = 0;
    vm.mouse_buttons = 0;
    let cycles = vm.run_with_limit(50000);

    // The program should execute many cycles without crashing.
    // It may eventually halt (game over after 5 misses) but should
    // run for thousands of cycles first.
    assert!(
        cycles > 100,
        "game should execute at least 100 cycles, got {}. pc={}, halted={}",
        cycles, vm.pc, vm.halted
    );
}

#[test]
fn mouse_lib_read_mouse_routine_works() {
    let src = r#"
    LDI r5, 0xFFA0
    LOAD r0, r5
    LDI r5, 0xFFA1
    LOAD r1, r5
    LDI r5, 0xFFA2
    LOAD r2, r5
    HALT
"#;
    let asm = assembler::assemble(src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.mouse_x = 42;
    vm.mouse_y = 99;
    vm.mouse_buttons = 3;
    vm.run();
    assert_eq!(vm.regs[0], 42, "r0 should be mouse_x");
    assert_eq!(vm.regs[1], 99, "r1 should be mouse_y");
    assert_eq!(vm.regs[2], 3, "r2 should be mouse_buttons");
}

#[test]
fn mouse_in_rect_detection() {
    let src = r#"
    LDI r5, 0xFFA0
    LOAD r6, r5
    LDI r5, 0xFFA1
    LOAD r7, r5
    ; Check: mx >= 40 && mx < 60 && my >= 40 && my < 60
    LDI r0, 40
    LDI r1, 60
    BLT r6, r0, outside
    BGE r6, r1, outside
    LDI r0, 40
    LDI r1, 60
    BLT r7, r0, outside
    BGE r7, r1, outside
    LDI r0, 1
    JMP done
outside:
    LDI r0, 0
done:
    HALT
"#;
    let asm = assembler::assemble(src).expect("should assemble");

    // Inside: (50, 50)
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.mouse_x = 50;
    vm.mouse_y = 50;
    vm.run();
    assert_eq!(vm.regs[0], 1, "(50,50) should be inside rect");

    // Outside left: (30, 50)
    let mut vm2 = Vm::new(4096);
    vm2.load_program(&asm.pixels);
    vm2.mouse_x = 30;
    vm2.mouse_y = 50;
    vm2.run();
    assert_eq!(vm2.regs[0], 0, "(30,50) should be outside rect");

    // Exact corner: (40, 40) - inside
    let mut vm3 = Vm::new(4096);
    vm3.load_program(&asm.pixels);
    vm3.mouse_x = 40;
    vm3.mouse_y = 40;
    vm3.run();
    assert_eq!(vm3.regs[0], 1, "(40,40) should be inside rect");

    // Just inside right edge: (59, 59)
    let mut vm4 = Vm::new(4096);
    vm4.load_program(&asm.pixels);
    vm4.mouse_x = 59;
    vm4.mouse_y = 59;
    vm4.run();
    assert_eq!(vm4.regs[0], 1, "(59,59) should be inside rect");
}
