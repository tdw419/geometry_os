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

// === AI Evaluation (EVAL opcode) ===

#[cfg(feature = "python")]
#[test]
fn test_eval_program() {
    let source = r#"
        LDI r1, script
        LDI r2, result
        EVAL r1, r2
        HALT

        script:
        .asciz "3 * 7"

        .org 0x3000
        result:
        .db 0
    "#;
    let vm = run_inline_with_lib(source);

    // Result should be "21"
    let mut result = String::new();
    let mut addr = 0x3000;
    while addr < vm.ram.len() && vm.ram[addr] != 0 {
        result.push((vm.ram[addr] as u8) as char);
        addr += 1;
    }
    assert_eq!(result, "21");
}

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

// === Phase 384: Rhythm Game ===

/// Helper: step the VM until it produces a frame, returns steps taken
fn step_until_frame_rhythm(vm: &mut Vm, max_steps: usize) -> usize {
    for i in 0..max_steps {
        if !vm.step() {
            return i;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            return i + 1;
        }
    }
    max_steps
}

#[test]
fn test_rhythm_game_assembles() {
    let source = std::fs::read_to_string("programs/rhythm_game.asm").unwrap();
    let result = geometry_os::assembler::assemble(&source, 0);
    match result {
        Ok(asm) => assert!(
            asm.pixels.len() > 100,
            "should be substantial (got {} words)",
            asm.pixels.len()
        ),
        Err(e) => panic!("Assembly failed: {:?}", e),
    }
}

#[test]
fn test_rhythm_game_runs_and_spawns_notes() {
    let source = std::fs::read_to_string("programs/rhythm_game.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0)
        .unwrap_or_else(|e| panic!("assembly failed: {:?}", e));
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run 40 frames (notes should spawn and start falling)
    let mut frames_seen = 0;
    for _ in 0..5_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames_seen += 1;
            if frames_seen >= 40 {
                break;
            }
        }
    }
    assert!(
        frames_seen >= 40,
        "should produce 40 frames (got {})",
        frames_seen
    );

    // After 40 frames, some notes should have spawned (spawn_timer starts at 25,
    // so beat 0 fires at frame 25, beat 1 at ~frame 50... but with 25-frame intervals,
    // 40 frames gives at least 1 beat)
    // Check lane notes (0x2100-0x2103) - at least one should have had a note
    let mut any_note_spawned = false;
    // Reset and run again, checking after each frame for active notes
    let mut vm2 = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm2.ram.len() {
            vm2.ram[i] = pixel;
        }
    }
    vm2.pc = 0;
    vm2.halted = false;

    let mut frames2 = 0;
    for _ in 0..5_000_000 {
        if !vm2.step() {
            break;
        }
        if vm2.frame_ready {
            vm2.frame_ready = false;
            frames2 += 1;
            // Check if any lane has an active note
            if vm2.ram[0x2100] != 0
                || vm2.ram[0x2101] != 0
                || vm2.ram[0x2102] != 0
                || vm2.ram[0x2103] != 0
            {
                any_note_spawned = true;
            }
            if frames2 >= 120 {
                break;
            }
        }
    }
    assert!(
        any_note_spawned,
        "at least one note should spawn in 120 frames"
    );

    // After 120 frames without key presses, notes should have been missed
    // (notes spawn at frame ~25, fall at 3px/frame, reach y=241 at ~frame 105)
    // miss_count at 0x2005 should be > 0
    let miss_count = vm2.ram[0x2005];
    assert!(
        miss_count > 0,
        "should have misses after 120 frames without keys (got {})",
        miss_count
    );

    // Score should still be 0 (no hits)
    assert_eq!(vm2.ram[0x2000], 0, "score should be 0 without key presses");
}

