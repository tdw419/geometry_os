// ═══════════════════════════════════════════════════════════════════════
// Audio output tests: memory-mapped registers at 0xFFC0-0xFFC3
//
// Tests that programs can read/write audio registers via LOAD/STORE
// for square wave tone generation.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::{
    Vm, AUDIO_FREQ_ADDR, AUDIO_VOLUME_ADDR, AUDIO_DURATION_ADDR, AUDIO_STATUS_ADDR,
};

/// Verify audio register address constants are correct.
#[test]
fn audio_register_constants() {
    assert_eq!(AUDIO_FREQ_ADDR, 0xFFC0);
    assert_eq!(AUDIO_VOLUME_ADDR, 0xFFC1);
    assert_eq!(AUDIO_DURATION_ADDR, 0xFFC2);
    assert_eq!(AUDIO_STATUS_ADDR, 0xFFC3);
}

/// Verify audio registers default to 0 on a fresh VM.
#[test]
fn audio_registers_default_zero() {
    let vm = Vm::new(1024);
    assert_eq!(vm.audio_freq, 0);
    assert_eq!(vm.audio_volume, 0);
    assert_eq!(vm.audio_duration, 0);
    assert_eq!(vm.audio_status, 0);
}

/// Verify writing a frequency via STORE sets the freq register.
#[test]
fn audio_write_frequency() {
    let src = "\
LDI r5, 0xFFC0
LDI r6, 440
STORE r5, r6
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.audio_freq, 440, "audio_freq should be 440 Hz");
}

/// Verify writing frequency with non-zero volume sets status to playing (1).
#[test]
fn audio_freq_starts_playing_when_volume_set() {
    let src = "\
LDI r5, 0xFFC1
LDI r6, 128
STORE r5, r6
LDI r5, 0xFFC0
LDI r6, 440
STORE r5, r6
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.audio_freq, 440);
    assert_eq!(vm.audio_volume, 128);
    assert_eq!(vm.audio_status, 1, "audio_status should be 1 (playing)");
}

/// Verify writing freq=0 stops playback (status goes to 0).
#[test]
fn audio_freq_zero_stops_playback() {
    let src = "\
LDI r5, 0xFFC1
LDI r6, 128
STORE r5, r6
LDI r5, 0xFFC0
LDI r6, 440
STORE r5, r6
; Now stop
LDI r5, 0xFFC0
LDI r6, 0
STORE r5, r6
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.audio_freq, 0);
    assert_eq!(vm.audio_status, 0, "status should be 0 after freq=0");
}

/// Verify writing volume=0 stops playback.
#[test]
fn audio_volume_zero_stops_playback() {
    let src = "\
LDI r5, 0xFFC1
LDI r6, 200
STORE r5, r6
LDI r5, 0xFFC0
LDI r6, 330
STORE r5, r6
; Now mute
LDI r5, 0xFFC1
LDI r6, 0
STORE r5, r6
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.audio_volume, 0);
    assert_eq!(vm.audio_status, 0, "status should be 0 after volume=0");
}

/// Verify writing duration register stores the value.
#[test]
fn audio_write_duration() {
    let src = "\
LDI r5, 0xFFC2
LDI r6, 500
STORE r5, r6
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.audio_duration, 500, "duration should be 500 ms");
}

/// Verify reading audio status register via LOAD.
#[test]
fn audio_read_status() {
    let src = "\
LDI r5, 0xFFC1
LDI r6, 100
STORE r5, r6
LDI r5, 0xFFC0
LDI r6, 262
STORE r5, r6
; Read status
LDI r5, 0xFFC3
LOAD r0, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1, "r0 should be 1 (playing)");
}

/// Verify reading frequency register via LOAD.
#[test]
fn audio_read_freq() {
    let src = "\
LDI r5, 0xFFC0
LDI r6, 392
STORE r5, r6
; Read freq back
LDI r5, 0xFFC0
LOAD r0, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 392, "r0 should contain freq=392");
}

/// Verify AUDIO_STATUS register is read-only (writes are ignored).
#[test]
fn audio_status_register_read_only() {
    let src = "\
LDI r5, 0xFFC3
LDI r6, 1
STORE r5, r6
; Read status back
LDI r5, 0xFFC3
LOAD r0, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    // Status was never set to 1 via freq/volume path, so should still be 0
    assert_eq!(vm.regs[0], 0, "status should be 0 (write to status ignored)");
}

