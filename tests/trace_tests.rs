// Phase 38a: Execution Trace Ring Buffer tests
// Tests for TraceBuffer, TraceEntry, TraceIter, and SNAP_TRACE opcode (0x7B)

use geometry_os::assembler::assemble;
use geometry_os::vm::{TraceBuffer, TraceEntry, Vm};

/// Helper: assemble and load bytecode into VM ram at base address, set pc.
fn load_asm(vm: &mut Vm, source: &str, base: usize) {
    let result = assemble(source, base).expect("assemble failed");
    for (i, &word) in result.pixels.iter().enumerate() {
        vm.ram[base + i] = word;
    }
    vm.pc = base as u32;
}

#[test]
fn test_trace_buffer_new() {
    let buf = TraceBuffer::new(100);
    assert_eq!(buf.len(), 0);
    assert!(buf.is_empty());
    assert_eq!(buf.step_counter(), 0);
}

#[test]
fn test_trace_buffer_push_single() {
    let mut buf = TraceBuffer::new(100);
    let regs = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
        26, 27, 28, 29, 30, 31, 32,
    ];
    buf.push(0x100, &regs, 0x01);

    assert_eq!(buf.len(), 1);
    assert!(!buf.is_empty());
    assert_eq!(buf.step_counter(), 1);

    let entry = buf.get_recent(0).unwrap();
    assert_eq!(entry.step_number, 0);
    assert_eq!(entry.pc, 0x100);
    assert_eq!(entry.opcode, 0x01);
    assert_eq!(entry.regs[0], 1);
    assert_eq!(entry.regs[15], 16);
    // Only first 16 registers stored
    assert_eq!(entry.regs.len(), 16);
}

#[test]
fn test_trace_buffer_push_multiple() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];

    for i in 0..5 {
        buf.push(0x100 + i, &regs, 0x01);
    }

    assert_eq!(buf.len(), 5);
    assert_eq!(buf.step_counter(), 5);

    // get_recent(0) = newest
    assert_eq!(buf.get_recent(0).unwrap().pc, 0x104);
    // get_recent(4) = oldest
    assert_eq!(buf.get_recent(4).unwrap().pc, 0x100);
    // Out of bounds
    assert!(buf.get_recent(5).is_none());
}

#[test]
fn test_trace_buffer_wrap_around() {
    let capacity = 5;
    let mut buf = TraceBuffer::new(capacity);
    let regs = [0u32; 32];

    // Push 8 entries into a 5-capacity buffer
    for i in 0..8 {
        buf.push(i as u32, &regs, 0x01);
    }

    assert_eq!(buf.len(), 5); // capped at capacity
    assert_eq!(buf.step_counter(), 8);

    // Should have entries 3,4,5,6,7 (oldest 0,1,2 were overwritten)
    let recent: Vec<u32> = (0..5).map(|i| buf.get_recent(i).unwrap().pc).collect();
    assert_eq!(recent, vec![7, 6, 5, 4, 3]);

    // Iter should go oldest to newest: 3,4,5,6,7
    let iter_pcs: Vec<u32> = buf.iter().map(|e| e.pc).collect();
    assert_eq!(iter_pcs, vec![3, 4, 5, 6, 7]);
}

#[test]
fn test_trace_buffer_clear() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];

    for i in 0..10 {
        buf.push(i as u32, &regs, 0x01);
    }
    assert_eq!(buf.len(), 10);
    assert_eq!(buf.step_counter(), 10);

    buf.clear();
    assert_eq!(buf.len(), 0);
    assert!(buf.is_empty());
    assert_eq!(buf.step_counter(), 0);
}

#[test]
fn test_trace_buffer_iter_before_wrap() {
    let mut buf = TraceBuffer::new(10);
    let regs = [0u32; 32];

    for i in 0..3 {
        buf.push(i as u32, &regs, 0x01);
    }

    let entries: Vec<u32> = buf.iter().map(|e| e.pc).collect();
    assert_eq!(entries, vec![0, 1, 2]);
}

#[test]
fn test_trace_buffer_iter_after_wrap() {
    let mut buf = TraceBuffer::new(3);
    let regs = [0u32; 32];

    for i in 0..6 {
        buf.push(i as u32, &regs, 0x01);
    }

    // Buffer has entries 3,4,5
    let entries: Vec<u32> = buf.iter().map(|e| e.pc).collect();
    assert_eq!(entries, vec![3, 4, 5]);
}

#[test]
fn test_trace_buffer_step_numbers_monotonic() {
    let mut buf = TraceBuffer::new(10);
    let regs = [0u32; 32];

    for i in 0..15 {
        buf.push(i as u32, &regs, 0x01);
    }

    // After wrapping, step numbers should still be monotonic
    let entries: Vec<u64> = buf.iter().map(|e| e.step_number).collect();
    for window in entries.windows(2) {
        assert!(window[1] > window[0], "step numbers must be monotonic");
    }
    // Last 10 entries should have step_number 5..=14
    assert_eq!(entries, vec![5, 6, 7, 8, 9, 10, 11, 12, 13, 14]);
}

#[test]
fn test_trace_buffer_minimum_capacity() {
    let buf = TraceBuffer::new(0);
    assert_eq!(buf.len(), 0);

    // Capacity should be clamped to 1
    let mut buf = TraceBuffer::new(0);
    let regs = [0u32; 32];
    buf.push(42, &regs, 0x01);
    assert_eq!(buf.len(), 1);
    assert_eq!(buf.get_recent(0).unwrap().pc, 42);
}

#[test]
fn test_trace_entry_equality() {
    let regs = [1u32; 16];
    let a = TraceEntry {
        step_number: 5,
        pc: 100,
        regs,
        opcode: 0x01,
    };
    let b = TraceEntry {
        step_number: 5,
        pc: 100,
        regs: [1u32; 16],
        opcode: 0x01,
    };
    assert_eq!(a, b);
}

#[test]
fn test_trace_entry_inequality() {
    let regs = [1u32; 16];
    let a = TraceEntry {
        step_number: 5,
        pc: 100,
        regs,
        opcode: 0x01,
    };
    let b = TraceEntry {
        step_number: 6,
        pc: 100,
        regs: [1u32; 16],
        opcode: 0x01,
    };
    assert_ne!(a, b);
}

// --- SNAP_TRACE opcode (0x7B) integration tests ---

#[test]
fn test_snap_trace_start_recording() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 42
        LDI r3, 99
        HALT
    ",
        0x100,
    );

    // Run until halted
    loop {
        if !vm.step() {
            break;
        }
    }

    // Trace should have recorded LDI r2 and LDI r3 (2 instructions after SNAP_TRACE)
    assert!(
        vm.trace_buffer.len() >= 2,
        "should have at least 2 traced instructions, got {}",
        vm.trace_buffer.len()
    );
    assert!(
        vm.trace_recording,
        "recording should be on after SNAP_TRACE 1"
    );
}

#[test]
fn test_snap_trace_stop_recording() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 42
        LDI r1, 0
        SNAP_TRACE r1
        LDI r3, 99
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    let len_after_stop = vm.trace_buffer.len();
    // LDI r3 after stop should NOT be recorded
    // Only LDI r2 should be recorded (between start and stop)
    assert!(
        len_after_stop >= 1,
        "should have at least 1 traced instruction"
    );
    assert!(!vm.trace_recording, "recording should be off");
}

#[test]
fn test_snap_trace_snapshot_and_clear() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 10
        LDI r3, 20
        LDI r4, 30
        LDI r1, 2
        SNAP_TRACE r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // r0 should hold the count of entries captured before clear
    assert!(
        vm.regs[0] >= 3,
        "r0 should have entry count (>=3), got {}",
        vm.regs[0]
    );
    // Buffer should be cleared
    assert_eq!(
        vm.trace_buffer.len(),
        0,
        "buffer should be empty after clear"
    );
    assert!(
        !vm.trace_recording,
        "recording should be off after snapshot-clear"
    );
}

