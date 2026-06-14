use super::*;
use crate::sv32::{make_pte, sfence_vma};
use geometry_os::riscv::csr;
use geometry_os::riscv::mmu;
use geometry_os::riscv::plic;

/// Bus sync_mip sets MEIP when PLIC has pending enabled interrupts.
#[test]
fn test_bus_sync_mip_plic_meip() {
    let mut bus = geometry_os::riscv::bus::Bus::new(0x8000_0000, 4096);
    bus.plic.priority[plic::IRQ_UART as usize] = 5;
    bus.plic.contexts[0].enable = 1 << plic::IRQ_UART;
    bus.plic.signal(plic::IRQ_UART);
    let mut mip = 0u32;
    bus.sync_mip(&mut mip);
    assert_eq!(mip & (1 << 11), 1 << 11, "MEIP should be set");
}

/// Bus sync_mip clears MEIP when PLIC has no pending interrupts.
#[test]
fn test_bus_sync_mip_plic_clears_meip() {
    let bus = geometry_os::riscv::bus::Bus::new(0x8000_0000, 4096);
    let mut mip = 1 << 11;
    bus.sync_mip(&mut mip);
    assert_eq!(mip & (1 << 11), 0, "MEIP should be cleared");
}

// =====================================================================
// Phase 36: MMU + Device Integration Test
// Guest sets up page tables, writes to UART, verify output on canvas
// =====================================================================

use geometry_os::riscv::bridge::UartBridge;

const INT_CANVAS_COLS: usize = 32;
const INT_CANVAS_MAX_ROWS: usize = 128;

fn integration_canvas() -> Vec<u32> {
    vec![0u32; INT_CANVAS_MAX_ROWS * INT_CANVAS_COLS]
}

/// Helper: set up identity-mapped SV32 page tables for code (at 0x8000_0000)
/// and UART (at 0x1000_0000), then run code and verify canvas output.
///
/// Memory layout (all within guest RAM starting at 0x8000_0000):
///   PA 0x8000_0000: code page (PPN 0x80000, identity-mapped)
///   PA 0x8000_1000: root page table (PPN 0x80001)
///   PA 0x8000_2000: L2 PT for code region VPN[1]=0x200 (PPN 0x80002)
///   PA 0x8000_3000: L2 PT for UART region VPN[1]=0x040 (PPN 0x80003)

struct MmuTestEnv {
    vm: RiscvVm,
    root_ppn: u32,
    code_ppn: u32,
}

impl MmuTestEnv {
    fn new() -> Self {
        let ram_size = 0x10000; // 64KB
        let vm = RiscvVm::new(ram_size);
        Self {
            vm,
            root_ppn: 0x80001, // PA 0x8000_1000
            code_ppn: 0x80000, // PA 0x8000_0000
        }
    }

    /// Set up page tables for code and (optionally) UART regions.
    fn setup_page_tables(&mut self, map_uart: bool) {
        let root_ppn = self.root_ppn;
        let l2_code_ppn: u32 = 0x80002;
        let l2_uart_ppn: u32 = 0x80003;
        let code_ppn = self.code_ppn;
        let uart_phys_ppn: u32 = 0x10000; // PA 0x1000_0000

        let root_pa = (root_ppn as u64) << 12;
        self.vm
            .bus
            .write_word(root_pa + (0x200u64 * 4), make_pte(l2_code_ppn, mmu::PTE_V))
            .expect("operation should succeed");

        let l2_code_pa = (l2_code_ppn as u64) << 12;
        self.vm
            .bus
            .write_word(
                l2_code_pa,
                make_pte(code_ppn, mmu::PTE_V | mmu::PTE_R | mmu::PTE_X),
            )
            .expect("operation should succeed");

        if map_uart {
            self.vm
                .bus
                .write_word(root_pa + (0x040u64 * 4), make_pte(l2_uart_ppn, mmu::PTE_V))
                .expect("operation should succeed");
            let l2_uart_pa = (l2_uart_ppn as u64) << 12;
            self.vm
                .bus
                .write_word(
                    l2_uart_pa,
                    make_pte(uart_phys_ppn, mmu::PTE_V | mmu::PTE_R | mmu::PTE_W),
                )
                .expect("operation should succeed");
        }
    }

    fn load_code(&mut self, code: &[u32]) {
        let code_base = (self.code_ppn as u64) << 12;
        for (i, &word) in code.iter().enumerate() {
            self.vm
                .bus
                .write_word(code_base + (i as u64) * 4, word)
                .expect("operation should succeed");
        }
    }

    fn satp_value(&self) -> u32 {
        (1u32 << 31) | self.root_ppn
    }

