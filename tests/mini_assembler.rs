// tests/mini_assembler.rs -- Integration tests for the mini-assembler.gasm program
//
// Verifies the in-VM assembler reads source from 0x2000 (editor source region),
// emits bytecode to 0x3000, and sets status/length flags correctly.
//
// This is the "compile" step in the Edit-Compile-Execute loop:
//   editor saves to 0x2000 → assembler reads 0x2000 → bytecode at 0x3000

use geometry_os::assembler;
use geometry_os::vm::Vm;

const RAM_SIZE: usize = 0x4000; // enough for all regions (0x2000-0x3BFF)
const SOURCE_ADDR: usize = 0x2000;
const OUTPUT_ADDR: usize = 0x3000;
const STATUS_ADDR: usize = 0x3FFE;
const LENGTH_ADDR: usize = 0x3FFF;
const ASM_ADDR: usize = 0x3B00;
const LABEL_TABLE: usize = 0x3800;
const SCRATCH_BUF: usize = 0x3A00;

/// Load and assemble the mini-assembler program.
fn assemble_mini_asm() -> assembler::Assembled {
    let path = std::path::Path::new("programs/mini-assembler.gasm");
    assembler::assemble_file(path, &[]).expect("mini-assembler.gasm should assemble")
}

/// Create a VM with mini-assembler loaded.
/// The assembler uses .ORG 0x3B00, so pixels[i] already has the correct address.
/// We just copy the entire pixel vector into RAM starting at index 0.
fn vm_with_mini_assembler() -> Vm {
    let result = assemble_mini_asm();
    let mut vm = Vm::new(RAM_SIZE);
    for (i, &pixel) in result.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm
}

/// Write source text to 0x2000, clear output/label areas, run assembler.
/// Returns the VM after execution.
fn run_assembler(vm: &mut Vm, source: &str) {
    // Clear output area (0x3000-0x37FF)
    for v in vm.ram[OUTPUT_ADDR..0x3800].iter_mut() {
        *v = 0;
    }
    // Clear label table (0x3800-0x39FF)
    for v in vm.ram[LABEL_TABLE..0x3A00].iter_mut() {
        *v = 0;
    }
    // Clear scratch buffer (0x3A00-0x3AFF)
    for v in vm.ram[SCRATCH_BUF..0x3B00].iter_mut() {
        *v = 0;
    }
    // Clear source area then write source text
    let src_end = (SOURCE_ADDR + source.len() + 1).min(RAM_SIZE);
    for v in vm.ram[SOURCE_ADDR..src_end].iter_mut() {
        *v = 0;
    }
    for (i, byte) in source.bytes().enumerate() {
        let addr = SOURCE_ADDR + i;
        if addr < vm.ram.len() {
            vm.ram[addr] = byte as u32;
        }
    }
    // Clear status flags
    vm.ram[STATUS_ADDR] = 0;
    vm.ram[LENGTH_ADDR] = 0;

    // Run from assembler start
    vm.pc = ASM_ADDR as u32;
    vm.halted = false;
    vm.yielded = false;
    while !vm.halted && !vm.yielded {
        vm.run();
    }
}

/// Read bytecode output from 0x3000 using the length stored at 0x3FFF.
/// We can't use null-termination because bytecode legitimately contains 0 values
/// (e.g., LDI r0 $00).
fn read_output(vm: &Vm) -> Vec<u32> {
    let len = vm.ram[LENGTH_ADDR] as usize;
    let mut result = Vec::with_capacity(len);
    for i in 0..len {
        let addr = OUTPUT_ADDR + i;
        if addr >= vm.ram.len() {
            break;
        }
        result.push(vm.ram[addr]);
    }
    result
}

// ── Opcode constants ────────────────────────────────────────────────
const LDI: u32 = 0x49;
const ADD: u32 = 0x41;
const STORE: u32 = 0x53;
const HALT: u32 = 0x48;
const NOP: u32 = 0x4E;
const JMP: u32 = 0x4A;

// ── ASSEMBLY TEST ───────────────────────────────────────────────────

#[test]
fn mini_assembler_assembles() {
    let result = assemble_mini_asm();
    assert!(
        result.pixels.len() > 100,
        "mini-assembler should have substantial code, got {} pixels",
        result.pixels.len()
    );
}

// ── BASIC COMPILATION TESTS ────────────────────────────────────────

#[test]
fn single_halt() {
    let mut vm = vm_with_mini_assembler();
    run_assembler(&mut vm, "H");

    let out = read_output(&vm);
    assert_eq!(out, vec![HALT], "H should compile to HALT opcode");
    assert_eq!(vm.ram[STATUS_ADDR], 0, "status should be success");
    assert_eq!(vm.ram[LENGTH_ADDR], 1, "length should be 1");
}

#[test]
fn whitespace_stripped() {
    let mut vm = vm_with_mini_assembler();
    run_assembler(&mut vm, "   H   \n  ");

    let out = read_output(&vm);
    assert_eq!(out, vec![HALT]);
    assert_eq!(vm.ram[STATUS_ADDR], 0, "status should be success");
    assert_eq!(vm.ram[LENGTH_ADDR], 1, "length should be 1");
}

