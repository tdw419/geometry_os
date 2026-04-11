// Integration tests for IPC producer/consumer pattern via .gasm programs
//
// Tests that two FORKed processes can exchange messages using the
// IPC mailbox registers (0xFE00-0xFE09) through the ProcessTable scheduler.

use geometry_os::assembler::assemble;
use geometry_os::vm::{ProcessTable, Vm};

/// Helper: assemble a .gasm source string into a VM loaded with the program.
fn asm_vm(src: &str, ram_size: usize) -> Vm {
    let assembled = assemble(src).expect("assembly should succeed");
    let mut vm = Vm::new(ram_size);
    vm.load_program(&assembled.pixels);
    vm
}

#[test]
fn ipc_gasm_producer_sends_to_consumer_via_fork() {
    // Producer-consumer using FORK.
    // Parent enables IPC, forks, then sends 3 values to child.
    // Child enables IPC, receives values, stores them in RAM at 0x2000+offset.
    let src = r#"
        ; Enable IPC
        LDI r5, 0xFE00       ; IPC_STATUS
        LDI r6, 1
        STORE r5, r6          ; enable

        ; FORK
        FORK
        YIELD                 ; resolve fork

        ; Check: child (r0=0) vs parent (r0=child_pid)
        LDI r10, 0
        BEQ r0, r10, child_code

        ; ── Parent: send 3 values to child ──
        MOV r7, r0            ; r7 = child PID

        ; Set target
        LDI r5, 0xFE04        ; IPC_TARGET
        STORE r5, r7

        ; Send value 10
        LDI r5, 0xFE05        ; IPC_VALUE
        LDI r6, 10
        STORE r5, r6
        LDI r5, 0xFE03        ; IPC_SEND
        LDI r6, 1
        STORE r5, r6
        YIELD

        ; Send value 20
        LDI r5, 0xFE05
        LDI r6, 20
        STORE r5, r6
        LDI r5, 0xFE03
        LDI r6, 1
        STORE r5, r6
        YIELD

        ; Send value 30
        LDI r5, 0xFE05
        LDI r6, 30
        STORE r5, r6
        LDI r5, 0xFE03
        LDI r6, 1
        STORE r5, r6
        YIELD

        HALT

    child_code:
        ; ── Child: receive messages ──
        ; IPC already enabled (inherited state was before fork, but IPC
        ; doesn't inherit — need to re-enable)
        LDI r5, 0xFE00
        LDI r6, 1
        STORE r5, r6          ; enable IPC

        ; Receive first message
        LDI r5, 0xFE06        ; IPC_RECV
        LDI r6, 1
        STORE r5, r6
        LDI r5, 0xFE05        ; IPC_VALUE
        LOAD r0, r5           ; r0 = received value
        LDI r5, 0x2000
        STORE r5, r0          ; RAM[0x2000] = value
        YIELD

        ; Receive second message
        LDI r5, 0xFE06
        LDI r6, 1
        STORE r5, r6
        LDI r5, 0xFE05
        LOAD r0, r5
        LDI r5, 0x2001
        STORE r5, r0          ; RAM[0x2001] = value
        YIELD

        ; Receive third message
        LDI r5, 0xFE06
        LDI r6, 1
        STORE r5, r6
        LDI r5, 0xFE05
        LOAD r0, r5
        LDI r5, 0x2002
        STORE r5, r0          ; RAM[0x2002] = value
        YIELD

        HALT
    "#;

    let vm = asm_vm(src, 8192);
    let mut table = ProcessTable::with_time_slice(vm, 200);

    // Run the scheduler until all processes halt
    table.run_all();

    // Find the child process (PID 2)
    let child = table.get(2).expect("child process should exist");
    assert_eq!(
        child.state.ram[0x2000], 10,
        "child should have received value 10"
    );
    assert_eq!(
        child.state.ram[0x2001], 20,
        "child should have received value 20"
    );
    assert_eq!(
        child.state.ram[0x2002], 30,
        "child should have received value 30"
    );
}

#[test]
fn ipc_gasm_self_send_via_load_store() {
    // Simple test: single process sends to self and reads back
    let src = r#"
        ; Enable IPC
        LDI r5, 0xFE00        ; IPC_STATUS
        LDI r6, 1
        STORE r5, r6

        ; Send value 42 to self (target defaults to 0 = self)
        LDI r5, 0xFE05        ; IPC_VALUE
        LDI r6, 42
        STORE r5, r6
        LDI r5, 0xFE03        ; IPC_SEND
        LDI r6, 1
        STORE r5, r6

        ; Check message count
        LDI r5, 0xFE02        ; IPC_COUNT
        LOAD r0, r5           ; r0 = count

        ; Receive
        LDI r5, 0xFE06        ; IPC_RECV
        LDI r6, 1
        STORE r5, r6

        ; Read received value
        LDI r5, 0xFE05        ; IPC_VALUE
        LOAD r1, r5           ; r1 = received value

        HALT
    "#;

    let mut vm = asm_vm(src, 1024);
    vm.pid = 1;
    vm.run();

    assert_eq!(vm.regs[0], 1, "message count should be 1 after send");
    assert_eq!(vm.regs[1], 42, "received value should be 42");
}

#[test]
fn ipc_gasm_ping_pong() {
    // Parent sends value 7 to child, child sends it back (doubled = 14).
    // Tests bidirectional IPC between two FORKed processes.
    let src = r#"
        ; Enable IPC
        LDI r5, 0xFE00
        LDI r6, 1
        STORE r5, r6

        ; FORK
        FORK
        YIELD

        LDI r10, 0
        BEQ r0, r10, pong_child

        ; ── Parent (ping) ──
        MOV r7, r0            ; r7 = child PID

        ; Set target to child
        LDI r5, 0xFE04        ; IPC_TARGET
        STORE r5, r7

        ; Send value 7
        LDI r5, 0xFE05
        LDI r6, 7
        STORE r5, r6
        LDI r5, 0xFE03
        LDI r6, 1
        STORE r5, r6
        YIELD

        ; Wait for response — self-send target
        LDI r5, 0xFE04
        LDI r6, 0             ; target = 0 = self
        STORE r5, r6

        ; Poll for message
    ping_wait:
        LDI r5, 0xFE02
        LOAD r0, r5
        BEQ r0, r10, ping_wait
        ; Receive
        LDI r5, 0xFE06
        LDI r6, 1
        STORE r5, r6
        ; Read response
        LDI r5, 0xFE05
        LOAD r0, r5           ; r0 = response value (should be 14)
        ; Store to RAM for verification
        LDI r5, 0x2000
        STORE r5, r0
        HALT

    pong_child:
        ; ── Child (pong) ──
        ; Re-enable IPC
        LDI r5, 0xFE00
        LDI r6, 1
        STORE r5, r6

        ; Wait for message from parent
        LDI r10, 0
    pong_wait:
        LDI r5, 0xFE02
        LOAD r0, r5
        BEQ r0, r10, pong_wait
        ; Receive
        LDI r5, 0xFE06
        LDI r6, 1
        STORE r5, r6
        ; Read value
        LDI r5, 0xFE05
        LOAD r1, r5           ; r1 = received value (7)

        ; Double it
        ADD r1, r1            ; r1 = 14

        ; Get parent PID from sender register
        LDI r5, 0xFE07        ; IPC_SENDER
        LOAD r7, r5           ; r7 = sender PID (parent)

        ; Send doubled value back to parent
        LDI r5, 0xFE04        ; IPC_TARGET
        STORE r5, r7
        LDI r5, 0xFE05        ; IPC_VALUE
        STORE r5, r1
        LDI r5, 0xFE03        ; IPC_SEND
        LDI r6, 1
        STORE r5, r6
        YIELD
        HALT
    "#;

    let vm = asm_vm(src, 8192);
    let mut table = ProcessTable::with_time_slice(vm, 200);

    // Run all processes
    table.run_all();

    // Check parent received doubled value
    let parent = table.get(1).expect("parent process should exist");
    assert_eq!(
        parent.state.ram[0x2000], 14,
        "parent should have received doubled value 14"
    );
}
