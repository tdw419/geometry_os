/// Integration test: Sierpinski triangle filmstrip
///
/// Assembles the sierpinski.gasm filmstrip, loads it into the SoftwareVm,
/// executes across multiple frame visits, and verifies:
/// 1. The filmstrip assembles into 3 frames
/// 2. The VM halts after processing
/// 3. Screen pixels match the Sierpinski pattern ((x & y) == 0 => white)
/// 4. Frame labels are correctly resolved
/// 5. Explicit FRAME jumps work (not just auto-advance)
///
/// This exercises: AND opcode, PSET opcode, FRAME opcode, filmstrip loading,
/// register persistence across frame visits, and symbolic .frame labels.

use pixels_move_pixels::filmstrip;
use pixels_move_pixels::gasm;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::{SCREEN_BASE, SCREEN_SIZE};

/// Read a screen pixel at (x, y) from the SoftwareVm's RAM.
fn read_screen_pixel(svm: &SoftwareVm, x: u32, y: u32) -> u32 {
    assert!(x < SCREEN_SIZE && y < SCREEN_SIZE);
    let addr = SCREEN_BASE + y * SCREEN_SIZE + x;
    svm.peek(addr)
}

#[test]
fn test_sierpinski_filmstrip_assembles() {
    let source = std::fs::read_to_string("programs/sierpinski.gasm")
        .expect("programs/sierpinski.gasm should exist");
    let (programs, labels) = gasm::assemble_filmstrip_with_labels(&source)
        .expect("sierpinski.gasm should assemble");

    // Should have 3 frames: Init, Compute, Done
    assert_eq!(programs.len(), 3, "should have 3 frames");

    // Verify frame labels
    assert_eq!(labels.get("Init"), Some(&0), "Init should be frame 0");
    assert_eq!(labels.get("Compute"), Some(&1), "Compute should be frame 1");
    assert_eq!(labels.get("Done"), Some(&2), "Done should be frame 2");

    // Frame 0 (Init) should be non-trivial
    assert!(programs[0].pixels.len() > 5, "Init frame should have instructions");

    // Frame 1 (Compute) should be the biggest
    assert!(programs[1].pixels.len() > programs[0].pixels.len(),
        "Compute frame should be larger than Init");

    // Frame 2 (Done) should be just a HALT
    assert!(programs[2].pixels.len() >= 1, "Done frame should have at least HALT");

    eprintln!("[SIERPINSKI] Frame sizes: Init={}, Compute={}, Done={}",
        programs[0].pixels.len(),
        programs[1].pixels.len(),
        programs[2].pixels.len()
    );
}

