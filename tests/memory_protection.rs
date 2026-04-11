// ═══════════════════════════════════════════════════════════════════════
// MEMORY PROTECTION TESTS
//
// Tests for the VM memory protection feature: region-based access control
// for LOAD, STORE, LDB, STB, BLIT, and EDIT_BLIT opcodes.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::opcodes::op;
use geometry_os::vm::{MemoryRegion, Vm, VmError};

// ── Helper: build a simple STORE program ─────────────────────────────
// LDI r1, <addr>   ; I 1 addr   (pixels 0,1,2)
// LDI r0, 42       ; I 0 42     (pixels 3,4,5)
// STORE r1, r0     ; S 1 0      (pixels 6,7,8)
// HALT              ; H          (pixel 9)
fn make_store_program(addr: u32) -> Vec<u32> {
    vec![
        op::LDI as u32, 0x31, addr,           // LDI r1, addr
        op::LDI as u32, 0x30, 42,             // LDI r0, 42
        op::STORE as u32, 0x31, 0x30,         // STORE r1, r0
        op::HALT as u32,                       // HALT
    ]
}

// ── Helper: build a simple LOAD program ──────────────────────────────
// LDI r1, <addr>   ; I 1 addr   (pixels 0,1,2)
// LOAD r0, r1      ; L 0 1      (pixels 3,4,5)
// HALT              ; H          (pixel 6)
fn make_load_program(addr: u32) -> Vec<u32> {
    vec![
        op::LDI as u32, 0x31, addr,           // LDI r1, addr
        op::LOAD as u32, 0x30, 0x31,          // LOAD r0, r1
        op::HALT as u32,                       // HALT
    ]
}

// ── Helper: build a STB program ──────────────────────────────────────
// LDI r1, <byte_addr>   ; I 1 byte_addr   (pixels 0,1,2)
// LDI r0, 0x42          ; I 0 0x42        (pixels 3,4,5)
// STB r1, r0            ; s 1 0           (pixels 6,7,8)
// HALT                   ; H               (pixel 9)
fn make_stb_program(byte_addr: u32) -> Vec<u32> {
    vec![
        op::LDI as u32, 0x31, byte_addr,      // LDI r1, byte_addr
        op::LDI as u32, 0x30, 0x42,           // LDI r0, 0x42
        op::STB as u32, 0x31, 0x30,           // STB r1, r0
        op::HALT as u32,                       // HALT
    ]
}

// ── Helper: build a LDB program ──────────────────────────────────────
// LDI r1, <byte_addr>   ; I 1 byte_addr   (pixels 0,1,2)
// LDB r0, r1            ; d 0 1           (pixels 3,4,5)
// HALT                   ; H               (pixel 6)
fn make_ldb_program(byte_addr: u32) -> Vec<u32> {
    vec![
        op::LDI as u32, 0x31, byte_addr,      // LDI r1, byte_addr
        op::LDB as u32, 0x30, 0x31,           // LDB r0, r1
        op::HALT as u32,                       // HALT
    ]
}

// ═══════════════════════════════════════════════════════════════════════
// 1. Memory protection OFF (default): everything works as before
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_no_protection_store_works() {
    let mut vm = Vm::new(256);
    vm.load_program(&make_store_program(100));
    assert!(vm.run_checked().is_ok());
    assert_eq!(vm.peek(100), 42);
}

#[test]
fn test_no_protection_load_works() {
    let mut vm = Vm::new(256);
    vm.poke(50, 99);
    vm.load_program(&make_load_program(50));
    assert!(vm.run_checked().is_ok());
    assert_eq!(vm.regs[0], 99);
}

#[test]
fn test_protection_off_by_default() {
    let vm = Vm::new(256);
    assert!(!vm.memory_protection);
    assert!(vm.memory_regions.is_empty());
}

// ═══════════════════════════════════════════════════════════════════════
// 2. STORE protection
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_store_to_writable_region_succeeds() {
    let mut vm = Vm::new(256);
    vm.load_program(&make_store_program(200));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 10, readable: true, writable: false },
        MemoryRegion { name: "data", start: 10, end: 256, readable: true, writable: true },
    ]);
    assert!(vm.run_checked().is_ok());
    assert_eq!(vm.peek(200), 42);
}

#[test]
fn test_store_to_readonly_region_fails() {
    let mut vm = Vm::new(256);
    vm.load_program(&make_store_program(5));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 10, readable: true, writable: false },
        MemoryRegion { name: "data", start: 10, end: 256, readable: true, writable: true },
    ]);
    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::MemoryFault(pc, addr, access_type) => {
            assert_eq!(access_type, "write");
            assert_eq!(addr, 5);
            // PC should point to the STORE instruction (at pixel 6)
            assert_eq!(pc, 6);
        }
        other => panic!("expected MemoryFault, got {:?}", other),
    }
}

