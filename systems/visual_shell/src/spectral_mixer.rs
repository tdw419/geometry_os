//! Spectral Mixer - Harmonic Multi-Daemon Compositor
//!
//! Implements wave interference-based daemon integration for the Visual Shell.
//! Instead of mutex locks, daemons contribute to the Mood Field through
//! frequency-separated wave layers that blend via constructive/destructive
//! interference.
//!
//! # Architecture
//!
//! - [`SpectralMixer`]: Main coordinator for multi-daemon wave synthesis
//! - [`WaveLayer`]: Individual daemon's contribution with frequency/phase/amplitude
//! - [`FrequencyBand`]: Frequency band allocation for daemon types
//! - [`DaemonId`]: Unique identifier for daemon registration

use std::collections::HashMap;
use std::time::{Duration, Instant};
use serde::{Deserialize, Serialize};
use thiserror::Error;

/// Errors that can occur in the Spectral Mixer
#[derive(Error, Debug)]
pub enum SpectralMixerError {
    #[error("Daemon {0} already registered")]
    DaemonAlreadyRegistered(DaemonId),
    
    #[error("Daemon {0} not found")]
    DaemonNotFound(DaemonId),
    
    #[error("Frequency band {0:?} already allocated")]
    FrequencyBandTaken(FrequencyBand),
    
    #[error("Invalid frequency: {0}")]
    InvalidFrequency(f32),
    
    #[error("Data size mismatch: expected {expected}, got {actual}")]
    DataSizeMismatch { expected: usize, actual: usize },
}

/// Unique identifier for a daemon
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub struct DaemonId(pub u64);

impl DaemonId {
    /// Create a new daemon ID from a string name
    pub fn from_name(name: &str) -> Self {
        use std::collections::hash_map::DefaultHasher;
        use std::hash::{Hash, Hasher};
        
        let mut hasher = DefaultHasher::new();
        name.hash(&mut hasher);
        DaemonId(hasher.finish())
    }
}

impl std::fmt::Display for DaemonId {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "Daemon({})", self.0)
    }
}

/// Frequency bands for daemon type classification
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash, Serialize, Deserialize)]
pub enum FrequencyBand {
    /// Ultra-low: 0.25-0.5 Hz (Slow-moving gradients, network state)
    UltraLow,
    
    /// Low: 0.5-1.0 Hz (Broad sweeps, creative/user mood)
    Low,
    
    /// Mid: 1.0-2.0 Hz (Rhythmic pulses, system heartbeat)
    Mid,
    
    /// High: 2.0-4.0 Hz (Sharp changes, security alerts)
    High,
    
    /// Custom: User-defined frequency (stored as integer millihertz for Eq/Hash)
    Custom(u32),
}

impl FrequencyBand {
    /// Get the base frequency for this band
    pub fn base_frequency(&self) -> f32 {
        match self {
            FrequencyBand::UltraLow => 0.375,  // Midpoint of 0.25-0.5
            FrequencyBand::Low => 0.75,        // Midpoint of 0.5-1.0
            FrequencyBand::Mid => 1.5,         // Midpoint of 1.0-2.0
            FrequencyBand::High => 3.0,        // Midpoint of 2.0-4.0
            FrequencyBand::Custom(millihertz) => *millihertz as f32 / 1000.0,
        }
    }
    
    /// Check if a frequency falls within this band
    pub fn contains(&self, freq: f32) -> bool {
        match self {
            FrequencyBand::UltraLow => (0.25..=0.5).contains(&freq),
            FrequencyBand::Low => (0.5..=1.0).contains(&freq),
            FrequencyBand::Mid => (1.0..=2.0).contains(&freq),
            FrequencyBand::High => (2.0..=4.0).contains(&freq),
            FrequencyBand::Custom(millihertz) => {
                let custom_freq = *millihertz as f32 / 1000.0;
                (freq - custom_freq).abs() < 0.01
            }
        }
    }
}

/// A single wave layer representing one daemon's contribution
#[derive(Debug, Clone)]
pub struct WaveLayer {
    /// Daemon identifier
    pub daemon_id: DaemonId,
    
    /// Frequency in Hz (determines oscillation speed)
    pub frequency: f32,
    
    /// Current phase offset (radians)
    pub phase: f32,
    
    /// Amplitude (strength of this daemon's "voice", 0.0-1.0)
    pub amplitude: f32,
    
    /// Neural data vector (must match mixer resolution)
    pub data: Vec<f32>,
    
    /// Last update timestamp
    pub last_update: Instant,
    
    /// Frequency band classification
    pub band: FrequencyBand,
}

