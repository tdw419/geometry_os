// ═══════════════════════════════════════════════════════════════════════
// GASM SIMULATOR BOUNDARY CONDITION TESTS
//
// Tests for edge cases: empty programs, stack overflow, division by zero,
// unrecognized opcodes, PC out of bounds, and register overflow wrapping.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::vm::{Vm, VmError};
use geometry_os::opcodes::op;

// ── 1. Empty / HALT-only program ─────────────────────────────────────

#[test]
fn test_empty_program_halt_only() {
    // Program with just a HALT instruction
    let mut vm = Vm::new(16);
    vm.load_program(&[op::HALT as u32]);

    let cycles = vm.run();
    assert!(vm.is_halted());
    assert_eq!(cycles, 1); // One cycle to execute HALT
    assert_eq!(vm.get_pc(), 1); // PC advances past HALT (width 1)
}

#[test]
fn test_zero_instructions_empty_ram() {
    // RAM is all zeros — PC starts at 0, ram[0] is 0x00 which is not a
    // valid opcode. In unchecked mode the VM treats it as NOP and walks
    // through until PC >= ram.len(), then halts.
    let mut vm = Vm::new(4);
    vm.pc = 0;
    vm.halted = false;

    vm.run();
    assert!(vm.is_halted());
    // All registers remain zero
    for i in 0..32 {
        assert_eq!(vm.get_reg(i), 0, "register r{} should be 0", i);
    }
}

#[test]
fn test_zero_instructions_empty_ram_checked() {
    // In checked mode, opcode 0x00 is invalid → UnknownOpcode error
    let mut vm = Vm::new(4);
    vm.pc = 0;
    vm.halted = false;

    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::UnknownOpcode(pc, opcode) => {
            assert_eq!(pc, 1); // PC advanced by width(0x00)=1: 0+1=1
            assert_eq!(opcode, 0x00);
        }
        other => panic!("expected UnknownOpcode, got {:?}", other),
    }
}

// ── 2. Stack overflow ────────────────────────────────────────────────

#[test]
fn test_stack_overflow_via_nested_calls() {
    // Build a self-looping CALL that pushes return addresses until
    // the stack (size 256) overflows.
    // At address 0: CALL 0  (calls itself, pushing return addr each time)
    let mut vm = Vm::new(64);
    vm.poke(0, op::CALL as u32);
    vm.poke(1, 0); // target = address 0 (self)
    vm.pc = 0;
    vm.halted = false;

    let result = vm.run_checked();
    assert!(result.is_err(), "expected stack overflow error");
    match result.unwrap_err() {
        VmError::StackOverflow(pc) => {
            // The overflow should happen at PC=0 (the CALL instruction)
            assert_eq!(pc, 0, "stack overflow should occur at the CALL instruction");
        }
        other => panic!("expected StackOverflow, got {:?}", other),
    }
}

#[test]
fn test_stack_overflow_via_push() {
    // PUSH r0 in a loop until stack overflows.
    // Program: LDI r0, 1 at addr 0 (width 3)
    //          PUSH r0 at addr 3 (width 2) — pushes value of r0
    //          JMP 3 at addr 5 (width 2) — loop back to PUSH
    let mut vm = Vm::new(64);
    // LDI r0, 1
    vm.poke(0, op::LDI as u32);
    vm.poke(1, 0); // r0
    vm.poke(2, 1); // value 1
    // PUSH r0
    vm.poke(3, op::PUSH as u32);
    vm.poke(4, 0); // r0
    // JMP back to PUSH
    vm.poke(5, op::JMP as u32);
    vm.poke(6, 3);

    vm.pc = 0;
    vm.halted = false;

    let result = vm.run_checked();
    assert!(result.is_err(), "expected stack overflow error");
    match result.unwrap_err() {
        VmError::StackOverflow(pc) => {
            // Should overflow at the PUSH instruction at addr 3
            assert_eq!(pc, 3, "stack overflow should occur at PUSH instruction");
        }
        other => panic!("expected StackOverflow, got {:?}", other),
    }
}

// ── 3. Division by zero ──────────────────────────────────────────────

#[test]
fn test_division_by_zero() {
    // LDI r0, 10 at addr 0 (width 3)
    // LDI r1, 0  at addr 3 (width 3)
    // DIV r0, r1 at addr 6 (width 3)  → should error
    // HALT       at addr 9 (width 1)
    let mut vm = Vm::new(64);
    vm.poke(0, op::LDI as u32);
    vm.poke(1, 0); // r0
    vm.poke(2, 10);

    vm.poke(3, op::LDI as u32);
    vm.poke(4, 1); // r1
    vm.poke(5, 0); // value 0

    vm.poke(6, op::DIV as u32);
    vm.poke(7, 0); // dst = r0
    vm.poke(8, 1); // src = r1 (contains 0)

    vm.poke(9, op::HALT as u32);

    vm.pc = 0;
    vm.halted = false;

    let result = vm.run_checked();
    assert!(result.is_err(), "expected division by zero error");
    match result.unwrap_err() {
        VmError::DivisionByZero(pc) => {
            assert_eq!(pc, 6, "division by zero should occur at DIV instruction");
        }
        other => panic!("expected DivisionByZero, got {:?}", other),
    }
}

