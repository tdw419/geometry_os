// ═══════════════════════════════════════════════════════════════════════
// COUNTER DEMO TESTS: Counter that increments and displays on screen
//
// Tests the counter_demo program and its uint_to_str routine.
// Verifies number-to-string conversion, counter increment logic,
// and screen rendering via TEXT opcode.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Helper: assemble and run source, return the VM.
fn run_src(src: &str) -> Vm {
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();
    vm
}

/// Helper: read a null-terminated string from VM RAM.
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

/// Helper: check if any screen pixels are non-zero (text was rendered).
fn screen_has_content(vm: &Vm) -> bool {
    vm.screen.iter().any(|&p| p != 0)
}

/// Helper: count non-zero pixels on screen.
fn screen_pixel_count(vm: &Vm) -> usize {
    vm.screen.iter().filter(|&&p| p != 0).count()
}

// ── UINT_TO_STR TESTS ───────────────────────────────────────────────

#[test]
fn counter_uint_to_str_zero() {
    // uint_to_str(0) should write "0" at DIGIT_BUF+10
    let src = "\
        LDI r0, 0\n\
        CALL uint_to_str\n\
        HALT\n\
\n\
uint_to_str:\n\
    LDI r1, 10\n\
    LDI r2, 0\n\
    LDI r3, 48\n\
    LDI r4, 4112\n\
    LDI r5, 10\n\
    ADD r4, r5\n\
    LDI r5, 1\n\
    LDI r8, 0\n\
    BNE r0, r2, uint_to_str_positive\n\
    LDI r6, 48\n\
    STORE r4, r6\n\
    LDI r6, 0\n\
    LDI r7, 1\n\
    ADD r7, r4\n\
    STORE r7, r6\n\
    MOV r8, r4\n\
    RET\n\
\n\
uint_to_str_positive:\n\
    PUSH r4\n\
\n\
uint_to_str_loop:\n\
    BEQ r0, r2, uint_to_str_done\n\
    MOV r6, r0\n\
    MOD r0, r1\n\
    ADD r0, r3\n\
    SUB r4, r5\n\
    STORE r4, r0\n\
    MOV r0, r6\n\
    DIV r0, r1\n\
    JMP uint_to_str_loop\n\
\n\
uint_to_str_done:\n\
    POP r6\n\
    LDI r7, 0\n\
    STORE r6, r7\n\
    MOV r8, r4\n\
    RET\n\
";
    let vm = run_src(src);
    assert!(vm.halted);
    // r8 should point to DIGIT_BUF+10 = 4122 where "0" was written
    assert_eq!(vm.regs[8], 4122, "r8 should point to digit buffer position");
    // The string at r8 should be "0"
    let s = read_string(&vm, vm.regs[8] as usize);
    assert_eq!(s, "0", "uint_to_str(0) should produce \"0\"");
}

#[test]
fn counter_uint_to_str_single_digit() {
    // uint_to_str(7) should produce "7"
    let src = "\
        LDI r0, 7\n\
        CALL uint_to_str\n\
        HALT\n\
\n\
uint_to_str:\n\
    LDI r1, 10\n\
    LDI r2, 0\n\
    LDI r3, 48\n\
    LDI r4, 4112\n\
    LDI r5, 10\n\
    ADD r4, r5\n\
    LDI r5, 1\n\
    LDI r8, 0\n\
    BNE r0, r2, uint_to_str_positive\n\
    LDI r6, 48\n\
    STORE r4, r6\n\
    LDI r6, 0\n\
    LDI r7, 1\n\
    ADD r7, r4\n\
    STORE r7, r6\n\
    MOV r8, r4\n\
    RET\n\
\n\
uint_to_str_positive:\n\
    PUSH r4\n\
\n\
uint_to_str_loop:\n\
    BEQ r0, r2, uint_to_str_done\n\
    MOV r6, r0\n\
    MOD r0, r1\n\
    ADD r0, r3\n\
    SUB r4, r5\n\
    STORE r4, r0\n\
    MOV r0, r6\n\
    DIV r0, r1\n\
    JMP uint_to_str_loop\n\
\n\
uint_to_str_done:\n\
    POP r6\n\
    LDI r7, 0\n\
    STORE r6, r7\n\
    MOV r8, r4\n\
    RET\n\
";
    let vm = run_src(src);
    assert!(vm.halted);
    let s = read_string(&vm, vm.regs[8] as usize);
    assert_eq!(s, "7", "uint_to_str(7) should produce \"7\"");
}