impl WaveLayer {
    /// Create a new wave layer
    pub fn new(
        daemon_id: DaemonId,
        frequency: f32,
        amplitude: f32,
        data_size: usize,
        band: FrequencyBand,
    ) -> Result<Self, SpectralMixerError> {
        if frequency <= 0.0 || frequency > 10.0 {
            return Err(SpectralMixerError::InvalidFrequency(frequency));
        }
        
        Ok(Self {
            daemon_id,
            frequency,
            phase: 0.0,
            amplitude: amplitude.clamp(0.0, 1.0),
            data: vec![0.0; data_size],
            last_update: Instant::now(),
            band,
        })
    }
    
    /// Update the layer's data
    pub fn update_data(&mut self, data: Vec<f32>) -> Result<(), SpectralMixerError> {
        if data.len() != self.data.len() {
            return Err(SpectralMixerError::DataSizeMismatch {
                expected: self.data.len(),
                actual: data.len(),
            });
        }
        
        self.data = data;
        self.last_update = Instant::now();
        Ok(())
    }
    
    /// Get the current wave modulation factor
    pub fn wave_modulation(&self, time: f32) -> f32 {
        (time * self.frequency + self.phase).sin()
    }
}

/// Main Spectral Mixer for multi-daemon wave synthesis
pub struct SpectralMixer {
    /// Registered wave layers (one per daemon)
    layers: HashMap<DaemonId, WaveLayer>,
    
    /// Global time accumulator (seconds)
    time: f32,
    
    /// Start time for time tracking
    start_time: Instant,
    
    /// Expected data size for all layers
    data_size: usize,
    
    /// Frequency band allocation registry
    band_registry: HashMap<FrequencyBand, DaemonId>,
}

impl SpectralMixer {
    /// Create a new spectral mixer
    ///
    /// # Arguments
    ///
    /// * `data_size` - Size of neural data vectors (must match Hilbert curve resolution²)
    pub fn new(data_size: usize) -> Self {
        Self {
            layers: HashMap::new(),
            time: 0.0,
            start_time: Instant::now(),
            data_size,
            band_registry: HashMap::new(),
        }
    }
    
    /// Register a new daemon with its frequency band
    ///
    /// # Arguments
    ///
    /// * `daemon_id` - Unique daemon identifier
    /// * `band` - Frequency band for this daemon
    /// * `amplitude` - Initial amplitude (0.0-1.0)
    pub fn register_daemon(
        &mut self,
        daemon_id: DaemonId,
        band: FrequencyBand,
        amplitude: f32,
    ) -> Result<(), SpectralMixerError> {
        // Check if daemon already registered
        if self.layers.contains_key(&daemon_id) {
            return Err(SpectralMixerError::DaemonAlreadyRegistered(daemon_id));
        }
        
        // Check if band is already allocated (except for Custom)
        if !matches!(band, FrequencyBand::Custom(_)) {
            if self.band_registry.contains_key(&band) {
                return Err(SpectralMixerError::FrequencyBandTaken(band));
            }
        }
        
        // Create wave layer
        let frequency = band.base_frequency();
        let layer = WaveLayer::new(daemon_id, frequency, amplitude, self.data_size, band)?;
        
        // Register
        self.layers.insert(daemon_id, layer);
        self.band_registry.insert(band, daemon_id);
        
        Ok(())
    }
    
    /// Unregister a daemon
    pub fn unregister_daemon(&mut self, daemon_id: DaemonId) -> Result<(), SpectralMixerError> {
        let layer = self.layers.remove(&daemon_id)
            .ok_or(SpectralMixerError::DaemonNotFound(daemon_id))?;
        
        // Remove from band registry
        self.band_registry.remove(&layer.band);
        
        Ok(())
    }
    
    /// Update a daemon's data
    pub fn update_daemon(
        &mut self,
        daemon_id: DaemonId,
        data: Vec<f32>,
    ) -> Result<(), SpectralMixerError> {
        let layer = self.layers.get_mut(&daemon_id)
            .ok_or(SpectralMixerError::DaemonNotFound(daemon_id))?;
        
        layer.update_data(data)?;
        Ok(())
    }
    
    /// Update a daemon's amplitude
    pub fn set_amplitude(
        &mut self,
        daemon_id: DaemonId,
        amplitude: f32,
    ) -> Result<(), SpectralMixerError> {
        let layer = self.layers.get_mut(&daemon_id)
            .ok_or(SpectralMixerError::DaemonNotFound(daemon_id))?;
        
        layer.amplitude = amplitude.clamp(0.0, 1.0);
        Ok(())
    }
    
    /// Advance time by delta
    pub fn tick(&mut self, delta: Duration) {
        self.time += delta.as_secs_f32();
    }
    
