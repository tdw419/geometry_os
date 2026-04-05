use pixels_move_pixels::cpu_stub::*;
use pixels_move_pixels::gasm;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::substrate::Substrate;
use std::os::unix::io::{FromRawFd, IntoRawFd};

fn sync_svm_to_substrate(svm: &SoftwareVm, substrate: &Substrate, base: u32, len: u32) {
    for i in 0..len {
        substrate.poke(base + i, svm.peek(base + i));
    }
}

fn sync_substrate_to_svm(substrate: &Substrate, svm: &mut SoftwareVm, base: u32, len: u32) {
    for i in 0..len {
        svm.poke(base + i, substrate.peek(base + i));
    }
}

#[test]
fn debug_3layer() {
    let disk_path = std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/minix_test.img");
    let disk_file = std::fs::File::open(&disk_path).expect("disk image should exist");
    let fd = disk_file.into_raw_fd() as u32;

    let mut svm = SoftwareVm::new();

    let proxy_source = std::fs::read_to_string("programs/device_proxy.gasm").unwrap();
    let proxy_prog = gasm::assemble(&proxy_source).unwrap();
    let proxy_base: u32 = 50000;
    svm.load_program(proxy_base, &proxy_prog.pixels);
    svm.spawn_vm(1, proxy_base);

    let worker_source = std::fs::read_to_string("programs/minix_ipc_worker.gasm").unwrap();
    let worker_prog = gasm::assemble(&worker_source).unwrap();
    let worker_base: u32 = 60000;
    svm.load_program(worker_base, &worker_prog.pixels);
    svm.spawn_vm(2, worker_base);

    svm.vms[2].regs[6] = fd;

    let substrate = Substrate::new();
    let executor = pixels_move_pixels::cpu_stub::FileExecutor;
    let stub = CpuStub::new(CMD_BUF_BASE, executor);

    for frame in 0..20 {
        svm.execute_frame();

        // Sync cmd buffer region from SVM -> Substrate
        sync_svm_to_substrate(&svm, &substrate, CMD_BUF_BASE, 128);
        sync_svm_to_substrate(&svm, &substrate, 0x00C20000, 1024);

        let executed = stub.poll_once(&substrate);
        eprintln!("Frame {}: executed {} stub commands", frame, executed);

        // Sync back
        sync_substrate_to_svm(&substrate, &mut svm, CMD_BUF_BASE, 128);
        sync_substrate_to_svm(&substrate, &mut svm, 0x00C20000, 1024);

        // Check VM states
        let vm1 = &svm.vms[1];
        let vm2 = &svm.vms[2];
        eprintln!("  VM1: state={} halted={} pc={} r0={}", vm1.state, vm1.halted, vm1.pc, vm1.regs[0]);
        eprintln!("  VM2: state={} halted={} pc={} r0={} r9={}", vm2.state, vm2.halted, vm2.pc, vm2.regs[0], vm2.regs[9]);

        // Check cmd buffer
        eprintln!("  CMD[0..7]: {:?}", (0..8).map(|i| svm.peek(CMD_BUF_BASE + i)).collect::<Vec<_>>());

        // Check MSGQ
        let msgq_base = 0x00E00000u32; // MSGQ_BASE
        for vid in [1u32, 2u32] {
            let hdr = svm.peek(msgq_base + vid);
            eprintln!("  MSGQ[{}]: header=0x{:08X}", vid, hdr);
        }

        if vm2.halted != 0 {
            eprintln!("Worker halted at frame {} with r0={}", frame, vm2.regs[0]);
            // Check data at result area
            let result_bytes: Vec<u8> = (0..10).flat_map(|i| {
                let pixel = svm.peek(0x00C30000 + i);
                pixel.to_le_bytes().to_vec()
            }).collect();
            eprintln!("Result bytes: {:?}", &result_bytes[..20.min(result_bytes.len())]);
            eprintln!("As string: {:?}", String::from_utf8_lossy(&result_bytes[..20.min(result_bytes.len())]));
            break;
        }
    }

    // Clean up fd
    unsafe { std::fs::File::from_raw_fd(fd as i32) };
}
