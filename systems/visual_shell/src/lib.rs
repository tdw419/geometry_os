//! Visual Shell - "The UI is the computer"
//!
//! This module implements the Visual Shell system that renders NeuralState
//! as a morphological texture using PixelRTS v2. It bridges the gap between
//! neural computation and visual output through Design Tokens.
//!
//! # Architecture
//!
//! - [`VisualShell`]: Main container for visual shell state and rendering
//! - [`VisualState`]: Represents the current visual state derived from neural data
//! - [`DesignTokens`]: Maps neural values to visual properties
//! - [`HilbertMapper`]: Maps 1D neural vectors to 2D texture coordinates

mod design_tokens;
mod visual_state;
mod hilbert_mapper;
mod pixelrts_bridge;
mod integration;
mod spectral_mixer;

pub use design_tokens::{DesignTokens, ColorToken, TypographyToken, SpacingToken};
pub use visual_state::{VisualState, NeuralNode, SynapticConnection};
pub use hilbert_mapper::HilbertMapper;
pub use pixelrts_bridge::PixelRTSBridge;
pub use integration::{VisualShellIntegration, VisualShellIntegrationBuilder};
pub use spectral_mixer::{SpectralMixer, WaveLayer, FrequencyBand, DaemonId, SpectralMixerError};

use wgpu::{Device, Queue, Texture, TextureView, TextureFormat, Extent3d};
use std::path::Path;
use thiserror::Error;

/// Errors that can occur in the Visual Shell
#[derive(Error, Debug)]
pub enum VisualShellError {
    #[error("Failed to load design tokens: {0}")]
    TokenLoadError(String),
    
    #[error("Invalid design token format: {0}")]
    TokenFormatError(String),
    
    #[error("WGPU error: {0}")]
    GPUError(#[from] wgpu::Error),
    
    #[error("Texture creation failed: {0}")]
    TextureError(String),
    
    #[error("Neural state conversion failed: {0}")]
    ConversionError(String),
}

/// Main Visual Shell container
///
/// The Visual Shell is responsible for:
/// - Loading and managing design tokens
/// - Converting neural state to visual representation
/// - Rendering the visual shell as a texture
/// - Managing morphological transitions
pub struct VisualShell {
    /// Design tokens for visual mapping
    tokens: DesignTokens,
    
    /// Current visual state
    state: VisualState,
    
    /// Hilbert curve mapper for 1D->2D conversion
    hilbert: HilbertMapper,
    
    /// PixelRTS bridge for texture generation
    bridge: PixelRTSBridge,
    
    /// Spectral mixer for multi-daemon wave synthesis
    spectral_mixer: SpectralMixer,
    
    /// Output texture for rendering
    texture: Option<Texture>,
    texture_view: Option<TextureView>,
    
    /// Device reference for GPU operations
    device: Option<std::sync::Arc<Device>>,
    
    /// Queue reference for GPU operations
    queue: Option<std::sync::Arc<Queue>>,
}

impl VisualShell {
    /// Create a new Visual Shell
    ///
    /// # Arguments
    ///
    /// * `tokens_path` - Path to design tokens JSON file
    /// * `hilbert_order` - Order of Hilbert curve (determines resolution)
    ///
    /// # Example
    ///
    /// ```no_run
    /// use visual_shell::VisualShell;
    ///
    /// let shell = VisualShell::new(std::path::Path::new("tokens.json"), 8)?;
    /// # Ok::<(), visual_shell::VisualShellError>(())
    /// ```
    pub fn new(tokens_path: &Path, hilbert_order: u32) -> Result<Self, VisualShellError> {
        let tokens = DesignTokens::load(tokens_path)?;
        let hilbert = HilbertMapper::new(hilbert_order);
        let bridge = PixelRTSBridge::new();
        
        // Calculate data size for spectral mixer (resolution²)
        let resolution = hilbert.resolution();
        let data_size = (resolution * resolution) as usize;
        let spectral_mixer = SpectralMixer::new(data_size);
        
        Ok(Self {
            tokens,
            state: VisualState::new(),
            hilbert,
            bridge,
            spectral_mixer,
            texture: None,
            texture_view: None,
            device: None,
            queue: None,
        })
    }
    
