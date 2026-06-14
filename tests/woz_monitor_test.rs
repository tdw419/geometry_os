//! Test: woz_monitor.asm — Woz-style Memory Palace Monitor
//! Verifies it renders to the glyph grid

use geometry_os::assembler;
use geometry_os::preprocessor::Preprocessor;
use geometry_os::vm::Vm;
use std::path::Path;

fn get_cell_char(vm: &Vm, cx: usize, cy: usize) -> u8 {
    if cx < 32 && cy < 32 {
        vm.glyph_grid.cells[cy][cx].char_code
    } else {
        0
    }
}

#[test]
fn test_woz_monitor_loads() {
    let asm_path = Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("programs")
        .join("woz_monitor.asm");
    let source = std::fs::read_to_string(&asm_path).unwrap();
    let mut pp = Preprocessor::new();
    let preprocessed = pp.preprocess(&source);
    let result = assembler::assemble(&preprocessed, 0).expect("Assembly of woz_monitor.asm failed");

    eprintln!("woz_monitor loaded: {} words", result.pixels.len());

    let mut vm = Vm::new();
    vm.ram.resize(0x8000, 0);
    vm.screen.resize(256 * 256, 0);

    for (i, &word) in result.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = word;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run for enough steps to render
    for step in 0..50000 {
        if vm.halted {
            break;
        }
        vm.step();
    }

    // Check header: "Woz" at row 0, col 0
    assert_eq!(get_cell_char(&vm, 0, 0), b'W');
    assert_eq!(get_cell_char(&vm, 1, 0), b'o');
    assert_eq!(get_cell_char(&vm, 2, 0), b'z');

    // Check address display at row 2: "1000:"
    assert_eq!(get_cell_char(&vm, 0, 2), b'1');
    assert_eq!(get_cell_char(&vm, 1, 2), b'0');
    assert_eq!(get_cell_char(&vm, 2, 2), b'0');
    assert_eq!(get_cell_char(&vm, 3, 2), b'0');
    assert_eq!(get_cell_char(&vm, 4, 2), b':');

    // Check real hex values (STR_BUF=0x1000 contains "Woz\0" = 0x57, 0x6F, 0x7A, 0x00)
    // First byte 0x57 → hex "57"
    assert_eq!(get_cell_char(&vm, 6, 2), b'5');
    assert_eq!(get_cell_char(&vm, 7, 2), b'7');

    // Second byte 0x6F → hex "6F"
    assert_eq!(get_cell_char(&vm, 9, 2), b'6');
    assert_eq!(get_cell_char(&vm, 10, 2), b'F');

    // VM should still be running (main_loop has JMP main_loop)
    assert!(!vm.halted, "Monitor should loop forever (JMP main_loop)");

    eprintln!("✓ Woz Monitor display test PASSED");
}