#[test]
fn counter_uint_to_str_two_digits() {
    // uint_to_str(42) should produce "42"
    let src = "\
        LDI r0, 42\n\
        CALL uint_to_str\n\
        HALT\n\
\n\
uint_to_str:\n\
    LDI r1, 10\n\
    LDI r2, 0\n\
    LDI r3, 48\n\
    LDI r4, 4112\n\
    LDI r5, 10\n\
    ADD r4, r5\n\
    LDI r5, 1\n\
    LDI r8, 0\n\
    BNE r0, r2, uint_to_str_positive\n\
    LDI r6, 48\n\
    STORE r4, r6\n\
    LDI r6, 0\n\
    LDI r7, 1\n\
    ADD r7, r4\n\
    STORE r7, r6\n\
    MOV r8, r4\n\
    RET\n\
\n\
uint_to_str_positive:\n\
    PUSH r4\n\
\n\
uint_to_str_loop:\n\
    BEQ r0, r2, uint_to_str_done\n\
    MOV r6, r0\n\
    MOD r0, r1\n\
    ADD r0, r3\n\
    SUB r4, r5\n\
    STORE r4, r0\n\
    MOV r0, r6\n\
    DIV r0, r1\n\
    JMP uint_to_str_loop\n\
\n\
uint_to_str_done:\n\
    POP r6\n\
    LDI r7, 0\n\
    STORE r6, r7\n\
    MOV r8, r4\n\
    RET\n\
";
    let vm = run_src(src);
    assert!(vm.halted);
    let s = read_string(&vm, vm.regs[8] as usize);
    assert_eq!(s, "42", "uint_to_str(42) should produce \"42\"");
}

#[test]
fn counter_uint_to_str_three_digits() {
    // uint_to_str(255) should produce "255"
    let src = "\
        LDI r0, 255\n\
        CALL uint_to_str\n\
        HALT\n\
\n\
uint_to_str:\n\
    LDI r1, 10\n\
    LDI r2, 0\n\
    LDI r3, 48\n\
    LDI r4, 4112\n\
    LDI r5, 10\n\
    ADD r4, r5\n\
    LDI r5, 1\n\
    LDI r8, 0\n\
    BNE r0, r2, uint_to_str_positive\n\
    LDI r6, 48\n\
    STORE r4, r6\n\
    LDI r6, 0\n\
    LDI r7, 1\n\
    ADD r7, r4\n\
    STORE r7, r6\n\
    MOV r8, r4\n\
    RET\n\
\n\
uint_to_str_positive:\n\
    PUSH r4\n\
\n\
uint_to_str_loop:\n\
    BEQ r0, r2, uint_to_str_done\n\
    MOV r6, r0\n\
    MOD r0, r1\n\
    ADD r0, r3\n\
    SUB r4, r5\n\
    STORE r4, r0\n\
    MOV r0, r6\n\
    DIV r0, r1\n\
    JMP uint_to_str_loop\n\
\n\
uint_to_str_done:\n\
    POP r6\n\
    LDI r7, 0\n\
    STORE r6, r7\n\
    MOV r8, r4\n\
    RET\n\
";
    let vm = run_src(src);
    assert!(vm.halted);
    let s = read_string(&vm, vm.regs[8] as usize);
    assert_eq!(s, "255", "uint_to_str(255) should produce \"255\"");
}

// ── COUNTER LOOP TESTS ──────────────────────────────────────────────

#[test]
fn counter_counts_to_five() {
    // Simplified counter: count 0 to 5, verify r0 = 5 at halt
    let src = "\
        LDI r0, 0\n\
        LDI r1, 1\n\
        LDI r2, 5\n\
    loop:\n\
        ADD r0, r1\n\
        BGE r0, r2, done\n\
        JMP loop\n\
    done:\n\
        HALT\n\
";
    let vm = run_src(src);
    assert!(vm.halted);
    assert_eq!(vm.regs[0], 5, "counter should reach 5");
}

