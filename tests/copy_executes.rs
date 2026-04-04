// Chain Replication Test
//
// The position-independent self-replicator: a program that discovers
// its own address via the ENTRY instruction, copies itself +100 pixels
// forward. Each copy can do the same. Chain: 0 -> 100 -> 200.
//
// This is the transition from "a program copies itself once" to
// "a program can spread." Mitosis becomes chain replication.

use pixels_move_pixels::{assembler, vm::GlyphVm};

#[test]
fn copy_executes() {
    let mut vm = GlyphVm::new();
    let program = assembler::chain_replicator();
    let prog_len = program.len() as u32;

    // Load at address 0, spawn VM 0, run
    vm.substrate().load_program(0, &program.pixels);
    vm.spawn_vm(0, 0);
    vm.execute_frame();

    // Verify first copy at 100
    for i in 0..prog_len {
        assert_eq!(
            vm.substrate().peek(i),
            vm.substrate().peek(100 + i),
            "Gen 1: pixel {i} must match"
        );
    }

    // The copy at 100 uses ENTRY to discover it's at address 100.
    // It copies from 100 to 200 (entry_point + 100).
    // Spawn VM 1 at address 100.
    vm.spawn_vm(1, 100);
    vm.execute_frame();

    // Verify second generation at 200
    for i in 0..prog_len {
        assert_eq!(
            vm.substrate().peek(100 + i),
            vm.substrate().peek(200 + i),
            "Gen 2: pixel {i} must match"
        );
    }

    println!("\n  Three generations: 0 -> 100 -> 200");
    println!("  {} pixels each. Chain replication works.", prog_len);
    println!("  Pixels keep moving pixels.\n");
}
