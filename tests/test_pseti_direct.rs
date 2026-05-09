#[test]
fn test_pseti_direct() {
    use geometry_os::assembler::assemble;
    use geometry_os::vm::Vm;

    let source = "PSETI 128, 128, 0xFFFFFF\nHALT\n";
    let asm = assemble(source, 0).unwrap();
    let mut vm = Vm::new();
    for (i, &pixel) in asm.pixels.iter().enumerate() {
        if i < vm.ram.len() {
            vm.ram[i] = pixel;
        }
    }
    vm.pc = 0;
    vm.halted = false;
    for _ in 0..1000 {
        if !vm.step() {
            break;
        }
    }

    println!("screen len: {}", vm.screen.len());
    println!("screen[32896] = {:#X}", vm.screen[32896]);
    println!("screen[0] = {:#X}", vm.screen[0]);
    assert_eq!(vm.screen[128 * 256 + 128], 0xFFFFFF);
}
