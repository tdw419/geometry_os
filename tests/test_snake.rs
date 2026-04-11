use geometry_os::assembler;
use geometry_os::vm::Vm;
use std::path::Path;

/// Assemble snake.gasm into a fresh VM
fn load_snake() -> (Vm, assembler::Assembled) {
    let path = Path::new("programs/snake.gasm");
    let asm = assembler::assemble_file(path, &[Path::new(".")])
        .expect("snake.gasm should assemble");
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);
    (vm, asm)
}

/// Run VM for N cycles (stop early if halted)
fn run_cycles(vm: &mut Vm, n: usize) {
    for _ in 0..n {
        if vm.halted { break; }
        vm.step();
    }
}

// Memory layout constants
const DIR_ADDR: usize = 0x1000;
const LEN_ADDR: usize = 0x1001;
const FOOD_X_ADDR: usize = 0x1002;
const FOOD_Y_ADDR: usize = 0x1003;
const GAMEOVER_ADDR: usize = 0x1004;
const FRAME_ADDR: usize = 0x1005;
const BODY_ADDR: usize = 0x1100;

// The snake moves ~1 cell per ~200 VM cycles.
// Init takes ~200 cycles, so we check state at different points.

#[test]
fn test_snake_assembles() {
    let (mut vm, _) = load_snake();
    run_cycles(&mut vm, 5000);
    assert!(!vm.halted);
}

#[test]
fn test_snake_initial_state() {
    let (mut vm, _) = load_snake();
    // Run just past init -- ~200 cycles gets us into game_loop
    run_cycles(&mut vm, 300);
    
    // Check direction = 1 (right)
    assert_eq!(vm.ram[DIR_ADDR], 1, "initial direction should be right");
    
    // Check length = 3
    assert_eq!(vm.ram[LEN_ADDR], 3, "initial length should be 3");
    
    // Check game not over
    assert_eq!(vm.ram[GAMEOVER_ADDR], 0, "game should not be over");
    
    // Check body positions: tail=(5,15), mid=(6,15), head=(7,15)
    assert_eq!(vm.ram[BODY_ADDR], 5, "body[0].x = 5 (tail)");
    assert_eq!(vm.ram[BODY_ADDR + 1], 15, "body[0].y = 15");
    assert_eq!(vm.ram[BODY_ADDR + 2], 6, "body[1].x = 6");
    assert_eq!(vm.ram[BODY_ADDR + 3], 15, "body[1].y = 15");
    assert_eq!(vm.ram[BODY_ADDR + 4], 7, "body[2].x = 7 (head)");
    assert_eq!(vm.ram[BODY_ADDR + 5], 15, "body[2].y = 15");
}

#[test]
fn test_snake_moves_right() {
    let (mut vm, _) = load_snake();
    // Run 1000 cycles -- snake should have moved several cells
    run_cycles(&mut vm, 1000);
    
    let len = vm.ram[LEN_ADDR] as usize;
    let head_x = vm.ram[BODY_ADDR + (len - 1) * 2];
    
    // Head should be past initial position (7)
    assert!(head_x > 7, "head should have moved right, got x={}", head_x);
    assert_eq!(vm.ram[GAMEOVER_ADDR], 0, "game should not be over yet");
}

#[test]
fn test_snake_direction_change_via_keyboard() {
    let (mut vm, _) = load_snake();
    // Run into game loop first
    run_cycles(&mut vm, 300);
    
    // Inject W key (0x77) -- up
    vm.ram[0xFFF] = 0x77;
    
    // Run a few more cycles so game loop processes the key
    run_cycles(&mut vm, 300);
    
    assert_eq!(vm.ram[DIR_ADDR], 0, "direction should be up (0) after W key");
    assert_eq!(vm.ram[GAMEOVER_ADDR], 0, "game should still be running");
}

#[test]
fn test_snake_all_direction_keys() {
    let cases = [
        (0x77, 0u32, "W=up"),
        (0x64, 1u32, "D=right"),
        (0x73, 2u32, "S=down"),
        (0x61, 3u32, "A=left"),
    ];
    
    for (key, expected_dir, label) in cases {
        let (mut vm, _) = load_snake();
        run_cycles(&mut vm, 300);
        
        vm.ram[0xFFF] = key;
        run_cycles(&mut vm, 300);
        
        assert_eq!(
            vm.ram[DIR_ADDR], expected_dir,
            "{}: direction should be {} after key 0x{:02X}",
            label, expected_dir, key
        );
    }
}