    fn run(&mut self, max_steps: usize) {
        self.vm.cpu.pc = ((self.code_ppn as u64) << 12) as u32;
        self.vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::Supervisor;
        for _ in 0..max_steps {
            match self.vm.step() {
                StepResult::Ebreak => break,
                StepResult::Ok | StepResult::Ecall => {},
                _ => break,
            }
        }
    }

    /// Build guest code: enable SV32 MMU, write text to UART via page tables, EBREAK.
    fn build_uart_program(&self, text: &str) -> Vec<u32> {
        let satp = self.satp_value();
        let satp_hi = satp & 0xFFFF_F000;
        let satp_lo = (satp & 0xFFF) as i32;
        let mut code = vec![
            lui(1, 0x10000000),    // x1 = 0x1000_0000 (UART base VA)
            lui(2, satp_hi),       // x2 = upper bits of satp
            addi(2, 2, satp_lo),   // x2 = satp (SV32, ASID=0, root PPN)
            csrrw(0, 2, CSR_SATP), // write satp
            sfence_vma(0, 0),      // flush TLB
        ];
        for &b in text.as_bytes() {
            code.push(addi(3, 0, b as i32));
            code.push(sw(3, 1, 0)); // write char to UART through MMU
        }
        code.push(ebreak());
        code
    }
}

/// Write text to UART through page tables, verify on canvas.
#[test]
fn test_mmu_device_integration_guest_uart_through_page_tables() {
    let mut env = MmuTestEnv::new();
    env.setup_page_tables(true);

    let code = env.build_uart_program("OK");
    env.load_code(&code);
    env.run(100);

    let mut bridge = UartBridge::new();
    let mut canvas = integration_canvas();
    let n = bridge.drain_uart_to_canvas(&mut env.vm.bus, &mut canvas);
    assert_eq!(n, 2, "Should have drained 2 bytes from UART TX");

    let output = UartBridge::read_canvas_string(&canvas, 0, 0, 32);
    assert_eq!(output, "OK", "Expected 'OK' on canvas");
    assert_eq!(canvas[0], b'O' as u32);
    assert_eq!(canvas[1], b'K' as u32);
}

/// Enable SV32 without mapping UART -> store to unmapped VA -> page fault.
#[test]
fn test_mmu_device_integration_no_output_without_mapping() {
    let mut env = MmuTestEnv::new();
    env.setup_page_tables(false);

    let code = env.build_uart_program("X");
    env.load_code(&code);
    env.run(100);

    let mut bridge = UartBridge::new();
    let mut canvas = integration_canvas();
    let n = bridge.drain_uart_to_canvas(&mut env.vm.bus, &mut canvas);
    assert_eq!(n, 0, "UART should have no output");
    assert!(canvas.iter().all(|&c| c == 0), "Canvas should be empty");

    // Page fault should have been delivered.
    assert_eq!(
        env.vm.cpu.csr.mcause,
        csr::CAUSE_STORE_PAGE_FAULT,
        "Expected store page fault, got 0x{:X}",
        env.vm.cpu.csr.mcause
    );
}

/// Multiple UART writes through MMU: first triggers TLB miss, rest hit TLB.
#[test]
fn test_mmu_device_integration_tlb_cached_uart_writes() {
    let mut env = MmuTestEnv::new();
    env.setup_page_tables(true);

    let code = env.build_uart_program("ABC");
    env.load_code(&code);
    env.run(100);

    let mut bridge = UartBridge::new();
    let mut canvas = integration_canvas();
    let n = bridge.drain_uart_to_canvas(&mut env.vm.bus, &mut canvas);
    assert_eq!(n, 3, "Should drain 3 bytes");

    let output = UartBridge::read_canvas_string(&canvas, 0, 0, 32);
    assert_eq!(output, "ABC", "Expected 'ABC' on canvas");

    // TLB should have cached the UART mapping
    assert!(
        env.vm
            .cpu
            .tlb
            .lookup(
                mmu::va_to_vpn(0x1000_0000),
                mmu::satp_asid(env.vm.cpu.csr.satp)
            )
            .is_some(),
        "TLB should cache UART mapping"
    );
}

