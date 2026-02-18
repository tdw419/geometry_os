//! Design Tokens - Mapping neural values to visual properties
//!
//! This module implements the design token system that bridges
//! neural state to visual output. Tokens are loaded from JSON
//! and provide semantic mappings for colors, typography, spacing,
//! and effects.

use serde::{Deserialize, Serialize};
use std::path::Path;
use std::collections::HashMap;
use crate::VisualShellError;

/// Design token container
///
/// Holds all design tokens for the Visual Shell
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DesignTokens {
    /// Color tokens
    pub color: ColorTokens,
    
    /// Typography tokens
    pub typography: TypographyTokens,
    
    /// Spacing tokens
    pub spacing: SpacingTokens,
    
    /// Layout tokens
    pub layout: LayoutTokens,
    
    /// Effects tokens
    pub effects: EffectsTokens,
    
    /// Neural mapping configuration
    pub neural_mappings: NeuralMappings,
    
    /// Hilbert curve configuration
    pub hilbert_curve: HilbertCurveConfig,
    
    /// PixelRTS configuration
    pub pixelrts: PixelRTSConfig,
}

/// Color tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ColorTokens {
    pub background: BackgroundColors,
    pub neural: NeuralColors,
    pub synaptic: SynapticColors,
    pub cyberpunk: CyberpunkColors,
}

/// Background color tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BackgroundColors {
    pub primary: String,
    pub secondary: String,
    pub glass: GlassColors,
}

/// Glass effect colors
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlassColors {
    pub base: String,
    pub border: String,
    pub blur: String,
}

/// Neural state colors
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NeuralColors {
    pub high_activity: ActivityColors,
    pub medium_activity: ActivityColors,
    pub low_activity: ActivityColors,
    pub idle: ActivityColors,
}

/// Activity level colors
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ActivityColors {
    pub primary: String,
    pub secondary: String,
    pub glow: String,
}

/// Synaptic connection colors
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SynapticColors {
    pub active: String,
    pub inactive: String,
    pub threshold: String,
}

/// Cyberpunk accent colors
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct CyberpunkColors {
    pub neon_pink: String,
    pub neon_cyan: String,
    pub neon_green: String,
    pub neon_yellow: String,
}

/// Typography tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct TypographyTokens {
    pub font_family: FontFamily,
    pub font_size: FontSizes,
    pub font_weight: FontWeights,
    pub line_height: LineHeights,
}

/// Font family tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FontFamily {
    pub primary: String,
    pub secondary: String,
    pub mono: String,
}

/// Font size tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FontSizes {
    pub xs: String,
    pub sm: String,
    pub base: String,
    pub md: String,
    pub lg: String,
    pub xl: String,
    #[serde(rename = "2xl")]
    pub xl2: String,
    #[serde(rename = "3xl")]
    pub xl3: String,
}

/// Font weight tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct FontWeights {
    pub light: u32,
    pub regular: u32,
    pub medium: u32,
    pub semibold: u32,
    pub bold: u32,
}

/// Line height tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LineHeights {
    pub tight: String,
    pub normal: String,
    pub relaxed: String,
}

/// Spacing tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct SpacingTokens {
    pub xs: String,
    pub sm: String,
    pub md: String,
    pub lg: String,
    pub xl: String,
    #[serde(rename = "2xl")]
    pub xl2: String,
    #[serde(rename = "3xl")]
    pub xl3: String,
}

/// Layout tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct LayoutTokens {
    pub container: ContainerLayout,
    pub grid: GridLayout,
    pub neural_node: NeuralNodeLayout,
}

/// Container layout tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ContainerLayout {
    #[serde(rename = "max_width")]
    pub max_width: String,
    pub padding: String,
}

/// Grid layout tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GridLayout {
    pub columns: u32,
    pub gap: String,
}

/// Neural node layout tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NeuralNodeLayout {
    #[serde(rename = "min_size")]
    pub min_size: String,
    #[serde(rename = "max_size")]
    pub max_size: String,
    #[serde(rename = "default_size")]
    pub default_size: String,
}

/// Effects tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EffectsTokens {
    pub glow: GlowEffects,
    pub glassmorphism: GlassmorphismEffects,
    pub morphology: MorphologyEffects,
}

/// Glow effect tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlowEffects {
    pub intensity: IntensityLevels,
    pub blur: BlurLevels,
}

/// Intensity levels
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct IntensityLevels {
    pub subtle: f32,
    pub normal: f32,
    pub strong: f32,
}

/// Blur levels
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct BlurLevels {
    pub sm: String,
    pub md: String,
    pub lg: String,
}

