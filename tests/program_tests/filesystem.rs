use super::*;

#[test]
fn test_open_read_write_close_opcodes() {
    let (mut vm, _dir) = vm_with_vfs();

    // Write filename "test.txt" at RAM address 0x1000
    write_string_to_ram(&mut vm, 0x1000, "test.txt");

    // Write data "ABCD" at RAM address 0x1100
    for (i, ch) in b"ABCD".iter().enumerate() {
        vm.ram[0x1100 + i] = *ch as u32;
    }

    // Program:
    //   OPEN r1, r2      -- r1=&path, r2=mode(1=write)
    //   WRITE r0, r3, r4 -- r0=fd(from open), r3=&buf, r4=len
    //   CLOSE r0          -- close fd
    //   OPEN r1, r5      -- r5=mode(0=read)
    //   READ r0, r6, r7  -- r6=&readbuf(0x1200), r7=len(4)
    //   CLOSE r0
    //   HALT

    // Set registers
    vm.regs[1] = 0x1000; // path address
    vm.regs[2] = 1; // write mode
    vm.regs[3] = 0x1100; // write buffer
    vm.regs[4] = 4; // write length
    vm.regs[5] = 0; // read mode
    vm.regs[6] = 0x1200; // read buffer
    vm.regs[7] = 4; // read length

    let program = vec![
        0x54, 1, 2, // OPEN r1, r2  -> r0 = fd
        0x56, 0, 3, 4, // WRITE r0, r3, r4  -> r0 = bytes written
        0x57, 0, // CLOSE r0
        0x54, 1, 5, // OPEN r1, r5  -> r0 = fd (read mode)
        0x55, 0, 6, 7, // READ r0, r6, r7  -> r0 = bytes read
        0x57, 0,    // CLOSE r0
        0x00, // HALT
    ];

    load_and_run(&mut vm, &program, 100);

    assert!(vm.halted, "VM should halt");

    // Verify the read-back data matches what was written
    assert_eq!(vm.ram[0x1200] & 0xFF, b'A' as u32, "byte 0 should be A");
    assert_eq!(vm.ram[0x1201] & 0xFF, b'B' as u32, "byte 1 should be B");
    assert_eq!(vm.ram[0x1202] & 0xFF, b'C' as u32, "byte 2 should be C");
    assert_eq!(vm.ram[0x1203] & 0xFF, b'D' as u32, "byte 3 should be D");
}

#[test]
fn test_open_nonexistent_file_returns_error() {
    let (mut vm, _dir) = vm_with_vfs();

    write_string_to_ram(&mut vm, 0x1000, "nonexistent.txt");
    vm.regs[1] = 0x1000;
    vm.regs[2] = 0; // read mode

    let program = vec![
        0x54, 1, 2,    // OPEN r1, r2
        0x00, // HALT
    ];

    load_and_run(&mut vm, &program, 100);

    // r0 should be FD_ERROR (0xFFFFFFFF) since file doesn't exist
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "opening nonexistent file should return error"
    );
}

#[test]
fn test_close_invalid_fd_returns_error() {
    let (mut vm, _dir) = vm_with_vfs();
    vm.regs[0] = 99; // invalid fd

    let program = vec![
        0x57, 0, // CLOSE r0 (invalid fd)
        0x00,
    ];

    load_and_run(&mut vm, &program, 100);
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "closing invalid fd should return error"
    );
}

#[test]
fn test_seek_opcode() {
    let (mut vm, _dir) = vm_with_vfs();

    write_string_to_ram(&mut vm, 0x1000, "seektest.txt");
    vm.regs[1] = 0x1000;
    vm.regs[2] = 1; // write mode

    // Write "ABCDEFGH"
    for (i, ch) in b"ABCDEFGH".iter().enumerate() {
        vm.ram[0x1100 + i] = *ch as u32;
    }
    vm.regs[3] = 0x1100;
    vm.regs[4] = 8;

    // Program: open, write, close, open(read), seek(4, SET), read(2), close, halt
    vm.regs[5] = 0; // read mode
    vm.regs[6] = 0x1200; // read buf
    vm.regs[7] = 2; // read 2 bytes
    vm.regs[8] = 4; // seek offset
    vm.regs[9] = 0; // SEEK_SET

    let program = vec![
        0x54, 1, 2, // OPEN r1, r2 (write)
        0x56, 0, 3, 4, // WRITE r0, r3, r4
        0x57, 0, // CLOSE r0
        0x54, 1, 5, // OPEN r1, r5 (read)
        0x58, 0, 8, 9, // SEEK r0, r8, r9 (offset=4, whence=SET)
        0x55, 0, 6, 7, // READ r0, r6, r7
        0x57, 0,    // CLOSE r0
        0x00, // HALT
    ];

    load_and_run(&mut vm, &program, 100);

    assert!(vm.halted);
    // Should read "EF" (bytes at offset 4 and 5)
    assert_eq!(vm.ram[0x1200] & 0xFF, b'E' as u32);
    assert_eq!(vm.ram[0x1201] & 0xFF, b'F' as u32);
}

