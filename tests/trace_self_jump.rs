/// Minimal reproduction of the self-jump bug.
/// Traces instruction-by-instruction to find where FRAME goes wrong.

use pixels_move_pixels::software_vm::SoftwareVm;

fn make_pixel(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
}

fn ldi(rd: u8, imm: u32) -> Vec<u32> {
    vec![make_pixel(1, 0, rd, 0), imm]
}
fn halt() -> u32 { make_pixel(13, 0, 0, 0) }
fn frame(target_reg: u8) -> u32 { make_pixel(27, 0, target_reg, 0) }
fn rr(opcode: u8, rd: u8, rs: u8) -> u32 { make_pixel(opcode, 0, rd, rs) }
fn bne(r1: u8, r2: u8, offset: i32) -> Vec<u32> {
    vec![make_pixel(10, 1, r1, r2), offset as u32]
}

#[test]
fn trace_self_jump_step_by_step() {
    let mut prog: Vec<u32> = Vec::new();
    prog.extend(ldi(2, 1));        // 0-1: LDI r2, 1
    prog.extend(ldi(1, 1000));     // 2-3: LDI r1, 1000
    prog.extend(ldi(0, 0));        // 4-5: LDI r0, 0
    prog.push(rr(6, 1, 2));        // 6: SUB r1, r2
    prog.extend(bne(1, 2, 3));     // 7-8: BNE r1, r2, +3
    prog.push(halt());             // 9: HALT
    prog.push(frame(0));           // 10: FRAME r0

    let entry = 1000u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry, &prog);
    vm.spawn_vm(0, entry);
    {
        let vm0 = vm.vm_state_mut(0);
        vm0.frame_count = 1;
        vm0.attention_mask = 0;
    }

    // Verify program loaded correctly
    for i in 0..prog.len() {
        let read_back = vm.peek(entry + i as u32);
        eprintln!("[LOAD] pixel {} = 0x{:08X} (expected 0x{:08X}) {}",
            i, read_back, prog[i], if read_back == prog[i] { "✓" } else { "✗ MISMATCH" });
    }

    // Before execution
    let vm0 = vm.vm_state(0);
    eprintln!("[PRE] state={} halted={} pc={} entry={} frame_count={} attention_mask={}",
        vm0.state, vm0.halted, vm0.pc, vm0.entry_point, vm0.frame_count, vm0.attention_mask);
    eprintln!("[PRE] base_addr={} bound_addr={}", vm0.base_addr, vm0.bound_addr);

    // Execute just 7 cycles manually (one full loop iteration)
    // Can't do this directly, so execute_frame and look at results
    vm.execute_frame();

    let vm0 = vm.vm_state(0);
    eprintln!("[POST] state={} halted={} cycles={} pc={} entry={}",
        vm0.state, vm0.halted, vm0.cycles, vm0.pc, vm0.entry_point);
    eprintln!("[POST] r0={} r1={} r2={} frame_ptr={} frame_count={}",
        vm0.regs[0], vm0.regs[1], vm0.regs[2], vm0.attention_mask, vm0.frame_count);
    eprintln!("[POST] base_addr={} bound_addr={}", vm0.base_addr, vm0.bound_addr);

    // The key question: why did it halt after 6 cycles?
    // 6 cycles = 3 LDIs (6 cycles) + never reached SUB
    // OR: 3 LDIs (6 cycles) then the 7th instruction caused a fault
    // Since pc=1010 (FRAME instruction pixel), the FRAME was decoded
    // but something in it caused halted=1.

    // Check if FRAME set vm.state to 0xFF (FAULT)
    eprintln!("[POST] state == 0xFF (FAULT)? {}", vm0.state == 0xFF);
    eprintln!("[POST] state == 2 (HALTED)? {}", vm0.state == 2);
}