#[test]
fn test_rhythm_game_perfect_hit() {
    let source = std::fs::read_to_string("programs/rhythm_game.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0)
        .unwrap_or_else(|e| panic!("assembly failed: {:?}", e));

    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until a note spawns and reaches the hit zone
    // Beat 0 is lane 0 (Left, bit 2 in key bitmask)
    // We need to: run frames until note spawns, then run until it's near y=220,
    // then press the key
    let mut frames = 0;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames += 1;

            // Check if lane 0 has a note near the hit zone (y between 210 and 230)
            let lane0_y = vm.ram[0x2100];
            if lane0_y >= 210 && lane0_y <= 230 {
                // Press Left key (bit 2 = 4) for a perfect hit
                vm.key_bitmask = 4; // Left key (bit 2)
                                    // Run one more frame to process the hit
                step_until_frame_rhythm(&mut vm, 500_000);
                break;
            }

            if frames >= 200 {
                break; // timeout
            }
        }
    }

    // Score should have increased (perfect = 300 points)
    let score = vm.ram[0x2000];
    assert!(
        score >= 300,
        "should have scored a perfect hit (got score={})",
        score
    );

    // Perfect count should be > 0
    let perfects = vm.ram[0x2003];
    assert!(
        perfects > 0,
        "should have at least 1 perfect (got {})",
        perfects
    );

    // Combo should be > 0
    let combo = vm.ram[0x2001];
    assert!(
        combo > 0,
        "combo should be > 0 after perfect hit (got {})",
        combo
    );

    // BEEP should have triggered (vm.beep is set)
    // The beep is consumed by the host loop, so we can't check it directly,
    // but we verified the score increased which means the BEEP code ran.
}

#[test]
fn test_rhythm_game_good_hit() {
    let source = std::fs::read_to_string("programs/rhythm_game.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0)
        .unwrap_or_else(|e| panic!("assembly failed: {:?}", e));

    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until a note is at the edge of good range (y ~ 202 or ~ 238)
    // Good range: |y - 220| <= 20, so y in [200, 240]
    // We want y between 200-208 or 232-240 (good but not perfect)
    let mut frames = 0;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames += 1;

            let lane0_y = vm.ram[0x2100];
            // Good range but not perfect: y between 200-211 or 229-240
            if (lane0_y >= 200 && lane0_y <= 211) || (lane0_y >= 229 && lane0_y <= 240) {
                // Press Left key
                vm.key_bitmask = 4;
                step_until_frame_rhythm(&mut vm, 500_000);
                break;
            }

            if frames >= 200 {
                break;
            }
        }
    }

    // Score should reflect a good hit (100 points)
    let score = vm.ram[0x2000];
    let goods = vm.ram[0x2004];
    // Could be perfect or good depending on exact timing
    assert!(
        score > 0,
        "should have scored from hit (got score={})",
        score
    );
    assert!(
        goods > 0 || vm.ram[0x2003] > 0,
        "should have at least 1 good or perfect"
    );
}

#[test]
fn test_rhythm_game_miss_resets_combo() {
    let source = std::fs::read_to_string("programs/rhythm_game.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0)
        .unwrap_or_else(|e| panic!("assembly failed: {:?}", e));

    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run 120 frames without any key presses
    let mut frames = 0;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames += 1;
            if frames >= 120 {
                break;
            }
        }
    }

    // Combo should be 0 (missed notes reset combo)
    let combo = vm.ram[0x2001];
    assert_eq!(combo, 0, "combo should be 0 after misses (got {})", combo);

    // Miss count should be > 0
    let misses = vm.ram[0x2005];
    assert!(
        misses > 0,
        "should have misses after 100 frames (got {})",
        misses
    );
}

#[test]
fn test_rhythm_game_renders_visuals() {
    let source = std::fs::read_to_string("programs/rhythm_game.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0)
        .unwrap_or_else(|e| panic!("assembly failed: {:?}", e));
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    let mut frames_seen = 0;
    for _ in 0..5_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames_seen += 1;
            if frames_seen >= 5 {
                break;
            }
        }
    }
    assert!(
        frames_seen >= 5,
        "should produce at least 5 frames (got {})",
        frames_seen
    );

    // Screen should have lane backgrounds (dark blue 0x1A1A3A) and hit zone (gray 0x555555)
    let lane_pixels = vm.screen.iter().filter(|&&p| p == 0x1A1A3A).count();
    let hit_zone_pixels = vm.screen.iter().filter(|&&p| p == 0x555555).count();
    assert!(
        lane_pixels > 1000,
        "should render lane backgrounds (got {} lane pixels)",
        lane_pixels
    );
    assert!(
        hit_zone_pixels > 100,
        "should render hit zone (got {} zone pixels)",
        hit_zone_pixels
    );
}