/// Glassmorphism effect tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct GlassmorphismEffects {
    #[serde(rename = "backdrop_filter")]
    pub backdrop_filter: String,
    #[serde(rename = "border_radius")]
    pub border_radius: String,
    pub shadow: String,
}

/// Morphology effect tokens
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MorphologyEffects {
    #[serde(rename = "transition_duration")]
    pub transition_duration: String,
    #[serde(rename = "transition_easing")]
    pub transition_easing: String,
}

/// Neural mapping configuration
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct NeuralMappings {
    #[serde(rename = "activation_to_color")]
    pub activation_to_color: ActivationColorMapping,
    #[serde(rename = "activation_to_size")]
    pub activation_to_size: ActivationSizeMapping,
    #[serde(rename = "activation_to_opacity")]
    pub activation_to_opacity: ActivationOpacityMapping,
    #[serde(rename = "entropy_to_color")]
    pub entropy_to_color: EntropyColorMapping,
}

/// Activation to color mapping
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ActivationColorMapping {
    #[serde(rename = "threshold_high")]
    pub threshold_high: f32,
    #[serde(rename = "threshold_medium")]
    pub threshold_medium: f32,
    #[serde(rename = "threshold_low")]
    pub threshold_low: f32,
    pub mapping: HashMap<String, String>,
}

/// Activation to size mapping
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ActivationSizeMapping {
    pub min: f32,
    pub max: f32,
    pub multiplier: f32,
}

/// Activation to opacity mapping
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ActivationOpacityMapping {
    pub min: f32,
    pub max: f32,
    pub multiplier: f32,
}

/// Entropy to color mapping
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct EntropyColorMapping {
    pub high: String,
    pub medium: String,
    pub low: String,
}

/// Hilbert curve configuration
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct HilbertCurveConfig {
    pub order: u32,
    pub resolution: u32,
    pub mapping: MappingConfig,
}

/// Mapping configuration
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct MappingConfig {
    #[serde(rename = "type")]
    pub mapping_type: String,
    #[serde(rename = "preserve_locality")]
    pub preserve_locality: bool,
}

/// PixelRTS configuration
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PixelRTSConfig {
    pub format: String,
    pub compression: String,
    pub quality: u32,
    pub dimensions: DimensionsConfig,
    pub channels: ChannelsConfig,
}

/// Dimensions configuration
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct DimensionsConfig {
    pub width: u32,
    pub height: u32,
}

/// Channels configuration
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct ChannelsConfig {
    pub red: String,
    pub green: String,
    pub blue: String,
    pub alpha: String,
}

/// Individual color token
#[derive(Debug, Clone)]
pub struct ColorToken {
    pub hex: String,
    pub rgb: (u8, u8, u8),
    pub rgba: (u8, u8, u8, u8),
}

/// Individual typography token
#[derive(Debug, Clone)]
pub struct TypographyToken {
    pub font: String,
    pub size: f32,
    pub weight: u32,
    pub line_height: f32,
}

/// Individual spacing token
#[derive(Debug, Clone)]
pub struct SpacingToken {
    pub value: f32,
    pub unit: String,
}

impl DesignTokens {
    /// Load design tokens from a JSON file
    pub fn load(path: &Path) -> Result<Self, VisualShellError> {
        let content = std::fs::read_to_string(path)
            .map_err(|e| VisualShellError::TokenLoadError(format!("Failed to read file: {}", e)))?;
        
        let tokens: DesignTokens = serde_json::from_str(&content)
            .map_err(|e| VisualShellError::TokenFormatError(format!("Failed to parse JSON: {}", e)))?;
        
        Ok(tokens)
    }
    
    /// Parse a hex color string to RGB
    pub fn parse_hex_color(hex: &str) -> Result<(u8, u8, u8), VisualShellError> {
        let hex = hex.trim_start_matches('#');
        
        if hex.len() != 6 {
            return Err(VisualShellError::TokenFormatError(
                format!("Invalid hex color: {}", hex)
            ));
        }
        
        let r = u8::from_str_radix(&hex[0..2], 16)
            .map_err(|e| VisualShellError::TokenFormatError(format!("Invalid hex: {}", e)))?;
        let g = u8::from_str_radix(&hex[2..4], 16)
            .map_err(|e| VisualShellError::TokenFormatError(format!("Invalid hex: {}", e)))?;
        let b = u8::from_str_radix(&hex[4..6], 16)
            .map_err(|e| VisualShellError::TokenFormatError(format!("Invalid hex: {}", e)))?;
        
        Ok((r, g, b))
    }
    
