// micro_asm.rs — integration tests for the VM-resident assembler
//
// Strategy:
//   1. Compile micro-asm.asm with the Rust assembler (bootstrap step).
//   2. Load it into a VM at RAM[0x800].
//   3. Write test source text to RAM[0x400].
//   4. Run VM from PC=0x800 until HALT.
//   5. Assert RAM[0..N] contains the expected pixel bytecodes.
//
// This verifies the self-hosting invariant:
//   text --[VM]--> pixels  produces the same result as
//   text --[Rust assembler]--> pixels

use geometry_os::assembler;
use geometry_os::vm::Vm;

const RAM_SIZE:       usize = 4096;
const TEXT_BUF_ADDR:  usize = 0x400;
const MICRO_ASM_ADDR: usize = 0x800;

/// Compile micro-asm.asm with the Rust assembler and load into a fresh VM.
/// Returns the VM with micro-asm at 0x800, ready to execute.
fn vm_with_micro_asm() -> Vm {
    let src = std::fs::read_to_string("programs/micro-asm.asm")
        .expect("programs/micro-asm.asm not found");
    let result = assembler::assemble(&src)
        .expect("micro-asm.asm failed to assemble");

    let mut vm = Vm::new(RAM_SIZE);
    for (i, &pixel) in result.pixels.iter().enumerate() {
        if i >= MICRO_ASM_ADDR && i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm
}

/// Write source text to RAM[0x400], run micro-asm from 0x800, return output.
fn run_micro_asm(vm: &mut Vm, source: &str) -> Vec<u32> {
    // Clear output area
    for v in vm.ram[..TEXT_BUF_ADDR].iter_mut() { *v = 0; }
    // Clear text buffer
    for v in vm.ram[TEXT_BUF_ADDR..MICRO_ASM_ADDR].iter_mut() { *v = 0; }
    // Write source text (one byte per cell, null-terminated by the cleared RAM)
    for (i, byte) in source.bytes().enumerate() {
        let addr = TEXT_BUF_ADDR + i;
        if addr < MICRO_ASM_ADDR { vm.ram[addr] = byte as u32; }
    }
    // Run from micro-asm start.
    // Two-pass over up to 1024 bytes of source requires many cycles.
    // Loop until HALT rather than relying on a single MAX_CYCLES burst.
    vm.pc = MICRO_ASM_ADDR as u32;
    vm.halted = false;
    vm.yielded = false;
    while !vm.halted && !vm.yielded {
        vm.run();
    }
    // Collect output (output area is 0..TEXT_BUF_ADDR)
    vm.ram[..TEXT_BUF_ADDR].to_vec()
}

/// Opcode shortcuts for readability in expected output
const LDI:    u32 = 0x49;
const ADD:    u32 = 0x41;
const STORE:  u32 = 0x53;
const BRANCH: u32 = 0x42;
const HALT:   u32 = 0x48;
const NOP:    u32 = 0x4E;

#[test]
fn single_halt() {
    // 'H' = 0x48 = HALT: the simplest possible program
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "H");
    assert_eq!(out[0], HALT, "H should produce HALT opcode 0x48");
}

#[test]
fn whitespace_stripped() {
    // Same as single_halt but with surrounding whitespace
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "   H   \n  ");
    assert_eq!(out[0], HALT);
    assert_eq!(out[1], 0, "no extra bytes written");
}

#[test]
fn comment_stripped() {
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "; this is a comment\nH");
    assert_eq!(out[0], HALT);
    assert_eq!(out[1], 0);
}

#[test]
fn comma_colon_stripped() {
    // commas and colons are separators, not written to output
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "loop: H");
    // 'l','o','o','p' would be wrong here — but ':' is stripped and
    // this is showing that a label suffix ':' doesn't crash
    // 'l'=0x6C, 'o'=0x6F, 'o'=0x6F, 'p'=0x70, 'H'=0x48
    assert_eq!(out[4], HALT, "H at position 4 after loop letters");
}

#[test]
fn hex_escape_zero() {
    // $00 should produce byte value 0
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "$00");
    assert_eq!(out[0], 0x00);
}

#[test]
fn hex_escape_byte() {
    // $2A = 42 = '*'
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "$2A");
    assert_eq!(out[0], 0x2A);
}

#[test]
fn hex_escape_ff() {
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "$FF");
    assert_eq!(out[0], 0xFF);
}