// === Phase 403: Landscape Generator ===

#[test]
fn test_landscape_assembles() {
    let source = std::fs::read_to_string("programs/landscape.asm").unwrap();
    let result = geometry_os::assembler::assemble(&source, 0);
    match result {
        Ok(asm) => assert!(
            asm.pixels.len() > 200,
            "landscape should be substantial (got {} words)",
            asm.pixels.len()
        ),
        Err(e) => panic!("Assembly failed: {:?}", e),
    }
}

#[test]
fn test_landscape_terrain_generation() {
    let source = std::fs::read_to_string("programs/landscape.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0)
        .unwrap_or_else(|e| panic!("assembly failed: {:?}", e));
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run enough steps to complete terrain generation (3 layers ~16K steps)
    // but stop before the main animation loop to verify generation
    let mut reached_frame = false;
    for i in 0..500_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            reached_frame = true;
            break;
        }
    }

    // Terrain arrays should be populated (not all zeros)
    // Check far terrain (0x2000-0x20FF)
    let far_nonzero = (0x2000..=0x20FF).filter(|&addr| vm.ram[addr] != 0).count();
    assert!(
        far_nonzero > 200,
        "far terrain should be mostly populated (got {}/256 nonzero)",
        far_nonzero
    );

    // Check mid terrain (0x2100-0x21FF)
    let mid_nonzero = (0x2100..=0x21FF).filter(|&addr| vm.ram[addr] != 0).count();
    assert!(
        mid_nonzero > 200,
        "mid terrain should be mostly populated (got {}/256 nonzero)",
        mid_nonzero
    );

    // Check near terrain (0x2200-0x22FF)
    let near_nonzero = (0x2200..=0x22FF).filter(|&addr| vm.ram[addr] != 0).count();
    assert!(
        near_nonzero > 200,
        "near terrain should be mostly populated (got {}/256 nonzero)",
        near_nonzero
    );

    // Heights should be in valid screen range (0-255)
    for addr in 0x2000..=0x22FF {
        let h = vm.ram[addr];
        if h != 0 {
            assert!(
                h <= 255,
                "terrain height at 0x{:X} should be <= 255, got {}",
                addr,
                h
            );
        }
    }

    assert!(
        reached_frame,
        "program should reach first frame (terrain gen + render complete)"
    );
}

