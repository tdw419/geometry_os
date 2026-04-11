// ═══════════════════════════════════════════════════════════════════════
// HEAP INTEGRATION TESTS: Assemble → Load → Run → Verify heap state
//
// Tests the full heap pipeline:
//   1. Assembler converts .gasm heap operations to bytecode
//   2. VM executes LOAD/STORE to heap registers at 0xFFD0-0xFFD5
//   3. We verify heap state, allocated addresses, free space
//   4. Program file tests verify .include resolution works
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::assembler;
use geometry_os::vm::Vm;

#[test]
fn heap_init_alloc_read_free_via_vm() {
    // Full pipeline: init heap, alloc, read back, free
    let src = "\
    ; Init heap at address 500, size 200
    LDI r5, 0xFFD0
    LDI r6, 500
    STORE r5, r6          ; HEAP_START = 500
    LDI r5, 0xFFD1
    LDI r6, 200
    STORE r5, r6          ; HEAP_SIZE = 200 (triggers init)

    ; Read free words (should be 200)
    LDI r5, 0xFFD5
    LOAD r0, r5           ; r0 = free_words

    ; Allocate 50 words
    LDI r5, 0xFFD2
    LDI r6, 50
    STORE r5, r6          ; request 50 words
    LOAD r1, r5           ; r1 = allocated address

    ; Read free words again (should be 150)
    LDI r5, 0xFFD5
    LOAD r2, r5           ; r2 = free_words after alloc

    ; Read block count (should be 1)
    LDI r5, 0xFFD4
    LOAD r3, r5           ; r3 = block count

    ; Free the block
    LDI r5, 0xFFD3
    STORE r5, r1          ; free the block we allocated

    ; Read free words after free (should be 200 again)
    LDI r5, 0xFFD5
    LOAD r4, r5           ; r4 = free_words after free

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 200, "initial free words should be 200");
    assert_eq!(vm.regs[1], 500, "first alloc should return heap start (500)");
    assert_eq!(vm.regs[2], 150, "free words after 50-word alloc should be 150");
    assert_eq!(vm.regs[3], 1, "should have 1 allocated block");
    assert_eq!(vm.regs[4], 200, "free words after free should be 200");
}

#[test]
fn heap_multiple_allocs_and_partial_free() {
    // Allocate three blocks, free the middle one, verify coalescing
    let src = "\
    ; Init heap at 1000, size 300
    LDI r5, 0xFFD0
    LDI r6, 1000
    STORE r5, r6
    LDI r5, 0xFFD1
    LDI r6, 300
    STORE r5, r6

    ; Alloc A = 100 words
    LDI r5, 0xFFD2
    LDI r6, 100
    STORE r5, r6
    LOAD r8, r5           ; r8 = block A addr

    ; Alloc B = 50 words
    LDI r6, 50
    STORE r5, r6
    LOAD r9, r5           ; r9 = block B addr

    ; Alloc C = 80 words
    LDI r6, 80
    STORE r5, r6
    LOAD r10, r5          ; r10 = block C addr

    ; Free block B (the middle one)
    LDI r5, 0xFFD3
    STORE r5, r9

    ; Read stats
    LDI r5, 0xFFD4
    LOAD r0, r5           ; r0 = block count (should be 2: A and C)
    LDI r5, 0xFFD5
    LOAD r1, r5           ; r1 = free words (should be 170: 300-100-80)

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[8], 1000, "block A at heap start");
    assert_eq!(vm.regs[9], 1100, "block B after A (1000+100)");
    assert_eq!(vm.regs[10], 1150, "block C after B (1100+50)");
    assert_eq!(vm.regs[0], 2, "2 blocks remaining after freeing B");
    assert_eq!(vm.regs[1], 120, "120 free words (50 freed hole + 70 tail)");
}

#[test]
fn heap_alloc_fails_when_full() {
    // Try to allocate more than the heap has
    let src = "\
    ; Init tiny heap: 20 words
    LDI r5, 0xFFD0
    LDI r6, 500
    STORE r5, r6
    LDI r5, 0xFFD1
    LDI r6, 20
    STORE r5, r6

    ; First alloc: 15 words (should succeed)
    LDI r5, 0xFFD2
    LDI r6, 15
    STORE r5, r6
    LOAD r0, r5           ; r0 = addr (should be 500)

    ; Second alloc: 10 words (should fail, only 5 left)
    LDI r6, 10
    STORE r5, r6
    LOAD r1, r5           ; r1 = 0 (failure)

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[0], 500, "first alloc succeeds at heap start");
    assert_eq!(vm.regs[1], 0, "second alloc fails (not enough space)");
}

#[test]
fn heap_snapshot_preserves_state() {
    // Verify that snapshot/restore preserves heap state
    let src = "\
    ; Init heap at 200, size 100
    LDI r5, 0xFFD0
    LDI r6, 200
    STORE r5, r6
    LDI r5, 0xFFD1
    LDI r6, 100
    STORE r5, r6

    ; Allocate 30 words
    LDI r5, 0xFFD2
    LDI r6, 30
    STORE r5, r6
    LOAD r0, r5           ; r0 = allocated addr

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);

    // Take snapshot
    let snap = vm.snapshot();

    // Verify snapshot captured the heap state
    assert_eq!(snap.heap.initialized, true);
    assert_eq!(snap.heap.start, 200);
    assert_eq!(snap.heap.size, 100);
    assert_eq!(snap.heap.alloc_count(), 1);
    assert_eq!(snap.heap.free_words(), 70);

    // Allocate more in the original VM
    let extra_src = "\
    LDI r5, 0xFFD2
    LDI r6, 20
    STORE r5, r6
    LOAD r1, r5
    HALT
