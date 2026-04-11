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

/// Inject a keypress and run enough cycles to process it.
/// show_room (Bresenham border drawing) takes ~14k cycles, so we use 20k.
fn send_key(vm: &mut Vm, key: u32) {
    vm.ram[0xFFF] = key;
    run_cycles(vm, 20000);
}

/// Get past the title screen: run init, then send any key.
fn skip_title(vm: &mut Vm) {
    run_cycles(vm, 500);
    send_key(vm, 0x20); // spacebar to clear title
    // show_room + game loop entry takes ~14k cycles, included in send_key
}

// Memory layout constants (from adventure.gasm header)
const ROOM_ADDR: usize = 0x1000;
const INVENTORY_ADDR: usize = 0x1001;
const GAME_STATE_ADDR: usize = 0x1002;
const EXIT_TABLE_BASE: usize = 0x2000;
const ITEM_TABLE_BASE: usize = 0x2100;

#[test]
fn test_adventure_assembles() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);
    assert!(!vm.halted, "adventure should not halt after title keypress");
}

#[test]
fn test_adventure_initial_state() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    assert_eq!(vm.ram[ROOM_ADDR], 0, "should start in room 0 (Dungeon Cell)");
    assert_eq!(vm.ram[INVENTORY_ADDR], 0, "should start with no items");
    assert_eq!(vm.ram[GAME_STATE_ADDR], 0, "game state should be 'playing'");
}

#[test]
fn test_adventure_exit_table_initialized() {
    let (mut vm, _) = load_adventure();
    // init_world runs before wait_key, so we just need enough cycles for init
    run_cycles(&mut vm, 200);

    // Room 0 (Dungeon Cell): N=0xFF, S=1, E=0xFF, W=0xFF
    assert_eq!(vm.ram[EXIT_TABLE_BASE], 0xFF, "room 0 north = wall");
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 1], 1, "room 0 south = room 1");
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 2], 0xFF, "room 0 east = wall");
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 3], 0xFF, "room 0 west = wall");

    // Room 2 (Junction): N=1, S=5, E=3, W=4
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 8], 1, "room 2 north = room 1");
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 9], 5, "room 2 south = room 5");
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 10], 3, "room 2 east = room 3");
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 11], 4, "room 2 west = room 4");

    // Room 5 (Exit): all walls
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 20], 0xFF, "room 5 north = wall");
    assert_eq!(vm.ram[EXIT_TABLE_BASE + 23], 0xFF, "room 5 west = wall");
}

#[test]
fn test_adventure_item_table_initialized() {
    let (mut vm, _) = load_adventure();
    run_cycles(&mut vm, 200);

    assert_eq!(vm.ram[ITEM_TABLE_BASE], 0, "rusty key in room 0");
    assert_eq!(vm.ram[ITEM_TABLE_BASE + 1], 3, "sword in room 3");
    assert_eq!(vm.ram[ITEM_TABLE_BASE + 2], 4, "scroll in room 4");
}

#[test]
fn test_adventure_move_south() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // In room 0, press 'S' to go south
    send_key(&mut vm, 0x53); // 'S'

    assert_eq!(vm.ram[ROOM_ADDR], 1, "should be in room 1 (Dark Corridor)");
    assert_eq!(vm.ram[GAME_STATE_ADDR], 0, "game still playing");
}

#[test]
fn test_adventure_move_blocked() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Try going north from room 0 (blocked)
    send_key(&mut vm, 0x4E); // 'N'

    assert_eq!(vm.ram[ROOM_ADDR], 0, "should still be in room 0");
    assert_eq!(vm.ram[GAME_STATE_ADDR], 0, "game still playing");
}

#[test]
fn test_adventure_take_key() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // In room 0, take the rusty key
    send_key(&mut vm, 0x54); // 'T' (take)

    assert_eq!(vm.ram[INVENTORY_ADDR] & 1, 1, "should have key (bit 0)");
    assert_eq!(vm.ram[ITEM_TABLE_BASE], 0xFF, "key should be marked as taken");
}

#[test]
fn test_adventure_take_nothing_in_empty_room() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Go to room 1 (corridor, no items)
    send_key(&mut vm, 0x53); // 'S'
    assert_eq!(vm.ram[ROOM_ADDR], 1);

    // Try to take (nothing there)
    send_key(&mut vm, 0x74); // 't' (lowercase)

    assert_eq!(vm.ram[INVENTORY_ADDR], 0, "should have no items");
}

#[test]
fn test_adventure_full_walkthrough() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Start in room 0 -- take the key
    assert_eq!(vm.ram[ROOM_ADDR], 0);
    send_key(&mut vm, 0x54); // 'T' take key
    assert_eq!(vm.ram[INVENTORY_ADDR] & 1, 1, "has key");

    // Go south to room 1 (corridor)
    send_key(&mut vm, 0x53); // 'S'
    assert_eq!(vm.ram[ROOM_ADDR], 1);

    // Go south to room 2 (junction)
    send_key(&mut vm, 0x53); // 'S'
    assert_eq!(vm.ram[ROOM_ADDR], 2);

    // Go east to room 3 (armory) -- take the sword
    send_key(&mut vm, 0x45); // 'E'
    assert_eq!(vm.ram[ROOM_ADDR], 3);
    send_key(&mut vm, 0x54); // 'T' take sword
    assert_eq!(vm.ram[INVENTORY_ADDR] & 2, 2, "has sword");

    // Go west back to room 2
    send_key(&mut vm, 0x57); // 'W'
    assert_eq!(vm.ram[ROOM_ADDR], 2);

    // Go west to room 4 (library) -- take the scroll
    send_key(&mut vm, 0x57); // 'W'
    assert_eq!(vm.ram[ROOM_ADDR], 4);
    send_key(&mut vm, 0x54); // 'T' take scroll
    assert_eq!(vm.ram[INVENTORY_ADDR] & 4, 4, "has scroll");

    // Go east back to room 2
    send_key(&mut vm, 0x45); // 'E'
    assert_eq!(vm.ram[ROOM_ADDR], 2);

    // Go south to room 5 (exit gate) -- we have the key, should WIN!
    send_key(&mut vm, 0x53); // 'S'
    assert_eq!(vm.ram[ROOM_ADDR], 5, "should be in room 5 (Exit Gate)");
    assert_eq!(vm.ram[GAME_STATE_ADDR], 1, "should have won!");
}

