// visual_cortex_demo.rs - Visual Framebuffer Demo
// Phase 25: Demonstrate 3-layer composite rendering

use std::time::Instant;

fn main() {
    println!("╔════════════════════════════════════════════════════════════════╗");
    println!("║        GEOMETRY OS: VISUAL CORTEX v2.5                       ║");
    println!("╚════════════════════════════════════════════════════════════════╝");
    println!();
    
    // Simulate 4-layer framebuffer
    let width = 576;
    let height = 576;
    let total_pixels = width * height;
    
    println!("📺 Initializing Visual Cortex...");
    println!("   Resolution: {}x{} ({} pixels)", width, height, total_pixels);
    println!("   Layers: 4 (Physical, Semantic, Logic, Executive)");
    println!();
    
    // Create layer buffers
    let mut physical_layer = vec![0u8; total_pixels as usize];    // L0
    let mut semantic_layer = vec![0u8; total_pixels as usize];    // L1
    let mut logic_layer = vec![0u8; total_pixels as usize];       // L2
    let mut executive_layer = vec![0u8; total_pixels as usize];   // L3
    let mut output_buffer = vec![' '; total_pixels as usize];
    
    println!("🧠 Running visual simulation...\n");
    
    let start = Instant::now();
    let frames = 1000;
    
    for frame in 0..frames {
        // Update each layer
        update_physical_layer(&mut physical_layer, frame);
        update_semantic_layer(&mut semantic_layer, frame);
        update_logic_layer(&mut logic_layer, frame);
        update_executive_layer(&mut executive_layer, frame);
        
        // Composite layers
        composite_layers(
            &physical_layer,
            &semantic_layer,
            &logic_layer,
            &executive_layer,
            &mut output_buffer,
            width,
        );
        
        // Print progress
        if frame % 100 == 0 {
            let progress = (frame as f32 / frames as f32 * 100.0) as usize;
            print!("\r   Frames: {} / {} ({}%)", frame, frames, progress);
            use std::io::Write;
            std::io::stdout().flush().ok();
        }
    }
    
    let elapsed = start.elapsed().as_millis();
    
    println!("\n\n📊 Rendering Statistics:");
    println!("   Frames: {}", frames);
    println!("   Time: {}ms", elapsed);
    println!("   FPS: {}", (frames as f32 / elapsed as f32 * 1000.0) as usize);
    println!();
    
    // Show sample output
    println!("────────────────────────────────────────────────────────────────");
    println!("🖼️  Sample Framebuffer Output (8x8 region):");
    println!("────────────────────────────────────────────────────────────────\n");
    
    for y in 0..8 {
        print!("   ");
        for x in 0..8 {
            let idx = (y * width + x) as usize;
            let c = output_buffer[idx];
            print!("{}", c);
        }
        println!();
    }
    
    println!();
    
    // Show layer composition
    println!("🎨 Layer Composition:");
    println!("   L0 (Physical):   Dark blue substrate - {:.1}% active", 
        physical_layer.iter().filter(|&&p| p > 0).count() as f32 / total_pixels as f32 * 100.0);
    println!("   L1 (Semantic):   White glyphs - {:.1}% active",
        semantic_layer.iter().filter(|&&s| s > 0).count() as f32 / total_pixels as f32 * 100.0);
    println!("   L2 (Logic):      Neon cyan gates - {:.1}% active",
        logic_layer.iter().filter(|&&l| l > 0).count() as f32 / total_pixels as f32 * 100.0);
    println!("   L3 (Executive):  Violet directives - {:.1}% active",
        executive_layer.iter().filter(|&&e| e > 0).count() as f32 / total_pixels as f32 * 100.0);
    println!();
    
    println!("────────────────────────────────────────────────────────────────");
    println!("✅ VISUAL CORTEX DEMO COMPLETE");
    println!();
    println!("🌈 Geometry OS Visual Cortex v2.5 Ready");
    println!("   Next: winit window for real-time display");
}

fn update_physical_layer(layer: &mut [u8], frame: usize) {
    // Background "noise" pattern
    for i in 0..layer.len() {
        let noise = ((i * 7 + frame) % 100) < 5;
        layer[i] = if noise { 30 } else { 10 };
    }
}

fn update_semantic_layer(layer: &mut [u8], frame: usize) {
    // Semantic glyphs appear at certain positions
    let glyph_positions = [
        (100, 100), (200, 150), (300, 200), (400, 250)
    ];
    
    for (gx, gy) in glyph_positions.iter() {
        let base = (gy * 576 + gx) as usize;
        if base + 9 < layer.len() {
            // Draw 3x3 glyph pattern
            let glyph_pattern = ((frame / 10) + *gx as usize) % 4;
            let pattern = match glyph_pattern {
                0 => [1, 0, 1, 0, 1, 0, 1, 0, 1], // DATA
                1 => [0, 1, 0, 1, 0, 1, 0, 1, 0], // FILE
                2 => [1, 1, 0, 1, 0, 1, 0, 1, 1], // HIGH
                _ => [1, 1, 1, 1, 0, 1, 1, 1, 1], // LOW
            };
            
            for (i, &p) in pattern.iter().enumerate() {
                let dx = (i % 3) as usize;
                let dy = (i / 3) as usize;
                let idx = base + dy * 576 + dx;
                if idx < layer.len() {
                    layer[idx] = if p == 1 { 255 } else { 0 };
                }
            }
        }
    }
}

fn update_logic_layer(layer: &mut [u8], frame: usize) {
    // Logic gates pulse
    let gate_positions = [
        (150, 150), (250, 200), (350, 250), (450, 300)
    ];
    
    for (i, (gx, gy)) in gate_positions.iter().enumerate() {
        let pulse = ((frame + i * 10) % 60) < 30;
        let base = (*gy as usize * 576 + *gx as usize);
        
        if base + 4 < layer.len() {
            // Draw gate
            layer[base] = if pulse { 200 } else { 50 };
            layer[base + 1] = if pulse { 200 } else { 50 };
            layer[base + 576] = if pulse { 200 } else { 50 };
            layer[base + 577] = if pulse { 200 } else { 50 };
        }
    }
}

fn update_executive_layer(layer: &mut [u8], frame: usize) {
    // Executive directives appear in corner
    if frame % 100 == 0 {
        let directive = (frame / 100) % 5;
        
        // Write directive in corner (8x8 region)
        let base = 10 * 576 + 10;
        if base + 64 < layer.len() {
            for i in 0..64 {
                layer[base + i] = (directive as u8) * 50;
            }
        }
    }
}

fn composite_layers(
    physical: &[u8],
    semantic: &[u8],
    logic: &[u8],
    executive: &[u8],
    output: &mut [char],
    _width: u32,
) {
    for i in 0..output.len() {
        let p = physical[i];
        let s = semantic[i];
        let l = logic[i];
        let e = executive[i];
        
        // Combine layers with priority
        let combined = s.max(l).max(e);
        
        output[i] = if combined > 200 {
            '█' // High intensity
        } else if combined > 100 {
            '▓' // Medium
        } else if combined > 50 {
            '▒' // Low
        } else if p > 20 {
            '░' // Background
        } else {
            ' ' // Empty
        };
    }
}
