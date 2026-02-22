//! Visual State - Represents the current visual state derived from neural data
//!
//! This module defines the VisualState structure that holds the current
//! visual representation of the neural system, including nodes, connections,
//! and morphological properties.

use crate::design_tokens::DesignTokens;
use crate::hilbert_mapper::HilbertMapper;
use crate::VisualShellError;
use serde::{Deserialize, Serialize};

/// Represents a neural node in the visual shell
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NeuralNode {
    /// Unique identifier
    pub id: u32,
    
    /// Position in 2D space (x, y) in range [0.0, 1.0]
    pub position: (f32, f32),
    
    /// Activation level (0.0 to 1.0)
    pub activation: f32,
    
    /// Entropy level (0.0 to 1.0)
    pub entropy: f32,
    
    /// Color (RGB)
    pub color: (u8, u8, u8),
    
    /// Size in pixels
    pub size: f32,
    
    /// Opacity (0.0 to 1.0)
    pub opacity: f32,
    
    /// Cluster ID
    pub cluster_id: u32,
    
    /// Last update timestamp
    pub last_update: u64,
}

impl NeuralNode {
    /// Create a new neural node
    pub fn new(id: u32, position: (f32, f32)) -> Self {
        Self {
            id,
            position,
            activation: 0.0,
            entropy: 0.0,
            color: (45, 52, 54),
            size: 16.0,
            opacity: 0.3,
            cluster_id: 0,
            last_update: 0,
        }
    }
    
    /// Update node properties from neural data
    pub fn update(&mut self, activation: f32, entropy: f32, tokens: &DesignTokens) {
        self.activation = activation.clamp(0.0, 1.0);
        self.entropy = entropy.clamp(0.0, 1.0);
        
        // Update color based on activation
        self.color = tokens.get_activation_color(self.activation);
        
        // Update size based on activation
        self.size = tokens.get_activation_size(self.activation);
        
        // Update opacity based on activation
        self.opacity = tokens.get_activation_opacity(self.activation);
        
        // Update timestamp
        self.last_update = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap()
            .as_secs();
    }
}

/// Represents a synaptic connection between nodes
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SynapticConnection {
    /// Source node ID
    pub source_id: u32,
    
    /// Target node ID
    pub target_id: u32,
    
    /// Connection strength (0.0 to 1.0)
    pub strength: f32,
    
    /// Active state
    pub active: bool,
    
    /// Color (RGB)
    pub color: (u8, u8, u8),
    
    /// Opacity (0.0 to 1.0)
    pub opacity: f32,
}

impl SynapticConnection {
    /// Create a new synaptic connection
    pub fn new(source_id: u32, target_id: u32) -> Self {
        Self {
            source_id,
            target_id,
            strength: 0.0,
            active: false,
            color: (108, 92, 231),
            opacity: 0.3,
        }
    }
    
    /// Update connection from neural data
    pub fn update(&mut self, strength: f32, active: bool, tokens: &DesignTokens) {
        self.strength = strength.clamp(0.0, 1.0);
        self.active = active;
        
        // Update color based on activity
        if self.active {
            let color_hex = &tokens.color.synaptic.active;
            if let Ok(rgb) = DesignTokens::parse_hex_color(color_hex) {
                self.color = rgb;
            }
            self.opacity = 0.6;
        } else {
            let color_hex = &tokens.color.synaptic.inactive;
            if let Ok(rgb) = DesignTokens::parse_hex_color(color_hex) {
                self.color = rgb;
            }
            self.opacity = 0.3;
        }
    }
}

/// Morphological properties for visual transitions
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Morphology {
    /// Transition progress (0.0 to 1.0)
    pub transition_progress: f32,
    
    /// Morphological velocity
    pub velocity: (f32, f32),
    
    /// Acceleration
    pub acceleration: (f32, f32),
    
    /// Target state
    pub target_state: Option<Vec<f32>>,
}

impl Default for Morphology {
    fn default() -> Self {
        Self {
            transition_progress: 1.0,
            velocity: (0.0, 0.0),
            acceleration: (0.0, 0.0),
            target_state: None,
        }
    }
}

/// Visual state of the entire system
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct VisualState {
    /// Neural nodes
    pub nodes: Vec<NeuralNode>,
    
    /// Synaptic connections
    pub connections: Vec<SynapticConnection>,
    
    /// Morphological properties
    pub morphology: Morphology,
    
    /// Overall confidence score (0.0 to 1.0)
    pub confidence: f32,
    
    /// Last update timestamp (millis since epoch)
    pub last_update: u64,
    
    /// State version (for change detection)
    pub version: u64,
}

impl VisualState {
    /// Create a new visual state
    pub fn new() -> Self {
        Self {
            nodes: Vec::new(),
            connections: Vec::new(),
            morphology: Morphology::default(),
            confidence: 0.0,
            last_update: Self::current_timestamp(),
            version: 0,
        }
    }
    
