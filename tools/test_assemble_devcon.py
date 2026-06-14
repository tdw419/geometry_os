#!/usr/bin/env python3
"""Assemble devcon.asm and report any errors."""
import subprocess
import sys
from pathlib import Path

GEOS = Path.home() / "projects/zion/projects/geometry_os/geometry_os"

# Use the GeOS CLI to assemble the file
# Alternatively, write a small Rust test to assemble it
# Let's try using the python-based test approach

# Write an inline Rust test that assembles the program
test_code = '''
#[test]
fn assemble_devcon() {
    let source = std::fs::read_to_string("programs/devcon.asm")
        .expect("devcon.asm should exist");
    let pp = geometry_os::preprocessor::Preprocessor::new();
    let preprocessed = pp.preprocess(&source);
    let result = geometry_os::assembler::assemble(&preprocessed, 0x1000);
    match result {
        Ok(asm) => {
            println!("OK: {} words assembled", asm.pixels.len());
        }
        Err(e) => {
            panic!("Assembly failed: {}", e);
        }
    }
}
'''

# Instead, just use cargo test with a filter
result = subprocess.run(
    ["cargo", "test", "--lib", "--", "devcon", "--nocapture"],
    cwd=str(GEOS),
    capture_output=True, text=True, timeout=120
)

# If no test named devcon exists, write a temp test file
if "0 passed" in result.stdout and "0 filtered" in result.stdout:
    # Write a quick test
    test_rs = GEOS / "programs" / "test_devcon.rs"
    # Actually put it in the program_tests directory
    test_dir = GEOS / "tests" / "program_tests"
    test_dir.mkdir(parents=True, exist_ok=True)
    test_file = test_dir / "test_devcon_assemble.rs"
    test_file.write_text('''
#[test]
fn assemble_devcon() {
    let source = std::fs::read_to_string(
        std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("programs/devcon.asm")
    ).expect("devcon.asm should exist");
    let pp = geometry_os::preprocessor::Preprocessor::new();
    let preprocessed = pp.preprocess(&source);
    let result = geometry_os::assembler::assemble(&preprocessed, 0x1000);
    assert!(result.is_ok(), "Assembly failed: {:?}", result.err());
    let asm = result.unwrap();
    println!("OK: {} words assembled", asm.pixels.len());
}
''')
    print(f"Wrote test to {test_file}")
    
    result = subprocess.run(
        ["cargo", "test", "--", "assemble_devcon", "--nocapture"],
        cwd=str(GEOS),
        capture_output=True, text=True, timeout=120
    )

print(result.stdout)
if result.stderr:
    print("STDERR:", result.stderr[:500])
print("Exit:", result.returncode)
