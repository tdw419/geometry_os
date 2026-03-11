//! Integration Module - Connects VisualShell to Infinite Map Compositor
//!
//! This module provides the bridge between the VisualShell and the
//! infinite_map_rs compositor, enabling the Visual Shell to be
//! rendered as part of the Wayland compositor's output.

use crate::VisualShell;
use crate::VisualShellError;
use crate::{DaemonId, FrequencyBand};
use wgpu::{Device, Queue, TextureView, CommandEncoder, RenderPass};
use std::path::Path;

/// Visual Shell integration with compositor
///
/// Manages the connection between VisualShell and the compositor's
/// rendering pipeline, handling texture updates and rendering.
pub struct VisualShellIntegration {
    /// Visual shell instance
    shell: VisualShell,
    
    /// Path to design tokens
    tokens_path: String,
    
    /// Hilbert curve order
    hilbert_order: u32,
    
    /// Whether GPU is initialized
    gpu_initialized: bool,
}

impl VisualShellIntegration {
    /// Create a new Visual Shell integration
    ///
    /// # Arguments
    ///
    /// * `tokens_path` - Path to design tokens JSON file
    /// * `hilbert_order` - Order of Hilbert curve (default: 8)
    ///
    /// # Example
    ///
    /// ```no_run
    /// use visual_shell::VisualShellIntegration;
    ///
    /// let integration = VisualShellIntegration::new("tokens.json", 8)?;
    /// # Ok::<(), visual_shell::VisualShellError>(())
    /// ```
    pub fn new(tokens_path: &str, hilbert_order: u32) -> Result<Self, VisualShellError> {
        let shell = VisualShell::new(Path::new(tokens_path), hilbert_order)?;
        
        Ok(Self {
            shell,
            tokens_path: tokens_path.to_string(),
            hilbert_order,
            gpu_initialized: false,
        })
    }
    
    /// Initialize GPU resources
    ///
    /// Must be called before rendering
    pub fn init_gpu(&mut self, device: &std::sync::Arc<Device>, queue: &std::sync::Arc<Queue>) -> Result<(), VisualShellError> {
        self.shell.init_gpu(device, queue)?;
        self.gpu_initialized = true;
        Ok(())
    }
    
