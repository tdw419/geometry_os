//! Example: Multi-Daemon Harmonic Integration
//!
//! Demonstrates the Spectral Mixer with multiple concurrent daemons
//! contributing to the Mood Field through wave interference.

use visual_shell::{VisualShell, DaemonId, FrequencyBand};
use std::path::Path;
use std::time::Duration;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    println!("🌊 Spectral Mixer Demo: Harmonic Daemon Integration\n");
    
    // Create Visual Shell with Hilbert order 6 (64x64 resolution)
    let tokens_path = Path::new("design_tokens.json");
    let mut shell = VisualShell::new(tokens_path, 6)?;
    
    let resolution = shell.resolution();
    let data_size = (resolution * resolution) as usize;
    
    println!("✓ Visual Shell initialized");
    println!("  Resolution: {}x{} ({} pixels)\n", resolution, resolution, data_size);
    
    // Register daemons with different frequency bands
    let security_daemon = DaemonId::from_name("security_daemon");
    let creative_daemon = DaemonId::from_name("creative_daemon");
    let system_daemon = DaemonId::from_name("system_daemon");
    let network_daemon = DaemonId::from_name("network_daemon");
    
    println!("📡 Registering daemons...");
    
    shell.register_daemon(security_daemon, FrequencyBand::High, 0.8)?;
    println!("  ✓ Security Daemon (High: 2.0-4.0 Hz, Amplitude: 0.8)");
    
    shell.register_daemon(creative_daemon, FrequencyBand::Low, 0.6)?;
    println!("  ✓ Creative Daemon (Low: 0.5-1.0 Hz, Amplitude: 0.6)");
    
    shell.register_daemon(system_daemon, FrequencyBand::Mid, 0.7)?;
    println!("  ✓ System Daemon (Mid: 1.0-2.0 Hz, Amplitude: 0.7)");
    
    shell.register_daemon(network_daemon, FrequencyBand::UltraLow, 0.5)?;
    println!("  ✓ Network Daemon (UltraLow: 0.25-0.5 Hz, Amplitude: 0.5)\n");
    
    println!("Active daemons: {}\n", shell.daemon_count());
    
    // Simulate daemon updates over time
    println!("🎵 Simulating wave interference over 5 seconds...\n");
    
    for frame in 0..50 {
        let time = frame as f32 * 0.1; // 100ms per frame
        
        // Security daemon: Sharp spikes (high frequency)
        let security_data: Vec<f32> = (0..data_size)
            .map(|i| {
                let x = (i % resolution as usize) as f32;
                let spike = ((x / 8.0).sin() * 3.0).sin(); // High frequency
                spike * 0.5
            })
            .collect();
        
        // Creative daemon: Smooth waves (low frequency)
        let creative_data: Vec<f32> = (0..data_size)
            .map(|i| {
                let x = (i % resolution as usize) as f32;
                let wave = (x / 32.0 + time).sin(); // Low frequency
                wave * 0.3
            })
            .collect();
        
        // System daemon: Rhythmic pulse (mid frequency)
        let system_data: Vec<f32> = (0..data_size)
            .map(|i| {
                let pulse = (time * 2.0).sin(); // Heartbeat
                pulse * 0.4
            })
            .collect();
        
        // Network daemon: Slow gradient (ultra-low frequency)
        let network_data: Vec<f32> = (0..data_size)
            .map(|i| {
                let x = (i % resolution as usize) as f32;
                let gradient = (x / 64.0 + time * 0.5).sin(); // Very slow
                gradient * 0.2
            })
            .collect();
        
        // Update all daemons
        shell.update_daemon_data(security_daemon, security_data)?;
        shell.update_daemon_data(creative_daemon, creative_data)?;
        shell.update_daemon_data(system_daemon, system_data)?;
        shell.update_daemon_data(network_daemon, network_data)?;
        
        // Advance time
        shell.tick_mixer(Duration::from_millis(100));
        
        // Resolve composite field
        shell.update_from_spectral_field(0.9)?;
        
        if frame % 10 == 0 {
            let mixer = shell.spectral_mixer();
            println!("Frame {}: Time={:.2}s, Daemons={}", 
                frame, mixer.time(), shell.daemon_count());
        }
    }
    
    println!("\n✨ Wave interference simulation complete!");
    println!("\n📊 Final State:");
    println!("  Total daemons: {}", shell.daemon_count());
    println!("  Visual state version: {}", shell.state().version());
    println!("  Confidence: {:.2}", shell.state().confidence);
    
    // Demonstrate daemon removal
    println!("\n🔧 Unregistering security daemon...");
    shell.unregister_daemon(security_daemon)?;
    println!("  Remaining daemons: {}", shell.daemon_count());
    
    // Demonstrate amplitude adjustment
    println!("\n🎚️  Adjusting creative daemon amplitude to 1.0...");
    shell.set_daemon_amplitude(creative_daemon, 1.0)?;
    
    println!("\n✓ Demo complete!");
    
    Ok(())
}
