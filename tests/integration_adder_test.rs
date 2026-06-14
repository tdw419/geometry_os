#[cfg(feature = "gpu")]
use geometry_os::kernel::active_substrate::ActiveSubstrate;
#[cfg(feature = "gpu")]
use wgpu::{DeviceDescriptor, Instance, InstanceDescriptor, RequestAdapterOptions};

#[test]
#[cfg(feature = "gpu")]
fn full_adder_spatial_validation() {
    let (device, queue) = pollster::block_on(async {
        let instance = Instance::new(&InstanceDescriptor::default());
        let adapter = instance
            .request_adapter(&RequestAdapterOptions::default())
            .await
            .expect("Failed to find wgpu adapter");
        adapter
            .request_device(&DeviceDescriptor::default())
            .await
            .expect("Failed to create wgpu device")
    });

    let mut substrate = ActiveSubstrate::new(&device, &queue, 256, 256);

    // --- Step 1: Manual Layout (Buffer Law Compliant) ---
    let mut pixels = vec![0u32; 256 * 256];
    let hot = 0x00800000;
    let xor_gate = (1u32 << 28) | (0u32 << 24) | hot;
    let and_gate = (1u32 << 28) | (1u32 << 24) | hot;
    let or_gate = (1u32 << 28) | (2u32 << 24) | hot;
    let neuron = (1u32 << 28) | (5u32 << 24) | hot;
    let weight = 255u32;
    let synapse = |dir: u32| (14u32 << 28) | (dir << 24) | (weight << 16) | hot;

    // Inputs: A (20, 20), B (20, 60), Cin (20, 100)
    pixels[20 * 256 + 20] = neuron;
    for x in 22..40 {
        pixels[20 * 256 + x] = synapse(0);
    }
    pixels[20 * 256 + 42] = or_gate;
    for y in 22..40 {
        pixels[y * 256 + 42] = synapse(1);
    }
    pixels[42 * 256 + 42] = xor_gate; // XOR1

    pixels[60 * 256 + 20] = neuron;
    for x in 22..40 {
        pixels[60 * 256 + x] = synapse(0);
    }
    pixels[60 * 256 + 42] = or_gate;
    for y in 44..60 {
        pixels[y * 256 + 42] = synapse(3);
    } // XOR1 Input

    for x in 44..80 {
        pixels[42 * 256 + x] = synapse(0);
    } // X1 output
    pixels[42 * 256 + 82] = or_gate;
    for y in 44..70 {
        pixels[y * 256 + 82] = synapse(1);
    }
    pixels[72 * 256 + 82] = xor_gate; // XOR2

    pixels[100 * 256 + 20] = neuron;
    for x in 22..80 {
        pixels[100 * 256 + x] = synapse(0);
    }
    pixels[100 * 256 + 82] = or_gate;
    for y in 74..100 {
        pixels[y * 256 + 82] = synapse(3);
    } // XOR2 Input

    // Outputs
    for x in 84..120 {
        pixels[72 * 256 + x] = synapse(0);
    } // Sum

    // Carry logic
    pixels[20 * 256 + 82] = and_gate; // AND1 (A, B)
    for x in 43..80 {
        pixels[20 * 256 + x] = synapse(0);
    }
    for x in 43..80 {
        pixels[60 * 256 + x] = synapse(0);
    }
    pixels[60 * 256 + 82] = or_gate;
    for y in 22..60 {
        pixels[y * 256 + 82] = synapse(3);
    } // AND1 Input

    pixels[85 * 256 + 102] = and_gate; // AND2 (X1, Cin)
    for x in 83..100 {
        pixels[42 * 256 + x] = synapse(0);
    }
    pixels[42 * 256 + 102] = or_gate;
    for y in 44..84 {
        pixels[y * 256 + 102] = synapse(1);
    } // AND2 Input

    for x in 83..100 {
        pixels[100 * 256 + x] = synapse(0);
    }
    pixels[100 * 256 + 102] = or_gate;
    for y in 87..100 {
        pixels[y * 256 + 102] = synapse(3);
    } // AND2 Input

    pixels[50 * 256 + 122] = or_gate; // OR
    for x in 84..120 {
        pixels[20 * 256 + x] = synapse(0);
    }
    pixels[20 * 256 + 122] = or_gate;
    for y in 22..48 {
        pixels[y * 256 + 122] = synapse(1);
    } // OR Input

    for x in 104..120 {
        pixels[85 * 256 + x] = synapse(0);
    }
    pixels[85 * 256 + 122] = or_gate;
    for y in 52..84 {
        pixels[y * 256 + 122] = synapse(3);
    } // OR Input

    for x in 124..150 {
        pixels[50 * 256 + x] = synapse(0);
    } // Cout

    substrate.set_substrate(&pixels);
    println!("[TEST] Circuit loaded.");

    // --- Step 2: Inject Signals (1 + 1 + 0) ---
    substrate.inject_signal(20, 20, 12, 0, 0xFFFF); // A=High
    substrate.inject_signal(20, 60, 12, 0, 0xFFFF); // B=High
    substrate.inject_signal(20, 100, 12, 0, 0); // Cin=Low
    println!("[TEST] Signals injected.");

    // --- Step 2 & 3: Simulation with Signal Streams ---
    let mut m1_buffer = false;
    let mut m6_cout_out = false;

    for i in 0..2000 {
        // Inject for the first 100 ticks
        if i < 100 {
            substrate.inject_signal(21, 20, 12, 0, 0xFFFF); // A=High into Buffer
            substrate.inject_signal(21, 60, 12, 0, 0xFFFF); // B=High into Buffer
            substrate.inject_signal(21, 100, 12, 0, 0); // Cin=Low into Buffer
        }

        substrate.update(i, 1.0);
        let pixels = pollster::block_on(substrate.get_substrate());

        if (pixels[20 * 256 + 21] >> 28) == 12 {
            m1_buffer = true;
        }
        if (pixels[50 * 256 + 149] >> 28) == 15 {
            m6_cout_out = true;
        }

        if m6_cout_out {
            break;
        }
    }

    println!(
        "[TELEMETRY] Buffer: {}, Cout Out: {}",
        m1_buffer, m6_cout_out
    );

    assert!(m1_buffer, "Signal never entered buffer");
    assert!(m6_cout_out, "Cout should have pulsed High");

    println!("[PASS] 1-bit Full Adder Spatial Validation Successful!");
}