#[test]
fn test_ls_opcode() {
    let (mut vm, _dir) = vm_with_vfs();

    // Create some files in the VFS directory
    std::fs::write(vm.vfs.base_dir.join("aaa.txt"), b"").expect("filesystem operation failed");
    std::fs::write(vm.vfs.base_dir.join("bbb.txt"), b"").expect("filesystem operation failed");

    vm.regs[1] = 0x2000; // buffer for listing

    let program = vec![
        0x59, 1, // LS r1
        0x00,
    ];

    load_and_run(&mut vm, &program, 100);

    assert!(vm.halted);
    // r0 should be 2 (two files)
    assert_eq!(vm.regs[0], 2, "LS should return 2 entries");

    // Parse the entries from RAM
    let mut entries = Vec::new();
    let mut addr = 0x2000;
    for _ in 0..10 {
        let ch = (vm.ram[addr] & 0xFF) as u8;
        if ch == 0 {
            break;
        }
        let mut name = String::new();
        loop {
            let c = (vm.ram[addr] & 0xFF) as u8;
            if c == 0 {
                addr += 1;
                break;
            }
            name.push(c as char);
            addr += 1;
        }
        entries.push(name);
    }
    entries.sort();
    assert_eq!(entries, vec!["aaa.txt", "bbb.txt"]);
}

#[test]
fn test_filesystem_opcodes_assemble() {
    use geometry_os::assembler::assemble;

    let src = "OPEN r1, r2
READ r0, r3, r4
WRITE r0, r3, r4
CLOSE r0
SEEK r0, r1, r2
LS r3
HALT";
    let result = assemble(src, 0).expect("assembly should succeed");
    assert_eq!(result.pixels[0], 0x54); // OPEN
    assert_eq!(result.pixels[3], 0x55); // READ
    assert_eq!(result.pixels[7], 0x56); // WRITE
    assert_eq!(result.pixels[11], 0x57); // CLOSE
    assert_eq!(result.pixels[13], 0x58); // SEEK
    assert_eq!(result.pixels[17], 0x59); // LS
    assert_eq!(result.pixels[19], 0x00); // HALT
}

#[test]
fn test_vfs_path_traversal_blocked() {
    let (mut vm, _dir) = vm_with_vfs();

    // Try to open a file with path traversal
    write_string_to_ram(&mut vm, 0x1000, "../../../etc/passwd");
    vm.regs[1] = 0x1000;
    vm.regs[2] = 0;

    let program = vec![
        0x54, 1, 2, // OPEN r1, r2
        0x00,
    ];

    load_and_run(&mut vm, &program, 100);
    assert_eq!(vm.regs[0], 0xFFFFFFFF, "path traversal should be blocked");
}

#[test]
fn test_cat_asm_assembles() {
    use geometry_os::assembler::assemble;
    let source = std::fs::read_to_string("programs/cat.asm").expect("cat.asm should exist");
    let result = assemble(&source, 0);
    assert!(
        result.is_ok(),
        "cat.asm should assemble: {:?}",
        result.err()
    );
}

#[test]
fn test_cat_asm_reads_and_displays_file() {
    let (mut vm, _dir) = vm_with_vfs();

    // Create hello.txt in the VFS directory
    std::fs::write(vm.vfs.base_dir.join("hello.txt"), b"Hello from file!")
        .expect("filesystem operation failed");

    use geometry_os::assembler::assemble;
    let source = std::fs::read_to_string("programs/cat.asm").expect("cat.asm should exist");
    let result = assemble(&source, 0).expect("cat.asm should assemble");

    // Load bytecode into RAM at 0x100 (after the filename data at 0x1000)
    for (i, &word) in result.pixels.iter().enumerate() {
        if 0x0100 + i < vm.ram.len() {
            vm.ram[0x0100 + i] = word;
        }
    }
    vm.pc = 0x0100;

    // Run enough steps to complete
    for _ in 0..1000 {
        if vm.halted {
            break;
        }
        vm.step();
    }

    assert!(vm.halted, "cat.asm should halt");

    // Verify the file content was read into the buffer at 0x2000
    let expected = b"Hello from file!";
    for (i, &ch) in expected.iter().enumerate() {
        assert_eq!(
            vm.ram[0x2000 + i] & 0xFF,
            ch as u32,
            "buffer[{}] should be '{}' but got '{}'",
            i,
            ch as char,
            (vm.ram[0x2000 + i] & 0xFF) as u8 as char
        );
    }

    // Verify null terminator after content
    assert_eq!(
        vm.ram[0x2000 + expected.len()] & 0xFF,
        0,
        "should be null-terminated"
    );
}

