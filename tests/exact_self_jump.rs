/// Exact reproduction of self-jump test with per-pixel verification
use pixels_move_pixels::software_vm::SoftwareVm;

fn make_pixel(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
}
fn ldi(rd: u8, imm: u32) -> Vec<u32> { vec![make_pixel(1, 0, rd, 0), imm] }
fn halt() -> u32 { make_pixel(13, 0, 0, 0) }
fn frame(target_reg: u8) -> u32 { make_pixel(27, 0, target_reg, 0) }
fn sub(rd: u8, rs: u8) -> u32 { make_pixel(6, 0, rd, rs) }
fn bne(r1: u8, r2: u8, offset: i32) -> Vec<u32> {
    vec![make_pixel(10, 1, r1, r2), offset as u32]
}

#[test]
fn exact_self_jump_debug() {
    let mut prog: Vec<u32> = Vec::new();
    prog.extend(ldi(2, 1));        // 0-1
    prog.extend(ldi(1, 1000));     // 2-3
    prog.extend(ldi(0, 0));        // 4-5
    prog.push(sub(1, 2));          // 6
    prog.extend(bne(1, 2, 3));     // 7-8
    prog.push(halt());             // 9
    prog.push(frame(0));           // 10

    let entry = 1000u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry, &prog);
    vm.spawn_vm(0, entry);
    vm.vm_state_mut(0).frame_count = 1;
    vm.vm_state_mut(0).attention_mask = 0;

    // Verify every pixel
    for i in 0..prog.len() {
        let read_val = vm.peek(entry + i as u32);
        let opcode = read_val & 0xFF;
        let stratum = (read_val >> 8) & 0xFF;
        let p1 = (read_val >> 16) & 0xFF;
        let p2 = (read_val >> 24) & 0xFF;
        let name = match opcode {
            0 => "NOP", 1 => "LDI", 6 => "SUB", 10 => "BRANCH", 13 => "HALT", 27 => "FRAME", _ => "???"
        };
        eprintln!("  [{}] pixel {}: {} stratum={} p1={} p2={} (0x{:08X})",
            if read_val == prog[i] { "✓" } else { "✗" },
            i, name, stratum, p1, p2, read_val);
    }

    // Manually trace first iteration
    eprintln!("\n--- Manual trace ---");
    eprintln!("PC=1000 (pixel 0): LDI r2, [1]");
    eprintln!("PC=1002 (pixel 2): LDI r1, [1000]");
    eprintln!("PC=1004 (pixel 4): LDI r0, [0]");
    eprintln!("PC=1006 (pixel 6): SUB r1, r2 → r1=999");
    eprintln!("PC=1007 (pixel 7): BNE(stratum=1) r1,r2,offset");
    eprintln!("  imm at PC+1=1008: read val = 0x{:08X} = {}", vm.peek(entry + 8), vm.peek(entry + 8));
    eprintln!("  r1=999 != r2=1 → taken, new_pc = 1007 + 3 = 1010");
    eprintln!("PC=1010 (pixel 10): FRAME r0");
    
    let pixel10 = vm.peek(entry + 10);
    let op10 = pixel10 & 0xFF;
    eprintln!("  Pixel 10 opcode = {} (should be 27=FRAME)", op10);
    
    // If opcode 10 = 27 (FRAME), then it should work.
    // But what if the self-jump test uses entry=1000 and frame_size=65536,
    // so frame 0's base = 1000 + 0*65536 = 1000.
    // After FRAME, PC=1000 = back to pixel 0 (LDI r2, 1).
    // The LDI re-sets r2=1 (no change), LDI r1=1000 (RESETS counter!), etc.
    // So r1 resets to 1000 every iteration. The loop is infinite.
    // After 1024 cycles: still RUNNING.
    //
    // BUT: in the debug output we saw cycles=6 and pc=1010.
    // That means the FRAME at pixel 10 was executed (pc ended on it)
    // and the VM halted. But how? FRAME case 27 with target=0, count=1
    // should return true and jump.
    //
    // WAIT - I bet the issue is that FRAME at pixel 10 is being read
    // as opcode 27, but the read_glyph is reading it as a different value
    // because of a Hilbert mapping issue or the RamTexture storage.
    
    // Let me check: does load_program write at the RIGHT Hilbert address?
    // load_program(1000, pixels) calls poke(1000+i, pixels[i])
    // poke(addr, val) does hilbert::d2xy(addr) and writes at that (x,y)
    // read_glyph(ram, d) does hilbert::d2xy(d) and reads from that (x,y)
    // So if d=1010, it reads the pixel stored at Hilbert address 1010.
    // That's pixel 10 of our program. ✓
    
    // Let me also check if maybe the BNE is landing on HALT (pixel 9) instead of FRAME (pixel 10).
    // BNE offset +3 from pc=1007: new_pc = 1007 + 3 = 1010 → pixel 10 → FRAME ✓
    // 
    // But what if the offset is wrong? offset=3, stored as pixel 8.
    // Pixel 8 value = 0x00000003. When read as immediate:
    // safe_mem_read(ram, vm, (1007+1)*4) = safe_mem_read(ram, vm, 4032)
    // mem_read(ram, 4032) does pixel_idx = 4032/4 = 1008
    // read_glyph(ram, 1008) = pixel 8 = 0x00000003 = 3 ✓
    
    vm.execute_frame();
    
    let s = vm.vm_state(0);
    eprintln!("\n--- Result ---");
    eprintln!("state={} halted={} cycles={} pc={} r0={} r1={} r2={} frame_ptr={}",
        s.state, s.halted, s.cycles, s.pc, s.regs[0], s.regs[1], s.regs[2], s.attention_mask);
}