#[test]
fn comment_stripped() {
    let mut vm = vm_with_mini_assembler();
    run_assembler(&mut vm, "; this is a comment\nH");

    let out = read_output(&vm);
    assert_eq!(out, vec![HALT]);
    assert_eq!(vm.ram[STATUS_ADDR], 0, "status should be success");
}

#[test]
fn comma_and_colon_separators() {
    let mut vm = vm_with_mini_assembler();
    // "I 0 1" = LDI r0 1 (opcode I, arg 0, arg 1)
    // commas and colons are stripped
    run_assembler(&mut vm, "I,0,$01");

    let out = read_output(&vm);
    assert_eq!(out, vec![LDI, 0x30, 0x01], "I,0,$01 should produce LDI r0 1");
    assert_eq!(vm.ram[LENGTH_ADDR], 3, "length should be 3");
}

#[test]
fn hex_escape_byte() {
    let mut vm = vm_with_mini_assembler();
    run_assembler(&mut vm, "$FF");

    let out = read_output(&vm);
    assert_eq!(out, vec![0xFF], "$FF should produce 0xFF");
}

#[test]
fn hex_escape_zero() {
    let mut vm = vm_with_mini_assembler();
    run_assembler(&mut vm, "$00");

    let out = read_output(&vm);
    assert_eq!(out, vec![0x00], "$00 should produce 0");
}

#[test]
fn hex_escape_full_u32() {
    let mut vm = vm_with_mini_assembler();
    // 8-digit hex → full 32-bit value (used for BRANCH conditions)
    run_assembler(&mut vm, "$02010000");

    let out = read_output(&vm);
    assert_eq!(out, vec![0x02010000]);
}

#[test]
fn multi_instruction_program() {
    let mut vm = vm_with_mini_assembler();
    // LDI r0 42; HALT
    run_assembler(&mut vm, "I 0 $2A\nH");

    let out = read_output(&vm);
    assert_eq!(out, vec![LDI, 0x30, 0x2A, HALT]);
    assert_eq!(vm.ram[LENGTH_ADDR], 4, "length should be 4");
    assert_eq!(vm.ram[STATUS_ADDR], 0, "status should be success");
}

// ── LABEL TESTS ────────────────────────────────────────────────────

#[test]
fn label_forward_reference() {
    let mut vm = vm_with_mini_assembler();
    // HALT with a label before it
    run_assembler(&mut vm, "#start\nH");

    let out = read_output(&vm);
    assert_eq!(out, vec![HALT]);
    assert_eq!(vm.ram[STATUS_ADDR], 0, "status should be success");
}

#[test]
fn label_jmp_backward() {
    let mut vm = vm_with_mini_assembler();
    // NOP; JMP to start → infinite loop pattern
    run_assembler(&mut vm, "#start\nN\nJ @start");

    let out = read_output(&vm);
    assert_eq!(out[0], NOP, "first instruction should be NOP");
    assert_eq!(out[1], JMP, "second instruction should be JMP");
    // Address should have absolute flag set
    assert_eq!(out[2], 0x80000000, "JMP target should be address 0 with absolute flag");
    assert_eq!(vm.ram[STATUS_ADDR], 0, "status should be success");
    assert_eq!(vm.ram[LENGTH_ADDR], 3, "length should be 3 (NOP + JMP + addr)");
}

#[test]
fn label_with_offset() {
    let mut vm = vm_with_mini_assembler();
    // NOP; NOP; label at position 2; HALT
    run_assembler(&mut vm, "N\nN\n#here\nH");

    let out = read_output(&vm);
    assert_eq!(out[0], NOP);
    assert_eq!(out[1], NOP);
    assert_eq!(out[2], HALT);
}

#[test]
fn unknown_label_sets_error() {
    let mut vm = vm_with_mini_assembler();
    // Reference to undefined label → error
    run_assembler(&mut vm, "J @nonexistent");

    let out = read_output(&vm);
    assert_eq!(out[0], JMP, "J should still be emitted");
    assert_eq!(out[1], 0xFF, "unknown label should produce 0xFF error marker");
    assert_eq!(vm.ram[STATUS_ADDR], 1, "status should be error (1)");
}

// ── STATUS FLAGS TESTS ─────────────────────────────────────────────

#[test]
fn empty_source_produces_zero_length() {
    let mut vm = vm_with_mini_assembler();
    run_assembler(&mut vm, "");

    let out = read_output(&vm);
    assert!(out.is_empty(), "empty source should produce no output");
    assert_eq!(vm.ram[LENGTH_ADDR], 0, "length should be 0");
    assert_eq!(vm.ram[STATUS_ADDR], 0, "status should be success");
}

#[test]
fn output_length_matches_bytecode_count() {
    let mut vm = vm_with_mini_assembler();
    // "NH" = NOP + HALT = 2 bytes
    run_assembler(&mut vm, "NH");

    let out = read_output(&vm);
    assert_eq!(out.len(), 2);
    assert_eq!(vm.ram[LENGTH_ADDR], 2, "length should match output count");
}