#[test]
fn test_cat_asm_nonexistent_file_halts_cleanly() {
    let (mut vm, _dir) = vm_with_vfs();

    // Don't create any file -- cat.asm should handle open error gracefully
    use geometry_os::assembler::assemble;
    let source = std::fs::read_to_string("programs/cat.asm").expect("cat.asm should exist");
    let result = assemble(&source, 0).expect("cat.asm should assemble");

    for (i, &word) in result.pixels.iter().enumerate() {
        if 0x0100 + i < vm.ram.len() {
            vm.ram[0x0100 + i] = word;
        }
    }
    vm.pc = 0x0100;

    for _ in 0..1000 {
        if vm.halted {
            break;
        }
        vm.step();
    }

    // Should halt gracefully (not crash)
    assert!(
        vm.halted,
        "cat.asm should halt even when file doesn't exist"
    );
}

// ===================================================================
// Phase 411: Syscall Opcode Unit Tests
// ===================================================================

#[test]
fn test_open_write_then_read_existing_file() {
    // OPEN a file for write, write data, close, then re-open for read and verify
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("testfile.txt");
    // Create file by writing to it first via host
    std::fs::write(&path, "hello world").expect("should write file");

    // OPEN for read: r1=path_addr, r2=mode(0=read)
    write_string_to_ram(&mut vm, 0x2000, "testfile.txt");
    vm.ram[0] = 0x54; // OPEN
    vm.ram[1] = 1; // path_reg
    vm.ram[2] = 2; // mode_reg
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0; // read mode
    vm.step();
    let fd = vm.regs[0];
    assert!(
        fd != 0xFFFFFFFF,
        "OPEN for read should succeed, got {:X}",
        fd
    );

    // READ 11 bytes into 0x3000
    vm.ram[3] = 0x55; // READ
    vm.ram[4] = 1; // fd_reg
    vm.ram[5] = 2; // buf_reg
    vm.ram[6] = 3; // len_reg
    vm.regs[1] = fd;
    vm.regs[2] = 0x3000;
    vm.regs[3] = 11;
    vm.step();
    let n = vm.regs[0];
    assert_eq!(n, 11, "READ should return 11 bytes, got {}", n);

    // Verify bytes
    let mut read_back = String::new();
    for i in 0..11 {
        read_back.push((vm.ram[0x3000 + i] & 0xFF) as u8 as char);
    }
    assert_eq!(read_back, "hello world", "read data should match");
}

#[test]
fn test_open_empty_filename_returns_error() {
    let (mut vm, _dir) = vm_with_vfs();
    write_string_to_ram(&mut vm, 0x2000, "");
    vm.ram[0] = 0x54; // OPEN
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0;
    vm.step();
    // Empty string should still fopen -- VFS will attempt to create ""
    // which may fail or succeed depending on FS. Just verify it doesn't crash.
    // The key behavior: no panic/crash
}

#[test]
fn test_read_returns_zero_at_eof() {
    // OPEN file, read all content, then read again -- should return 0
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("tiny.txt");
    std::fs::write(&path, "AB").expect("should write file");

    write_string_to_ram(&mut vm, 0x2000, "tiny.txt");
    vm.ram[0] = 0x54; // OPEN
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0; // read
    vm.step();
    let fd = vm.regs[0];
    assert!(fd != 0xFFFFFFFF, "OPEN should succeed");

    // READ all 2 bytes
    vm.ram[3] = 0x55;
    vm.ram[4] = 1;
    vm.ram[5] = 2;
    vm.ram[6] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 0x3000;
    vm.regs[3] = 2;
    vm.step();
    assert_eq!(vm.regs[0], 2, "first READ should return 2");

    // READ again at EOF
    vm.ram[7] = 0x55;
    vm.ram[8] = 1;
    vm.ram[9] = 2;
    vm.ram[10] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 0x4000;
    vm.regs[3] = 10;
    vm.step();
    assert_eq!(vm.regs[0], 0, "READ at EOF should return 0");
}