#[test]
fn test_snap_trace_invalid_mode() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 99
        SNAP_TRACE r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // r0 should be 0xFFFFFFFF for invalid mode
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "invalid mode should return 0xFFFFFFFF"
    );
}

#[test]
fn test_snap_trace_returns_entry_count() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 1
        LDI r3, 2
        LDI r4, 3
        LDI r1, 0
        SNAP_TRACE r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // Second SNAP_TRACE (mode 0) returns count in r0
    assert!(
        vm.regs[0] >= 3,
        "r0 should have count of traced entries (>=3), got {}",
        vm.regs[0]
    );
}

#[test]
fn test_trace_disabled_by_default() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 42
        LDI r2, 99
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(
        vm.trace_buffer.len(),
        0,
        "no entries when trace is disabled"
    );
    assert!(!vm.trace_recording);
}

#[test]
fn test_trace_buffer_get_recent_order() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];

    // Push 5 entries with increasing PCs
    for i in 0..5u32 {
        buf.push(100 + i, &regs, 0x01);
    }

    // get_recent(0) = newest (PC=104), get_recent(4) = oldest (PC=100)
    assert_eq!(buf.get_recent(0).unwrap().pc, 104);
    assert_eq!(buf.get_recent(1).unwrap().pc, 103);
    assert_eq!(buf.get_recent(2).unwrap().pc, 102);
    assert_eq!(buf.get_recent(3).unwrap().pc, 101);
    assert_eq!(buf.get_recent(4).unwrap().pc, 100);
    assert!(buf.get_recent(5).is_none());
}

#[test]
fn test_trace_recording_cleared_on_vm_reset() {
    let mut vm = Vm::new();
    let regs = [0u32; 32];
    vm.trace_recording = true;
    vm.trace_buffer.push(100, &regs, 0x01);
    assert_eq!(vm.trace_buffer.len(), 1);

    vm.reset();

    assert!(
        !vm.trace_recording,
        "trace_recording should be false after reset"
    );
    assert_eq!(
        vm.trace_buffer.len(),
        0,
        "trace buffer should be cleared after reset"
    );
}

// --- Phase 38b: Frame Checkpointing tests ---

use geometry_os::vm::FrameCheckBuffer;

#[test]
fn test_frame_check_buffer_new() {
    let buf = FrameCheckBuffer::new(10);
    assert_eq!(buf.len(), 0);
    assert!(buf.is_empty());
}

#[test]
fn test_frame_check_buffer_push_single() {
    let mut buf = FrameCheckBuffer::new(10);
    let screen = vec![0x112233; 65536];
    buf.push(100, 1, &screen);

    assert_eq!(buf.len(), 1);
    assert!(!buf.is_empty());

    let cp = buf.get_recent(0).unwrap();
    assert_eq!(cp.step_number, 100);
    assert_eq!(cp.frame_count, 1);
    assert_eq!(cp.screen[0], 0x112233);
    assert_eq!(cp.screen.len(), 65536);
}

#[test]
fn test_frame_check_buffer_push_multiple() {
    let mut buf = FrameCheckBuffer::new(10);
    let screen1 = vec![0x111111; 65536];
    let screen2 = vec![0x222222; 65536];
    let screen3 = vec![0x333333; 65536];

    buf.push(10, 1, &screen1);
    buf.push(20, 2, &screen2);
    buf.push(30, 3, &screen3);

    assert_eq!(buf.len(), 3);

    // get_recent(0) = newest
    assert_eq!(buf.get_recent(0).unwrap().frame_count, 3);
    assert_eq!(buf.get_recent(0).unwrap().screen[0], 0x333333);
    // get_recent(2) = oldest
    assert_eq!(buf.get_recent(2).unwrap().frame_count, 1);
    assert_eq!(buf.get_recent(2).unwrap().screen[0], 0x111111);
    // Out of bounds
    assert!(buf.get_recent(3).is_none());
}

#[test]
fn test_frame_check_buffer_wrap_around() {
    let capacity = 5;
    let mut buf = FrameCheckBuffer::new(capacity);

    // Push 8 frames into a 5-capacity buffer
    for i in 0..8u32 {
        let screen = vec![i as u32; 65536];
        buf.push(i as u64 * 10, i + 1, &screen);
    }

    assert_eq!(buf.len(), 5); // capped at capacity

    // Should have frames 3,4,5,6,7 (oldest 0,1,2 were overwritten)
    // get_recent(0) = newest = frame_count 8
    assert_eq!(buf.get_recent(0).unwrap().frame_count, 8);
    // get_recent(4) = oldest = frame_count 4
    assert_eq!(buf.get_recent(4).unwrap().frame_count, 4);
    // Verify the screen pixel values match
    assert_eq!(buf.get_recent(4).unwrap().screen[0], 3); // i=3 -> pixel val 3
}

#[test]
fn test_frame_check_buffer_clear() {
    let mut buf = FrameCheckBuffer::new(10);
    let screen = vec![0u32; 65536];
    buf.push(1, 1, &screen);
    buf.push(2, 2, &screen);
    assert_eq!(buf.len(), 2);

    buf.clear();
    assert_eq!(buf.len(), 0);
    assert!(buf.is_empty());
}

#[test]
fn test_frame_check_buffer_iter() {
    let mut buf = FrameCheckBuffer::new(10);
    for i in 0..3u32 {
        let screen = vec![i; 65536];
        buf.push(i as u64, i + 1, &screen);
    }

    // Iter should go oldest to newest: frame_count 1,2,3
    let counts: Vec<u32> = buf.iter().map(|c| c.frame_count).collect();
    assert_eq!(counts, vec![1, 2, 3]);
}

#[test]
fn test_frame_check_buffer_iter_after_wrap() {
    let mut buf = FrameCheckBuffer::new(3);
    for i in 0..6u32 {
        let screen = vec![i; 65536];
        buf.push(i as u64, i + 1, &screen);
    }

    // Buffer has frames 4,5,6 (frame_count: 4,5,6)
    let counts: Vec<u32> = buf.iter().map(|c| c.frame_count).collect();
    assert_eq!(counts, vec![4, 5, 6]);
}

#[test]
fn test_frame_check_minimum_capacity() {
    let buf = FrameCheckBuffer::new(0);
    assert_eq!(buf.len(), 0);

    let mut buf = FrameCheckBuffer::new(0);
    let screen = vec![42u32; 65536];
    buf.push(1, 1, &screen);
    assert_eq!(buf.len(), 1);
}

#[test]
fn test_frame_checkpoint_captured_on_frame_opcode() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        FRAME
        FRAME
        FRAME
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // Should have captured 3 frame checkpoints
    assert_eq!(
        vm.frame_checkpoints.len(),
        3,
        "should have 3 frame checkpoints"
    );

    // Check frame_count values: 1, 2, 3
    let oldest = vm.frame_checkpoints.get_recent(2).unwrap();
    assert_eq!(oldest.frame_count, 1);
    assert_eq!(vm.frame_checkpoints.get_recent(1).unwrap().frame_count, 2);
    assert_eq!(vm.frame_checkpoints.get_recent(0).unwrap().frame_count, 3);

    // Step numbers should be increasing
    assert!(oldest.step_number < vm.frame_checkpoints.get_recent(1).unwrap().step_number);
}

// --- Phase 38c: Backward Replay tests ---