/// Verify reading volume register via LOAD.
#[test]
fn audio_read_volume() {
    let src = "\
LDI r5, 0xFFC1
LDI r6, 200
STORE r5, r6
; Read volume back
LDI r5, 0xFFC1
LOAD r0, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 200, "r0 should contain volume=200");
}

/// Verify reading duration register via LOAD.
#[test]
fn audio_read_duration() {
    let src = "\
LDI r5, 0xFFC2
LDI r6, 1000
STORE r5, r6
; Read duration back
LDI r5, 0xFFC2
LOAD r0, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1000, "r0 should contain duration=1000");
}

/// Verify that a child VM does not inherit parent audio state.
#[test]
fn audio_not_inherited_by_child() {
    let mut vm = Vm::new(1024);
    vm.audio_freq = 440;
    vm.audio_volume = 128;
    vm.audio_duration = 500;
    vm.audio_status = 1;

    let child = vm.spawn_child(&geometry_os::vm::ChildVm {
        start_addr: 0,
        arg: 0,
    });
    assert_eq!(child.audio_freq, 0, "child should start with audio_freq=0");
    assert_eq!(child.audio_volume, 0, "child should start with audio_volume=0");
    assert_eq!(child.audio_duration, 0, "child should start with audio_duration=0");
    assert_eq!(child.audio_status, 0, "child should start with audio_status=0");
}

/// Verify audio registers survive snapshot/restore.
#[test]
fn audio_snapshot_restore() {
    let mut vm = Vm::new(1024);
    vm.audio_freq = 440;
    vm.audio_volume = 200;
    vm.audio_duration = 300;
    vm.audio_status = 1;

    let snap = vm.snapshot();
    assert_eq!(snap.audio_freq, 440);
    assert_eq!(snap.audio_volume, 200);
    assert_eq!(snap.audio_duration, 300);
    assert_eq!(snap.audio_status, 1);

    // Restore into a fresh VM
    let mut vm2 = Vm::new(1024);
    vm2.restore(&snap);
    assert_eq!(vm2.audio_freq, 440);
    assert_eq!(vm2.audio_volume, 200);
    assert_eq!(vm2.audio_duration, 300);
    assert_eq!(vm2.audio_status, 1);
}

/// Verify all four audio registers can be read in one program.
#[test]
fn audio_read_all_registers() {
    let src = "\
LDI r5, 0xFFC1
LDI r6, 180
STORE r5, r6
LDI r5, 0xFFC0
LDI r6, 330
STORE r5, r6
LDI r5, 0xFFC2
LDI r6, 250
STORE r5, r6
; Now read all four
LDI r5, 0xFFC0
LOAD r0, r5
LDI r5, 0xFFC1
LOAD r1, r5
LDI r5, 0xFFC2
LOAD r2, r5
LDI r5, 0xFFC3
LOAD r3, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 330, "r0 should be freq=330");
    assert_eq!(vm.regs[1], 180, "r1 should be volume=180");
    assert_eq!(vm.regs[2], 250, "r2 should be duration=250");
    assert_eq!(vm.regs[3], 1, "r3 should be status=1 (playing)");
}

/// Integration test: audio-demo.gasm assembles without errors.
#[test]
fn audio_demo_assembles() {
    let src = std::fs::read_to_string("programs/audio-demo.gasm")
        .expect("audio-demo.gasm should exist");
    let asm = assembler::assemble(&src).expect("audio-demo.gasm should assemble");
    assert!(asm.pixels.len() > 0, "audio-demo should produce bytecode");
}

/// Verify a program can play a sequence of notes.
#[test]
fn audio_play_note_sequence() {
    let src = "\
LDI r5, 0xFFC1
LDI r6, 128
STORE r5, r6
; Play C4
LDI r5, 0xFFC0
LDI r6, 262
STORE r5, r6
; Read status
LDI r5, 0xFFC3
LOAD r0, r5
; Play E4
LDI r5, 0xFFC0
LDI r6, 330
STORE r5, r6
; Read freq
LDI r5, 0xFFC0
LOAD r1, r5
; Play G4
LDI r5, 0xFFC0
LDI r6, 392
STORE r5, r6
; Read freq
LDI r5, 0xFFC0
LOAD r2, r5
; Stop
LDI r5, 0xFFC0
LDI r6, 0
STORE r5, r6
; Read status
LDI r5, 0xFFC3
LOAD r3, r5
HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(1024);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 1, "status should be 1 after first note");
    assert_eq!(vm.regs[1], 330, "freq should be 330 (E4)");
    assert_eq!(vm.regs[2], 392, "freq should be 392 (G4)");
    assert_eq!(vm.regs[3], 0, "status should be 0 after freq=0");
}
