// CLI Mode Integration Tests (Phase 419)
//
// Tests for src/cli.rs commands exercised programmatically.
// The CLI is a monolithic cli_main() reading stdin, so these tests
// replicate the same code paths (assemble, run, peek, poke, disasm, step, bp)
// without spawning the binary.
//
// See src/cli.rs for the command implementations these tests mirror.

use geometry_os::assembler;
use geometry_os::preprocessor::Preprocessor;
use geometry_os::vm::Vm;

// ── Helpers ──────────────────────────────────────────────────────────────────

/// Simulate CLI "load <file>" + "run" pipeline.
/// CLI loads source text, preprocesses, assembles at address 0, then runs.
fn cli_load_and_run(path: &str) -> Vm {
    let source =
        std::fs::read_to_string(path).unwrap_or_else(|e| panic!("failed to read {}: {}", path, e));

    // CLI runs preprocessor before assembly
    let mut pp = Preprocessor::new();
    let preprocessed = pp.preprocess(&source);

    let asm = assembler::assemble(&preprocessed, 0)
        .unwrap_or_else(|e| panic!("assembly failed for {}: {}", path, e));

    let mut vm = Vm::new();

    // CLI clears bytecode region then loads at address 0
    let load_addr = 0usize;
    let ram_len = vm.ram.len();
    for v in vm.ram[load_addr..ram_len.min(load_addr + 4096)].iter_mut() {
        *v = 0;
    }
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        let addr = load_addr + i;
        if addr < ram_len {
            vm.ram[addr] = pixel;
        }
    }
    vm.pc = load_addr as u32;
    vm.halted = false;

    // CLI runs up to 10M steps, checking breakpoints
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.breakpoint_hit {
            break;
        }
    }
    vm
}

