// ═══════════════════════════════════════════════════════════════════════
// BOUNCING PIXEL TESTS: Simple animation with collision detection
//
// Tests the bouncing_pixel program: a pixel bounces around the 256x256
// screen, reflecting off walls. Verifies position tracking, velocity
// negation on bounce, screen rendering via PSET, and frame counting.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Helper: assemble and run source, return the VM.
fn run_src(src: &str) -> Vm {
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();
    vm
}

/// Helper: assemble source, return VM (don't run yet).
fn vm_from_src(src: &str) -> Vm {
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm
}

/// Helper: read a u32 from VM RAM.
fn ram_read(vm: &Vm, addr: usize) -> u32 {
    vm.ram[addr]
}

/// Helper: read pixel from screen at (x, y).
fn screen_pixel(vm: &Vm, x: usize, y: usize) -> u32 {
    vm.screen[y * 256 + x]
}

/// Helper: check if any screen pixels are non-zero.
fn screen_has_content(vm: &Vm) -> bool {
    vm.screen.iter().any(|&p| p != 0)
}

// ── VELOCITY NEGATION TESTS ────────────────────────────────────────

#[test]
fn bounce_negate_positive_velocity() {
    // NOT(1) + 1 should give 0xFFFFFFFF = -1 in two's complement
    let src = "\
        LDI r0, 1\n\
        NOT r0\n\
        LDI r1, 1\n\
        ADD r0, r1\n\
        HALT\n\
    ";
    let vm = run_src(src);
    assert!(vm.halted);
    // NOT(1) = 0xFFFFFFFE, + 1 = 0xFFFFFFFF
    assert_eq!(vm.regs[0], 0xFFFFFFFF, "negation of 1 should be 0xFFFFFFFF");
}

#[test]
fn bounce_negate_negative_velocity() {
    // NOT(0xFFFFFFFF) + 1 should give 1
    let src = "\
        LDI r0, 0xFFFFFFFF\n\
        NOT r0\n\
        LDI r1, 1\n\
        ADD r0, r1\n\
        HALT\n\
    ";
    let vm = run_src(src);
    assert!(vm.halted);
    // NOT(0xFFFFFFFF) = 0, + 1 = 1
    assert_eq!(vm.regs[0], 1, "negation of 0xFFFFFFFF should be 1");
}

#[test]
fn bounce_double_negate_returns_original() {
    // Negating twice should return the original value
    let src = "\
        LDI r0, 5\n\
        NOT r0\n\
        LDI r1, 1\n\
        ADD r0, r1\n\
        NOT r0\n\
        ADD r0, r1\n\
        HALT\n\
    ";
    let vm = run_src(src);
    assert!(vm.halted);
    assert_eq!(
        vm.regs[0], 5,
        "double negation should return original value"
    );
}

// ── POSITION UPDATE TESTS ──────────────────────────────────────────