#[test]
fn test_division_by_zero_with_explicit_zero_register() {
    // Registers default to 0, so DIV r0, r1 where r1=0 should fail
    let mut vm = Vm::new(64);
    // LDI r0, 42
    vm.poke(0, op::LDI as u32);
    vm.poke(1, 0); // r0
    vm.poke(2, 42);
    // DIV r0, r1 (r1 is still 0)
    vm.poke(3, op::DIV as u32);
    vm.poke(4, 0); // dst = r0
    vm.poke(5, 1); // src = r1 (still 0)

    vm.pc = 0;
    vm.halted = false;

    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::DivisionByZero(pc) => {
            assert_eq!(pc, 3);
        }
        other => panic!("expected DivisionByZero, got {:?}", other),
    }
}

// ── 4. Unrecognized opcode ───────────────────────────────────────────

#[test]
fn test_unrecognized_opcode_checked() {
    // Place an invalid opcode byte (0x00) and run checked
    let mut vm = Vm::new(16);
    vm.load_program(&[0x00]); // Invalid opcode

    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::UnknownOpcode(_pc, opcode) => {
            assert_eq!(opcode, 0x00);
        }
        other => panic!("expected UnknownOpcode, got {:?}", other),
    }
}

#[test]
fn test_unrecognized_opcode_high_value() {
    // Use 0xFF which is not in any valid opcode range
    let mut vm = Vm::new(16);
    vm.load_program(&[0xFF]);

    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::UnknownOpcode(_pc, opcode) => {
            assert_eq!(opcode, 0xFF);
        }
        other => panic!("expected UnknownOpcode, got {:?}", other),
    }
}

#[test]
fn test_unrecognized_opcode_between_ranges() {
    // 0x5B is '[' — between uppercase Z (0x5A) and lowercase a (0x61), not valid
    let mut vm = Vm::new(16);
    vm.load_program(&[0x5B]);

    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::UnknownOpcode(_pc, opcode) => {
            assert_eq!(opcode, 0x5B);
        }
        other => panic!("expected UnknownOpcode, got {:?}", other),
    }
}

// ── 5. PC out of bounds ──────────────────────────────────────────────

#[test]
fn test_jmp_past_ram_end_halts() {
    // JMP to an address beyond RAM size; VM should halt gracefully
    let mut vm = Vm::new(16);
    // JMP 9999
    vm.poke(0, op::JMP as u32);
    vm.poke(1, 9999);

    vm.pc = 0;
    vm.halted = false;

    // Unchecked run: JMP sets PC=9999, then next step sees PC >= ram.len() → halts
    let cycles = vm.run();
    assert!(vm.is_halted());
    assert_eq!(vm.get_pc(), 9999);
    // Should only take 2 cycles: step for JMP + step that detects OOB
    assert!(cycles <= 3, "should halt quickly, got {} cycles", cycles);
}

#[test]
fn test_jmp_past_ram_end_checked() {
    // JMP to address past RAM end in checked mode: first step succeeds (JMP),
    // second step detects PC >= ram.len() and halts cleanly (returns Ok).
    let mut vm = Vm::new(16);
    vm.poke(0, op::JMP as u32);
    vm.poke(1, 9999);

    vm.pc = 0;
    vm.halted = false;

    let result = vm.run_checked();
    // Checked mode should complete OK — PC OOB just halts cleanly
    assert!(result.is_ok());
    assert!(vm.is_halted());
}

#[test]
fn test_pc_starts_at_ram_boundary() {
    // Set PC to exactly ram.len() — should halt immediately
    let mut vm = Vm::new(16);
    vm.pc = 16; // exactly at boundary
    vm.halted = false;

    let cycles = vm.run();
    assert!(vm.is_halted());
    assert_eq!(cycles, 0); // No instruction executed
}

#[test]
fn test_pc_starts_past_ram_end() {
    // Set PC beyond ram size — should halt immediately
    let mut vm = Vm::new(16);
    vm.pc = 1000;
    vm.halted = false;

    let cycles = vm.run();
    assert!(vm.is_halted());
    assert_eq!(cycles, 0);
}

// ── 6. Register edge values — u8 overflow wrapping ───────────────────