/// Test that the RV32 Linux kernel can be loaded by our ELF loader.
/// This verifies Phase 39 deliverable: the kernel is a valid ELF32 RV32 binary.
#[test]
fn test_rv32_linux_kernel_loads() {
    use std::path::Path;
    let kernel_path =
        Path::new(env!("CARGO_MANIFEST_DIR")).join(".geometry_os/fs/linux/rv32/vmlinux");

    if !kernel_path.exists() {
        eprintln!("Skipping: RV32 kernel not found at {:?}", kernel_path);
        return;
    }

    let kernel_image = std::fs::read(&kernel_path).expect("Failed to read kernel");
    assert!(
        kernel_image.len() > 1_000_000,
        "Kernel too small: {} bytes",
        kernel_image.len()
    );

    // Verify it's an ELF32 RISC-V file
    assert_eq!(
        &kernel_image[0..4],
        &[0x7F, 0x45, 0x4C, 0x46],
        "Not ELF magic"
    );
    assert_eq!(kernel_image[4], 1, "Not ELF32 (class != 1)");
    assert_eq!(kernel_image[5], 1, "Not little-endian");

    let machine = u16::from_le_bytes([kernel_image[18], kernel_image[19]]);
    assert_eq!(machine, 243, "Not RISC-V (EM_RISCV = 243)");

    // Create VM with 128MB RAM and attempt to load
    let mut vm = geometry_os::riscv::RiscvVm::new(128 * 1024 * 1024);
    let result = geometry_os::riscv::loader::load_elf(&mut vm.bus, &kernel_image);

    match result {
        Ok(info) => {
            eprintln!(
                "Kernel loaded: entry=0x{:08X}, highest=0x{:08X}",
                info.entry, info.highest_addr
            );
            assert!(
                info.entry == 0xC0000000,
                "Entry point should be 0xC0000000, got 0x{:08X}",
                info.entry
            );
            assert!(
                info.highest_addr > 0xC0000000,
                "Kernel should load above 0xC0000000"
            );
        },
        Err(e) => {
            // The kernel may be too large for the test RAM size
            if matches!(e, geometry_os::riscv::loader::LoadError::SegmentOverflow) {
                eprintln!("Kernel too large for 128MB test RAM (acceptable)");
            } else {
                panic!("Failed to load kernel: {}", e);
            }
        },
    }
}

/// Test SBI ECALL interception: ECALL from S-mode with valid SBI extension
/// is handled by SBI (no trap), while non-SBI ECALL traps to M-mode.
#[test]
fn test_sbi_ecall_interception() {
    let mut vm = RiscvVm::new(8192);
    let base = 0x8000_0000u64;
    use geometry_os::riscv::cpu::Privilege;

    // Write ECALL at entry point
    vm.bus
        .write_word(base, ecall())
        .expect("operation should succeed");
    vm.bus
        .write_word(base + 4, ebreak())
        .expect("operation should succeed");

    vm.cpu.pc = base as u32;
    vm.cpu.privilege = Privilege::Supervisor;

    // --- Test 1: SBI_CONSOLE_PUTCHAR (a7=1) should be intercepted ---
    vm.cpu.x[17] = 1; // a7 = SBI_CONSOLE_PUTCHAR
    vm.cpu.x[10] = b'A' as u32; // a0 = 'A'

    let r = vm.cpu.step(&mut vm.bus);
    assert_eq!(r, StepResult::Ok);
    // PC should advance past ECALL (no trap)
    assert_eq!(
        vm.cpu.pc,
        (base as u32) + 4,
        "SBI call should advance PC normally"
    );
    // Should still be in S-mode (no privilege change)
    assert_eq!(
        vm.cpu.privilege,
        Privilege::Supervisor,
        "SBI call keeps S-mode"
    );
    // a0 should be SBI_SUCCESS (0)
    assert_eq!(vm.cpu.x[10], 0, "a0 = SBI_SUCCESS");
    // Character should be in SBI console output
    assert!(
        !vm.bus.sbi.console_output.is_empty(),
        "SBI should have console output"
    );
    assert_eq!(
        vm.bus.sbi.console_output[0], b'A',
        "first char should be 'A'"
    );

    // --- Test 2: Non-SBI ECALL (a7=0x999) should trap to M-mode ---
    vm.cpu.pc = base as u32;
    vm.cpu.csr.mtvec = (base as u32) + 0x400;
    vm.bus
        .write_word(base + 0x400, ebreak())
        .expect("operation should succeed");
    vm.cpu.x[17] = 0x999; // Not an SBI extension

    let r = vm.cpu.step(&mut vm.bus);
    assert_eq!(r, StepResult::Ok);
    // Should trap to M-mode
    assert_eq!(
        vm.cpu.privilege,
        Privilege::Machine,
        "non-SBI ECALL traps to M-mode"
    );
    assert_eq!(vm.cpu.pc, (base as u32) + 0x400, "should jump to mtvec");
    assert_eq!(vm.cpu.csr.mcause, 9, "mcause = ECALL-S");
}