#[test]
fn test_landscape_renders_visual() {
    let source = std::fs::read_to_string("programs/landscape.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0)
        .unwrap_or_else(|e| panic!("assembly failed: {:?}", e));
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until first frame
    let mut frames_seen = 0;
    for _ in 0..5_000_000 {
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
    assert!(
        frames_seen >= 1,
        "should produce at least 1 frame (got {})",
        frames_seen
    );

    // Screen should have significant non-black content (>30% of pixels)
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 19_660,
        "screen should be >30% non-black after landscape render (got {} / 65536)",
        non_black
    );

    // Sky area (top rows) should have dark blue/purple colors
    // Check a pixel in the upper portion (e.g., row 10, col 128)
    let sky_pixel = vm.screen[10 * 256 + 128];
    assert!(
        sky_pixel != 0,
        "sky area should be non-black (got 0x{:08X} at row 10)",
        sky_pixel
    );

    // Terrain area (lower portion) should have dark silhouette colors
    // Check a pixel in the bottom rows (row 240, col 50)
    let terrain_pixel = vm.screen[240 * 256 + 50];
    assert!(
        terrain_pixel != 0,
        "terrain area should be non-black (got 0x{:08X} at row 240)",
        terrain_pixel
    );

    // Verify terrain layers at different depths have different colors
    // The near terrain (bottom) should be darkest
    // Check that we have at least some near-terrain color pixels (0x0A0218)
    let near_color_count = vm
        .screen
        .iter()
        .filter(|&&p| (p & 0x00F0F0F0) == 0x00020218 || p == 0x0A0218)
        .count();
    // Also check far terrain color (0x1A0A30)
    let far_color_count = vm.screen.iter().filter(|&&p| p == 0x1A0A30).count();

    // At least one terrain layer should be visible
    assert!(
        near_color_count > 0 || far_color_count > 0,
        "should have terrain color pixels (near={}, far={})",
        near_color_count,
        far_color_count
    );
}

#[test]
fn test_repair_agent_assembles() {
    let source = std::fs::read_to_string("programs/repair_agent.asm")
        .expect("repair_agent.asm should exist");
    let result = geometry_os::assembler::assemble(&source, 0);
    match result {
        Ok(asm) => assert!(
            asm.pixels.len() > 20,
            "repair_agent should be substantial (got {} words)",
            asm.pixels.len()
        ),
        Err(e) => panic!("repair_agent.asm assembly failed: {:?}", e),
    }
}

#[test]
fn test_repair_agent_reads_agent_table() {
    // Verify the repair agent can read from the agent table at 0x7950
    // and detect STATUS_REPAIRING, then respond with STATUS_DONE.
    let source = std::fs::read_to_string("programs/repair_agent.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0x1000)
        .unwrap_or_else(|e| panic!("assembly failed: {:?}", e));
    let mut vm = Vm::new();
    vm.tile_store.procedural_enabled = false;

    // Load program at 0x1000
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i + 0x1000 < vm.ram.len() {
            vm.ram[i + 0x1000] = pixel;
        }
    }
    vm.pc = 0x1000;
    vm.halted = false;

    // Set up agent table: agent 0 at 0x7950 with STATUS_REPAIRING and a PRUNE_NOISE task
    let base = 0x7950;
    vm.ram[base + 0] = 42; // target_x
    vm.ram[base + 1] = 99; // target_y
    vm.ram[base + 2] = 2; // STATUS_REPAIRING
    vm.ram[base + 3] = 1; // TASK_PRUNE_NOISE

    // Run the VM for enough cycles to poll, detect, and write STATUS_DONE.
    // The repair agent doesn't have GPU substrate so PATCH won't execute,
    // but it should still reach mark_done and write STATUS_DONE to RAM.
    // Note: without gpu feature, substrate_status stays 0, so wait_patch
    // loop would spin forever. We need to pre-set substrate_status = 2.
    vm.substrate_status = 2; // Simulate patch already done

    for _ in 0..500 {
        if !vm.step() {
            break;
        }
    }

    // The agent should have written STATUS_DONE (3) to RAM[0x7950 + 2]
    assert_eq!(
        vm.ram[base + 2],
        3,
        "repair agent should write STATUS_DONE=3 to RAM[0x7952], got {}",
        vm.ram[base + 2]
    );
}

#[test]
fn test_tunnel_assembles_and_runs() {
    let source = std::fs::read_to_string("programs/tunnel.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    assert!(
        asm.pixels.len() > 100,
        "tunnel should assemble to substantial bytecode, got {} words",
        asm.pixels.len()
    );

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until first FRAME (infinite animation loop)
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
    assert!(frames_seen >= 1, "tunnel should produce at least 1 frame");

    // Verify screen has non-black pixels (tunnel should be visible)
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 100,
        "tunnel should render visible pixels, got {} non-black",
        non_black
    );

    // Verify color diversity (tunnel has depth-shaded rings)
    let mut colors = std::collections::HashSet::new();
    for &pixel in vm.screen.iter() {
        if pixel != 0 {
            colors.insert(pixel);
        }
    }
    assert!(
        colors.len() > 5,
        "tunnel should have color diversity from depth shading, got {} unique colors",
        colors.len()
    );

    // Verify concentric structure: center pixel should be non-black (innermost ring)
    let center_pixel = vm.screen[128 * 256 + 128];
    assert!(
        center_pixel != 0,
        "tunnel center (128,128) should be non-black from innermost ring"
    );
}

