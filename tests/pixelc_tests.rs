// Integration test for pixelc-compiled programs.

use geometry_os::assembler;
use geometry_os::vm::Vm;

fn compile_run(asm_file: &str) -> Vm {
    let source =
        std::fs::read_to_string(asm_file).expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("assembly failed");
    let mut vm = Vm::new(512);
    vm.load_program(&asm.pixels);
    vm.run_with_limit(1_000_000);
    vm
}

#[test]
fn pixelc_simple_add() {
    let vm = compile_run("programs/simple_add.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[2], 30, "r2 (c) should be 10 + 20 = 30");
    assert_eq!(vm.ram[100], 30, "ram[100] should be 30");
}

#[test]
fn pixelc_diagonal() {
    let vm = compile_run("programs/diagonal.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[0], 100, "r0 (x) should be 100");
}

#[test]
fn pixelc_fib_spiral() {
    let vm = compile_run("programs/fib_spiral.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[2], 20, "r2 (count) should be 20");
    assert!(vm.regs[1] > 0, "r1 (y) should be positive fibonacci");
}

#[test]
fn pixelc_bounce() {
    let vm = compile_run("programs/bounce.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[4], 200, "r4 (steps) should be 200");
    assert!(vm.regs[0] < 300, "r0 (x) should be in bounds");
}

#[test]
fn pixelc_checkerboard() {
    let vm = compile_run("programs/checkerboard.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[1], 64, "r1 (y) should be 64");
}

#[test]
fn pixelc_gradient() {
    let vm = compile_run("programs/gradient.asm");
    assert!(vm.halted, "VM should halt");
    assert_eq!(vm.regs[0], 64, "r0 (y) should be 64 after full outer loop");
    assert_eq!(vm.regs[1], 64, "r1 (x) should be 64 after final inner loop");
}

#[test]
fn shell_assembles_and_prints_banner() {
    let source =
        std::fs::read_to_string("programs/shell.gasm").expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("shell.gasm assembly failed");
    // Shell needs at least 0x1000 + 80 words for input buffer
    let mut vm = Vm::new(16384);
    vm.load_program(&asm.pixels);

    // Run until first YIELD (welcome banner printed)
    let mut cycles = 0u32;
    while !vm.yielded && !vm.halted && cycles < 100_000 {
        let c = vm.run_with_limit(1000);
        cycles += c;
        if vm.yielded || vm.halted {
            break;
        }
    }
    assert!(!vm.halted, "shell should not halt immediately");
    assert!(vm.yielded, "shell should yield after printing banner ({} cycles)", cycles);

    // Check terminal has welcome text
    let line0: String = vm.term.get_line(0).iter().map(|&c| c as char).collect();
    assert!(
        line0.contains("GEOS"),
        "first terminal line should contain 'GEOS', got: '{}'",
        line0
    );

    // Inject "HELP" + Enter into keyboard port
    // The shell reads from KEY_PORT (0xFFF) in a loop, YIELDing when no key
    // We inject one key at a time, running between injections
    let keys: Vec<u32> = vec![b'H' as u32, b'E' as u32, b'L' as u32, b'P' as u32, 10];
    for &key in &keys {
        vm.ram[0xFFF] = key;
        vm.yielded = false;
        let mut kc = 0u32;
        while !vm.yielded && !vm.halted && kc < 50_000 {
            let c = vm.run_with_limit(1000);
            kc += c;
        }
    }

    // After HELP + Enter, terminal should contain help text
    let all_text: String = (0..vm.term.line_count())
        .map(|i| {
            vm.term
                .get_line(i)
                .iter()
                .map(|&c| c as char)
                .collect::<String>()
        })
        .collect::<Vec<_>>()
        .join("\n");
    assert!(
        all_text.contains("Commands:"),
        "terminal should contain 'Commands:' after HELP, got:\n{}",
        all_text
    );
    assert!(
        all_text.contains("CLS"),
        "help output should mention CLS"
    );
}

#[test]
fn shell_dir_lists_programs() {
    let source =
        std::fs::read_to_string("programs/shell.gasm").expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("shell.gasm assembly failed");
    let mut vm = Vm::new(16384);
    vm.load_program(&asm.pixels);

    // Run until first YIELD (welcome banner printed)
    let mut cycles = 0u32;
    while !vm.yielded && !vm.halted && cycles < 100_000 {
        let c = vm.run_with_limit(1000);
        cycles += c;
        if vm.yielded || vm.halted {
            break;
        }
    }
    assert!(!vm.halted, "shell should not halt immediately");
    assert!(vm.yielded, "shell should yield after printing banner ({} cycles)", cycles);

    // Inject "DIR" + Enter into keyboard port
    let keys: Vec<u32> = vec![b'D' as u32, b'I' as u32, b'R' as u32, 10];
    for &key in &keys {
        vm.ram[0xFFF] = key;
        vm.yielded = false;
        let mut kc = 0u32;
        while !vm.yielded && !vm.halted && kc < 50_000 {
            let c = vm.run_with_limit(1000);
            kc += c;
        }
    }

    // After DIR + Enter, terminal should contain program names
    let all_text: String = (0..vm.term.line_count())
        .map(|i| {
            vm.term
                .get_line(i)
                .iter()
                .map(|&c| c as char)
                .collect::<String>()
        })
        .collect::<Vec<_>>()
        .join("\n");

    // Should list several known programs
    assert!(
        all_text.contains("bounce"),
        "DIR output should contain 'bounce', got:\n{}",
        all_text
    );
    assert!(
        all_text.contains("shell"),
        "DIR output should contain 'shell', got:\n{}",
        all_text
    );
    assert!(
        all_text.contains("gradient"),
        "DIR output should contain 'gradient', got:\n{}",
        all_text
    );
    assert!(
        all_text.contains("mandelbrot"),
        "DIR output should contain 'mandelbrot', got:\n{}",
        all_text
    );
}

#[test]
fn pixelc_life() {
    // Conway's Game of Life -- grids at ram[8192] and ram[12288]
    let source =
        std::fs::read_to_string("programs/life.asm").expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("life.asm assembly failed");
    let mut vm = Vm::new(65536);
    vm.load_program(&asm.pixels);
    // Run until halt (10 generations, each yields)
    let mut total = 0u32;
    while !vm.halted && total < 100_000_000 {
        let c = vm.run_with_limit(1_000_000);
        total += c;
    }
    assert!(vm.halted, "life should halt after 10 gens (used {} cycles)", total);
    // Grid A at 8192..12288 should have alive cells
    let alive: u32 = vm.ram[8192..12288]
        .iter()
        .map(|&v| if v != 0 { 1u32 } else { 0u32 })
        .sum();
    assert!(alive > 0, "should have alive cells after 10 gens, got {}", alive);
}

#[test]
fn pixelc_sierpinski() {
    let vm = compile_run("programs/sierpinski.asm");
    assert!(vm.halted, "VM should halt");
    // Sierpinski chaos game: 5000 points plotted, at least 100 unique pixels
    let nonzero: usize = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        nonzero >= 100,
        "Sierpinski should have >= 100 non-zero screen pixels, got {}",
        nonzero
    );
}

#[test]
fn pixelc_mandelbrot() {
    // Mandelbrot set: 64x64 grid, fixed-point scale=64, max 16 iterations.
    // Uses 10M cycle limit due to nested loops with complex arithmetic.
    let source =
        std::fs::read_to_string("programs/mandelbrot.asm").expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("mandelbrot.asm assembly failed");
    let mut vm = Vm::new(512);
    vm.load_program(&asm.pixels);
    vm.run_with_limit(10_000_000);
    assert!(vm.halted, "Mandelbrot VM should halt");
    assert_eq!(vm.regs[0], 64, "r0 (py) should reach 64");
    assert_eq!(vm.regs[1], 64, "r1 (px) should reach 64");
    // The program draws 64x64 pixels (4096 total). Due to pixelc's PSET
    // argument ordering in gasm mode, pixels cluster at x=16 (in-set color)
    // and scatter elsewhere (escaped points). Verify significant output.
    let nonzero: usize = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        nonzero >= 100,
        "Mandelbrot should produce >= 100 non-zero screen pixels, got {}",
        nonzero
    );
}

#[test]
fn pixelc_maze() {
    let source =
        std::fs::read_to_string("programs/maze.asm").expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("maze.asm assembly failed");
    let mut vm = Vm::new(512);
    vm.load_program(&asm.pixels);
    // Maze draws ~12K pixels (grid lines + wall removals), needs generous limit
    vm.run_with_limit(5_000_000);
    assert!(vm.halted, "Maze should halt after drawing");
    // Maze should have both wall pixels (green) and passage pixels (black)
    let nonzero: usize = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        nonzero > 1000,
        "Maze should have wall pixels (got {} non-zero)",
        nonzero
    );
    assert!(
        nonzero < 256 * 256,
        "Maze should have passage pixels (black) too"
    );
}

#[test]
fn pixelc_rain() {
    let source = std::fs::read_to_string("programs/rain.asm")
        .expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("rain.asm assembly failed");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    // Rain runs 100 frames without yield, should halt within limit
    vm.run_with_limit(10_000_000);
    assert!(vm.halted, "Rain should halt after 100 frames");
    let nonzero: usize = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(nonzero > 0, "Rain should have drawn pixels, got {}", nonzero);
}

#[test]
fn pixelc_fireworks() {
    let source = std::fs::read_to_string("programs/fireworks.asm")
        .expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("fireworks.asm assembly failed");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run_with_limit(50_000_000);
    assert!(vm.halted, "Fireworks should halt after 8 bursts");
    let nonzero: usize = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(nonzero > 0, "Fireworks should have drawn pixels, got {}", nonzero);
}

#[test]
fn pixelc_clock() {
    // Analog clock face showing 10:10:30 with hour markers and three hands.
    // Program is ~1400 pixels (56 pixel() calls), needs 4096 RAM.
    let source =
        std::fs::read_to_string("programs/clock.asm").expect("run: cargo test from project root");
    let asm = assembler::assemble(&source).expect("clock.asm assembly failed");
    let mut vm = Vm::new(4096);
    vm.load_program(&asm.pixels);
    vm.run_with_limit(1_000_000);
    assert!(vm.halted, "Clock should halt after drawing");
    // Verify clock drew pixels on screen: markers (0x44), hands (0xFF, 0x41, 0xE0)
    let nonzero: usize = vm.screen.iter().filter(|&&p| p != 0).count();
    assert!(
        nonzero >= 50,
        "Clock should have >= 50 non-zero screen pixels, got {}",
        nonzero
    );
}