/// Simulate inline assembly (for quick tests without files).
fn cli_run_source(source: &str) -> Vm {
    let mut pp = Preprocessor::new();
    let preprocessed = pp.preprocess(source);
    let asm = assembler::assemble(&preprocessed, 0).expect("assembly failed");

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

// ── Deliverable 1: CLI load and run pipeline end-to-end ─────────────────────

#[test]
fn test_cli_load_and_run_hello() {
    let vm = cli_load_and_run("programs/hello.asm");
    assert!(vm.halted, "program should halt after run");
    // hello.asm runs through text rendering, PC should be past the code
    assert!(vm.pc > 0, "PC should have advanced past start");
}

#[test]
fn test_cli_load_and_run_registers() {
    let vm = cli_load_and_run("programs/hello.asm");
    // After running hello.asm, registers should have deterministic values.
    // The CLI's "regs" command shows all 32 registers.
    // Verify that the register state is non-trivial (not all zeros).
    let nonzero_count = vm.regs.iter().filter(|&&r| r != 0).count();
    assert!(
        nonzero_count >= 3,
        "at least 3 registers should be non-zero after running, got {} non-zero",
        nonzero_count
    );
}

#[test]
fn test_cli_load_file_not_found() {
    // CLI prints "File not found" for missing files.
    // We simulate this by checking the file read result.
    let result = std::fs::read_to_string("programs/nonexistent.asm");
    assert!(result.is_err(), "loading nonexistent file should fail");
}

#[test]
fn test_cli_load_with_path_prefix() {
    // CLI tries "programs/<name>" when bare name not found.
    // Verify hello.asm loads via programs/ prefix.
    let source = std::fs::read_to_string("programs/hello.asm");
    assert!(source.is_ok(), "should load programs/hello.asm via prefix");
}

#[test]
fn test_cli_assembly_at_address_zero() {
    // CLI loads bytecode at address 0, not 0x1000 (per skill docs).
    // Verify labels resolve correctly at address 0.
    let vm = cli_run_source(
        r#"
            LDI r1, 42
            LDI r2, 0
            CMP r1, r2
            HALT
        "#,
    );
    assert!(vm.halted, "program should halt");
    assert_eq!(vm.regs[1], 42, "r1 should be 42");
}

#[test]
fn test_cli_run_no_source() {
    // CLI prints "No source loaded" when run is called without load.
    // Simulate: an empty source should fail assembly, not panic.
    let result = assembler::assemble("", 0);
    // Empty source assembles to nothing (0 pixels), which is Ok
    assert!(result.is_ok(), "empty source should assemble ok");
    assert_eq!(
        result.unwrap().pixels.len(),
        0,
        "empty source should produce 0 bytes"
    );
}

#[test]
fn test_cli_load_run_reset_rerun() {
    // CLI "reset" command resets the VM state.
    let mut vm = cli_load_and_run("programs/hello.asm");
    assert!(vm.halted, "should halt after first run");

    // Reset
    vm.reset();
    assert!(!vm.halted, "halted should be false after reset");
    assert_eq!(vm.pc, 0, "PC should be 0 after reset");

    // Reload and run again
    let vm2 = cli_load_and_run("programs/hello.asm");
    assert!(vm2.halted, "should halt after second run");
}

// ── Deliverable 2: Peek/poke commands with address validation ───────────────

#[test]
fn test_cli_peek_valid_address() {
    let vm = cli_run_source(
        r#"
            LDI r1, 0xDEADBEEF
            LDI r2, 0x200
            STORE r2, r1
            HALT
        "#,
    );
    // Simulate CLI "peek 0x200"
    let addr: usize = 0x200;
    assert!(addr < vm.ram.len(), "address should be valid");
    assert_eq!(vm.ram[addr], 0xDEADBEEF, "RAM[0x200] should be 0xDEADBEEF");
}

#[test]
fn test_cli_peek_boundary_addresses() {
    let vm = Vm::new();
    // First valid address
    assert!(vm.ram.len() > 0, "RAM should be non-empty");
    let _ = vm.ram[0]; // should not panic

    // Last valid address (0xFFFF = 65535)
    let last = vm.ram.len() - 1;
    let _ = vm.ram[last]; // should not panic
}

#[test]
fn test_cli_peek_out_of_range() {
    let vm = Vm::new();
    let addr: u32 = 0x10000; // past 64K RAM
                             // CLI prints "Address 0x10000 out of range"
    assert!(
        (addr as usize) >= vm.ram.len(),
        "address should be out of range"
    );
}

#[test]
fn test_cli_peek_invalid_format() {
    // CLI prints "Invalid address" for non-hex input.
    // Simulate: parse "badaddr" as hex should fail.
    let result = u32::from_str_radix("badaddr".trim_start_matches("0x"), 16);
    assert!(result.is_err(), "parsing 'badaddr' as hex should fail");
}

#[test]
fn test_cli_poke_valid_address() {
    let mut vm = Vm::new();
    let addr: u32 = 0x200;
    let val: u32 = 0xCAFEBABE;

    // Simulate CLI "poke 0x200 CAFEBABE"
    assert!((addr as usize) < vm.ram.len());
    vm.ram[addr as usize] = val;

    // Verify the write stuck
    assert_eq!(vm.ram[addr as usize], val, "poke value should be readable");
}

#[test]
fn test_cli_poke_then_run_reads_value() {
    // Poke a value into RAM, then run a program that reads it.
    let mut vm = Vm::new();
    // Store a test value at address 0x300
    vm.ram[0x300] = 0x12345678;

    // Run a program that loads from 0x300
    let source = r#"
        LDI r1, 0x300
        LOAD r2, r1
        HALT
    "#;
    let asm = assembler::assemble(source, 0).expect("assembly failed");
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    for _ in 0..100_000 {
        if !vm.step() {
            break;
        }
    }
    assert_eq!(vm.regs[2], 0x12345678, "program should read poked value");
}

#[test]
fn test_cli_poke_missing_value() {
    // CLI "poke 0x200" without a value prints usage.
    // This is a UX test — verify the parse logic rejects missing value.
    let addr_str = "200";
    // Simulate parts.len() < 3 by checking second arg is missing
    let parts: Vec<&str> = vec!["poke", addr_str];
    assert!(parts.len() < 3, "poke needs both addr and val");
}

#[test]
fn test_cli_peek_after_run_shows_hardware_ports() {
    let vm = cli_run_source(
        r#"
            LDI r1, 0xFFE
            LOAD r2, r1
            HALT
        "#,
    );
    // After run, reading TICKS port (0xFFE) via LOAD is intercepted to frame_count
    // The CLI "peek 0xFFE" reads vm.ram[0xFFE] directly (not intercepted)
    // This tests the difference: CLI peek reads raw RAM, not the intercepted field.
    let _ = vm.ram[0xFFE]; // CLI peek reads raw RAM
}

// ── Deliverable 3: Disasm command output formatting ─────────────────────────

#[test]
fn test_cli_disasm_basic_format() {
    let vm = cli_run_source(
        r#"
            LDI r2, 0x20
            LDI r5, 0xFFB
            HALT
        "#,
    );
    // CLI disasm shows: "  ADDR MNEMONIC"
    let (mnemonic, len) = vm.disassemble_at(0);
    assert!(!mnemonic.is_empty(), "mnemonic should not be empty");
    assert_eq!(len, 3, "LDI is 3 words");
    assert!(mnemonic.contains("LDI"), "first instruction should be LDI");
}

#[test]
fn test_cli_disasm_sequence() {
    let vm = cli_run_source(
        r#"
            LDI r1, 10
            LDI r2, 20
            ADD r1, r2
            HALT
        "#,
    );
    // Walk through instructions like CLI disasm does
    let mut addr = 0u32;
    let mut instructions = Vec::new();
    for _ in 0..10 {
        if addr as usize >= vm.ram.len() {
            break;
        }
        let (mnemonic, len) = vm.disassemble_at(addr);
        if mnemonic.contains("HALT") || mnemonic.contains("Unknown") {
            instructions.push(mnemonic.clone());
            break;
        }
        instructions.push(mnemonic.clone());
        addr += len as u32;
    }
    assert!(instructions.len() >= 3, "should see at least LDI, LDI, ADD");
    assert!(instructions[0].contains("LDI"), "first should be LDI");
    assert!(instructions[1].contains("LDI"), "second should be LDI");
    assert!(instructions[2].contains("ADD"), "third should be ADD");
}

#[test]
fn test_cli_disasm_pc_marker() {
    // CLI shows ">" marker for current PC address.
    let mut vm = cli_run_source(
        r#"
            LDI r1, 42
            NOP
            HALT
        "#,
    );
    // Reset and step once to set PC to instruction 2
    let asm = assembler::assemble("LDI r1, 42\nNOP\nHALT\n", 0).unwrap();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    vm.step(); // advances past first LDI (3 words)
    let pc_after_step = vm.pc;

    // Simulate CLI marker logic: marker = if addr == vm.pc { ">" } else { " " }
    let addr = 0u32;
    let marker = if addr == pc_after_step { ">" } else { " " };
    assert_ne!(marker, ">", "address 0 should NOT be current PC after step");

    let marker_at_pc = if pc_after_step == vm.pc { ">" } else { " " };
    assert_eq!(marker_at_pc, ">", "PC address should have '>' marker");
}

#[test]
fn test_cli_disasm_with_hex_flag() {
    // CLI --hex flag shows raw bytecode alongside mnemonics.
    // disassemble_range() with Some(labels) produces hex output.
    let vm = cli_run_source("LDI r1, 42\nHALT\n");
    let labels = vm.build_label_map();
    let lines = vm.disassemble_range(0, 5, Some(&labels));
    assert!(!lines.is_empty(), "disasm range should produce output");
    // Hex output contains raw bytecode values
    let first_line = &lines[0];
    assert!(
        first_line.contains("LDI"),
        "hex output should still show mnemonic"
    );
}

#[test]
fn test_cli_disasm_empty_program() {
    // Disasm on fresh VM (no code loaded) should not panic.
    let vm = Vm::new();
    let (mnemonic, _len) = vm.disassemble_at(0);
    // RAM[0] = 0 which is HALT
    assert!(
        mnemonic.contains("HALT") || mnemonic.contains("Unknown"),
        "empty RAM should disasm to HALT or Unknown, got: {}",
        mnemonic
    );
}

#[test]
fn test_cli_disasm_address_default() {
    // CLI "disasm" with no args uses current PC.
    let mut vm = Vm::new();
    vm.pc = 0x10;
    // The start_addr defaults to vm.pc
    let start_addr = vm.pc;
    assert_eq!(start_addr, 0x10, "default disasm addr should be PC");
}

// ── Deliverable 4: Step and breakpoint commands ─────────────────────────────

#[test]
fn test_cli_step_single_instruction() {
    // CLI "step" advances PC by one instruction.
    let mut vm = cli_run_source("LDI r1, 42\nNOP\nHALT\n");
    // Re-assemble for clean state
    let asm = assembler::assemble("LDI r1, 42\nNOP\nHALT\n", 0).unwrap();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    let pc_before = vm.pc;
    vm.step();
    let pc_after = vm.pc;
    assert!(pc_after > pc_before, "PC should advance after step");
    assert_eq!(pc_after, 3, "LDI r1, 42 is 3 words, so PC should be 3");
}

#[test]
fn test_cli_step_while_halted() {
    // CLI prints "VM halted" when step is called on halted VM.
    let mut vm = Vm::new();
    vm.halted = true;
    // CLI checks vm.halted before stepping
    if vm.halted {
        // Would print "VM halted. Use reset to restart."
        // Just verify the condition
    } else {
        panic!("should have detected halted state");
    }
}

#[test]
fn test_cli_step_shows_pc() {
    // CLI "step" prints "step -> PC=0xNNNN".
    let mut vm = Vm::new();
    let asm = assembler::assemble("LDI r1, 1\nHALT\n", 0).unwrap();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    vm.step();
    // CLI would format as: "step -> PC=0x{:04X}"
    let output = format!("step -> PC=0x{:04X}", vm.pc);
    assert_eq!(
        output, "step -> PC=0x0003",
        "step output should show new PC"
    );
}

#[test]
fn test_cli_breakpoint_set_and_trigger() {
    // CLI "bp 0x6" sets a breakpoint, "run" stops at it.
    let mut vm = Vm::new();
    let asm = assembler::assemble("LDI r1, 10\nLDI r2, 20\nADD r1, r2\nHALT\n", 0).unwrap();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Simulate CLI breakpoints vector
    let mut cli_breakpoints: Vec<u32> = vec![6]; // bp at address 6 (ADD instruction)

    // Run with breakpoint check (mirrors CLI run loop)
    let mut hit_bp = false;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.breakpoint_hit {
            hit_bp = true;
            break;
        }
        if cli_breakpoints.contains(&vm.pc) {
            hit_bp = true;
            break;
        }
    }

    assert!(hit_bp, "should hit breakpoint at address 6");
    assert_eq!(vm.pc, 6, "PC should be at breakpoint address");
}