#[test]
fn test_store_to_unmapped_region_fails() {
    let mut vm = Vm::new(256);
    vm.load_program(&make_store_program(150));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 10, readable: true, writable: true },
    ]);
    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::MemoryFault(_, addr, "write") => {
            assert_eq!(addr, 150);
        }
        other => panic!("expected MemoryFault, got {:?}", other),
    }
}

// ═══════════════════════════════════════════════════════════════════════
// 3. LOAD protection
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_load_from_readable_region_succeeds() {
    let mut vm = Vm::new(256);
    vm.poke(100, 77);
    vm.load_program(&make_load_program(100));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 7, readable: true, writable: false },
        MemoryRegion { name: "data", start: 7, end: 256, readable: true, writable: true },
    ]);
    assert!(vm.run_checked().is_ok());
    assert_eq!(vm.regs[0], 77);
}

#[test]
fn test_load_from_non_readable_region_fails() {
    let mut vm = Vm::new(256);
    vm.poke(100, 77);
    vm.load_program(&make_load_program(100));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 7, readable: true, writable: false },
        MemoryRegion { name: "secret", start: 7, end: 256, readable: false, writable: false },
    ]);
    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::MemoryFault(pc, addr, access_type) => {
            assert_eq!(access_type, "read");
            assert_eq!(addr, 100);
            // PC should point to LOAD instruction (at pixel 3)
            assert_eq!(pc, 3);
        }
        other => panic!("expected MemoryFault, got {:?}", other),
    }
}

// ═══════════════════════════════════════════════════════════════════════
// 4. LDB/STB protection
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_stb_to_writable_region_succeeds() {
    let mut vm = Vm::new(256);
    // byte_addr = 400 → pixel_idx = 100, which is in data region
    vm.load_program(&make_stb_program(400));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 10, readable: true, writable: false },
        MemoryRegion { name: "data", start: 10, end: 256, readable: true, writable: true },
    ]);
    assert!(vm.run_checked().is_ok());
    // Verify byte was written
    let pixel = vm.peek(100);
    assert_ne!(pixel, 0);
}

#[test]
fn test_stb_to_readonly_region_fails() {
    let mut vm = Vm::new(256);
    // byte_addr = 8 → pixel_idx = 2, which is in code region
    vm.load_program(&make_stb_program(8));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 10, readable: true, writable: false },
        MemoryRegion { name: "data", start: 10, end: 256, readable: true, writable: true },
    ]);
    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::MemoryFault(_, _, "write") => {}
        other => panic!("expected MemoryFault(write), got {:?}", other),
    }
}

#[test]
fn test_ldb_from_readable_region_succeeds() {
    let mut vm = Vm::new(256);
    vm.poke(50, 0xABCD_1234);
    // byte_addr = 200 → pixel_idx = 50, which is in data region
    vm.load_program(&make_ldb_program(200));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 7, readable: true, writable: false },
        MemoryRegion { name: "data", start: 7, end: 256, readable: true, writable: true },
    ]);
    assert!(vm.run_checked().is_ok());
    // byte_off = 200 % 4 = 0 → extracts byte 0x34
    assert_eq!(vm.regs[0], 0x34);
}

#[test]
fn test_ldb_from_non_readable_region_fails() {
    let mut vm = Vm::new(256);
    vm.poke(50, 0xABCD_1234);
    vm.load_program(&make_ldb_program(200));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 7, readable: true, writable: false },
        MemoryRegion { name: "secret", start: 7, end: 256, readable: false, writable: false },
    ]);
    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::MemoryFault(_, _, "read") => {}
        other => panic!("expected MemoryFault(read), got {:?}", other),
    }
}

// ═══════════════════════════════════════════════════════════════════════
// 5. BLIT protection
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_blit_in_data_region_succeeds() {
    // LDI r1, 100  ; dst
    // LDI r2, 50   ; src
    // BLIT r1, r2, 3
    // HALT
    let prog = vec![
        op::LDI as u32, 0x31, 100,     // LDI r1, 100 (dst)
        op::LDI as u32, 0x32, 50,      // LDI r2, 50  (src)
        op::BLIT as u32, 0x31, 0x32, 3, // BLIT r1, r2, 3
        op::HALT as u32,
    ];
    let mut vm = Vm::new(256);
    vm.poke(50, 10);
    vm.poke(51, 20);
    vm.poke(52, 30);
    vm.load_program(&prog);
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 11, readable: true, writable: false },
        MemoryRegion { name: "data", start: 11, end: 256, readable: true, writable: true },
    ]);
    assert!(vm.run_checked().is_ok());
    assert_eq!(vm.peek(100), 10);
    assert_eq!(vm.peek(101), 20);
    assert_eq!(vm.peek(102), 30);
}