#[test]
fn ldi_r0_33() {
    // I 0 ! = LDI r0, 33
    // 'I'=0x49=LDI, '0'=0x30=r0 (reg_idx: 0x30→0), '!'=0x21=33
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "I 0 !");
    assert_eq!(out[0], LDI,  "opcode = LDI");
    assert_eq!(out[1], 0x30, "dst = '0' = r0 encoding");
    assert_eq!(out[2], 0x21, "imm = '!' = 33");
}

#[test]
fn ldi_with_hex_immediate() {
    // I 0 $01 = LDI r0, 1
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "I 0 $01");
    assert_eq!(out[0], LDI);
    assert_eq!(out[1], 0x30); // '0' = r0
    assert_eq!(out[2], 0x01); // hex literal 1
}

#[test]
fn counter_program_single_char_syntax() {
    // Full counter program in single-char syntax.
    // Expected bytecodes (using reg ASCII encoding for registers):
    //   LDI r0, 33  → [0x49, 0x30, 0x21]   addr 0-2
    //   LDI r1, 1   → [0x49, 0x31, 0x01]   addr 3-5
    //   LDI r2, 32  → [0x49, 0x32, 0x20]   addr 6-8
    //   STORE r2, r0→ [0x53, 0x32, 0x30]   addr 9-11
    //   ADD r0, r1  → [0x41, 0x30, 0x31]   addr 12-14
    //   BRANCH 0, 9 → [0x42, 0x00, 0x09]   addr 15-17
    let src = "\
I 0 !      ; LDI r0, 33
I 1 $01    ; LDI r1, 1
I 2 $20    ; LDI r2, 32
S 2 0      ; STORE r2, r0
A 0 1      ; ADD r0, r1
B $00 $09  ; BRANCH always, target=9
";
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, src);

    // LDI r0, 33
    assert_eq!(out[0], LDI,  "addr 0: LDI");
    assert_eq!(out[1], 0x30, "addr 1: r0 encoding '0'");
    assert_eq!(out[2], 0x21, "addr 2: immediate 33 = '!'");
    // LDI r1, 1
    assert_eq!(out[3], LDI);
    assert_eq!(out[4], 0x31); // '1' = r1
    assert_eq!(out[5], 0x01); // hex 1
    // LDI r2, 32
    assert_eq!(out[6], LDI);
    assert_eq!(out[7], 0x32); // '2' = r2
    assert_eq!(out[8], 0x20); // hex 32
    // STORE r2, r0
    assert_eq!(out[9],  STORE);
    assert_eq!(out[10], 0x32); // '2' = r2
    assert_eq!(out[11], 0x30); // '0' = r0
    // ADD r0, r1
    assert_eq!(out[12], ADD);
    assert_eq!(out[13], 0x30);
    assert_eq!(out[14], 0x31);
    // BRANCH always → addr 9
    assert_eq!(out[15], BRANCH);
    assert_eq!(out[16], 0x00); // cond=0 (BEQ r0,r0 = always)
    assert_eq!(out[17], 0x09); // target addr 9
}

#[test]
fn assembled_counter_is_runnable() {
    // After micro-asm converts counter-s syntax to pixels, run those pixels
    // on a fresh VM and verify behavior: the cell at RAM[32] should change.
    let src = "\
I 0 !
I 1 $01
I 2 $20
S 2 0
A 0 1
B $00 $09
";
    let mut vm = vm_with_micro_asm();
    run_micro_asm(&mut vm, src);

    // Now run the assembled program (it's at PC=0)
    // It's an infinite loop, so just run a limited number of cycles
    // and check that RAM[32] was modified
    vm.pc = 0;
    vm.halted = false;
    // Run manually for a few steps
    for _ in 0..20 {
        if vm.halted { break; }
        vm.run();
    }
    // After running, RAM[32] should be non-zero (counter incremented from 33)
    assert_ne!(vm.ram[32], 0, "counter should have written to RAM[32]");
}

// ── Extended hex ($XXXXXXXX) tests ────────────────────────────────────────────

#[test]
fn hex_8digit_deadbeef() {
    // $DEADBEEF should accumulate all 8 digits into one u32 cell
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "$DEADBEEF");
    assert_eq!(out[0], 0xDEADBEEF, "$DEADBEEF should produce 0xDEADBEEF");
}

#[test]
fn hex_4digit() {
    // $1234 — 4 hex digits, produces 0x1234
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "$1234");
    assert_eq!(out[0], 0x1234);
}