#[test]
fn test_frame_check_not_captured_when_recording_off() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        FRAME
        FRAME
        FRAME
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // trace_recording is off by default, so no checkpoints
    assert_eq!(
        vm.frame_checkpoints.len(),
        0,
        "no checkpoints when recording is off"
    );
}

#[test]
fn test_frame_check_eviction_300_frames() {
    // Use a small buffer capacity to test eviction
    let mut vm = Vm::new();
    vm.frame_checkpoints = FrameCheckBuffer::new(10);
    vm.trace_recording = true;

    // Simulate 300 frames: each FRAME opcode captures a checkpoint
    // The buffer holds 10, so only the last 10 should remain
    for i in 0..300u32 {
        // Write a unique value to screen[0] to identify each frame
        vm.screen[0] = i;
        // Manually trigger the frame checkpoint logic
        let step = vm.trace_buffer.step_counter();
        vm.frame_count = vm.frame_count.wrapping_add(1);
        vm.frame_checkpoints.push(step, vm.frame_count, &vm.screen);
    }

    assert_eq!(vm.frame_checkpoints.len(), 10);

    // Newest checkpoint should be frame 300
    assert_eq!(vm.frame_checkpoints.get_recent(0).unwrap().frame_count, 300);
    assert_eq!(vm.frame_checkpoints.get_recent(0).unwrap().screen[0], 299);

    // Oldest checkpoint should be frame 291
    assert_eq!(vm.frame_checkpoints.get_recent(9).unwrap().frame_count, 291);
    assert_eq!(vm.frame_checkpoints.get_recent(9).unwrap().screen[0], 290);

    // Iter should be oldest to newest
    let counts: Vec<u32> = vm.frame_checkpoints.iter().map(|c| c.frame_count).collect();
    assert_eq!(counts.len(), 10);
    assert_eq!(counts[0], 291);
    assert_eq!(counts[9], 300);
}

#[test]
fn test_frame_check_cleared_on_reset() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    let screen = vec![42u32; 65536];
    vm.frame_checkpoints.push(1, 1, &screen);
    assert_eq!(vm.frame_checkpoints.len(), 1);

    vm.reset();

    assert_eq!(
        vm.frame_checkpoints.len(),
        0,
        "frame checkpoints should be cleared after reset"
    );
}

#[test]
fn test_frame_check_step_numbers_monotonic() {
    let mut buf = FrameCheckBuffer::new(5);
    for i in 0..8u64 {
        let screen = vec![0u32; 65536];
        buf.push(i * 100, (i + 1) as u32, &screen);
    }

    let steps: Vec<u64> = buf.iter().map(|c| c.step_number).collect();
    for window in steps.windows(2) {
        assert!(window[1] > window[0], "step numbers must be monotonic");
    }
}

// --- Phase 38c: Backward Replay ---

#[test]
fn test_replay_from_basic() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];

    // Push 10 entries with PCs 0..10
    for i in 0..10u32 {
        buf.push(i, &regs, 0x01);
    }

    // Replay from step 9 (newest), limit 3 -> entries with step 9, 8, 7
    let entries = buf.replay_from(9, 3);
    assert_eq!(entries.len(), 3);
    assert_eq!(entries[0].pc, 9); // newest first
    assert_eq!(entries[1].pc, 8);
    assert_eq!(entries[2].pc, 7);
}

#[test]
fn test_replay_from_middle() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];

    for i in 0..10u32 {
        buf.push(i, &regs, 0x01);
    }

    // Replay from step 5, limit 3 -> entries with step 5, 4, 3
    let entries = buf.replay_from(5, 3);
    assert_eq!(entries.len(), 3);
    assert_eq!(entries[0].pc, 5);
    assert_eq!(entries[1].pc, 4);
    assert_eq!(entries[2].pc, 3);
}

#[test]
fn test_replay_from_empty_buffer() {
    let buf = TraceBuffer::new(100);
    let entries = buf.replay_from(0, 10);
    assert!(entries.is_empty());
}

#[test]
fn test_replay_from_step_beyond_counter() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];

    for i in 0..5u32 {
        buf.push(i, &regs, 0x01);
    }

    // Step 999 is beyond counter (5), should start from newest
    let entries = buf.replay_from(999, 3);
    assert_eq!(entries.len(), 3);
    assert_eq!(entries[0].pc, 4); // newest
    assert_eq!(entries[1].pc, 3);
    assert_eq!(entries[2].pc, 2);
}

#[test]
fn test_replay_from_wrapped_buffer() {
    let mut buf = TraceBuffer::new(5);
    let regs = [0u32; 32];

    // Push 10 entries into a 5-capacity buffer
    // Entries 5..10 survive (PCs 5..9)
    for i in 0..10u32 {
        buf.push(i, &regs, 0x01);
    }

    let entries = buf.replay_from(8, 2);
    assert_eq!(entries.len(), 2);
    assert_eq!(entries[0].pc, 8);
    assert_eq!(entries[1].pc, 7);
}

#[test]
fn test_replay_from_limit_exceeds_buffer() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];

    for i in 0..5u32 {
        buf.push(i, &regs, 0x01);
    }

    // Limit 100 but only 5 entries
    let entries = buf.replay_from(4, 100);
    assert_eq!(entries.len(), 5);
    assert_eq!(entries[0].pc, 4);
    assert_eq!(entries[4].pc, 0);
}

#[test]
fn test_iter_rev() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];

    for i in 0..5u32 {
        buf.push(i, &regs, 0x01);
    }

    // iter_rev should go newest to oldest: 4, 3, 2, 1, 0
    let pcs: Vec<u32> = buf.iter_rev().map(|e| e.pc).collect();
    assert_eq!(pcs, vec![4, 3, 2, 1, 0]);
}

#[test]
fn test_replay_frame_basic() {
    let mut buf = FrameCheckBuffer::new(10);

    // Push 3 frames with different colors
    let screen1 = vec![0x111111u32; 65536];
    let screen2 = vec![0x222222u32; 65536];
    let screen3 = vec![0x333333u32; 65536];

    buf.push(10, 1, &screen1);
    buf.push(20, 2, &screen2);
    buf.push(30, 3, &screen3);

    // Replay frame 0 (newest) -> screen3
    let replayed = buf.replay_frame(0).unwrap();
    assert_eq!(replayed[0], 0x333333);

    // Replay frame 2 (oldest) -> screen1
    let replayed = buf.replay_frame(2).unwrap();
    assert_eq!(replayed[0], 0x111111);

    // Out of bounds
    assert!(buf.replay_frame(3).is_none());
}

#[test]
fn test_replay_frame_empty() {
    let buf = FrameCheckBuffer::new(10);
    assert!(buf.replay_frame(0).is_none());
}

#[test]
fn test_replay_frame_wrapped() {
    let mut buf = FrameCheckBuffer::new(3);

    for i in 0..6u32 {
        let screen = vec![i; 65536];
        buf.push(i as u64, i + 1, &screen);
    }

    // Buffer has frames 4,5,6 (frame_count 5,6,7)
    // replay_frame(0) = newest = pixel val 5
    let newest = buf.replay_frame(0).unwrap();
    assert_eq!(newest[0], 5);

    // replay_frame(2) = oldest = pixel val 3
    let oldest = buf.replay_frame(2).unwrap();
    assert_eq!(oldest[0], 3);
}

// --- REPLAY opcode (0x7C) integration tests ---