#[test]
fn test_blit_to_readonly_region_fails() {
    // BLIT into code region (read-only)
    let prog = vec![
        op::LDI as u32, 0x31, 5,       // LDI r1, 5 (dst in code region)
        op::LDI as u32, 0x32, 50,      // LDI r2, 50 (src)
        op::BLIT as u32, 0x31, 0x32, 2, // BLIT r1, r2, 2
        op::HALT as u32,
    ];
    let mut vm = Vm::new(256);
    vm.poke(50, 10);
    vm.poke(51, 20);
    vm.load_program(&prog);
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 11, readable: true, writable: false },
        MemoryRegion { name: "data", start: 11, end: 256, readable: true, writable: true },
    ]);
    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::MemoryFault(_, _, "write") => {}
        other => panic!("expected MemoryFault(write), got {:?}", other),
    }
}

#[test]
fn test_blit_from_non_readable_region_fails() {
    let prog = vec![
        op::LDI as u32, 0x31, 100,     // LDI r1, 100 (dst)
        op::LDI as u32, 0x32, 2,       // LDI r2, 2 (src in non-readable code region)
        op::BLIT as u32, 0x31, 0x32, 1, // BLIT r1, r2, 1
        op::HALT as u32,
    ];
    let mut vm = Vm::new(256);
    vm.load_program(&prog);
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 11, readable: false, writable: false },
        MemoryRegion { name: "data", start: 11, end: 256, readable: true, writable: true },
    ]);
    let result = vm.run_checked();
    assert!(result.is_err());
    match result.unwrap_err() {
        VmError::MemoryFault(_, _, "read") => {}
        other => panic!("expected MemoryFault(read), got {:?}", other),
    }
}

// ═══════════════════════════════════════════════════════════════════════
// 6. Enable/disable protection
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_disable_protection_restores_free_access() {
    let mut vm = Vm::new(256);
    vm.load_program(&make_store_program(5));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 10, readable: true, writable: false },
    ]);
    // Should fail with protection on
    assert!(vm.run_checked().is_err());

    // Reset and disable protection
    vm.halted = false;
    vm.pc = 0;
    vm.disable_memory_protection();
    assert!(!vm.memory_protection);

    // Should succeed now
    assert!(vm.run_checked().is_ok());
    assert_eq!(vm.peek(5), 42);
}

#[test]
fn test_enable_protection_method() {
    let mut vm = Vm::new(256);
    let regions = vec![
        MemoryRegion { name: "code", start: 0, end: 256, readable: true, writable: false },
    ];
    vm.enable_memory_protection(regions);
    assert!(vm.memory_protection);
    assert_eq!(vm.memory_regions.len(), 1);
    assert_eq!(vm.memory_regions[0].name, "code");
}

// ═══════════════════════════════════════════════════════════════════════
// 7. First-match region wins (overlap test)
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_first_matching_region_wins() {
    // Two regions cover the same address range.
    // The first one (writable=false) should win.
    let mut vm = Vm::new(256);
    vm.load_program(&make_store_program(100));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "ro", start: 50, end: 150, readable: true, writable: false },
        MemoryRegion { name: "rw", start: 50, end: 150, readable: true, writable: true },
    ]);
    let result = vm.run_checked();
    assert!(result.is_err());
}

// ═══════════════════════════════════════════════════════════════════════
// 8. Error display formatting
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_memory_fault_display() {
    let err = VmError::MemoryFault(42, 100, "write");
    let msg = format!("{}", err);
    assert!(msg.contains("write"));
    assert!(msg.contains("0x64")); // 100 in hex
    assert!(msg.contains("42"));
}

// ═══════════════════════════════════════════════════════════════════════
// 9. Spawn child inherits protection settings
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_spawn_child_inherits_protection() {
    use geometry_os::vm::ChildVm;
    let mut vm = Vm::new(256);
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 256, readable: true, writable: false },
    ]);
    let child_req = ChildVm::new(0, 0);
    let child = vm.spawn_child(&child_req);
    assert!(child.memory_protection);
    assert_eq!(child.memory_regions.len(), 1);
}

// ═══════════════════════════════════════════════════════════════════════
// 10. IO port region (practical use case)
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn test_io_port_writable_with_code_readonly() {
    // A realistic config: code is read-only, data is read-write,
    // and the keyboard port at 0xFFF is read-write
    let mut vm = Vm::new(4096);
    vm.load_program(&make_store_program(0xFFF));
    vm.enable_memory_protection(vec![
        MemoryRegion { name: "code", start: 0, end: 10, readable: true, writable: false },
        MemoryRegion { name: "data", start: 10, end: 4090, readable: true, writable: true },
        MemoryRegion { name: "io", start: 4090, end: 4096, readable: true, writable: true },
    ]);
    assert!(vm.run_checked().is_ok());
    assert_eq!(vm.peek(0xFFF), 42);
}
