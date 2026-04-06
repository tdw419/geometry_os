//! Phase 9: Sv39 Virtual Memory Tests
//!
//! Tests the Sv39 3-level page table walk implementation.
//! All tests set up page tables in M-mode (physical), then switch to S-mode
//! with satp.MODE=8 to enable translation.

use pixels_move_pixels::rv64::executor::Rv64Cpu;

// PTE flag bits
const PTE_V: u64 = 1 << 0; // Valid
const PTE_R: u64 = 1 << 1; // Read
const PTE_W: u64 = 1 << 2; // Write
const PTE_X: u64 = 1 << 3; // Execute
const _PTE_U: u64 = 1 << 4; // User (reserved for future U-mode tests)
const PTE_A: u64 = 1 << 6; // Accessed
const PTE_D: u64 = 1 << 7; // Dirty

/// Build a leaf PTE: PPN + V+R+W+X+A+D flags
fn make_leaf_pte(ppn: u64, flags: u64) -> u64 {
    (ppn << 10) | PTE_V | flags
}

/// Build a non-leaf PTE: PPN + V flag only (R=W=X=0)
fn make_nonleaf_pte(ppn: u64) -> u64 {
    (ppn << 10) | PTE_V
}

/// Build satp value: mode=8 (Sv39), ASID=0, PPN=root table
fn make_satp(root_ppn: u64) -> u64 {
    (8u64 << 60) | root_ppn
}

// Physical addresses for test page tables
// L2 table at 0x80100000 (4KB, 512 entries)
const L2_TABLE: u64 = 0x8010_0000;
// L1 table at 0x80101000
const L1_TABLE: u64 = 0x8010_1000;
// L0 table at 0x80102000
const L0_TABLE: u64 = 0x8010_2000;
// Data page at 0x80103000
const DATA_PAGE: u64 = 0x8010_3000;
// Second data page at 0x80104000
const _DATA_PAGE2: u64 = 0x8010_4000;

// For 0x80000000: VPN[2]=2, VPN[1]=0, VPN[0]=0
// VPN[2] = (0x80000000 >> 30) & 0x1FF = 2
const VPN2_KERNEL: u64 = 2;

/// Set up a 3-level identity mapping for a single 4KB page at 0x80000000.
/// VA 0x80000000 -> PA 0x80000000
fn setup_identity_page(cpu: &mut Rv64Cpu) {
    // L2[2] -> L1 table (non-leaf)
    let l2_entry = make_nonleaf_pte(L1_TABLE >> 12);
    cpu.store_dword(L2_TABLE + VPN2_KERNEL * 8, l2_entry);

    // L1[0] -> L0 table (non-leaf)
    let l1_entry = make_nonleaf_pte(L0_TABLE >> 12);
    cpu.store_dword(L1_TABLE + 0 * 8, l1_entry);

    // L0[0] -> physical page at 0x80000000 (leaf, RWX)
    let l0_entry = make_leaf_pte(0x80000, PTE_R | PTE_W | PTE_X | PTE_A | PTE_D);
    cpu.store_dword(L0_TABLE + 0 * 8, l0_entry);
}

/// Enable Sv39 paging and switch to S-mode
fn enable_sv39(cpu: &mut Rv64Cpu) {
    cpu.satp = make_satp(L2_TABLE >> 12);
    cpu.priv_level = 1; // S-mode
}

#[test]
fn test_sv39_identity_map_read_write() {
    let mut cpu = Rv64Cpu::new();
    // CPU starts in M-mode -- all stores use physical addresses

    // Write a value to physical 0x80000000
    cpu.store_dword(0x8000_0000, 0xDEADBEEFCAFEBABE);

    // Set up identity mapping: VA 0x80000000 -> PA 0x80000000
    setup_identity_page(&mut cpu);

    // Enable Sv39 and drop to S-mode
    enable_sv39(&mut cpu);

    // Read through virtual address -- should get the same value
    let val = cpu.load_dword(0x8000_0000);
    assert_eq!(val, 0xDEADBEEFCAFEBABE, "Identity map read failed");

    // Write a new value through virtual address
    cpu.store_dword(0x8000_0000, 0x123456789ABCDEF0);

    // Read it back
    let val2 = cpu.load_dword(0x8000_0000);
    assert_eq!(val2, 0x123456789ABCDEF0, "Identity map write failed");
}

