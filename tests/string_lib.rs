// ═══════════════════════════════════════════════════════════════════════
// STRING LIBRARY TESTS: lib/string.gasm routines
//
// Tests for strlen, strcpy, strcmp, and print_string.
// Strings are stored one char per RAM word, null-terminated.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Helper: read the string.gasm source and prepend a caller.
/// The caller loads args, calls the routine, and halts.
fn make_string_test(caller: &str) -> String {
    let string_src = include_str!("../lib/string.gasm");

    // Strip the leading comment block (everything before first label)
    let mut lib_start = 0;
    for line in string_src.lines() {
        let trimmed = line.trim();
        if trimmed.is_empty() || trimmed.starts_with(';') {
            lib_start += line.len() + 1; // +1 for newline
        } else {
            break;
        }
    }
    let lib_body = &string_src[lib_start..];

    format!("{}\n{}", caller, lib_body)
}

/// Helper: store a null-terminated string into VM RAM starting at `addr`.
/// Each character becomes one u32 word. Null terminator is appended.
fn store_string(vm: &mut Vm, addr: usize, s: &str) {
    for (i, ch) in s.chars().enumerate() {
        vm.ram[addr + i] = ch as u32;
    }
    vm.ram[addr + s.len()] = 0; // null terminator at correct offset
}

/// Helper: read a null-terminated string from VM RAM starting at `addr`.
fn read_string(vm: &Vm, addr: usize) -> String {
    let mut result = String::new();
    let mut pos = addr;
    loop {
        let ch = vm.ram[pos];
        if ch == 0 {
            break;
        }
        result.push((ch & 0xFF) as u8 as char);
        pos += 1;
    }
    result
}

// ── STRLEN TESTS ──────────────────────────────────────────────────────

#[test]
fn string_strlen_hello() {
    // strlen("Hello") = 5
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        CALL strlen\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 200, "Hello");
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 5, "strlen(\"Hello\") should be 5");
}

#[test]
fn string_strlen_empty() {
    // strlen("") = 0 (null terminator at address 200)
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        CALL strlen\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.ram[200] = 0; // empty string = just null terminator
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "strlen(\"\") should be 0");
}

#[test]
fn string_strlen_single_char() {
    // strlen("A") = 1
    let src = make_string_test(
        "\
        LDI r0, 300\n\
        CALL strlen\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 300, "A");
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1, "strlen(\"A\") should be 1");
}

#[test]
fn string_strlen_longer() {
    // strlen("Geometry OS") = 10
    let src = make_string_test(
        "\
        LDI r0, 250\n\
        CALL strlen\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 250, "Geometry OS");
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 11, "strlen(\"Geometry OS\") should be 11");
}

// ── STRCPY TESTS ──────────────────────────────────────────────────────

#[test]
fn string_strcpy_hello() {
    // Copy "Hello" from addr 200 to addr 300
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 300\n\
        CALL strcpy\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 200, "Hello");
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 300, "strcpy should return destination address");
    assert_eq!(
        read_string(&vm, 300),
        "Hello",
        "destination should contain \"Hello\""
    );
}

#[test]
fn string_strcpy_empty() {
    // Copy empty string
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 400\n\
        CALL strcpy\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.ram[200] = 0; // empty source
    vm.run();

    assert!(vm.halted);
    assert_eq!(read_string(&vm, 400), "", "destination should be empty");
}

#[test]
fn string_strcpy_preserves_source() {
    // Verify source string is not modified by strcpy
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 300\n\
        CALL strcpy\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 200, "Test");
    vm.run();

    assert!(vm.halted);
    assert_eq!(read_string(&vm, 200), "Test", "source should be preserved");
    assert_eq!(
        read_string(&vm, 300),
        "Test",
        "destination should match source"
    );
}

// ── STRCMP TESTS ──────────────────────────────────────────────────────

#[test]
fn string_strcmp_equal() {
    // strcmp("Hello", "Hello") = 0
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 250\n\
        CALL strcmp\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 200, "Hello");
    store_string(&mut vm, 250, "Hello");
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "strcmp(\"Hello\", \"Hello\") should be 0");
}

#[test]
fn string_strcmp_less() {
    // strcmp("Apple", "Banana") = -1 (A < B)
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 250\n\
        CALL strcmp\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 200, "Apple");
    store_string(&mut vm, 250, "Banana");
    vm.run();

    assert!(vm.halted);
    // -1 in u32 is 0xFFFFFFFF
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "strcmp(\"Apple\", \"Banana\") should be -1 (0xFFFFFFFF)"
    );
}

#[test]
fn string_strcmp_greater() {
    // strcmp("Banana", "Apple") = 1 (B > A)
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 250\n\
        CALL strcmp\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 200, "Banana");
    store_string(&mut vm, 250, "Apple");
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1, "strcmp(\"Banana\", \"Apple\") should be 1");
}

#[test]
fn string_strcmp_empty_vs_nonempty() {
    // strcmp("", "A") = -1 (empty < non-empty)
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 250\n\
        CALL strcmp\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.ram[200] = 0; // empty string
    store_string(&mut vm, 250, "A");
    vm.run();

    assert!(vm.halted);
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "strcmp(\"\", \"A\") should be -1 (0xFFFFFFFF)"
    );
}

#[test]
fn string_strcmp_both_empty() {
    // strcmp("", "") = 0
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 250\n\
        CALL strcmp\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.ram[200] = 0;
    vm.ram[250] = 0;
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "strcmp(\"\", \"\") should be 0");
}

#[test]
fn string_strcmp_prefix() {
    // strcmp("Hell", "Hello") = -1 (shorter string is "less")
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 250\n\
        CALL strcmp\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 200, "Hell");
    store_string(&mut vm, 250, "Hello");
    vm.run();

    assert!(vm.halted);
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "strcmp(\"Hell\", \"Hello\") should be -1"
    );
}

// ── PRINT_STRING TESTS ───────────────────────────────────────────────
// print_string uses TEXT opcode to render on screen. We verify it
// doesn't crash and returns the correct length.

#[test]
fn string_print_hello_returns_length() {
    // print_string(str="Hello", x=5, y=10, color=0xFFFFFF) -> length=5
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 5\n\
        LDI r2, 10\n\
        LDI r3, 0xFFFFFF\n\
        CALL print_string\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    store_string(&mut vm, 200, "Hello");
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 5, "print_string(\"Hello\") should return 5");
}

#[test]
fn string_print_empty_returns_zero() {
    // print_string(str="", x=0, y=0, color=0xFFFFFF) -> length=0
    let src = make_string_test(
        "\
        LDI r0, 200\n\
        LDI r1, 0\n\
        LDI r2, 0\n\
        LDI r3, 0xFFFFFF\n\
        CALL print_string\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.ram[200] = 0; // empty string
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "print_string(\"\") should return 0");
}
