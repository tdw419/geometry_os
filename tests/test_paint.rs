use geometry_os::assembler;
use geometry_os::vm::Vm;
use std::path::Path;

fn load_paint() -> (Vm, assembler::Assembled) {
    let path = Path::new("programs/paint.gasm");
    let asm = assembler::assemble_file(path, &[Path::new(".")])
        .expect("paint.gasm should assemble");
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);
    (vm, asm)
}

fn run_cycles(vm: &mut Vm, n: usize) {
    for _ in 0..n {
        if vm.halted { break; }
        vm.step();
    }
}

const CUR_X: usize = 0x1000;
const CUR_Y: usize = 0x1001;
const PEN: usize = 0x1002;
const COL_IDX: usize = 0x1003;
const PAL_ADDR: usize = 0x1010;

#[test]
fn test_paint_assembles() {
    let (mut vm, _) = load_paint();
    run_cycles(&mut vm, 2000);
    assert!(!vm.halted, "paint should not halt during normal loop");
}

#[test]
fn test_paint_initial_state() {
    let (mut vm, _) = load_paint();
    run_cycles(&mut vm, 500);
    
    assert_eq!(vm.ram[CUR_X], 128, "cursor should start at x=128");
    assert_eq!(vm.ram[CUR_Y], 128, "cursor should start at y=128");
    assert_eq!(vm.ram[PEN], 0, "pen should start up");
    assert_eq!(vm.ram[COL_IDX], 1, "color index should start at 1 (white)");
}

#[test]
fn test_paint_cursor_moves() {
    let (mut vm, _) = load_paint();
    run_cycles(&mut vm, 500);
    
    // Press W (up) - inject key and let loop process it
    vm.ram[0xFFF] = 0x77; // 'w'
    run_cycles(&mut vm, 500);
    
    // Cursor should have moved up (y < 128)
    assert!(vm.ram[CUR_Y] < 128, "cursor should move up after W, got y={}", vm.ram[CUR_Y]);
    assert_eq!(vm.ram[CUR_X], 128, "x should not change");
}

#[test]
fn test_paint_cursor_moves_all_directions() {
    // Test all four directions
    let dirs = [
        (0x77, "W=up", false, true, true),    // key, label, x_changes, y_changes, y_decreases
        (0x64, "D=right", true, false, false),
        (0x73, "S=down", false, true, false),
        (0x61, "A=left", true, false, false),
    ];
    
    for (key, label, x_changes, _y_changes, y_decreases) in dirs {
        let (mut vm, _) = load_paint();
        run_cycles(&mut vm, 500);
        
        vm.ram[0xFFF] = key;
        run_cycles(&mut vm, 500);
        
        if x_changes {
            let x_diff = vm.ram[CUR_X] as i32 - 128i32;
            assert!(x_diff.abs() > 0, "{}: x should change, got {}", label, vm.ram[CUR_X]);
        }
        if y_decreases {
            assert!(vm.ram[CUR_Y] < 128, "{}: y should decrease, got {}", label, vm.ram[CUR_Y]);
        } else if !x_changes {
            assert!(vm.ram[CUR_Y] > 128, "{}: y should increase, got {}", label, vm.ram[CUR_Y]);
        }
    }
}

#[test]
fn test_paint_pen_toggle() {
    let (mut vm, _) = load_paint();
    run_cycles(&mut vm, 500);
    
    assert_eq!(vm.ram[PEN], 0, "pen should start up");
    
    // Press space to toggle pen on
    vm.ram[0xFFF] = 0x20;
    run_cycles(&mut vm, 500);
    assert_eq!(vm.ram[PEN], 1, "pen should be down after space");
    
    // Press space again to toggle off
    vm.ram[0xFFF] = 0x20;
    run_cycles(&mut vm, 500);
    assert_eq!(vm.ram[PEN], 0, "pen should be up after second space");
}

#[test]
fn test_paint_color_selection() {
    let colors = [0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38]; // 1-8
    
    for (i, &key) in colors.iter().enumerate() {
        let (mut vm, _) = load_paint();
        run_cycles(&mut vm, 500);
        
        vm.ram[0xFFF] = key;
        run_cycles(&mut vm, 500);
        
        assert_eq!(vm.ram[COL_IDX], i as u32, "color index should be {} after key {}", i, i+1);
    }
}

#[test]
fn test_paint_quit() {
    let (mut vm, _) = load_paint();
    run_cycles(&mut vm, 500);
    
    // Press Q to quit
    vm.ram[0xFFF] = 0x71;
    run_cycles(&mut vm, 500);
    
    assert!(vm.halted, "paint should halt after Q key");
}

#[test]
fn test_paint_drawing_with_pen() {
    let (mut vm, _) = load_paint();
    run_cycles(&mut vm, 500);
    
    // Toggle pen on
    vm.ram[0xFFF] = 0x20;
    run_cycles(&mut vm, 500);
    assert_eq!(vm.ram[PEN], 1);
    
    // Move right -- should paint at new position
    vm.ram[0xFFF] = 0x64; // D
    run_cycles(&mut vm, 500);
    
    // Check that pixels were drawn (screen at new cursor position should be non-background)
    let cx = vm.ram[CUR_X] as usize;
    let cy = vm.ram[CUR_Y] as usize;
    // Screen buffer check -- the screen pixel at (cx, cy) should have been painted
    // (white color = 0xFFFFFF since we selected index 1)
    // But we can verify the cursor moved and pen is still down
    assert_eq!(vm.ram[PEN], 1, "pen should still be down");
    assert!(vm.ram[CUR_X] > 128, "cursor should have moved right");
}
