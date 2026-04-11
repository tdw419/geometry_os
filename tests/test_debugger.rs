use std::path::Path;
use geometry_os::assembler::assemble_file;

#[test]
fn test_mini_debugger_assembles() {
    let path = Path::new("programs/mini-debugger.gasm");
    let inc = Path::new("lib");
    let result = assemble_file(path, &[inc]);
    match result {
        Ok(asm) => {
            println!("Assembled OK: {} pixels", asm.pixels.len());
            assert!(asm.pixels.len() > 0, "should produce bytecode");
        }
        Err(e) => {
            panic!("Assembly failed: {:?}", e);
        }
    }
}
