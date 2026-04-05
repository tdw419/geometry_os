/// Verify what the VM actually reads at each program address
use pixels_move_pixels::software_vm::SoftwareVm;

fn make_pixel(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
}

fn ldi(rd: u8, imm: u32) -> Vec<u32> { vec![make_pixel(1, 0, rd, 0), imm] }
fn halt() -> u32 { make_pixel(13, 0, 0, 0) }
fn frame(target_reg: u8) -> u32 { make_pixel(27, 0, target_reg, 0) }
fn rr(opcode: u8, rd: u8, rs: u8) -> u32 { make_pixel(opcode, 0, rd, rs) }
fn bne(r1: u8, r2: u8, offset: i32) -> Vec<u32> {
    vec![make_pixel(10, 1, r1, r2), offset as u32]
}

#[test]
fn verify_pixel_reads() {
    let mut prog: Vec<u32> = Vec::new();
    prog.extend(ldi(2, 1));
    prog.extend(ldi(1, 1000));
    prog.extend(ldi(0, 0));
    prog.push(rr(6, 1, 2));
    prog.extend(bne(1, 2, 3));
    prog.push(halt());
    prog.push(frame(0));

    let entry = 1000u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry, &prog);
    vm.spawn_vm(0, entry);
    vm.vm_state_mut(0).frame_count = 1;
    vm.vm_state_mut(0).attention_mask = 0;

    // Read each pixel through the VM's memory interface
    // The VM reads pixels at the Hilbert index (which equals our program index + entry)
    for i in 0..prog.len() {
        let addr = entry + i as u32;
        // peek reads a 32-bit value at a Hilbert address
        let val = vm.peek(addr);
        let opcode = val & 0xFF;
        let stratum = (val >> 8) & 0xFF;
        let p1 = (val >> 16) & 0xFF;
        let p2 = (val >> 24) & 0xFF;
        eprintln!("addr {}: opcode={} stratum={} p1={} p2={}  raw=0x{:08X}", 
            addr, opcode, stratum, p1, p2, val);
    }

    // Now the key test: what does execute_instruction see at pc=1010?
    // execute_instruction does: let glyph = read_glyph(ram, pc)
    // read_glyph(ram, d) reads pixel at Hilbert index d
    // At pc=1010, it reads the pixel at Hilbert index 1010
    // Which is our pixel 10 = FRAME r0

    // But the crucial detail: read_glyph reads pixel as RGBA
    // and returns (r, g, b, a) as separate components
    // Then the instruction decoder does:
    //   let glyph = read_glyph(ram, pc)
    // But where is glyph used?

    // Looking at execute_instruction in software_vm.rs:
    // The instruction is decoded from a *byte-addressed* read, not pixel-addressed!
    // Let me check...
    
    eprintln!("\n--- Checking execute_instruction decode path ---");
    // The function reads: 
    //   let instr = safe_mem_read(ram, vm, pc * 4);
    // Not read_glyph!
    // safe_mem_read does: mem_read(ram, addr) where addr = pc * 4
    // mem_read does: let pixel_idx = addr / 4 = (pc * 4) / 4 = pc
    // Then: read_glyph(ram, pixel_idx) = read_glyph(ram, pc)
    // So it reads the pixel at Hilbert index pc. ✓
    
    // But wait — let me actually check if the instruction decode uses 
    // safe_mem_read or read_glyph directly...
}
