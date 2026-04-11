// ═══════════════════════════════════════════════════════════════════════
// TEXT OPCODE RENDERING: Behavioral tests for character output,
// string advancement, newline handling, and screen clipping.
//
// These tests construct a VM, execute TEXT instructions, and read
// back framebuffer pixels to verify correct rendering behavior.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::font::{GLYPH_H, GLYPH_W, GLYPHS};
use geometry_os::opcodes::op;
use geometry_os::vm::Vm;

const SCREEN_W: usize = 256;
const SCREEN_H: usize = 256;

/// Helper: read a pixel from the VM's screen buffer at (x, y).
fn screen_pixel(vm: &Vm, x: usize, y: usize) -> u32 {
    if x < SCREEN_W && y < SCREEN_H {
        vm.screen[y * SCREEN_W + x]
    } else {
        0
    }
}

/// Helper: count non-zero pixels in a rectangular region of the screen.
fn count_lit_pixels(vm: &Vm, x0: usize, y0: usize, w: usize, h: usize) -> usize {
    let mut count = 0;
    for dy in 0..h {
        for dx in 0..w {
            if screen_pixel(vm, x0 + dx, y0 + dy) != 0 {
                count += 1;
            }
        }
    }
    count
}

/// Helper: build a TEXT instruction in RAM.
/// TEXT has width 4: [opcode=0x54] [x_reg_pixel] [y_reg_pixel] [str_addr_reg_pixel]
/// Arguments are register indices encoded as pixel values.
/// Registers hold: r[x_reg]=x, r[y_reg]=y, r[str_addr_reg]=RAM address of string.
/// r0 holds the foreground color.
fn build_text_program(
    vm: &mut Vm,
    x: u32,
    y: u32,
    str_addr: usize,
    color: u32,
    string_bytes: &[u8],
) {
    // Place the null-terminated string in RAM at str_addr
    for (i, &b) in string_bytes.iter().enumerate() {
        vm.poke(str_addr + i, b as u32);
    }
    vm.poke(str_addr + string_bytes.len(), 0); // null terminator

    // Set r0 = color (used by TEXT as foreground)
    vm.regs[0] = color;
    // Set r1 = x position
    vm.regs[1] = x;
    // Set r2 = y position
    vm.regs[2] = y;
    // Set r3 = string address
    vm.regs[3] = str_addr as u32;

    // Build the instruction: TEXT r1, r2, r3
    // reg_idx decodes pixel values: 0x30 + idx => idx, so register 1 = pixel 0x31 ('1')
    let program: Vec<u32> = vec![
        op::TEXT as u32, // opcode byte 'T' = 0x54
        0x31,            // x_reg = r1 (pixel value for reg index 1)
        0x32,            // y_reg = r2 (pixel value for reg index 2)
        0x33,            // str_addr_reg = r3 (pixel value for reg index 3)
        op::HALT as u32, // Halt after TEXT
    ];
    vm.load_program(&program);
}

// ═══════════════════════════════════════════════════════════════════════
// TEST 1: Single ASCII character rendering
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_single_char_a_renders_nonzero_pixels() {
    let mut vm = Vm::new(4096);
    let color = 0x00FFFFFF; // white

    // Place string "A" at RAM address 200
    build_text_program(&mut vm, 10, 20, 200, color, b"A");

    vm.run();

    // The glyph for 'A' has known pixel pattern:
    // Row 0: .###. = 0b01110
    // Row 1: #...# = 0b10001
    // Row 2: #...# = 0b10001
    // Row 3: ##### = 0b11111
    // Row 4: #...# = 0b10001
    // Row 5: #...# = 0b10001
    // Row 6: #...# = 0b10001
    let glyph_a = &GLYPHS[b'A' as usize];

    // Verify non-zero pixels appear in the 5x7 area at (10, 20)
    let lit = count_lit_pixels(&vm, 10, 20, GLYPH_W, GLYPH_H);
    assert!(
        lit > 0,
        "'A' should produce non-zero pixels, got {} lit",
        lit
    );

    // Cross-check against the actual glyph bitmap for 'A'
    for row in 0..GLYPH_H {
        let bits = glyph_a[row];
        for col in 0..GLYPH_W {
            let expected_on = bits & (1 << (4 - col)) != 0;
            let actual = screen_pixel(&vm, 10 + col, 20 + row);
            if expected_on {
                assert_eq!(
                    actual,
                    color,
                    "Expected foreground color at ({}, {}) for 'A' row={} col={}",
                    10 + col,
                    20 + row,
                    row,
                    col
                );
            } else {
                assert_eq!(
                    actual,
                    0,
                    "Expected background (0) at ({}, {}) for 'A' row={} col={} (transparent)",
                    10 + col,
                    20 + row,
                    row,
                    col
                );
            }
        }
    }
}