#[test]
fn bounce_pixel_moves_right_and_down() {
    // Start at (10, 10) with dx=1, dy=1. After one frame, should be at (11, 11).
    let src = "\
        LDI r0, 10\n\
        LDI r4, 0x1000\n\
        STORE r4, r0\n\
        LDI r1, 10\n\
        LDI r4, 0x1001\n\
        STORE r4, r1\n\
        LDI r0, 1\n\
        LDI r4, 0x1002\n\
        STORE r4, r0\n\
        LDI r0, 1\n\
        LDI r4, 0x1003\n\
        STORE r4, r0\n\
        LDI r9, 0\n\
        LDI r4, 0x1004\n\
        STORE r4, r9\n\
        LDI r7, 255\n\
        LDI r8, 0\n\
    loop:\n\
        LDI r4, 0x1000\n\
        LOAD r0, r4\n\
        LDI r4, 0x1001\n\
        LOAD r1, r4\n\
        LDI r4, 0x1002\n\
        LOAD r2, r4\n\
        LDI r4, 0x1003\n\
        LOAD r3, r4\n\
        LDI r6, 0\n\
        PSET r0, r1, r6\n\
        ADD r0, r2\n\
        ADD r1, r3\n\
        BGE r0, r7, skip_x\n\
        BEQ r0, r8, skip_x\n\
    after_x:\n\
        BGE r1, r7, skip_y\n\
        BEQ r1, r8, skip_y\n\
    after_y:\n\
        LDI r4, 0x1000\n\
        STORE r4, r0\n\
        LDI r4, 0x1001\n\
        STORE r4, r1\n\
        LDI r4, 0x1002\n\
        STORE r4, r2\n\
        LDI r4, 0x1003\n\
        STORE r4, r3\n\
        LDI r6, 0xFF00\n\
        PSET r0, r1, r6\n\
        LDI r4, 1\n\
        ADD r9, r4\n\
        LDI r4, 0x1004\n\
        STORE r4, r9\n\
        LDI r4, 2\n\
        BGE r9, r4, done\n\
        YIELD\n\
        JMP loop\n\
    skip_x:\n\
        NOT r2\n\
        LDI r5, 1\n\
        ADD r2, r5\n\
        BGE r0, r7, cxh\n\
        BEQ r0, r8, cxl\n\
        JMP after_x\n\
    cxh:\n\
        LDI r0, 254\n\
        JMP after_x\n\
    cxl:\n\
        LDI r0, 1\n\
        JMP after_x\n\
    skip_y:\n\
        NOT r3\n\
        LDI r5, 1\n\
        ADD r3, r5\n\
        BGE r1, r7, cyh\n\
        BEQ r1, r8, cyl\n\
        JMP after_y\n\
    cyh:\n\
        LDI r1, 254\n\
        JMP after_y\n\
    cyl:\n\
        LDI r1, 1\n\
        JMP after_y\n\
    done:\n\
        HALT\n\
    ";
    let mut vm = vm_from_src(src);
    // Run first frame (stops at YIELD)
    vm.run();
    assert!(vm.is_yielded());
    // x should be 11, y should be 11
    assert_eq!(ram_read(&vm, 0x1000), 11, "x should be 11 after one frame");
    assert_eq!(ram_read(&vm, 0x1001), 11, "y should be 11 after one frame");
    assert_eq!(ram_read(&vm, 0x1004), 1, "frame counter should be 1");

    // Run second frame
    vm.yielded = false;
    vm.run();
    assert!(vm.is_halted());
    assert_eq!(ram_read(&vm, 0x1000), 12, "x should be 12 after two frames");
    assert_eq!(ram_read(&vm, 0x1001), 12, "y should be 12 after two frames");
}

// ── WALL BOUNCE TESTS ──────────────────────────────────────────────

#[test]
fn bounce_off_right_wall() {
    // Pixel at x=254, dx=1 → should bounce (dx becomes -1, x clamped to 254)
    let src = "\
        LDI r0, 254\n\
        LDI r4, 0x1000\n\
        STORE r4, r0\n\
        LDI r1, 128\n\
        LDI r4, 0x1001\n\
        STORE r4, r1\n\
        LDI r0, 1\n\
        LDI r4, 0x1002\n\
        STORE r4, r0\n\
        LDI r0, 1\n\
        LDI r4, 0x1003\n\
        STORE r4, r0\n\
        LDI r9, 0\n\
        LDI r4, 0x1004\n\
        STORE r4, r9\n\
        LDI r7, 255\n\
        LDI r8, 0\n\
        LDI r4, 0x1000\n\
        LOAD r0, r4\n\
        LDI r4, 0x1001\n\
        LOAD r1, r4\n\
        LDI r4, 0x1002\n\
        LOAD r2, r4\n\
        LDI r4, 0x1003\n\
        LOAD r3, r4\n\
        LDI r6, 0\n\
        PSET r0, r1, r6\n\
        ADD r0, r2\n\
        ADD r1, r3\n\
        BGE r0, r7, do_bounce_x\n\
        BEQ r0, r8, do_bounce_x\n\
    after_bx:\n\
        LDI r4, 0x1000\n\
        STORE r4, r0\n\
        LDI r4, 0x1001\n\
        STORE r4, r1\n\
        LDI r4, 0x1002\n\
        STORE r4, r2\n\
        LDI r4, 0x1003\n\
        STORE r4, r3\n\
        HALT\n\
    do_bounce_x:\n\
        NOT r2\n\
        LDI r5, 1\n\
        ADD r2, r5\n\
        BGE r0, r7, chx\n\
        BEQ r0, r8, clx\n\
        JMP after_bx\n\
    chx:\n\
        LDI r0, 254\n\
        JMP after_bx\n\
    clx:\n\
        LDI r0, 1\n\
        JMP after_bx\n\
    ";
    let vm = run_src(src);
    assert!(vm.halted);
    // After x=254+1=255, bounce: x clamped to 254, dx negated to -1
    assert_eq!(ram_read(&vm, 0x1000), 254, "x should be clamped to 254");
    assert_eq!(
        ram_read(&vm, 0x1002),
        0xFFFFFFFF,
        "dx should be negated to -1 (0xFFFFFFFF)"
    );
}

