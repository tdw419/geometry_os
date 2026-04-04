// Copy Executes Test
//
// After self-replication, verify the COPY is itself a valid program.
// Spawn VM 1 at address 100. It should copy to address 200.
// Chain: 0 -> 100 -> 200. Three generations of self-replication.
//
// NOTE: Currently ignored. The self-replicator hardcodes r0=0, r1=100.
// A copy at address 100 would copy from 0 to 100 again (not 100 to 200).
// This requires a position-independent self-replicator, which is Phase 1.

use pixels_move_pixels::{assembler, vm::GlyphVm};

#[test]
#[ignore]
fn copy_executes() {
    let mut vm = GlyphVm::new();
    let program = assembler::self_replicator();

    // Load at address 0, spawn VM 0, run
    vm.substrate().load_program(0, &program.pixels);
    vm.spawn_vm(0, 0);
    vm.execute_frame();

    // Verify first copy at 100
    for i in 0..18 {
        assert_eq!(
            vm.substrate().peek(i),
            vm.substrate().peek(100 + i),
            "Gen 1: pixel {i} must match"
        );
    }

    // The copy at 100 has LDI r1=100, so it will copy to address 200
    // (100 + 100 = 200). Spawn VM 1 at address 100.
    vm.spawn_vm(1, 100);
    vm.execute_frame();

    // Verify second generation at 200
    for i in 0..18 {
        assert_eq!(
            vm.substrate().peek(100 + i),
            vm.substrate().peek(200 + i),
            "Gen 2: pixel {i} must match"
        );
    }

    println!("\n  Three generations: 0 -> 100 -> 200");
    println!("  Pixels keep moving pixels.\n");
}