    /// Get current timestamp in milliseconds
    fn current_timestamp() -> u64 {
        std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .unwrap_or_default()
            .as_millis() as u64
    }
    
    /// Update visual state from neural data
    ///
    /// # Arguments
    ///
    /// * `neural_activations` - 1D vector of neural activations
    /// * `attention_weights` - 1D vector of attention weights
    /// * `memory_patterns` - 1D vector of memory patterns
    /// * `confidence` - Overall confidence score (0.0 to 1.0)
    /// * `tokens` - Design tokens for visual mapping
    /// * `hilbert` - Hilbert mapper for 1D->2D conversion
    pub fn update_from_neural(
        &mut self,
        neural_activations: &[f32],
        attention_weights: &[f32],
        memory_patterns: &[f32],
        confidence: f32,
        tokens: &DesignTokens,
        hilbert: &HilbertMapper,
    ) -> Result<(), VisualShellError> {
        self.confidence = confidence.clamp(0.0, 1.0);
        
        // Ensure we have enough nodes
        let num_nodes = neural_activations.len().max(attention_weights.len());
        if self.nodes.len() < num_nodes {
            for i in self.nodes.len()..num_nodes {
                let (x, y) = hilbert.index_to_coord(i as u32);
                let position = (
                    x as f32 / hilbert.resolution() as f32,
                    y as f32 / hilbert.resolution() as f32,
                );
                self.nodes.push(NeuralNode::new(i as u32, position));
            }
        }
        
        // Update nodes
        for (i, node) in self.nodes.iter_mut().enumerate().take(num_nodes) {
            let activation = if i < neural_activations.len() {
                neural_activations[i]
            } else {
                0.0
            };
            
            // Calculate entropy from memory patterns
            let entropy = if i < memory_patterns.len() {
                memory_patterns[i].abs().min(1.0)
            } else {
                0.0
            };
            
            node.update(activation, entropy, tokens);
        }
        
        // Update connections based on attention weights
        self.update_connections(attention_weights, tokens)?;
        
        // Update morphology
        self.update_morphology();
        
        // Update timestamp and version
        self.last_update = Self::current_timestamp();
        self.version += 1;
        
        Ok(())
    }
    
    // ... (previous code)

    /// Update synaptic connections from attention weights
    fn update_connections(
        &mut self,
        attention_weights: &[f32],
        tokens: &DesignTokens,
    ) -> Result<(), VisualShellError> {
        // Create connections based on attention weights
        // This is a simplified approach - in practice, you'd use a more sophisticated graph
        
        let num_connections = if self.nodes.is_empty() {
             0
        } else {
             attention_weights.len().min(self.nodes.len().saturating_sub(1))
        };
        
        // Ensure we have enough connections
        if self.connections.len() < num_connections {
            for i in self.connections.len()..num_connections {
                self.connections.push(SynapticConnection::new(i as u32, (i + 1) as u32));
            }
        }
        
        // Update connections
        for (i, conn) in self.connections.iter_mut().enumerate().take(num_connections) {
            if i < attention_weights.len() {
                let strength = attention_weights[i];
                let active = strength > 0.5;
                conn.update(strength, active, tokens);
            }
        }
        
        Ok(())
    }
    
    /// Update morphological properties
    fn update_morphology(&mut self) {
        // Simple spring physics for smooth transitions
        let damping = 0.95;
        let stiffness = 0.1;
        
        // Update velocity
        self.morphology.velocity.0 *= damping;
        self.morphology.velocity.1 *= damping;
        
        // Update acceleration based on target state
        if let Some(target) = &self.morphology.target_state {
            if target.len() >= 2 {
                self.morphology.acceleration.0 = (target[0] - self.morphology.velocity.0) * stiffness;
                self.morphology.acceleration.1 = (target[1] - self.morphology.velocity.1) * stiffness;
            }
        }
        
        // Update velocity with acceleration
        self.morphology.velocity.0 += self.morphology.acceleration.0;
        self.morphology.velocity.1 += self.morphology.acceleration.1;
        
        // Update transition progress
        self.morphology.transition_progress = (self.morphology.transition_progress + 0.01).min(1.0);
    }
    
    /// Get the time since last update
    pub fn time_since_update(&self) -> std::time::Duration {
        let now = Self::current_timestamp();
        if now >= self.last_update {
            std::time::Duration::from_millis(now - self.last_update)
        } else {
            std::time::Duration::from_millis(0)
        }
    }
    
    /// Get the state version (for change detection)
    pub fn version(&self) -> u64 {
        self.version
    }
    
    /// Check if state has changed since given version
    pub fn has_changed(&self, version: u64) -> bool {
        self.version > version
    }
}

impl Default for VisualState {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::design_tokens::DesignTokens;
    use crate::hilbert_mapper::HilbertMapper;
    
