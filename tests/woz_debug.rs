use geometry_os::assembler;
use geometry_os::preprocessor::Preprocessor;
use geometry_os::vm::Vm;
use std::path::Path;

fn get_cell(vm: &Vm, cx: usize, cy: usize) -> u8 {
    if cx < 32 && cy < 32 {
        vm.glyph_grid.cells[cy][cx].char_code
    } else {
        0
    }
}

#[test]
fn woz_debug_display() {
    let asm_path = Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("programs")
        .join("woz_monitor.asm");
    let source = std::fs::read_to_string(&asm_path).unwrap();
    let mut pp = Preprocessor::new();
    let preprocessed = pp.preprocess(&source);
    let result = assembler::assemble(&preprocessed, 0).unwrap();
    eprintln!("{} words", result.pixels.len());

    let mut vm = Vm::new();
    vm.ram.resize(0x8000, 0);
    vm.screen.resize(256 * 256, 0);
    for (i, &w) in result.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = w;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    for step in 0..50000 {
        if vm.halted {
            break;
        }
        vm.step();
        // Dump grid when we detect a FRAME executed
        if step < 10 {
            eprintln!("step={}: PC=0x{:04X}", step, vm.pc);
        }
    }

    eprintln!("halted={}, PC=0x{:04X}", vm.halted, vm.pc);

    // Show first 3 rows of the glyph grid
    eprintln!("Glyph grid rows 0-2:");
    for row in 0..3 {
        let mut line = String::new();
        for col in 0..32 {
            let c = get_cell(&vm, col, row);
            if c == 0 {
                line.push('.');
            } else {
                line.push(char::from_u32(c as u32).unwrap_or('?'));
            }
        }
        eprintln!("[{}] {}", row, line);
    }
}
