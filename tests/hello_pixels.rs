// Hello Pixels Test
//
// Write a simple program that stores a value into substrate memory.
// LD/ST are pixel-addressed: the register holds a Hilbert pixel index.

use pixels_move_pixels::{assembler, vm::GlyphVm};

#[test]
fn hello_pixels() {
    let mut vm = GlyphVm::new();

    let mut p = assembler::Program::new();
    p.ldi(0, 200); // r0 = pixel address 200
    p.ldi(1, 42); // r1 = 42
    p.store(0, 1); // pixel[200] = 42
    p.halt();

    vm.substrate().load_program(0, &p.pixels);
    vm.spawn_vm(0, 0);
    vm.execute_frame();

    let value = vm.substrate().peek(200);
    println!("  mem[200] = {} (expected 42)", value);
    assert_eq!(value, 42, "pixel 200 should contain 42 after GPU write");

    println!("\n  Pixels wrote pixels. Hello from the GPU.\n");
}