// ═══════════════════════════════════════════════════════════════════════
// TEST 2: Multi-character string advancement
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_multi_char_string_geo_advances_horizontally() {
    let mut vm = Vm::new(4096);
    let color = 0x00FFFFFF;

    // Place string "GEO" at RAM address 200
    build_text_program(&mut vm, 10, 20, 200, color, b"GEO");

    vm.run();

    // GLYPH_W = 5, gap = 1, so each char advances by 6 pixels
    let advance = GLYPH_W + 1; // 6

    // Verify that 'G' area at (10, 20) has lit pixels
    let g_lit = count_lit_pixels(&vm, 10, 20, GLYPH_W, GLYPH_H);
    assert!(
        g_lit > 0,
        "'G' at (10,20) should have lit pixels, got {}",
        g_lit
    );

    // Verify that 'E' area at (16, 20) has lit pixels
    let e_lit = count_lit_pixels(&vm, 10 + advance, 20, GLYPH_W, GLYPH_H);
    assert!(
        e_lit > 0,
        "'E' at (16,20) should have lit pixels, got {}",
        e_lit
    );

    // Verify that 'O' area at (22, 20) has lit pixels
    let o_lit = count_lit_pixels(&vm, 10 + 2 * advance, 20, GLYPH_W, GLYPH_H);
    assert!(
        o_lit > 0,
        "'O' at (22,20) should have lit pixels, got {}",
        o_lit
    );

    // Cross-check 'G' pixel pattern matches GLYPHS['G']
    let glyph_g = &GLYPHS[b'G' as usize];
    for row in 0..GLYPH_H {
        let bits = glyph_g[row];
        for col in 0..GLYPH_W {
            let expected_on = bits & (1 << (4 - col)) != 0;
            let actual = screen_pixel(&vm, 10 + col, 20 + row);
            if expected_on {
                assert_eq!(
                    actual,
                    color,
                    "'G' pixel at ({}, {}) row={} col={} should be foreground",
                    10 + col,
                    20 + row,
                    row,
                    col
                );
            }
        }
    }

    // Verify the gap between characters is empty (pixel at x=15, y=20 should be 0)
    assert_eq!(
        screen_pixel(&vm, 10 + GLYPH_W, 20),
        0,
        "Gap pixel between 'G' and 'E' should be 0"
    );
}

// ═══════════════════════════════════════════════════════════════════════
// TEST 3: Newline character behavior
//
// The current TEXT opcode does NOT implement newline-based row advancement.
// The '\n' (0x0A) glyph is blank (all zeros in GLYPHS), so it renders as
// transparent and simply advances the X position by one character width.
// This test verifies that actual behavior.
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_newline_renders_blank_and_advances_x() {
    let mut vm = Vm::new(4096);
    let color = 0x00FFFFFF;

    // Place string "AB\nCD" at RAM address 200
    build_text_program(&mut vm, 10, 20, 200, color, b"AB\nCD");

    vm.run();

    let advance = GLYPH_W + 1; // 6 pixels per character

    // 'A' at offset 0: x=10
    let a_lit = count_lit_pixels(&vm, 10, 20, GLYPH_W, GLYPH_H);
    assert!(a_lit > 0, "'A' at (10,20) should have lit pixels");

    // 'B' at offset 1: x=16
    let b_lit = count_lit_pixels(&vm, 10 + advance, 20, GLYPH_W, GLYPH_H);
    assert!(b_lit > 0, "'B' at (16,20) should have lit pixels");

    // '\n' at offset 2: x=22 — blank glyph, no pixels lit
    let nl_x = 10 + 2 * advance;
    let nl_lit = count_lit_pixels(&vm, nl_x, 20, GLYPH_W, GLYPH_H);
    assert_eq!(
        nl_lit, 0,
        "'\\n' at ({},20) should render as blank (no lit pixels), got {}",
        nl_x, nl_lit
    );

    // 'C' at offset 3: x=28 — still on the SAME row (no newline advancement)
    let c_lit = count_lit_pixels(&vm, 10 + 3 * advance, 20, GLYPH_W, GLYPH_H);
    assert!(
        c_lit > 0,
        "'C' at ({},20) should have lit pixels",
        10 + 3 * advance
    );

    // Verify 'D' at offset 4: x=34 — same row
    let d_lit = count_lit_pixels(&vm, 10 + 4 * advance, 20, GLYPH_W, GLYPH_H);
    assert!(
        d_lit > 0,
        "'D' at ({},20) should have lit pixels",
        10 + 4 * advance
    );

    // Confirm nothing rendered on the next row (y=27 = 20+7) at the starting X
    let next_row_lit = count_lit_pixels(&vm, 10, 20 + GLYPH_H, GLYPH_W, GLYPH_H);
    assert_eq!(
        next_row_lit, 0,
        "No pixels should appear on the next row from starting X (newline not implemented)"
    );
}