#[test]
fn test_sv39_remapping() {
    // Map VA 0x80000000 to PA 0x80103000 (not identity)
    let mut cpu = Rv64Cpu::new();

    // Write different values to two physical pages
    cpu.store_dword(0x8000_0000, 0xAAAA_AAAA_AAAA_AAAA);
    cpu.store_dword(DATA_PAGE, 0xBBBB_BBBB_BBBB_BBBB);

    // Set up page tables: VA 0x80000000 -> PA DATA_PAGE
    let l2_entry = make_nonleaf_pte(L1_TABLE >> 12);
    cpu.store_dword(L2_TABLE + VPN2_KERNEL * 8, l2_entry);

    let l1_entry = make_nonleaf_pte(L0_TABLE >> 12);
    cpu.store_dword(L1_TABLE + 0 * 8, l1_entry);

    // L0[0] -> DATA_PAGE (remapped!)
    let l0_entry = make_leaf_pte(DATA_PAGE >> 12, PTE_R | PTE_W | PTE_X | PTE_A | PTE_D);
    cpu.store_dword(L0_TABLE + 0 * 8, l0_entry);

    enable_sv39(&mut cpu);

    // Read VA 0x80000000 -- should get DATA_PAGE's content, not 0x80000000's
    let val = cpu.load_dword(0x8000_0000);
    assert_eq!(
        val, 0xBBBB_BBBB_BBBB_BBBB,
        "Remapped read should see DATA_PAGE, got {:#x}",
        val
    );

    // Write through VA -- should go to DATA_PAGE
    cpu.store_dword(0x8000_0000, 0xCCCC_CCCC_CCCC_CCCC);

    // Switch back to M-mode to verify physical address
    cpu.priv_level = 3;
    cpu.satp = 0;

    let phys_val = cpu.load_dword(DATA_PAGE);
    assert_eq!(
        phys_val, 0xCCCC_CCCC_CCCC_CCCC,
        "Write went to wrong physical page"
    );

    // Original 0x80000000 should be untouched
    let orig_val = cpu.load_dword(0x8000_0000);
    assert_eq!(orig_val, 0xAAAA_AAAA_AAAA_AAAA, "Original page was modified");
}

#[test]
fn test_sv39_unmapped_page_fault() {
    // Access a VA that has no page table entry -- translate should fail
    let mut cpu = Rv64Cpu::new();

    // Set up identity mapping for 0x80000000 only
    setup_identity_page(&mut cpu);
    enable_sv39(&mut cpu);

    // Access 0x80001000 -- VPN[0]=1, which has no L0 entry
    // translate_addr returns None, unwrap_or falls back to VA
    // This is a soft fault for now -- we verify it reads 0 (unmapped physical page)
    let val = cpu.load_dword(0x8000_1000);
    // The page is not mapped, so it should read default (0 from uninitialized sparse memory)
    assert_eq!(val, 0, "Unmapped page should read 0 (sparse memory)");
}

#[test]
fn test_sv39_multiple_pages() {
    // Map multiple consecutive 4KB pages
    let mut cpu = Rv64Cpu::new();

    // Write data to physical pages
    cpu.store_dword(0x8000_0000, 0x1111_1111_1111_1111);
    cpu.store_dword(0x8000_1000, 0x2222_2222_2222_2222);
    cpu.store_dword(0x8000_2000, 0x3333_3333_3333_3333);

    // Set up page tables
    let l2_entry = make_nonleaf_pte(L1_TABLE >> 12);
    cpu.store_dword(L2_TABLE + VPN2_KERNEL * 8, l2_entry);

    let l1_entry = make_nonleaf_pte(L0_TABLE >> 12);
    cpu.store_dword(L1_TABLE + 0 * 8, l1_entry);

    // Map L0[0] -> 0x80000000, L0[1] -> 0x80001000, L0[2] -> 0x80002000
    for i in 0..3u64 {
        let ppn = 0x80000 + i; // 0x80000, 0x80001, 0x80002
        let entry = make_leaf_pte(ppn, PTE_R | PTE_W | PTE_X | PTE_A | PTE_D);
        cpu.store_dword(L0_TABLE + i * 8, entry);
    }

    enable_sv39(&mut cpu);

    assert_eq!(
        cpu.load_dword(0x8000_0000),
        0x1111_1111_1111_1111,
        "Page 0 mismatch"
    );
    assert_eq!(
        cpu.load_dword(0x8000_1000),
        0x2222_2222_2222_2222,
        "Page 1 mismatch"
    );
    assert_eq!(
        cpu.load_dword(0x8000_2000),
        0x3333_3333_3333_3333,
        "Page 2 mismatch"
    );
}

