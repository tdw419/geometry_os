// ═══════════════════════════════════════════════════════════════════════
// FILESYSTEM INTEGRATION TESTS
//
// Tests the full filesystem pipeline:
//   1. Rust-level Disk API (save, load, delete, exists)
//   2. VM memory-mapped register interface (0xFFB0-0xFFB5)
//   3. .gasm programs that use lib/fs.gasm to save/load data
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::{
    Disk, FsFile, FS_CMD_ADDR, FS_COUNT_ADDR, FS_DATA_ADDR, FS_FILECOUNT_ADDR, FS_NAME_ADDR,
    FS_STATUS_ADDR, Vm,
};

// ── Disk API unit tests ─────────────────────────────────────────────

#[test]
fn disk_save_and_load() {
    let mut disk = Disk::new();
    let name: Vec<u32> = "test\0".chars().map(|c| c as u32).collect();
    let data = vec![10, 20, 30];

    let status = disk.save(&name, &data);
    assert_eq!(status, 0, "save should succeed");

    let mut buf = vec![0u32; 10];
    let (status, loaded) = disk.load(&name, &mut buf);
    assert_eq!(status, 0, "load should succeed");
    assert_eq!(loaded, 3);
    assert_eq!(buf[..3], data);
}

#[test]
fn disk_save_overwrites() {
    let mut disk = Disk::new();
    let name: Vec<u32> = "score\0".chars().map(|c| c as u32).collect();

    disk.save(&name, &[100]);
    disk.save(&name, &[200]);

    let mut buf = vec![0u32; 4];
    let (status, loaded) = disk.load(&name, &mut buf);
    assert_eq!(status, 0);
    assert_eq!(loaded, 1);
    assert_eq!(buf[0], 200, "should have overwritten to 200");
}

#[test]
fn disk_load_not_found() {
    let disk = Disk::new();
    let name: Vec<u32> = "missing\0".chars().map(|c| c as u32).collect();
    let mut buf = vec![0u32; 10];
    let (status, loaded) = disk.load(&name, &mut buf);
    assert_eq!(status, 1, "should return not-found");
    assert_eq!(loaded, 0);
}

#[test]
fn disk_delete() {
    let mut disk = Disk::new();
    let name: Vec<u32> = "temp\0".chars().map(|c| c as u32).collect();

    disk.save(&name, &[42]);
    assert_eq!(disk.files.len(), 1);

    let status = disk.delete(&name);
    assert_eq!(status, 0);
    assert_eq!(disk.files.len(), 0);
}

#[test]
fn disk_delete_not_found() {
    let mut disk = Disk::new();
    let name: Vec<u32> = "nope\0".chars().map(|c| c as u32).collect();
    assert_eq!(disk.delete(&name), 1);
}

#[test]
fn disk_exists() {
    let mut disk = Disk::new();
    let name: Vec<u32> = "yes\0".chars().map(|c| c as u32).collect();
    let no: Vec<u32> = "no\0".chars().map(|c| c as u32).collect();

    disk.save(&name, &[1]);
    assert_eq!(disk.exists(&name), 0, "should find existing file");
    assert_eq!(disk.exists(&no), 1, "should not find missing file");
}

#[test]
fn disk_bad_name_empty() {
    let mut disk = Disk::new();
    let empty: Vec<u32> = "\0".chars().map(|c| c as u32).collect();
    assert_eq!(disk.save(&empty, &[1]), 3, "empty name should fail");
}

#[test]
fn disk_max_files_limit() {
    let mut disk = Disk::new();
    for i in 0..16 {
        let name: Vec<u32> = format!("f{}\0", i).chars().map(|c| c as u32).collect();
        let status = disk.save(&name, &[i as u32]);
        assert_eq!(status, 0, "save {} should succeed", i);
    }
    // 17th file should fail
    let name: Vec<u32> = "overflow\0".chars().map(|c| c as u32).collect();
    assert_eq!(disk.save(&name, &[99]), 2, "should fail: disk full (max files)");
}

#[test]
fn disk_file_too_large() {
    let mut disk = Disk::new();
    let name: Vec<u32> = "big\0".chars().map(|c| c as u32).collect();
    let data = vec![0u32; 257]; // max is 256
    assert_eq!(disk.save(&name, &data), 4, "should fail: too large");
}