#[test]
fn test_matrix_rain_assembles_and_runs() {
    let source = std::fs::read_to_string("programs/matrix_rain.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    assert!(
        asm.pixels.len() > 100,
        "matrix_rain should assemble to substantial bytecode, got {} words",
        asm.pixels.len()
    );

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until 10 frames (enough for trails to appear)
    let mut frames_seen = 0;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames_seen += 1;
            if frames_seen >= 10 {
                break;
            }
        }
    }
    assert!(
        frames_seen >= 10,
        "matrix_rain should produce at least 10 frames"
    );

    // Verify screen has non-black pixels (rain should be visible)
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 50,
        "matrix_rain should render visible pixels, got {} non-black",
        non_black
    );

    // Verify green color diversity (bright heads + dim trails)
    let mut colors = std::collections::HashSet::new();
    for &pixel in vm.screen.iter() {
        if pixel != 0 {
            colors.insert(pixel);
        }
    }
    assert!(
        colors.len() >= 2,
        "matrix_rain should have bright and dim green, got {} unique colors",
        colors.len()
    );
}

#[test]
fn test_voronoi_assembles_and_runs() {
    let source = std::fs::read_to_string("programs/voronoi.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    assert!(
        asm.pixels.len() > 100,
        "voronoi should assemble to substantial bytecode, got {} words",
        asm.pixels.len()
    );

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Voronoi is computationally heavy (~7M steps for first frame)
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
    assert!(
        frames_seen >= 1,
        "voronoi should produce at least 1 frame within 10M steps"
    );

    // Full screen should be filled (every pixel colored by nearest seed)
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 60000,
        "voronoi should fill most of the screen, got {} non-black",
        non_black
    );

    // Should have multiple seed colors
    let mut colors = std::collections::HashSet::new();
    for &pixel in vm.screen.iter() {
        if pixel != 0 {
            colors.insert(pixel);
        }
    }
    assert!(
        colors.len() >= 3,
        "voronoi should have color diversity from multiple seeds, got {} unique",
        colors.len()
    );
}

#[test]
fn test_sine_wave_assembles_and_runs() {
    let source = std::fs::read_to_string("programs/sine_wave.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    assert!(
        asm.pixels.len() > 100,
        "sine_wave should assemble to substantial bytecode, got {} words",
        asm.pixels.len()
    );

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    let mut frames_seen = 0;
    for _ in 0..2_000_000 {
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
        "sine_wave should produce at least 3 frames"
    );

    // Should have visible pixels from 3 overlapping waves
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 500,
        "sine_wave should render visible pixels, got {} non-black",
        non_black
    );

    // Should have red, green, and blue colors
    let mut colors = std::collections::HashSet::new();
    for &pixel in vm.screen.iter() {
        if pixel != 0 {
            colors.insert(pixel);
        }
    }
    assert!(
        colors.len() >= 3,
        "sine_wave should have RGB color diversity, got {} unique",
        colors.len()
    );
}

// === Phase 414: Mandelbrot Crosshair Zoom ===

/// Helper: run VM until frame_ready or max_steps, starting from current state.
fn step_until_frame_test(vm: &mut Vm, max_steps: usize) -> bool {
    for _ in 0..max_steps {
        if vm.halted {
            return false;
        }
        if !vm.step() {
            return false;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            return true;
        }
    }
    false
}