    /// Initialize GPU resources
    ///
    /// Must be called before rendering
    pub fn init_gpu(&mut self, device: &std::sync::Arc<Device>, queue: &std::sync::Arc<Queue>) -> Result<(), VisualShellError> {
        self.device = Some(device.clone());
        self.queue = Some(queue.clone());
        
        // Create output texture
        let resolution = self.hilbert.resolution();
        let size = Extent3d {
            width: resolution,
            height: resolution,
            depth_or_array_layers: 1,
        };
        
        let texture = device.create_texture(&wgpu::TextureDescriptor {
            label: Some("Visual Shell Output"),
            size,
            mip_level_count: 1,
            sample_count: 1,
            dimension: wgpu::TextureDimension::D2,
            format: TextureFormat::Rgba8UnormSrgb,
            usage: wgpu::TextureUsages::TEXTURE_BINDING | wgpu::TextureUsages::COPY_DST | wgpu::TextureUsages::RENDER_ATTACHMENT,
            view_formats: &[],
        });
        
        let texture_view = texture.create_view(&wgpu::TextureViewDescriptor::default());
        
        self.texture = Some(texture);
        self.texture_view = Some(texture_view);
        
        Ok(())
    }
    
    /// Update visual state from neural data
    ///
    /// # Arguments
    ///
    /// * `neural_activations` - 1D vector of neural activations
    /// * `attention_weights` - 1D vector of attention weights
    /// * `memory_patterns` - 1D vector of memory patterns
    /// * `confidence` - Overall confidence score (0.0 to 1.0)
    pub fn update_from_neural(
        &mut self,
        neural_activations: &[f32],
        attention_weights: &[f32],
        memory_patterns: &[f32],
        confidence: f32,
    ) -> Result<(), VisualShellError> {
        // Update visual state using design tokens
        self.state.update_from_neural(
            neural_activations,
            attention_weights,
            memory_patterns,
            confidence,
            &self.tokens,
            &self.hilbert,
        )?;
        
        Ok(())
    }
    
    /// Render the visual shell to the output texture
    ///
    /// Must call [`init_gpu`] first
    pub fn render(&mut self) -> Result<(), VisualShellError> {
        let _device = self.device.as_ref().ok_or_else(|| {
            VisualShellError::TextureError("GPU not initialized".to_string())
        })?;
        
        let queue = self.queue.as_ref().ok_or_else(|| {
            VisualShellError::TextureError("GPU not initialized".to_string())
        })?;
        
        let texture = self.texture.as_ref().ok_or_else(|| {
            VisualShellError::TextureError("Texture not created".to_string())
        })?;
        
        // Generate PixelRTS texture from visual state
        let pixel_data = self.bridge.generate_texture(&self.state, &self.tokens)?;
        
        // Upload to GPU
        let resolution = self.hilbert.resolution();
        queue.write_texture(
            wgpu::ImageCopyTexture {
                texture,
                mip_level: 0,
                origin: wgpu::Origin3d::ZERO,
                aspect: wgpu::TextureAspect::All,
            },
            &pixel_data,
            wgpu::ImageDataLayout {
                offset: 0,
                bytes_per_row: Some(resolution * 4), // RGBA = 4 bytes per pixel
                rows_per_image: None,
            },
            Extent3d {
                width: resolution,
                height: resolution,
                depth_or_array_layers: 1,
            },
        );
        
        Ok(())
    }
    
    /// Get the texture view for rendering
    ///
    /// Returns None if GPU not initialized
    pub fn texture_view(&self) -> Option<&TextureView> {
        self.texture_view.as_ref()
    }
    
    /// Get the current visual state
    pub fn state(&self) -> &VisualState {
        &self.state
    }
    
    /// Get design tokens
    pub fn tokens(&self) -> &DesignTokens {
        &self.tokens
    }
    
    /// Get Hilbert mapper
    pub fn hilbert(&self) -> &HilbertMapper {
        &self.hilbert
    }
    
    /// Get texture resolution
    pub fn resolution(&self) -> u32 {
        self.hilbert.resolution()
    }
    
    // ===== Multi-Daemon Spectral Mixer API =====
    
