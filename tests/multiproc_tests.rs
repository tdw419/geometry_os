// tests/multiproc_tests.rs -- Phase 209: Cooperative Multi-Process Integration Tests
//
// Tests the full multi-process lifecycle: spawn, yield, round-robin,
// context isolation, and kill -- all via the RiscvVm public API and
// SBI extensions.

use geometry_os::riscv::cpu;
use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::*;

/// Helper: build a minimal ELF that loops ECALL + J back.
/// Entry at 0x80000100, code is ECALL (0x00000073) then J x0, -4 (0xFF5FF06F).
fn make_yield_loop_elf() -> Vec<u8> {
    let mut image = vec![0u8; 264];

    // ELF header (32-bit LE)
    image[0..4].copy_from_slice(&[0x7F, 0x45, 0x4C, 0x46]); // magic
    image[4] = 1; // ELFCLASS32
    image[5] = 1; // ELFDATA2LSB
    image[16] = 2; // ET_EXEC
    image[18] = 243; // EM_RISCV
                     // e_entry = 0x80000100
    image[24..28].copy_from_slice(&0x80000100u32.to_le_bytes());
    // e_phoff = 52
    image[28..32].copy_from_slice(&52u32.to_le_bytes());
    // e_phentsize = 32
    image[42..44].copy_from_slice(&32u16.to_le_bytes());
    // e_phnum = 1
    image[44..46].copy_from_slice(&1u16.to_le_bytes());

    // Program header at offset 52
    // p_type = PT_LOAD
    image[52..56].copy_from_slice(&1u32.to_le_bytes());
    // p_offset = 256
    image[56..60].copy_from_slice(&256u32.to_le_bytes());
    // p_vaddr = 0x80000100
    image[60..64].copy_from_slice(&0x80000100u32.to_le_bytes());
    // p_paddr = 0x80000100
    image[64..68].copy_from_slice(&0x80000100u32.to_le_bytes());
    // p_filesz = 8
    image[68..72].copy_from_slice(&8u32.to_le_bytes());
    // p_memsz = 8
    image[72..76].copy_from_slice(&8u32.to_le_bytes());
    // p_flags = PF_R | PF_X
    image[76..80].copy_from_slice(&5u32.to_le_bytes());

    // Code at offset 256: ECALL + J back
    image[256..260].copy_from_slice(&0x00000073u32.to_le_bytes()); // ECALL
    image[260..264].copy_from_slice(&0xFF5FF06Fu32.to_le_bytes()); // J x0, -4

    image
}

/// Helper: set up GEO_YIELD SBI registers on the current CPU context.
fn setup_yield_regs(vm: &mut RiscvVm) {
    vm.cpu.x[17] = 0x47454F00; // SBI_EXT_GEOMETRY
    vm.cpu.x[16] = 1; // GEO_FN_YIELD
}

/// Helper: set up GEO_SPAWN SBI registers.
fn setup_spawn_regs(vm: &mut RiscvVm, entry: u32) {
    vm.cpu.x[17] = 0x47454F00; // SBI_EXT_GEOMETRY
    vm.cpu.x[16] = 3; // GEO_FN_SPAWN
    vm.cpu.x[10] = entry; // entry point
}