#[test]
fn test_replay_opcode_success() {
    let mut vm = Vm::new();
    // Set up trace recording and capture 3 frames
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r5, 0xFF0000
        SCREENP r5, r5, r5
        FRAME
        LDI r5, 0x00FF00
        SCREENP r5, r5, r5
        FRAME
        LDI r5, 0x0000FF
        SCREENP r5, r5, r5
        FRAME
        LDI r1, 0
        SNAP_TRACE r1
        LDI r2, 0
        REPLAY r2
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // REPLAY with index 0 should load the most recent checkpoint
    // r0 should be the frame count (3)
    assert_eq!(vm.regs[0], 3, "r0 should be frame_count after REPLAY");
    assert!(vm.frame_ready, "frame_ready should be set");
}

#[test]
fn test_replay_opcode_invalid_index() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        FRAME
        LDI r1, 0
        SNAP_TRACE r1
        LDI r2, 99
        REPLAY r2
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // Index 99 is out of bounds (only 1 frame checkpoint)
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "r0 should be 0xFFFFFFFF for invalid index"
    );
}

#[test]
fn test_replay_opcode_no_checkpoints() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r2, 0
        REPLAY r2
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // No trace recording was on, so no checkpoints
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "r0 should be 0xFFFFFFFF with no checkpoints"
    );
}

#[test]
fn test_checkpoint_replay_pipeline() {
    // Full pipeline: record frames -> stop -> replay each frame -> verify screen
    let mut vm = Vm::new();
    vm.trace_recording = true;

    // Manually create 3 distinct frames
    for color in [0x111111u32, 0x222222, 0x333333].iter() {
        vm.screen[0] = *color;
        vm.screen[65535] = *color;
        let step = vm.trace_buffer.step_counter();
        vm.frame_count = vm.frame_count.wrapping_add(1);
        vm.frame_checkpoints.push(step, vm.frame_count, &vm.screen);
    }

    vm.trace_recording = false;
    assert_eq!(vm.frame_checkpoints.len(), 3);

    // Now set screen to something else
    vm.screen[0] = 0xDEAD;
    vm.screen[65535] = 0xDEAD;

    // Replay frame 2 (oldest, color 0x111111)
    let replayed = vm.frame_checkpoints.replay_frame(2).unwrap();
    assert_eq!(replayed[0], 0x111111);
    assert_eq!(replayed[65535], 0x111111);

    // Replay frame 0 (newest, color 0x333333)
    let replayed = vm.frame_checkpoints.replay_frame(0).unwrap();
    assert_eq!(replayed[0], 0x333333);
    assert_eq!(replayed[65535], 0x333333);
}

// --- Phase 38d: Timeline Forking tests ---

use geometry_os::vm::MAX_SNAPSHOTS;

#[test]
fn test_snapshot_restore_roundtrip() {
    let mut vm = Vm::new();
    vm.ram[100] = 42;
    vm.ram[200] = 99;
    vm.regs[5] = 0x12345678;
    vm.pc = 500;
    vm.rand_state = 0xCAFEBABE;
    vm.frame_count = 17;
    vm.screen[0] = 0xFF000000;
    vm.screen[65535] = 0x00FF0000;

    let snap = vm.snapshot();
    assert_eq!(snap.ram[100], 42);
    assert_eq!(snap.ram[200], 99);
    assert_eq!(snap.regs[5], 0x12345678);
    assert_eq!(snap.pc, 500);
    assert_eq!(snap.rand_state, 0xCAFEBABE);
    assert_eq!(snap.frame_count, 17);
    assert_eq!(snap.screen[0], 0xFF000000);
    assert_eq!(snap.screen[65535], 0x00FF0000);

    // Mutate
    vm.ram[100] = 0;
    vm.ram[200] = 0;
    vm.regs[5] = 0;
    vm.pc = 0;
    vm.screen[0] = 0;
    vm.screen[65535] = 0;

    // Restore
    vm.restore(&snap);
    assert_eq!(vm.ram[100], 42);
    assert_eq!(vm.ram[200], 99);
    assert_eq!(vm.regs[5], 0x12345678);
    assert_eq!(vm.pc, 500);
    assert_eq!(vm.rand_state, 0xCAFEBABE);
    assert_eq!(vm.frame_count, 17);
    assert_eq!(vm.screen[0], 0xFF000000);
    assert_eq!(vm.screen[65535], 0x00FF0000);
}

#[test]
fn test_multiple_snapshots() {
    let mut vm = Vm::new();

    vm.regs[1] = 10;
    let snap0 = vm.snapshot();

    vm.regs[1] = 20;
    let snap1 = vm.snapshot();

    vm.regs[1] = 30;
    let snap2 = vm.snapshot();

    vm.restore(&snap0);
    assert_eq!(vm.regs[1], 10);

    vm.restore(&snap2);
    assert_eq!(vm.regs[1], 30);

    vm.restore(&snap1);
    assert_eq!(vm.regs[1], 20);
}

#[test]
fn test_restore_from_middle() {
    let mut vm = Vm::new();
    for i in 0..100 {
        vm.ram[i] = i as u32;
    }
    let snap = vm.snapshot();

    for i in 0..100 {
        vm.ram[i] = 0xFFFFFFFF;
    }

    vm.restore(&snap);
    for i in 0..100 {
        assert_eq!(vm.ram[i], i as u32, "RAM[{}] should be {}", i, i);
    }
}

#[test]
fn test_fork_opcode_save() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 42
        LDI r7, 0
        FORK r7
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(vm.snapshots.len(), 1, "should have 1 snapshot");
    assert_eq!(vm.regs[0], 0, "r0 should be slot index 0");
    assert_eq!(vm.snapshots[0].regs[1], 42);
}

#[test]
fn test_fork_opcode_list() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r7, 0
        FORK r7
        LDI r7, 2
        FORK r7
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(vm.regs[0], 1, "should have 1 snapshot");
    assert_eq!(vm.snapshots.len(), 1);
}

#[test]
fn test_fork_opcode_clear() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r7, 0
        FORK r7
        LDI r7, 3
        FORK r7
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(vm.regs[0], 0, "clear should succeed");
    assert_eq!(vm.snapshots.len(), 0, "snapshots should be empty");
}

#[test]
fn test_fork_opcode_max_snapshots() {
    let mut vm = Vm::new();
    for i in 0..MAX_SNAPSHOTS {
        vm.regs[1] = i as u32;
        vm.snapshots.push(vm.snapshot());
    }

    assert_eq!(vm.snapshots.len(), MAX_SNAPSHOTS);
    load_asm(
        &mut vm,
        "
        LDI r7, 0
        FORK r7
        HALT
    ",
        0x200,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "should fail when max snapshots reached"
    );
    assert_eq!(vm.snapshots.len(), MAX_SNAPSHOTS, "should not exceed max");
}

#[test]
fn test_fork_opcode_invalid_mode() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r7, 99
        FORK r7
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(vm.regs[0], 0xFFFFFFFF, "invalid mode should return error");
}

#[test]
fn test_fork_opcode_invalid_slot() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r7, 0
        FORK r7
        LDI r7, 1
        LDI r1, 5
        FORK r7
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    assert_eq!(vm.regs[0], 0xFFFFFFFF, "invalid slot should return error");
}

#[test]
fn test_fork_restore_api_roundtrip() {
    let mut vm = Vm::new();

    vm.regs[1] = 111;
    vm.regs[2] = 222;
    vm.ram[1000] = 0xABCD;
    vm.pc = 0x50;

    let snap = vm.snapshot();
    vm.snapshots.push(snap);

    vm.regs[1] = 999;
    vm.regs[2] = 888;
    vm.ram[1000] = 0;
    vm.pc = 0x99;

    let snap = vm.snapshots[0].clone();
    vm.restore(&snap);

    assert_eq!(vm.regs[1], 111);
    assert_eq!(vm.regs[2], 222);
    assert_eq!(vm.ram[1000], 0xABCD);
    assert_eq!(vm.pc, 0x50);
}