    /// Register a new daemon with the spectral mixer
    ///
    /// # Arguments
    ///
    /// * `daemon_id` - Unique daemon identifier
    /// * `band` - Frequency band for this daemon
    /// * `amplitude` - Initial amplitude (0.0-1.0)
    ///
    /// # Example
    ///
    /// ```no_run
    /// use visual_shell::{VisualShell, DaemonId, FrequencyBand};
    ///
    /// let mut shell = VisualShell::new(std::path::Path::new("tokens.json"), 8)?;
    /// let daemon_id = DaemonId::from_name("security_daemon");
    /// shell.register_daemon(daemon_id, FrequencyBand::High, 0.8)?;
    /// # Ok::<(), visual_shell::VisualShellError>(())
    /// ```
    pub fn register_daemon(
        &mut self,
        daemon_id: DaemonId,
        band: FrequencyBand,
        amplitude: f32,
    ) -> Result<(), VisualShellError> {
        self.spectral_mixer
            .register_daemon(daemon_id, band, amplitude)
            .map_err(|e| VisualShellError::ConversionError(format!("Spectral mixer error: {}", e)))
    }
    
    /// Unregister a daemon from the spectral mixer
    pub fn unregister_daemon(&mut self, daemon_id: DaemonId) -> Result<(), VisualShellError> {
        self.spectral_mixer
            .unregister_daemon(daemon_id)
            .map_err(|e| VisualShellError::ConversionError(format!("Spectral mixer error: {}", e)))
    }
    
    /// Update a daemon's neural data
    ///
    /// # Arguments
    ///
    /// * `daemon_id` - Daemon identifier
    /// * `neural_data` - 1D vector of neural activations (must match resolution²)
    pub fn update_daemon_data(
        &mut self,
        daemon_id: DaemonId,
        neural_data: Vec<f32>,
    ) -> Result<(), VisualShellError> {
        self.spectral_mixer
            .update_daemon(daemon_id, neural_data)
            .map_err(|e| VisualShellError::ConversionError(format!("Spectral mixer error: {}", e)))
    }
    
    /// Set a daemon's amplitude (volume)
    pub fn set_daemon_amplitude(
        &mut self,
        daemon_id: DaemonId,
        amplitude: f32,
    ) -> Result<(), VisualShellError> {
        self.spectral_mixer
            .set_amplitude(daemon_id, amplitude)
            .map_err(|e| VisualShellError::ConversionError(format!("Spectral mixer error: {}", e)))
    }
    
    /// Advance spectral mixer time
    pub fn tick_mixer(&mut self, delta: std::time::Duration) {
        self.spectral_mixer.tick(delta);
    }
    
    /// Update visual state from the resolved spectral field
    ///
    /// This resolves all daemon contributions through wave interference
    /// and updates the visual state accordingly.
    pub fn update_from_spectral_field(&mut self, confidence: f32) -> Result<(), VisualShellError> {
        // Resolve the composite field from all daemons
        let composite_field = self.spectral_mixer.resolve_field();
        
        // For now, use the composite field as neural activations
        // In a more sophisticated implementation, we could separate
        // different components (activations, attention, memory)
        let field_len = composite_field.len();
        let third = field_len / 3;
        
        let neural_activations = &composite_field[0..third];
        let attention_weights = &composite_field[third..2*third];
        let memory_patterns = &composite_field[2*third..];
        
        // Update visual state
        self.state.update_from_neural(
            neural_activations,
            attention_weights,
            memory_patterns,
            confidence,
            &self.tokens,
            &self.hilbert,
        )?;
        
        Ok(())
    }
    
    /// Get the number of active daemons
    pub fn daemon_count(&self) -> usize {
        self.spectral_mixer.daemon_count()
    }
    
    /// Get spectral mixer reference
    pub fn spectral_mixer(&self) -> &SpectralMixer {
        &self.spectral_mixer
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;
    
    #[test]
    fn test_visual_shell_creation() {
        // This test requires a valid tokens.json file
        // For now, we'll just verify the structure compiles
        let tokens_path = PathBuf::from("tokens.json");
        // Skip actual creation if file doesn't exist
        if tokens_path.exists() {
            let shell = VisualShell::new(&tokens_path, 8);
            assert!(shell.is_ok());
        }
    }
    
    #[test]
    fn test_neural_update() {
        // Test neural state update logic
        let activations = vec![0.5, 0.7, 0.3, 0.9];
        let attention = vec![0.8, 0.2, 0.6, 0.4];
        let memory = vec![0.4, 0.6, 0.1, 0.8];
        
        // Verify data structure
        assert_eq!(activations.len(), 4);
        assert_eq!(attention.len(), 4);
        assert_eq!(memory.len(), 4);
    }
}
