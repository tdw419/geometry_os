// tests/ipc_3layer_e2e.rs
//
// GEO-48: End-to-end integration test for the 3-layer IPC architecture.
//
// Layer 3 (Worker VM 2): Runs minix_ipc_worker.gasm. Sends block-read
//   requests via SEND opcode to the proxy VM.
// Layer 2 (Proxy VM 1): Runs device_proxy.gasm. Receives IPC, formats
//   command struct in the command buffer region, polls for completion,
//   sends response back.
// Layer 1 (CPU Stub): Rust thread. Polls command buffer in shared substrate.
//   Executes pread() on the real minix_test.img file. Writes response back.
//
// The SVM and Substrate share the same Hilbert addressing scheme, so we
// bridge them by copying the command buffer and data regions between SVM RAM
// and Substrate shadow on each frame boundary.
//
// Execution loop:
//   loop {
//     1. Execute one SVM frame (worker + proxy run)
//     2. Copy command buffer region from SVM -> Substrate
//     3. CPU stub polls once (executes commands, writes results)
//     4. Copy command buffer + data regions from Substrate -> SVM
//     5. Check if worker halted
//   }

use pixels_move_pixels::cpu_stub::{
    Command, CpuStub, CommandExecutor, CommandResult, CMD_BUF_BASE,
    CMD_READ_BLOCK, CMD_SLOTS, CMD_WORDS,
    STATUS_COMPLETE, STATUS_ERROR,
};
use pixels_move_pixels::gasm;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::substrate::Substrate;

/// Number of SVM frames to run before declaring failure.
const MAX_FRAMES: u32 = 200;

/// Regions to sync between SVM and Substrate each frame.
/// We sync the command buffer and a generous data region.
const SYNC_REGIONS: &[(u32, u32)] = &[
    // Command buffer: 16 slots * 8 words = 128 pixels
    (CMD_BUF_BASE, CMD_SLOTS * CMD_WORDS as u32),
    // Block data area (where CPU stub writes read data): 4096 pixels = 16KB
    (0x00C20000, 1024),
];

/// File-backed executor that tracks a pre-opened fd.
struct FileReadExecutor {
    fd: u32,
}

impl CommandExecutor for FileReadExecutor {
    fn execute(&self, cmd: &Command, substrate: &Substrate) -> CommandResult {
        if cmd.cmd_type == CMD_READ_BLOCK {
            use std::fs::File;
            use std::io::{Read, Seek, SeekFrom};

            let block_num = cmd.param2;
            let dest_addr = cmd.param3;
            let block_size = cmd.param4;

            if block_size == 0 || block_size > 4096 {
                return CommandResult {
                    status: STATUS_ERROR,
                    result: 0xFFFF_FFFD,
                };
            }

            let file = unsafe { File::from_raw_fd(self.fd as i32) };
            let mut borrowed = file;
            let offset = (block_num as u64) * (block_size as u64);

            if let Err(e) = borrowed.seek(SeekFrom::Start(offset)) {
                let _ = borrowed.into_raw_fd();
                return CommandResult {
                    status: STATUS_ERROR,
                    result: e.raw_os_error().unwrap_or(-1) as u32,
                };
            }

            let mut buf = vec![0u8; block_size as usize];
            match borrowed.read(&mut buf) {
                Ok(bytes_read) => {
                    // Write data into substrate at dest_addr
                    for i in (0..bytes_read).step_by(4) {
                        let mut word_bytes = [0u8; 4];
                        let end = (i + 4).min(bytes_read);
                        word_bytes[..end - i].copy_from_slice(&buf[i..end]);
                        let word = u32::from_le_bytes(word_bytes);
                        substrate.poke(dest_addr + (i / 4) as u32, word);
                    }
                    let _ = borrowed.into_raw_fd();
                    CommandResult {
                        status: STATUS_COMPLETE,
                        result: bytes_read as u32,
                    }
                }
                Err(e) => {
                    let _ = borrowed.into_raw_fd();
                    CommandResult {
                        status: STATUS_ERROR,
                        result: e.raw_os_error().unwrap_or(-1) as u32,
                    }
                }
            }
        } else {
            CommandResult {
                status: STATUS_ERROR,
                result: 0xFFFF_FFFE,
            }
        }
    }
}

use std::os::unix::io::{FromRawFd, IntoRawFd};

