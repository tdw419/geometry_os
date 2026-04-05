/// Directly test FRAME opcode behavior in isolation
use pixels_move_pixels::software_vm::SoftwareVm;

fn make_pixel(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
}

#[test]
fn test_frame_self_jump_minimal() {
    // Minimal: just FRAME r0 at the start, r0=0, frame_count=1
    let mut prog: Vec<u32> = Vec::new();
    prog.push(make_pixel(1, 0, 0, 0));  // LDI r0, 0
    prog.push(0);                         // imm = 0
    prog.push(make_pixel(27, 0, 0, 0));  // FRAME r0

    let entry = 100u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry, &prog);
    vm.spawn_vm(0, entry);
    vm.vm_state_mut(0).frame_count = 1;
    vm.vm_state_mut(0).attention_mask = 0;

    eprintln!("[PRE] pc={} state={} halted={} frame_count={} r0={}",
        vm.vm_state(0).pc, vm.vm_state(0).state, vm.vm_state(0).halted,
        vm.vm_state(0).frame_count, vm.vm_state(0).regs[0]);

    vm.execute_frame();

    let s = vm.vm_state(0);
    eprintln!("[POST] pc={} state={} halted={} cycles={} frame_count={} r0={} frame_ptr={}",
        s.pc, s.state, s.halted, s.cycles, s.frame_count, s.regs[0], s.attention_mask);
    
    // After FRAME r0 with r0=0 and frame_count=1:
    // target=0, 0 < 1, jump to entry_point + 0 * 65536 = 100
    // Next instruction: LDI r0, 0 again → infinite loop
    // After 1024 cycles, should still be RUNNING
    assert!(s.state == 1, "should be RUNNING, got state={}", s.state);
    assert_eq!(s.cycles, 1024, "should exhaust all 1024 cycles");
}

#[test]
fn test_frame_to_different_frame() {
    // FRAME to frame 1 in a 2-frame filmstrip
    let mut frame0: Vec<u32> = Vec::new();
    frame0.push(make_pixel(1, 0, 0, 0));  // LDI r0, 1
    frame0.push(1);                         // imm = 1
    frame0.push(make_pixel(27, 0, 0, 0));  // FRAME r0 (jump to frame 1)

    let frame1: Vec<u32> = vec![make_pixel(13, 0, 0, 0)];  // HALT (final frame)

    let entry = 500u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry, &frame0);
    vm.load_program(entry + 65536, &frame1);
    vm.spawn_vm(0, entry);
    vm.vm_state_mut(0).frame_count = 2;
    vm.vm_state_mut(0).attention_mask = 0;

    vm.execute_frame();

    let s = vm.vm_state(0);
    eprintln!("[POST] pc={} state={} halted={} cycles={} frame_ptr={}",
        s.pc, s.state, s.halted, s.cycles, s.attention_mask);

    assert_eq!(s.state, 2, "should be HALTED (frame 1 HALT is final)");
    assert_eq!(s.attention_mask, 1, "should be on frame 1");
}
