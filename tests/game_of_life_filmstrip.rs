/// Integration test: Conway's Game of Life filmstrip
///
/// Assembles game_of_life.gasm, runs one generation, verifies:
/// 1. Filmstrip assembles into 3 frames
/// 2. Seed plants correct initial patterns
/// 3. One generation produces correct evolution
/// 4. PNG dump of the result
///
/// This exercises: PGET (reading screen state), PSET (writing screen state),
/// LOAD/STORE (back buffer for double-buffering), conditional branching
/// based on computed data (B3/S23 rules), multi-phase frame execution
/// (compute phase + copy phase in the same frame).

use pixels_move_pixels::filmstrip;
use pixels_move_pixels::gasm;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::{SCREEN_BASE, SCREEN_SIZE};

fn read_screen_pixel(svm: &SoftwareVm, x: u32, y: u32) -> u32 {
    assert!(x < SCREEN_SIZE && y < SCREEN_SIZE);
    let addr = SCREEN_BASE + y * SCREEN_SIZE + x;
    svm.peek(addr)
}

fn is_alive(svm: &SoftwareVm, x: u32, y: u32) -> bool {
    read_screen_pixel(svm, x, y) != 0
}

#[test]
fn test_gol_filmstrip_assembles() {
    let source = std::fs::read_to_string("programs/game_of_life.gasm")
        .expect("programs/game_of_life.gasm should exist");
    let (programs, labels) = gasm::assemble_filmstrip_with_labels(&source)
        .expect("game_of_life.gasm should assemble");

    assert_eq!(programs.len(), 3, "should have 3 frames");
    assert_eq!(labels.get("Seed"), Some(&0), "Seed should be frame 0");
    assert_eq!(labels.get("Step"), Some(&1), "Step should be frame 1");
    assert_eq!(labels.get("Done"), Some(&2), "Done should be frame 2");

    eprintln!("[GOL] Frame sizes: Seed={}, Step={}, Done={}",
        programs[0].pixels.len(),
        programs[1].pixels.len(),
        programs[2].pixels.len()
    );

    assert!(programs[0].pixels.len() > 20, "Seed frame should have instructions");
    assert!(programs[1].pixels.len() > 50, "Step frame should be the largest");
    assert!(programs[2].pixels.len() >= 1, "Done frame should have at least HALT");
}