#[test]
fn bounce_off_left_wall() {
    // Pixel at x=1, dx=-1(0xFFFFFFFF) → x becomes 0, should bounce
    let src = "\
        LDI r0, 1\n\
        LDI r4, 0x1000\n\
        STORE r4, r0\n\
        LDI r1, 128\n\
        LDI r4, 0x1001\n\
        STORE r4, r1\n\
        LDI r0, 0xFFFFFFFF\n\
        LDI r4, 0x1002\n\
        STORE r4, r0\n\
        LDI r0, 1\n\
        LDI r4, 0x1003\n\
        STORE r4, r0\n\
        LDI r7, 255\n\
        LDI r8, 0\n\
        LDI r4, 0x1000\n\
        LOAD r0, r4\n\
        LDI r4, 0x1001\n\
        LOAD r1, r4\n\
        LDI r4, 0x1002\n\
        LOAD r2, r4\n\
        LDI r4, 0x1003\n\
        LOAD r3, r4\n\
        LDI r6, 0\n\
        PSET r0, r1, r6\n\
        ADD r0, r2\n\
        ADD r1, r3\n\
        BGE r0, r7, do_bx\n\
        BEQ r0, r8, do_bx\n\
    abx:\n\
        LDI r4, 0x1000\n\
        STORE r4, r0\n\
        LDI r4, 0x1002\n\
        STORE r4, r2\n\
        HALT\n\
    do_bx:\n\
        NOT r2\n\
        LDI r5, 1\n\
        ADD r2, r5\n\
        BGE r0, r7, chx\n\
        BEQ r0, r8, clx\n\
        JMP abx\n\
    chx:\n\
        LDI r0, 254\n\
        JMP abx\n\
    clx:\n\
        LDI r0, 1\n\
        JMP abx\n\
    ";
    let vm = run_src(src);
    assert!(vm.halted);
    // x=1+0xFFFFFFFF=0, bounce: x clamped to 1, dx negated to 1
    assert_eq!(ram_read(&vm, 0x1000), 1, "x should be clamped to 1");
    assert_eq!(ram_read(&vm, 0x1002), 1, "dx should be negated to 1");
}

// ── SCREEN RENDERING TESTS ─────────────────────────────────────────

#[test]
fn bounce_pset_draws_pixel_on_screen() {
    // PSET should place a colored pixel at the specified coordinates
    let src = "\
        LDI r0, 50\n\
        LDI r1, 60\n\
        LDI r2, 0xFF0000\n\
        PSET r0, r1, r2\n\
        HALT\n\
    ";
    let vm = run_src(src);
    assert!(vm.halted);
    assert_eq!(
        screen_pixel(&vm, 50, 60),
        0xFF0000,
        "pixel at (50,60) should be red"
    );
}

#[test]
fn bounce_pset_erase_sets_black() {
    // PSET with 0 (black) should clear a pixel
    let src = "\
        LDI r0, 50\n\
        LDI r1, 60\n\
        LDI r2, 0xFF0000\n\
        PSET r0, r1, r2\n\
        LDI r2, 0\n\
        PSET r0, r1, r2\n\
        HALT\n\
    ";
    let vm = run_src(src);
    assert!(vm.halted);
    assert_eq!(
        screen_pixel(&vm, 50, 60),
        0,
        "pixel at (50,60) should be black after erase"
    );
}