/// Read up to `len` bytes from SVM memory starting at pixel address `pixel_addr`.
/// Each pixel holds 4 bytes (RGBA as little-endian u32).
fn read_bytes_from_svm(svm: &SoftwareVm, pixel_addr: u32, len: usize) -> Vec<u8> {
    let mut result = Vec::with_capacity(len);
    for i in 0..len {
        let byte_addr = pixel_addr * 4 + i as u32;
        let pixel_idx = byte_addr / 4;
        let pixel = svm.peek(pixel_idx);
        let byte_offset = (byte_addr % 4) as usize;
        let byte_val = ((pixel >> (byte_offset * 8)) & 0xFF) as u8;
        result.push(byte_val);
    }
    result
}

/// Sync a region from SVM -> Substrate.
fn sync_svm_to_substrate(svm: &SoftwareVm, substrate: &Substrate, base: u32, len: u32) {
    for i in 0..len {
        substrate.poke(base + i, svm.peek(base + i));
    }
}

/// Sync a region from Substrate -> SVM.
fn sync_substrate_to_svm(substrate: &Substrate, svm: &mut SoftwareVm, base: u32, len: u32) {
    for i in 0..len {
        svm.poke(base + i, substrate.peek(base + i));
    }
}

/// Sync all sync regions from SVM -> Substrate.
fn sync_all_to_substrate(svm: &SoftwareVm, substrate: &Substrate) {
    for &(base, len) in SYNC_REGIONS {
        sync_svm_to_substrate(svm, substrate, base, len);
    }
}

/// Sync all sync regions from Substrate -> SVM.
fn sync_all_to_svm(substrate: &Substrate, svm: &mut SoftwareVm) {
    for &(base, len) in SYNC_REGIONS {
        sync_substrate_to_svm(substrate, svm, base, len);
    }
}

