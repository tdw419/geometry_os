// Integration tests for Geometry OS programs
//
// Split into focused modules for maintainability.
// Originally a single 6400+ line file.

use geometry_os::assembler::{assemble, assemble_with_lib};
use geometry_os::preprocessor::Preprocessor;
use geometry_os::vm::Vm;

/// Helper: assemble a .asm file and run it in the VM
pub fn compile_run(asm_path: &str) -> Vm {
    let source = std::fs::read_to_string(asm_path)
        .unwrap_or_else(|e| panic!("failed to read {}: {}", asm_path, e));
    let asm =
        assemble(&source, 0).unwrap_or_else(|e| panic!("assembly failed for {}: {}", asm_path, e));
    let mut vm = Vm::new();
    // Load bytecode at address 0
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    // Run up to 10M cycles
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
    }
    vm
}

/// Helper: assemble a .asm file with library include support and run it in the VM
pub fn compile_run_with_lib(asm_path: &str) -> Vm {
    let source = std::fs::read_to_string(asm_path)
        .unwrap_or_else(|e| panic!("failed to read {}: {}", asm_path, e));
    let asm = assemble_with_lib(&source, 0, Some("."))
        .unwrap_or_else(|e| panic!("assembly failed for {}: {:?}", asm_path, e));
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
    }
    vm
}

/// Helper: assemble inline source with lib includes and run in VM
pub fn run_inline_with_lib(source: &str) -> Vm {
    let asm = assemble_with_lib(source, 0, Some("."))
        .unwrap_or_else(|e| panic!("inline assembly failed: {:?}", e));
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
    }
    vm
}

pub fn compile_run_interactive(asm_path: &str, steps: usize) -> Vm {
    let source = std::fs::read_to_string(asm_path)
        .unwrap_or_else(|e| panic!("failed to read {}: {}", asm_path, e));
    let asm =
        assemble(&source, 0).unwrap_or_else(|e| panic!("assembly failed for {}: {}", asm_path, e));
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    for _ in 0..steps {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            break;
        }
    }
    vm
}

// === Window Manager (SPAWN + shared RAM bounds protocol) ===

/// Helper: assemble, load, and run with child processes stepping in lock-step.
/// Runs for `frames` FRAME opcodes (simulates the display loop).
pub fn compile_run_multiproc(asm_path: &str, frames: usize) -> Vm {
    let source = std::fs::read_to_string(asm_path)
        .unwrap_or_else(|e| panic!("failed to read {}: {}", asm_path, e));
    let asm =
        assemble(&source, 0).unwrap_or_else(|e| panic!("assembly failed for {}: {}", asm_path, e));
    let mut vm = Vm::new();
    for (i, &v) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = v;
        }
    }
    let mut frame_count = 0;
    for _ in 0..50_000_000 {
        if vm.halted {
            break;
        }
        if !vm.step() {
            break;
        }
        vm.step_all_processes();
        if vm.frame_ready {
            vm.frame_ready = false;
            frame_count += 1;
            if frame_count >= frames {
                break;
            }
        }
    }
    vm
}

// ── PHASE 25: FILESYSTEM OPCODES ─────────────────────────────────

/// Helper: create a VM with a temp VFS directory for file tests
pub fn vm_with_vfs() -> (Vm, tempfile::TempDir) {
    let dir = tempfile::tempdir().expect("operation should succeed");
    let mut vm = Vm::new();
    vm.vfs.base_dir = dir.path().to_path_buf();
    let _ = std::fs::create_dir_all(&vm.vfs.base_dir);
    (vm, dir)
}

/// Helper: write a null-terminated string into VM RAM at given address
pub fn write_string_to_ram(vm: &mut Vm, addr: usize, s: &str) {
    for (i, ch) in s.bytes().enumerate() {
        vm.ram[addr + i] = ch as u32;
    }
    vm.ram[addr + s.len()] = 0;
}

/// Helper: load bytecode at address 0 and set up for execution
pub fn load_and_run(vm: &mut Vm, bytecode: &[u32], max_cycles: usize) {
    for (i, &word) in bytecode.iter().enumerate() {
        vm.ram[i] = word;
    }
    vm.pc = 0;
    vm.halted = false;
    for _ in 0..max_cycles {
        if !vm.step() {
            break;
        }
    }
}

/// Helper: write a null-terminated ASCII string into RAM at `addr`
pub fn write_string(ram: &mut [u32], addr: usize, s: &str) {
    for (i, ch) in s.chars().enumerate() {
        if addr + i < ram.len() {
            ram[addr + i] = ch as u32;
        }
    }
    if addr + s.len() < ram.len() {
        ram[addr + s.len()] = 0; // null terminator
    }
}

// ── READLN opcode ───────────────────────────────────────────────

/// Helper: place instruction bytes at vm.pc, then call step().
/// The opcode and args are placed starting at pc (step reads from pc).
pub fn step_readln(vm: &mut Vm, key: u32) {
    vm.key_port = key;
    vm.ram[vm.pc as usize] = 0x68; // READLN
    vm.ram[vm.pc as usize + 1] = 0; // r0 = buf_addr
    vm.ram[vm.pc as usize + 2] = 1; // r1 = max_len
    vm.ram[vm.pc as usize + 3] = 2; // r2 = pos_addr
    vm.step();
}

