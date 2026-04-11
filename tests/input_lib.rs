// ═══════════════════════════════════════════════════════════════════════
// INPUT LIBRARY TESTS: lib/input.gasm routines
//
// Tests for read_key, wait_key, and key_to_hex routines that
// interact with the memory-mapped keyboard port at RAM[0xFFF].
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Helper: read the input.gasm source and prepend a caller.
/// The caller loads args, calls the routine, and halts.
fn make_input_test(caller: &str) -> String {
    let input_src = include_str!("../lib/input.gasm");

    // Strip the leading comment block (everything before first label)
    let mut lib_start = 0;
    for line in input_src.lines() {
        let trimmed = line.trim();
        if trimmed.is_empty() || trimmed.starts_with(';') {
            lib_start += line.len() + 1;
        } else {
            break;
        }
    }
    let lib_body = &input_src[lib_start..];

    format!("{}\n{}", caller, lib_body)
}

// ── READ_KEY TESTS ────────────────────────────────────────────────────

#[test]
fn input_read_key_no_key_pending() {
    let src = make_input_test(
        "\
        CALL read_key\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    // RAM[0xFFF] defaults to 0 -- no key pending
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "read_key should return 0 when no key pending");
    // Port should still be 0 (no ack needed since there was nothing)
    assert_eq!(vm.ram[0xFFF], 0, "key port should still be 0");
}

#[test]
fn input_read_key_with_keypress() {
    let src = make_input_test(
        "\
        CALL read_key\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    // Simulate 'A' key pressed
    vm.ram[0xFFF] = 0x41;
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0x41, "read_key should return the keycode 'A'");
    // Port should be cleared (acknowledged)
    assert_eq!(vm.ram[0xFFF], 0, "key port should be cleared after read");
}

#[test]
fn input_read_key_digits() {
    let src = make_input_test(
        "\
        CALL read_key\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    // Simulate '5' key
    vm.ram[0xFFF] = 0x35;
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0x35, "read_key should return '5' keycode");
    assert_eq!(vm.ram[0xFFF], 0, "key port should be cleared");
}

#[test]
fn input_read_key_enter() {
    let src = make_input_test(
        "\
        CALL read_key\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    // Enter key
    vm.ram[0xFFF] = 0x0D;
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0x0D, "read_key should return Enter keycode");
    assert_eq!(vm.ram[0xFFF], 0, "key port should be cleared");
}

