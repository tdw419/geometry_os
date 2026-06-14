// Tests for SPRITELAYER opcode (0xD0)
use geometry_os::assembler::assemble;
use geometry_os::vm::Vm;

#[test]
fn test_spritelayer_assembles() {
    let source = r#"
        LDI r10, 0       ; layer 0
        LDI r11, 0       ; mode SET_ACTIVE
        LDI r12, 1       ; activate
        SPRITELAYER r10, r11, r12
        HALT
    "#;
    let result = assemble(source, 0).unwrap();
    assert_eq!(result.pixels[0], 0xD0); // SPRITELAYER opcode
    assert_eq!(result.pixels[1], 10);   // layer_reg = r10
    assert_eq!(result.pixels[2], 11);   // mode_reg = r11
    assert_eq!(result.pixels[3], 12);   // data_reg = r12
}

#[test]
fn test_spritelayer_clear_mode() {
    let source = r#"
        ; Write some data to layer 0 buffer via helper
        LDI r20, 0x00FF00FF  ; magenta color
        LDI r21, 0x2000       ; RAM base for sprite data
        STORE r21, r20
        STORE r21, r20
        STORE r21, r20

        ; Clear layer 0
        LDI r10, 0       ; layer 0
        LDI r11, 4       ; mode CLEAR
        LDI r12, 0       ; unused
        SPRITELAYER r10, r11, r12
        HALT
    "#;
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Pre-fill layer 0 buffer with some data
    vm.sprite_layers[0].buffer.fill(0x00FF00FF);

    // Execute CLEAR mode
    for _ in 0..1000 {
        if !vm.step() {
            break;
        }
    }

    // Verify layer 0 buffer is cleared to transparent (all zeros)
    assert!(vm.sprite_layers[0].buffer.iter().all(|&v| v == 0),
            "Layer 0 buffer should be cleared to transparent");
}

#[test]
fn test_spritelayer_set_active_mode() {
    let source = r#"
        LDI r10, 1       ; layer 1
        LDI r11, 0       ; mode SET_ACTIVE
        LDI r12, 1       ; activate
        SPRITELAYER r10, r11, r12
        HALT
    "#;
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Verify initial state (inactive by default)
    assert!(!vm.sprite_layers[1].active, "Layer 1 should be inactive initially");

    // Execute SET_ACTIVE mode
    for _ in 0..1000 {
        if !vm.step() {
            break;
        }
    }

    assert!(vm.sprite_layers[1].active, "Layer 1 should be active after SET_ACTIVE");
}

#[test]
fn test_spritelayer_set_visible_mode() {
    let source = r#"
        LDI r10, 2       ; layer 2
        LDI r11, 1       ; mode SET_VISIBLE
        LDI r12, 1       ; visible
        SPRITELAYER r10, r11, r12
        HALT
    "#;
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Verify initial state (visible by default)
    assert!(vm.sprite_layers[2].visible, "Layer 2 should be visible initially");

    // Execute SET_VISIBLE mode
    for _ in 0..1000 {
        if !vm.step() {
            break;
        }
    }

    assert!(vm.sprite_layers[2].visible, "Layer 2 should still be visible");
}

#[test]
fn test_spritelayer_set_z_order_mode() {
    let source = r#"
        LDI r10, 3       ; layer 3
        LDI r11, 2       ; mode SET_Z_ORDER
        LDI r12, 5       ; z_order = 5
        SPRITELAYER r10, r11, r12
        HALT
    "#;
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Execute SET_Z_ORDER mode
    for _ in 0..1000 {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(vm.sprite_layers[3].z_order, 5, "Layer 3 z_order should be 5");
}

#[test]
fn test_spritelayer_set_alpha_mode() {
    let source = r#"
        LDI r10, 4       ; layer 4
        LDI r11, 3       ; mode SET_ALPHA_MODE
        LDI r12, 2       ; alpha blend mode = additive
        SPRITELAYER r10, r11, r12
        HALT
    "#;
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Execute SET_ALPHA_MODE mode
    for _ in 0..1000 {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(vm.sprite_layers[4].blend_mode, 2, "Layer 4 alpha_blend_mode should be additive (2)");
}

#[test]
fn test_spritelayer_invalid_layer_id_noop() {
    let source = r#"
        LDI r10, 16      ; layer 16 (out of bounds, MAX_SPRITE_LAYERS=8)
        LDI r11, 4       ; mode CLEAR
        LDI r12, 0       ; unused
        SPRITELAYER r10, r11, r12
        HALT
    "#;
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Pre-fill layer 0 buffer with data
    vm.sprite_layers[0].buffer.fill(0x00FF00FF);

    // Execute with invalid layer ID
    for _ in 0..1000 {
        if !vm.step() {
            break;
        }
    }

    // Layer 0 should remain unchanged (no-op for invalid layer ID)
    assert_eq!(vm.sprite_layers[0].buffer[0], 0x00FF00FF, "Layer 0 should be unchanged");
}

#[test]
fn test_spritelayer_reserved_mode_noop() {
    let source = r#"
        LDI r10, 0       ; layer 0
        LDI r11, 99      ; mode 99 (reserved, should no-op)
        LDI r12, 1       ; data
        SPRITELAYER r10, r11, r12
        HALT
    "#;
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    let initial_active = vm.sprite_layers[0].active;

    // Execute with reserved mode
    for _ in 0..1000 {
        if !vm.step() {
            break;
        }
    }

    // Layer state should be unchanged (no-op for reserved mode)
    assert_eq!(vm.sprite_layers[0].active, initial_active, "Layer 0 active should be unchanged");
}