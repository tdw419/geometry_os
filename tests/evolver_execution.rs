#![cfg(feature = "gpu")]
use geometry_os::assembler::assemble;
use geometry_os::kernel::active_substrate::ActiveSubstrate;
use geometry_os::vm::Vm;

#[test]
#[cfg(feature = "gpu")]
fn test_evolver_asm_execution() {
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

        // 1. Build initial population on the GPU substrate
        let mut pixels = vec![0u32; 256 * 256];
        for x in 64..80 {
            pixels[151 * 256 + x] = (14u32 << 28) | (0u32 << 24) | 0x800000;
        }
        for x in 96..112 {
            pixels[151 * 256 + x] = (14u32 << 28) | (0u32 << 24) | 0x800000;
        }

        if let Some(ref mut sub) = vm.active_substrate {
            sub.set_substrate(&pixels);
        }

        // 2. Load the evolver program into RAM (Hybrid Singularity)
        let asm_src = std::fs::read_to_string("programs/evolver.asm").unwrap();
        let result = assemble(&asm_src, 0).expect("Assembly failed");
        for (i, &word) in result.pixels.iter().enumerate() {
            vm.ram[i] = word;
        }

        // Standard execution mode (RAM-fetch)
        vm.substrate_execution = false;
        vm.pc = 0;

        // 3. Run the Watchmaker (RAM-resident)
        for _ in 0..10000 {
            if !vm.step() || vm.halted {
                break;
            }
        }

        // 4. Verify completion marker at (10, 10) on the substrate
        let mut final_pixels = vec![0u32; 256 * 256];
        if let Some(ref mut sub) = vm.active_substrate {
            final_pixels = sub.get_substrate().await;
        }
        let done_pixel = final_pixels[10 * 256 + 10];

        println!("[TEST] PC final: {:04X}", vm.pc);
        println!("[TEST] Evolver status at (10,10): 0x{:08X}", done_pixel);

        assert_eq!(
            (done_pixel >> 28),
            12,
            "Evolver did not finish (missing completion signal)"
        );
        assert_eq!(
            done_pixel & 0xFFFFFF,
            0xFF,
            "Completion signal payload mismatch"
        );

        println!("[TEST] True Autonomous Evolution Verified: Hybrid Singularity operational.");
    });
}