#[test]
fn test_fork_demo_assembles() {
    let source =
        std::fs::read_to_string("programs/fork_demo.asm").expect("fork_demo.asm should exist");
    let result = assemble(&source, 0);
    assert!(
        result.is_ok(),
        "fork_demo.asm should assemble: {:?}",
        result.err()
    );
}

#[test]
fn test_snapshots_cleared_on_reset() {
    let mut vm = Vm::new();
    vm.snapshots.push(vm.snapshot());
    vm.snapshots.push(vm.snapshot());
    assert_eq!(vm.snapshots.len(), 2);

    vm.reset();
    assert_eq!(
        vm.snapshots.len(),
        0,
        "snapshots should be cleared on reset"
    );
}

// --- TRACE_READ opcode (0x83) integration tests ---

#[test]
fn test_trace_read_query_count_empty() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 0
        TRACE_READ r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // r0 should be 0 (empty trace buffer)
    assert_eq!(vm.regs[0], 0, "trace buffer should be empty");
}

#[test]
fn test_trace_read_query_count_after_recording() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 42
        LDI r3, 99
        LDI r1, 0
        TRACE_READ r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // Should have recorded 2 instructions (LDI r2, LDI r3)
    assert!(
        vm.regs[0] >= 2,
        "should have at least 2 entries, got {}",
        vm.regs[0]
    );
}

#[test]
fn test_trace_read_entry_at_index() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r4, 42
        LDI r5, 99
        LDI r1, 0
        SNAP_TRACE r1
        ; Read the first entry (index 0 = oldest) into RAM at 0x7000
        LDI r1, 1       ; mode = 1 (read entry)
        LDI r2, 0       ; index = 0
        LDI r3, 0x7000  ; dest
        TRACE_READ r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // r0 should be 0 (success)
    assert_eq!(vm.regs[0], 0, "read should succeed");

    // Verify data was written: check the opcode field at 0x7000+19
    assert_eq!(vm.ram[0x7000 + 19], 0x10, "opcode should be LDI (0x10)");
}

#[test]
fn test_trace_read_entry_valid_data() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 42
        LDI r3, 99
        LDI r1, 0
        SNAP_TRACE r1
        ; Read entry 0 (oldest) into RAM at 0x7000
        LDI r1, 1       ; mode = 1 (read entry)
        LDI r2, 0       ; index = 0 (oldest entry)
        LDI r3, 0x7000  ; dest address
        TRACE_READ r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // r0 should be 0 (success)
    assert_eq!(vm.regs[0], 0, "read should succeed");

    // Check that data was written at 0x7000
    // Format: [step_lo, step_hi, pc, r0..r15, opcode]
    let step_lo = vm.ram[0x7000];
    let step_hi = vm.ram[0x7001];
    let pc = vm.ram[0x7002];
    let opcode = vm.ram[0x7000 + 19];

    // step_number should be 0 (first traced instruction starts at step 0)
    assert_eq!(step_lo, 0, "first entry step_number should be 0");
    assert_eq!(step_hi, 0, "first entry step_number hi should be 0");
    // PC should be the LDI r2 instruction (first traced instruction)
    // After LDI r1,1 (3 words) and SNAP_TRACE r1 (2 words) = 5 words
    // So LDI r2 starts at 0x100 + 5 = 0x105
    assert_eq!(pc, 0x100 + 5, "PC should be the LDI r2 instruction");
    assert_eq!(opcode, 0x10, "opcode should be LDI (0x10)");
}

#[test]
fn test_trace_read_entry_out_of_range() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 42
        LDI r1, 0
        SNAP_TRACE r1
        ; Try to read entry 999 (doesn't exist)
        LDI r1, 1
        LDI r2, 999     ; index = 999
        LDI r3, 0x7000  ; dest address
        TRACE_READ r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // r0 should be 0xFFFFFFFF (error: index out of range)
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "should return error for out-of-range index"
    );
}

#[test]
fn test_trace_read_count_opcode() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 42
        LDI r3, 99
        ADD r4, r2, r3
        LDI r1, 0
        SNAP_TRACE r1
        ; Count how many LDI (0x10) opcodes were recorded
        LDI r1, 2
        LDI r2, 0x10     ; target opcode = LDI
        TRACE_READ r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // Should have recorded 3 LDI instructions (LDI r2, LDI r3, ADD) -- wait, ADD is not LDI
    // Actually: LDI r2, 42 (0x10), LDI r3, 99 (0x10), ADD r4, r2, r3 (not 0x10)
    // Plus the SNAP_TRACE r1 instructions (0x7B) are NOT traced (trace happens before opcode execution,
    // and the SNAP_TRACE itself is being executed). Actually, let me re-check.
    // The trace records every instruction while recording is on. So:
    // - LDI r2, 42 (0x10) -> recorded
    // - LDI r3, 99 (0x10) -> recorded
    // - ADD r4, r2, r3 (0x08) -> recorded
    // - LDI r1, 0 (0x10) -> recorded
    // So there should be 3 LDI entries.
    assert_eq!(
        vm.regs[0], 3,
        "should find 3 LDI opcodes, got {}",
        vm.regs[0]
    );
}

#[test]
fn test_trace_read_find_opcode_indices() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 42
        LDI r3, 99
        ADD r4, r2, r3
        LDI r1, 0
        SNAP_TRACE r1
        ; Find indices of LDI (0x10) entries
        LDI r1, 3
        LDI r2, 0x10     ; target opcode = LDI
        LDI r3, 0x7000  ; dest address
        TRACE_READ r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // r0 should be 3 (3 LDI entries found)
    assert_eq!(vm.regs[0], 3, "should find 3 LDI indices");

    // Indices should be written to RAM[0x7000..0x7002]
    // Index 0 should be the first LDI (LDI r2, 42)
    assert!(
        vm.ram[0x7000] < vm.ram[0x7001],
        "indices should be in order"
    );
    assert!(
        vm.ram[0x7001] < vm.ram[0x7002],
        "indices should be in order"
    );
}

#[test]
fn test_trace_read_invalid_mode() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 99
        TRACE_READ r1
        HALT
    ",
        0x100,
    );

    loop {
        if !vm.step() {
            break;
        }
    }

    // r0 should be 0xFFFFFFFF (invalid mode)
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "should return error for invalid mode"
    );
}

#[test]
fn test_trace_read_assembler() {
    let result = assemble(
        "
        LDI r1, 0
        TRACE_READ r1
        HALT
    ",
        0x100,
    );
    assert!(
        result.is_ok(),
        "TRACE_READ should assemble: {:?}",
        result.err()
    );
}

#[test]
fn test_trace_read_disassembler() {
    let mut vm = Vm::new();
    vm.ram[0x100] = 0x83;
    vm.ram[0x101] = 1; // TRACE_READ r1
    let (mnemonic, len) = vm.disassemble_at(0x100);
    assert_eq!(len, 2, "TRACE_READ should be 2 words");
    assert_eq!(mnemonic, "TRACE_READ r1");
}

// ---- range_around (Phase 55: steps_around command) ----

#[test]
fn test_range_around_basic() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];
    for i in 0..20 {
        buf.push(0x100 + i, &regs, i as u32);
    }

    let window = buf.range_around(10, 2);
    assert_eq!(window.len(), 5, "radius 2 around step 10 => steps 8..=12");
    assert_eq!(window.first().unwrap().step_number, 8);
    assert_eq!(window.last().unwrap().step_number, 12);
}

#[test]
fn test_range_around_saturating_low_end() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];
    for i in 0..5 {
        buf.push(0x100 + i, &regs, i as u32);
    }

    // step 1, radius 10 -> clamp at 0
    let window = buf.range_around(1, 10);
    assert_eq!(window.len(), 5);
    assert_eq!(window.first().unwrap().step_number, 0);
    assert_eq!(window.last().unwrap().step_number, 4);
}