// ── VM memory-mapped register tests ─────────────────────────────────

#[test]
fn vm_fs_register_save_load_cycle() {
    let mut vm = Vm::new(1024);

    // Write filename "hi\0" at address 100
    vm.ram[100] = 'h' as u32;
    vm.ram[101] = 'i' as u32;
    vm.ram[102] = 0;

    // Write data [42] at address 200
    vm.ram[200] = 42;

    // Set FS_NAME = 100
    vm.write_fs_reg(FS_NAME_ADDR, 100);
    // Set FS_DATA = 200
    vm.write_fs_reg(FS_DATA_ADDR, 200);
    // Set FS_COUNT = 1
    vm.write_fs_reg(FS_COUNT_ADDR, 1);
    // Trigger SAVE (cmd=1)
    vm.write_fs_reg(FS_CMD_ADDR, 1);

    // Check status = OK
    assert_eq!(vm.read_fs_reg(FS_STATUS_ADDR), Some(0));
    // Check filecount = 1
    assert_eq!(vm.read_fs_reg(FS_FILECOUNT_ADDR), Some(1));

    // Now load it back: write to a different buffer at 300
    vm.write_fs_reg(FS_NAME_ADDR, 100); // same filename
    vm.write_fs_reg(FS_DATA_ADDR, 300); // destination
    vm.write_fs_reg(FS_CMD_ADDR, 2);    // LOAD

    assert_eq!(vm.read_fs_reg(FS_STATUS_ADDR), Some(0), "load status should be OK");
    assert_eq!(vm.read_fs_reg(FS_COUNT_ADDR), Some(1), "should have loaded 1 word");
    assert_eq!(vm.ram[300], 42, "loaded data should be 42");
}

#[test]
fn vm_fs_register_exists_check() {
    let mut vm = Vm::new(1024);

    // Check for nonexistent file
    vm.ram[50] = 'n' as u32;
    vm.ram[51] = 'o' as u32;
    vm.ram[52] = 0;

    vm.write_fs_reg(FS_NAME_ADDR, 50);
    vm.write_fs_reg(FS_CMD_ADDR, 4); // EXISTS

    assert_eq!(
        vm.read_fs_reg(FS_STATUS_ADDR),
        Some(1),
        "should not find file"
    );
}

#[test]
fn vm_fs_register_delete() {
    let mut vm = Vm::new(1024);

    // Save a file first
    vm.ram[60] = 'x' as u32;
    vm.ram[61] = 0;
    vm.ram[70] = 99;

    vm.write_fs_reg(FS_NAME_ADDR, 60);
    vm.write_fs_reg(FS_DATA_ADDR, 70);
    vm.write_fs_reg(FS_COUNT_ADDR, 1);
    vm.write_fs_reg(FS_CMD_ADDR, 1);
    assert_eq!(vm.read_fs_reg(FS_STATUS_ADDR), Some(0));
    assert_eq!(vm.read_fs_reg(FS_FILECOUNT_ADDR), Some(1));

    // Delete it
    vm.write_fs_reg(FS_NAME_ADDR, 60);
    vm.write_fs_reg(FS_CMD_ADDR, 3); // DELETE
    assert_eq!(vm.read_fs_reg(FS_STATUS_ADDR), Some(0), "delete should succeed");
    assert_eq!(
        vm.read_fs_reg(FS_FILECOUNT_ADDR),
        Some(0),
        "filecount should be 0"
    );
}

// ── Assembled .gasm filesystem tests ────────────────────────────────

#[test]
fn assemble_save_and_verify() {
    // Assemble a program that saves a value to disk, then halt
    let src = "\
.data
fname:
    .asciz \"score\"
dbuf:
    .word 0
.text
    ; Write score value to data buffer
    LDI r0, dbuf
    LDI r1, 42
    STORE r0, r1

    ; Save using direct register writes
    LDI r3, 0xFFB1       ; FS_NAME
    LDI r4, fname
    STORE r3, r4

    LDI r3, 0xFFB2       ; FS_DATA
    LDI r4, dbuf
    STORE r3, r4

    LDI r3, 0xFFB3       ; FS_COUNT
    LDI r4, 1
    STORE r3, r4

    LDI r3, 0xFFB0       ; FS_CMD = SAVE
    LDI r4, 1
    STORE r3, r4

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.fs_status, 0, "save should succeed");
    assert_eq!(vm.disk.files.len(), 1);

    // Verify the file contents
    let name: Vec<u32> = "score\0".chars().map(|c| c as u32).collect();
    let mut buf = vec![0u32; 10];
    let (status, loaded) = vm.disk.load(&name, &mut buf);
    assert_eq!(status, 0);
    assert_eq!(loaded, 1);
    assert_eq!(buf[0], 42);
}