pub fn step_waitpid(vm: &mut Vm) {
    vm.ram[vm.pc as usize] = 0x69; // WAITPID
    vm.ram[vm.pc as usize + 1] = 1; // r1 = pid
    vm.step();
}

#[path = "program_tests/basic_programs.rs"]
pub mod basic_programs;
#[path = "program_tests/boot.rs"]
pub mod boot;
#[path = "program_tests/devices.rs"]
pub mod devices;
#[path = "program_tests/filesystem.rs"]
pub mod filesystem;
#[path = "program_tests/games.rs"]
pub mod games;
#[path = "program_tests/hypervisor.rs"]
pub mod hypervisor;
#[path = "program_tests/ipc.rs"]
pub mod ipc;
#[path = "program_tests/kernel.rs"]
pub mod kernel;
#[path = "program_tests/multiprocess.rs"]
pub mod multiprocess;
#[path = "program_tests/nano_editor.rs"]
pub mod nano_editor;
#[path = "program_tests/opcodes.rs"]
pub mod opcodes;
#[path = "program_tests/program_coverage.rs"]
pub mod program_coverage;
#[path = "program_tests/scheduling.rs"]
pub mod scheduling;
#[path = "program_tests/self_host.rs"]
pub mod self_host;
#[path = "program_tests/shell.rs"]
pub mod shell;
#[path = "program_tests/shell_vfs.rs"]
pub mod shell_vfs;
#[path = "program_tests/vm_state.rs"]
pub mod vm_state;

#[test]
fn test_waveform_assembles_and_renders() {
    let source = std::fs::read_to_string("programs/waveform.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    assert!(asm.pixels.len() > 500, "waveform should be substantial");

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until first FRAME (one complete render cycle)
    let mut frames_seen = 0;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames_seen += 1;
            if frames_seen >= 1 {
                break;
            }
        }
    }
    assert!(frames_seen >= 1, "should produce at least 1 frame");

    // Count non-black pixels (waveform + grid should be visible)
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 100,
        "should have drawn waveform+grid (got {} pixels)",
        non_black
    );

    // Check that center line (y=128) has grid pixels
    let center_pixels: Vec<_> = vm.screen[128 * 256..129 * 256]
        .iter()
        .filter(|&&p| p != 0)
        .collect();
    assert!(
        center_pixels.len() > 50,
        "center grid line should have pixels"
    );

    // Check HUD bar at top (y=0..11) is non-black
    let hud_pixels = vm.screen[0..12 * 256].iter().filter(|&&p| p != 0).count();
    assert!(hud_pixels > 200, "HUD should fill top bar");
}

#[test]
fn test_gol_editor_assembles() {
    let source = std::fs::read_to_string("programs/game_of_life_editor.asm").unwrap();
    let result = geometry_os::assembler::assemble(&source, 0);
    match result {
        Ok(asm) => assert!(asm.pixels.len() > 500, "should be substantial"),
        Err(e) => panic!("Assembly failed: {:?}", e),
    }
}

#[test]
fn test_gol_editor_runs_and_renders() {
    let source = std::fs::read_to_string("programs/game_of_life_editor.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    let mut frames_seen = 0;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames_seen += 1;
            if frames_seen >= 2 {
                break;
            }
        }
    }
    assert!(
        frames_seen >= 2,
        "should produce at least 2 frames (got {})",
        frames_seen
    );
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 50,
        "should have drawn cells (got {} pixels)",
        non_black
    );
}

#[test]
fn test_platformer_assembles() {
    let source = std::fs::read_to_string("programs/platformer.asm").unwrap();
    let result = geometry_os::assembler::assemble(&source, 0);
    match result {
        Ok(asm) => assert!(asm.pixels.len() > 500, "should be substantial"),
        Err(e) => panic!("Assembly failed: {:?}", e),
    }
}

#[test]
fn test_platformer_runs_and_renders() {
    let source = std::fs::read_to_string("programs/platformer.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    let mut frames_seen = 0;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames_seen += 1;
            if frames_seen >= 3 {
                break;
            }
        }
    }
    assert!(
        frames_seen >= 3,
        "should produce at least 3 frames (got {})",
        frames_seen
    );
    // Platformer should draw ground tiles, player, enemies
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 100,
        "should have drawn level geometry (got {} pixels)",
        non_black
    );
}

#[test]
fn test_minesweeper_assembles() {
    let source = std::fs::read_to_string("programs/minesweeper.asm").unwrap();
    let result = geometry_os::assembler::assemble(&source, 0);
    match result {
        Ok(asm) => assert!(asm.pixels.len() > 500, "should be substantial"),
        Err(e) => panic!("Assembly failed: {:?}", e),
    }
}

#[test]
fn test_minesweeper_runs_and_renders() {
    let source = std::fs::read_to_string("programs/minesweeper.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    let mut frames_seen = 0;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames_seen += 1;
            if frames_seen >= 3 {
                break;
            }
        }
    }
    assert!(
        frames_seen >= 3,
        "should produce at least 3 frames (got {})",
        frames_seen
    );
    // Minesweeper renders a 16x16 grid of dark gray cells on dark background
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 1000,
        "should have drawn the full grid (got {} pixels)",
        non_black
    );
    // Verify hidden cells are the expected dark gray (0x404040)
    let gray_count = vm.screen.iter().filter(|&&p| p == 0x404040).count();
    assert!(
        gray_count > 500,
        "should show hidden cells as dark gray (got {})",
        gray_count
    );
}