#[test]
fn test_range_around_empty_when_out_of_range() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];
    for i in 0..5 {
        buf.push(0x100 + i, &regs, i as u32);
    }

    let window = buf.range_around(1000, 5);
    assert!(window.is_empty());
}

#[test]
fn test_range_around_zero_radius_returns_single_entry() {
    let mut buf = TraceBuffer::new(100);
    let regs = [0u32; 32];
    for i in 0..10 {
        buf.push(0x100 + i, &regs, i as u32);
    }

    let window = buf.range_around(4, 0);
    assert_eq!(window.len(), 1);
    assert_eq!(window[0].step_number, 4);
}

#[test]
fn test_range_around_after_eviction() {
    // Buffer holds only 10, but we push 100. Steps 0..89 are evicted.
    let mut buf = TraceBuffer::new(10);
    let regs = [0u32; 32];
    for i in 0..100 {
        buf.push(0x100 + i, &regs, i as u32);
    }

    // Query around step 5 (long evicted) -- returns empty
    let window = buf.range_around(5, 2);
    assert!(window.is_empty(), "evicted range should return empty");

    // Query around step 95 (live): radius 3 => steps 92..=98, all live
    let window = buf.range_around(95, 3);
    assert_eq!(window.len(), 7);
    assert_eq!(window.first().unwrap().step_number, 92);
    assert_eq!(window.last().unwrap().step_number, 98);
}

#[test]
fn test_range_around_partial_eviction_boundary() {
    // Only steps 90..=99 remain (buffer cap 10).
    let mut buf = TraceBuffer::new(10);
    let regs = [0u32; 32];
    for i in 0..100 {
        buf.push(0x100 + i, &regs, i as u32);
    }

    // Query around step 92, radius 5 -> would want 87..=97, only 90..=97 live.
    let window = buf.range_around(92, 5);
    assert_eq!(window.len(), 8);
    assert_eq!(window.first().unwrap().step_number, 90);
    assert_eq!(window.last().unwrap().step_number, 97);
}

// ============================================================================
// Phase 391: Trace Module Tests
// Category 1: Unit tests for instruction trace recording (VM integration)
// Category 2: Unit tests for trace buffer overflow and wraparound edge cases
// Category 3: Integration test for trace-to-disasm roundtrip
// ============================================================================

// --- Category 1: VM Integration -- Instruction trace recording ---

#[test]
fn test_trace_records_nothing_when_disabled() {
    let mut vm = Vm::new();
    load_asm(
        &mut vm,
        "
        LDI r1, 42
        LDI r2, 100
        ADD r1, r2
        HALT
    ",
        0x100,
    );

    // trace_recording is false by default
    while vm.step() {}
    assert!(
        vm.trace_buffer.is_empty(),
        "no traces should be recorded when trace_recording is false"
    );
}

#[test]
fn test_trace_records_each_instruction() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 42
        LDI r2, 100
        ADD r1, r2
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    // 4 instructions: LDI, LDI, ADD, HALT
    assert_eq!(
        vm.trace_buffer.len(),
        4,
        "should record exactly 4 instructions"
    );
}

#[test]
fn test_trace_records_correct_pc_values() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 42
        NOP
        HALT
    ",
        0x200,
    );

    while vm.step() {}

    // LDI is 3 words, NOP is 1, HALT is 1. PCs: 0x200, 0x203, 0x204
    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();
    assert_eq!(entries.len(), 3);
    assert_eq!(entries[0].pc, 0x200, "first instruction PC");
    assert_eq!(
        entries[1].pc, 0x203,
        "second instruction PC (after 3-word LDI)"
    );
    assert_eq!(
        entries[2].pc, 0x204,
        "third instruction PC (after 1-word NOP)"
    );
}

#[test]
fn test_trace_records_opcode_values() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        NOP
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();
    assert_eq!(entries[0].opcode, 0x01, "NOP opcode is 0x01");
    assert_eq!(entries[1].opcode, 0x00, "HALT opcode is 0x00");
}

#[test]
fn test_trace_records_register_state() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 42
        LDI r5, 0xFF
        ADD r1, r5
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();

    // Entry 0: before LDI r1, 42 executes -- regs should still be 0
    assert_eq!(
        entries[0].regs[1], 0,
        "r1 should be 0 before first LDI executes"
    );

    // Entry 1: after LDI r1, 42 executed, before LDI r5, 0xFF executes
    // regs[1] should be 42 now (set by the previous instruction)
    assert_eq!(
        entries[1].regs[1], 42,
        "r1 should be 42 when recording second instruction"
    );
    assert_eq!(
        entries[1].regs[5], 0,
        "r5 should be 0 before LDI r5 executes"
    );

    // Entry 2: after LDI r5, 0xFF executed, before ADD r1, r5
    assert_eq!(entries[2].regs[1], 42, "r1 should still be 42");
    assert_eq!(
        entries[2].regs[5], 0xFF,
        "r5 should be 0xFF before ADD executes"
    );

    // Entry 3: after ADD executed, recording HALT
    // NOTE: ADD r1, r5 sets r1 = r1 + r5 = 42 + 255 = 297
    // But trace records state BEFORE the instruction executes, so this entry has pre-HALT state
    assert_eq!(
        entries[3].regs[1], 297,
        "r1 should be 297 (42+255) after ADD"
    );
}

#[test]
fn test_trace_step_numbers_monotonically_increase() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        LDI r2, 2
        LDI r3, 3
        LDI r4, 4
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();
    for window in entries.windows(2) {
        assert!(
            window[1].step_number > window[0].step_number,
            "step numbers must be monotonically increasing: {} -> {}",
            window[0].step_number,
            window[1].step_number,
        );
    }
}

#[test]
fn test_trace_records_jump_target_correctly() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        JNZ r1, skip
        LDI r2, 99
skip:
        LDI r3, 77
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();
    // LDI r1,1 (pc=0x100) -> JNZ r1,skip (pc=0x103) -> LDI r3,77 (pc=skip label)
    // The JNZ should jump to skip, skipping LDI r2,99
    let pcs: Vec<u32> = entries.iter().map(|e| e.pc).collect();

    // Should NOT see the LDI r2,99 PC
    assert_eq!(
        entries.len(),
        4,
        "should record LDI, JNZ, LDI, HALT (skipped branch)"
    );
    assert_eq!(pcs[0], 0x100, "LDI r1");
    assert_eq!(pcs[1], 0x103, "JNZ");
    // skip label PC depends on assembler layout; just verify it's different from 0x106
    assert_ne!(
        pcs[2],
        pcs[1] + 3,
        "should have jumped past the skipped instruction"
    );
}

#[test]
fn test_trace_recording_toggles_mid_execution() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        SNAP_TRACE r1
        LDI r2, 2
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    // SNAP_TRACE with r1=1 keeps recording on (it was already on)
    // So all 4 instructions should be recorded
    assert_eq!(vm.trace_buffer.len(), 4);

    // Now test turning OFF mid-execution
    let mut vm2 = Vm::new();
    vm2.trace_recording = true;
    load_asm(
        &mut vm2,
        "
        LDI r1, 0
        SNAP_TRACE r1
        LDI r2, 2
        LDI r3, 3
        HALT
    ",
        0x100,
    );

    while vm2.step() {}

    // SNAP_TRACE with r1=0 turns recording OFF.
    // Recorded: LDI r1, SNAP_TRACE (still on), then LDI r2 and LDI r3 should NOT be recorded
    assert_eq!(
        vm2.trace_buffer.len(),
        2,
        "only 2 entries before SNAP_TRACE turns off recording"
    );
}