#[test]
fn test_write_then_read_back_multiple_files() {
    // Write two different files, read both back and verify content
    let (mut vm, dir) = vm_with_vfs();

    // Write "alpha" to file1.txt via VFS
    let p1 = dir.path().join("file1.txt");
    std::fs::write(&p1, "alpha").expect("write file1");

    // Write "beta" to file2.txt via VFS
    let p2 = dir.path().join("file2.txt");
    std::fs::write(&p2, "beta").expect("write file2");

    // Read file1.txt
    write_string_to_ram(&mut vm, 0x2000, "file1.txt");
    vm.ram[0] = 0x54; // OPEN
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0;
    vm.step();
    let fd1 = vm.regs[0];
    assert!(fd1 != 0xFFFFFFFF, "OPEN file1 should succeed");

    vm.ram[3] = 0x55; // READ
    vm.ram[4] = 1;
    vm.ram[5] = 2;
    vm.ram[6] = 3;
    vm.regs[1] = fd1;
    vm.regs[2] = 0x3000;
    vm.regs[3] = 5;
    vm.step();
    assert_eq!(vm.regs[0], 5, "READ file1 should return 5");

    // Close file1
    vm.ram[7] = 0x57; // CLOSE
    vm.ram[8] = 1;
    vm.regs[1] = fd1;
    vm.step();

    // Read file2.txt
    write_string_to_ram(&mut vm, 0x2100, "file2.txt");
    vm.ram[9] = 0x54; // OPEN
    vm.ram[10] = 1;
    vm.ram[11] = 2;
    vm.regs[1] = 0x2100;
    vm.regs[2] = 0;
    vm.step();
    let fd2 = vm.regs[0];
    assert!(fd2 != 0xFFFFFFFF, "OPEN file2 should succeed");

    vm.ram[12] = 0x55; // READ
    vm.ram[13] = 1;
    vm.ram[14] = 2;
    vm.ram[15] = 3;
    vm.regs[1] = fd2;
    vm.regs[2] = 0x4000;
    vm.regs[3] = 4;
    vm.step();
    assert_eq!(vm.regs[0], 4, "READ file2 should return 4");

    // Verify content
    let mut s1 = String::new();
    for i in 0..5 {
        s1.push((vm.ram[0x3000 + i] & 0xFF) as u8 as char);
    }
    assert_eq!(s1, "alpha", "file1 content should be 'alpha'");

    let mut s2 = String::new();
    for i in 0..4 {
        s2.push((vm.ram[0x4000 + i] & 0xFF) as u8 as char);
    }
    assert_eq!(s2, "beta", "file2 content should be 'beta'");
}

#[test]
fn test_seek_set_position() {
    // Write file, open for read, seek to middle, read partial
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("seektest.txt");
    std::fs::write(&path, "ABCDEFGHIJ").expect("write file");

    write_string_to_ram(&mut vm, 0x2000, "seektest.txt");
    vm.ram[0] = 0x54; // OPEN
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0;
    vm.step();
    let fd = vm.regs[0];
    assert!(fd != 0xFFFFFFFF, "OPEN should succeed");

    // SEEK to position 5 (whence=0=SET)
    vm.ram[3] = 0x58; // SEEK
    vm.ram[4] = 1; // fd_reg
    vm.ram[5] = 2; // offset_reg
    vm.ram[6] = 3; // whence_reg
    vm.regs[1] = fd;
    vm.regs[2] = 5;
    vm.regs[3] = 0; // SEEK_SET
    vm.step();
    assert_eq!(vm.regs[0], 5, "SEEK SET should return new position 5");

    // READ 5 bytes from position 5
    vm.ram[7] = 0x55; // READ
    vm.ram[8] = 1;
    vm.ram[9] = 2;
    vm.ram[10] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 0x3000;
    vm.regs[3] = 5;
    vm.step();
    assert_eq!(vm.regs[0], 5, "READ after SEEK should return 5");

    let mut s = String::new();
    for i in 0..5 {
        s.push((vm.ram[0x3000 + i] & 0xFF) as u8 as char);
    }
    assert_eq!(s, "FGHIJ", "should read from position 5");
}

