// Integration test for pixelc-compiled programs.
// Programs are written in .gp syntax, compiled by pixelc to .gasm,
// then assembled and run through the VM to verify correctness.

use geometry_os::assembler;
use geometry_os::vm::Vm;

fn compile_run(asm_file: &str) -> Vm {
    let source = std::fs::read_to_string(asm_file)
        .expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("assembly failed");
    let mut vm = Vm::new(512);
    vm.load_program(&asm.pixels);
    vm.run();
    vm
}

#[test]
fn pixelc_simple_add() {
    // a = 10, b = 20, c = a + b, ram[100] = c
    let vm = compile_run("programs/simple_add.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[2], 30, "r2 (c) should be 10 + 20 = 30");
    assert_eq!(vm.ram[100], 30, "ram[100] should be 30");
}

#[test]
fn pixelc_diagonal() {
    // x = 0; while x < 100: pixel(x,x,65); x = x + 1
    let vm = compile_run("programs/diagonal.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[0], 100, "r0 (x) should be 100");
}

#[test]
fn pixelc_fib_spiral() {
    // Fibonacci: x=1, y=1, count=0; loop 20 times
    let vm = compile_run("programs/fib_spiral.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[2], 20, "r2 (count) should be 20");
    assert!(vm.regs[1] > 0, "r1 (y) should be positive fibonacci");
}