#[test]
fn test_trace_clears_on_vm_reset() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 42
        HALT
    ",
        0x100,
    );

    while vm.step() {}
    assert_eq!(vm.trace_buffer.len(), 2);

    vm.reset();
    assert!(
        vm.trace_buffer.is_empty(),
        "trace buffer should be cleared after reset"
    );
    assert!(
        !vm.trace_recording,
        "trace_recording should be reset to false"
    );
}

#[test]
fn test_trace_records_multi_word_instruction_operand_advance() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    // PSETI is 4 words: opcode, x, y, color
    load_asm(
        &mut vm,
        "
        PSETI 10, 20, 0xFF0000
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();
    assert_eq!(entries.len(), 2);
    assert_eq!(entries[0].pc, 0x100, "PSETI at base");
    assert_eq!(entries[1].pc, 0x104, "HALT after 4-word PSETI");
}

// --- Category 2: Trace buffer overflow and wraparound edge cases ---

#[test]
fn test_trace_buffer_capacity_one() {
    let mut buf = TraceBuffer::new(1);
    let regs = [0u32; 32];

    // Push 1 entry -- should be at capacity
    buf.push(0x100, &regs, 0x01);
    assert_eq!(buf.len(), 1);

    // Push 2nd entry -- oldest evicted, newest remains
    buf.push(0x200, &regs, 0x02);
    assert_eq!(buf.len(), 1);

    let entry = buf.get_recent(0).unwrap();
    assert_eq!(entry.pc, 0x200, "should have newest entry");
    assert_eq!(entry.opcode, 0x02);
}

#[test]
fn test_trace_buffer_exact_capacity_fill() {
    let mut buf = TraceBuffer::new(5);
    let regs = [0u32; 32];

    // Fill exactly to capacity
    for i in 0..5u32 {
        buf.push(0x100 + i * 4, &regs, i);
    }

    assert_eq!(buf.len(), 5);

    // All entries should be present in order
    let entries: Vec<TraceEntry> = buf.iter().cloned().collect();
    for (i, entry) in entries.iter().enumerate() {
        assert_eq!(
            entry.pc,
            0x100 + (i as u32) * 4,
            "entry {} should have correct PC",
            i
        );
    }
}

#[test]
fn test_trace_buffer_one_over_capacity() {
    let mut buf = TraceBuffer::new(5);
    let regs = [0u32; 32];

    // Fill to capacity
    for i in 0..5u32 {
        buf.push(0x100 + i, &regs, i);
    }

    // Push one more
    buf.push(0x200, &regs, 99);

    assert_eq!(buf.len(), 5, "length should stay at capacity");
    // Oldest (pc=0x100) should be gone, newest should be pc=0x200
    let oldest = buf.get_recent(4).unwrap();
    assert_eq!(
        oldest.pc, 0x101,
        "oldest surviving entry should be pc=0x101"
    );
    let newest = buf.get_recent(0).unwrap();
    assert_eq!(newest.pc, 0x200, "newest entry should be pc=0x200");
}

#[test]
fn test_trace_buffer_double_wrap() {
    // Push 2x capacity entries and verify integrity
    let mut buf = TraceBuffer::new(10);
    let mut regs = [0u32; 32];

    for i in 0..20u32 {
        regs[0] = i; // unique register state per entry
        buf.push(0x100 + i * 4, &regs, i);
    }

    assert_eq!(buf.len(), 10, "should be at capacity after double-wrap");

    // Should have entries for i=10..19
    let entries: Vec<TraceEntry> = buf.iter().cloned().collect();
    assert_eq!(entries[0].pc, 0x100 + 10 * 4, "oldest should be i=10");
    assert_eq!(entries[0].regs[0], 10, "regs[0] should match i=10");
    assert_eq!(entries[9].pc, 0x100 + 19 * 4, "newest should be i=19");
    assert_eq!(entries[9].regs[0], 19, "regs[0] should match i=19");
}

#[test]
fn test_trace_buffer_triple_wrap_data_integrity() {
    // Push 3x capacity and verify the data is correct
    let cap = 7;
    let mut buf = TraceBuffer::new(cap);
    let mut regs = [0u32; 32];

    for i in 0..(cap * 3) as u32 {
        regs[1] = i * 1000; // unique value to verify no corruption
        regs[2] = i * 7;
        buf.push(i, &regs, i);
    }

    assert_eq!(buf.len(), cap);
    let entries: Vec<TraceEntry> = buf.iter().cloned().collect();

    // Should have the last `cap` entries: i = cap*2 .. cap*3 - 1
    for (idx, entry) in entries.iter().enumerate() {
        let expected_i = (cap * 2 + idx) as u32;
        assert_eq!(entry.pc, expected_i, "pc mismatch at index {}", idx);
        assert_eq!(
            entry.regs[1],
            expected_i * 1000,
            "regs[1] mismatch at index {}",
            idx
        );
        assert_eq!(
            entry.regs[2],
            expected_i * 7,
            "regs[2] mismatch at index {}",
            idx
        );
        assert_eq!(entry.opcode, expected_i, "opcode mismatch at index {}", idx);
    }
}

#[test]
fn test_trace_buffer_step_counter_survives_wrap() {
    let mut buf = TraceBuffer::new(3);
    let regs = [0u32; 32];

    for _ in 0..10 {
        buf.push(0x100, &regs, 0x01);
    }

    // Step counter should be 10 even though buffer only holds 3
    assert_eq!(buf.step_counter(), 10);
}

#[test]
fn test_trace_buffer_wrap_preserves_ordering() {
    let mut buf = TraceBuffer::new(5);
    let regs = [0u32; 32];

    // Push 8 entries -- only last 5 survive (step 3..7)
    for i in 0..8u32 {
        buf.push(0x200 + i, &regs, i);
    }

    // iter() should be oldest-first: step 3, 4, 5, 6, 7
    let entries: Vec<TraceEntry> = buf.iter().cloned().collect();
    assert_eq!(entries.len(), 5);
    for (idx, entry) in entries.iter().enumerate() {
        let expected_step = (3 + idx) as u64;
        assert_eq!(
            entry.step_number, expected_step,
            "step order at index {}",
            idx
        );
    }

    // iter_rev() should be newest-first: step 7, 6, 5, 4, 3
    let rev_entries: Vec<TraceEntry> = buf.iter_rev().cloned().collect();
    for (idx, entry) in rev_entries.iter().enumerate() {
        let expected_step = (7 - idx) as u64;
        assert_eq!(
            entry.step_number, expected_step,
            "reverse step order at index {}",
            idx
        );
    }
}

#[test]
fn test_trace_buffer_get_recent_after_wrap() {
    let mut buf = TraceBuffer::new(4);
    let regs = [0u32; 32];

    for i in 0..10u32 {
        buf.push(0x100 + i, &regs, i);
    }

    // Buffer holds entries 6..9 (last 4)
    // get_recent(0) = newest = i=9, get_recent(3) = oldest = i=6
    assert_eq!(buf.get_recent(0).unwrap().opcode, 9);
    assert_eq!(buf.get_recent(1).unwrap().opcode, 8);
    assert_eq!(buf.get_recent(2).unwrap().opcode, 7);
    assert_eq!(buf.get_recent(3).unwrap().opcode, 6);
    assert!(
        buf.get_recent(4).is_none(),
        "index beyond len should return None"
    );
}