#[test]
fn test_gol_seed_and_one_generation() {
    let source = std::fs::read_to_string("programs/game_of_life.gasm")
        .expect("programs/game_of_life.gasm should exist");
    let (programs, _labels) = gasm::assemble_filmstrip_with_labels(&source)
        .expect("game_of_life.gasm should assemble");

    let segments: Vec<Vec<u32>> = programs.iter().map(|p| p.pixels.clone()).collect();
    let filmstrip = filmstrip::filmstrip_from_segments(&segments);

    let base_addr = 5000u32;
    let mut svm = SoftwareVm::new();
    filmstrip.load_into_software_vm(&mut svm, base_addr);
    filmstrip.spawn_filmstrip_vm(&mut svm, 0, base_addr);

    // Run to completion
    let max_dispatches = 200; // generous budget
    for i in 0..max_dispatches {
        let vm0 = svm.vm_state(0);
        if vm0.halted == 1 || vm0.state == 2 {
            eprintln!("[GOL] Halted after {} dispatches, frame_ptr={}",
                i, vm0.attention_mask);
            break;
        }
        svm.execute_frame();

        let vm0 = svm.vm_state(0);
        eprintln!("[GOL] Dispatch {}: state={} halted={} cycles={} frame_ptr={} r0={} r1={} r15(gen)={} r17(copy)={}",
            i + 1, vm0.state, vm0.halted, vm0.cycles, vm0.attention_mask,
            vm0.regs[0], vm0.regs[1], vm0.regs[15], vm0.regs[17]);
    }

    let vm0 = svm.vm_state(0);
    assert_eq!(vm0.halted, 1, "VM should have halted after one generation");

    // Debug: print all alive cells
    eprintln!("[GOL] Alive cells after 1 generation:");
    let mut dbg_count = 0u32;
    for y in 0..32u32 {
        for x in 0..32u32 {
            if is_alive(&svm, x, y) {
                eprintln!("  ({}, {}) = 0x{:08X}", x, y, read_screen_pixel(&svm, x, y));
                dbg_count += 1;
            }
        }
    }
    eprintln!("[GOL] Total alive: {}", dbg_count);

    // ═══ Verify Glider evolution (one step) ═══
    // Initial Glider:
    //   .X.    (2,1)
    //   ..X    (3,2)
    //   XXX    (1,3), (2,3), (3,3)
    //
    // After one generation:
    //   X.X    (1,2), (3,2)
    //   .XX    (2,3), (3,3)
    //   .X.    (2,4)

    // Glider should have moved: check new positions
    let expected_alive_glider: Vec<(u32, u32)> = vec![
        (1, 2), (3, 2),  // row y=2
        (2, 3), (3, 3),  // row y=3
        (2, 4),           // row y=4
    ];

    for &(x, y) in &expected_alive_glider {
        assert!(is_alive(&svm, x, y),
            "Glider: pixel ({}, {}) should be alive after 1 gen", x, y);
    }

    // Old glider positions that should be dead now
    let expected_dead_glider: Vec<(u32, u32)> = vec![
        (2, 1), (1, 3),
    ];

    for &(x, y) in &expected_dead_glider {
        assert!(!is_alive(&svm, x, y),
            "Glider: pixel ({}, {}) should be dead after 1 gen", x, y);
    }

    // ═══ Verify Blinker evolution (one step) ═══
    // Initial Blinker (horizontal):
    //   XXX    (9,10), (10,10), (11,10)
    //
    // After one generation (vertical):
    //   X      (10,9)
    //   X      (10,10)
    //   X      (10,11)

    let expected_alive_blinker: Vec<(u32, u32)> = vec![
        (10, 9), (10, 10), (10, 11),
    ];

    for &(x, y) in &expected_alive_blinker {
        assert!(is_alive(&svm, x, y),
            "Blinker: pixel ({}, {}) should be alive after 1 gen", x, y);
    }

    // Old horizontal blinker positions that should be dead
    let expected_dead_blinker: Vec<(u32, u32)> = vec![
        (9, 10), (11, 10),
    ];

    for &(x, y) in &expected_dead_blinker {
        assert!(!is_alive(&svm, x, y),
            "Blinker: pixel ({}, {}) should be dead after 1 gen", x, y);
    }

    // Count total alive cells: glider(5) + blinker(3) = 8
    let mut alive_count = 0u32;
    for y in 0..32u32 {
        for x in 0..32u32 {
            if is_alive(&svm, x, y) {
                alive_count += 1;
            }
        }
    }
    assert_eq!(alive_count, 8,
        "Should have exactly 8 alive cells (5 glider + 3 blinker), got {}", alive_count);

    eprintln!("[GOL] Verified: {} alive cells after 1 generation", alive_count);
}

#[test]
fn test_gol_dumps_png() {
    let source = std::fs::read_to_string("programs/game_of_life.gasm")
        .expect("programs/game_of_life.gasm should exist");
    let (programs, _labels) = gasm::assemble_filmstrip_with_labels(&source)
        .expect("game_of_life.gasm should assemble");

    let segments: Vec<Vec<u32>> = programs.iter().map(|p| p.pixels.clone()).collect();
    let filmstrip = filmstrip::filmstrip_from_segments(&segments);

    let base_addr = 5000u32;
    let mut svm = SoftwareVm::new();
    filmstrip.load_into_software_vm(&mut svm, base_addr);
    filmstrip.spawn_filmstrip_vm(&mut svm, 0, base_addr);

    for _ in 0..200 {
        let vm0 = svm.vm_state(0);
        if vm0.halted == 1 { break; }
        svm.execute_frame();
    }

    let vm0 = svm.vm_state(0);
    assert_eq!(vm0.halted, 1, "VM should have halted");

    let img = svm.dump_screen_png();
    img.save("gol_output.png").expect("should save screen PNG");

    let metadata = std::fs::metadata("gol_output.png")
        .expect("gol_output.png should exist");
    assert!(metadata.len() > 100, "PNG should have content");

    eprintln!("[GOL] Screen dumped to gol_output.png");
}
