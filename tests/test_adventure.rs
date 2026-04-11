use geometry_os::assembler;
use geometry_os::vm::Vm;
use std::path::Path;

/// Assemble adventure.gasm into a fresh VM
fn load_adventure() -> (Vm, assembler::Assembled) {
    let path = Path::new("programs/adventure.gasm");
    let asm = assembler::assemble_file(path, &[Path::new(".")])
        .expect("adventure.gasm should assemble");
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);
    (vm, asm)
}

/// Run VM for N cycles (stop early if halted)
fn run_cycles(vm: &mut Vm, n: usize) {
    for _ in 0..n {
        if vm.halted {
            break;
        }
        vm.step();
    }
}

/// Feed a sequence of keypresses to the VM.
/// Waits for the VM to consume each key, then gives it time to process.
fn feed_keys(
    vm: &mut Vm,
    keys: &[u32],
    initial_delay: usize,
    process_time: usize,
    max_wait: usize,
) {
    run_cycles(vm, initial_delay);

    for &key in keys {
        vm.ram[0xFFF] = key;

        // Wait for the VM to consume it
        for _ in 0..max_wait {
            if vm.halted {
                return;
            }
            vm.step();
            if vm.ram[0xFFF] == 0 {
                break;
            }
        }

        // Give the VM time to process (rendering, etc.)
        run_cycles(vm, process_time);
    }
}

// Memory layout constants
const ROOM_ADDR: usize = 0x1000;
const INV_ADDR: usize = 0x1001;
const STATE_ADDR: usize = 0x1002;

#[test]
fn test_adventure_assembles() {
    let (mut vm, _) = load_adventure();
    run_cycles(&mut vm, 5000);
    assert!(!vm.halted, "adventure should not halt during init");
}

#[test]
fn test_adventure_initial_state() {
    let (mut vm, _) = load_adventure();
    run_cycles(&mut vm, 300);

    assert_eq!(vm.ram[0x2000], 0xFF, "room 0 north = wall");
    assert_eq!(vm.ram[0x2001], 1, "room 0 south = room 1");
    assert_eq!(vm.ram[0x2002], 0xFF, "room 0 east = wall");
    assert_eq!(vm.ram[0x2003], 0xFF, "room 0 west = wall");

    assert_eq!(vm.ram[0x2008], 1, "room 2 north = room 1");
    assert_eq!(vm.ram[0x2009], 5, "room 2 south = room 5 (exit)");
    assert_eq!(vm.ram[0x200A], 3, "room 2 east = room 3");
    assert_eq!(vm.ram[0x200B], 4, "room 2 west = room 4");

    assert_eq!(vm.ram[0x2100], 0, "rusty key in room 0");
    assert_eq!(vm.ram[0x2101], 3, "sword in room 3");
    assert_eq!(vm.ram[0x2102], 4, "scroll in room 4");
}

#[test]
fn test_adventure_press_key_starts_game() {
    let (mut vm, _) = load_adventure();
    feed_keys(&mut vm, &[0x20], 500, 10000, 5000);

    assert_eq!(vm.ram[ROOM_ADDR], 0, "should start in room 0");
    assert_eq!(vm.ram[STATE_ADDR], 0, "game should be playing");
    assert!(!vm.halted);
}

#[test]
fn test_adventure_move_south() {
    let (mut vm, _) = load_adventure();
    feed_keys(&mut vm, &[0x20, 0x73], 500, 10000, 5000);
    assert_eq!(vm.ram[ROOM_ADDR], 1, "should be in room 1 after south");
}

#[test]
fn test_adventure_move_blocked() {
    let (mut vm, _) = load_adventure();
    feed_keys(&mut vm, &[0x20, 0x6E], 500, 10000, 5000);
    assert_eq!(vm.ram[ROOM_ADDR], 0, "should stay in room 0");
}

#[test]
fn test_adventure_navigate_to_junction() {
    let (mut vm, _) = load_adventure();
    feed_keys(&mut vm, &[0x20, 0x73, 0x73], 500, 10000, 5000);
    assert_eq!(vm.ram[ROOM_ADDR], 2, "should be in room 2 (Junction)");
}

#[test]
fn test_adventure_take_key() {
    let (mut vm, _) = load_adventure();
    feed_keys(&mut vm, &[0x20, 0x74], 500, 10000, 5000);
    assert_eq!(vm.ram[INV_ADDR] & 1, 1, "should have the rusty key");
    assert_eq!(vm.ram[0x2100], 0xFF, "key marked as taken");
}

#[test]
fn test_adventure_locked_exit() {
    let (mut vm, _) = load_adventure();
    feed_keys(&mut vm, &[0x20, 0x73, 0x73, 0x73], 500, 10000, 5000);
    assert_eq!(vm.ram[ROOM_ADDR], 2, "should be blocked at locked gate");
}

#[test]
fn test_adventure_win_condition() {
    let (mut vm, _) = load_adventure();
    feed_keys(&mut vm, &[0x20, 0x74, 0x73, 0x73, 0x73], 500, 10000, 5000);
    assert_eq!(vm.ram[STATE_ADDR], 1, "game state should be 1 (won)");
}

#[test]
fn test_adventure_quit() {
    let (mut vm, _) = load_adventure();
    feed_keys(&mut vm, &[0x20, 0x71], 500, 10000, 5000);
    assert_eq!(vm.ram[STATE_ADDR], 2, "game state should be 2 (quit)");
}

#[test]
fn test_adventure_full_journey() {
    let (mut vm, _) = load_adventure();
    feed_keys(
        &mut vm,
        &[
            0x20, // title
            0x74, // take key
            0x73, // south to corridor
            0x73, // south to junction
            0x65, // east to armory
            0x74, // take sword
            0x77, // west to junction
            0x73, // south to exit = WIN
        ],
        500,
        10000,
        5000,
    );

    assert_eq!(vm.ram[INV_ADDR] & 1, 1, "should have the rusty key");
    assert_eq!(vm.ram[INV_ADDR] & 2, 2, "should have the sword");
    assert_eq!(vm.ram[STATE_ADDR], 1, "should win the game!");
}

#[test]
fn test_adventure_navigate_all_rooms() {
    let (mut vm, _) = load_adventure();
    feed_keys(
        &mut vm,
        &[
            0x20, // title
            0x73, // room 1
            0x73, // room 2
            0x65, // room 3
            0x77, // back to room 2
            0x77, // room 4
            0x65, // back to room 2
        ],
        500,
        10000,
        5000,
    );
    assert_eq!(vm.ram[ROOM_ADDR], 2, "should end at junction");
    assert_eq!(vm.ram[STATE_ADDR], 0, "game should still be playing");
}
