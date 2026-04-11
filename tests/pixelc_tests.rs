// Integration test for pixelc-compiled programs.

use geometry_os::assembler;
use geometry_os::vm::Vm;

fn compile_run(asm_file: &str) -> Vm {
    let source =
        std::fs::read_to_string(asm_file).expect("run: cargo test from project root");
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

#[test]
fn pixelc_gradient() {
    let vm = compile_run("programs/gradient.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[0], 64, "r0 (y) should be 64 after full outer loop");
    assert_eq!(vm.regs[1], 64, "r1 (x) should be 64 after final inner loop");
}

#[test]
fn pixelc_life() {
    // Conway's Game of Life -- grids at ram[8192] and ram[12288]
    let source =
        std::fs::read_to_string("programs/life.asm").expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("life.asm assembly failed");
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);
    // Run until halt (10 generations, each yields)
    let mut total = 0u32;
    while !vm.halted && total < 100_000_000 {
        let c = vm.run_with_limit(1_000_000);
        total += c;
    }
    assert!(vm.halted, "life should halt after 10 gens (used {} cycles)", total);
    // Grid A at 8192..12288 should have alive cells
    let alive: u32 = vm.ram[8192..12288]
        .iter()
        .map(|&v| if v != 0 { 1u32 } else { 0u32 })
        .sum();
    assert!(alive > 0, "should have alive cells after 10 gens, got {}", alive);
}

#[test]
fn pixelc_life_debug() {
    use geometry_os::agent::GasmAgent;
    let source = std::fs::read_to_string("programs/life.asm").unwrap();
    let asm = assembler::assemble(&source).unwrap();
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);
    // Run to first yield (seed phase complete)
    vm.run_with_limit(500_000);
    // Check grid A at 8192
    let alive: u32 = vm.ram[8192..12288].iter().map(|&v| if v != 0 { 1u32 } else { 0u32 }).sum();
    eprintln!("DEBUG: after first run: halted={}, yielded={}, alive={}", vm.halted, vm.yielded, alive);
    // Also check the first few addresses
    for i in 8192..8200 {
        eprintln!("  ram[{}] = {}", i, vm.ram[i]);
    }
    assert!(alive > 0, "seed should have alive cells, got {}", alive);
}