#[test]
fn hex_8digit_branch_cond_bne_r1_r2() {
    // The BNE r1,r2 condition pixel: cond=1 | (0x31<<16) | (0x32<<24) = 0x32310001
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "$32310001");
    assert_eq!(out[0], 0x32310001, "BNE r1,r2 condition pixel");
}

#[test]
fn hex_backwards_compat_2digit() {
    // Existing 2-digit $XX forms still work
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, "$FF $00 $2A");
    assert_eq!(out[0], 0xFF);
    assert_eq!(out[1], 0x00);
    assert_eq!(out[2], 0x2A);
}

#[test]
fn fill_bounded_assembles_and_runs() {
    // fill-bounded-s.asm: writes 'A' (65) to RAM[64..127] then HALTs.
    // Uses BNE r1, r2 via $32310001 — the first real conditional branch
    // in single-char syntax with non-r0 registers.
    let src = std::fs::read_to_string("programs/fill-bounded-s.asm")
        .expect("programs/fill-bounded-s.asm not found");
    let mut vm = vm_with_micro_asm();
    run_micro_asm(&mut vm, &src);

    // Run the assembled program to completion
    vm.pc = 0;
    vm.halted = false;
    vm.yielded = false;
    while !vm.halted && !vm.yielded { vm.run(); }

    // Should have halted (not infinite loop)
    assert!(vm.halted, "program should HALT after 64 iterations");

    // RAM[64..128] should all be 65 ('A').
    // (Program itself occupies cells 0-27; starting output at 64 avoids overlap.)
    for i in 64..128 {
        assert_eq!(vm.ram[i], 65, "RAM[{i}] should be 'A' (65)");
    }
    // RAM[128] should be untouched (0)
    assert_eq!(vm.ram[128], 0, "RAM[128] should be untouched");
}

// ── Label resolution tests ─────────────────────────────────────────────────────

#[test]
fn label_backward_reference() {
    // #loop defined before the branch that targets it — backward reference
    // Program: write 'A' once, then infinite loop with BAL
    // #loop is at output position 0
    // B $0F @loop → BAL to addr 0
    let src = "\
#loop
H
B $0F @loop
";
    // Expected: HALT(0x48), BRANCH(0x42), 0x0F, 0x00 (addr of loop = 0)
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, src);
    assert_eq!(out[0], 0x48, "HALT at addr 0");
    assert_eq!(out[1], 0x42, "BRANCH opcode");
    assert_eq!(out[2], 0x0F, "BAL condition");
    assert_eq!(out[3], 0x00 | 0x80000000, "@loop resolved to 0 (absolute)");
}

#[test]
fn label_forward_reference() {
    // @done appears before #done is defined — forward reference
    // B $0F @done  → BAL to addr 6 (past the LDI)
    // I 0 !        → 3 bytes (addrs 3,4,5)
    // #done
    // H            → addr 6
    let src = "\
B $0F @done
I 0 !
#done
H
";
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, src);
    assert_eq!(out[0], 0x42, "BRANCH");
    assert_eq!(out[1], 0x0F, "BAL");
    assert_eq!(out[2], 6 | 0x80000000, "@done resolved to 6 (absolute)");
    assert_eq!(out[3], 0x49, "LDI");
    assert_eq!(out[4], 0x30, "r0");
    assert_eq!(out[5], 0x21, "33");
    assert_eq!(out[6], 0x48, "HALT at addr 6");
}

#[test]
fn multiple_labels() {
    // Two labels in one program, both resolved correctly
    // #start (addr 0): H
    // #end (addr 1): N (NOP = 0x4E)
    // B $0F @end   → BAL → addr 1
    // B $0F @start → BAL → addr 0
    let src = "\
#start
H
#end
N
B $0F @end
B $0F @start
";
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, src);
    assert_eq!(out[0], 0x48, "HALT at 0 (#start)");
    assert_eq!(out[1], 0x4E, "NOP at 1 (#end)");
    assert_eq!(out[2], 0x42, "BRANCH");
    assert_eq!(out[3], 0x0F, "BAL");
    assert_eq!(out[4], 1 | 0x80000000, "@end = 1 (absolute)");
    assert_eq!(out[5], 0x42, "BRANCH");
    assert_eq!(out[6], 0x0F, "BAL");
    assert_eq!(out[7], 0 | 0x80000000, "@start = 0 (absolute)");
}

