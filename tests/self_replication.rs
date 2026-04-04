// Self-Replication Test
//
// The original proof: 18 pixels copy themselves from address 0 to address 100.
// No CPU involvement during execution. The GPU reads its own instructions
// from the texture, executes them, and writes a perfect duplicate.
//
// From PIXELS_MOVE_PIXELS.md:
//   "PIXELS MOVED PIXELS. 18 glyphs copied themselves on GPU.
//    No Python. No CPU. Just light."

use pixels_move_pixels::{assembler, vm::GlyphVm};

#[test]
fn self_replication() {
    let mut vm = GlyphVm::new();
    let program = assembler::self_replicator();

    // Load the 18-pixel program at address 0
    vm.substrate().load_program(0, &program.pixels);

    // Verify bootstrap
    assert_eq!(vm.substrate().peek(0), 0x00000001, "addr 0: LDI r0");
    assert_eq!(vm.substrate().peek(1), 0x00000000, "addr 1: DATA 0");

    // Spawn VM 0 at address 0 and run
    vm.spawn_vm(0, 0);
    vm.execute_frame();

    // Verify: program copied itself to address 100
    println!("\n=== VERIFICATION: Did pixels move pixels? ===\n");

    let mut all_match = true;
    for i in 0..18 {
        let src = vm.substrate().peek(i);
        let dst = vm.substrate().peek(100 + i);
        let ok = src == dst;
        if ok {
            println!("  [ok] addr {:>3} -> addr {:>3}: 0x{:08X}", i, 100 + i, src);
        } else {
            println!("  [!!] addr {:>3} -> addr {:>3}: expected 0x{:08X}, got 0x{:08X}", i, 100 + i, src, dst);
            all_match = false;
        }
    }

    // Source must be intact (non-destructive copy)
    assert_eq!(vm.substrate().peek(0), 0x00000001, "source pixel 0 intact");

    assert!(all_match, "All 18 pixels must match between source and copy");

    println!("\n  PIXELS MOVED PIXELS.");
    println!("  18 glyphs copied themselves on GPU.");
    println!("  Source pixels intact. Self-replication is non-destructive.\n");
}