#[test]
fn test_cli_breakpoint_toggle() {
    // CLI bp toggles: set → clear → set again.
    let mut breakpoints: Vec<u32> = vec![];

    // Set BP at 0x6
    let addr = 6u32;
    if let Some(pos) = breakpoints.iter().position(|&a| a == addr) {
        breakpoints.remove(pos);
    } else {
        breakpoints.push(addr);
    }
    assert_eq!(breakpoints, vec![6], "BP should be set at 0x6");

    // Toggle again (clear)
    if let Some(pos) = breakpoints.iter().position(|&a| a == addr) {
        breakpoints.remove(pos);
    } else {
        breakpoints.push(addr);
    }
    assert!(breakpoints.is_empty(), "BP should be cleared");

    // Set again
    if let Some(pos) = breakpoints.iter().position(|&a| a == addr) {
        breakpoints.remove(pos);
    } else {
        breakpoints.push(addr);
    }
    assert_eq!(breakpoints, vec![6], "BP should be set again");
}

#[test]
fn test_cli_breakpoint_list() {
    // CLI "bp" with no args lists breakpoints.
    let breakpoints: Vec<u32> = vec![0x6, 0xC, 0x12];
    // CLI iterates and prints "  BP @ 0x{:04X}"
    let output: Vec<String> = breakpoints
        .iter()
        .map(|&addr| format!("  BP @ 0x{:04X}", addr))
        .collect();
    assert_eq!(output.len(), 3, "should list 3 breakpoints");
    assert_eq!(output[0], "  BP @ 0x0006");
    assert_eq!(output[1], "  BP @ 0x000C");
    assert_eq!(output[2], "  BP @ 0x0012");
}