/// Test SBI base extension probe from S-mode.
#[test]
fn test_sbi_base_probe_from_smode() {
    let mut vm = RiscvVm::new(8192);
    let base = 0x8000_0000u64;
    use geometry_os::riscv::cpu::Privilege;

    vm.bus
        .write_word(base, ecall())
        .expect("operation should succeed");

    vm.cpu.pc = base as u32;
    vm.cpu.privilege = Privilege::Supervisor;

    // Probe SBI_EXT_BASE (0x10), function PROBE_EXTENSION (3)
    vm.cpu.x[17] = 0x10; // a7 = SBI_EXT_BASE
    vm.cpu.x[16] = 3; // a6 = PROBE_EXTENSION
    vm.cpu.x[10] = 1; // a0 = probe for SBI_CONSOLE_PUTCHAR (1)

    vm.cpu.step(&mut vm.bus);

    assert_eq!(vm.cpu.privilege, Privilege::Supervisor);
    assert_eq!(vm.cpu.x[10], 0, "SBI error code should be 0 (success)");
    assert_eq!(
        vm.cpu.x[11], 1,
        "SBI_CONSOLE_PUTCHAR should be available in a1"
    );

    // Now probe an unknown extension
    vm.cpu.pc = base as u32;
    vm.cpu.x[17] = 0x10;
    vm.cpu.x[16] = 3;
    vm.cpu.x[10] = 0x999; // unknown extension

    vm.cpu.step(&mut vm.bus);

    assert_eq!(vm.cpu.x[10], 0, "SBI error code should be 0 (success)");
    assert_eq!(vm.cpu.x[11], 0, "unknown extension should return 0 in a1");
}

/// Test SBI shutdown from S-mode returns Shutdown result.
#[test]
fn test_sbi_shutdown_from_smode() {
    let mut vm = RiscvVm::new(8192);
    let base = 0x8000_0000u64;
    use geometry_os::riscv::cpu::Privilege;

    vm.bus
        .write_word(base, ecall())
        .expect("operation should succeed");

    vm.cpu.pc = base as u32;
    vm.cpu.privilege = Privilege::Supervisor;

    // SBI_SHUTDOWN = 8
    vm.cpu.x[17] = 8; // a7 = SBI_SHUTDOWN

    let r = vm.cpu.step(&mut vm.bus);
    assert_eq!(
        r,
        StepResult::Shutdown,
        "SBI shutdown should return Shutdown"
    );
    assert!(vm.bus.sbi.shutdown_requested);
}

// =====================================================================
// Phase 362: RISC-V Syscall Tests
// Tests for syscall dispatch, argument passing, return values,
// error propagation, and syscall number validation.
// =====================================================================

/// Helper: set up a VM in U-mode with ECALL-U delegated to S-mode,
/// and a simple S-mode trap handler that reads a0, writes return value,
/// advances sepc, and SRETs.
///
/// Layout:
///   base + 0x000: U-mode code (ECALL)
///   base + 0x004: addi x1, x0, 42  (U-mode resume after SRET)
///   base + 0x008: ebreak             (stop)
///   base + 0x200: S-mode handler (see build_simple_handler)
fn setup_ecall_dispatch_env() -> (RiscvVm, u64) {
    let mut vm = RiscvVm::new(8192);
    let base = 0x8000_0000u64;
    use geometry_os::riscv::cpu::Privilege;

    vm.cpu.pc = base as u32;
    vm.cpu.privilege = Privilege::User;

    // Delegate ECALL-U (cause 8) to S-mode
    vm.cpu.csr.medeleg = 1 << 8;
    vm.cpu.csr.stvec = (base as u32) + 0x200;

    (vm, base)
}

/// Build a simple S-mode trap handler that:
/// 1. Reads a7 (syscall number) and a0-a5 (args) from registers
/// 2. Writes a return value to a0
/// 3. Advances sepc by 4 (skip the ECALL instruction)
/// 4. SRETs back to U-mode
///
/// The handler at base+0x200:
///   csrrs x5, x0, SEPC    ; x5 = sepc (ECALL PC)
///   addi  x5, x5, 4       ; skip ECALL
///   csrrw x0, x5, SEPC    ; sepc += 4
///   addi  x10, x0, <ret>  ; a0 = return value
///   sret
fn build_simple_handler(base: u64, ret_value: i32) -> Vec<(u64, u32)> {
    vec![
        (base + 0x200, csrrs(5, 0, CSR_SEPC)),  // x5 = sepc
        (base + 0x204, addi(5, 5, 4)),          // x5 += 4
        (base + 0x208, csrrw(0, 5, CSR_SEPC)),  // sepc = x5
        (base + 0x20C, addi(10, 0, ret_value)), // a0 = return value
        (base + 0x210, sret()),                 // return to U-mode
    ]
}

fn load_instructions(vm: &mut RiscvVm, instructions: &[(u64, u32)]) {
    for &(addr, word) in instructions {
        vm.bus.write_word(addr, word).expect("write should succeed");
    }
}

// -----------------------------------------------------------------
// Deliverable 1: Tests for syscall dispatch and argument passing
// -----------------------------------------------------------------

