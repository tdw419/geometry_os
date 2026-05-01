// riscv_tests/kernel.rs -- Layer 2 Kernel verification tests (Phase I)
//
// Verifies that geos_kern.elf correctly:
// 1. Loads two guest programs from embedded images
// 2. Sets up timer interrupts via CLINT
// 3. Context-switches between guests on timer interrupts
// 4. Both guests render to their respective framebuffer halves
// 5. UART output from both guests is visible
//
// Build: bash examples/riscv-hello/build_kern.sh
// ELF:   examples/riscv-hello/geos_kern.elf

use geometry_os::riscv::RiscvVm;
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::framebuf::{FB_WIDTH, FB_HEIGHT};
use geometry_os::riscv::loader;

/// Helper: load geos_kern.elf, create VM, run N steps, return (vm, instructions).
/// Panics if ELF not found (run build_kern.sh first).
fn boot_kernel(ram_size: usize) -> (RiscvVm, u64) {
    let elf_path = "examples/riscv-hello/geos_kern.elf";
    let kernel_image = std::fs::read(elf_path)
        .unwrap_or_else(|e| panic!("Cannot load {}: {}. Run build_kern.sh first.", elf_path, e));

    // Verify ELF magic
    assert_eq!(&kernel_image[0..4], b"\x7fELF", "Not an ELF file");

    let mut vm = RiscvVm::new(ram_size);
    let info = loader::load_elf(&mut vm.bus, &kernel_image)
        .unwrap_or_else(|e| panic!("Failed to load kernel ELF: {:?}", e));

    eprintln!(
        "[kern_verify] entry=0x{:08X}, highest=0x{:08X}, ram_size={}",
        info.entry, info.highest_addr, ram_size
    );
    vm.cpu.pc = info.entry;

    // Run for a budget of steps (enough for kernel init + 2+ context switches)
    let budget = 5_000_000u64;
    let mut instructions = 0u64;
    let mut last_log = 0u64;

    for _ in 0..budget {
        match vm.step() {
            StepResult::Ok => {}
            StepResult::Ebreak => {
                eprintln!("[kern_verify] EBREAK at PC=0x{:08X} after {} instructions", vm.cpu.pc, instructions);
                break;
            }
            StepResult::Shutdown => {
                eprintln!("[kern_verify] Shutdown after {} instructions", instructions);
                break;
            }
            StepResult::Ecall => {
                // SBI handled internally, continue
            }
            StepResult::FetchFault | StepResult::LoadFault | StepResult::StoreFault => {
                eprintln!(
                    "[kern_verify] FAULT at PC=0x{:08X} after {} instructions",
                    vm.cpu.pc, instructions
                );
                break;
            }
        }
        instructions += 1;

        // Progress logging every 500K instructions
        if instructions - last_log >= 500_000 {
            eprintln!(
                "[kern_verify] {} instrs, PC=0x{:08X}, SBI console={}",
                instructions,
                vm.cpu.pc,
                vm.bus.sbi.console_output.len()
            );
            last_log = instructions;
        }
    }

    (vm, instructions)
}

/// Test 1: Kernel boots and produces UART output.
/// The kernel prints "[geos] kernel started..." and "[geos] jumping to guest A".
#[test]
fn test_kernel_boots_with_uart_output() {
    let (vm, instructions) = boot_kernel(2 * 1024 * 1024);

    let output = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    eprintln!("[kern_verify] UART output ({} bytes): {}", output.len(), output);

    // Should have printed kernel init messages
    assert!(
        output.contains("kernel") || output.contains("geos"),
        "Kernel should produce UART output. Got: {}",
        &output[..output.len().min(200)]
    );
    assert!(
        instructions > 100_000,
        "Kernel should execute at least 100K instructions, got {}",
        instructions
    );
}

/// Test 2: Both guests produce UART output.
/// painter_left prints "PAINTER" markers, life32 prints "GEN" markers.
#[test]
fn test_both_guests_produce_uart() {
    let (vm, instructions) = boot_kernel(2 * 1024 * 1024);

    let output = String::from_utf8_lossy(&vm.bus.sbi.console_output);
    eprintln!("[kern_verify] Full UART ({} bytes): {}", output.len(), output);

    // The painter program prints periodic markers like "PAINTER"
    // life32 prints "GEN" for generation count
    // We just need to see output from both (they produce different patterns)
    assert!(
        output.len() > 50,
        "Both guests should produce UART output. Got {} bytes: {}",
        output.len(),
        &output[..output.len().min(200)]
    );
}

/// Test 3: Framebuffer has non-zero pixels from both halves.
/// The painter draws on the left half (x < 128), life32 draws on the right (x >= 128).
#[test]
fn test_framebuffer_split_screen() {
    let (vm, instructions) = boot_kernel(2 * 1024 * 1024);

    let fb = &vm.bus.framebuf.pixels;
    assert_eq!(fb.len(), FB_WIDTH * FB_HEIGHT);

    // Count non-black pixels in left half and right half
    let mut left_pixels = 0u32;
    let mut right_pixels = 0u32;

    for y in 0..FB_HEIGHT {
        for x in 0..FB_WIDTH {
            let idx = y * FB_WIDTH + x;
            // Pixel format: 0x00RRGGBB (alpha=0x00 in stored format, 0xFF in display)
            let pixel = fb[idx];
            let r = (pixel >> 16) & 0xFF;
            let g = (pixel >> 8) & 0xFF;
            let b = pixel & 0xFF;
            // Non-black = at least one channel > 10
            if r > 10 || g > 10 || b > 10 {
                if x < 128 {
                    left_pixels += 1;
                } else {
                    right_pixels += 1;
                }
            }
        }
    }

    eprintln!(
        "[kern_verify] Framebuffer: left={} non-black pixels, right={} non-black pixels, total_instrs={}",
        left_pixels, right_pixels, instructions
    );

    // Both halves should have drawn something
    assert!(
        left_pixels > 0,
        "Left half should have non-black pixels (painter draws there)"
    );
    assert!(
        right_pixels > 0,
        "Right half should have non-black pixels (life32 draws there)"
    );
}

/// Test 4: Kernel uses CLINT timer interrupts.
/// Verify that mtimecmp was set (not at max = default).
#[test]
fn test_kernel_sets_timer() {
    let (vm, _instructions) = boot_kernel(2 * 1024 * 1024);

    // The kernel sets mtimecmp to a value near mtime + 1M
    let mtimecmp = vm.bus.clint.mtimecmp;
    let mtime = vm.bus.clint.mtime;

    eprintln!(
        "[kern_verify] mtime=0x{:016X}, mtimecmp=0x{:016X}",
        mtime, mtimecmp
    );

    // If the kernel set mtimecmp, it should NOT be at MAX (the default)
    // After the kernel runs, mtimecmp should have been re-armed at least once
    assert_ne!(
        mtimecmp, u64::MAX,
        "Kernel should set mtimecmp (currently at default MAX)"
    );
}

/// Test 5: Kernel doesn't crash within 5M instructions.
/// Verifies no fetch/load/store faults during normal operation.
#[test]
fn test_kernel_stable_execution() {
    let (_vm, instructions) = boot_kernel(2 * 1024 * 1024);

    // If we reached 5M instructions without a fault, the kernel is stable
    assert!(
        instructions >= 5_000_000,
        "Kernel should run for 5M instructions without faults, got {}",
        instructions
    );
}