#[test]
fn test_mandelbrot_crosshair_renders() {
    // Assemble and run until first frame completes
    let mut vm = compile_run_interactive("programs/mandelbrot_crosshair.asm", 10_000_000);

    // Should have rendered at least one frame (frame_ready breaks the loop)
    // If frame_ready didn't fire, the render took > 10M steps (unlikely for 128x128 blocks)

    // Check that the fractal rendered (many non-black pixels)
    let non_black: usize = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 5000,
        "should have many colored pixels from fractal render, got {}",
        non_black
    );

    // Check crosshair at screen center (128, 128) - bright cyan 0x00FFFF
    // Crosshair is drawn as two LINE opcodes covering (124,128)-(132,128) and (128,124)-(128,132)
    let cx = 128;
    let cy = 128;
    let crosshair_color = vm.screen[cy * 256 + cx];
    assert_eq!(
        crosshair_color, 0x00FFFF,
        "crosshair center pixel should be bright cyan"
    );

    // Check crosshair arms
    assert_eq!(
        vm.screen[cy * 256 + (cx - 4)],
        0x00FFFF,
        "crosshair left arm at ({},{})",
        cx - 4,
        cy
    );
    assert_eq!(
        vm.screen[cy * 256 + (cx + 4)],
        0x00FFFF,
        "crosshair right arm at ({},{})",
        cx + 4,
        cy
    );
    assert_eq!(
        vm.screen[(cy - 4) * 256 + cx],
        0x00FFFF,
        "crosshair top arm at ({},{})",
        cx,
        cy - 4
    );
    assert_eq!(
        vm.screen[(cy + 4) * 256 + cx],
        0x00FFFF,
        "crosshair bottom arm at ({},{})",
        cx,
        cy + 4
    );

    // Cursor position should be at center (128, 128)
    assert_eq!(vm.ram[0x5110], 128, "cursor_x should be initialized to 128");
    assert_eq!(vm.ram[0x5111], 128, "cursor_y should be initialized to 128");

    // View params should be at defaults
    assert_eq!(
        vm.ram[0x5100],
        (-2048i32 as u32),
        "center_re should be -2048 (Q4.12 for -0.5)"
    );
    assert_eq!(vm.ram[0x5101], 0, "center_im should be 0");
    assert_eq!(vm.ram[0x5102], 6144, "scale should be 6144 (Q4.12 for 1.5)");
    assert_eq!(vm.ram[0x5103], 24, "max_iter should be 24");

    // Palette at 0x5000 should be populated (check first and last entries)
    assert_ne!(
        vm.ram[0x5000], 0,
        "palette[0] should be non-zero (dark blue)"
    );
    assert_ne!(
        vm.ram[0x500F], 0,
        "palette[15] should be non-zero (dark purple)"
    );
}

#[test]
fn test_mandelbrot_crosshair_zoom_in() {
    let mut vm = compile_run_interactive("programs/mandelbrot_crosshair.asm", 10_000_000);

    let initial_scale = vm.ram[0x5102];
    assert_eq!(initial_scale, 6144, "initial scale should be 6144");

    // Clear stale frame_ready from first frame, then push '+' key
    vm.frame_ready = false;
    vm.push_key(43);

    // Run until next frame
    let got_frame = step_until_frame_test(&mut vm, 10_000_000);
    assert!(got_frame, "should complete second frame after zoom");

    // Scale should have halved (6144 >> 1 = 3072)
    // Cursor at center (128,128) means offset=0, so center doesn't move, only scale changes
    let new_scale = vm.ram[0x5102];
    assert_eq!(
        new_scale, 3072,
        "scale should halve after zoom in at center, got {}",
        new_scale
    );

    // Center should be unchanged (cursor at center = no center shift)
    assert_eq!(
        vm.ram[0x5100],
        (-2048i32 as u32),
        "center_re should be unchanged after zoom at center"
    );
    assert_eq!(
        vm.ram[0x5101], 0,
        "center_im should be unchanged after zoom at center"
    );
}

#[test]
fn test_mandelbrot_crosshair_zoom_out() {
    let mut vm = compile_run_interactive("programs/mandelbrot_crosshair.asm", 10_000_000);

    // Clear stale frame_ready and push '-' key (ASCII 45) for zoom out
    vm.frame_ready = false;
    vm.push_key(45);

    let got_frame = step_until_frame_test(&mut vm, 10_000_000);
    assert!(got_frame, "should complete frame after zoom out");

    // Scale should have doubled (6144 << 1 = 12288)
    let new_scale = vm.ram[0x5102];
    assert_eq!(
        new_scale, 12288,
        "scale should double after zoom out at center, got {}",
        new_scale
    );
}