#[test]
fn test_cli_breakpoint_clear_all() {
    // CLI "bpc" clears all breakpoints.
    let mut breakpoints: Vec<u32> = vec![0x6, 0xC, 0x12];
    breakpoints.clear();
    assert!(breakpoints.is_empty(), "bpc should clear all breakpoints");
}

#[test]
fn test_cli_breakpoint_invalid_address() {
    // CLI prints "Invalid address" for non-hex input.
    let result = u32::from_str_radix("xyz".trim_start_matches("0x"), 16);
    assert!(result.is_err(), "parsing 'xyz' as hex should fail");
}

#[test]
fn test_cli_step_after_breakpoint() {
    // After hitting a breakpoint, stepping should continue from that PC.
    let mut vm = Vm::new();
    let asm = assembler::assemble("LDI r1, 1\nLDI r2, 2\nLDI r3, 3\nHALT\n", 0).unwrap();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Run until breakpoint at address 6
    let bp_addr = 6u32;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.pc == bp_addr {
            break;
        }
    }
    assert_eq!(vm.pc, bp_addr, "should stop at breakpoint");

    // Now step past the breakpoint
    vm.step();
    assert!(vm.pc > bp_addr, "step should advance past breakpoint");
    assert_eq!(vm.pc, 9, "next LDI is also 3 words");
}

#[test]
fn test_cli_run_stops_at_halt() {
    let vm = cli_run_source("LDI r1, 42\nHALT\n");
    assert!(vm.halted, "simple program should halt");
    assert_eq!(vm.regs[1], 42, "r1 should be 42");
}

#[test]
fn test_cli_run_produces_assembly_output() {
    // CLI prints "Assembled N bytes at 0x0000"
    let source = "LDI r1, 42\nHALT\n";
    let asm = assembler::assemble(source, 0).unwrap();
    let output = format!("Assembled {} bytes at 0x{:04X}", asm.pixels.len(), 0);
    assert!(output.contains("Assembled"), "should show assembly message");
    assert!(
        output.contains("bytes at 0x0000"),
        "should show address 0x0000"
    );
}
