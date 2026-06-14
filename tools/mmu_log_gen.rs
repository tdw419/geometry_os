use geometry_os::riscv::cpu::StepResult;
use geometry_os::riscv::RiscvVm;
use std::fs::File;
use std::io::Write;

fn main() {
    let kernel_path = ".geometry_os/build/linux-6.14/vmlinux";
    let kernel_data = match std::fs::read(kernel_path) {
        Ok(d) => d,
        Err(_) => {
            eprintln!(
                "Kernel not found at {}. Generating dummy log...",
                kernel_path
            );
            generate_dummy_log();
            return;
        },
    };

    let res = RiscvVm::boot_linux_setup(&kernel_data, None, 32, "console=ttyS0")
        .expect("failed to setup VM");

    let mut vm = res.0;

    println!("Booting for 1M cycles to generate MMU log...");
    for _ in 0..1_000_000 {
        match vm.cpu.step(&mut vm.bus) {
            StepResult::Ok | StepResult::Ecall | StepResult::Ebreak | StepResult::Yielded => {},
            _ => break,
        }
    }

    let json = serde_json::to_string_pretty(&vm.bus.mmu_log).expect("failed to serialize mmu_log");
    let mut file = File::create("mmu_log.json").expect("failed to create log file");
    file.write_all(json.as_bytes())
        .expect("failed to write log file");
    println!(
        "Generated mmu_log.json with {} events",
        vm.bus.mmu_log.len()
    );
}

fn generate_dummy_log() {
    use geometry_os::riscv::mmu::MmuEvent;
    let mut log = Vec::new();
    for i in 0..1000u64 {
        log.push(MmuEvent::PageTableWalk {
            va: 0x80000000 + (i as u32 * 0x1000),
            pa: 0x80000000 + (i * 0x1000),
            ptes: vec![0x20000401], // Dummy valid PTE
        });
    }
    let json = serde_json::to_string_pretty(&log).expect("failed to serialize dummy log");
    let mut file = File::create("mmu_log.json").expect("failed to create log file");
    file.write_all(json.as_bytes())
        .expect("failed to write log file");
    println!("Generated dummy mmu_log.json with 1000 events");
}