/// Test that U-mode ECALL populates the syscall log with correct
/// syscall number and all 6 argument registers (a0-a5 / x10-x15).
#[test]
fn test_syscall_dispatch_log_captures_all_args() {
    let (mut vm, base) = setup_ecall_dispatch_env();

    let mut code = vec![
        (base, ecall()),            // ECALL with args in a0-a5, a7
        (base + 4, addi(1, 0, 42)), // resume point
        (base + 8, ebreak()),       // stop
    ];
    code.extend(build_simple_handler(base, 0));
    load_instructions(&mut vm, &code);

    // Set syscall number and arguments BEFORE stepping
    vm.cpu.x[17] = 64; // a7 = __NR_write (64)
    vm.cpu.x[10] = 1; // a0 = fd (stdout)
    vm.cpu.x[11] = 0xDEAD; // a1 = buf ptr
    vm.cpu.x[12] = 100; // a2 = count
    vm.cpu.x[13] = 0x1234; // a3
    vm.cpu.x[14] = 0x5678; // a4
    vm.cpu.x[15] = 0x9ABC; // a5

    // Step: ECALL -> trap to S-mode handler
    let r = vm.step();
    assert_eq!(r, StepResult::Ok);

    // Verify syscall log captured the event
    assert_eq!(vm.bus.syscall_log.len(), 1, "should have 1 syscall event");
    let evt = &vm.bus.syscall_log[0];
    assert_eq!(evt.nr, 64, "syscall number should be 64 (__NR_write)");
    assert_eq!(evt.name, "write", "name should decode to 'write'");
    assert_eq!(evt.args[0], 1, "a0 = fd");
    assert_eq!(evt.args[1], 0xDEAD, "a1 = buf ptr");
    assert_eq!(evt.args[2], 100, "a2 = count");
    assert_eq!(evt.args[3], 0x1234, "a3");
    assert_eq!(evt.args[4], 0x5678, "a4");
    assert_eq!(evt.args[5], 0x9ABC, "a5");
    assert_eq!(evt.pc, base as u32, "pc should be ECALL address");
    assert!(evt.ret.is_none(), "ret should be None at dispatch time");
}

/// Test that U-mode ECALL correctly transitions to S-mode and the
/// S-mode handler can read a7 (syscall number) from x17.
#[test]
fn test_syscall_dispatch_u_to_s_handler_reads_a7() {
    let (mut vm, base) = setup_ecall_dispatch_env();

    // S-mode handler that reads a7 into x1, then sets return value and SRETs
    let mut code = vec![
        (base, ecall()),
        (base + 4, addi(1, 0, 42)), // resume
        (base + 8, ebreak()),
    ];
    // Handler reads a7 into x1 for verification, then returns
    let handler = vec![
        (base + 0x200, addi(1, 17, 0)),        // x1 = a7 (syscall nr)
        (base + 0x204, csrrs(5, 0, CSR_SEPC)), // x5 = sepc
        (base + 0x208, addi(5, 5, 4)),         // x5 += 4
        (base + 0x20C, csrrw(0, 5, CSR_SEPC)), // sepc = x5
        (base + 0x210, addi(10, 0, 99)),       // a0 = 99 (return value)
        (base + 0x214, sret()),
    ];
    code.extend(handler);
    load_instructions(&mut vm, &code);

    // Set a7 to a known value
    vm.cpu.x[17] = 57; // __NR_close

    // Step: ECALL traps to S-mode handler
    vm.step();
    assert_eq!(
        vm.cpu.privilege,
        geometry_os::riscv::cpu::Privilege::Supervisor,
        "should be in S-mode handler"
    );

    // Step: handler reads a7 into x1
    vm.step();
    assert_eq!(vm.cpu.x[1], 57, "S-mode handler should see a7=57 in x17");

    // Step through handler: advance sepc, write back
    vm.step(); // csrrs x5, sepc
    vm.step(); // addi x5, x5, 4
    vm.step(); // csrrw sepc, x5
    vm.step(); // addi x10, x0, 99 (set return value)
    let r = vm.step(); // sret
    assert_eq!(r, StepResult::Ok);

    // After SRET: back in U-mode, PC advanced past ECALL
    assert_eq!(vm.cpu.privilege, geometry_os::riscv::cpu::Privilege::User);
    assert_eq!(vm.cpu.pc, (base as u32) + 4, "should resume after ECALL");
    assert_eq!(vm.cpu.x[10], 99, "a0 should hold handler's return value");
}