#[test]
fn input_read_two_keys_sequential() {
    // Read one key, ack it, then read another
    let src = make_input_test(
        "\
        CALL read_key\n\
        MOV r10, r0\n\
        CALL read_key\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    // Pre-load two keypresses -- but our port only holds one key at a time
    // The test simulates: first key 'A' is available, after ack we put 'B'
    vm.ram[0xFFF] = 0x41;
    // We can't easily inject a second key mid-execution in this harness,
    // so just test that first read works and second returns 0
    vm.run();

    assert!(vm.halted);
    // First key was 'A', second key was nothing (port cleared by first read)
    assert_eq!(vm.regs[10], 0x41, "first read_key should return 'A'");
    assert_eq!(vm.regs[0], 0, "second read_key should return 0 (no key)");
}

// ── WAIT_KEY TESTS ────────────────────────────────────────────────────

#[test]
fn input_wait_key_with_key_ready() {
    let src = make_input_test(
        "\
        CALL wait_key\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    // Key already available
    vm.ram[0xFFF] = 0x42; // 'B'
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0x42, "wait_key should return 'B' keycode");
    assert_eq!(vm.ram[0xFFF], 0, "key port should be cleared");
}

#[test]
fn input_wait_key_no_key_times_out() {
    // wait_key with no key available would spin forever.
    // Run() has a 4096 cycle limit, so it should time out without halting.
    let src = make_input_test(
        "\
        CALL wait_key\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    // No key in port -- run() exhausts its cycle limit
    vm.run();

    assert!(!vm.halted, "wait_key should still be spinning with no key (hit cycle limit)");
}

// ── KEY_TO_HEX TESTS ──────────────────────────────────────────────────

#[test]
fn input_key_to_hex_zero() {
    let src = make_input_test(
        "\
        LDI r0, 0x00\n\
        LDI r1, 0x300\n\
        CALL key_to_hex\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.ram[0x300], 0x30, "high nibble of 0x00 should be '0' (0x30)");
    assert_eq!(vm.ram[0x301], 0x30, "low nibble of 0x00 should be '0' (0x30)");
    assert_eq!(vm.regs[0], 0x302, "should return pointer past end");
}

#[test]
fn input_key_to_hex_ff() {
    let src = make_input_test(
        "\
        LDI r0, 0xFF\n\
        LDI r1, 0x300\n\
        CALL key_to_hex\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.ram[0x300], 0x46, "high nibble of 0xFF should be 'F' (0x46)");
    assert_eq!(vm.ram[0x301], 0x46, "low nibble of 0xFF should be 'F' (0x46)");
}

#[test]
fn input_key_to_hex_41() {
    // 0x41 = 'A' -- high nibble 4, low nibble 1
    let src = make_input_test(
        "\
        LDI r0, 0x41\n\
        LDI r1, 0x300\n\
        CALL key_to_hex\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.ram[0x300], 0x34, "high nibble of 0x41 should be '4' (0x34)");
    assert_eq!(vm.ram[0x301], 0x31, "low nibble of 0x41 should be '1' (0x31)");
}

#[test]
fn input_key_to_hex_ab() {
    // 0xAB -- high nibble A, low nibble B
    let src = make_input_test(
        "\
        LDI r0, 0xAB\n\
        LDI r1, 0x300\n\
        CALL key_to_hex\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.ram[0x300], 0x41, "high nibble of 0xAB should be 'A' (0x41)");
    assert_eq!(vm.ram[0x301], 0x42, "low nibble of 0xAB should be 'B' (0x42)");
}

#[test]
fn input_key_to_hex_0d() {
    // 0x0D = Enter -- high nibble 0, low nibble D
    let src = make_input_test(
        "\
        LDI r0, 0x0D\n\
        LDI r1, 0x300\n\
        CALL key_to_hex\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.ram[0x300], 0x30, "high nibble of 0x0D should be '0' (0x30)");
    assert_eq!(vm.ram[0x301], 0x44, "low nibble of 0x0D should be 'D' (0x44)");
}

#[test]
fn input_key_to_hex_preserves_original_pointer() {
    // key_to_hex should return r1+2 in r0 but preserve original r1
    let src = make_input_test(
        "\
        LDI r0, 0x42\n\
        LDI r1, 0x300\n\
        CALL key_to_hex\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0x302, "should return pointer past end (0x302)");
    // r1 should be preserved via PUSH/POP
    assert_eq!(vm.regs[1], 0x300, "r1 should be preserved (original value)");
}

// ── NIBBLE_TO_ASCII INTERNAL TESTS (via key_to_hex) ───────────────────

#[test]
fn input_nibble_boundary_9() {
    // 0x09 -- both nibbles are digits (0 and 9)
    let src = make_input_test(
        "\
        LDI r0, 0x09\n\
        LDI r1, 0x300\n\
        CALL key_to_hex\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.ram[0x300], 0x30, "high nibble of 0x09 should be '0'");
    assert_eq!(vm.ram[0x301], 0x39, "low nibble of 0x09 should be '9'");
}

#[test]
fn input_nibble_boundary_0a() {
    // 0x0A -- high digit, low alpha (boundary at 10)
    let src = make_input_test(
        "\
        LDI r0, 0x0A\n\
        LDI r1, 0x300\n\
        CALL key_to_hex\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.ram[0x300], 0x30, "high nibble of 0x0A should be '0'");
    assert_eq!(vm.ram[0x301], 0x41, "low nibble of 0x0A should be 'A'");
}