#[test]
fn counter_displays_text_on_screen() {
    // Full counter demo: count to 3, verify screen has rendered content
    // Uses uint_to_str + TEXT to display each number
    let uint_to_str = "\
uint_to_str:\n\
    LDI r1, 10\n\
    LDI r2, 0\n\
    LDI r3, 48\n\
    LDI r4, 4112\n\
    LDI r5, 10\n\
    ADD r4, r5\n\
    LDI r5, 1\n\
    LDI r8, 0\n\
    BNE r0, r2, uts_positive\n\
    LDI r6, 48\n\
    STORE r4, r6\n\
    LDI r6, 0\n\
    LDI r7, 1\n\
    ADD r7, r4\n\
    STORE r7, r6\n\
    MOV r8, r4\n\
    RET\n\
\n\
uts_positive:\n\
    PUSH r4\n\
\n\
uts_loop:\n\
    BEQ r0, r2, uts_done\n\
    MOV r6, r0\n\
    MOD r0, r1\n\
    ADD r0, r3\n\
    SUB r4, r5\n\
    STORE r4, r0\n\
    MOV r0, r6\n\
    DIV r0, r1\n\
    JMP uts_loop\n\
\n\
uts_done:\n\
    POP r6\n\
    LDI r7, 0\n\
    STORE r6, r7\n\
    MOV r8, r4\n\
    RET\n\
";

    // Count to 3, display final value (3) on screen
    let src = format!(
        "\
        LDI r0, 0\n\
        LDI r1, 1\n\
        LDI r2, 3\n\
        LDI r3, 0\n\
    loop:\n\
        ADD r0, r1\n\
        BGE r0, r2, display\n\
        JMP loop\n\
    display:\n\
        CALL uint_to_str\n\
        LDI r0, 0xFFFFFF\n\
        LDI r1, 10\n\
        LDI r2, 10\n\
        MOV r3, r8\n\
        TEXT r1, r2, r3\n\
        HALT\n\
\n\
{uint_to_str}"
    );
    let vm = run_src(&src);
    assert!(vm.halted);
    // Screen should have rendered content (the digit "3")
    assert!(
        screen_has_content(&vm),
        "screen should have rendered digits"
    );
    // Verify the digit string was created correctly
    let s = read_string(&vm, vm.regs[8] as usize);
    assert_eq!(s, "3", "final counter value string should be \"3\"");
}

#[test]
fn counter_full_demo_to_ten() {
    // Full counter demo: count 0 to 10, verify final display shows "10"
    let uint_to_str = "\
uint_to_str:\n\
    LDI r1, 10\n\
    LDI r2, 0\n\
    LDI r3, 48\n\
    LDI r4, 4112\n\
    LDI r5, 10\n\
    ADD r4, r5\n\
    LDI r5, 1\n\
    LDI r8, 0\n\
    BNE r0, r2, uts_positive\n\
    LDI r6, 48\n\
    STORE r4, r6\n\
    LDI r6, 0\n\
    LDI r7, 1\n\
    ADD r7, r4\n\
    STORE r7, r6\n\
    MOV r8, r4\n\
    RET\n\
\n\
uts_positive:\n\
    PUSH r4\n\
\n\
uts_loop:\n\
    BEQ r0, r2, uts_done\n\
    MOV r6, r0\n\
    MOD r0, r1\n\
    ADD r0, r3\n\
    SUB r4, r5\n\
    STORE r4, r0\n\
    MOV r0, r6\n\
    DIV r0, r1\n\
    JMP uts_loop\n\
\n\
uts_done:\n\
    POP r6\n\
    LDI r7, 0\n\
    STORE r6, r7\n\
    MOV r8, r4\n\
    RET\n\
";

    let src = format!(
        "\
        LDI r0, 0\n\
        LDI r1, 1\n\
        LDI r2, 10\n\
        LDI r3, 0\n\
    loop:\n\
        ADD r0, r1\n\
        BGE r0, r2, display\n\
        JMP loop\n\
    display:\n\
        CALL uint_to_str\n\
        LDI r0, 0xFFFFFF\n\
        LDI r1, 10\n\
        LDI r2, 10\n\
        MOV r3, r8\n\
        TEXT r1, r2, r3\n\
        HALT\n\
\n\
{uint_to_str}"
    );
    let vm = run_src(&src);
    assert!(vm.halted);
    let s = read_string(&vm, vm.regs[8] as usize);
    assert_eq!(s, "10", "final counter value should be \"10\"");
    assert!(
        screen_has_content(&vm),
        "screen should have rendered \"10\""
    );
}

