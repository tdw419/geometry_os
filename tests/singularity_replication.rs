#![cfg(feature = "gpu")]
use geometry_os::assembler::assemble;
use geometry_os::kernel::active_substrate::ActiveSubstrate;
use geometry_os::vm::Vm;

#[test]
#[cfg(feature = "gpu")]
fn test_substrate_singularity_replication() {
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

        // 1. The Replicator Bytecode
        // Logic:
        // LDI r1 0x2000 (sx=0, dx=32)
        // LDI r2 0xE005
        // STORE r2 r1
        // LDI r1 0x00100010 (w=16, h=16)
        // LDI r2 0xE006
        // STORE r2 r1
        // LDI r1 8 (COPY)
        // LDI r2 0xE004
        // STORE r2 r1
        // HALT
        let asm_src = r#"
            LDI r1 0x2000
            LDI r2 0xE005
            STORE r2 r1
            LDI r1 1048592
            LDI r2 0xE006
            STORE r2 r1
            LDI r1 8
            LDI r2 0xE004
            STORE r2 r1
            HALT
        "#;

        let result = assemble(asm_src, 0).expect("Assembly failed");

        // 2. Draw the Replicator logic ONTO THE SUBSTRATE at (0,0)
        // We must unpack the bytecode into 24-bit color fields
        // so the 'visualize_substrate' logic doesn't hide it,
        // but our 'fetch' implementation reads the whole 32-bit pixel.
        for (i, &word) in result.pixels.iter().enumerate() {
            vm.active_substrate
                .as_mut()
                .unwrap()
                .set_pixel(i as u32, 0, word);
        }

        // Also plant a marker in the self-region to verify copy
        let pattern_pixel = 0xDEADC0DE;
        vm.active_substrate
            .as_mut()
            .unwrap()
            .set_pixel(5, 5, pattern_pixel);

        // 3. Enable Substrate Execution and Start
        vm.substrate_execution = true;
        vm.pc = 0; // Starts at (0,0) on the grid

        // 4. Run the VM
        for _ in 0..500 {
            if !vm.step() || vm.halted {
                break;
            }
        }

        // 5. Verify the "offspring" exists at the destination
        let pixels = vm.active_substrate.as_ref().unwrap().get_substrate().await;

        // Fetch specific pixels for debug
        for i in 0..result.pixels.len() {
            println!("[DEBUG] Substrate word {}: 0x{:08X}", i, pixels[i]);
        }

        let actual = pixels[5 * 256 + 37];
        println!("[TEST] Singularity Pixel at (37, 5): 0x{:08X}", actual);
        assert_eq!(actual, pattern_pixel, "Singularity replication failed");
    });
}