    #[test]
    fn test_neural_node_creation() {
        let node = NeuralNode::new(0, (0.5, 0.5));
        assert_eq!(node.id, 0);
        assert_eq!(node.position, (0.5, 0.5));
        assert_eq!(node.activation, 0.0);
    }
    
    #[test]
    fn test_neural_node_update() {
        let mut node = NeuralNode::new(0, (0.5, 0.5));
        
        // Create minimal tokens for testing
        let tokens_json = r##"{
            "color": {
                "background": {"primary": "#050505", "secondary": "#0a0a0f", "glass": {"base": "rgba(10, 10, 15, 0.6)", "border": "rgba(255, 255, 255, 0.1)", "blur": "20px"}},
                "neural": {
                    "high_activity": {"primary": "#ff4d4d", "secondary": "#ff8c00", "glow": "rgba(255, 77, 77, 0.8)"},
                    "medium_activity": {"primary": "#ffd700", "secondary": "#ffaa00", "glow": "rgba(255, 215, 0, 0.6)"},
                    "low_activity": {"primary": "#4169e1", "secondary": "#00bfff", "glow": "rgba(65, 105, 225, 0.5)"},
                    "idle": {"primary": "#2d3436", "secondary": "#636e72", "glow": "rgba(45, 52, 54, 0.3)"}
                },
                "synaptic": {"active": "rgba(0, 255, 136, 0.6)", "inactive": "rgba(108, 92, 231, 0.3)", "threshold": "rgba(255, 255, 255, 0.8)"},
                "cyberpunk": {"neon_pink": "#ff00ff", "neon_cyan": "#00ffff", "neon_green": "#00ff88", "neon_yellow": "#ffff00"}
            },
            "typography": {
                "font_family": {"primary": "Inter", "secondary": "Outfit", "mono": "JetBrains Mono"},
                "font_size": {"xs": "10px", "sm": "12px", "base": "14px", "md": "16px", "lg": "18px", "xl": "24px", "2xl": "32px", "3xl": "48px"},
                "font_weight": {"light": 300, "regular": 400, "medium": 500, "semibold": 600, "bold": 700},
                "line_height": {"tight": "1.2", "normal": "1.5", "relaxed": "1.75"}
            },
            "spacing": {"xs": "4px", "sm": "8px", "md": "16px", "lg": "24px", "xl": "32px", "2xl": "48px", "3xl": "64px"},
            "layout": {
                "container": {"max_width": "1920px", "padding": "24px"},
                "grid": {"columns": 12, "gap": "16px"},
                "neural_node": {"min_size": "8px", "max_size": "64px", "default_size": "16px"}
            },
            "effects": {
                "glow": {"intensity": {"subtle": 0.3, "normal": 0.6, "strong": 0.9}, "blur": {"sm": "4px", "md": "8px", "lg": "16px"}},
                "glassmorphism": {"backdrop_filter": "blur(20px)", "border_radius": "12px", "shadow": "0 8px 32px rgba(0, 0, 0, 0.37)"},
                "morphology": {"transition_duration": "300ms", "transition_easing": "cubic-bezier(0.4, 0, 0.2, 1)"}
            },
            "neural_mappings": {
                "activation_to_color": {"threshold_high": 0.8, "threshold_medium": 0.5, "threshold_low": 0.2, "mapping": {}},
                "activation_to_size": {"min": 8.0, "max": 64.0, "multiplier": 56.0},
                "activation_to_opacity": {"min": 0.3, "max": 1.0, "multiplier": 0.7},
                "entropy_to_color": {"high": "$color.neural.high_activity", "medium": "$color.neural.medium_activity", "low": "$color.neural.low_activity"}
            },
            "hilbert_curve": {"order": 8, "resolution": 256, "mapping": {"type": "space_filling", "preserve_locality": true}},
            "pixelrts": {"format": "png", "compression": "high", "quality": 100, "dimensions": {"width": 1920, "height": 1080}, "channels": {"red": "activation", "green": "entropy", "blue": "cluster_id", "alpha": "confidence"}}
        }"##;
        
        let tokens: DesignTokens = serde_json::from_str(tokens_json).unwrap();
        node.update(0.9, 0.5, &tokens);
        
        assert!(node.activation > 0.8);
        assert_eq!(node.color, (255, 77, 77)); // High activity color
    }
    
    #[test]
    fn test_visual_state_creation() {
        let state = VisualState::new();
        assert_eq!(state.nodes.len(), 0);
        assert_eq!(state.connections.len(), 0);
        assert_eq!(state.confidence, 0.0);
    }
    
    #[test]
    fn test_synaptic_connection_creation() {
        let conn = SynapticConnection::new(0, 1);
        assert_eq!(conn.source_id, 0);
        assert_eq!(conn.target_id, 1);
        assert_eq!(conn.strength, 0.0);
        assert_eq!(conn.active, false);
    }
}
