// Integration test for pixelc-compiled programs.

use geometry_os::assembler;
use geometry_os::vm::Vm;

fn compile_run(asm_file: &str) -> Vm {
    let source = std::fs::read_to_string(asm_file).expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("assembly failed");
    let mut vm = Vm::new(512);
    vm.load_program(&asm.pixels);
    vm.run_with_limit(1_000_000);
    vm
}

#[test]
fn pixelc_simple_add() {
    let vm = compile_run("programs/simple_add.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[2], 30, "r2 (c) should be 10 + 20 = 30");
    assert_eq!(vm.ram[100], 30, "ram[100] should be 30");
}

#[test]
fn pixelc_diagonal() {
    let vm = compile_run("programs/diagonal.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[0], 100, "r0 (x) should be 100");
}

#[test]
fn pixelc_fib_spiral() {
    let vm = compile_run("programs/fib_spiral.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[2], 20, "r2 (count) should be 20");
    assert!(vm.regs[1] > 0, "r1 (y) should be positive fibonacci");
}

#[test]
fn pixelc_bounce() {
    let vm = compile_run("programs/bounce.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[4], 200, "r4 (steps) should be 200");
    assert!(vm.regs[0] < 300, "r0 (x) should be in bounds");
}

#[test]
fn pixelc_checkerboard() {
    let vm = compile_run("programs/checkerboard.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[1], 64, "r1 (y) should be 64");
}