#[test]
fn test_mandelbrot_crosshair_quit() {
    let mut vm = compile_run_interactive("programs/mandelbrot_crosshair.asm", 10_000_000);

    // Clear stale frame_ready and push 'Q' key (ASCII 81) to quit
    vm.frame_ready = false;
    vm.push_key(81);

    // Run until halt or frame
    for _ in 0..10_000_000 {
        if vm.halted {
            break;
        }
        if !vm.step() {
            break;
        }
    }

    assert!(vm.halted, "program should halt after pressing Q");
}

// === Phase 424: Gravity Simulator ===

#[test]
fn test_gravity_sim_assembles() {
    let source = std::fs::read_to_string("programs/gravity_sim.asm").unwrap();
    let result = geometry_os::assembler::assemble(&source, 0);
    assert!(
        result.is_ok(),
        "gravity_sim.asm should assemble without errors: {:?}",
        result
    );
}

// === Phase 418: Lissajous Figures ===

#[test]
fn test_lissajous_assembles_and_runs() {
    let source = std::fs::read_to_string("programs/lissajous.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    assert!(
        asm.pixels.len() > 300,
        "lissajous should assemble to substantial bytecode, got {} words",
        asm.pixels.len()
    );

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until we see a few frames
    let mut frames_seen = 0;
    for _ in 0..3_000_000 {
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
        "lissajous should produce at least 3 frames, got {}",
        frames_seen
    );

    // Should have visible pixels (the curve is drawn with LINE)
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 100,
        "lissajous should render visible curve pixels, got {} non-black",
        non_black
    );

    // Should have color diversity from sine-based rainbow coloring
    let mut colors = std::collections::HashSet::new();
    for &pixel in vm.screen.iter() {
        if pixel != 0 {
            colors.insert(pixel);
        }
    }
    assert!(
        colors.len() >= 5,
        "lissajous should have color diversity from sine-based RGB, got {} unique",
        colors.len()
    );

    // Verify sine table was built (sine[0] should be ~127)
    let sine_0 = vm.ram[0x2000];
    assert!(
        sine_0 >= 120 && sine_0 <= 135,
        "sine table entry 0 should be ~127, got {}",
        sine_0
    );

    // Verify default parameters in RAM
    let freq_a = vm.ram[0x2100];
    let freq_b = vm.ram[0x2101];
    assert_eq!(freq_a, 3, "default freq_a should be 3");
    assert_eq!(freq_b, 2, "default freq_b should be 2");
}

#[test]
fn test_lissajous_keyboard_changes_frequency() {
    let source = std::fs::read_to_string("programs/lissajous.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();

    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run one frame to complete init
    for _ in 0..2_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            break;
        }
    }

    // Simulate pressing Right arrow (bit 3=8) to increase freq_a
    vm.key_bitmask = 8;

    // Run another frame with the key held
    for _ in 0..2_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            break;
        }
    }

    // freq_a should have increased from 3 to 4
    let freq_a = vm.ram[0x2100];
    assert_eq!(
        freq_a, 4,
        "freq_a should increase to 4 after Right key press, got {}",
        freq_a
    );
}

// ── PHASE 433: ANALOG CLOCK ──────────────────────────────────

#[test]
fn test_analog_clock_assembles() {
    let source = std::fs::read_to_string("programs/analog_clock.asm").unwrap();
    let result = geometry_os::assembler::assemble(&source, 0);
    assert!(result.is_ok(), "analog_clock.asm should assemble OK");
}

#[test]
fn test_analog_clock_draws_circle_and_hands() {
    let source = std::fs::read_to_string("programs/analog_clock.asm").unwrap();
    let asm = assemble(&source, 0).expect("assembly should succeed");
    let mut vm = Vm::new();
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

    // Count non-black pixels (clock circle + hands should be visible)
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 100,
        "should have drawn clock face+hands (got {} pixels)",
        non_black
    );

    // Verify pixels in the center area (the CIRCLE opcode draws the face)
    // Center is at (128,128), radius 96, so the circle spans (32..224, 32..224)
    let center_band: Vec<_> = vm.screen[120 * 256 + 64..120 * 256 + 192]
        .iter()
        .filter(|&&p| p != 0)
        .collect();
    assert!(
        center_band.len() > 20,
        "center row should have clock pixels (got {})",
        center_band.len()
    );
}