#[test]
fn test_sv39_megapage_2mb() {
    // Test a 2MB megapage (level-1 leaf): VA range mapped with a single L1 entry.
    // VPN[2]=2, VPN[1]=0 -> maps 0x80000000..0x801FFFFF (2MB)
    let mut cpu = Rv64Cpu::new();

    // Write pattern across the 2MB range
    cpu.store_dword(0x8000_0000, 0xAAAA_1111_AAAA_1111);
    cpu.store_dword(0x8000_1000, 0xAAAA_2222_AAAA_2222);
    cpu.store_dword(0x801F_F000, 0xAAAA_3333_AAAA_3333);

    // L2[2] -> L1 table (non-leaf)
    let l2_entry = make_nonleaf_pte(L1_TABLE >> 12);
    cpu.store_dword(L2_TABLE + VPN2_KERNEL * 8, l2_entry);

    // L1[0] -> megapage at PPN 0x80000 (2MB aligned, PPN[8:0]=0)
    // This is a leaf at level 1 (R|X != 0)
    let megapte = make_leaf_pte(0x80000, PTE_R | PTE_W | PTE_X | PTE_A | PTE_D);
    cpu.store_dword(L1_TABLE + 0 * 8, megapte);

    enable_sv39(&mut cpu);

    // All accesses within the 2MB range should work via megapage
    assert_eq!(cpu.load_dword(0x8000_0000), 0xAAAA_1111_AAAA_1111);
    assert_eq!(cpu.load_dword(0x8000_1000), 0xAAAA_2222_AAAA_2222);
    assert_eq!(cpu.load_dword(0x801F_F000), 0xAAAA_3333_AAAA_3333);
}

#[test]
fn test_sv39_gigapage_1gb() {
    // Test a 1GB gigapage (level-2 leaf): single L2 entry maps 1GB.
    // VPN[2]=2 -> maps 0x80000000..0xBFFFFFFF (1GB)
    let mut cpu = Rv64Cpu::new();

    cpu.store_dword(0x8000_0000, 0xDEAD_0000_DEAD_0000);
    cpu.store_dword(0x9000_0000, 0xDEAD_1111_DEAD_1111);
    // Don't test 0xBFFF_F000 -- sparse memory handles it but let's keep it simple

    // L2[2] -> gigapage at PPN 0x80000 (1GB aligned, PPN[17:0]=0)
    // 0x80000 << 12 = 0x80000000. PPN[17:0] = 0x80000 & 0x3FFFF = 0x00000. Yes, aligned.
    let gigapte = make_leaf_pte(0x80000, PTE_R | PTE_W | PTE_X | PTE_A | PTE_D);
    cpu.store_dword(L2_TABLE + VPN2_KERNEL * 8, gigapte);

    enable_sv39(&mut cpu);

    assert_eq!(cpu.load_dword(0x8000_0000), 0xDEAD_0000_DEAD_0000);
    assert_eq!(cpu.load_dword(0x9000_0000), 0xDEAD_1111_DEAD_1111);
}

#[test]
fn test_sv39_mmode_bypass() {
    // Verify M-mode always uses physical addresses, ignoring satp
    let mut cpu = Rv64Cpu::new();

    cpu.store_dword(0x8000_0000, 0xFEED_FACE);
    setup_identity_page(&mut cpu);
    cpu.satp = make_satp(L2_TABLE >> 12);
    // Stay in M-mode (priv_level = 3)
    assert_eq!(cpu.priv_level, 3);

    // M-mode should bypass translation and read physical memory directly
    let val = cpu.load_dword(0x8000_0000);
    assert_eq!(val, 0xFEED_FACE, "M-mode should bypass Sv39");
}

#[test]
fn test_sv39_byte_level_access() {
    // Verify byte and halfword loads/stores work through Sv39
    let mut cpu = Rv64Cpu::new();

    // Write bytes at physical address
    cpu.store_dword(DATA_PAGE, 0x01020304_05060708);

    // Map VA 0x80000000 -> PA DATA_PAGE
    let l2_entry = make_nonleaf_pte(L1_TABLE >> 12);
    cpu.store_dword(L2_TABLE + VPN2_KERNEL * 8, l2_entry);
    let l1_entry = make_nonleaf_pte(L0_TABLE >> 12);
    cpu.store_dword(L1_TABLE + 0 * 8, l1_entry);
    let l0_entry = make_leaf_pte(DATA_PAGE >> 12, PTE_R | PTE_W | PTE_X | PTE_A | PTE_D);
    cpu.store_dword(L0_TABLE + 0 * 8, l0_entry);

    enable_sv39(&mut cpu);

    // Byte reads (little-endian: 0x0102030405060708 stored as 08 07 06 05 04 03 02 01)
    assert_eq!(cpu.load_byte(0x8000_0000), 0x08, "Byte 0 mismatch");
    assert_eq!(cpu.load_byte(0x8000_0001), 0x07, "Byte 1 mismatch");
    assert_eq!(cpu.load_byte(0x8000_0007), 0x01, "Byte 7 mismatch");

    // Halfword read
    assert_eq!(cpu.load_hword(0x8000_0000), 0x0708, "Hword 0 mismatch");

    // Byte write
    cpu.store_byte(0x8000_0003, 0xFF);
    assert_eq!(cpu.load_byte(0x8000_0003), 0xFF, "Byte write mismatch");
}

