// tests/calculator.rs -- Tests for the calculator.gasm interactive program
//
// Verifies the calculator assembles, initializes, and processes
// keyboard input for +, -, * on small positive integers.

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Load and assemble the calculator program (with .include resolution).
fn assemble_calculator() -> assembler::Assembled {
    let path = std::path::Path::new("programs/calculator.gasm");
    assembler::assemble_file(path, &[]).expect("calculator should assemble")
}

/// Run the VM until it stops (halted, yielded, or max cycles).
/// Returns cycles executed.
fn run_vm(vm: &mut Vm) -> u32 {
    vm.run()
}

/// Inject a key into the keyboard port and run the VM to process it.
fn press_key(vm: &mut Vm, keycode: u32) -> u32 {
    vm.ram[0xFFF] = keycode;
    vm.run()
}

// ── ASSEMBLY TESTS ────────────────────────────────────────────────────

#[test]
fn calculator_assembles() {
    let asm = assemble_calculator();
    assert!(
        asm.pixels.len() > 100,
        "calculator should have substantial code, got {} pixels",
        asm.pixels.len()
    );
    assert!(asm.labels.contains_key("main"), "should have 'main' label");
    assert!(
        asm.labels.contains_key("calc_loop"),
        "should have 'calc_loop' label"
    );
    assert!(
        asm.labels.contains_key("do_compute"),
        "should have 'do_compute' label"
    );
}

// ── INITIALIZATION TESTS ─────────────────────────────────────────────

#[test]
fn calculator_debug_trace() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    // Init
    let c = vm.run();
    eprintln!("Init: cycles={}, halted={}, pc={}", c, vm.halted, vm.pc);

    // Press '6'
    vm.ram[0xFFF] = 0x36;
    vm.run();
    eprintln!("After '6': r4={}, r5={}, r6={:#x}, r10={}", vm.regs[4], vm.regs[5], vm.regs[6], vm.regs[10]);

    // Press '*'
    vm.ram[0xFFF] = 0x2A;
    vm.run();
    eprintln!("After '*': r4={}, r5={}, r6={:#x}, r10={}", vm.regs[4], vm.regs[5], vm.regs[6], vm.regs[10]);

    // Press '7'
    vm.ram[0xFFF] = 0x37;
    vm.run();
    eprintln!("After '7': r4={}, r5={}, r6={:#x}, r10={}", vm.regs[4], vm.regs[5], vm.regs[6], vm.regs[10]);

    // Now set up and trace the full Enter -> do_compute -> do_mul path
    let calc_loop_addr = *asm.labels.get("calc_loop").expect("calc_loop");
    let show_result_addr = *asm.labels.get("show_result").expect("show_result");
    eprintln!("calc_loop={}, show_result={}", calc_loop_addr, show_result_addr);
    
    // Print all labels to understand the layout
    let mut labels: Vec<_> = asm.labels.iter().collect();
    labels.sort_by_key(|&(_, &addr)| addr);
    for &(ref name, &addr) in &labels {
        eprintln!("  {} @ {}", name, addr);
    }
    
    // Inject Enter key
    vm.ram[0xFFF] = 0x0D;
    vm.pc = calc_loop_addr as u32;
    vm.halted = false;
    
    // Single step through the full compute path
    for i in 0..300 {
        let pc_before = vm.pc;
        let executed = vm.step();
        eprintln!("Step {}: pc={}->{} r4={} r5={} r6={:#x} r10={}", 
            i, pc_before, vm.pc, vm.regs[4], vm.regs[5], vm.regs[6], vm.regs[10]);
        if !executed || vm.halted {
            eprintln!("STOPPED: executed={}, halted={}", executed, vm.halted);
            break;
        }
        // Stop when we return to calc_loop after computation
        if i > 20 && vm.pc as usize == calc_loop_addr {
            eprintln!("Back at calc_loop, done");
            break;
        }
    }
}

#[test]
fn calculator_initializes_without_crash() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    // Run init -- it will draw prompt then enter polling loop
    let cycles = run_vm(&mut vm);
    assert!(cycles > 0, "should execute some cycles");
    assert!(!vm.halted, "calculator should not halt during init");
    // It polls in a tight loop, so it'll burn all 4096 cycles
}

// ── DIGIT INPUT TESTS ────────────────────────────────────────────────

#[test]
fn calculator_accepts_first_digit() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    // Initialize: run through init + first poll loop
    run_vm(&mut vm);
    assert!(!vm.halted);

    // Press '5' (0x35)
    press_key(&mut vm, 0x35);
    assert!(!vm.halted, "should not halt after digit input");

    // r4 should have accumulated: 5
    assert_eq!(
        vm.regs[4], 5,
        "first number should be 5 after pressing '5'"
    );

    // State (r10) should still be 0 (parsing first number)
    assert_eq!(
        vm.regs[10], 0,
        "state should be 0 (parsing first number)"
    );
}

#[test]
fn calculator_accumulates_multi_digit_number() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    // Initialize
    run_vm(&mut vm);

    // Press '2' (0x32)
    press_key(&mut vm, 0x32);
    assert_eq!(vm.regs[4], 2, "first digit '2' -> r4 = 2");

    // Press '3' (0x33) -> num = 2*10 + 3 = 23
    press_key(&mut vm, 0x33);
    assert_eq!(vm.regs[4], 23, "second digit '3' -> r4 = 23");
}

#[test]
fn calculator_ignores_non_digit_keys() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Press 'A' (0x41) -- not a digit, not an operator in state 0
    press_key(&mut vm, 0x41);
    assert_eq!(vm.regs[4], 0, "non-digit should be ignored");
    assert_eq!(vm.regs[10], 0, "state should remain 0");
}