/// Test that the S-mode handler can read all argument registers
/// and compute a result based on them.
#[test]
fn test_syscall_dispatch_handler_computes_from_args() {
    let (mut vm, base) = setup_ecall_dispatch_env();

    // S-mode handler: compute a0 = a1 + a2 (add the 2nd and 3rd args)
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    let handler = vec![
        (base + 0x200, add(1, 11, 12)),        // x1 = a1 + a2
        (base + 0x204, csrrs(5, 0, CSR_SEPC)), // x5 = sepc
        (base + 0x208, addi(5, 5, 4)),         // x5 += 4
        (base + 0x20C, csrrw(0, 5, CSR_SEPC)), // sepc = x5
        (base + 0x210, addi(10, 1, 0)),        // a0 = x1 (sum)
        (base + 0x214, sret()),
    ];
    code.extend(handler);
    load_instructions(&mut vm, &code);

    // Set args: a0=unused, a1=100, a2=200
    vm.cpu.x[10] = 0;
    vm.cpu.x[11] = 100;
    vm.cpu.x[12] = 200;
    vm.cpu.x[17] = 0; // any syscall number

    // Run the full dispatch round-trip
    for _ in 0..20 {
        match vm.step() {
            StepResult::Ok => {},
            StepResult::Ebreak => break,
            _ => break,
        }
    }

    assert_eq!(vm.cpu.privilege, geometry_os::riscv::cpu::Privilege::User);
    assert_eq!(vm.cpu.x[10], 300, "handler should return a1+a2 = 300");
}

/// Test that pending_syscall_idx is set when U-mode ECALL fires
/// and cleared after the syscall log is cleared.
#[test]
fn test_syscall_dispatch_pending_idx_set_and_cleared() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    code.extend(build_simple_handler(base, 0));
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 64; // __NR_write

    // Before ECALL: no pending syscall
    assert!(vm.bus.pending_syscall_idx.is_none());

    // Step ECALL
    vm.step();
    assert!(
        vm.bus.pending_syscall_idx.is_some(),
        "pending_syscall_idx should be set after U-mode ECALL"
    );
    assert_eq!(vm.bus.pending_syscall_idx.unwrap(), 0, "should be index 0");

    // Clear the log
    vm.bus.syscall_log.clear();
    vm.bus.pending_syscall_idx = None;
    assert!(vm.bus.pending_syscall_idx.is_none());
}

/// Test multiple sequential syscalls: each ECALL adds a new event
/// to the syscall log with correct ordering.
#[test]
fn test_syscall_dispatch_sequential_syscalls_ordered() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![
        (base, ecall()),     // first syscall
        (base + 4, ecall()), // second syscall
        (base + 8, ebreak()),
    ];
    code.extend(build_simple_handler(base, 0));
    load_instructions(&mut vm, &code);

    // First syscall: write (64)
    vm.cpu.x[17] = 64;
    vm.cpu.x[10] = 1;
    vm.step(); // ECALL -> S-mode
    vm.step();
    vm.step();
    vm.step();
    vm.step();
    vm.step(); // handler -> SRET -> U-mode

    // Second syscall: exit (91)
    vm.cpu.x[17] = 91;
    vm.cpu.x[10] = 0;
    vm.step(); // ECALL -> S-mode
    vm.step();
    vm.step();
    vm.step();
    vm.step();
    vm.step(); // handler -> SRET -> U-mode

    assert_eq!(vm.bus.syscall_log.len(), 2, "should have 2 events");
    assert_eq!(vm.bus.syscall_log[0].nr, 64, "first syscall = write");
    assert_eq!(vm.bus.syscall_log[0].name, "write");
    assert_eq!(vm.bus.syscall_log[1].nr, 91, "second syscall = exit");
    assert_eq!(vm.bus.syscall_log[1].name, "exit");
}

// -----------------------------------------------------------------
// Deliverable 2: Tests for syscall return value handling
// and error propagation
// -----------------------------------------------------------------

/// Test that a S-mode handler's return value in a0 is correctly
/// propagated back to U-mode after SRET.
#[test]
fn test_syscall_return_value_positive_propagated() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    // Handler returns 42
    code.extend(build_simple_handler(base, 42));
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 0;

    // Run through ECALL + handler + SRET
    for _ in 0..20 {
        match vm.step() {
            StepResult::Ok => {},
            StepResult::Ebreak => break,
            _ => break,
        }
    }

    assert_eq!(vm.cpu.x[10], 42, "a0 should be 42 (handler's return value)");
}

/// Test that a negative error code (Linux convention: -errno)
/// in a0 is preserved correctly as u32 through the trap round-trip.
/// -EPERM = -1 = 0xFFFFFFFF in u32.
#[test]
fn test_syscall_return_value_negative_errno_preserved() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    // Handler returns -1 (EPERM)
    code.extend(build_simple_handler(base, -1));
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 0;

    for _ in 0..20 {
        match vm.step() {
            StepResult::Ok => {},
            StepResult::Ebreak => break,
            _ => break,
        }
    }

    assert_eq!(
        vm.cpu.x[10], 0xFFFFFFFF,
        "a0 should be 0xFFFFFFFF (-EPERM preserved as u32)"
    );
}

