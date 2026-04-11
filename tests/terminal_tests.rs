// ═══════════════════════════════════════════════════════════════════════
// TERMINAL REGISTER TESTS: Scrollable text buffer via memory-mapped I/O.
//
// Tests use the assembler to write .gasm programs that interact with
// terminal registers at 0xFFD8–0xFFDF via STORE/LOAD.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::vm::{
    TextBuffer, TERM_CLEAR_ADDR, TERM_COLS_ADDR, TERM_CURSOR_X_ADDR,
    TERM_CURSOR_Y_ADDR, TERM_LINES_ADDR, TERM_ROWS_ADDR,
};

/// Helper: assemble and run a .gasm program, return the VM.
fn run_gasm(source: &str) -> geometry_os::vm::Vm {
    let mut vm = geometry_os::vm::Vm::new(0x10000);
    let asm = geometry_os::assembler::assemble(source).expect("should assemble");
    vm.load_program(&asm.pixels);
    vm.run();
    vm
}

// ── TextBuffer unit tests ──────────────────────────────────────────

#[test]
fn text_buffer_starts_empty() {
    let tb = TextBuffer::new();
    assert_eq!(tb.line_count(), 1);
    assert_eq!(tb.cursor_x(), 0);
    assert_eq!(tb.cursor_y(), 0);
    assert_eq!(tb.scroll(), 0);
    assert_eq!(tb.get_line(0), b"");
}

#[test]
fn text_buffer_put_char_basic() {
    let mut tb = TextBuffer::new();
    tb.put_char(b'H');
    assert_eq!(tb.get_line(0), b"H");
    assert_eq!(tb.cursor_x(), 1);
    assert_eq!(tb.cursor_y(), 0);

    tb.put_char(b'i');
    assert_eq!(tb.get_line(0), b"Hi");
    assert_eq!(tb.cursor_x(), 2);
}

#[test]
fn text_buffer_newline() {
    let mut tb = TextBuffer::new();
    tb.put_char(b'A');
    tb.put_char(10); // newline
    tb.put_char(b'B');
    assert_eq!(tb.get_line(0), b"A");
    assert_eq!(tb.get_line(1), b"B");
    assert_eq!(tb.cursor_x(), 1);
    assert_eq!(tb.cursor_y(), 1);
    assert_eq!(tb.line_count(), 2);
}

#[test]
fn text_buffer_carriage_return() {
    let mut tb = TextBuffer::new();
    tb.put_char(b'A');
    tb.put_char(b'B');
    tb.put_char(13); // CR
    assert_eq!(tb.cursor_x(), 0);
    tb.put_char(b'X');
    assert_eq!(tb.get_line(0), b"XB");
}

#[test]
fn text_buffer_backspace() {
    let mut tb = TextBuffer::new();
    tb.put_char(b'A');
    tb.put_char(b'B');
    tb.put_char(8); // backspace
    assert_eq!(tb.cursor_x(), 1);
    assert_eq!(tb.get_line(0), b"A");
}

#[test]
fn text_buffer_auto_wrap() {
    let mut tb = TextBuffer::new();
    // Write 51 chars (TERM_COLS) to trigger wrap
    for i in 0..51 {
        tb.put_char(b'0' + (i % 10) as u8);
    }
    assert_eq!(tb.cursor_x(), 0); // wrapped to start of new line
    assert_eq!(tb.cursor_y(), 1); // on line 1 now
    assert_eq!(tb.line_count(), 2);
    assert_eq!(tb.get_line(0).len(), 51);
}

#[test]
fn text_buffer_clear() {
    let mut tb = TextBuffer::new();
    tb.put_char(b'H');
    tb.put_char(b'i');
    tb.put_char(10);
    tb.put_char(b'!');
    assert_eq!(tb.line_count(), 2);
    tb.clear();
    assert_eq!(tb.line_count(), 1);
    assert_eq!(tb.cursor_x(), 0);
    assert_eq!(tb.cursor_y(), 0);
    assert_eq!(tb.scroll(), 0);
    assert_eq!(tb.get_line(0), b"");
}

#[test]
fn text_buffer_auto_scroll() {
    let mut tb = TextBuffer::new();
    // Write 37 lines (TERM_ROWS + 1) to trigger scroll
    for i in 0..37 {
        tb.put_char(b'0' + (i % 10) as u8);
        tb.put_char(10); // newline
    }
    // After 37 lines, cursor is on line 37, scroll should be 1
    assert_eq!(tb.cursor_y(), 37);
    assert!(tb.scroll() > 0, "scroll should be > 0 after filling viewport");
}

#[test]
fn text_buffer_visible_lines() {
    let mut tb = TextBuffer::new();
    for i in 0..5 {
        tb.put_char(b'0' + i as u8);
        if i < 4 {
            tb.put_char(10);
        }
    }
    let visible = tb.visible_lines();
    assert_eq!(visible.len(), 5); // all 5 lines visible
    assert_eq!(visible[0], b"0");
    assert_eq!(visible[4], b"4");
}

#[test]
fn text_buffer_set_cursor() {
    let mut tb = TextBuffer::new();
    // Write some data
    for c in b"Hello World" {
        tb.put_char(*c);
    }
    tb.set_cursor_x(0);
    assert_eq!(tb.cursor_x(), 0);
    tb.set_cursor_y(0);
    assert_eq!(tb.cursor_y(), 0);
}

