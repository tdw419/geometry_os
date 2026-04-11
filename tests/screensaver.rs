// ═══════════════════════════════════════════════════════════════════════
// tests/screensaver.rs -- Tests for the screensaver demo program
//
// Verifies the screensaver.gasm program assembles, loads, and runs
// multiple frames producing visible screen output.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Helper: count non-black pixels on screen.
fn colored_pixels(vm: &Vm) -> usize {
    vm.screen.iter().filter(|&&p| p != 0).count()
}

/// Load and assemble the screensaver program (with .include resolution).
fn assemble_screensaver() -> assembler::Assembled {
    let path = std::path::Path::new("programs/screensaver.gasm");
    assembler::assemble_file(path, &[]).expect("screensaver should assemble")
}

#[test]
fn screensaver_assembles() {
    let asm = assemble_screensaver();
    assert!(
        asm.pixels.len() > 100,
        "screensaver should have substantial code"
    );
    assert!(asm.labels.contains_key("main"), "should have 'main' label");
    assert!(
        asm.labels.contains_key("dispatch"),
        "should have 'dispatch' label"
    );
    assert!(
        asm.labels.contains_key("advance"),
        "should have 'advance' label"
    );
}

#[test]
fn screensaver_runs_first_frame() {
    let asm = assemble_screensaver();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    let cycles = vm.run();
    assert!(cycles > 0, "should execute some cycles");
    assert!(!vm.halted, "should not halt on first frame");
    assert!(vm.yielded, "should yield after first frame");
}

#[test]
fn screensaver_plasma_draws_pixels() {
    let asm = assemble_screensaver();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    // Run first frame (plasma bars effect)
    vm.run();
    let pixels = colored_pixels(&vm);
    assert!(
        pixels > 1000,
        "plasma bars should draw many pixels, got {}",
        pixels
    );
}

#[test]
fn screensaver_runs_multiple_frames() {
    let asm = assemble_screensaver();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    // Run 5 frames
    for _ in 0..5 {
        vm.run();
        if vm.halted {
            break;
        }
        vm.yielded = false;
    }
    assert!(!vm.halted, "screensaver should not halt");
}

#[test]
fn screensaver_transitions_effects() {
    let asm = assemble_screensaver();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    // Run 62 frames to get past the first effect (60 frames per effect)
    for i in 0..62 {
        vm.run();
        if vm.halted {
            panic!("halted at frame {}", i);
        }
        vm.yielded = false;
    }

    // Effect index at 0x1000 should have advanced past 0
    let effect = vm.ram[0x1000];
    assert!(
        effect > 0,
        "effect index should have advanced past 0, got {}",
        effect
    );
}