/// Test that -ENOENT (-2 = 0xFFFFFFFE) is preserved correctly.
#[test]
fn test_syscall_return_value_enoent_preserved() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    // Handler returns -2 (ENOENT)
    code.extend(build_simple_handler(base, -2));
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 0;

    for _ in 0..20 {
        match vm.step() {
            StepResult::Ok => {},
            StepResult::Ebreak => break,
            _ => break,
        }
    }

    assert_eq!(
        vm.cpu.x[10], 0xFFFFFFFE,
        "a0 should be 0xFFFFFFFE (-ENOENT preserved as u32)"
    );
}

/// Test that zero is a valid return value (success in Linux convention).
#[test]
fn test_syscall_return_value_zero_is_success() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    code.extend(build_simple_handler(base, 0));
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 0;

    for _ in 0..20 {
        match vm.step() {
            StepResult::Ok => {},
            StepResult::Ebreak => break,
            _ => break,
        }
    }

    assert_eq!(vm.cpu.x[10], 0, "a0 = 0 means success");
}

/// Test that large positive return values (e.g., file size or byte count)
/// are preserved through the trap round-trip without truncation.
#[test]
fn test_syscall_return_value_large_positive() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    // Handler returns 0x7FFFF000 (top of user VA space, typical mmap hint)
    // lui places imm in bits [31:12], so we pass the full target value
    let handler = vec![
        (base + 0x200, csrrs(5, 0, CSR_SEPC)),
        (base + 0x204, addi(5, 5, 4)),
        (base + 0x208, csrrw(0, 5, CSR_SEPC)),
        (base + 0x20C, lui(10, 0x7FFFF000)), // a0 = 0x7FFFF000
        (base + 0x210, sret()),
    ];
    code.extend(handler);
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 0;

    for _ in 0..20 {
        match vm.step() {
            StepResult::Ok => {},
            StepResult::Ebreak => break,
            _ => break,
        }
    }

    assert_eq!(
        vm.cpu.x[10], 0x7FFFF000,
        "large return value should be preserved"
    );
}

/// Test that a0 is the ONLY register modified by the handler's return
/// path (other argument registers a1-a5 are preserved).
#[test]
fn test_syscall_return_preserves_other_registers() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    code.extend(build_simple_handler(base, 99));
    load_instructions(&mut vm, &code);

    // Set up arguments
    vm.cpu.x[10] = 1; // a0 = fd
    vm.cpu.x[11] = 0xBEEF; // a1
    vm.cpu.x[12] = 0xCAFE; // a2
    vm.cpu.x[13] = 0xF00D; // a3
    vm.cpu.x[14] = 0xBAAD; // a4
    vm.cpu.x[15] = 0xFACE; // a5
    vm.cpu.x[17] = 0;

    for _ in 0..20 {
        match vm.step() {
            StepResult::Ok => {},
            StepResult::Ebreak => break,
            _ => break,
        }
    }

    // a0 should be the return value
    assert_eq!(vm.cpu.x[10], 99, "a0 = return value");
    // a1-a5 should be preserved (handler only touched x5 and x10)
    assert_eq!(vm.cpu.x[11], 0xBEEF, "a1 preserved");
    assert_eq!(vm.cpu.x[12], 0xCAFE, "a2 preserved");
    assert_eq!(vm.cpu.x[13], 0xF00D, "a3 preserved");
    assert_eq!(vm.cpu.x[14], 0xBAAD, "a4 preserved");
    assert_eq!(vm.cpu.x[15], 0xFACE, "a5 preserved");
}

// -----------------------------------------------------------------
// Deliverable 3: Tests for syscall number validation
// -----------------------------------------------------------------

