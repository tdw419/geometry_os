// blk_persist_test.rs -- Persistence test for virtio-blk
//
// Boots a guest VM, writes data to sector 0 via virtio-blk, then creates
// a SECOND VM instance (simulating a reboot) and verifies the data persists.
//
// This proves that virtio-blk correctly backs to a host file (disk.img).
//
// Usage: cargo test --release -- blk_persist

use geometry_os::riscv::RiscvVm;
use std::fs;
use std::path::Path;

const DISK_IMG: &str = "disk.img";

/// Remove the disk image before test to ensure clean state.
fn clean_disk() {
    let _ = fs::remove_file(DISK_IMG);
}

/// Check console output contains a substring.
fn console_contains(console: &[u8], needle: &str) -> bool {
    let s = String::from_utf8_lossy(console);
    s.contains(needle)
}

#[test]
fn blk_persist_roundtrip() {
    clean_disk();

    // --- Phase 1: Write data ---
    let elf_path = "examples/riscv-hello/blk_test.elf";
    if !Path::new(elf_path).exists() {
        eprintln!("Skipping blk_persist_test: {} not found (run build.sh first)", elf_path);
        return;
    }

    let elf_data = fs::read(elf_path).unwrap_or_else(|e| {
        panic!("failed to read {}: {}", elf_path, e);
    });

    // Boot VM 1: blk_test writes to sector 0, reads back, displays result
    let mut vm1 = RiscvVm::new(1024 * 1024);
    let result1 = vm1
        .boot_guest(&elf_data, 1, 50_000_000)
        .expect("boot_guest failed (session 1)");

    let console1 = String::from_utf8_lossy(&vm1.bus.sbi.console_output);
    eprintln!("[persist] Session 1: {} instructions", result1.instructions);
    eprintln!("[persist] Session 1 console:\n{}", console1);

    // Verify session 1 worked
    assert!(
        console_contains(&vm1.bus.sbi.console_output, "PASS"),
        "Session 1 should report PASS. Console:\n{}", console1
    );

    // Save the disk image
    assert!(
        vm1.bus.virtio_blk.save_disk(),
        "Should be able to save disk after write"
    );

    // Verify disk.img was created
    assert!(
        Path::new(DISK_IMG).exists(),
        "disk.img should exist after save"
    );

    let disk_size = fs::metadata(DISK_IMG).unwrap().len();
    eprintln!("[persist] disk.img size: {} bytes", disk_size);
    assert!(disk_size >= 512, "disk.img should be at least 512 bytes");

    // Read the disk image directly and verify the pattern
    let disk_data = fs::read(DISK_IMG).unwrap();
    let pattern = b"GeometryOS_blk_v1";
    assert_eq!(
        &disk_data[0..pattern.len()],
        pattern,
        "disk.img should contain the test pattern"
    );
    assert_eq!(disk_data[20], 0xAA, "disk.img marker byte 20");
    assert_eq!(disk_data[21], 0xBB, "disk.img marker byte 21");
    assert_eq!(disk_data[22], 0xCC, "disk.img marker byte 22");

    // --- Phase 2: Reboot (new VM, loads disk.img) ---
    let mut vm2 = RiscvVm::new(1024 * 1024);
    let result2 = vm2
        .boot_guest(&elf_data, 1, 50_000_000)
        .expect("boot_guest failed (session 2)");

    let console2 = String::from_utf8_lossy(&vm2.bus.sbi.console_output);
    eprintln!("[persist] Session 2: {} instructions", result2.instructions);
    eprintln!("[persist] Session 2 console:\n{}", console2);

    // Session 2 should also PASS because it reads the persisted data
    assert!(
        console_contains(&vm2.bus.sbi.console_output, "PASS"),
        "Session 2 should report PASS (data persisted). Console:\n{}", console2
    );

    // Clean up
    let _ = fs::remove_file(DISK_IMG);

    eprintln!("[persist] Test passed: data survived VM restart");
}
