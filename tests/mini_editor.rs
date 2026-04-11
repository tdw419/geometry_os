// tests/mini_editor.rs -- Tests for the mini-editor.gasm program
//
// Verifies the mini text editor assembles, initializes, and processes
// keyboard input for character insertion, backspace, and enter.

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Load and assemble the mini-editor program (with .include resolution).
fn assemble_editor() -> assembler::Assembled {
    let path = std::path::Path::new("programs/mini-editor.gasm");
    assembler::assemble_file(path, &[]).expect("mini-editor should assemble")
}

/// Run the VM until it stops (halted, yielded, or max cycles).
fn run_vm(vm: &mut Vm) -> u32 {
    vm.run()
}

/// Inject a key into the keyboard port and run the VM to process it.
fn press_key(vm: &mut Vm, keycode: u32) -> u32 {
    vm.ram[0xFFF] = keycode;
    vm.run()
}

/// Read a null-terminated string from the text buffer at 0x1000.
/// Returns the string as a Vec<u8>.
fn read_buffer(vm: &Vm, max_len: usize) -> Vec<u8> {
    let base = 0x1000;
    let mut result = Vec::new();
    for i in 0..max_len {
        let ch = vm.ram[base + i];
        if ch == 0 {
            break;
        }
        result.push(ch as u8);
    }
    result
}

// ── ASSEMBLY TESTS ────────────────────────────────────────────────────

#[test]
fn mini_editor_assembles() {
    let asm = assemble_editor();
    assert!(
        asm.pixels.len() > 100,
        "editor should have substantial code, got {} pixels",
        asm.pixels.len()
    );
    assert!(
        asm.labels.contains_key("editor_loop"),
        "should have 'editor_loop' label"
    );
    assert!(
        asm.labels.contains_key("handle_printable"),
        "should have 'handle_printable' label"
    );
    assert!(
        asm.labels.contains_key("handle_backspace"),
        "should have 'handle_backspace' label"
    );
    assert!(
        asm.labels.contains_key("handle_enter"),
        "should have 'handle_enter' label"
    );
    assert!(
        asm.labels.contains_key("draw_text_area"),
        "should have 'draw_text_area' label"
    );
}

// ── INITIALIZATION TESTS ─────────────────────────────────────────────

#[test]
fn mini_editor_initializes_without_crash() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    let cycles = run_vm(&mut vm);
    assert!(cycles > 0, "should execute some cycles during init");
    assert!(!vm.halted, "editor should not halt during init");

    // Cursor index should be 0
    assert_eq!(vm.ram[0x1300], 0, "cursor index should start at 0");

    // Buffer should be cleared (first word = 0)
    assert_eq!(vm.ram[0x1000], 0, "buffer should start cleared");
}

// ── CHARACTER INPUT TESTS ────────────────────────────────────────────

#[test]
fn mini_editor_inserts_printable_char() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Press 'H' (0x48)
    press_key(&mut vm, 0x48);
    assert!(!vm.halted, "should not halt after char input");

    // Buffer should contain 'H'
    let buf = read_buffer(&vm, 10);
    assert_eq!(buf, vec![0x48], "buffer should contain 'H' after pressing H");

    // Cursor should be at 1
    assert_eq!(vm.ram[0x1300], 1, "cursor should advance to 1");
}

#[test]
fn mini_editor_inserts_multiple_chars() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Type "HI"
    press_key(&mut vm, 0x48); // 'H'
    press_key(&mut vm, 0x49); // 'I'

    let buf = read_buffer(&vm, 10);
    assert_eq!(buf, vec![0x48, 0x49], "buffer should contain 'HI'");
    assert_eq!(vm.ram[0x1300], 2, "cursor should be at 2");
}

#[test]
fn mini_editor_ignores_non_printable_chars() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Press a control character (0x01)
    press_key(&mut vm, 0x01);
    assert_eq!(vm.ram[0x1300], 0, "cursor should not move for non-printable");

    // Press DEL (0x7F) -- above 0x7E range
    press_key(&mut vm, 0x7F);
    assert_eq!(vm.ram[0x1300], 0, "cursor should not move for DEL");
}

// ── BACKSPACE TESTS ──────────────────────────────────────────────────

#[test]
fn mini_editor_backspace_deletes_char() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Type "AB"
    press_key(&mut vm, 0x41); // 'A'
    press_key(&mut vm, 0x42); // 'B'
    assert_eq!(vm.ram[0x1300], 2, "cursor at 2 after AB");

    // Backspace
    press_key(&mut vm, 0x08);
    assert_eq!(vm.ram[0x1300], 1, "cursor back to 1 after backspace");

    let buf = read_buffer(&vm, 10);
    assert_eq!(buf, vec![0x41], "buffer should contain just 'A' after backspace");
}

#[test]
fn mini_editor_backspace_at_start_does_nothing() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Backspace with empty buffer
    press_key(&mut vm, 0x08);
    assert_eq!(vm.ram[0x1300], 0, "cursor stays at 0");
}

// ── ENTER TESTS ──────────────────────────────────────────────────────

#[test]
fn mini_editor_enter_inserts_newline() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Type "A" then Enter
    press_key(&mut vm, 0x41); // 'A'
    press_key(&mut vm, 0x0D); // Enter

    let buf = read_buffer(&vm, 10);
    assert_eq!(
        buf,
        vec![0x41, 0x0A],
        "buffer should contain 'A' followed by newline (0x0A)"
    );
    assert_eq!(vm.ram[0x1300], 2, "cursor should be at 2");
}

// ── COMBINED TESTS ───────────────────────────────────────────────────

#[test]
fn mini_editor_debug_trace() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    let c = run_vm(&mut vm);
    eprintln!(
        "Init: cycles={}, halted={}, pc={}",
        c, vm.halted, vm.pc
    );
    eprintln!(
        "cursor={}, buf[0..4]={:?}",
        vm.ram[0x1300],
        &vm.ram[0x1000..0x1004]
    );

    // Press 'A'
    press_key(&mut vm, 0x41);
    eprintln!(
        "After A: cursor={}, buf[0..4]={:?}",
        vm.ram[0x1300],
        &vm.ram[0x1000..0x1004]
    );

    // Press 'B'
    press_key(&mut vm, 0x42);
    eprintln!(
        "After B: cursor={}, buf[0..4]={:?}",
        vm.ram[0x1300],
        &vm.ram[0x1000..0x1004]
    );

    // Press Backspace
    press_key(&mut vm, 0x08);
    eprintln!(
        "After BS: cursor={}, buf[0..4]={:?}",
        vm.ram[0x1300],
        &vm.ram[0x1000..0x1004]
    );

    // Press Enter
    press_key(&mut vm, 0x0D);
    eprintln!(
        "After Enter: cursor={}, buf[0..4]={:?}",
        vm.ram[0x1300],
        &vm.ram[0x1000..0x1004]
    );
}

#[test]
fn mini_editor_type_and_delete_sequence() {
    let asm = assemble_editor();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Type "ABC"
    press_key(&mut vm, 0x41); // 'A'
    press_key(&mut vm, 0x42); // 'B'
    press_key(&mut vm, 0x43); // 'C'

    // Backspace twice
    press_key(&mut vm, 0x08);
    press_key(&mut vm, 0x08);

    // Type "XY"
    press_key(&mut vm, 0x58); // 'X'
    press_key(&mut vm, 0x59); // 'Y'

    let buf = read_buffer(&vm, 10);
    assert_eq!(buf, vec![0x41, 0x58, 0x59], "buffer should be 'AXY'");
}