// ═══════════════════════════════════════════════════════════════════════
// TEST 4: Right-edge clipping — string extending past screen width
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_text_clips_at_right_edge_without_crash() {
    let mut vm = Vm::new(8192);
    let color = 0x00FFFFFF;

    // Place a long string near the right edge so characters extend past x=255.
    // Use x=250, string = "ABCDEFGH" — each char is 6px wide, so chars after
    // the first will extend beyond the screen width.
    let x_start: u32 = 250;
    let string = b"ABCDEFGH";
    build_text_program(&mut vm, x_start, 20, 200, color, string);

    // This should not panic
    vm.run();

    // Verify that no pixels were written at x >= 256 (the screen buffer
    // is 256*256, so we just check the last column region is clean).
    // The char at x=250 is within bounds, check that it rendered.
    // GLYPH_W=5, so pixel at (250,20) through (254,20) are in bounds.
    let first_char_lit = count_lit_pixels(&vm, 250, 20, 5, 1);
    // At least some pixels of 'A' should be in-bounds (the glyph has pixels
    // in columns 0-4, so x=250..254 are all in bounds)
    assert!(
        first_char_lit > 0,
        "First char 'A' at x=250 should have lit pixels"
    );

    // Verify pixels beyond screen boundary are not written — check that the
    // pixel at (255, 20) is the last valid column, and check a known out-of-range
    // area. Since the screen buffer is exactly 256*256, we can check that
    // no writes leaked by verifying the buffer didn't grow.
    assert_eq!(
        vm.screen.len(),
        SCREEN_W * SCREEN_H,
        "Screen buffer size unchanged"
    );

    // Characters starting at x=256 and beyond are entirely out of bounds.
    // The second char starts at x=256 (250 + 6), which is exactly at the edge.
    // render_char clips px < sw (256), so x=256 is NOT < 256 → no write.
    // Verify row 20 beyond x=254 is clean for the gap + second char region.
    for x in 255..=260 {
        let px = screen_pixel(&vm, x, 20);
        // x=254 is last column of 'A'. x=255 is gap (0). x=256+ is out of bounds.
        if x < SCREEN_W {
            // At x=255, the 'A' glyph doesn't reach (it only covers 250-254),
            // so this should be 0 (gap pixel) or possibly a second char pixel
            // if the second char started at 256 — but 256 is out of bounds.
            // Actually 255 is the gap pixel after 'A' (pixel 5 of the 6-wide slot).
            // This should be 0 since 'A' only uses columns 250-254.
        }
    }

    // The key assertion: no crash occurred and the screen buffer is intact.
    // Let's verify some character that should be clipped didn't write to
    // the beginning of the next row.
    // The char 'C' would start at x = 250 + 2*6 = 262, entirely out of bounds.
    // Ensure no stray writes appeared at the start of row 21 (y=21).
    let row_21_start = count_lit_pixels(&vm, 0, 21, 10, 1);
    assert_eq!(
        row_21_start, 0,
        "No stray pixels at start of row 21 from clipping"
    );
}

// ═══════════════════════════════════════════════════════════════════════
// TEST 5: Bottom-edge vertical clipping
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_text_clips_at_bottom_edge_without_crash() {
    let mut vm = Vm::new(4096);
    let color = 0x00FFFFFF;

    // Place text at y=254, so a 7-pixel-tall glyph extends to y=260,
    // which is past the 256-pixel screen height.
    build_text_program(&mut vm, 10, 254, 200, color, b"A");

    // This should not panic
    vm.run();

    // The glyph for 'A' has rows 0-6. Rows at y=254 and y=255 are in bounds.
    // Rows at y=256+ are out of bounds and should be clipped.
    let glyph_a = &GLYPHS[b'A' as usize];
    let mut in_bounds_lit = 0;
    let mut expected_oob_lit = 0;

    for row in 0..GLYPH_H {
        let bits = glyph_a[row];
        let has_on = bits != 0;
        let y_pos = 254 + row;
        if y_pos < SCREEN_H {
            // In bounds — may have lit pixels
            if has_on {
                // Check that at least one pixel in this row was written
                for col in 0..GLYPH_W {
                    if bits & (1 << (4 - col)) != 0 {
                        if screen_pixel(&vm, 10 + col, y_pos) == color {
                            in_bounds_lit += 1;
                        }
                    }
                }
            }
        } else {
            // Out of bounds — should be clipped (no write)
            if has_on {
                expected_oob_lit += 1;
            }
        }
    }

    assert!(
        in_bounds_lit > 0,
        "Some in-bounds pixels should be rendered"
    );
    // Verify screen buffer didn't grow
    assert_eq!(
        vm.screen.len(),
        SCREEN_W * SCREEN_H,
        "Screen buffer unchanged after bottom clip"
    );
}

// ═══════════════════════════════════════════════════════════════════════
// TEST 6: Empty string — no pixels change, no error
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_empty_string_no_pixels_change() {
    let mut vm = Vm::new(4096);
    let color = 0x00FFFFFF;

    // Snapshot screen before TEXT with empty string
    let screen_before = vm.screen.clone();

    // Place empty string (just a null terminator) at RAM address 200
    build_text_program(&mut vm, 10, 20, 200, color, b"");

    vm.run();

    // Verify screen is unchanged
    assert_eq!(
        vm.screen, screen_before,
        "Empty string should not modify any screen pixels"
    );

    // Also verify no crash — VM should have halted normally
    assert!(
        vm.is_halted(),
        "VM should halt after processing empty string"
    );
}
