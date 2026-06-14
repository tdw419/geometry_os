#![cfg(feature = "gpu")]
// This test requires the `gpu` feature (wgpu, pollster, active_substrate).
// It's entirely gated so it compiles only when `--features gpu` is passed.

#[cfg(feature = "gpu")]
mod gpu_tests {
    use geometry_os::assembler::assemble;
    use geometry_os::kernel::active_substrate::ActiveSubstrate;
    use geometry_os::vm::Vm;

    #[test]
    fn test_substrate_self_replication_standalone() {
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

            // marker at (5,5)
            let pattern_pixel = 0xDEADBEEF;
            vm.active_substrate
                .as_mut()
                .unwrap()
                .set_pixel(5, 5, pattern_pixel);

            // Cascading Loop Proof
            let asm_src = r#"
                LDI r1 0       ; Current X
                LDI r2 0       ; Current Gen
                LDI r10 4      ; Max Gens

                :gen_loop
                ; arg1 = (sx << 24) | (dx << 8)
                MOV r3 r1
                SHLI r3 24
                
                LDI r4 32
                ADD r4 r1      ; next_x = X + 32
                MOV r21 r4     ; save next_x
                
                SHLI r4 8      ; dx << 8
                OR r3 r4
                LDI r20 0xE005 ; arg1
                STORE r20 r3

                LDI r3 1048592 ; 16x16 size (0x100010)
                LDI r20 0xE006 ; arg2
                STORE r20 r3

                LDI r3 8 ; COPY
                LDI r20 0xE004
                STORE r20 r3

                ; Advance X and Gen
                MOV r1 r21
                ADDI r2 1
                
                LDI r3 4
                CMP r2 r3
                JNZ r0 :gen_loop

                HALT
            "#;

            let result = assemble(asm_src, 0).expect("Assembly failed");
            for (i, &word) in result.pixels.iter().enumerate() {
                vm.ram[i] = word;
            }

            for _ in 0..2000 {
                vm.step();
                if vm.halted {
                    break;
                }
            }

            let pixels = vm.active_substrate.as_ref().unwrap().get_substrate().await;

            println!("[TEST] Gen 1 (37, 5): 0x{:08X}", pixels[5 * 256 + 37]);
            println!("[TEST] Gen 2 (69, 5): 0x{:08X}", pixels[5 * 256 + 69]);
            println!("[TEST] Gen 3 (101, 5): 0x{:08X}", pixels[5 * 256 + 101]);
            println!("[TEST] Gen 4 (133, 5): 0x{:08X}", pixels[5 * 256 + 133]);

            assert_eq!(pixels[5 * 256 + 37], pattern_pixel, "Gen 1 failed");
            assert_eq!(pixels[5 * 256 + 69], pattern_pixel, "Gen 2 failed");
            assert_eq!(pixels[5 * 256 + 101], pattern_pixel, "Gen 3 failed");
            assert_eq!(pixels[5 * 256 + 133], pattern_pixel, "Gen 4 failed");

            println!("[TEST] Gray Goo Proof Verified: 4 generations spawned autonomously.");
        });
    }
}
