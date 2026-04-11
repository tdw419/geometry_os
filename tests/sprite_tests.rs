// Sprite system integration tests

use geometry_os::assembler;

/// Verify that sprites-demo.gasm assembles without errors.
#[test]
fn sprites_demo_assembles() {
    let src =
        std::fs::read_to_string("programs/sprites-demo.gasm").expect("sprites-demo.gasm should exist");
    let asm = assembler::assemble(&src).expect("sprites-demo.gasm should assemble");
    assert!(asm.pixels.len() > 0, "sprites-demo should produce bytecode");
    assert!(
        asm.labels.contains_key("main"),
        "should have a 'main' label"
    );
    assert!(
        asm.labels.contains_key("child_start"),
        "should have a 'child_start' label"
    );
}

/// Verify that lib/sprite.gasm assembles without errors.
#[test]
fn sprite_lib_assembles() {
    let src =
        std::fs::read_to_string("lib/sprite.gasm").expect("lib/sprite.gasm should exist");
    let asm = assembler::assemble(&src).expect("lib/sprite.gasm should assemble");
    assert!(asm.pixels.len() > 0, "sprite lib should produce bytecode");
    assert!(
        asm.labels.contains_key("spawn_at"),
        "should have a 'spawn_at' routine"
    );
    assert!(
        asm.labels.contains_key("spawn_simple"),
        "should have a 'spawn_simple' routine"
    );
}

/// Verify that the sprite demo spawns children when run.
#[test]
fn sprites_demo_spawns_children() {
    let src =
        std::fs::read_to_string("programs/sprites-demo.gasm").expect("sprites-demo.gasm should exist");
    let asm = assembler::assemble(&src).expect("sprites-demo.gasm should assemble");

    let mut vm = geometry_os::vm::Vm::new(65536);
    vm.load_program(&asm.pixels);
    vm.run();

    // The parent should have spawned 2 children via SPAWNAT
    assert!(
        vm.children.len() >= 2,
        "should spawn at least 2 children, got {}",
        vm.children.len()
    );

    // First child should be at (10, 10)
    assert_eq!(vm.children[0].x, 10, "first sprite x should be 10");
    assert_eq!(vm.children[0].y, 10, "first sprite y should be 10");

    // Second child should be at (100, 50)
    assert_eq!(vm.children[1].x, 100, "second sprite x should be 100");
    assert_eq!(vm.children[1].y, 50, "second sprite y should be 50");
}
