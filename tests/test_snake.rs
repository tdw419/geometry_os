use geometry_os::assembler;
use geometry_os::vm::Vm;
use std::path::Path;

#[test]
fn test_snake_assembles_and_runs() {
    let path = Path::new("programs/snake.gasm");
    let asm = assembler::assemble_file(path, &[Path::new(".")])
        .expect("snake.gasm should assemble without errors");
    
    assert!(!asm.pixels.is_empty(), "snake.gasm should produce bytecode");
    
    // Load into a large VM (snake uses 0x1100+ for body buffer)
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);
    
    // Run for a limited number of cycles
    for _ in 0..5000 {
        if vm.halted {
            break;
        }
        vm.step();
    }
    
    // VM should NOT be halted (snake runs forever until game over)
    assert!(!vm.halted, "snake game should not halt during normal play");
}