// ── OPERATOR TESTS ───────────────────────────────────────────────────

#[test]
fn calculator_accepts_addition_operator() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Enter "12"
    press_key(&mut vm, 0x31); // '1'
    press_key(&mut vm, 0x32); // '2'
    assert_eq!(vm.regs[4], 12, "first number = 12");

    // Press '+' (0x2B)
    press_key(&mut vm, 0x2B);
    assert_eq!(vm.regs[6], 0x2B, "operator should be '+'");
    assert_eq!(vm.regs[10], 2, "state should be 2 (second number)");
}

// ── COMPUTATION TESTS ────────────────────────────────────────────────

/// Helper: read the result string from the output buffer at 0x0640.
/// Returns the decimal value of the null-terminated string, or None if empty.
fn read_result(vm: &Vm) -> Option<u32> {
    let base = 0x0640;
    let mut val: u32 = 0;
    let mut i = base;
    loop {
        let ch = vm.ram[i];
        if ch == 0 {
            break;
        }
        if ch >= 0x30 && ch <= 0x39 {
            val = val * 10 + (ch - 0x30);
        } else {
            return None; // unexpected char
        }
        i += 1;
    }
    if i == base {
        None
    } else {
        Some(val)
    }
}

#[test]
fn calculator_adds_two_numbers() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Enter "3" + "+" + "4" + Enter
    press_key(&mut vm, 0x33); // '3'
    press_key(&mut vm, 0x2B); // '+'
    press_key(&mut vm, 0x34); // '4'
    press_key(&mut vm, 0x0D); // Enter

    assert!(!vm.halted, "should not halt after compute");
    assert_eq!(read_result(&vm), Some(7), "3 + 4 should equal 7");
    assert_eq!(vm.regs[10], 3, "state should be 3 (result shown)");
}

#[test]
fn calculator_subtracts_two_numbers() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Enter "9" + "-" + "3" + Enter
    press_key(&mut vm, 0x39); // '9'
    press_key(&mut vm, 0x2D); // '-'
    press_key(&mut vm, 0x33); // '3'
    press_key(&mut vm, 0x0D); // Enter

    assert_eq!(read_result(&vm), Some(6), "9 - 3 should equal 6");
}

#[test]
fn calculator_multiplies_two_numbers() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Enter "6" + "*" + "7" + Enter
    press_key(&mut vm, 0x36); // '6'
    press_key(&mut vm, 0x2A); // '*'
    press_key(&mut vm, 0x37); // '7'
    press_key(&mut vm, 0x0D); // Enter

    assert_eq!(read_result(&vm), Some(42), "6 * 7 should equal 42");
}

#[test]
fn calculator_handles_multi_digit_operations() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Enter "12" + "+" + "34" + Enter
    press_key(&mut vm, 0x31); // '1'
    press_key(&mut vm, 0x32); // '2'
    press_key(&mut vm, 0x2B); // '+'
    press_key(&mut vm, 0x33); // '3'
    press_key(&mut vm, 0x34); // '4'
    press_key(&mut vm, 0x0D); // Enter

    assert_eq!(read_result(&vm), Some(46), "12 + 34 should equal 46");
}

// ── CLEAR TEST ───────────────────────────────────────────────────────

#[test]
fn calculator_clears_on_c_key() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Enter some digits
    press_key(&mut vm, 0x35); // '5'
    assert_eq!(vm.regs[4], 5);

    // Press 'c' (0x63) to clear
    press_key(&mut vm, 0x63);
    assert_eq!(vm.regs[4], 0, "first number should be cleared");
    assert_eq!(vm.regs[5], 0, "second number should be cleared");
    assert_eq!(vm.regs[6], 0, "operator should be cleared");
    assert_eq!(vm.regs[10], 0, "state should be reset to 0");
}

#[test]
fn calculator_clears_on_C_key() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    press_key(&mut vm, 0x39); // '9'
    assert_eq!(vm.regs[4], 9);

    // Press 'C' (0x43) to clear
    press_key(&mut vm, 0x43);
    assert_eq!(vm.regs[4], 0, "first number should be cleared");
}

// ── EDGE CASE TESTS ──────────────────────────────────────────────────

#[test]
fn calculator_multiply_by_zero() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Enter "5" + "*" + "0" + Enter
    press_key(&mut vm, 0x35); // '5'
    press_key(&mut vm, 0x2A); // '*'
    press_key(&mut vm, 0x30); // '0'
    press_key(&mut vm, 0x0D); // Enter

    assert_eq!(read_result(&vm), Some(0), "5 * 0 should equal 0");
}

#[test]
fn calculator_enter_without_operator_does_nothing() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Just press Enter without entering a number or operator
    press_key(&mut vm, 0x0D);
    assert_eq!(vm.regs[4], 0, "should not compute without operator");
    assert_eq!(vm.regs[10], 0, "state should stay 0");
}

#[test]
fn calculator_result_state_any_key_clears() {
    let asm = assemble_calculator();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    run_vm(&mut vm);

    // Compute 2+3=5
    press_key(&mut vm, 0x32); // '2'
    press_key(&mut vm, 0x2B); // '+'
    press_key(&mut vm, 0x33); // '3'
    press_key(&mut vm, 0x0D); // Enter
    assert_eq!(read_result(&vm), Some(5), "2 + 3 should equal 5");
    assert_eq!(vm.regs[10], 3); // result state

    // Press any key should clear
    press_key(&mut vm, 0x31); // '1' in state 3 -> do_clear
    assert_eq!(vm.regs[4], 0, "should be cleared after key in result state");
    assert_eq!(vm.regs[10], 0, "state should be 0 after clear");
}