// ── COMPLEX PROGRAM TEST ───────────────────────────────────────────

#[test]
fn counter_program_compiles() {
    let mut vm = vm_with_mini_assembler();
    // A simple counter: LDI r0 0; LDI r1 1; ADD r0 r1; HALT
    let source = "I 0 $00\nI 1 $01\nA 0 1\nH";
    run_assembler(&mut vm, source);

    let out = read_output(&vm);
    assert_eq!(out[0], LDI, "LDI");
    assert_eq!(out[1], 0x30, "r0");
    assert_eq!(out[2], 0x00, "0");
    assert_eq!(out[3], LDI, "LDI");
    assert_eq!(out[4], 0x31, "r1");
    assert_eq!(out[5], 0x01, "1");
    assert_eq!(out[6], ADD, "ADD");
    assert_eq!(out[7], 0x30, "r0");
    assert_eq!(out[8], 0x31, "r1");
    assert_eq!(out[9], HALT, "HALT");
    assert_eq!(vm.ram[LENGTH_ADDR], 10);
    assert_eq!(vm.ram[STATUS_ADDR], 0, "status should be success");
}

#[test]
fn compiled_bytecode_runs_in_vm() {
    // End-to-end: compile a program, then run the compiled bytecode
    let mut vm = vm_with_mini_assembler();
    // LDI r0 42; HALT
    run_assembler(&mut vm, "I 0 $2A\nH");

    assert_eq!(vm.ram[STATUS_ADDR], 0, "compilation should succeed");

    // Now run the compiled bytecode at 0x3000
    vm.pc = OUTPUT_ADDR as u32;
    vm.halted = false;
    vm.yielded = false;
    vm.run();

    assert!(vm.halted, "compiled program should halt");
    assert_eq!(vm.regs[0], 0x2A, "r0 should be 42 after running LDI r0 42");
}

#[test]
fn compiled_counter_runs() {
    // Compile: LDI r0 0; LDI r1 1; ADD r0 r1; HALT → then run it
    let mut vm = vm_with_mini_assembler();
    run_assembler(&mut vm, "I 0 $00\nI 1 $01\nA 0 1\nH");

    assert_eq!(vm.ram[STATUS_ADDR], 0, "compilation should succeed");

    // Run the compiled bytecode
    vm.pc = OUTPUT_ADDR as u32;
    vm.halted = false;
    vm.yielded = false;
    vm.run();

    assert!(vm.halted, "compiled program should halt");
    assert_eq!(vm.regs[0], 1, "r0 should be 1 (0+1)");
}

// ── INTEGRATION: EDITOR → ASSEMBLER PIPELINE ───────────────────────

#[test]
fn editor_save_then_assemble() {
    // Simulate the full pipeline: type in editor → save → assemble
    use geometry_os::assembler;

    // Step 1: Assemble and run the editor, type "H", save
    let editor_path = std::path::Path::new("programs/mini-editor.gasm");
    let editor_asm = assembler::assemble_file(editor_path, &[]).expect("editor should assemble");
    let mut vm = Vm::new(RAM_SIZE);

    // Load editor pixels into RAM
    for (i, &pixel) in editor_asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }

    // Run editor initialization
    vm.run();

    // Type 'H' (0x48)
    vm.ram[0xFFF] = 0x48;
    vm.halted = false;
    vm.yielded = false;
    vm.run();

    // Press Ctrl+S (0x13)
    vm.ram[0xFFF] = 0x13;
    vm.halted = false;
    vm.yielded = false;
    vm.run();

    // Verify source was saved to 0x2000
    assert_eq!(vm.ram[0x1FFE], 1, "dirty flag should be set");
    assert_eq!(vm.ram[0x2000], 0x48, "source should contain 'H'");
    assert_eq!(vm.ram[0x2001], 0, "source should be null-terminated");

    // Step 2: Load mini-assembler and run it
    let asm_path = std::path::Path::new("programs/mini-assembler.gasm");
    let asm_result = assembler::assemble_file(asm_path, &[]).expect("mini-assembler should assemble");
    // The assembler uses .ORG 0x3B00 so pixels[0..0x3B00] are zeros.
    // Only copy from ASM_ADDR onward to avoid overwriting source at 0x2000.
    for (i, &pixel) in asm_result.pixels.iter().enumerate() {
        if i >= ASM_ADDR && i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }

    // Clear assembler state areas (label table + scratch)
    for v in vm.ram[LABEL_TABLE..0x3B00].iter_mut() {
        *v = 0;
    }

    // Run assembler
    vm.pc = ASM_ADDR as u32;
    vm.halted = false;
    vm.yielded = false;
    while !vm.halted && !vm.yielded {
        vm.run();
    }

    // Verify bytecode output
    let out = read_output(&vm);
    assert_eq!(out, vec![HALT], "compiled 'H' should produce HALT bytecode");
    assert_eq!(vm.ram[STATUS_ADDR], 0, "compilation should succeed");
    assert_eq!(vm.ram[LENGTH_ADDR], 1, "output length should be 1");
}