// ── PHASE 431: SPREADSHEET CALCULATOR ──────────────────────────

#[test]
fn test_spreadsheet_assembles() {
    let source = std::fs::read_to_string("programs/spreadsheet.asm").unwrap();
    let result = geometry_os::assembler::assemble(&source, 0);
    assert!(
        result.is_ok(),
        "spreadsheet.asm should assemble OK: {:?}",
        result.err()
    );
}

#[test]
fn test_spreadsheet_runs_and_renders() {
    let source = std::fs::read_to_string("programs/spreadsheet.asm").unwrap();
    let asm = assemble(&source, 0).expect("assembly should succeed");
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run the spreadsheet for a frame (it's an infinite animation loop)
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
    assert!(
        frames_seen >= 1,
        "spreadsheet should produce at least 1 frame"
    );

    // Verify canvas has the demo values we initialized
    assert_eq!(vm.ram[0x8000], 10, "cell A1 should = 10");
    assert_eq!(vm.ram[0x8001], 20, "cell B1 should = 20");
    assert_eq!(vm.ram[0x8002], 30, "cell C1 should = 30");
    assert_eq!(vm.ram[0x8003], 40, "cell D1 should = 40");
    assert_eq!(vm.ram[0x8020], 5, "cell A2 should = 5");
    assert_eq!(vm.ram[0x8021], 15, "cell B2 should = 15");
    assert_eq!(vm.ram[0x8022], 25, "cell C2 should = 25");
    assert_eq!(vm.ram[0x8023], 35, "cell D2 should = 35");

    // Verify screen has non-black pixels (grid was rendered)
    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 500,
        "spreadsheet should draw grid (got {} pixels)",
        non_black
    );
}

#[test]
fn test_spreadsheet_formula_sum() {
    let source = std::fs::read_to_string("programs/spreadsheet.asm").unwrap();
    let asm = assemble(&source, 0).expect("assembly should succeed");
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }

    // Initialize demo values (row 0: 10+20+30+40 = 100)
    vm.ram[0x8000] = 10;
    vm.ram[0x8001] = 20;
    vm.ram[0x8002] = 30;
    vm.ram[0x8003] = 40;
    // Row 1: 5+15+25+35 = 80
    vm.ram[0x8020] = 5;
    vm.ram[0x8021] = 15;
    vm.ram[0x8022] = 25;
    vm.ram[0x8023] = 35;

    // Test FORMULA opcode directly via bytecode execution
    // formula_register with Sum op should iterate all deps
    let ok = vm.formula_register(10, vec![0, 1, 2, 3], geometry_os::vm::FormulaOp::Sum);
    assert!(ok, "formula register should succeed");

    // Trigger formula recalc by changing dep[0]
    vm.canvas_buffer[0] = 10;
    vm.canvas_buffer[1] = 20;
    vm.canvas_buffer[2] = 30;
    vm.canvas_buffer[3] = 40;
    vm.formula_recalc(0);

    // Target cell (index 10) should have sum = 100
    assert_eq!(
        vm.canvas_buffer[10], 100,
        "SUM formula should sum all deps to 100"
    );

    // Test AVG formula
    vm.formula_clear_all();
    let ok = vm.formula_register(15, vec![0, 1, 2], geometry_os::vm::FormulaOp::Avg);
    assert!(ok, "avg formula register should succeed");

    vm.canvas_buffer[0] = 10;
    vm.canvas_buffer[1] = 20;
    vm.canvas_buffer[2] = 30;
    vm.formula_recalc(0);

    // Target cell (index 15) should have avg = (10+20+30)/3 = 20
    assert_eq!(
        vm.canvas_buffer[15], 20,
        "AVG formula should average deps to 20"
    );
}