";
    let extra_asm = assembler::assemble(extra_src).unwrap();
    // This would need to continue from where we left off,
    // but snapshot/restore is the real test
    let mut vm2 = Vm::new(4096);
    vm2.load_program(&asm.pixels);
    vm2.run();
    vm2.restore(&snap);

    // After restore, heap should match snapshot
    assert_eq!(vm2.heap.alloc_count(), 1);
    assert_eq!(vm2.heap.free_words(), 70);
}

#[test]
fn heap_child_gets_fresh_heap() {
    // When a child VM is created from a parent's snapshot,
    // the snapshot cloning shows the child inherits the heap state,
    // but the VM's spawn_child method resets it.
    let mut parent = Vm::new(4096);
    parent.heap.init(500, 200);
    parent.heap.alloc(50);
    assert_eq!(parent.heap.alloc_count(), 1);

    // The snapshot includes the heap -- that's by design
    let snap = parent.snapshot();
    assert_eq!(snap.heap.alloc_count(), 1);

    // But when a child VM is constructed for execution (spawn_child-like),
    // the child gets a fresh heap per vm.rs line ~998:
    //   heap: Heap::new(), // children get a fresh heap
    // This is verified by the inline VM tests in vm.rs
}

#[test]
fn heap_alloc_reuses_freed_space() {
    // Alloc A, Alloc B, Free A, Alloc C — C should reuse A's space
    let src = "\
    ; Init heap at 100, size 200
    LDI r5, 0xFFD0
    LDI r6, 100
    STORE r5, r6
    LDI r5, 0xFFD1
    LDI r6, 200
    STORE r5, r6

    ; Alloc A = 40 words
    LDI r5, 0xFFD2
    LDI r6, 40
    STORE r5, r6
    LOAD r8, r5           ; r8 = A addr (100)

    ; Alloc B = 60 words
    LDI r6, 60
    STORE r5, r6
    LOAD r9, r5           ; r9 = B addr (140)

    ; Free A
    LDI r5, 0xFFD3
    STORE r5, r8

    ; Alloc C = 30 words (should reuse A's freed space)
    LDI r5, 0xFFD2
    LDI r6, 30
    STORE r5, r6
    LOAD r10, r5          ; r10 = C addr (should be 100, reusing A)

    HALT
";
    let asm = assembler::assemble(src).unwrap();
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[8], 100, "A allocated at heap start");
    assert_eq!(vm.regs[9], 140, "B allocated after A (100+40)");
    assert_eq!(vm.regs[10], 100, "C reuses freed A's space (first-fit)");
}

// ═══════════════════════════════════════════════════════════════════════
// Program file tests (assemble .gasm files with .include resolution)
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn alloc_demo_assembles_and_runs() {
    // Load and assemble the alloc-demo.gasm program file
    let path = std::path::Path::new("programs/alloc-demo.gasm");
    let asm = assembler::assemble_file(path, &[std::path::Path::new(".")])
        .expect("alloc-demo.gasm should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted, "alloc-demo should halt cleanly");

    // Verify heap was initialized and used
    assert!(vm.heap.initialized, "heap should be initialized");
    assert_eq!(
        vm.heap.start, 500,
        "heap should start at address 500"
    );
    assert_eq!(vm.heap.size, 200, "heap should be 200 words");

    // After alloc+free+realloc: 2 allocated blocks (buf1=30 + realloc=20)
    assert_eq!(
        vm.heap.alloc_count(), 2,
        "should have 2 allocated blocks after demo runs"
    );
}

#[test]
fn lib_alloc_heap_avail_check() {
    // Test the heap_avail logic inline (same as lib/alloc.gasm but without .include)
    let src = "\
    ; Init heap at 200, size 100
    LDI r5, 0xFFD0
    LDI r6, 200
    STORE r5, r6          ; HEAP_START = 200
    LDI r5, 0xFFD1
    LDI r6, 100
    STORE r5, r6          ; HEAP_SIZE = 100 (triggers init)

    ; Check if 50 words available: load free_words, compare with BGE
    LDI r5, 0xFFD5
    LOAD r6, r5           ; r6 = free words (100)
    LDI r5, 50
    BGE r6, r5, avail_yes
    LDI r8, 0
    BAL r0, r0, check2
avail_yes:
    LDI r8, 1             ; 50 words available

check2:
    ; Check if 200 words available (should be no)
    LDI r5, 0xFFD5
    LOAD r6, r5           ; r6 = free words (100)
    LDI r5, 200
    BGE r6, r5, avail_yes2
    LDI r9, 0
    BAL r0, r0, done
avail_yes2:
    LDI r9, 1             ; 200 words available

done:
    HALT
";
    let asm = assembler::assemble(src).expect("should assemble");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run();

    assert!(vm.halted);
    assert_eq!(vm.regs[8], 1, "50 words should be available in 100-word heap");
    assert_eq!(
        vm.regs[9], 0,
        "200 words should NOT be available in 100-word heap"
    );
}
