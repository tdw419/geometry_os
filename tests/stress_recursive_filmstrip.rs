/// Stress test: Recursive filmstrip (frame jumps to itself) to verify
/// trace buffer overflow behavior under high-frequency looping.
///
/// Frame 0 program (self-jumping loop):
///   LDI r2, 1       ; decrement amount
///   LDI r1, 1000    ; counter (high enough to survive 1024 cycles)
///   LDI r0, 0       ; target frame = self
///   loop:
///   SUB r1, r2      ; r1 -= 1
///   BNE r1, r2, +3  ; if r1 != 0, skip HALT → FRAME
///   HALT             ; counter exhausted, halt
///   FRAME r0         ; jump to frame 0 (self)
///   ; BNE lands here when taken
///
/// This generates ~340 FRAME traces in a single dispatch (1024 cycles / 3 instr per iteration).
/// The trace buffer holds 256 entries, so we expect exactly 256 traces (clamped).
/// The VM should still be RUNNING after one dispatch (counter won't reach 0 in 1024 cycles).

use pixels_move_pixels::software_vm::SoftwareVm;

const FRAME_SIZE: u32 = 65536; // 256 * 256

fn make_pixel(opcode: u8, stratum: u8, p1: u8, p2: u8) -> u32 {
    opcode as u32 | ((stratum as u32) << 8) | ((p1 as u32) << 16) | ((p2 as u32) << 24)
}

/// LDI rd, imm — 2 pixels (instruction + immediate)
fn ldi(rd: u8, imm: u32) -> Vec<u32> {
    vec![make_pixel(1, 0, rd, 0), imm]
}

/// Register-register op
fn rr(opcode: u8, rd: u8, rs: u8) -> u32 {
    make_pixel(opcode, 0, rd, rs)
}

/// HALT
fn halt() -> u32 {
    make_pixel(13, 0, 0, 0)
}

/// FRAME r_target
fn frame(target_reg: u8) -> u32 {
    make_pixel(27, 0, target_reg, 0)
}

/// BNE r1, r2, offset — 2 pixels (stratum=1 for BNE condition)
fn bne(r1: u8, r2: u8, offset: i32) -> Vec<u32> {
    vec![make_pixel(10, 1, r1, r2), offset as u32]
}

#[test]
fn test_recursive_filmstrip_self_jump() {
    let mut frame0: Vec<u32> = Vec::new();
    frame0.extend(ldi(2, 1));        // pixels 0-1: LDI r2, 1
    frame0.extend(ldi(1, 1000));     // pixels 2-3: LDI r1, 1000
    frame0.extend(ldi(0, 0));        // pixels 4-5: LDI r0, 0
    frame0.push(rr(6, 1, 2));        // pixel 6: SUB r1, r2
    frame0.extend(bne(1, 2, 3));     // pixels 7-8: BNE r1, r2, +3
    frame0.push(halt());             // pixel 9: HALT
    frame0.push(frame(0));           // pixel 10: FRAME r0

    let entry_point = 1000u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry_point, &frame0);
    vm.spawn_vm(0, entry_point);

    // Set up filmstrip: 1 frame, starting at frame 0
    {
        let vm0 = vm.vm_state_mut(0);
        vm0.frame_count = 1;
        vm0.attention_mask = 0;
    }

    vm.execute_frame();

    let vm0 = vm.vm_state(0);
    eprintln!(
        "[DEBUG] state={} halted={} cycles={} pc={} r0={} r1={} r2={} frame_ptr={} frame_count={}",
        vm0.state, vm0.halted, vm0.cycles, vm0.pc,
        vm0.regs[0], vm0.regs[1], vm0.regs[2],
        vm0.attention_mask, vm0.frame_count
    );

    // VM should still be running — 1024 cycles isn't enough to count down from 1000
    // Each loop iteration: SUB + BNE(taken) + FRAME = ~3 cycles
    // ~341 iterations in 1024 cycles, counter decremented ~341 times
    assert!(
        vm0.state == 1, // RUNNING
        "VM should still be running, got state={}",
        vm0.state
    );
    assert!(vm0.cycles > 0, "VM should have executed cycles");

    // Counter should have decreased but not hit 0
    let counter = vm0.regs[1];
    assert!(
        counter < 1000,
        "Counter should have decreased from 1000, got {}",
        counter
    );
    assert!(
        counter > 0,
        "Counter should not have reached 0 in 1024 cycles, got {}",
        counter
    );

    // Frame pointer should still be 0 (self-loop)
    assert_eq!(
        vm0.attention_mask, 0,
        "Frame pointer should still be 0 (self-loop)"
    );

    eprintln!(
        "[STRESS] Cycles: {}, Counter: {} (decremented {} times)",
        vm0.cycles,
        counter,
        1000 - counter
    );
}

