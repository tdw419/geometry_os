#[test]
fn test_dungeon_renders() {
    let source = std::fs::read_to_string("programs/dungeon.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    let mut frames = 0u32;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames += 1;
            if frames >= 1 {
                break;
            }
        }
    }
    assert!(frames >= 1, "dungeon should render at least 1 frame");

    let non_black = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        non_black > 2000,
        "screen should have >2000 non-black pixels, got {}",
        non_black
    );

    let floor = (0..1024).filter(|&i| vm.ram[0x2000 + i] == 1).count();
    assert!(
        floor > 20,
        "tile map should have >20 floor tiles, got {}",
        floor
    );

    let explored = (0..1024).filter(|&i| vm.ram[0x3000 + i] == 2).count();
    assert!(
        explored > 10,
        "visibility should have >10 explored tiles, got {}",
        explored
    );
}

#[test]
fn test_dungeon_fog_of_war() {
    let source = std::fs::read_to_string("programs/dungeon.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    let mut frames = 0u32;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames += 1;
            if frames >= 1 {
                break;
            }
        }
    }

    let fog = vm.screen.iter().filter(|&&p| p == 0x5566AA).count();
    assert!(
        fog > 500,
        "visible walls should cover >500 pixels, got {}",
        fog
    );

    let floor_visible = vm.screen.iter().filter(|&&p| p == 0x8888CC).count();
    assert!(
        floor_visible > 500,
        "visible floor should cover >500 pixels, got {}",
        floor_visible
    );
}

#[test]
fn test_dungeon_player_marker() {
    let source = std::fs::read_to_string("programs/dungeon.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    let mut frames = 0u32;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames += 1;
            if frames >= 1 {
                break;
            }
        }
    }

    let player = vm.screen.iter().filter(|&&p| p == 0x00FF88).count();
    assert!(
        player >= 4,
        "player marker should be >=4 green pixels, got {}",
        player
    );
}

#[test]
fn test_dungeon_four_rooms_bsp() {
    let source = std::fs::read_to_string("programs/dungeon.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    let mut frames = 0u32;
    for _ in 0..10_000_000 {
        if !vm.step() {
            break;
        }
        if vm.frame_ready {
            vm.frame_ready = false;
            frames += 1;
            if frames >= 1 {
                break;
            }
        }
    }

    // BSP creates 4 rooms stored at 16-word intervals: 0x4100, 0x4110, 0x4120, 0x4130
    for i in 0..4u32 {
        let base: usize = 0x4100 + (i * 16) as usize;
        let x = vm.ram[base];
        let y = vm.ram[base + 1];
        let w = vm.ram[base + 2];
        let h = vm.ram[base + 3];
        assert!(x < 32, "room {} x={} out of bounds", i, x);
        assert!(y < 32, "room {} y={} out of bounds", i, y);
        assert!(w >= 2, "room {} w={} too small", i, w);
        assert!(h >= 2, "room {} h={} too small", i, h);
        assert!(x + w <= 32, "room {} x+w overflows", i);
        assert!(y + h <= 32, "room {} y+h overflows", i);

        // Verify room tiles are actually carved
        let center_y = y + h / 2;
        let center_x = x + w / 2;
        let tile_idx = (center_y * 32 + center_x) as usize;
        assert_eq!(
            vm.ram[0x2000 + tile_idx],
            1,
            "room {} center tile ({}, {}) should be floor",
            i,
            center_x,
            center_y
        );
    }

    // Total floor tiles from 4 rooms + corridors
    let floor = (0..1024).filter(|&i| vm.ram[0x2000 + i] == 1).count();
    assert!(
        floor > 30,
        "4 rooms + corridors should yield >30 floor tiles, got {}",
        floor
    );
}
