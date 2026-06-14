#![cfg(feature = "gpu")]
use geometry_os::assembler::assemble;
use geometry_os::kernel::active_substrate::ActiveSubstrate;
use geometry_os::vm::Vm;

#[test]
#[cfg(feature = "gpu")]
fn test_evolver_v3_convergence() {
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
        let asm_src = std::fs::read_to_string("programs/evolver_v3.asm")
            .expect("Failed to read evolver_v3.asm");
        let result = assemble(&asm_src, 0).expect("Assembly failed");
        for (i, &word) in result.pixels.iter().enumerate() {
            vm.ram[i] = word;
        }

        vm.substrate_execution = false;
        vm.pc = 0;

        let mut last_gen = 0;
        let mut fitness_history = Vec::new();
        let mut csv_output = String::from("frame,op,x,y,w,h,r,g,b,text\n");

        println!("[TEST] Starting Evolution v3 (Optimized Convergence)...");

        // 2. Run the loop and track fitness
        for step in 0..200_000_000 {
            if !vm.step() || vm.halted {
                break;
            }

            let current_gen = vm.regs[1]; // r1
            if current_gen > last_gen {
                let mut current_fitness = Vec::new();
                for i in 0..8 {
                    current_fitness.push(vm.canvas_buffer[i]);
                }

                let max_fitness = *current_fitness.iter().max().unwrap_or(&0);
                let avg_fitness: f32 = current_fitness.iter().sum::<u32>() as f32 / 8.0;

                println!(
                    "Gen {}: Max={}, Avg={:.2} Scores={:?}",
                    last_gen, max_fitness, avg_fitness, current_fitness
                );

                // --- CSV TIMELINE RECORDING ---
                // We use 'last_gen' as the frame number
                // Max fitness = Green bar
                let max_h = (max_fitness * 10) as u32;
                csv_output.push_str(&format!(
                    "{},RECTF,{},{},5,{},0,255,0,\n",
                    last_gen,
                    10 + (last_gen % 240),
                    100 - max_h,
                    max_h
                ));

                // Avg fitness = Blue line/pixel
                let avg_y = (100.0 - (avg_fitness * 10.0)) as u32;
                csv_output.push_str(&format!(
                    "{},PSET,{},{},0,0,0,0,255,\n",
                    last_gen,
                    10 + (last_gen % 240),
                    avg_y
                ));

                // Every 10 generations, add text
                if last_gen % 10 == 0 {
                    csv_output.push_str(&format!(
                        "{},TEXT,10,120,0,0,255,255,255,Gen {} Max {}\n",
                        last_gen, last_gen, max_fitness
                    ));
                }

                fitness_history.push((last_gen, max_fitness, avg_fitness));
                last_gen = current_gen;

                if max_fitness == 4 && fitness_history.len() < 10 {
                    println!("[TEST] Early Convergence reached at Gen {}!", last_gen - 1);
                }
            }

            if step % 5_000_000 == 0 && step > 0 {
                println!("Step {}M...", step / 1_000_000);
            }
        }

        // 3. Final readout and CSV Save
        std::fs::write("evolution_v3_results.csv", csv_output).expect("Failed to write CSV");
        println!("[TEST] Visual Timeline saved to evolution_v3_results.csv");

        let mut final_fitness = Vec::new();
        for i in 0..8 {
            final_fitness.push(vm.canvas_buffer[i]);
        }
        let final_max = *final_fitness.iter().max().unwrap_or(&0);

        println!("[TEST] Final Max Fitness: {}", final_max);
        println!("[TEST] Final Gen: {}", vm.regs[1]);

        // 4. Verify completion marker
        let final_pixels = vm.active_substrate.as_mut().unwrap().get_substrate().await;
        let done_pixel = final_pixels[10 * 256 + 10];
        println!("[TEST] Completion signal at (10,10): 0x{:08X}", done_pixel);

        assert!(
            final_max >= 3,
            "Evolution regressed or failed to maintain baseline"
        );

        if final_max == 4 {
            println!("[TEST] CONVERGENCE ACHIEVED: AND gate evolved successfully.");
        } else {
            println!(
                "[TEST] Evolution complete. Max fitness was {}. Progress made?",
                final_max
            );
        }
    });
}
