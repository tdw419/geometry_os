// tests/device_proxy_test.rs
//
// End-to-end test for the 3-layer IPC architecture:
//   Layer 3 (Worker VM): Sends READ_BLOCK request via SEND
//   Layer 2 (Device Proxy VM): Receives IPC, writes command buffer
//   Layer 1 (CPU Stub): Polls command buffer, executes, writes result
//
// The proxy VM is assembled from device_proxy.gasm.
// The worker VM is a hand-assembled program that does SEND.

use pixels_move_pixels::assembler::Program;
use pixels_move_pixels::cpu_stub::{
    CpuStub, Command, CommandExecutor, CommandResult, CMD_READ_BLOCK,
    STATUS_COMPLETE, STATUS_PENDING,
};
use pixels_move_pixels::gasm;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::substrate::Substrate;
use pixels_move_pixels::{MSGQ_BASE, MSGQ_DATA_BASE, MSGQ_MAX_DATA};

/// Base address for the command buffer.
const CMD_BUF_BASE: u32 = 0x00D00000;

/// Mock executor that simulates reading 512 bytes of 0xBB pattern.
struct MockBlockExecutor;

impl CommandExecutor for MockBlockExecutor {
    fn execute(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        if cmd.cmd_type == CMD_READ_BLOCK {
            for i in 0..128 {
                substrate.poke(cmd.param3 + i, 0xBBBB_BBBB);
            }
            CommandResult {
                status: STATUS_COMPLETE,
                result: 512,
            }
        } else {
            CommandResult {
                status: STATUS_COMPLETE,
                result: 0,
            }
        }
    }
}

#[test]
fn test_device_proxy_assembles() {
    let source = std::fs::read_to_string("programs/device_proxy.gasm")
        .expect("programs/device_proxy.gasm should exist");
    let result = gasm::assemble(&source);
    assert!(result.is_ok(), "Failed to assemble: {:?}", result.err());
    let program = result.unwrap();
    assert!(
        program.len() > 50,
        "Proxy should be substantial, got {} pixels",
        program.len()
    );
}

#[test]
#[ignore]
fn test_worker_to_proxy_ipc() {
    // Build a simple worker VM that SENDs a READ_BLOCK request to VM 1 (proxy).
    let mut worker = Program::new();
    // r0 = cmd_type (1 = READ_BLOCK)
    // r1 = target_vm (1 = proxy)
    // r2 = data_addr (send data from address 5000)
    // r3 = param1 (fd = 10)
    // r4 = param2 (block_num = 0)
    // r5 = param3 (dest_addr)

    worker.ldi(0, 1); // r0 = CMD_READ_BLOCK
    worker.ldi(1, 1); // r1 = target VM 1 (proxy)
    worker.ldi(2, 5000); // r2 = data_addr = 5000
    worker.ldi(3, 10); // r3 = param1 = fd
    worker.ldi(4, 0); // r4 = param2 = block_num
    worker.ldi(5, 0x00D10000); // r5 = param3 = dest_addr

    // Write the message at address 5000: [cmd_type, param1, param2, param3]
    worker.store(2, 0); // mem[5000] = cmd_type
    worker.ldi(6, 1);
    worker.add(6, 2); // r6 = 5001
    worker.store(6, 3); // mem[5001] = param1
    worker.ldi(6, 2);
    worker.add(6, 2); // r6 = 5002
    worker.store(6, 4); // mem[5002] = param2
    worker.ldi(6, 3);
    worker.add(6, 2); // r6 = 5003
    worker.store(6, 5); // mem[5003] = param3

    // SEND r1(target_vm=1), r2(data_addr=5000), length=4
    worker.send(1, 2, 4);

    worker.halt();

    // Set up the software VM
    let mut svm = SoftwareVm::new();
    svm.load_program(100, &worker.pixels);

    // Assemble the proxy from source
    let source = std::fs::read_to_string("programs/device_proxy.gasm").expect("programs/device_proxy.gasm should exist");
    let proxy_prog = gasm::assemble(&source).unwrap();
    let proxy_base = 10000;
    svm.load_program(proxy_base, &proxy_prog.pixels);

    // Spawn VMs: worker=0, proxy=1
    svm.spawn_vm(0, 100);
    svm.spawn_vm(1, proxy_base);

    // Run worker VM until it halts
    for _ in 0..5 {
        svm.execute_frame();
        // Check if worker halted
        if svm.vm_state(0).halted != 0 {
            break;
        }
    }

    // Verify the worker sent a message to VM 1's mailbox
    let header = svm.peek(MSGQ_BASE + 1);
    assert_ne!(header & 1, 0, "VM 1 should have a pending message, header=0x{:08X}", header);

    // Check the message data at VM 1's mailbox data area
    let vm1_data_base = MSGQ_DATA_BASE + 1 * MSGQ_MAX_DATA;
    let msg0 = svm.peek(vm1_data_base);
    assert_eq!(msg0, 1, "Message[0] should be CMD_READ_BLOCK (1), got {}", msg0);
}