#[test]
fn test_adventure_locked_gate_without_key() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Rush to junction without key
    send_key(&mut vm, 0x53); // 'S' to room 1
    send_key(&mut vm, 0x53); // 'S' to room 2
    assert_eq!(vm.ram[ROOM_ADDR], 2);

    // Try south without key -- should be locked
    send_key(&mut vm, 0x53); // 'S' attempt

    // Should still be in room 2 (locked out)
    assert_eq!(vm.ram[ROOM_ADDR], 2, "should still be in junction (locked)");
    assert_eq!(vm.ram[GAME_STATE_ADDR], 0, "game still playing");
}

#[test]
fn test_adventure_quit() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Press 'Q' to quit
    send_key(&mut vm, 0x51); // 'Q'

    assert_eq!(vm.ram[GAME_STATE_ADDR], 2, "game state should be 'quit'");
}

#[test]
fn test_adventure_lowercase_commands() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Use lowercase 's' to go south
    send_key(&mut vm, 0x73); // 's'
    assert_eq!(vm.ram[ROOM_ADDR], 1, "lowercase 's' should work");

    // Use lowercase 'n' to go back north
    send_key(&mut vm, 0x6E); // 'n'
    assert_eq!(vm.ram[ROOM_ADDR], 0, "lowercase 'n' should work");
}

#[test]
fn test_adventure_look_command() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Press 'L' to look -- should just redisplay room, no state change
    send_key(&mut vm, 0x4C); // 'L'
    assert_eq!(vm.ram[ROOM_ADDR], 0, "look should not change room");
    assert_eq!(vm.ram[GAME_STATE_ADDR], 0, "game still playing");
}

#[test]
fn test_adventure_unknown_command() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Press 'X' -- unknown command
    send_key(&mut vm, 0x58); // 'X'
    assert_eq!(vm.ram[ROOM_ADDR], 0, "unknown cmd should not change room");
    assert_eq!(vm.ram[GAME_STATE_ADDR], 0, "game still playing");
}

#[test]
fn test_adventure_explore_all_rooms() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Room 0 -> south -> Room 1
    send_key(&mut vm, 0x53); // 'S'
    assert_eq!(vm.ram[ROOM_ADDR], 1);

    // Room 1 -> south -> Room 2
    send_key(&mut vm, 0x53); // 'S'
    assert_eq!(vm.ram[ROOM_ADDR], 2);

    // Room 2 -> east -> Room 3
    send_key(&mut vm, 0x45); // 'E'
    assert_eq!(vm.ram[ROOM_ADDR], 3);

    // Room 3 -> west -> Room 2
    send_key(&mut vm, 0x57); // 'W'
    assert_eq!(vm.ram[ROOM_ADDR], 2);

    // Room 2 -> west -> Room 4
    send_key(&mut vm, 0x57); // 'W'
    assert_eq!(vm.ram[ROOM_ADDR], 4);

    // Room 4 -> east -> Room 2
    send_key(&mut vm, 0x45); // 'E'
    assert_eq!(vm.ram[ROOM_ADDR], 2);

    // Room 2 -> north -> Room 1
    send_key(&mut vm, 0x4E); // 'N'
    assert_eq!(vm.ram[ROOM_ADDR], 1);

    // Room 1 -> north -> Room 0
    send_key(&mut vm, 0x4E); // 'N'
    assert_eq!(vm.ram[ROOM_ADDR], 0);
}

#[test]
fn test_adventure_take_sword_in_armory() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Navigate to armory: S, S, E
    send_key(&mut vm, 0x53); // 'S'
    send_key(&mut vm, 0x53); // 'S'
    send_key(&mut vm, 0x45); // 'E'
    assert_eq!(vm.ram[ROOM_ADDR], 3);

    // Take sword
    send_key(&mut vm, 0x54); // 'T'
    assert_eq!(vm.ram[INVENTORY_ADDR] & 2, 2, "should have sword (bit 1)");
    assert_eq!(vm.ram[ITEM_TABLE_BASE + 1], 0xFF, "sword marked as taken");
}

#[test]
fn test_adventure_take_scroll_in_library() {
    let (mut vm, _) = load_adventure();
    skip_title(&mut vm);

    // Navigate to library: S, S, W
    send_key(&mut vm, 0x53); // 'S'
    send_key(&mut vm, 0x53); // 'S'
    send_key(&mut vm, 0x57); // 'W'
    assert_eq!(vm.ram[ROOM_ADDR], 4);

    // Take scroll
    send_key(&mut vm, 0x54); // 'T'
    assert_eq!(vm.ram[INVENTORY_ADDR] & 4, 4, "should have scroll (bit 2)");
    assert_eq!(vm.ram[ITEM_TABLE_BASE + 2], 0xFF, "scroll marked as taken");
}