#[test]
fn test_two_contexts_yield_round_robin() {
    let elf = make_yield_loop_elf();
    let mut vm = RiscvVm::new(0x100000);

    // Load ELF into context 0
    let info = geometry_os::riscv::loader::load_elf(&mut vm.bus, &elf).unwrap();
    vm.cpu.pc = info.entry;
    vm.cpu.privilege = cpu::Privilege::Machine;
    setup_yield_regs(&mut vm);

    // Create context 1 pointing to the same code
    vm.contexts.push(GuestContext::new(1));
    vm.contexts[1].pc = info.entry;
    vm.contexts[1].privilege = cpu::Privilege::Machine;

    // Run until we've seen 10 yields
    let mut yields = 0;
    let mut ctx0_yields = 0;
    let mut ctx1_yields = 0;

    for _ in 0..300 {
        let result = vm.step();
        match result {
            StepResult::Yielded => {
                yields += 1;
                if vm.current_context == 0 {
                    ctx0_yields += 1;
                    setup_yield_regs(&mut vm);
                } else {
                    ctx1_yields += 1;
                    setup_yield_regs(&mut vm);
                }
                if yields >= 10 {
                    break;
                }
            },
            StepResult::Ok => {},
            other => panic!("Unexpected: {:?}", other),
        }
    }

    assert_eq!(yields, 10);
    assert!(
        ctx0_yields >= 4,
        "ctx0 should yield at least 4 times, got {}",
        ctx0_yields
    );
    assert!(
        ctx1_yields >= 4,
        "ctx1 should yield at least 4 times, got {}",
        ctx1_yields
    );
}

#[test]
fn test_context_isolation() {
    let elf = make_yield_loop_elf();
    let mut vm = RiscvVm::new(0x100000);

    let info = geometry_os::riscv::loader::load_elf(&mut vm.bus, &elf).unwrap();
    vm.cpu.pc = info.entry;
    vm.cpu.privilege = cpu::Privilege::Machine;

    // Context 0: set x5 = 42
    vm.cpu.x[5] = 42;
    vm.save_context();

    // Context 1: set x5 = 99
    vm.contexts.push(GuestContext::new(1));
    vm.contexts[1].pc = info.entry;
    vm.contexts[1].privilege = cpu::Privilege::Machine;
    vm.contexts[1].x[5] = 99;

    // Switch to context 1
    vm.current_context = 1;
    vm.restore_context();
    assert_eq!(vm.cpu.x[5], 99);

    // Switch back to context 0
    vm.current_context = 0;
    vm.restore_context();
    assert_eq!(vm.cpu.x[5], 42);
}

#[test]
fn test_spawn_via_sbi_ecall() {
    let mut vm = RiscvVm::new(0x100000);

    // Write ECALL at PC
    vm.bus.write_word(vm.bus.mem.ram_base, 0x00000073).unwrap();
    vm.cpu.privilege = cpu::Privilege::Machine;
    setup_spawn_regs(&mut vm, 0x80100000);

    assert_eq!(vm.contexts.len(), 1);

    // Step 1: ECALL sets spawn_requested in SBI handler
    vm.step();
    assert_eq!(
        vm.contexts.len(),
        1,
        "spawn not yet processed after first step"
    );

    // Step 2: spawn_requested is consumed at start of step, creating context
    vm.step();
    assert_eq!(
        vm.contexts.len(),
        2,
        "spawn should create context after second step"
    );
    assert_eq!(vm.contexts[1].pc, 0x80100000);
    assert_eq!(vm.cpu.x[10], 1, "a0 should return new context ID");
}

#[test]
fn test_kill_context_skips_in_round_robin() {
    let elf = make_yield_loop_elf();
    let mut vm = RiscvVm::new(0x100000);

    let info = geometry_os::riscv::loader::load_elf(&mut vm.bus, &elf).unwrap();
    vm.cpu.pc = info.entry;
    vm.cpu.privilege = cpu::Privilege::Machine;
    setup_yield_regs(&mut vm);

    // Create contexts 1 and 2
    vm.contexts.push(GuestContext::new(1));
    vm.contexts[1].pc = info.entry;
    vm.contexts[1].privilege = cpu::Privilege::Machine;

    vm.contexts.push(GuestContext::new(2));
    vm.contexts[2].pc = info.entry;
    vm.contexts[2].privilege = cpu::Privilege::Machine;

    assert_eq!(vm.alive_context_count(), 3);

    // Kill context 1
    vm.kill_context(1);
    assert_eq!(vm.alive_context_count(), 2);

    // Yield from context 0 -- should skip dead context 1, go to 2
    setup_yield_regs(&mut vm);
    let result = vm.step();
    assert_eq!(result, StepResult::Yielded);
    assert_eq!(vm.current_context, 2, "should skip dead context 1");
}