#[test]
fn test_sierpinski_filmstrip_execution() {
    let source = std::fs::read_to_string("programs/sierpinski.gasm")
        .expect("programs/sierpinski.gasm should exist");
    let (programs, _labels) = gasm::assemble_filmstrip_with_labels(&source)
        .expect("sierpinski.gasm should assemble");

    // Build a filmstrip from the assembled segments
    let segments: Vec<Vec<u32>> = programs.iter().map(|p| p.pixels.clone()).collect();
    let filmstrip = filmstrip::filmstrip_from_segments(&segments);

    assert_eq!(filmstrip.frame_count(), 3, "should have 3 frames");

    // Load into SoftwareVm
    let base_addr = 5000u32;
    let mut svm = SoftwareVm::new();
    filmstrip.load_into_software_vm(&mut svm, base_addr);
    filmstrip.spawn_filmstrip_vm(&mut svm, 0, base_addr);

    // Verify initial state
    let vm0 = svm.vm_state(0);
    assert_eq!(vm0.attention_mask, 0, "should start at frame 0");
    assert_eq!(vm0.frame_count, 3, "should have 3 frames");
    eprintln!("[SIERPINSKI] Initial: frame_ptr={}, frame_count={}",
        vm0.attention_mask, vm0.frame_count);

    // Execute multiple frames -- the Compute frame self-loops via FRAME,
    // so we need multiple execute_frame calls until the VM halts.
    // Each execute_frame gives 1024 cycles. The Compute frame renders
    // ~113 pixels per visit. 1024 pixels total / ~113 per visit = ~9 visits.
    // Plus 1 visit for Init, 1 for Done = ~11 execute_frame calls.
    let max_dispatches = 30; // safety limit
    for i in 0..max_dispatches {
        let vm0 = svm.vm_state(0);
        if vm0.halted == 1 || vm0.state == 2 {
            eprintln!("[SIERPINSKI] Halted after {} dispatches, frame_ptr={}",
                i + 1, vm0.attention_mask);
            break;
        }
        svm.execute_frame();

        let vm0 = svm.vm_state(0);
        eprintln!("[SIERPINSKI] Dispatch {}: state={} halted={} cycles={} frame_ptr={} r0={} r1={}",
            i + 1, vm0.state, vm0.halted, vm0.cycles, vm0.attention_mask,
            vm0.regs[0], vm0.regs[1]);
    }

    // Verify the VM halted
    let vm0 = svm.vm_state(0);
    assert_eq!(vm0.halted, 1, "VM should have halted after rendering");
    assert_eq!(vm0.attention_mask, 2, "should be on frame 2 (Done)");

    // Verify the Sierpinski pattern on screen
    let mut on_count = 0u32;
    let mut off_count = 0u32;
    for y in 0..32u32 {
        for x in 0..32u32 {
            let pixel = read_screen_pixel(&svm, x, y);
            let expected_on = (x & y) == 0;
            if expected_on {
                assert_eq!(pixel, 0xFFFFFFFF,
                    "pixel ({}, {}) should be ON (white), got 0x{:08X}", x, y, pixel);
                on_count += 1;
            } else {
                // Off pixels should be 0 (black -- default screen state)
                assert_eq!(pixel, 0,
                    "pixel ({}, {}) should be OFF (black), got 0x{:08X}", x, y, pixel);
                off_count += 1;
            }
        }
    }

    eprintln!("[SIERPINSKI] Verified: {} ON pixels, {} OFF pixels out of 1024",
        on_count, off_count);
    assert!(on_count > 0, "should have at least some ON pixels");
    assert!(off_count > 0, "should have at least some OFF pixels");

    // Verify a few specific known Sierpinski pixels:
    // (0,0): 0&0=0 -> ON
    assert_eq!(read_screen_pixel(&svm, 0, 0), 0xFFFFFFFF, "(0,0) should be ON");
    // (1,0): 1&0=0 -> ON (any x with y=0 is ON)
    assert_eq!(read_screen_pixel(&svm, 1, 0), 0xFFFFFFFF, "(1,0) should be ON");
    // (0,1): 0&1=0 -> ON
    assert_eq!(read_screen_pixel(&svm, 0, 1), 0xFFFFFFFF, "(0,1) should be ON");
    // (1,1): 1&1=1 -> OFF
    assert_eq!(read_screen_pixel(&svm, 1, 1), 0, "(1,1) should be OFF");
    // (2,1): 2&1=0 -> ON
    assert_eq!(read_screen_pixel(&svm, 2, 1), 0xFFFFFFFF, "(2,1) should be ON");
    // (3,1): 3&1=1 -> OFF
    assert_eq!(read_screen_pixel(&svm, 3, 1), 0, "(3,1) should be OFF");
    // (3,3): 3&3=3 -> OFF
    assert_eq!(read_screen_pixel(&svm, 3, 3), 0, "(3,3) should be OFF");
    // (5,2): 5&2=0 -> ON
    assert_eq!(read_screen_pixel(&svm, 5, 2), 0xFFFFFFFF, "(5,2) should be ON");
}

#[test]
fn test_sierpinski_filmstrip_dumps_png() {
    let source = std::fs::read_to_string("programs/sierpinski.gasm")
        .expect("programs/sierpinski.gasm should exist");
    let (programs, _labels) = gasm::assemble_filmstrip_with_labels(&source)
        .expect("sierpinski.gasm should assemble");

    let segments: Vec<Vec<u32>> = programs.iter().map(|p| p.pixels.clone()).collect();
    let filmstrip = filmstrip::filmstrip_from_segments(&segments);

    let base_addr = 5000u32;
    let mut svm = SoftwareVm::new();
    filmstrip.load_into_software_vm(&mut svm, base_addr);
    filmstrip.spawn_filmstrip_vm(&mut svm, 0, base_addr);

    // Run to completion
    for _ in 0..30 {
        let vm0 = svm.vm_state(0);
        if vm0.halted == 1 { break; }
        svm.execute_frame();
    }

    let vm0 = svm.vm_state(0);
    assert_eq!(vm0.halted, 1, "VM should have halted");

    // Dump the screen as PNG
    let img = svm.dump_screen_png();
    img.save("sierpinski_output.png")
        .expect("should be able to save screen PNG");

    eprintln!("[SIERPINSKI] Screen dumped to sierpinski_output.png");

    // Verify the file exists and has content
    let metadata = std::fs::metadata("sierpinski_output.png")
        .expect("sierpinski_output.png should exist");
    assert!(metadata.len() > 100, "PNG should have content");
}