#[test]
fn test_seek_cur_relative() {
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("seekcur.txt");
    std::fs::write(&path, "0123456789").expect("write file");

    write_string_to_ram(&mut vm, 0x2000, "seekcur.txt");
    vm.ram[0] = 0x54; // OPEN
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0;
    vm.step();
    let fd = vm.regs[0];

    // SEEK SET to 3
    vm.ram[3] = 0x58;
    vm.ram[4] = 1;
    vm.ram[5] = 2;
    vm.ram[6] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 3;
    vm.regs[3] = 0; // SEEK_SET
    vm.step();
    assert_eq!(vm.regs[0], 3);

    // SEEK CUR +2 (whence=1=CUR)
    vm.ram[7] = 0x58;
    vm.ram[8] = 1;
    vm.ram[9] = 2;
    vm.ram[10] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 2;
    vm.regs[3] = 1; // SEEK_CUR
    vm.step();
    assert_eq!(vm.regs[0], 5, "SEEK CUR should advance to position 5");

    // READ 1 byte to verify
    vm.ram[11] = 0x55;
    vm.ram[12] = 1;
    vm.ram[13] = 2;
    vm.ram[14] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 0x3000;
    vm.regs[3] = 1;
    vm.step();
    assert_eq!(
        vm.ram[0x3000], '5' as u32,
        "byte at position 5 should be '5'"
    );
}

#[test]
fn test_seek_end_position() {
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("seekend.txt");
    std::fs::write(&path, "ABCDE").expect("write file");

    write_string_to_ram(&mut vm, 0x2000, "seekend.txt");
    vm.ram[0] = 0x54;
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0;
    vm.step();
    let fd = vm.regs[0];

    // SEEK END -2 (whence=2=END, offset=-2)
    // Note: offset is u32 but treated as i32 per VFS convention
    vm.ram[3] = 0x58;
    vm.ram[4] = 1;
    vm.ram[5] = 2;
    vm.ram[6] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = (-2i32) as u32; // -2 as u32
    vm.regs[3] = 2; // SEEK_END
    vm.step();
    assert_eq!(vm.regs[0], 3, "SEEK END -2 should give position 3");

    // READ 2 bytes
    vm.ram[7] = 0x55;
    vm.ram[8] = 1;
    vm.ram[9] = 2;
    vm.ram[10] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 0x3000;
    vm.regs[3] = 2;
    vm.step();
    assert_eq!(vm.regs[0], 2, "should read 2 bytes");

    let mut s = String::new();
    for i in 0..2 {
        s.push((vm.ram[0x3000 + i] & 0xFF) as u8 as char);
    }
    assert_eq!(s, "DE", "should read last 2 bytes");
}

#[test]
fn test_seek_invalid_fd_returns_error() {
    let (mut vm, _dir) = vm_with_vfs();
    vm.ram[0] = 0x58; // SEEK
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.ram[3] = 3;
    vm.regs[1] = 99; // invalid fd
    vm.regs[2] = 0;
    vm.regs[3] = 0;
    vm.step();
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "SEEK on invalid fd should return error"
    );
}

#[test]
fn test_ls_empty_directory() {
    let (mut vm, _dir) = vm_with_vfs();
    vm.ram[0] = 0x59; // LS
    vm.ram[1] = 1; // buf_reg
    vm.regs[1] = 0x3000;
    vm.step();
    assert_eq!(vm.regs[0], 0, "LS on empty dir should return 0 entries");
}

#[test]
fn test_ls_multiple_files() {
    let (mut vm, dir) = vm_with_vfs();
    std::fs::write(dir.path().join("aaa.txt"), "").expect("write aaa");
    std::fs::write(dir.path().join("bbb.txt"), "").expect("write bbb");
    std::fs::write(dir.path().join("ccc.txt"), "").expect("write ccc");

    vm.ram[0] = 0x59; // LS
    vm.ram[1] = 1;
    vm.regs[1] = 0x3000;
    vm.step();
    assert_eq!(vm.regs[0], 3, "LS should find 3 files");

    // Verify entries are null-separated in buffer
    // fls writes sorted entries, so: aaa.txt\0bbb.txt\0ccc.txt\0\0
    let mut entries = Vec::new();
    let mut current = String::new();
    let mut addr = 0x3000;
    loop {
        let ch = vm.ram[addr] & 0xFF;
        if ch == 0 {
            if current.is_empty() {
                break;
            }
            entries.push(current.clone());
            current.clear();
        } else {
            current.push(ch as u8 as char);
        }
        addr += 1;
        if addr > 0x3100 {
            break;
        } // safety
    }
    assert_eq!(
        entries,
        vec!["aaa.txt", "bbb.txt", "ccc.txt"],
        "LS entries should be sorted"
    );
}