    /// Get color for activation level
    pub fn get_activation_color(&self, activation: f32) -> (u8, u8, u8) {
        if activation >= self.neural_mappings.activation_to_color.threshold_high {
            Self::parse_hex_color(&self.color.neural.high_activity.primary).unwrap_or((255, 77, 77))
        } else if activation >= self.neural_mappings.activation_to_color.threshold_medium {
            Self::parse_hex_color(&self.color.neural.medium_activity.primary).unwrap_or((255, 215, 0))
        } else if activation >= self.neural_mappings.activation_to_color.threshold_low {
            Self::parse_hex_color(&self.color.neural.low_activity.primary).unwrap_or((65, 105, 225))
        } else {
            Self::parse_hex_color(&self.color.neural.idle.primary).unwrap_or((45, 52, 54))
        }
    }
    
    /// Get size for activation level
    pub fn get_activation_size(&self, activation: f32) -> f32 {
        let mapping = &self.neural_mappings.activation_to_size;
        mapping.min + (activation * mapping.multiplier).min(mapping.max - mapping.min)
    }
    
    /// Get opacity for activation level
    pub fn get_activation_opacity(&self, activation: f32) -> f32 {
        let mapping = &self.neural_mappings.activation_to_opacity;
        mapping.min + (activation * mapping.multiplier).min(mapping.max - mapping.min)
    }
}

impl ColorToken {
    /// Create a new color token from hex string
    pub fn from_hex(hex: &str) -> Result<Self, VisualShellError> {
        let rgb = DesignTokens::parse_hex_color(hex)?;
        Ok(Self {
            hex: hex.to_string(),
            rgb,
            rgba: (rgb.0, rgb.1, rgb.2, 255),
        })
    }
    
    /// Convert to RGBA float array (0.0-1.0)
    pub fn to_rgba_float(&self) -> [f32; 4] {
        [
            self.rgb.0 as f32 / 255.0,
            self.rgb.1 as f32 / 255.0,
            self.rgb.2 as f32 / 255.0,
            self.rgba.3 as f32 / 255.0,
        ]
    }
}

impl TypographyToken {
    /// Create a new typography token
    pub fn new(font: String, size: f32, weight: u32, line_height: f32) -> Self {
        Self {
            font,
            size,
            weight,
            line_height,
        }
    }
}

impl SpacingToken {
    /// Create a new spacing token
    pub fn new(value: f32, unit: String) -> Self {
        Self { value, unit }
    }
    
    /// Parse spacing from string (e.g., "16px")
    pub fn from_string(s: &str) -> Result<Self, VisualShellError> {
        let s = s.trim();
        let (value_str, unit) = if s.ends_with("px") {
            (&s[..s.len()-2], "px")
        } else if s.ends_with("rem") {
            (&s[..s.len()-3], "rem")
        } else if s.ends_with("em") {
            (&s[..s.len()-2], "em")
        } else {
            (s, "px")
        };
        
        let value = value_str.parse::<f32>()
            .map_err(|e| VisualShellError::TokenFormatError(format!("Invalid spacing: {}", e)))?;
        
        Ok(Self::new(value, unit.to_string()))
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::path::PathBuf;
    
    #[test]
    fn test_hex_color_parsing() {
        let color = DesignTokens::parse_hex_color("#ff0000").unwrap();
        assert_eq!(color, (255, 0, 0));
        
        let color = DesignTokens::parse_hex_color("#00ff00").unwrap();
        assert_eq!(color, (0, 255, 0));
        
        let color = DesignTokens::parse_hex_color("#0000ff").unwrap();
        assert_eq!(color, (0, 0, 255));
    }
    
    #[test]
    fn test_color_token_creation() {
        let token = ColorToken::from_hex("#ff4d4d").unwrap();
        assert_eq!(token.rgb, (255, 77, 77));
        assert_eq!(token.rgba, (255, 77, 77, 255));
        
        let rgba = token.to_rgba_float();
        assert!((rgba[0] - 1.0).abs() < 0.001);
        assert!((rgba[1] - 0.302).abs() < 0.001);
        assert!((rgba[2] - 0.302).abs() < 0.001);
    }
    
    #[test]
    fn test_spacing_token_parsing() {
        let token = SpacingToken::from_string("16px").unwrap();
        assert_eq!(token.value, 16.0);
        assert_eq!(token.unit, "px");
        
        let token = SpacingToken::from_string("1.5rem").unwrap();
        assert_eq!(token.value, 1.5);
        assert_eq!(token.unit, "rem");
    }
}
