// ═══════════════════════════════════════════════════════════════════════
// MATH LIBRARY TESTS: lib/math.gasm routines
//
// Tests for software-implemented multiply, divide, and modulo
// using only ADD/SUB/BRANCH (no native MUL/DIV/MOD opcodes).
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Helper: read the math.gasm source and prepend a caller.
/// The caller loads args, calls the routine, and halts.
fn make_math_test(caller: &str) -> String {
    // Read the math library source
    let math_src = include_str!("../lib/math.gasm");

    // Strip the leading comment block (everything before first label)
    // Find the first label line
    let mut lib_start = 0;
    for line in math_src.lines() {
        let trimmed = line.trim();
        if trimmed.is_empty() || trimmed.starts_with(';') {
            lib_start += line.len() + 1; // +1 for newline
        } else {
            break;
        }
    }
    let lib_body = &math_src[lib_start..];

    format!("{}\n{}", caller, lib_body)
}

// ── MULTIPLY TESTS ─────────────────────────────────────────────────────

#[test]
fn math_multiply_3_times_4() {
    let src = make_math_test(
        "\
        LDI r0, 3\n\
        LDI r1, 4\n\
        CALL multiply\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 12, "3 * 4 should be 12");
}

#[test]
fn math_multiply_0_times_5() {
    let src = make_math_test(
        "\
        LDI r0, 0\n\
        LDI r1, 5\n\
        CALL multiply\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "0 * 5 should be 0");
}

#[test]
fn math_multiply_7_times_1() {
    let src = make_math_test(
        "\
        LDI r0, 7\n\
        LDI r1, 1\n\
        CALL multiply\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 7, "7 * 1 should be 7");
}

#[test]
fn math_multiply_5_times_0() {
    let src = make_math_test(
        "\
        LDI r0, 5\n\
        LDI r1, 0\n\
        CALL multiply\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "5 * 0 should be 0");
}

#[test]
fn math_multiply_6_times_6() {
    let src = make_math_test(
        "\
        LDI r0, 6\n\
        LDI r1, 6\n\
        CALL multiply\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 36, "6 * 6 should be 36");
}

// ── DIVIDE TESTS ───────────────────────────────────────────────────────

#[test]
fn math_divide_12_by_4() {
    let src = make_math_test(
        "\
        LDI r0, 12\n\
        LDI r1, 4\n\
        CALL divide\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 3, "12 / 4 should be 3");
}

#[test]
fn math_divide_10_by_3() {
    let src = make_math_test(
        "\
        LDI r0, 10\n\
        LDI r1, 3\n\
        CALL divide\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 3, "10 / 3 should be 3 (truncated)");
}

#[test]
fn math_divide_by_zero() {
    let src = make_math_test(
        "\
        LDI r0, 42\n\
        LDI r1, 0\n\
        CALL divide\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "x / 0 should return 0");
}

#[test]
fn math_divide_0_by_5() {
    let src = make_math_test(
        "\
        LDI r0, 0\n\
        LDI r1, 5\n\
        CALL divide\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "0 / 5 should be 0");
}

#[test]
fn math_divide_7_by_7() {
    let src = make_math_test(
        "\
        LDI r0, 7\n\
        LDI r1, 7\n\
        CALL divide\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1, "7 / 7 should be 1");
}

// ── MODULO TESTS ───────────────────────────────────────────────────────

#[test]
fn math_modulo_10_by_3() {
    let src = make_math_test(
        "\
        LDI r0, 10\n\
        LDI r1, 3\n\
        CALL modulo\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1, "10 % 3 should be 1");
}

#[test]
fn math_modulo_12_by_4() {
    let src = make_math_test(
        "\
        LDI r0, 12\n\
        LDI r1, 4\n\
        CALL modulo\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "12 % 4 should be 0");
}

#[test]
fn math_modulo_by_zero() {
    let src = make_math_test(
        "\
        LDI r0, 42\n\
        LDI r1, 0\n\
        CALL modulo\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "x % 0 should return 0");
}

#[test]
fn math_modulo_0_by_5() {
    let src = make_math_test(
        "\
        LDI r0, 0\n\
        LDI r1, 5\n\
        CALL modulo\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "0 % 5 should be 0");
}

#[test]
fn math_modulo_7_by_7() {
    let src = make_math_test(
        "\
        LDI r0, 7\n\
        LDI r1, 7\n\
        CALL modulo\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 0, "7 % 7 should be 0");
}

#[test]
fn math_modulo_17_by_5() {
    let src = make_math_test(
        "\
        LDI r0, 17\n\
        LDI r1, 5\n\
        CALL modulo\n\
        HALT\n",
    );
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 2, "17 % 5 should be 2");
}