#[test]
fn counter_uint_to_str_ninety_nine() {
    // uint_to_str(99) should produce "99" -- the max count for the demo
    let src = "\
        LDI r0, 99\n\
        CALL uint_to_str\n\
        HALT\n\
\n\
uint_to_str:\n\
    LDI r1, 10\n\
    LDI r2, 0\n\
    LDI r3, 48\n\
    LDI r4, 4112\n\
    LDI r5, 10\n\
    ADD r4, r5\n\
    LDI r5, 1\n\
    LDI r8, 0\n\
    BNE r0, r2, uint_to_str_positive\n\
    LDI r6, 48\n\
    STORE r4, r6\n\
    LDI r6, 0\n\
    LDI r7, 1\n\
    ADD r7, r4\n\
    STORE r7, r6\n\
    MOV r8, r4\n\
    RET\n\
\n\
uint_to_str_positive:\n\
    PUSH r4\n\
\n\
uint_to_str_loop:\n\
    BEQ r0, r2, uint_to_str_done\n\
    MOV r6, r0\n\
    MOD r0, r1\n\
    ADD r0, r3\n\
    SUB r4, r5\n\
    STORE r4, r0\n\
    MOV r0, r6\n\
    DIV r0, r1\n\
    JMP uint_to_str_loop\n\
\n\
uint_to_str_done:\n\
    POP r6\n\
    LDI r7, 0\n\
    STORE r6, r7\n\
    MOV r8, r4\n\
    RET\n\
";
    let vm = run_src(src);
    assert!(vm.halted);
    let s = read_string(&vm, vm.regs[8] as usize);
    assert_eq!(s, "99", "uint_to_str(99) should produce \"99\"");
}

#[test]
fn counter_screen_renders_pixels() {
    // Verify that the TEXT opcode actually writes pixels to the screen buffer.
    // We display "42" and check that specific screen locations have non-zero pixels.
    let uint_to_str = "\
uint_to_str:\n\
    LDI r1, 10\n\
    LDI r2, 0\n\
    LDI r3, 48\n\
    LDI r4, 4112\n\
    LDI r5, 10\n\
    ADD r4, r5\n\
    LDI r5, 1\n\
    LDI r8, 0\n\
    BNE r0, r2, uts_positive\n\
    LDI r6, 48\n\
    STORE r4, r6\n\
    LDI r6, 0\n\
    LDI r7, 1\n\
    ADD r7, r4\n\
    STORE r7, r6\n\
    MOV r8, r4\n\
    RET\n\
\n\
uts_positive:\n\
    PUSH r4\n\
\n\
uts_loop:\n\
    BEQ r0, r2, uts_done\n\
    MOV r6, r0\n\
    MOD r0, r1\n\
    ADD r0, r3\n\
    SUB r4, r5\n\
    STORE r4, r0\n\
    MOV r0, r6\n\
    DIV r0, r1\n\
    JMP uts_loop\n\
\n\
uts_done:\n\
    POP r6\n\
    LDI r7, 0\n\
    STORE r6, r7\n\
    MOV r8, r4\n\
    RET\n\
";

    let src = format!(
        "\
        LDI r0, 42\n\
        CALL uint_to_str\n\
        LDI r0, 0xFFFFFF\n\
        LDI r1, 20\n\
        LDI r2, 30\n\
        MOV r3, r8\n\
        TEXT r1, r2, r3\n\
        HALT\n\
\n\
{uint_to_str}"
    );
    let vm = run_src(&src);
    assert!(vm.halted);

    // The font renders 5x7 glyphs with 1px gap. "42" starts at x=20, y=30.
    // First glyph '4' at (20,30), second glyph '2' at (26,30).
    // There should be non-zero pixels in the screen buffer.
    let count = screen_pixel_count(&vm);
    assert!(count > 0, "screen should have rendered pixels for \"42\"");

    // Verify the string is correct
    let s = read_string(&vm, vm.regs[8] as usize);
    assert_eq!(s, "42");
}