    /// Update visual state from neural data
    ///
    /// This method should be called whenever the neural state changes
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
        self.shell.update_from_neural(
            neural_activations,
            attention_weights,
            memory_patterns,
            confidence,
        )
    }
    
    /// Update the shell texture on the GPU
    ///
    /// Should be called after update_from_neural and before a frame is rendered.
    pub fn update_texture(&mut self) -> Result<(), VisualShellError> {
        if !self.gpu_initialized {
            return Err(VisualShellError::TextureError(
                "GPU not initialized. Call init_gpu() first.".to_string()
            ));
        }
        self.shell.render()
    }

    /// Render the visual shell
    ///
    /// Must call [`init_gpu`] first
    ///
    /// # Arguments
    ///
    /// * `encoder` - WGPU command encoder for recording commands
    /// * `render_pass` - Render pass to draw into
    pub fn render(
        &mut self,
        _encoder: &mut CommandEncoder,
        _render_pass: &mut RenderPass,
    ) -> Result<(), VisualShellError> {
        if !self.gpu_initialized {
            return Err(VisualShellError::TextureError(
                "GPU not initialized. Call init_gpu() first.".to_string()
            ));
        }
        
        // Update texture with current visual state
        self.shell.render()?;
        
        // Get texture view
        if let Some(_texture_view) = self.shell.texture_view() {
            // In a full implementation, we would bind the texture and draw it here
            // For now, we just ensure the texture is updated
            // The actual rendering would be done by the compositor's renderer
        }
        
        Ok(())
    }
    
    /// Get the texture view for rendering
    ///
    /// Returns None if GPU not initialized
    pub fn texture_view(&self) -> Option<&TextureView> {
        self.shell.texture_view()
    }
    
    /// Get texture resolution
    pub fn resolution(&self) -> u32 {
        self.shell.resolution()
    }
    
    /// Check if GPU is initialized
    pub fn is_gpu_initialized(&self) -> bool {
        self.gpu_initialized
    }

    // ===== Multi-Daemon Integration Wrappers =====

    /// Register a daemon via the integration layer
    pub fn register_daemon(
        &mut self,
        daemon_id: DaemonId,
        band: FrequencyBand,
        amplitude: f32,
    ) -> Result<(), VisualShellError> {
        self.shell.register_daemon(daemon_id, band, amplitude)
    }

    /// Unregister a daemon via the integration layer
    pub fn unregister_daemon(&mut self, daemon_id: DaemonId) -> Result<(), VisualShellError> {
        self.shell.unregister_daemon(daemon_id)
    }

    /// Update daemon data via the integration layer
    pub fn update_daemon_data(
        &mut self,
        daemon_id: DaemonId,
        neural_data: Vec<f32>,
    ) -> Result<(), VisualShellError> {
        self.shell.update_daemon_data(daemon_id, neural_data)
    }

    /// Set daemon amplitude via the integration layer
    pub fn set_daemon_amplitude(
        &mut self,
        daemon_id: DaemonId,
        amplitude: f32,
    ) -> Result<(), VisualShellError> {
        self.shell.set_daemon_amplitude(daemon_id, amplitude)
    }

    /// Update from spectral field instead of raw neural vectors
    pub fn update_from_spectral_field(&mut self, confidence: f32) -> Result<(), VisualShellError> {
        self.shell.update_from_spectral_field(confidence)
    }

    /// Tick the spectral mixer
    pub fn tick_mixer(&mut self, delta: std::time::Duration) {
        self.shell.tick_mixer(delta)
    }

    /// Get number of active daemons
    pub fn daemon_count(&self) -> usize {
        self.shell.daemon_count()
    }
    
    /// Reload design tokens from file
    ///
    /// Useful for hot-reloading design changes
    pub fn reload_tokens(&mut self) -> Result<(), VisualShellError> {
        let new_shell = VisualShell::new(Path::new(&self.tokens_path), self.hilbert_order)?;
        
        if self.gpu_initialized {
            // Note: In a real implementation, we'd need to preserve GPU resources
            // For now, we just replace the shell and mark GPU as uninitialized
            self.shell = new_shell;
            self.gpu_initialized = false;
        } else {
            self.shell = new_shell;
        }
        
        Ok(())
    }
}

/// Builder pattern for VisualShellIntegration
pub struct VisualShellIntegrationBuilder {
    tokens_path: Option<String>,
    hilbert_order: Option<u32>,
}

impl VisualShellIntegrationBuilder {
    /// Create a new builder
    pub fn new() -> Self {
        Self {
            tokens_path: None,
            hilbert_order: None,
        }
    }
    
    /// Set the tokens path
    pub fn tokens_path(mut self, path: &str) -> Self {
        self.tokens_path = Some(path.to_string());
        self
    }
    
    /// Set the Hilbert curve order
    pub fn hilbert_order(mut self, order: u32) -> Self {
        self.hilbert_order = Some(order);
        self
    }
    
    /// Build the integration
    ///
    /// # Errors
    ///
    /// Returns error if required fields are missing or if shell creation fails
    pub fn build(self) -> Result<VisualShellIntegration, VisualShellError> {
        let tokens_path = self.tokens_path.ok_or_else(|| {
            VisualShellError::TokenLoadError("tokens_path is required".to_string())
        })?;
        
        let hilbert_order = self.hilbert_order.unwrap_or(8);
        
        VisualShellIntegration::new(&tokens_path, hilbert_order)
    }
}

impl Default for VisualShellIntegrationBuilder {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_builder_pattern() {
        let builder = VisualShellIntegrationBuilder::new()
            .tokens_path("tokens.json")
            .hilbert_order(8);
        
        // We can't actually build without a valid tokens file,
        // but we can verify the builder compiles
        assert!(builder.tokens_path.is_some());
        assert_eq!(builder.hilbert_order, Some(8));
    }
    
    #[test]
    fn test_integration_creation_with_file() {
        // This test requires a valid tokens.json file
        let tokens_path = "tokens.json";
        
        if std::path::Path::new(tokens_path).exists() {
            let integration = VisualShellIntegration::new(tokens_path, 8);
            assert!(integration.is_ok());
            
            let integration = integration.unwrap();
            assert_eq!(integration.resolution(), 256); // 2^8
            assert!(!integration.is_gpu_initialized());
        }
    }
}
