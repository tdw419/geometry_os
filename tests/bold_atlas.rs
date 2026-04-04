// Tests for the bold atlas builder program (GEO-17)
//
// Verifies that the bold_atlas_builder program:
// 1. Halts after processing all 128 chars
// 2. Populates the derived atlas at 0x00F10000
// 3. Keeps blank chars (0-31, 127) blank
// 4. Makes printable chars bolder: bold = row | (row >> 1)
// 5. Spot checks match the OR-based bold formula

use pixels_move_pixels::assembler::bold_atlas_builder;
use pixels_move_pixels::font_atlas::{FONT_BASE, FONT_CHAR_HEIGHT};
use pixels_move_pixels::software_vm::SoftwareVm;

const DERIVED_ATLAS_BASE: u32 = FONT_BASE + 0x10000; // 0x00F10000

/// Count set bits
fn popcount(v: u32) -> u32 {
    v.count_ones()
}

/// Run the bold atlas builder to completion across multiple frames.
fn run_to_completion(svm: &mut SoftwareVm) {
    for _ in 0..50 {
        let vm = svm.vm_state(0);
        if vm.halted == 1 {
            return;
        }
        svm.execute_frame();
    }
    panic!("bold_atlas_builder did not halt within 50 frames");
}

#[test]
fn bold_atlas_derived_is_populated() {
    let program = bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0, &program.pixels);
    svm.spawn_vm(0, 0);
    run_to_completion(&mut svm);

    let vm = svm.vm_state(0);
    assert_eq!(vm.halted, 1, "bold_atlas_builder should halt");

    let mut found_nonzero = false;
    for ascii in 32..=126u32 {
        let row0 = svm.peek(DERIVED_ATLAS_BASE + ascii * 8);
        if row0 != 0 {
            found_nonzero = true;
            break;
        }
    }
    assert!(
        found_nonzero,
        "derived atlas should have non-zero entries for printable chars"
    );
}

#[test]
fn bold_atlas_blank_chars_stay_blank() {
    let program = bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0, &program.pixels);
    svm.spawn_vm(0, 0);
    run_to_completion(&mut svm);

    // Control chars 0-31 remain blank
    for ascii in 0..=31u32 {
        for row in 0..FONT_CHAR_HEIGHT {
            let val = svm.peek(DERIVED_ATLAS_BASE + ascii * 8 + row);
            assert_eq!(
                val, 0,
                "blank char {} row {} should be 0, got 0x{:08X}",
                ascii, row, val
            );
        }
    }

    // DEL char 127 also blank
    for row in 0..FONT_CHAR_HEIGHT {
        let val = svm.peek(DERIVED_ATLAS_BASE + 127 * 8 + row);
        assert_eq!(
            val, 0,
            "DEL char 127 row {} should be 0, got 0x{:08X}",
            row, val
        );
    }
}

#[test]
fn bold_atlas_printable_chars_have_more_or_equal_bits() {
    let program = bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0, &program.pixels);
    svm.spawn_vm(0, 0);
    run_to_completion(&mut svm);

    // For every printable char (33-126), bold should have >= as many set bits
    // as the original (OR never removes bits, only adds)
    for ascii in 33..=126u32 {
        for row in 0..FONT_CHAR_HEIGHT {
            let orig = svm.peek(FONT_BASE + ascii * 8 + row);
            let bold = svm.peek(DERIVED_ATLAS_BASE + ascii * 8 + row);
            if orig == 0 {
                assert_eq!(bold, 0, "blank row should stay blank");
            } else {
                // Bold = row | (row >> 1), so bold always >= orig
                assert!(
                    bold >= orig,
                    "char {} row {}: bold 0x{:02X} should be >= orig 0x{:02X}",
                    ascii, row, bold, orig
                );
            }
        }
    }
}

#[test]
fn bold_atlas_spot_check_h() {
    let program = bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0, &program.pixels);
    svm.spawn_vm(0, 0);
    run_to_completion(&mut svm);

    // Spot check: 'H' (ASCII 72) bold rows = orig | (orig >> 1)
    let h_ascii: u32 = 72;
    for row in 0..FONT_CHAR_HEIGHT {
        let orig = svm.peek(FONT_BASE + h_ascii * 8 + row);
        let bold = svm.peek(DERIVED_ATLAS_BASE + h_ascii * 8 + row);
        let expected = orig | (orig >> 1);
        assert_eq!(
            bold, expected,
            "H row {}: bold should be 0x{:02X} (0x{:02X} | 0x{:02X}), got 0x{:02X}",
            row, expected, orig, orig >> 1, bold
        );
    }
}

#[test]
fn bold_atlas_spot_check_a_and_0() {
    let program = bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0, &program.pixels);
    svm.spawn_vm(0, 0);
    run_to_completion(&mut svm);

    // Spot check 'A' (ASCII 65)
    for row in 0..FONT_CHAR_HEIGHT {
        let orig = svm.peek(FONT_BASE + 65 * 8 + row);
        let bold = svm.peek(DERIVED_ATLAS_BASE + 65 * 8 + row);
        assert_eq!(bold, orig | (orig >> 1), "A row {} bold mismatch", row);
    }

    // Spot check '0' (ASCII 48)
    for row in 0..FONT_CHAR_HEIGHT {
        let orig = svm.peek(FONT_BASE + 48 * 8 + row);
        let bold = svm.peek(DERIVED_ATLAS_BASE + 48 * 8 + row);
        assert_eq!(bold, orig | (orig >> 1), "0 row {} bold mismatch", row);
    }
}

#[test]
fn bold_atlas_space_stays_blank() {
    let program = bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0, &program.pixels);
    svm.spawn_vm(0, 0);
    run_to_completion(&mut svm);

    // Space (ASCII 32) has all-zero rows; 0 | (0 >> 1) = 0
    for row in 0..FONT_CHAR_HEIGHT {
        let bold = svm.peek(DERIVED_ATLAS_BASE + 32 * 8 + row);
        assert_eq!(bold, 0, "space row {} should remain 0", row);
    }
}

#[test]
fn bold_atlas_all_128_chars_complete() {
    let program = bold_atlas_builder();
    let mut svm = SoftwareVm::new();
    svm.load_font_atlas();
    svm.load_program(0, &program.pixels);
    svm.spawn_vm(0, 0);
    run_to_completion(&mut svm);

    // Verify every char: bold = orig | (orig >> 1)
    for ascii in 0u32..128 {
        for row in 0..FONT_CHAR_HEIGHT {
            let orig = svm.peek(FONT_BASE + ascii * 8 + row);
            let expected = orig | (orig >> 1);
            let actual = svm.peek(DERIVED_ATLAS_BASE + ascii * 8 + row);
            assert_eq!(
                actual, expected,
                "char {} row {}: expected 0x{:02X}, got 0x{:02X}",
                ascii, row, expected, actual
            );
        }
    }
}