#[test]
fn test_sv39_instruction_fetch() {
    // Verify instruction fetch (PC translation) works through Sv39.
    // We manually encode instructions and put them at the mapped VA.
    let mut cpu = Rv64Cpu::new();

    // Encode: ADDI x1, x0, 42
    let addi_inst: u32 = (42 << 20) | (0 << 15) | (0 << 12) | (1 << 7) | 0x13;

    // Write instruction to physical page
    let buf = addi_inst.to_le_bytes();
    cpu.mem.write_bytes(DATA_PAGE, &buf);

    // Map VA 0x80000000 -> PA DATA_PAGE
    let l2_entry = make_nonleaf_pte(L1_TABLE >> 12);
    cpu.store_dword(L2_TABLE + VPN2_KERNEL * 8, l2_entry);
    let l1_entry = make_nonleaf_pte(L0_TABLE >> 12);
    cpu.store_dword(L1_TABLE + 0 * 8, l1_entry);
    let l0_entry = make_leaf_pte(DATA_PAGE >> 12, PTE_R | PTE_W | PTE_X | PTE_A | PTE_D);
    cpu.store_dword(L0_TABLE + 0 * 8, l0_entry);

    enable_sv39(&mut cpu);

    // Set PC to virtual address
    cpu.pc = 0x8000_0000;

    // Execute one instruction
    cpu.step();

    // x1 should be 42
    assert_eq!(cpu.x[1], 42, "Instruction fetch through Sv39 failed");
    // PC should have advanced
    assert_eq!(cpu.pc, 0x8000_0004, "PC should advance by 4");
}

#[test]
fn test_sv39_instruction_execution_pipeline() {
    // Full end-to-end: load program via mapped VA, execute via mapped VA
    let mut cpu = Rv64Cpu::new();

    // Encode a program:
    //   ADDI x1, x0, 10     // x1 = 10
    //   ADDI x2, x0, 20     // x2 = 20
    //   ADD  x3, x1, x2     // x3 = 30
    let program: Vec<u32> = vec![
        (10u32 << 20) | (0 << 15) | (0 << 12) | (1 << 7) | 0x13, // ADDI x1, x0, 10
        (20u32 << 20) | (0 << 15) | (0 << 12) | (2 << 7) | 0x13, // ADDI x2, x0, 20
        (0u32 << 25) | (2 << 20) | (1 << 15) | (0 << 12) | (3 << 7) | 0x33, // ADD x3, x1, x2
    ];

    // Write program to physical page
    for (i, &inst) in program.iter().enumerate() {
        cpu.mem.write_bytes(DATA_PAGE + (i as u64) * 4, &inst.to_le_bytes());
    }

    // Map VA 0x80000000 -> PA DATA_PAGE
    let l2_entry = make_nonleaf_pte(L1_TABLE >> 12);
    cpu.store_dword(L2_TABLE + VPN2_KERNEL * 8, l2_entry);
    let l1_entry = make_nonleaf_pte(L0_TABLE >> 12);
    cpu.store_dword(L1_TABLE + 0 * 8, l1_entry);
    let l0_entry = make_leaf_pte(DATA_PAGE >> 12, PTE_R | PTE_W | PTE_X | PTE_A | PTE_D);
    cpu.store_dword(L0_TABLE + 0 * 8, l0_entry);

    enable_sv39(&mut cpu);
    cpu.pc = 0x8000_0000;

    // Execute 3 instructions
    cpu.step();
    cpu.step();
    cpu.step();

    assert_eq!(cpu.x[1], 10, "x1 should be 10");
    assert_eq!(cpu.x[2], 20, "x2 should be 20");
    assert_eq!(cpu.x[3], 30, "x3 should be 30 (10+20)");
    assert_eq!(cpu.pc, 0x8000_000C, "PC should be at 0x8000_000C");
}