#[test]
fn bounce_animation_produces_screen_content() {
    // Run the full bouncing_pixel.gasm program for a few frames
    let src = std::fs::read_to_string("programs/bouncing_pixel.gasm")
        .expect("should read bouncing_pixel.gasm");
    let asm = assembler::assemble(&src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);

    // Run first frame
    vm.run();
    assert!(
        vm.is_yielded() || vm.is_halted(),
        "should yield after first frame"
    );

    // Screen should have a green pixel somewhere
    assert!(
        screen_has_content(&vm),
        "screen should have at least one pixel drawn"
    );

    // Run a few more frames
    for _ in 0..5 {
        if vm.is_halted() {
            break;
        }
        vm.yielded = false;
        vm.run();
    }
    // Screen should still have content
    assert!(
        screen_has_content(&vm),
        "screen should still have content after multiple frames"
    );
}

// ── FULL PROGRAM TESTS ─────────────────────────────────────────────

#[test]
fn bounce_full_program_runs_multiple_frames() {
    // Run the bouncing pixel program and verify frame counting
    let src = std::fs::read_to_string("programs/bouncing_pixel.gasm")
        .expect("should read bouncing_pixel.gasm");
    let asm = assembler::assemble(&src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);

    let mut frames = 0u32;
    loop {
        vm.run();
        frames += 1;
        if vm.is_halted() {
            break;
        }
        if frames > 200 {
            break; // safety limit
        }
        vm.yielded = false;
    }

    // Program should have run some frames (max 100 bounces, but frames = bounces)
    assert!(
        frames >= 10,
        "should run at least 10 frames, got {}",
        frames
    );
    assert!(vm.is_halted(), "should eventually halt after max bounces");

    // Frame counter should be >= 100
    let frame_count = ram_read(&vm, 0x1004);
    assert!(
        frame_count >= 100,
        "frame counter should be >= 100, got {}",
        frame_count
    );
}

#[test]
fn bounce_position_stays_in_bounds() {
    // Run many frames and verify position never goes out of bounds
    let src = std::fs::read_to_string("programs/bouncing_pixel.gasm")
        .expect("should read bouncing_pixel.gasm");
    let asm = assembler::assemble(&src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);

    let mut frames = 0u32;
    loop {
        vm.run();
        frames += 1;

        // Check position bounds
        let x = ram_read(&vm, 0x1000);
        let y = ram_read(&vm, 0x1001);
        assert!(
            x <= 255,
            "x should be <= 255, got {} at frame {}",
            x,
            frames
        );
        assert!(
            y <= 255,
            "y should be <= 255, got {} at frame {}",
            y,
            frames
        );

        if vm.is_halted() {
            break;
        }
        if frames > 200 {
            break;
        }
        vm.yielded = false;
    }
}

#[test]
fn bounce_velocity_is_always_plus_or_minus_one() {
    // Velocity should always be 1 or 0xFFFFFFFF (-1)
    let src = std::fs::read_to_string("programs/bouncing_pixel.gasm")
        .expect("should read bouncing_pixel.gasm");
    let asm = assembler::assemble(&src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);

    let mut frames = 0u32;
    loop {
        vm.run();
        frames += 1;

        let dx = ram_read(&vm, 0x1002);
        let dy = ram_read(&vm, 0x1003);
        assert!(
            dx == 1 || dx == 0xFFFFFFFF,
            "dx should be 1 or -1, got 0x{:08X} at frame {}",
            dx,
            frames
        );
        assert!(
            dy == 1 || dy == 0xFFFFFFFF,
            "dy should be 1 or -1, got 0x{:08X} at frame {}",
            dy,
            frames
        );

        if vm.is_halted() {
            break;
        }
        if frames > 200 {
            break;
        }
        vm.yielded = false;
    }
}
