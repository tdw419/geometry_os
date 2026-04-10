use geometry_os::assembler;
use geometry_os::vm::Vm;
use geometry_os::opcodes::op;

#[test]
fn test_call_ret_via_assembler() {
    let src = "\
    LDI r0, 5
    CALL sub
    HALT
sub:
    LDI r1, 10
    ADD r0, r1
    RET
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(64);
    vm.load_program(&asm.pixels);
    
    // PC starts at 0
    vm.step(); // LDI r0, 5
    assert_eq!(vm.regs[0], 5);
    
    vm.step(); // CALL sub
    // Labels are at pixel offsets. sub starts at offset 4?
    // LDI r0, 5: width 3
    // CALL sub: width 2
    // HALT: width 1
    // Total main is 3+2+1 = 6. sub starts at 6.
    assert_eq!(vm.pc, 6);
    assert_eq!(vm.stack.len(), 1);
    assert_eq!(vm.stack[0], 5); // Return address is address of HALT (offset 5)
    
    vm.step(); // LDI r1, 10
    assert_eq!(vm.regs[1], 10);
    
    vm.step(); // ADD r0, r1
    assert_eq!(vm.regs[0], 15);
    
    vm.step(); // RET
    assert_eq!(vm.pc, 5); // Returns to HALT
    
    vm.step(); // HALT
    assert!(vm.halted);
}

#[test]
fn test_simple_call_ret() {
    let mut vm = Vm::new(64);
    
    // Main at 0: CALL subroutine(10), HALT
    // CALL width 2: [op, addr]
    vm.poke(0, op::CALL as u32);
    vm.poke(1, 10);
    vm.poke(2, op::HALT as u32);
    
    // Subroutine at 10: LDI r0, 42, RET
    // LDI width 3: [op, dst, val]
    vm.poke(10, op::LDI as u32);
    vm.poke(11, 0); // r0
    vm.poke(12, 42); // value
    // RET width 1: [op]
    vm.poke(13, op::RET as u32);

    vm.pc = 0;
    
    // Step 1: CALL 10
    vm.step();
    assert_eq!(vm.pc, 10);
    assert_eq!(vm.stack.len(), 1);
    assert_eq!(vm.stack[0], 2); // Return address is address of HALT
    assert_eq!(vm.regs[0], 0);

    // Step 2: LDI r0, 42
    vm.step();
    assert_eq!(vm.pc, 13);
    assert_eq!(vm.regs[0], 42);

    // Step 3: RET
    vm.step();
    assert_eq!(vm.pc, 2);
    assert_eq!(vm.stack.len(), 0);

    // Step 4: HALT
    vm.step();
    assert!(vm.halted);
}

#[test]
fn test_nested_call_ret() {
    let mut vm = Vm::new(128);
    
    // Main at 0: CALL sub_a(10), HALT
    vm.poke(0, op::CALL as u32);
    vm.poke(1, 10);
    vm.poke(2, op::HALT as u32);

    // sub_a at 10: CALL sub_b(20), RET
    vm.poke(10, op::CALL as u32);
    vm.poke(11, 20);
    vm.poke(12, op::RET as u32);

    // sub_b at 20: LDI r1, 7, RET
    vm.poke(20, op::LDI as u32);
    vm.poke(21, 1); // r1
    vm.poke(22, 7);
    vm.poke(23, op::RET as u32);

    vm.pc = 0;
    
    // Start main
    vm.step(); // CALL 10
    assert_eq!(vm.pc, 10);
    assert_eq!(vm.stack.len(), 1);
    assert_eq!(vm.stack[0], 2);

    // In sub_a
    vm.step(); // CALL 20
    assert_eq!(vm.pc, 20);
    assert_eq!(vm.stack.len(), 2);
    assert_eq!(vm.stack[1], 12); // Return address in sub_a

    // In sub_b
    vm.step(); // LDI r1, 7
    assert_eq!(vm.regs[1], 7);
    vm.step(); // RET to sub_a
    assert_eq!(vm.pc, 12);
    assert_eq!(vm.stack.len(), 1);

    // Back in sub_a
    vm.step(); // RET to main
    assert_eq!(vm.pc, 2);
    assert_eq!(vm.stack.len(), 0);

    // Back in main
    vm.step(); // HALT
    assert!(vm.halted);
}

#[test]
fn test_call_no_matching_ret_falloff() {
    let mut vm = Vm::new(32);
    
    // CALL 10, then just run. RAM at 10+ is all 0 (unknown opcodes, treated as NOPs until end)
    vm.poke(0, op::CALL as u32);
    vm.poke(1, 10);
    
    vm.pc = 0;
    vm.run(); // Will execute CALL, then step through RAM until PC >= 32
    
    assert!(vm.halted);
    assert!(vm.pc >= 32);
    assert_eq!(vm.stack.len(), 1); // We called but never returned
    assert_eq!(vm.stack[0], 2);
}

#[test]
fn test_unmatched_ret_halthes() {
    let mut vm = Vm::new(32);
    
    // RET with empty stack
    vm.poke(0, op::RET as u32);
    
    vm.pc = 0;
    vm.step();
    
    assert!(vm.halted);
    assert_eq!(vm.stack.len(), 0);
}

#[test]
fn test_complex_stack_behavior() {
    let mut vm = Vm::new(128);
    
    // Program that does:
    // CALL sub
    // CALL sub
    // HALT
    // sub: PUSH r0, RET
    
    vm.poke(0, op::CALL as u32);
    vm.poke(1, 10);
    vm.poke(2, op::CALL as u32);
    vm.poke(3, 10);
    vm.poke(4, op::HALT as u32);
    
    vm.poke(10, op::PUSH as u32);
    vm.poke(11, 0); // r0
    vm.poke(12, op::RET as u32);
    
    vm.regs[0] = 100;
    vm.pc = 0;
    
    vm.step(); // CALL sub
    vm.step(); // PUSH r0
    vm.step(); // RET
    assert_eq!(vm.pc, 100); // RET pops the 100 we pushed instead of the return address (2)!
    // This proves the VM uses a single shared stack for both data and return addresses.
    assert_eq!(vm.stack.len(), 1); 
    assert_eq!(vm.stack[0], 2); // The original return address is still there.
}