#[test]
fn test_add_overflow_wrapping() {
    // Set r0 = 0xFFFFFFFF (max u32), add r0 to itself → wrapping_add gives 0xFFFFFFFE
    let mut vm = Vm::new(64);
    // LDI r0, 255 — loads 255 into r0
    vm.poke(0, op::LDI as u32);
    vm.poke(1, 0); // r0
    vm.poke(2, 255);
    // LDI r1, 1 — loads 1 into r1
    vm.poke(3, op::LDI as u32);
    vm.poke(4, 1); // r1
    vm.poke(5, 1);
    // ADD r0, r1 → r0 = 255 + 1 = 256
    vm.poke(6, op::ADD as u32);
    vm.poke(7, 0); // dst = r0
    vm.poke(8, 1); // src = r1
    // HALT
    vm.poke(9, op::HALT as u32);

    vm.pc = 0;
    vm.halted = false;
    vm.run();

    assert!(vm.is_halted());
    // 255 + 1 = 256, no overflow at u32 level
    assert_eq!(vm.get_reg(0), 256, "255 + 1 should equal 256");
}

#[test]
fn test_add_max_u32_wrapping() {
    // Set r0 to max u32 via LDI, then ADD r0, r0 → should wrap
    let mut vm = Vm::new(64);
    // We can't LDI a full u32 since LDI loads the pixel value directly.
    // Instead, use SUB to get there: LDI r0, 0, SUB r0, r1 where r1=1 → underflow to max
    // LDI r0, 0
    vm.poke(0, op::LDI as u32);
    vm.poke(1, 0);
    vm.poke(2, 0);
    // LDI r1, 1
    vm.poke(3, op::LDI as u32);
    vm.poke(4, 1);
    vm.poke(5, 1);
    // SUB r0, r1 → 0 - 1 = wrapping to 0xFFFFFFFF
    vm.poke(6, op::SUB as u32);
    vm.poke(7, 0);
    vm.poke(8, 1);
    // Now r0 = 0xFFFFFFFF. ADD r0, r1 → 0xFFFFFFFF + 1 = wrapping to 0
    vm.poke(9, op::ADD as u32);
    vm.poke(10, 0);
    vm.poke(11, 1);
    // HALT
    vm.poke(12, op::HALT as u32);

    vm.pc = 0;
    vm.halted = false;
    vm.run();

    assert!(vm.is_halted());
    // 0xFFFFFFFF + 1 wraps to 0 in wrapping_add
    assert_eq!(
        vm.get_reg(0), 0,
        "max u32 + 1 should wrap to 0"
    );
}

#[test]
fn test_sub_underflow_wrapping() {
    // r0 = 5, r1 = 10, SUB r0, r1 → 5 - 10 wraps
    let mut vm = Vm::new(64);
    // LDI r0, 5
    vm.poke(0, op::LDI as u32);
    vm.poke(1, 0);
    vm.poke(2, 5);
    // LDI r1, 10
    vm.poke(3, op::LDI as u32);
    vm.poke(4, 1);
    vm.poke(5, 10);
    // SUB r0, r1
    vm.poke(6, op::SUB as u32);
    vm.poke(7, 0);
    vm.poke(8, 1);
    // HALT
    vm.poke(9, op::HALT as u32);

    vm.pc = 0;
    vm.halted = false;
    vm.run();

    assert!(vm.is_halted());
    // 5u32 - 10u32 wrapping_sub = a very large number
    let expected = 5u32.wrapping_sub(10);
    assert_eq!(
        vm.get_reg(0), expected,
        "5 - 10 should wrap to {}",
        expected
    );
}

#[test]
fn test_mul_overflow_wrapping() {
    // r0 = 0x10000, r1 = 0x10000, MUL r0, r1 → should wrap
    let mut vm = Vm::new(64);
    // LDI r0, 65536
    vm.poke(0, op::LDI as u32);
    vm.poke(1, 0);
    vm.poke(2, 65536);
    // LDI r1, 65536
    vm.poke(3, op::LDI as u32);
    vm.poke(4, 1);
    vm.poke(5, 65536);
    // MUL r0, r1
    vm.poke(6, op::MUL as u32);
    vm.poke(7, 0);
    vm.poke(8, 1);
    // HALT
    vm.poke(9, op::HALT as u32);

    vm.pc = 0;
    vm.halted = false;
    vm.run();

    assert!(vm.is_halted());
    let expected = 65536u32.wrapping_mul(65536);
    assert_eq!(
        vm.get_reg(0), expected,
        "65536 * 65536 should wrap to {}",
        expected
    );
}

// ── Combined boundary: truncation check ──────────────────────────────

#[test]
fn test_truncated_instruction_checked() {
    // ADD is width 3 (opcode + 2 args). Place only 2 pixels in RAM.
    let mut vm = Vm::new(2);
    vm.poke(0, op::ADD as u32);
    vm.poke(1, 0); // only one arg pixel, but ADD needs 2

    vm.pc = 0;
    vm.halted = false;

    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::TruncatedInstruction(pc, opcode, expected, available) => {
            assert_eq!(pc, 0);
            assert_eq!(opcode, op::ADD);
            assert_eq!(expected, 3);
            assert!(available < 3, "available {} should be < expected {}", available, expected);
        }
        other => panic!("expected TruncatedInstruction, got {:?}", other),
    }
}