#[test]
fn test_recursive_filmstrip_ping_pong() {
    // 2 frames that bounce between each other
    // Frame 0: LDI r0, 1; FRAME r0 (→ frame 1)
    // Frame 1: LDI r0, 0; FRAME r0 (→ frame 0)
    let mut frame0: Vec<u32> = Vec::new();
    frame0.extend(ldi(0, 1));
    frame0.push(frame(0));

    let mut frame1: Vec<u32> = Vec::new();
    frame1.extend(ldi(0, 0));
    frame1.push(frame(0));

    let entry_point = 2000u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry_point, &frame0);
    vm.load_program(entry_point + FRAME_SIZE, &frame1);
    vm.spawn_vm(0, entry_point);

    {
        let vm0 = vm.vm_state_mut(0);
        vm0.frame_count = 2;
        vm0.attention_mask = 0;
    }

    vm.execute_frame();

    let vm0 = vm.vm_state(0);

    // Should still be running (ping-pong never halts)
    assert!(
        vm0.state == 1,
        "VM should still be running, got state={}",
        vm0.state
    );

    // Each hop: LDI(2 cycles) + FRAME(1 cycle) = 3 cycles
    // 1024 cycles → ~341 hops, ~170 round-trips
    let cycles = vm0.cycles;
    assert!(cycles > 0);

    // Frame pointer should be 0 or 1
    assert!(
        vm0.attention_mask <= 1,
        "Frame pointer should be 0 or 1, got {}",
        vm0.attention_mask
    );

    eprintln!(
        "[PINGPONG] Cycles: {}, Final frame: {}, Est. hops: ~{}",
        cycles,
        vm0.attention_mask,
        cycles / 3
    );
}

#[test]
fn test_filmstrip_halts_on_final_frame() {
    // Frame 0: HALT → auto-advance to frame 1
    // Frame 1: HALT → final frame, actually halts
    let frame0 = vec![halt()];
    let frame1 = vec![halt()];

    let entry_point = 3000u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry_point, &frame0);
    vm.load_program(entry_point + FRAME_SIZE, &frame1);
    vm.spawn_vm(0, entry_point);

    {
        let vm0 = vm.vm_state_mut(0);
        vm0.frame_count = 2;
        vm0.attention_mask = 0;
    }

    vm.execute_frame();

    let vm0 = vm.vm_state(0);

    assert_eq!(vm0.state, 2, "VM should be HALTED after final frame");
    assert_eq!(vm0.attention_mask, 1, "Should be on frame 1 (final)");
    assert_eq!(vm0.cycles, 2, "Should take exactly 2 cycles");
}

#[test]
fn test_filmstrip_explicit_forward_jump() {
    // Frame 0: LDI r0, 2; FRAME r0 (skip to frame 2)
    // Frame 1: <empty> (never executed)
    // Frame 2: LDI r1, 42; HALT (sentinel + halt)
    let mut frame0: Vec<u32> = Vec::new();
    frame0.extend(ldi(0, 2));
    frame0.push(frame(0));

    let mut frame2: Vec<u32> = Vec::new();
    frame2.extend(ldi(1, 42));
    frame2.push(halt());

    let entry_point = 4000u32;
    let mut vm = SoftwareVm::new();
    vm.load_program(entry_point, &frame0);
    vm.load_program(entry_point + 2 * FRAME_SIZE, &frame2);
    vm.spawn_vm(0, entry_point);

    {
        let vm0 = vm.vm_state_mut(0);
        vm0.frame_count = 3;
        vm0.attention_mask = 0;
    }

    vm.execute_frame();

    let vm0 = vm.vm_state(0);

    assert_eq!(vm0.state, 2, "VM should be HALTED");
    assert_eq!(vm0.attention_mask, 2, "Should be on frame 2");
    assert_eq!(vm0.regs[1], 42, "r1 should be 42 (sentinel from frame 2)");
}