#[test]
fn assemble_save_load_roundtrip() {
    // Program: save a value, then load it into a different register
    let src = "\
.data
fname:
    .asciz \"data\"
save_buf:
    .word 777
load_buf:
    .word 0
.text
    ; --- SAVE ---
    LDI r3, 0xFFB1       ; FS_NAME
    LDI r4, fname
    STORE r3, r4
    LDI r3, 0xFFB2       ; FS_DATA
    LDI r4, save_buf
    STORE r3, r4
    LDI r3, 0xFFB3       ; FS_COUNT = 1
    LDI r4, 1
    STORE r3, r4
    LDI r3, 0xFFB0       ; FS_CMD = SAVE
    LDI r4, 1
    STORE r3, r4

    ; --- LOAD ---
    LDI r3, 0xFFB1       ; FS_NAME
    LDI r4, fname
    STORE r3, r4
    LDI r3, 0xFFB2       ; FS_DATA = load_buf
    LDI r4, load_buf
    STORE r3, r4
    LDI r3, 0xFFB0       ; FS_CMD = LOAD
    LDI r4, 2
    STORE r3, r4

    ; Read loaded value into r0
    LDI r3, load_buf
    LOAD r0, r3

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 777, "should have loaded the saved value 777");
}

#[test]
fn assemble_filecount_check() {
    let src = "\
.data
fn1:
    .asciz \"a\"
fn2:
    .asciz \"b\"
dbuf:
    .word 0
.text
    ; Save file 'a'
    LDI r3, 0xFFB1
    LDI r4, fn1
    STORE r3, r4
    LDI r3, 0xFFB2
    LDI r4, dbuf
    STORE r3, r4
    LDI r3, 0xFFB3
    LDI r4, 1
    STORE r3, r4
    LDI r3, 0xFFB0
    LDI r4, 1
    STORE r3, r4

    ; Save file 'b'
    LDI r3, 0xFFB1
    LDI r4, fn2
    STORE r3, r4
    LDI r3, 0xFFB2
    LDI r4, dbuf
    STORE r3, r4
    LDI r3, 0xFFB3
    LDI r4, 1
    STORE r3, r4
    LDI r3, 0xFFB0
    LDI r4, 1
    STORE r3, r4

    ; Read filecount
    LDI r3, 0xFFB5
    LOAD r0, r3

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 2, "should have 2 files on disk");
}

#[test]
fn assemble_delete_and_verify_gone() {
    let src = "\
.data
fname:
    .asciz \"tmp\"
dbuf:
    .word 55
.text
    ; Save the file
    LDI r3, 0xFFB1
    LDI r4, fname
    STORE r3, r4
    LDI r3, 0xFFB2
    LDI r4, dbuf
    STORE r3, r4
    LDI r3, 0xFFB3
    LDI r4, 1
    STORE r3, r4
    LDI r3, 0xFFB0
    LDI r4, 1
    STORE r3, r4

    ; Delete it
    LDI r3, 0xFFB1
    LDI r4, fname
    STORE r3, r4
    LDI r3, 0xFFB0
    LDI r4, 3
    STORE r3, r4

    ; Check if it still exists
    LDI r3, 0xFFB1
    LDI r4, fname
    STORE r3, r4
    LDI r3, 0xFFB0
    LDI r4, 4
    STORE r3, r4

    ; Read status (0=found, 1=not found)
    LDI r3, 0xFFB4
    LOAD r0, r3

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(
        vm.regs[0], 1,
        "file should be gone after delete (status=1 not found)"
    );
    assert_eq!(vm.disk.files.len(), 0, "disk should be empty");
}
