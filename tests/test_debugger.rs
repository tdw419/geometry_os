use std::path::Path;

use geometry_os::assembler;
use geometry_os::assembler::assemble_file;
use geometry_os::vm::Vm;

fn assemble_debugger() -> assembler::Assembled {
    let path = Path::new("programs/mini-debugger.gasm");
    let inc = Path::new("lib");
    assemble_file(path, &[inc]).expect("mini-debugger should assemble")
}

fn run_vm(vm: &mut Vm) -> u32 {
    vm.run()
}

fn press_key(vm: &mut Vm, keycode: u32) -> u32 {
    vm.ram[0xFFF] = keycode;
    vm.run()
}

fn read_hex_string(vm: &Vm, addr: usize) -> String {
    let mut result = String::new();
    for i in 0..16 {
        let ch = vm.ram[addr + i];
        if ch == 0 {
            break;
        }
        result.push(ch as u8 as char);
    }
    result
}

// ── ASSEMBLY ──────────────────────────────────────────────────────────

#[test]
fn test_mini_debugger_assembles() {
    let path = Path::new("programs/mini-debugger.gasm");
    let inc = Path::new("lib");
    let result = assemble_file(path, &[inc]);
    match result {
        Ok(asm) => {
            println!("Assembled OK: {} pixels", asm.pixels.len());
            assert!(asm.pixels.len() > 0, "should produce bytecode");
        }
        Err(e) => {
            panic!("Assembly failed: {:?}", e);
        }
    }
}

#[test]
fn mini_debugger_has_expected_labels() {
    let asm = assemble_debugger();
    let labels = &asm.labels;
    assert!(labels.contains_key("main"), "should have main");
    assert!(labels.contains_key("main_loop"), "should have main_loop");
    assert!(labels.contains_key("update_regs"), "should have update_regs");
    assert!(labels.contains_key("draw_mem_dump"), "should have draw_mem_dump");
    assert!(labels.contains_key("word_to_hex"), "should have word_to_hex");
    assert!(labels.contains_key("cmd_quit"), "should have cmd_quit");
    assert!(labels.contains_key("cmd_next"), "should have cmd_next");
    assert!(labels.contains_key("cmd_prev"), "should have cmd_prev");
    assert!(labels.contains_key("cmd_set_bp"), "should have cmd_set_bp");
    assert!(labels.contains_key("cmd_clear_bp"), "should have cmd_clear_bp");
    assert!(labels.contains_key("cmd_refresh"), "should have cmd_refresh");
}

// ── INIT ──────────────────────────────────────────────────────────────

#[test]
fn mini_debugger_initializes_without_crash() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    let cycles = run_vm(&mut vm);
    assert!(cycles > 0, "should execute cycles during init");
    assert!(!vm.halted, "debugger should not halt during init");
    assert_eq!(vm.ram[0xB80], 0, "mem_addr should start at 0");
}

// ── COMMANDS ──────────────────────────────────────────────────────────

#[test]
fn mini_debugger_quit_halts() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    run_vm(&mut vm);
    assert!(!vm.halted, "should not halt during init");
    press_key(&mut vm, 0x51); // 'Q'
    assert!(vm.halted, "should halt after pressing Q");
}

#[test]
fn mini_debugger_next_increments_addr() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    run_vm(&mut vm);
    assert_eq!(vm.ram[0xB80], 0, "mem_addr starts at 0");
    press_key(&mut vm, 0x2B); // '+'
    assert_eq!(vm.ram[0xB80], 8, "mem_addr should be 8 after +");
    press_key(&mut vm, 0x2B); // '+'
    assert_eq!(vm.ram[0xB80], 16, "mem_addr should be 16 after second +");
}

#[test]
fn mini_debugger_prev_decrements_addr() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    run_vm(&mut vm);
    press_key(&mut vm, 0x2B); // '+' -> addr=8
    assert_eq!(vm.ram[0xB80], 8);
    press_key(&mut vm, 0x2D); // '-'
    assert_eq!(vm.ram[0xB80], 0, "mem_addr should be 0 after -");
}

#[test]
fn mini_debugger_set_breakpoint() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    run_vm(&mut vm);
    press_key(&mut vm, 0x2B); // + -> addr=8
    press_key(&mut vm, 0x2B); // + -> addr=16
    press_key(&mut vm, 0x42); // 'B'
    assert_eq!(vm.dbg_breakpoint, 16, "breakpoint should be set to 16");
}

#[test]
fn mini_debugger_clear_breakpoint() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    run_vm(&mut vm);
    // Set BP to addr=8
    press_key(&mut vm, 0x2B); // + -> addr=8
    press_key(&mut vm, 0x42); // 'B'
    assert_eq!(vm.dbg_breakpoint, 8, "BP should be 8");
    // Clear
    press_key(&mut vm, 0x30); // '0'
    assert_eq!(vm.dbg_breakpoint, 0, "BP should be cleared to 0");
}

#[test]
fn mini_debugger_refresh_works() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    run_vm(&mut vm);
    press_key(&mut vm, 0x44); // 'D'
    assert!(!vm.halted, "should not halt after D");
}

#[test]
fn mini_debugger_equals_also_advances() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    run_vm(&mut vm);
    press_key(&mut vm, 0x3D); // '=' (alias for +)
    assert_eq!(vm.ram[0xB80], 8, "mem_addr should be 8 after =");
}

#[test]
fn mini_debugger_unknown_key_ignored() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);
    run_vm(&mut vm);
    press_key(&mut vm, 0x5A); // 'Z'
    assert!(!vm.halted, "should not halt on unknown key");
    assert_eq!(vm.ram[0xB80], 0, "mem_addr unchanged");
}

// ── HEX CONVERSION ────────────────────────────────────────────────────

#[test]
fn mini_debugger_memory_dump_shows_values() {
    let asm = assemble_debugger();
    let mut vm = Vm::new(8192);
    vm.load_program(&asm.pixels);

    // Pre-load values in RAM to inspect
    vm.ram[0x10] = 0xDEADBEEF;
    vm.ram[0x11] = 0x00000042;

    run_vm(&mut vm);

    // Navigate to address 0x10 (=16)
    press_key(&mut vm, 0x2B); // + -> addr=8
    press_key(&mut vm, 0x2B); // + -> addr=16
    assert_eq!(vm.ram[0xB80], 16, "mem_addr should be 16");

    // Refresh to trigger full redraw
    press_key(&mut vm, 0x44); // 'D'

    // hex_buf (0xB82) should contain a valid hex address from the dump
    // The dump shows 8 rows starting at addr 16, so hex_buf should be
    // one of: "00000016" through "00000023"
    let hex_addr = read_hex_string(&vm, 0xB82);
    assert!(
        hex_addr.starts_with("0000001") || hex_addr.starts_with("0000002"),
        "hex_buf should contain a valid dump address, got: {}",
        hex_addr
    );

    // hex_buf2 (0xB8B) should contain a hex value from the dump
    let hex_val = read_hex_string(&vm, 0xB8B);
    assert!(
        !hex_val.is_empty(),
        "hex_buf2 should contain a hex value, got empty string"
    );

    // Verify the actual RAM still has our test data
    assert_eq!(vm.ram[0x10], 0xDEADBEEF, "RAM[0x10] should still be DEADBEEF");
}