#[test]
fn echo_s_assembles_correctly() {
    let src = std::fs::read_to_string("programs/echo-s.asm")
        .expect("programs/echo-s.asm not found");
    let mut vm = vm_with_micro_asm();
    let out = run_micro_asm(&mut vm, &src);

    // addr  0-2: I 0 $FFF
    assert_eq!(out[0], 0x49, "LDI");
    assert_eq!(out[1], 0x30, "r0");
    assert_eq!(out[2], 0x0FFF, "$FFF = 4095");

    // addr  3-5: I 1 $00
    assert_eq!(out[3], 0x49);
    assert_eq!(out[4], 0x31);
    assert_eq!(out[5], 0x00);

    // addr  6-8: I 2 $00
    assert_eq!(out[6], 0x49);
    assert_eq!(out[7], 0x32);
    assert_eq!(out[8], 0x00);

    // addr  9-11: I 3 $01
    assert_eq!(out[9], 0x49);
    assert_eq!(out[10], 0x33);
    assert_eq!(out[11], 0x01);

    // addr 12-14: I 5 $400
    assert_eq!(out[12], 0x49);
    assert_eq!(out[13], 0x35);
    assert_eq!(out[14], 0x0400, "$400 = 1024");

    // #poll = label at addr 15

    // addr 15-17: L 4 0
    assert_eq!(out[15], 0x4C, "LOAD");
    assert_eq!(out[16], 0x34, "r4");
    assert_eq!(out[17], 0x30, "r0 (addr)");

    // addr 18-20: B $31340000 @poll
    assert_eq!(out[18], 0x42, "BRANCH");
    assert_eq!(out[19], 0x31340000, "BEQ r4,r1 condition");
    assert_eq!(out[20], 15 | 0x80000000, "@poll = 15 (absolute)");

    // addr 21-23: S 0 1 (ack)
    assert_eq!(out[21], 0x53, "STORE");
    assert_eq!(out[22], 0x30, "r0 (0xFFF)");
    assert_eq!(out[23], 0x31, "r1 (0)");

    // addr 24-26: S 2 4 (write key to canvas)
    assert_eq!(out[24], 0x53);
    assert_eq!(out[25], 0x32);
    assert_eq!(out[26], 0x34);

    // addr 27-29: A 2 3
    assert_eq!(out[27], 0x41, "ADD");
    assert_eq!(out[28], 0x32);
    assert_eq!(out[29], 0x33);

    // addr 30-32: B $35320001 @poll
    assert_eq!(out[30], 0x42, "BRANCH");
    assert_eq!(out[31], 0x35320001, "BNE r2,r5 condition");
    assert_eq!(out[32], 15 | 0x80000000, "@poll = 15 (absolute)");

    // addr 33-35: I 2 $00 (reset ptr)
    assert_eq!(out[33], 0x49);
    assert_eq!(out[34], 0x32);
    assert_eq!(out[35], 0x00);

    // addr 36-38: B $0F @poll
    assert_eq!(out[36], 0x42, "BRANCH");
    assert_eq!(out[37], 0x0F, "BAL");
    assert_eq!(out[38], 15 | 0x80000000, "@poll = 15 (absolute)");

    // addr 39: null terminator
    assert_eq!(out[39], 0, "null terminator");
}

#[test]
fn echo_s_simulated_keypress() {
    // Assemble echo, then simulate a keypress and verify the program reads it
    let src = "I 0 $FFF
I 1 $00
I 2 $00
I 3 $01
I 5 $400
#poll
L 4 0
B $31340000 @poll
S 0 1
S 2 4
A 2 3
B $35320001 @poll
I 2 $00
B $0F @poll
";
    let mut vm = vm_with_micro_asm();
    run_micro_asm(&mut vm, &src);

    // Simulate: write a key to KEY_PORT
    vm.ram[0xFFF] = 0x41; // 'A'

    // Run the assembled program (it will poll, read 'A', ack, write to canvas)
    vm.pc = 0;
    vm.halted = false;
    vm.yielded = false;
    
    // Run for a limited number of cycles (it's an infinite loop)
    for _ in 0..200 {
        vm.step();
    }

    // Verify: KEY_PORT should be 0 (acknowledged)
    assert_eq!(vm.ram[0xFFF], 0, "KEY_PORT should be cleared (acked)");
    // Verify: canvas[0] should have the key code 'A' = 0x41 = 65
    assert_eq!(vm.ram[0], 0x41, "canvas[0] should be 'A' (0x41)");
}