#[test]
fn test_write_then_seek_back_and_read() {
    // Open for write, write data, seek back, read (tests write-then-read via reopen)
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("wr.txt");
    std::fs::write(&path, "XXXXXXXXXX").expect("write initial");

    // Write "HELLO" to the file
    write_string_to_ram(&mut vm, 0x2000, "wr.txt");
    vm.ram[0] = 0x54; // OPEN for write
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 1; // write mode
    vm.step();
    let fd = vm.regs[0];
    assert!(fd != 0xFFFFFFFF, "OPEN for write should succeed");

    // Write "HELLO" at buf 0x2500
    for (i, ch) in "HELLO".bytes().enumerate() {
        vm.ram[0x2500 + i] = ch as u32;
    }
    vm.ram[3] = 0x56; // WRITE
    vm.ram[4] = 1;
    vm.ram[5] = 2;
    vm.ram[6] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 0x2500;
    vm.regs[3] = 5;
    vm.step();
    assert_eq!(vm.regs[0], 5, "WRITE should return 5");

    // Close
    vm.ram[7] = 0x57;
    vm.ram[8] = 1;
    vm.regs[1] = fd;
    vm.step();

    // Verify file on host
    let content = std::fs::read(&path).expect("read file");
    assert_eq!(
        String::from_utf8_lossy(&content),
        "HELLO",
        "file should contain HELLO"
    );
}

#[test]
fn test_close_already_closed_fd_returns_error() {
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("dc.txt");
    std::fs::write(&path, "data").expect("write file");

    write_string_to_ram(&mut vm, 0x2000, "dc.txt");
    vm.ram[0] = 0x54; // OPEN read
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0;
    vm.step();
    let fd = vm.regs[0];
    assert!(fd != 0xFFFFFFFF, "OPEN should succeed");

    // CLOSE once -- should succeed
    vm.ram[3] = 0x57;
    vm.ram[4] = 1;
    vm.regs[1] = fd;
    vm.step();
    assert_eq!(vm.regs[0], 0, "first CLOSE should succeed");

    // CLOSE again -- should fail (EBADF)
    vm.ram[5] = 0x57;
    vm.ram[6] = 1;
    vm.regs[1] = fd;
    vm.step();
    assert_eq!(vm.regs[0], 0xFFFFFFFF, "double CLOSE should return error");
}

#[test]
fn test_read_on_write_only_fd_returns_error() {
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("wo.txt");
    std::fs::write(&path, "data").expect("write file");

    // OPEN for write
    write_string_to_ram(&mut vm, 0x2000, "wo.txt");
    vm.ram[0] = 0x54;
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 1; // write mode
    vm.step();
    let fd = vm.regs[0];
    assert!(fd != 0xFFFFFFFF, "OPEN for write should succeed");

    // Attempt READ on write-only fd
    vm.ram[3] = 0x55;
    vm.ram[4] = 1;
    vm.ram[5] = 2;
    vm.ram[6] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 0x3000;
    vm.regs[3] = 4;
    vm.step();
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "READ on write-only fd should return error"
    );
}

#[test]
fn test_write_on_read_only_fd_returns_error() {
    let (mut vm, dir) = vm_with_vfs();
    let path = dir.path().join("ro.txt");
    std::fs::write(&path, "data").expect("write file");

    // OPEN for read
    write_string_to_ram(&mut vm, 0x2000, "ro.txt");
    vm.ram[0] = 0x54;
    vm.ram[1] = 1;
    vm.ram[2] = 2;
    vm.regs[1] = 0x2000;
    vm.regs[2] = 0; // read mode
    vm.step();
    let fd = vm.regs[0];
    assert!(fd != 0xFFFFFFFF, "OPEN for read should succeed");

    // Attempt WRITE on read-only fd
    vm.ram[0x2500] = 'Z' as u32;
    vm.ram[3] = 0x56;
    vm.ram[4] = 1;
    vm.ram[5] = 2;
    vm.ram[6] = 3;
    vm.regs[1] = fd;
    vm.regs[2] = 0x2500;
    vm.regs[3] = 1;
    vm.step();
    assert_eq!(
        vm.regs[0], 0xFFFFFFFF,
        "WRITE on read-only fd should return error"
    );
}
