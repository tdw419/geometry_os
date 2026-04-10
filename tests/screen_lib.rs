// ═══════════════════════════════════════════════════════════════════════
// SCREEN LIBRARY TESTS: lib/screen.gasm routines
//
// Tests for clear_screen, draw_line (Bresenham), and draw_rect_border.
// Screen is 256x256 pixels, memory-mapped as screen[y * 256 + x].
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

/// Helper: read the screen.gasm source and prepend a caller.
/// Strips the leading comment block (everything before first label).
fn make_screen_test(caller: &str) -> String {
    let screen_src = include_str!("../lib/screen.gasm");

    // Strip leading comment block
    let mut lib_start = 0;
    for line in screen_src.lines() {
        let trimmed = line.trim();
        if trimmed.is_empty() || trimmed.starts_with(';') {
            lib_start += line.len() + 1;
        } else {
            break;
        }
    }
    let lib_body = &screen_src[lib_start..];

    format!("{}\n{}", caller, lib_body)
}

/// Helper: assemble and run a screen test program.
fn run_screen_test(src: &str) -> Vm {
    let asm = assembler::assemble(&src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();
    assert!(vm.halted, "VM should halt after test");
    vm
}

/// Helper: check if a screen pixel has the expected color.
fn check_pixel(vm: &Vm, x: usize, y: usize, expected_color: u32) -> bool {
    vm.screen[y * 256 + x] == expected_color
}

/// Helper: count how many pixels on screen match the given color.
fn count_pixels(vm: &Vm, color: u32) -> usize {
    vm.screen.iter().filter(|&&c| c == color).count()
}

// ── CLEAR_SCREEN TESTS ───────────────────────────────────────────────

#[test]
fn screen_clear_to_white() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFFFFFF\n\
         CALL clear_screen\n\
         HALT\n",
    ));
    assert_eq!(count_pixels(&vm, 0xFFFFFF), 256 * 256,
        "clear_screen should fill all pixels with white");
}

#[test]
fn screen_clear_to_red() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFF0000\n\
         CALL clear_screen\n\
         HALT\n",
    ));
    assert_eq!(count_pixels(&vm, 0xFF0000), 256 * 256,
        "clear_screen should fill all pixels with red");
}

#[test]
fn screen_clear_overwrites_existing() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFF0000\n\
         CALL clear_screen\n\
         LDI r0, 0x00FF00\n\
         CALL clear_screen\n\
         HALT\n",
    ));
    assert_eq!(count_pixels(&vm, 0xFF0000), 0,
        "first clear should be fully overwritten");
    assert_eq!(count_pixels(&vm, 0x00FF00), 256 * 256,
        "second clear should fill all pixels");
}

// ── DRAW_LINE TESTS ──────────────────────────────────────────────────

#[test]
fn screen_draw_line_horizontal() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFFFFFF\n\
         LDI r1, 10\n\
         LDI r2, 50\n\
         LDI r3, 20\n\
         LDI r4, 50\n\
         CALL draw_line\n\
         HALT\n",
    ));
    for x in 10..=20 {
        assert!(check_pixel(&vm, x, 50, 0xFFFFFF),
            "pixel at ({}, 50) should be white", x);
    }
    assert!(!check_pixel(&vm, 10, 51, 0xFFFFFF),
        "pixel at (10, 51) should NOT be white");
}

#[test]
fn screen_draw_line_vertical() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFF0000\n\
         LDI r1, 30\n\
         LDI r2, 10\n\
         LDI r3, 30\n\
         LDI r4, 20\n\
         CALL draw_line\n\
         HALT\n",
    ));
    for y in 10..=20 {
        assert!(check_pixel(&vm, 30, y, 0xFF0000),
            "pixel at (30, {}) should be red", y);
    }
    assert!(!check_pixel(&vm, 31, 15, 0xFF0000),
        "pixel at (31, 15) should NOT be red");
}

#[test]
fn screen_draw_line_diagonal() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0x00FF00\n\
         LDI r1, 5\n\
         LDI r2, 5\n\
         LDI r3, 15\n\
         LDI r4, 15\n\
         CALL draw_line\n\
         HALT\n",
    ));
    for i in 0..=10 {
        assert!(check_pixel(&vm, 5 + i, 5 + i, 0x00FF00),
            "pixel at ({}, {}) should be green", 5 + i, 5 + i);
    }
}

#[test]
fn screen_draw_line_reverse_horizontal() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFFFFFF\n\
         LDI r1, 20\n\
         LDI r2, 50\n\
         LDI r3, 10\n\
         LDI r4, 50\n\
         CALL draw_line\n\
         HALT\n",
    ));
    for x in 10..=20 {
        assert!(check_pixel(&vm, x, 50, 0xFFFFFF),
            "pixel at ({}, 50) should be white (reverse line)", x);
    }
}

#[test]
fn screen_draw_line_single_pixel() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0x0000FF\n\
         LDI r1, 42\n\
         LDI r2, 42\n\
         LDI r3, 42\n\
         LDI r4, 42\n\
         CALL draw_line\n\
         HALT\n",
    ));
    assert!(check_pixel(&vm, 42, 42, 0x0000FF),
        "single-pixel line should draw at (42, 42)");
    assert_eq!(count_pixels(&vm, 0x0000FF), 1,
        "only 1 pixel should be colored");
}

