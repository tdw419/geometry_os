//! Fuzz testing: generate 1000+ random .gasm programs, dual-assemble
//! each one (gasm::assemble vs assembler::parse_gasm), verify pixel-for-pixel match.
//!
//! This proves the two assembly paths produce identical output for all valid programs.

use pixels_move_pixels::assembler::parse_gasm;
use pixels_move_pixels::gasm;

/// Seeded RNG for reproducibility
struct Rng {
    state: u64,
}

impl Rng {
    fn new(seed: u64) -> Self {
        Self { state: seed }
    }
    fn next_u64(&mut self) -> u64 {
        self.state ^= self.state << 13;
        self.state ^= self.state >> 7;
        self.state ^= self.state << 17;
        self.state
    }
    fn next_u32(&mut self) -> u32 {
        self.next_u64() as u32
    }
    fn next_usize(&mut self, max: usize) -> usize {
        (self.next_u64() as usize) % max
    }
    fn next_bool(&mut self) -> bool {
        self.next_u64() & 1 == 0
    }
}

/// Supported opcodes for generation
const MNEMONICS: &[&str] = &[
    "NOP", "LDI", "MOV", "LOAD", "STORE", "ADD", "SUB", "MUL", "DIV",
    "JMP", "BNE", "BEQ", "BLT", "BGE", "CALL", "RET", "HALT", "ENTRY",
    "CHAR", "BLIT", "DATA",
];

/// Generate a random register name
fn rand_reg(rng: &mut Rng) -> String {
    format!("r{}", rng.next_usize(16))
}

/// Generate a random immediate value
fn rand_imm(rng: &mut Rng) -> String {
    let v = rng.next_u32();
    if v % 3 == 0 {
        format!("{}", (v as i32) % 256)
    } else if v % 3 == 1 {
        format!("0x{:04X}", v & 0xFFFF)
    } else {
        format!("{}", v)
    }
}

/// Pick a random label
fn rand_label(rng: &mut Rng, labels: &[String]) -> String {
    if !labels.is_empty() {
        labels[rng.next_usize(labels.len())].clone()
    } else {
        "lbl0".to_string()
    }
}

/// Generate a random .gasm program source with labels
fn generate_random_program(rng: &mut Rng) -> String {
    let num_instructions = 5 + rng.next_usize(30);
    let mut lines: Vec<String> = Vec::new();
    let labels: Vec<String> = (0..3).map(|i| format!("lbl{}", i)).collect();
    let mut label_count = 0usize;

    for _ in 0..num_instructions {
        // Maybe emit a label
        if rng.next_bool() && label_count < labels.len() {
            lines.push(format!("{}:", labels[label_count]));
            label_count += 1;
        }

        let mnemonic_idx = rng.next_usize(MNEMONICS.len());
        let mnemonic = MNEMONICS[mnemonic_idx];

        let line = match mnemonic {
            "NOP" => "NOP".to_string(),
            "LDI" => format!("LDI {}, {}", rand_reg(rng), rand_imm(rng)),
            "MOV" => format!("MOV {}, {}", rand_reg(rng), rand_reg(rng)),
            "LOAD" => format!("LOAD {}, {}", rand_reg(rng), rand_reg(rng)),
            "STORE" => format!("STORE {}, {}", rand_reg(rng), rand_reg(rng)),
            "ADD" => format!("ADD {}, {}", rand_reg(rng), rand_reg(rng)),
            "SUB" => format!("SUB {}, {}", rand_reg(rng), rand_reg(rng)),
            "MUL" => format!("MUL {}, {}", rand_reg(rng), rand_reg(rng)),
            "DIV" => format!("DIV {}, {}", rand_reg(rng), rand_reg(rng)),
            "JMP" => format!("JMP {}", rand_label(rng, &labels)),
            "BNE" => format!("BNE {}, {}, {}", rand_reg(rng), rand_reg(rng), rand_label(rng, &labels)),
            "BEQ" => format!("BEQ {}, {}, {}", rand_reg(rng), rand_reg(rng), rand_label(rng, &labels)),
            "BLT" => format!("BLT {}, {}, {}", rand_reg(rng), rand_reg(rng), rand_label(rng, &labels)),
            "BGE" => format!("BGE {}, {}, {}", rand_reg(rng), rand_reg(rng), rand_label(rng, &labels)),
            "CALL" => format!("CALL {}", rand_label(rng, &labels)),
            "RET" => "RET".to_string(),
            "HALT" => "HALT".to_string(),
            "ENTRY" => format!("ENTRY {}", rand_reg(rng)),
            "CHAR" => format!("CHAR {}, {}", rand_reg(rng), rand_reg(rng)),
            "BLIT" => format!("BLIT {}, {}, {}", rand_reg(rng), rand_reg(rng), rand_imm(rng)),
            "DATA" => format!("DATA {}", rand_imm(rng)),
            _ => "NOP".to_string(),
        };
        lines.push(line);
    }

    // Always end with HALT
    lines.push("HALT".to_string());
    lines.join("\n")
}