#[test]
fn text_buffer_char_at_cursor() {
    let mut tb = TextBuffer::new();
    tb.put_char(b'X');
    tb.put_char(b'Y');
    // Cursor at position 2, no char there
    assert_eq!(tb.char_at_cursor(), 0);
    // Move back and read
    tb.set_cursor_x(0);
    // char_at_cursor reads from current position
    assert_eq!(tb.char_at_cursor(), b'X');
}

// ── VM integration tests via STORE/LOAD ────────────────────────────

#[test]
fn terminal_write_char_via_register() {
    let mut vm = geometry_os::vm::Vm::new(1024);
    // Simulate STORE to TERM_CHAR register by directly calling put_char
    vm.term.put_char(b'H');
    assert_eq!(vm.term.get_line(0), b"H");
}

#[test]
fn terminal_write_string_via_program() {
    let source = r#"
        ; Write "Hi!" to terminal using STORE to TERM_CHAR register
        LDI r5, 0xFFD8      ; r5 = TERM_CHAR_ADDR
        LDI r0, 'H'
        STORE r5, r0
        LDI r0, 'i'
        STORE r5, r0
        LDI r0, '!'
        STORE r5, r0
        HALT
    "#;
    let vm = run_gasm(source);
    assert_eq!(vm.term.get_line(0), b"Hi!");
    assert_eq!(vm.term.cursor_x(), 3);
    assert_eq!(vm.term.cursor_y(), 0);
}

#[test]
fn terminal_newline_via_program() {
    let source = r#"
        LDI r5, 0xFFD8      ; TERM_CHAR_ADDR
        LDI r0, 'A'
        STORE r5, r0
        LDI r0, 10           ; newline
        STORE r5, r0
        LDI r0, 'B'
        STORE r5, r0
        HALT
    "#;
    let vm = run_gasm(source);
    assert_eq!(vm.term.get_line(0), b"A");
    assert_eq!(vm.term.get_line(1), b"B");
    assert_eq!(vm.term.line_count(), 2);
}

#[test]
fn terminal_read_cols_rows() {
    let source = r#"
        LDI r5, 0xFFDC       ; TERM_COLS_ADDR
        LOAD r0, r5           ; r0 = cols
        LDI r5, 0xFFDD        ; TERM_ROWS_ADDR
        LOAD r1, r5           ; r1 = rows
        HALT
    "#;
    let vm = run_gasm(source);
    assert_eq!(vm.regs[0], 51); // TERM_COLS
    assert_eq!(vm.regs[1], 36); // TERM_ROWS
}

#[test]
fn terminal_read_lines_count() {
    let source = r#"
        LDI r5, 0xFFD8       ; TERM_CHAR_ADDR
        LDI r0, 'X'
        STORE r5, r0
        LDI r0, 10            ; newline
        STORE r5, r0
        LDI r0, 'Y'
        STORE r5, r0
        ; Now read TERM_LINES
        LDI r5, 0xFFDE        ; TERM_LINES_ADDR
        LOAD r0, r5
        HALT
    "#;
    let vm = run_gasm(source);
    assert_eq!(vm.regs[0], 2); // 2 lines
}

#[test]
fn terminal_clear_via_program() {
    let source = r#"
        LDI r5, 0xFFD8       ; TERM_CHAR_ADDR
        LDI r0, 'H'
        STORE r5, r0
        LDI r0, 'i'
        STORE r5, r0
        ; Clear
        LDI r5, 0xFFDF        ; TERM_CLEAR_ADDR
        LDI r0, 1
        STORE r5, r0
        ; Read lines count (should be 1 after clear)
        LDI r5, 0xFFDE        ; TERM_LINES_ADDR
        LOAD r0, r5
        HALT
    "#;
    let vm = run_gasm(source);
    assert_eq!(vm.regs[0], 1); // reset to 1 line
    assert_eq!(vm.term.cursor_x(), 0);
    assert_eq!(vm.term.cursor_y(), 0);
}

#[test]
fn terminal_write_multi_line_scroll() {
    let source = r#"
        ; Write 40 lines to test scrolling
        LDI r5, 0xFFD8       ; TERM_CHAR_ADDR
        LDI r4, 0xFFDE       ; TERM_LINES_ADDR (for line count)
        LDI r6, 0             ; counter
        LDI r7, 40            ; target
    loop:
        ; Write line number as digit
        LDI r0, 48            ; '0'
        ADD r0, r6
        STORE r5, r0
        ; Newline
        LDI r0, 10
        STORE r5, r0
        ; Increment counter
        LDI r0, 1
        ADD r6, r0
        ; Loop while counter != target
        BNE r6, r7, loop
        ; Read line count
        LOAD r0, r4
        HALT
    "#;
    let vm = run_gasm(source);
    assert_eq!(vm.regs[0], 41); // 40 digit lines + 1 empty from last newline
    assert!(vm.term.scroll() > 0, "should have scrolled");
}

#[test]
fn terminal_cursor_position_read() {
    let source = r#"
        LDI r5, 0xFFD8       ; TERM_CHAR_ADDR
        LDI r0, 'A'
        STORE r5, r0
        LDI r0, 'B'
        STORE r5, r0
        LDI r0, 'C'
        STORE r5, r0
        ; Read cursor X
        LDI r5, 0xFFD9       ; TERM_CURSOR_X_ADDR
        LOAD r0, r5
        ; Read cursor Y
        LDI r5, 0xFFDA       ; TERM_CURSOR_Y_ADDR
        LOAD r1, r5
        HALT
    "#;
    let vm = run_gasm(source);
    assert_eq!(vm.regs[0], 3); // cursor at col 3
    assert_eq!(vm.regs[1], 0); // cursor on line 0
}
