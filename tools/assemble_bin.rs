// Assembler tool to compile .asm files to binary bytecode
// Usage: cargo run --bin assemble_bin <input.asm> <output.bin>

use geometry_os::assembler;
use std::env;
use std::fs;
use std::io::Write;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args: Vec<String> = env::args().collect();

    if args.len() != 3 {
        eprintln!("Usage: {} <input.asm> <output.bin>", args[0]);
        eprintln!("Example: {} programs/editor.asm /tmp/editor.bin", args[0]);
        std::process::exit(1);
    }

    let input_path = &args[1];
    let output_path = &args[2];

    // Read the assembly source
    let source = fs::read_to_string(input_path)
        .map_err(|e| format!("Failed to read {}: {}", input_path, e))?;

    println!("Assembling {}...", input_path);
    println!("Source size: {} bytes", source.len());

    // Assemble the source code (base address 0x1000 is typical for programs)
    let base_addr = 0x1000;
    match assembler::assemble(&source, base_addr) {
        Ok(result) => {
            println!("Assembly successful!");
            println!("Bytecode words: {}", result.pixels.len());

            // Display warnings if any
            if !result.warnings.is_empty() {
                eprintln!("Warnings:");
                for warning in &result.warnings {
                    eprintln!("  {}", warning);
                }
            }

            // Convert u32 words to bytes (little-endian)
            let mut bytes = Vec::new();
            for word in &result.pixels {
                bytes.extend_from_slice(&word.to_le_bytes());
            }

            // Write to output file
            let mut file = fs::File::create(output_path)
                .map_err(|e| format!("Failed to create {}: {}", output_path, e))?;

            file.write_all(&bytes)
                .map_err(|e| format!("Failed to write {}: {}", output_path, e))?;

            println!("Wrote {} bytes to {}", bytes.len(), output_path);
            println!("Load address: 0x{:04X}", base_addr);
        },
        Err(err) => {
            eprintln!("Assembly error: {}", err);
            std::process::exit(1);
        },
    }

    Ok(())
}
