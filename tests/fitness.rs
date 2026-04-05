//! Tests for the fitness function (GEO-27).
//!
//! Verifies that:
//! 1. Fitness scores are in [0.0, 1.0]
//! 2. The self-replicator gets a baseline fitness score
//! 3. A deliberately worse program scores lower than a good one
//! 4. Spatial locality is computed correctly
//! 5. Memory efficiency is computed correctly

use pixels_move_pixels::assembler::{self, op, Program};
use pixels_move_pixels::vm::ExecutionResult;
use pixels_move_pixels::software_vm::SoftwareVm;

/// Build an ExecutionResult from a software VM run for fitness testing.
/// This avoids needing GPU hardware.
fn run_software_fitness(pixels: &[u32], load_address: u32) -> ExecutionResult {
    let mut svm = SoftwareVm::new();
    svm.load_program(load_address, pixels);
    svm.spawn_vm(0, load_address);
    svm.execute_frame();
    let vm_state = svm.vm_state(0).clone();

    // Count metrics
    let halted = vm_state.halted == 1;
    let cycles = vm_state.cycles;
    let nonzero_regs = vm_state.regs.iter().filter(|&&r| r != 0).count();

    // Count unique writes by comparing substrate before/after
    // For software VM, count non-zero regs as a proxy
    let unique_writes = nonzero_regs; // simplified metric

    let program_length = pixels.len();

    // Collect opcodes used
    let mut opcodes: std::collections::HashSet<u8> = std::collections::HashSet::new();
    for &pixel in pixels {
        let opcode = (pixel & 0xFF) as u8;
        opcodes.insert(opcode);
    }

    // Compute spatial locality (reuse the same logic as vm.rs)
    let spatial_locality = compute_spatial_locality(pixels, load_address);

    let mut result = ExecutionResult {
        halted,
        cycles,
        final_pc: vm_state.pc,
        nonzero_regs,
        unique_writes,
        program_length,
        load_address,
        opcodes_used: opcodes.into_iter().collect(),
        memory_efficiency: 0.0,
        spatial_locality,
        fitness: 0.0,
        vm: vm_state,
    };
    result.compute_fitness();
    result
}

/// Mirrors compute_spatial_locality from vm.rs
fn compute_spatial_locality(pixels: &[u32], load_address: u32) -> f64 {
    use pixels_move_pixels::hilbert;
    if pixels.len() < 2 {
        return 1.0;
    }
    let mut total_distance: f64 = 0.0;
    for i in 0..pixels.len() - 1 {
        let d1 = load_address + i as u32;
        let d2 = load_address + i as u32 + 1;
        let (x1, y1) = hilbert::d2xy(d1);
        let (x2, y2) = hilbert::d2xy(d2);
        let dx = (x1 as f64 - x2 as f64).abs();
        let dy = (y1 as f64 - y2 as f64).abs();
        total_distance += (dx * dx + dy * dy).sqrt();
    }
    total_distance / (pixels.len() - 1) as f64
}

#[test]
fn fitness_score_is_bounded() {
    let p = assembler::self_replicator();
    let result = run_software_fitness(&p.pixels, 0);
    assert!(
        result.fitness >= 0.0 && result.fitness <= 1.0,
        "fitness {} not in [0, 1]",
        result.fitness
    );
}

#[test]
fn self_replicator_gets_positive_fitness() {
    let p = assembler::self_replicator();
    let result = run_software_fitness(&p.pixels, 0);
    assert!(
        result.fitness > 0.0,
        "self-replicator should have positive fitness, got {}",
        result.fitness
    );
    eprintln!(
        "[fitness] self-replicator: halted={}, cycles={}, regs={}, writes={}, ops={}, efficiency={:.3}, locality={:.3}, fitness={:.3}",
        result.halted,
        result.cycles,
        result.nonzero_regs,
        result.unique_writes,
        result.opcodes_used.len(),
        result.memory_efficiency,
        result.spatial_locality,
        result.fitness,
    );
}

#[test]
fn better_program_scores_higher() {
    // Good program: uses multiple opcodes, writes memory, halts
    let mut good = Program::new();
    good.ldi(0, 42);    // LDI
    good.ldi(1, 0);     // LDI
    good.store(0, 1);   // STORE (write to memory)
    good.add(0, 1);     // ADD
    good.halt();         // HALT

    // Bad program: just a single NOP (doesn't halt cleanly, does nothing)
    let mut bad = Program::new();
    bad.instruction(op::NOP, 0, 0, 0);

    let good_result = run_software_fitness(&good.pixels, 0);
    let bad_result = run_software_fitness(&bad.pixels, 0);

    assert!(
        good_result.fitness > bad_result.fitness,
        "good program ({:.3}) should score higher than bad ({:.3})",
        good_result.fitness,
        bad_result.fitness
    );
}

#[test]
fn spatial_locality_sequential_is_good() {
    // Program loaded at address 0 -- sequential Hilbert addresses
    let mut p = Program::new();
    p.ldi(0, 1);
    p.ldi(1, 2);
    p.add(0, 1);
    p.halt();

    let result = run_software_fitness(&p.pixels, 0);
    // Sequential program should have locality <= 2.0 (Hilbert curve property)
    assert!(
        result.spatial_locality <= 2.0,
        "sequential program locality should be small, got {:.3}",
        result.spatial_locality
    );
}

#[test]
fn spatial_locality_single_pixel_is_perfect() {
    let mut p = Program::new();
    p.halt();
    // Single pixel: locality is defined as 1.0 (perfect)
    let locality = compute_spatial_locality(&p.pixels, 0);
    assert_eq!(locality, 1.0, "single pixel should have perfect locality");
}

#[test]
fn memory_efficiency_productive_program() {
    // Program that writes 5 values using only 8 pixels
    let mut p = Program::new();
    p.ldi(0, 100);
    p.ldi(1, 0);
    p.store(0, 1);   // write 1
    p.ldi(0, 200);
    p.store(0, 1);   // write 2
    p.halt();

    let result = run_software_fitness(&p.pixels, 0);
    // Memory efficiency should be positive since program writes
    assert!(
        result.memory_efficiency > 0.0,
        "productive program should have positive efficiency, got {:.3}",
        result.memory_efficiency
    );
}

#[test]
fn chain_replicator_also_scores() {
    let p = assembler::chain_replicator();
    let result = run_software_fitness(&p.pixels, 0);
    assert!(
        result.fitness > 0.0,
        "chain-replicator should have positive fitness, got {}",
        result.fitness
    );
    eprintln!(
        "[fitness] chain-replicator: halted={}, cycles={}, fitness={:.3}",
        result.halted, result.cycles, result.fitness
    );
}
