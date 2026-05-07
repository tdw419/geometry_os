#[test]
fn test_raycaster_dda_trace() {
    let source = std::fs::read_to_string("programs/raycaster.asm").unwrap();
    let asm = geometry_os::assembler::assemble(&source, 0).unwrap();
    let mut vm = geometry_os::vm::Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;

    // Trace DDA for first few entries, showing every state change
    let mut prev_my = 255u32;
    let mut prev_mx = 255u32;
    let mut entries = 0;

    for step in 0..500_000 {
        if !vm.step() { break; }
        if vm.frame_ready {
            let mut nb = 0;
            let mut w = 0;
            for &px in &vm.screen {
                if px != 0 { nb += 1; }
                if px == 0xCC6633 || px == 0x884422 { w += 1; }
            }
            println!("FRAME step={} non_black={} walls={}", step, nb, w);
            return;
        }

        let mx = vm.regs[14];
        let my = vm.regs[15];
        if mx != prev_mx || my != prev_my {
            entries += 1;
            if entries <= 30 {
                let sdx = vm.regs[16];
                let sdy = vm.regs[17];
                println!(
                    "DDA #{}: mx={} my={} sdx={} sdy={}",
                    entries, mx, my, sdx, sdy
                );
            }
            prev_mx = mx;
            prev_my = my;
        }
    }
    println!("No frame after 500K. Entries={}", entries);
}