#[test]
fn screen_draw_line_reverse_vertical() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFFFF00\n\
         LDI r1, 40\n\
         LDI r2, 60\n\
         LDI r3, 40\n\
         LDI r4, 50\n\
         CALL draw_line\n\
         HALT\n",
    ));
    for y in 50..=60 {
        assert!(check_pixel(&vm, 40, y, 0xFFFF00),
            "pixel at (40, {}) should be yellow (reverse vertical)", y);
    }
}

// ── DRAW_RECT_BORDER TESTS ───────────────────────────────────────────

#[test]
fn screen_draw_rect_border_basic() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFFFFFF\n\
         LDI r1, 20\n\
         LDI r2, 30\n\
         LDI r3, 10\n\
         LDI r4, 8\n\
         CALL draw_rect_border\n\
         HALT\n",
    ));
    let color = 0xFFFFFF;

    // Check corners
    assert!(check_pixel(&vm, 20, 30, color), "top-left corner");
    assert!(check_pixel(&vm, 29, 30, color), "top-right corner");
    assert!(check_pixel(&vm, 20, 37, color), "bottom-left corner");
    assert!(check_pixel(&vm, 29, 37, color), "bottom-right corner");

    // Check top edge (y=30, x=20..29)
    for x in 20..=29 {
        assert!(check_pixel(&vm, x, 30, color), "top edge at x={}", x);
    }
    // Check bottom edge (y=37, x=20..29)
    for x in 20..=29 {
        assert!(check_pixel(&vm, x, 37, color), "bottom edge at x={}", x);
    }
    // Check left edge (x=20, y=30..37)
    for y in 30..=37 {
        assert!(check_pixel(&vm, 20, y, color), "left edge at y={}", y);
    }
    // Check right edge (x=29, y=30..37)
    for y in 30..=37 {
        assert!(check_pixel(&vm, 29, y, color), "right edge at y={}", y);
    }

    // Interior should be empty (not colored)
    assert!(!check_pixel(&vm, 25, 33, color), "interior should be empty");
    assert!(!check_pixel(&vm, 22, 35, color), "interior should be empty");
}

#[test]
fn screen_draw_rect_border_minimal() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFF0000\n\
         LDI r1, 5\n\
         LDI r2, 5\n\
         LDI r3, 2\n\
         LDI r4, 2\n\
         CALL draw_rect_border\n\
         HALT\n",
    ));
    let color = 0xFF0000;
    assert!(check_pixel(&vm, 5, 5, color), "(5,5)");
    assert!(check_pixel(&vm, 6, 5, color), "(6,5)");
    assert!(check_pixel(&vm, 5, 6, color), "(5,6)");
    assert!(check_pixel(&vm, 6, 6, color), "(6,6)");
    assert_eq!(count_pixels(&vm, color), 4, "2x2 rect should have exactly 4 border pixels");
}

#[test]
fn screen_draw_rect_border_preserves_color() {
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0xFF0000\n\
         LDI r1, 10\n\
         LDI r2, 10\n\
         LDI r3, 5\n\
         LDI r4, 5\n\
         CALL draw_rect_border\n\
         LDI r0, 0x00FF00\n\
         LDI r1, 20\n\
         LDI r2, 20\n\
         LDI r3, 5\n\
         LDI r4, 5\n\
         CALL draw_rect_border\n\
         HALT\n",
    ));
    assert!(check_pixel(&vm, 10, 10, 0xFF0000), "first rect corner should be red");
    assert!(check_pixel(&vm, 14, 14, 0xFF0000), "first rect corner should be red");
    assert!(check_pixel(&vm, 20, 20, 0x00FF00), "second rect corner should be green");
    assert!(check_pixel(&vm, 24, 24, 0x00FF00), "second rect corner should be green");
}

#[test]
fn screen_draw_rect_border_wide() {
    // Wide rectangle: 50x3
    let vm = run_screen_test(&make_screen_test(
        "LDI r0, 0x0000FF\n\
         LDI r1, 10\n\
         LDI r2, 100\n\
         LDI r3, 50\n\
         LDI r4, 3\n\
         CALL draw_rect_border\n\
         HALT\n",
    ));
    let color = 0x0000FF;
    // Top edge: y=100, x=10..59
    for x in 10..=59 {
        assert!(check_pixel(&vm, x, 100, color), "top edge at x={}", x);
    }
    // Bottom edge: y=102, x=10..59
    for x in 10..=59 {
        assert!(check_pixel(&vm, x, 102, color), "bottom edge at x={}", x);
    }
    // Left edge: x=10, y=100..102
    for y in 100..=102 {
        assert!(check_pixel(&vm, 10, y, color), "left edge at y={}", y);
    }
    // Right edge: x=59, y=100..102
    for y in 100..=102 {
        assert!(check_pixel(&vm, 59, y, color), "right edge at y={}", y);
    }
}
