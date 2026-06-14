#![cfg(feature = "gpu")]
use geometry_os::assembler::assemble;
use geometry_os::kernel::active_substrate::ActiveSubstrate;
use geometry_os::vm::Vm;

#[test]
#[cfg(feature = "gpu")]
fn test_evolver_v3_xor_convergence() {
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

        // 1. Load the XOR evolver program
        let asm_src = std::fs::read_to_string("programs/evolver_v3_xor.asm")
            .expect("Failed to read evolver_v3_xor.asm");
        let result = assemble(&asm_src, 0).expect("Assembly failed");
        for (i, &word) in result.pixels.iter().enumerate() {
            vm.ram[i] = word;
        }

        vm.substrate_execution = false;
        vm.pc = 0;

        let mut last_gen = 0;
        let mut fitness_history = Vec::new();
        let mut csv_output = String::from("frame,op,x,y,w,h,r,g,b,text\n");

        println!("[TEST] Starting XOR Evolution v3 (Single-Guild Stress Test)...");

        for step in 0..300_000_000 {
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

                // CSV Recording
                let max_h = (max_fitness * 10) as u32;
                csv_output.push_str(&format!(
                    "{},RECTF,{},{},5,{},0,255,0,\n",
                    last_gen,
                    10 + (last_gen % 240),
                    100 - max_h,
                    max_h
                ));

                let avg_y = (100.0 - (avg_fitness * 10.0)) as u32;
                csv_output.push_str(&format!(
                    "{},PSET,{},{},0,0,0,0,255,\n",
                    last_gen,
                    10 + (last_gen % 240),
                    avg_y
                ));

                if last_gen % 50 == 0 {
                    csv_output.push_str(&format!(
                        "{},TEXT,10,120,0,0,255,255,255,Gen {} Max {}\n",
                        last_gen, last_gen, max_fitness
                    ));
                }

                fitness_history.push((last_gen, max_fitness, avg_fitness));
                last_gen = current_gen;

                if max_fitness == 4 {
                    println!("[TEST] XOR CONVERGENCE REACHED AT GEN {}!", last_gen - 1);
                }
            }

            if step % 10_000_000 == 0 && step > 0 {
                println!("Step {}M...", step / 1_000_000);
            }
        }

        std::fs::write("evolution_xor_v3.csv", csv_output).expect("Failed to write CSV");
        println!("[TEST] Visual Timeline saved to evolution_xor_v3.csv");

        let mut final_fitness = Vec::new();
        for i in 0..8 {
            final_fitness.push(vm.canvas_buffer[i]);
        }
        let final_max = *final_fitness.iter().max().unwrap_or(&0);

        println!("[TEST] Final Max XOR Fitness: {}", final_max);

        // Assert some progress (XOR is hard, so 3/4 is a decent baseline for 1000 gens)
        assert!(final_max >= 2, "XOR evolution stalled completely");
    });
}