#[test]
fn test_3layer_ipc_minix_read() {
    // ── Step 1: Open the real Minix disk image ──
    let disk_path = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/minix_test.img");
    let disk_file = std::fs::File::open(&disk_path)
        .expect("minix_test.img should exist");
    let fd = disk_file.into_raw_fd() as u32;

    // ── Step 2: Set up the Software VM ──
    let mut svm = SoftwareVm::new();

    // Load device_proxy.gasm into VM 1 (proxy)
    let proxy_source = std::fs::read_to_string("programs/device_proxy.gasm")
        .expect("device_proxy.gasm should exist");
    let proxy_prog = gasm::assemble(&proxy_source)
        .expect("device_proxy.gasm should assemble");
    let proxy_base: u32 = 50000; // Hilbert pixel address
    svm.load_program(proxy_base, &proxy_prog.pixels);
    svm.spawn_vm(1, proxy_base);

    // Load minix_ipc_worker.gasm into VM 2 (worker)
    let worker_source = std::fs::read_to_string("programs/minix_ipc_worker.gasm")
        .expect("minix_ipc_worker.gasm should exist");
    let worker_prog = gasm::assemble(&worker_source)
        .expect("minix_ipc_worker.gasm should assemble");
    let worker_base: u32 = 60000; // Hilbert pixel address
    svm.load_program(worker_base, &worker_prog.pixels);
    svm.spawn_vm(2, worker_base);

    // Set worker's r6 = fd (file descriptor for the disk image)
    svm.vms[2].regs[6] = fd;

    // ── Step 3: Set up the CPU Stub with Substrate ──
    let substrate = Substrate::new();
    let executor = FileReadExecutor { fd };
    let stub = CpuStub::new(CMD_BUF_BASE, executor);

    // ── Step 4: Run the interleaved execution loop ──
    let start = std::time::Instant::now();

    for frame in 0..MAX_FRAMES {
        // 4a: Execute one SVM frame (worker + proxy run)
        svm.execute_frame();

        // Debug: check if worker sent a message
        let worker_pc = svm.vm_state(2).pc;
        let worker_halted = svm.vm_state(2).halted;
        let proxy_halted = svm.vm_state(1).halted;
        eprintln!("Frame {}: worker pc={}, halted={}, proxy halted={}", 
            frame, worker_pc, worker_halted, proxy_halted);

        // Check cmd buffer status in SVM
        let svm_cmd_status = svm.peek(CMD_BUF_BASE + 6);
        if svm_cmd_status != 0 {
            eprintln!("  SVM cmd[0]: type={}, vm_id={}, p1={}, p2={}, p3=0x{:08x}, p4={}, status={}, result={}",
                svm.peek(CMD_BUF_BASE), svm.peek(CMD_BUF_BASE+1),
                svm.peek(CMD_BUF_BASE+2), svm.peek(CMD_BUF_BASE+3),
                svm.peek(CMD_BUF_BASE+4), svm.peek(CMD_BUF_BASE+5),
                svm_cmd_status, svm.peek(CMD_BUF_BASE+7));
        }

        // Check IPC message area in SVM
        let msg0 = svm.peek(0x00C10000);
        let msg1 = svm.peek(0x00C10001);
        let msg2 = svm.peek(0x00C10002);
        let msg3 = svm.peek(0x00C10003);
        let msg4 = svm.peek(0x00C10004);
        let msg5 = svm.peek(0x00C10005);
        eprintln!("  IPC msg: [{}, {}, {}, {}, {}, {}]", msg0, msg1, msg2, msg3, msg4, msg5);

        // Check proxy mailbox for VM 1
        let mailbox = svm.peek(pixels_move_pixels::MSGQ_BASE + 1);
        eprintln!("  Proxy(VM1) mailbox flags: {}", mailbox);

        // Check worker mailbox for VM 2
        let mailbox2 = svm.peek(pixels_move_pixels::MSGQ_BASE + 2);
        eprintln!("  Worker(VM2) mailbox flags: {}", mailbox2);

        // 4b: Sync command buffer + data from SVM -> Substrate
        sync_all_to_substrate(&svm, &substrate);

        // 4c: CPU stub polls and executes pending commands
        let executed = stub.poll_once(&substrate);
        eprintln!("  CPU stub executed {} commands", executed);
        if executed > 0 {
            eprintln!("  Substrate cmd[0] result: status={}, result={}", 
                substrate.peek(CMD_BUF_BASE + 6), substrate.peek(CMD_BUF_BASE + 7));
        }

        // Check substrate data BEFORE sync
        let sub_data0 = substrate.peek(0x00C20000);
        let sub_data1 = substrate.peek(0x00C20001);
        eprintln!("  Substrate block data[0]: 0x{:08x}, [1]: 0x{:08x}", sub_data0, sub_data1);

        // 4d: Sync results back from Substrate -> SVM
        sync_all_to_svm(&substrate, &mut svm);

        // Check data at block buffer after sync
        let data0 = svm.peek(0x00C20000);
        let data1 = svm.peek(0x00C20001);
        eprintln!("  SVM block data[0] after sync: 0x{:08x}, [1]: 0x{:08x}", data0, data1);

        // 4e: Check if worker VM halted
        if svm.vm_state(2).halted != 0 {
            eprintln!("Worker halted after {} frames ({:.1}ms), r0={}, r9={}, r10={}",
                frame + 1, start.elapsed().as_secs_f64() * 1000.0,
                svm.vm_state(2).regs[0], svm.vm_state(2).regs[9], svm.vm_state(2).regs[10]);
            break;
        }

        // Also check proxy hasn't died
        let proxy_state = svm.vm_state(1);
        if proxy_state.halted != 0 && proxy_state.state == 2 {
            // Proxy halted (not yielded) -- something went wrong
            panic!("Proxy VM halted unexpectedly at frame {}", frame);
        }
    }

    // ── Step 5: Verify results ──
    let elapsed = start.elapsed();
    assert!(elapsed.as_secs() < 5,
        "Test took {:.1}s, must complete in under 5s", elapsed.as_secs_f64());

    let worker_state = svm.vm_state(2);
    assert_eq!(worker_state.halted, 1, "Worker VM should have halted");
    assert_eq!(worker_state.regs[0], 5,
        "Worker r0 should be 5 (bytes read), got {}", worker_state.regs[0]);

    // Read the result buffer at pixel address 0x00C30000
    let result = read_bytes_from_svm(&svm, 0x00C30000, 5);
    assert_eq!(&result, b"HELLO",
        "Result buffer should contain 'HELLO', got {:?}", String::from_utf8_lossy(&result));

    // Verify the VM did NOT have the disk image pre-loaded.
    // The worker's memory region (around 0x00C20000) should only contain data
    // that arrived through the IPC path. We can verify this by checking that
    // the block data area was initially empty and was filled by the CPU stub.
    // (This is implicit in the test structure: we never called load_bytes_into_vm
    // for the disk image.)

    // Clean up fd
    unsafe { std::fs::File::from_raw_fd(fd as i32) }; // close it
}