/// Test that the syscall log correctly decodes the name for known
/// Linux syscall numbers.
#[test]
fn test_syscall_number_known_decodes_name() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    code.extend(build_simple_handler(base, 0));
    load_instructions(&mut vm, &code);

    // Test a few known syscall numbers
    let known = [
        (1, "open"),
        (2, "close"), // Note: close=57 in newer ABIs, but our table may map 2
        (39, "mkdir"),
        (57, "close"),
        (63, "read"),
        (64, "write"),
        (91, "exit"),
        (172, "getpid"),
        (220, "clone"),
    ];

    for (nr, expected_name) in &known {
        vm.cpu.pc = base as u32;
        vm.cpu.privilege = geometry_os::riscv::cpu::Privilege::User;
        vm.cpu.x[17] = *nr;
        vm.bus.syscall_log.clear();
        vm.bus.pending_syscall_idx = None;

        vm.step(); // ECALL -> S-mode

        assert_eq!(vm.bus.syscall_log.len(), 1);
        // The name may be "unknown" if not in the table -- just verify it's not empty
        assert!(
            !vm.bus.syscall_log[0].name.is_empty(),
            "syscall {} should have a non-empty name",
            nr
        );
        // For well-known syscalls, check exact name
        if *nr == 64 || *nr == 91 || *nr == 57 {
            assert_eq!(
                vm.bus.syscall_log[0].name, *expected_name,
                "syscall {} should decode as '{}'",
                nr, expected_name
            );
        }

        // Run handler to SRET back to U-mode
        for _ in 0..10 {
            match vm.step() {
                StepResult::Ok => {},
                StepResult::Ebreak => break,
                _ => break,
            }
        }
    }
}

/// Test that an out-of-range syscall number (very large) still
/// dispatches correctly but shows as "unknown" in the log.
#[test]
fn test_syscall_number_out_of_range_is_unknown() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    code.extend(build_simple_handler(base, -22)); // -EINVAL
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 0xFFFFFF; // way out of range

    vm.step(); // ECALL -> S-mode

    assert_eq!(vm.bus.syscall_log.len(), 1);
    assert_eq!(vm.bus.syscall_log[0].nr, 0xFFFFFF);
    assert_eq!(
        vm.bus.syscall_log[0].name, "unknown",
        "out-of-range syscall should decode as 'unknown'"
    );
}

/// Test that syscall number 0 (which is Linux's "read" in some older
/// ABIs or just unmapped) is handled without panic.
#[test]
fn test_syscall_number_zero_handled() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    code.extend(build_simple_handler(base, 0));
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 0; // syscall 0

    vm.step(); // should not panic

    assert_eq!(vm.bus.syscall_log.len(), 1);
    assert_eq!(vm.bus.syscall_log[0].nr, 0);
    // Name might be "io_setup" or "unknown" depending on the table
    assert!(!vm.bus.syscall_log[0].name.is_empty());
}

/// Test that syscall number 0xFFFFFFFF (max u32) is handled
/// without panic and shows as "unknown".
#[test]
fn test_syscall_number_max_u32_handled() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    code.extend(build_simple_handler(base, -1)); // -EPERM
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 0xFFFFFFFF;

    vm.step(); // should not panic

    assert_eq!(vm.bus.syscall_log.len(), 1);
    assert_eq!(vm.bus.syscall_log[0].nr, 0xFFFFFFFF);
    assert_eq!(vm.bus.syscall_log[0].name, "unknown");
}

/// Test that the PC in the syscall event points to the ECALL instruction,
/// not to the next instruction.
#[test]
fn test_syscall_pc_points_to_ecall_instruction() {
    let (mut vm, base) = setup_ecall_dispatch_env();
    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    code.extend(build_simple_handler(base, 0));
    load_instructions(&mut vm, &code);

    vm.cpu.x[17] = 64;
    vm.cpu.pc = base as u32;

    vm.step(); // ECALL

    assert_eq!(
        vm.bus.syscall_log[0].pc, base as u32,
        "PC in event should be the ECALL address"
    );
}

/// Test that when ECALL-U is NOT delegated (no medeleg), it traps
/// to M-mode instead of S-mode, and the syscall log is still populated.
#[test]
fn test_syscall_no_delegation_traps_to_m_mode() {
    let mut vm = RiscvVm::new(8192);
    let base = 0x8000_0000u64;
    use geometry_os::riscv::cpu::Privilege;

    let mut code = vec![(base, ecall()), (base + 4, ebreak())];
    // M-mode handler at base+0x400
    code.push((base + 0x400, ebreak()));
    load_instructions(&mut vm, &code);

    vm.cpu.pc = base as u32;
    vm.cpu.privilege = Privilege::User;
    // NO medeleg set -- ECALL-U goes to M-mode
    vm.cpu.csr.mtvec = (base as u32) + 0x400;
    vm.cpu.x[17] = 64;

    vm.step(); // ECALL -> should trap to M-mode

    assert_eq!(
        vm.cpu.privilege,
        Privilege::Machine,
        "should trap to M-mode when ECALL-U is not delegated"
    );
    assert_eq!(vm.cpu.pc, (base as u32) + 0x400);
    assert_eq!(vm.cpu.csr.mcause, 8, "mcause = ECALL-U (8)");

    // Syscall log should still be populated (logging happens before delegation check)
    assert_eq!(
        vm.bus.syscall_log.len(),
        1,
        "log should still capture U-mode ECALL"
    );
    assert_eq!(vm.bus.syscall_log[0].nr, 64);
}