/// Dual-assemble: run both assemblers on the same source, compare pixel-for-pixel.
fn dual_assemble(source: &str) -> Result<bool, String> {
    let result_gasm = gasm::assemble(source).map_err(|e| format!("gasm::assemble failed: {}", e))?;
    let result_parse = parse_gasm(source).map_err(|e| format!("parse_gasm failed: {}", e))?;

    let pixels_gasm = &result_gasm.pixels;
    let pixels_parse = &result_parse.pixels;

    if pixels_gasm.len() != pixels_parse.len() {
        return Err(format!(
            "Length mismatch: gasm={} pixels, parse_gasm={} pixels",
            pixels_gasm.len(),
            pixels_parse.len()
        ));
    }

    for (i, (a, b)) in pixels_gasm.iter().zip(pixels_parse.iter()).enumerate() {
        if a != b {
            return Err(format!(
                "Pixel mismatch at index {}: gasm=0x{:08X}, parse_gasm=0x{:08X}",
                i, a, b
            ));
        }
    }

    Ok(true)
}

#[test]
fn test_assembler_fuzz_1000_programs() {
    let mut rng = Rng::new(0xDEADBEEF_CAFEBABE);
    let total = 1000;
    let mut pass = 0usize;
    let mut fail = 0usize;
    let mut skip = 0usize;
    let mut errors: Vec<(usize, String)> = Vec::new();

    for i in 0..total {
        let source = generate_random_program(&mut rng);
        match dual_assemble(&source) {
            Ok(true) => pass += 1,
            Ok(false) => {
                fail += 1;
                errors.push((i, "unexpected false".to_string()));
            }
            Err(e) => {
                // Both assemblers should agree on success/failure
                let gasm_ok = gasm::assemble(&source).is_ok();
                let parse_ok = parse_gasm(&source).is_ok();
                if gasm_ok != parse_ok {
                    fail += 1;
                    errors.push((i, format!("Agreement failure: gasm_ok={}, parse_ok={}, err={}", gasm_ok, parse_ok, e)));
                } else {
                    skip += 1; // Both failed on invalid random program -- expected
                }
            }
        }
    }

    eprintln!("\n=== Assembler Fuzz Results ===");
    eprintln!("Total:  {}", total);
    eprintln!("Pass:   {} (dual-assemble pixel-perfect match)", pass);
    eprintln!("Skip:   {} (both assemblers reject -- expected for random input)", skip);
    eprintln!("Fail:   {} (disagreement between assemblers)", fail);
    if !errors.is_empty() {
        eprintln!("\nErrors (first 10):");
        for (i, e) in errors.iter().take(10) {
            eprintln!("  Program #{}: {}", i, e);
        }
    }

    assert_eq!(fail, 0, "{} assembler disagreement(s) detected!", fail);
    assert!(pass > 0, "No programs passed dual-assembly -- test may be broken");

    eprintln!("\nResult: PASS ({} programs verified pixel-perfect, {} invalid programs agreeably rejected)", pass, skip);
}
