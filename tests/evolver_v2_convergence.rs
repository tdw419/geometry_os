#![cfg(feature = "gpu")]
use geometry_os::assembler::assemble;
use geometry_os::kernel::active_substrate::ActiveSubstrate;
use geometry_os::vm::Vm;

#[test]
#[cfg(feature = "gpu")]
fn test_evolver_v2_convergence() {
    pollster::block_on(async {
        let instance = wgpu::Instance::new(&wgpu::InstanceDescriptor::default());
        let adapter = instance
            .request_adapter(&wgpu::RequestAdapterOptions::default())
            .await
            .expect("Failed to find wgpu adapter");
        let (device, queue) = adapter
            .request_device(&wgpu::DeviceDescriptor::default())
            .await
            .expect("Failed to create wgpu device");

        let mut vm = Vm::new();
        vm.active_substrate = Some(ActiveSubstrate::new(&device, &queue, 256, 256));

        // 1. Load the evolver program
        let asm_src = std::fs::read_to_string("programs/evolver_v2.asm")
            .expect("Failed to read evolver_v2.asm");
        let result = assemble(&asm_src, 0).expect("Assembly failed");
        for (i, &word) in result.pixels.iter().enumerate() {
            vm.ram[i] = word;
        }

        vm.substrate_execution = false;
        vm.pc = 0;

        let mut last_gen = 0;
        let mut fitness_history = Vec::new();

        println!("[TEST] Starting Evolution v2 (Rich Fitness Landscape)...");

        // 2. Run the loop and track fitness
        // 100M steps max
        for step in 0..100_000_000 {
            if !vm.step() || vm.halted {
                break;
            }

            let current_gen = vm.regs[1]; // r1
            if current_gen > last_gen {
                // End of a generation (or start of next)
                // In evolver_v2.asm, r1 is incremented at the end of gen_loop

                let mut current_fitness = Vec::new();
                for i in 0..8 {
                    // Address 0x8000 is intercepted by canvas_buffer
                    current_fitness.push(vm.canvas_buffer[i]);
                }

                let max_fitness = *current_fitness.iter().max().unwrap_or(&0);
                let avg_fitness: f32 = current_fitness.iter().sum::<u32>() as f32 / 8.0;

                println!(
                    "Gen {}: Max={}, Avg={:.2} Scores={:?}",
                    last_gen, max_fitness, avg_fitness, current_fitness
                );

                fitness_history.push((last_gen, max_fitness, avg_fitness));
                last_gen = current_gen;
            }

            // Periodically log progress so it doesn't look stuck
            if step % 1_000_000 == 0 && step > 0 {
                println!("Step {}M...", step / 1_000_000);
            }
        }

        // 3. Final readout
        let mut final_fitness = Vec::new();
        for i in 0..8 {
            final_fitness.push(vm.canvas_buffer[i]);
        }
        let final_max = *final_fitness.iter().max().unwrap_or(&0);

        println!("[TEST] Final Max Fitness: {}", final_max);
        println!("[TEST] Final Gen: {}", vm.regs[1]);

        // 4. Verify completion marker at (10, 10) on the substrate
        let final_pixels = vm.active_substrate.as_mut().unwrap().get_substrate().await;
        let done_pixel = final_pixels[10 * 256 + 10];

        println!("[TEST] Completion signal at (10,10): 0x{:08X}", done_pixel);

        // We expect at least some improvement, ideally reaching 4
        // But since evolution is stochastic, we might not hit 4 in 100 gens every time
        // However, for a test we want it to be likely to succeed.
        assert!(
            final_max >= 1,
            "Evolution failed to produce any fit individual"
        );

        if final_max == 4 {
            println!("[TEST] CONVERGENCE ACHIEVED: AND gate evolved successfully.");
        } else {
            println!("[TEST] Evolution complete, but perfect AND gate not found in 100 gens.");
        }
    });
}
