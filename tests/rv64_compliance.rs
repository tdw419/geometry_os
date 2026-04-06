//! Phase 8D: RV64 Compliance Tests
//!
//! Tests RV64I base instruction set compliance against RISC-V spec.
//! These tests encode instructions manually and verify the CPU executes correctly.

use pixels_move_pixels::rv64::executor::Rv64Cpu;

fn encode_r_type(funct7: u32, rs2: u32, rs1: u32, funct3: u32, rd: u32, opcode: u32) -> u32 {
    (funct7 << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode
}

fn encode_i_type(imm: u32, rs1: u32, funct3: u32, rd: u32, opcode: u32) -> u32 {
    ((imm & 0xFFF) << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | opcode
}

fn encode_s_type(imm: u32, rs2: u32, rs1: u32, funct3: u32, opcode: u32) -> u32 {
    ((imm >> 5) << 25) | (rs2 << 20) | (rs1 << 15) | (funct3 << 12) | ((imm & 0x1F) << 7) | opcode
}

fn encode_b_type(imm: u32, rs2: u32, rs1: u32, funct3: u32, opcode: u32) -> u32 {
    (((imm >> 12) & 1) << 31) | (((imm >> 5) & 0x3F) << 25) | (rs2 << 20) | (rs1 << 15) |
    (funct3 << 12) | (((imm >> 1) & 0xF) << 8) | (((imm >> 11) & 1) << 7) | opcode
}

fn encode_u_type(imm: u32, rd: u32, opcode: u32) -> u32 {
    (imm << 12) | (rd << 7) | opcode
}

fn encode_j_type(imm: u32, rd: u32, opcode: u32) -> u32 {
    (((imm >> 20) & 1) << 31) | (((imm >> 1) & 0x3FF) << 21) | (((imm >> 11) & 1) << 20) |
    (((imm >> 12) & 0xFF) << 12) | (rd << 7) | opcode
}

/// Load a program (list of u32 instructions) into CPU at address 0x80000000
fn load_program(cpu: &mut Rv64Cpu, program: &[u32]) {
    let base = 0x8000_0000u64;
    for (i, &inst) in program.iter().enumerate() {
        cpu.store_word(base + (i as u64) * 4, inst);
    }
    cpu.pc = base;
}

#[test]
fn test_rv64_addi() {
    let mut cpu = Rv64Cpu::new();
    // ADDI x1, x0, 42
    load_program(&mut cpu, &[
        encode_i_type(42, 0, 0, 1, 0x13), // x1 = 42
    ]);
    cpu.step();
    assert_eq!(cpu.x[1], 42);
}

#[test]
fn test_rv64_add() {
    let mut cpu = Rv64Cpu::new();
    cpu.x[1] = 100;
    cpu.x[2] = 200;
    // ADD x3, x1, x2
    load_program(&mut cpu, &[
        encode_r_type(0, 2, 1, 0, 3, 0x33),
    ]);
    cpu.step();
    assert_eq!(cpu.x[3], 300);
}

#[test]
fn test_rv64_sub() {
    let mut cpu = Rv64Cpu::new();
    cpu.x[1] = 200;
    cpu.x[2] = 50;
    // SUB x3, x1, x2
    load_program(&mut cpu, &[
        encode_r_type(0x20, 2, 1, 0, 3, 0x33),
    ]);
    cpu.step();
    assert_eq!(cpu.x[3], 150);
}

#[test]
fn test_rv64_lui() {
    let mut cpu = Rv64Cpu::new();
    // LUI x1, 0x12345
    load_program(&mut cpu, &[
        encode_u_type(0x12345, 1, 0x37),
    ]);
    cpu.step();
    assert_eq!(cpu.x[1], 0x12345000);
}

#[test]
fn test_rv64_auipc() {
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    // AUIPC x1, 0x100
    load_program(&mut cpu, &[
        encode_u_type(0x100, 1, 0x17),
    ]);
    cpu.pc = base;
    cpu.step();
    assert_eq!(cpu.x[1], base + 0x100000);
}

#[test]
fn test_rv64_jal() {
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    // JAL x1, 8  (jump forward 8 bytes)
    load_program(&mut cpu, &[
        encode_j_type(8, 1, 0x6F),
    ]);
    cpu.pc = base;
    cpu.step();
    assert_eq!(cpu.x[1], base + 4); // return address
    assert_eq!(cpu.pc, base + 8);   // jumped to base+8
}

#[test]
fn test_rv64_jalr() {
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    cpu.x[2] = base + 0x100;
    // JALR x1, x2, 0
    load_program(&mut cpu, &[
        encode_i_type(0, 2, 0, 1, 0x67),
    ]);
    cpu.pc = base;
    cpu.step();
    assert_eq!(cpu.x[1], base + 4);
    assert_eq!(cpu.pc, base + 0x100);
}

#[test]
fn test_rv64_beq_taken() {
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    cpu.x[1] = 42;
    cpu.x[2] = 42;
    // BEQ x1, x2, +8
    load_program(&mut cpu, &[
        encode_b_type(8, 2, 1, 0, 0x63),
    ]);
    cpu.pc = base;
    cpu.step();
    assert_eq!(cpu.pc, base + 8);
}

#[test]
fn test_rv64_beq_not_taken() {
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    cpu.x[1] = 42;
    cpu.x[2] = 99;
    // BEQ x1, x2, +8
    load_program(&mut cpu, &[
        encode_b_type(8, 2, 1, 0, 0x63),
    ]);
    cpu.pc = base;
    cpu.step();
    assert_eq!(cpu.pc, base + 4);
}

#[test]
fn test_rv64_blt() {
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    cpu.x[1] = 10;
    cpu.x[2] = 20;
    // BLT x1, x2, +8
    load_program(&mut cpu, &[
        encode_b_type(8, 2, 1, 4, 0x63),
    ]);
    cpu.pc = base;
    cpu.step();
    assert_eq!(cpu.pc, base + 8); // taken (10 < 20)
}

#[test]
fn test_rv64_lw_sw() {
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    cpu.x[1] = base + 0x1000; // address
    cpu.x[2] = 0xDEADBEEFu64;
    // SW x2, 0(x1)
    // LW x3, 0(x1)
    load_program(&mut cpu, &[
        encode_s_type(0, 2, 1, 2, 0x23), // SW
        encode_i_type(0, 1, 2, 3, 0x03), // LW
    ]);
    cpu.pc = base;
    cpu.step(); // SW
    cpu.step(); // LW
    assert_eq!(cpu.x[3], 0xDEADBEEFu64);
}

#[test]
fn test_rv64_ld_sd() {
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    cpu.x[1] = base + 0x2000;
    cpu.x[2] = 0x123456789ABCDEF0u64;
    // SD x2, 0(x1)
    // LD x3, 0(x1)
    load_program(&mut cpu, &[
        encode_s_type(0, 2, 1, 3, 0x23), // SD (funct3=3)
        encode_i_type(0, 1, 3, 3, 0x03), // LD (funct3=3)
    ]);
    cpu.pc = base;
    cpu.step();
    cpu.step();
    assert_eq!(cpu.x[3], 0x123456789ABCDEF0u64);
}

#[test]
fn test_rv64_slli_srli() {
    let mut cpu = Rv64Cpu::new();
    // SLLI x1, x0, 10  => x1 = 0 << 10 = 0, need non-zero src
    cpu.x[1] = 1;
    load_program(&mut cpu, &[
        encode_i_type(10 << 10, 1, 1, 1, 0x13), // SLLI x1, x1, 10
    ]);
    // Actually SLLI uses shamt in bits 25:20 for RV64
    let slli = (10u32 << 20) | (1 << 15) | (1 << 12) | (1 << 7) | 0x13;
    let mut cpu2 = Rv64Cpu::new();
    cpu2.x[1] = 1;
    load_program(&mut cpu2, &[slli]);
    cpu2.step();
    assert_eq!(cpu2.x[1], 1024); // 1 << 10

    // SRLI
    let srli = (10u32 << 20) | (1 << 15) | (5 << 12) | (1 << 7) | 0x13;
    cpu2.x[1] = 1024;
    load_program(&mut cpu2, &[srli]);
    cpu2.pc = 0x8000_0000;
    cpu2.step();
    assert_eq!(cpu2.x[1], 1);
}

#[test]
fn test_rv64_slt_sltu() {
    let mut cpu = Rv64Cpu::new();
    cpu.x[1] = (-1i64) as u64; // 0xFFFF...
    cpu.x[2] = 1;
    // SLT x3, x1, x2 => -1 < 1 => 1
    load_program(&mut cpu, &[
        encode_r_type(0, 2, 1, 2, 3, 0x33),
    ]);
    cpu.step();
    assert_eq!(cpu.x[3], 1); // signed: -1 < 1

    // SLTU x3, x1, x2 => 0xFFFF... < 1 => 0
    let mut cpu2 = Rv64Cpu::new();
    cpu2.x[1] = (-1i64) as u64;
    cpu2.x[2] = 1;
    load_program(&mut cpu2, &[
        encode_r_type(0, 2, 1, 3, 3, 0x33), // SLTU
    ]);
    cpu2.step();
    assert_eq!(cpu2.x[3], 0); // unsigned: 0xFFFF... > 1
}

#[test]
fn test_rv64_addiw() {
    let mut cpu = Rv64Cpu::new();
    cpu.x[1] = 0xFFFF_FFFF_FFFF_FFF0; // -16 as 64-bit
    // ADDIW x2, x1, 5 => truncate to 32: 0xFFFFFFF0 + 5 = 0xFFFFFFF5 => sign-ext to 64
    load_program(&mut cpu, &[
        encode_i_type(5, 1, 0, 2, 0x1B),
    ]);
    cpu.step();
    assert_eq!(cpu.x[2], 0xFFFF_FFFF_FFFF_FFF5); // sign-extended from 32-bit
}

#[test]
fn test_rv64_addw_subw() {
    let mut cpu = Rv64Cpu::new();
    cpu.x[1] = 0x1_0000_0008u64; // low 32 bits = 8
    cpu.x[2] = 0x2_0000_0003u64; // low 32 bits = 3
    // ADDW x3, x1, x2 => 8 + 3 = 11, sign-ext
    load_program(&mut cpu, &[
        encode_r_type(0, 2, 1, 0, 3, 0x3B),
    ]);
    cpu.step();
    assert_eq!(cpu.x[3], 11); // low 32 = 0xB, sign-ext = 0xB

    // SUBW
    let mut cpu2 = Rv64Cpu::new();
    cpu2.x[1] = 0x1_0000_0008;
    cpu2.x[2] = 0x2_0000_0003;
    load_program(&mut cpu2, &[
        encode_r_type(0x20, 2, 1, 0, 3, 0x3B),
    ]);
    cpu2.step();
    assert_eq!(cpu2.x[3], 5);
}

#[test]
fn test_rv64_mul_div() {
    let mut cpu = Rv64Cpu::new();
    cpu.x[1] = 7;
    cpu.x[2] = 6;
    // MUL x3, x1, x2
    load_program(&mut cpu, &[
        encode_r_type(1, 2, 1, 0, 3, 0x33),
    ]);
    cpu.step();
    assert_eq!(cpu.x[3], 42);

    // DIV
    let mut cpu2 = Rv64Cpu::new();
    cpu2.x[1] = 42;
    cpu2.x[2] = 7;
    load_program(&mut cpu2, &[
        encode_r_type(1, 2, 1, 4, 3, 0x33), // DIV
    ]);
    cpu2.step();
    assert_eq!(cpu2.x[3], 6);
}

#[test]
fn test_rv64_simple_loop() {
    // Compute sum of 1..10 using a loop
    let mut cpu = Rv64Cpu::new();
    let base = 0x8000_0000u64;
    // x1 = 0 (sum), x2 = 10 (counter), x3 = 0 (limit)
    cpu.x[1] = 0;
    cpu.x[2] = 10;
    cpu.x[3] = 0;
    // Loop:
    //   ADD x1, x1, x2    // sum += counter
    //   ADDI x2, x2, -1   // counter--
    //   BNE x2, x3, -8    // if counter != 0, goto loop
    load_program(&mut cpu, &[
        encode_r_type(0, 2, 1, 0, 1, 0x33),  // ADD x1, x1, x2
        encode_i_type(0xFFF, 2, 0, 2, 0x13), // ADDI x2, x2, -1
        encode_b_type((-8i32 as u32) & 0x1FFF, 3, 2, 1, 0x63), // BNE x2, x3, -8 (back to ADD)
    ]);
    cpu.pc = base;
    // DEBUG: trace execution
    for i in 0..35 {
        if cpu.halted {
            eprintln!("HALTED at step {}", i);
            break;
        }
        let pc = cpu.pc;
        let word = cpu.load_word(pc);
        eprintln!("Step {}: PC={:#x} word={:#010x} x1={} x2={} x3={}", 
                 i, pc, word, cpu.x[1], cpu.x[2], cpu.x[3]);
        cpu.step();
    }
    eprintln!("Final x1={} (expected 55)", cpu.x[1]);
    // 10+9+8+...+1 = 55
    assert_eq!(cpu.x[1], 55);
}

#[test]
fn test_rv64_x0_hardwired() {
    let mut cpu = Rv64Cpu::new();
    // ADDI x0, x0, 42 — should not change x0
    load_program(&mut cpu, &[
        encode_i_type(42, 0, 0, 0, 0x13),
    ]);
    cpu.step();
    assert_eq!(cpu.x[0], 0);
}

#[test]
fn test_rv64_slli_64bit() {
    let mut cpu = Rv64Cpu::new();
    cpu.x[1] = 1;
    // SLLI x1, x1, 40
    let slli = (40u32 << 20) | (1 << 15) | (1 << 12) | (1 << 7) | 0x13;
    load_program(&mut cpu, &[slli]);
    cpu.step();
    assert_eq!(cpu.x[1], 1u64 << 40);
}

#[test]
fn test_rv64_or_and_xor() {
    let mut cpu = Rv64Cpu::new();
    cpu.x[1] = 0xFF00;
    cpu.x[2] = 0x0FF0;
    // OR x3, x1, x2
    load_program(&mut cpu, &[
        encode_r_type(0, 2, 1, 6, 3, 0x33),
    ]);
    cpu.step();
    assert_eq!(cpu.x[3], 0xFFF0);

    // AND
    let mut cpu2 = Rv64Cpu::new();
    cpu2.x[1] = 0xFF00;
    cpu2.x[2] = 0x0FF0;
    load_program(&mut cpu2, &[
        encode_r_type(0, 2, 1, 7, 3, 0x33),
    ]);
    cpu2.step();
    assert_eq!(cpu2.x[3], 0x0F00);

    // XOR
    let mut cpu3 = Rv64Cpu::new();
    cpu3.x[1] = 0xFF00;
    cpu3.x[2] = 0x0FF0;
    load_program(&mut cpu3, &[
        encode_r_type(0, 2, 1, 4, 3, 0x33),
    ]);
    cpu3.step();
    assert_eq!(cpu3.x[3], 0xF0F0);
}

#[test]
fn test_rv64_ecall_halt() {
    let mut cpu = Rv64Cpu::new();
    // EBREAK should halt
    load_program(&mut cpu, &[
        0x00100073, // EBREAK
    ]);
    cpu.step();
    assert!(cpu.halted);
}