#[test]
fn test_snake_wall_collision() {
    let (mut vm, _) = load_snake();
    // Run into game loop
    run_cycles(&mut vm, 300);
    
    // Place head near right wall
    vm.ram[DIR_ADDR] = 1; // right
    vm.ram[BODY_ADDR + 4] = 30; // head.x near wall
    vm.ram[BODY_ADDR + 5] = 15;
    vm.ram[BODY_ADDR + 2] = 28;
    vm.ram[BODY_ADDR + 3] = 15;
    vm.ram[BODY_ADDR] = 27;
    vm.ram[BODY_ADDR + 1] = 15;
    // Move food away
    vm.ram[FOOD_X_ADDR] = 5;
    vm.ram[FOOD_Y_ADDR] = 5;
    
    // Run one step
    run_cycles(&mut vm, 500);
    
    assert_eq!(vm.ram[GAMEOVER_ADDR], 1, "should die hitting right wall");
}

#[test]
fn test_snake_self_collision() {
    let (mut vm, _) = load_snake();
    run_cycles(&mut vm, 300);
    
    // Set up: head going left, will collide with body[1]
    vm.ram[DIR_ADDR] = 3; // left
    vm.ram[LEN_ADDR] = 4;
    vm.ram[BODY_ADDR] = 12;     // tail.x
    vm.ram[BODY_ADDR + 1] = 15;
    vm.ram[BODY_ADDR + 2] = 8;  // body[1].x (collision target)
    vm.ram[BODY_ADDR + 3] = 15;
    vm.ram[BODY_ADDR + 4] = 10; // body[2].x
    vm.ram[BODY_ADDR + 5] = 15;
    vm.ram[BODY_ADDR + 6] = 9;  // head.x
    vm.ram[BODY_ADDR + 7] = 15;
    vm.ram[FOOD_X_ADDR] = 20;
    vm.ram[FOOD_Y_ADDR] = 20;
    
    run_cycles(&mut vm, 500);
    
    assert_eq!(vm.ram[GAMEOVER_ADDR], 1, "should die from self-collision");
}

#[test]
fn test_snake_eating_grows() {
    let (mut vm, _) = load_snake();
    run_cycles(&mut vm, 300);
    
    assert_eq!(vm.ram[LEN_ADDR], 3);
    
    // Place food one step ahead of head (direction=right)
    let head_x = vm.ram[BODY_ADDR + 4];
    let head_y = vm.ram[BODY_ADDR + 5];
    vm.ram[FOOD_X_ADDR] = head_x + 1;
    vm.ram[FOOD_Y_ADDR] = head_y;
    
    // Run one step -- should eat food
    run_cycles(&mut vm, 500);
    
    assert_eq!(vm.ram[LEN_ADDR], 4, "snake should grow to 4 after eating");
    assert_eq!(vm.ram[GAMEOVER_ADDR], 0, "game should still be running");
}

#[test]
fn test_snake_game_over_wait_for_key() {
    let (mut vm, _) = load_snake();
    run_cycles(&mut vm, 300);
    
    // Force death
    vm.ram[DIR_ADDR] = 1;
    vm.ram[BODY_ADDR + 4] = 30;
    vm.ram[BODY_ADDR + 5] = 15;
    vm.ram[BODY_ADDR + 2] = 28;
    vm.ram[BODY_ADDR + 3] = 15;
    vm.ram[BODY_ADDR] = 27;
    vm.ram[BODY_ADDR + 1] = 15;
    vm.ram[FOOD_X_ADDR] = 5;
    vm.ram[FOOD_Y_ADDR] = 5;
    
    // Run until game over is processed
    run_cycles(&mut vm, 2000);
    
    assert_eq!(vm.ram[GAMEOVER_ADDR], 1);
    assert!(!vm.halted, "VM should still run (waiting for key in game over screen)");
}

#[test]
fn test_snake_multiple_steps() {
    let (mut vm, _) = load_snake();
    // Run 2000 cycles -- snake should have moved ~8-9 cells right
    run_cycles(&mut vm, 2000);
    
    let len = vm.ram[LEN_ADDR] as usize;
    let head_x = vm.ram[BODY_ADDR + (len - 1) * 2];
    
    // Head should be around x=14-16 (started at 7, ~8 steps of 200 cycles)
    assert!(head_x > 10, "head should have advanced well past start, got x={}", head_x);
    assert_eq!(vm.ram[GAMEOVER_ADDR], 0, "game should not be over yet");
    assert_eq!(vm.ram[DIR_ADDR], 1, "direction should still be right");
}