#[test]
#[ignore]
fn test_proxy_receives_and_writes_command_buffer() {
    // Test that the proxy VM, when it receives a message, correctly
    // formats it into the command buffer, and that the CPU stub can process it.

    let mut svm = SoftwareVm::new();

    // Pre-populate VM 1's (proxy) mailbox with a message
    // Message: [cmd_type=1(READ_BLOCK), param1=10(fd), param2=0(block), param3=0xD10000(addr)]
    let vm1_data_base = MSGQ_DATA_BASE + 1 * MSGQ_MAX_DATA;
    svm.poke(vm1_data_base, 1); // cmd_type = READ_BLOCK
    svm.poke(vm1_data_base + 1, 10); // param1 = fd
    svm.poke(vm1_data_base + 2, 0); // param2 = block_num
    svm.poke(vm1_data_base + 3, 0x00D10000); // param3 = dest_addr

    // Set mailbox header: (flags=HAS_MESSAGE(1), sender=0(worker), length=4, reserved=0)
    // The header pixel is packed as RGBA: R=flags=1, G=sender=0, B=length=4, A=0
    // As u32 little-endian: 0x00_04_00_01
    svm.poke(MSGQ_BASE + 1, 0x00040001);

    // Assemble the proxy VM
    let source = std::fs::read_to_string("programs/device_proxy.gasm").expect("programs/device_proxy.gasm should exist");
    let proxy_prog = gasm::assemble(&source).unwrap();
    let proxy_base = 10000;
    svm.load_program(proxy_base, &proxy_prog.pixels);

    // Spawn proxy VM as VM 1
    svm.spawn_vm(1, proxy_base);

    // Run proxy VM for enough frames to:
    // 1. RECV the message
    // 2. Parse it
    // 3. Find a free slot
    // 4. Write command to slot
    // 5. Set status=PENDING
    for _ in 0..5 {
        svm.execute_frame();
    }

    // Verify: command buffer slot 0 should have a READ_BLOCK command
    let slot0_cmd_type = svm.peek(CMD_BUF_BASE + 0);
    assert_eq!(
        slot0_cmd_type, 1,
        "Slot 0 cmd_type should be READ_BLOCK (1), got {}",
        slot0_cmd_type
    );

    let slot0_param1 = svm.peek(CMD_BUF_BASE + 2);
    assert_eq!(
        slot0_param1, 10,
        "Slot 0 param1 should be 10 (fd), got {}",
        slot0_param1
    );

    let slot0_param2 = svm.peek(CMD_BUF_BASE + 3);
    assert_eq!(
        slot0_param2, 0,
        "Slot 0 param2 should be 0 (block_num), got {}",
        slot0_param2
    );

    let slot0_param3 = svm.peek(CMD_BUF_BASE + 4);
    assert_eq!(
        slot0_param3, 0x00D10000,
        "Slot 0 param3 should be dest_addr, got 0x{:08X}",
        slot0_param3
    );

    let slot0_status = svm.peek(CMD_BUF_BASE + 6);
    assert_eq!(
        slot0_status, STATUS_PENDING,
        "Slot 0 status should be PENDING (1), got {}",
        slot0_status
    );

    // Now simulate the CPU stub processing the command.
    // The CPU stub operates on a Substrate, but the SVM has its own internal RAM.
    // We need to bridge: create a substrate, copy the command buffer region,
    // run the stub, then copy back.
    // 
    // Actually, for this test we can directly simulate what the CPU stub would do:
    // Read the command, process it, write the result back.
    // This tests the full round-trip: proxy writes -> stub reads -> stub writes.

    // Create a substrate and sync the command buffer + dest region from SVM
    let substrate = Substrate::new();
    for i in 0..128 {
        // Copy command buffer region (slot 0 = 8 pixels)
        substrate.poke(CMD_BUF_BASE + i, svm.peek(CMD_BUF_BASE + i));
    }
    // Copy dest region
    for i in 0..128 {
        substrate.poke(0x00D10000 + i, svm.peek(0x00D10000 + i));
    }

    let executor = MockBlockExecutor;
    let stub = CpuStub::new(CMD_BUF_BASE, executor);
    let count = stub.poll_once(&substrate);
    assert_eq!(count, 1, "CPU stub should process 1 command");

    // Verify completion
    let slot0_status_after = substrate.peek(CMD_BUF_BASE + 6);
    assert_eq!(
        slot0_status_after, STATUS_COMPLETE,
        "Slot 0 should be COMPLETE after stub, got {}",
        slot0_status_after
    );

    let slot0_result = substrate.peek(CMD_BUF_BASE + 7);
    assert_eq!(
        slot0_result, 512,
        "Slot 0 result should be 512, got {}",
        slot0_result
    );

    // Verify the mock executor wrote data to the dest_addr
    let data_word = substrate.peek(0x00D10000);
    assert_eq!(
        data_word, 0xBBBBBBBB,
        "Dest addr should have mock data, got 0x{:08X}",
        data_word
    );
}