    /// Resolve the composite field from all wave layers
    ///
    /// Uses wave interference formula:
    /// Pixel_final = tanh(Σ(Daemon_i × Weight_i × sin(Time × Freq_i + Phase_i)))
    ///
    /// Returns a vector of the same size as input data
    pub fn resolve_field(&self) -> Vec<f32> {
        let mut composite = vec![0.0; self.data_size];
        
        // Sum all wave contributions
        for layer in self.layers.values() {
            let wave_mod = layer.wave_modulation(self.time);
            
            for (i, value) in layer.data.iter().enumerate() {
                composite[i] += value * layer.amplitude * wave_mod;
            }
        }
        
        // Apply hyperbolic tangent for biological-like saturation
        for value in composite.iter_mut() {
            *value = value.tanh();
        }
        
        composite
    }
    
    /// Get the number of active daemons
    pub fn daemon_count(&self) -> usize {
        self.layers.len()
    }
    
    /// Get current time
    pub fn time(&self) -> f32 {
        self.time
    }
    
    /// Get a layer by daemon ID
    pub fn get_layer(&self, daemon_id: DaemonId) -> Option<&WaveLayer> {
        self.layers.get(&daemon_id)
    }
    
    /// Get all registered daemon IDs
    pub fn daemon_ids(&self) -> Vec<DaemonId> {
        self.layers.keys().copied().collect()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_daemon_id_creation() {
        let id1 = DaemonId::from_name("security_daemon");
        let id2 = DaemonId::from_name("security_daemon");
        let id3 = DaemonId::from_name("creative_daemon");
        
        assert_eq!(id1, id2);
        assert_ne!(id1, id3);
    }
    
    #[test]
    fn test_frequency_bands() {
        assert!(FrequencyBand::UltraLow.contains(0.3));
        assert!(FrequencyBand::Low.contains(0.8));
        assert!(FrequencyBand::Mid.contains(1.5));
        assert!(FrequencyBand::High.contains(3.0));
        
        assert!(!FrequencyBand::Low.contains(0.3));
    }
    
    #[test]
    fn test_spectral_mixer_registration() {
        let mut mixer = SpectralMixer::new(256);
        
        let daemon1 = DaemonId::from_name("security");
        let daemon2 = DaemonId::from_name("creative");
        
        // Register daemons
        assert!(mixer.register_daemon(daemon1, FrequencyBand::High, 0.8).is_ok());
        assert!(mixer.register_daemon(daemon2, FrequencyBand::Low, 0.6).is_ok());
        
        assert_eq!(mixer.daemon_count(), 2);
        
        // Try to register duplicate
        assert!(mixer.register_daemon(daemon1, FrequencyBand::Mid, 0.5).is_err());
        
        // Try to use same band
        let daemon3 = DaemonId::from_name("another");
        assert!(mixer.register_daemon(daemon3, FrequencyBand::High, 0.5).is_err());
    }
    
    #[test]
    fn test_wave_interference() {
        let mut mixer = SpectralMixer::new(4);
        
        let daemon1 = DaemonId::from_name("daemon1");
        let daemon2 = DaemonId::from_name("daemon2");
        
        mixer.register_daemon(daemon1, FrequencyBand::Low, 1.0).unwrap();
        mixer.register_daemon(daemon2, FrequencyBand::High, 1.0).unwrap();
        
        // Update with simple data
        mixer.update_daemon(daemon1, vec![1.0, 0.0, 0.0, 0.0]).unwrap();
        mixer.update_daemon(daemon2, vec![0.0, 1.0, 0.0, 0.0]).unwrap();
        
        // Resolve field
        let field = mixer.resolve_field();
        
        assert_eq!(field.len(), 4);
        // Values should be within [-1, 1] due to tanh
        for value in field.iter() {
            assert!(value.abs() <= 1.0);
        }
    }
    
    #[test]
    fn test_wave_modulation() {
        let layer = WaveLayer::new(
            DaemonId::from_name("test"),
            1.0,
            1.0,
            10,
            FrequencyBand::Mid,
        ).unwrap();
        
        // At time 0, sin(0) = 0
        assert!((layer.wave_modulation(0.0) - 0.0).abs() < 0.01);
        
        // At time π/2, sin(π/2) = 1
        let pi_half = std::f32::consts::PI / 2.0;
        assert!((layer.wave_modulation(pi_half) - 1.0).abs() < 0.01);
    }
    
    #[test]
    fn test_unregister_daemon() {
        let mut mixer = SpectralMixer::new(256);
        let daemon = DaemonId::from_name("test");
        
        mixer.register_daemon(daemon, FrequencyBand::Mid, 0.5).unwrap();
        assert_eq!(mixer.daemon_count(), 1);
        
        mixer.unregister_daemon(daemon).unwrap();
        assert_eq!(mixer.daemon_count(), 0);
        
        // Should be able to re-register now
        assert!(mixer.register_daemon(daemon, FrequencyBand::Mid, 0.5).is_ok());
    }
}