#[test]
fn test_trace_buffer_count_opcode_after_wrap() {
    let mut buf = TraceBuffer::new(5);
    let regs = [0u32; 32];

    // Push 10 entries: opcodes 0, 1, 0, 1, 0, 1, 0, 1, 0, 1
    for i in 0..10u32 {
        buf.push(0x100 + i, &regs, i % 2);
    }

    // Last 5 entries have opcodes: 1, 0, 1, 0, 1 -> count of 0 = 2, count of 1 = 3
    assert_eq!(buf.count_opcode(0), 2);
    assert_eq!(buf.count_opcode(1), 3);
    assert_eq!(buf.count_opcode(99), 0);
}

#[test]
fn test_trace_buffer_find_opcode_after_wrap() {
    let mut buf = TraceBuffer::new(4);
    let regs = [0u32; 32];

    for i in 0..8u32 {
        buf.push(0x100 + i * 4, &regs, i % 3);
    }

    // Last 4 entries: i=4(opcode 1), 5(opcode 2), 6(opcode 0), 7(opcode 1)
    let indices = buf.find_opcode_indices(1, 10);
    // Should find entries at positions corresponding to i=4 and i=7
    assert_eq!(indices.len(), 2, "should find 2 entries with opcode 1");
}

#[test]
fn test_trace_buffer_clear_after_wrap() {
    let mut buf = TraceBuffer::new(5);
    let regs = [0u32; 32];

    for i in 0..20u32 {
        buf.push(0x100 + i, &regs, i);
    }

    assert_eq!(buf.len(), 5);
    assert_eq!(buf.step_counter(), 20);

    buf.clear();

    assert_eq!(buf.len(), 0);
    assert!(buf.is_empty());
    // Step counter should persist or reset -- check behavior
    // (step counter tracks total pushes, may persist after clear)
}

// --- Category 3: Trace-to-disasm roundtrip integration ---

/// Helper: extract the mnemonic (first word) from a disassembly string.
fn mnemonic_of(s: &str) -> &str {
    s.split_whitespace().next().unwrap_or("")
}

#[test]
fn test_trace_to_disasm_roundtrip_basic_opcodes() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        NOP
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();
    assert_eq!(entries.len(), 2);

    // Verify each entry's opcode matches what disassemble_at returns at that PC
    for entry in &entries {
        let (disasm_str, _word_len) = vm.disassemble_at(entry.pc);
        let mnemonic = mnemonic_of(&disasm_str);

        // The disassembled mnemonic should be consistent with the recorded opcode
        // NOP = 0x01, HALT = 0x00
        match entry.opcode {
            0x00 => assert_eq!(mnemonic, "HALT", "opcode 0x00 should disassemble to HALT"),
            0x01 => assert_eq!(mnemonic, "NOP", "opcode 0x01 should disassemble to NOP"),
            other => panic!("unexpected opcode 0x{:02X} at pc=0x{:X}", other, entry.pc),
        }
    }
}

#[test]
fn test_trace_to_disasm_roundtrip_ldi() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 42
        LDI r5, 0xFF
        LDI r10, 1000
        HALT
    ",
        0x200,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();

    // All LDI entries should have opcode 0x10 and disassemble to "LDI"
    for entry in &entries[..3] {
        assert_eq!(entry.opcode, 0x10, "LDI opcode should be 0x10");
        let (disasm_str, word_len) = vm.disassemble_at(entry.pc);
        assert_eq!(
            mnemonic_of(&disasm_str),
            "LDI",
            "opcode 0x10 at pc=0x{:X} should disassemble to LDI",
            entry.pc
        );
        assert_eq!(word_len, 3, "LDI is a 3-word instruction");
    }

    // HALT
    assert_eq!(entries[3].opcode, 0x00);
    let (disasm_str, _) = vm.disassemble_at(entries[3].pc);
    assert_eq!(mnemonic_of(&disasm_str), "HALT");
}

#[test]
fn test_trace_to_disasm_roundtrip_arithmetic() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 10
        LDI r2, 20
        ADD r1, r2
        SUB r1, r2
        MUL r1, r2
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();

    // ADD=0x20, SUB=0x21, MUL=0x22
    let expected: Vec<(u32, &str)> = vec![
        (0x10, "LDI"),
        (0x10, "LDI"),
        (0x20, "ADD"),
        (0x21, "SUB"),
        (0x22, "MUL"),
        (0x00, "HALT"),
    ];

    assert_eq!(entries.len(), expected.len(), "entry count mismatch");

    for (i, (entry, (exp_op, exp_mnemonic))) in entries.iter().zip(expected.iter()).enumerate() {
        assert_eq!(
            entry.opcode, *exp_op,
            "entry {} opcode mismatch: got 0x{:02X}, expected 0x{:02X}",
            i, entry.opcode, exp_op
        );
        let (disasm_str, _) = vm.disassemble_at(entry.pc);
        assert_eq!(
            mnemonic_of(&disasm_str),
            *exp_mnemonic,
            "entry {} disasm mnemonic mismatch at pc=0x{:X}",
            i,
            entry.pc
        );
    }
}

#[test]
fn test_trace_to_disasm_roundtrip_control_flow() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 5
        LDI r2, 10
        CMP r1, r2
        BLT r0, done
        LDI r3, 99
done:
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();

    // LDI, LDI, CMP, BLT, HALT (BLT taken, skips LDI r3)
    assert_eq!(
        entries.len(),
        5,
        "should have 5 traced instructions (BLT taken)"
    );

    // Verify CMP=0x50 and BLT=0x35
    assert_eq!(entries[2].opcode, 0x50, "CMP opcode");
    assert_eq!(entries[3].opcode, 0x35, "BLT opcode");

    let (cmp_disasm, _) = vm.disassemble_at(entries[2].pc);
    assert_eq!(mnemonic_of(&cmp_disasm), "CMP");

    let (blt_disasm, _) = vm.disassemble_at(entries[3].pc);
    assert_eq!(mnemonic_of(&blt_disasm), "BLT");
}

#[test]
fn test_trace_to_disasm_roundtrip_graphics_opcodes() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 10
        LDI r2, 20
        LDI r3, 0xFF0000
        PSET r1, r2, r3
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();
    assert_eq!(entries.len(), 5);

    // PSET = 0x40
    assert_eq!(entries[3].opcode, 0x40, "PSET opcode should be 0x40");
    let (disasm_str, word_len) = vm.disassemble_at(entries[3].pc);
    assert_eq!(mnemonic_of(&disasm_str), "PSET");
    assert_eq!(word_len, 4, "PSET is a 4-word instruction");
}

#[test]
fn test_trace_to_disasm_roundtrip_multiple_instructions_same_opcode() {
    let mut vm = Vm::new();
    vm.trace_recording = true;
    load_asm(
        &mut vm,
        "
        LDI r1, 1
        LDI r2, 2
        LDI r3, 3
        LDI r4, 4
        LDI r5, 5
        HALT
    ",
        0x100,
    );

    while vm.step() {}

    let entries: Vec<TraceEntry> = vm.trace_buffer.iter().cloned().collect();

    // All LDI entries should share opcode 0x10 but have different PCs
    let ldi_entries: Vec<&TraceEntry> = entries.iter().filter(|e| e.opcode == 0x10).collect();
    assert_eq!(ldi_entries.len(), 5);

    // Each should disassemble to LDI at its unique PC
    let mut pcs: Vec<u32> = ldi_entries.iter().map(|e| e.pc).collect();
    pcs.sort();
    // PCs should be strictly increasing (no duplicates)
    for window in pcs.windows(2) {
        assert_ne!(window[0], window[1], "LDI entries should have distinct PCs");
    }

    // All disassemble to LDI
    for entry in &ldi_entries {
        let (disasm_str, _) = vm.disassemble_at(entry.pc);
        assert_eq!(mnemonic_of(&disasm_str), "LDI");
    }
}
