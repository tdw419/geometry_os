use geometry_os::assembler::assemble;

#[test]
fn test_fileopen_assembles() {
    // FILEOPEN r1, r2 should produce [0x0D, 1, 2]
    let asm = "FILEOPEN r1, r2";
    let bytecode = assemble(asm).unwrap();
    assert_eq!(bytecode, vec![0x0D, 1, 2]);
}

#[test]
fn test_fileread_assembles() {
    // FILEREAD r0, r10, r11 should produce [0x0E, 0, 10, 11]
    let asm = "FILEREAD r0, r10, r11";
    let bytecode = assemble(asm).unwrap();
    assert_eq!(bytecode, vec![0x0E, 0, 10, 11]);
}

#[test]
fn test_fileop_error_on_missing_args() {
    // FILEOPEN with only 1 arg should error
    let asm = "FILEOPEN r1";
    let result = assemble(asm);
    assert!(result.is_err());
    assert!(result
        .unwrap_err()
        .contains("FILEOPEN requires 2 arguments"));

    // FILEREAD with only 2 args should error
    let asm = "FILEREAD r0, r10";
    let result = assemble(asm);
    assert!(result.is_err());
    assert!(result
        .unwrap_err()
        .contains("FILEREAD requires 3 arguments"));
}
