//! PixelRTS Bridge - Generates PixelRTS v2 textures from VisualState
//!
//! This module implements the bridge between VisualState and PixelRTS v2
//! texture format. It converts the visual state into PNG-compatible RGBA
//! texture data that can be rendered by the compositor.

use crate::design_tokens::DesignTokens;
use crate::visual_state::VisualState;
use crate::VisualShellError;
use bytemuck::{Pod, Zeroable};

/// PixelRTS Bridge for texture generation
#[derive(Debug, Clone)]
pub struct PixelRTSBridge {
    /// Background color (RGB)
    _background_color: (u8, u8, u8),
    
    /// Glass effect parameters
    _glass_blur: u32,
    glass_opacity: f32,
}

/// RGBA pixel for texture generation
#[repr(C)]
#[derive(Debug, Clone, Copy, Pod, Zeroable)]
pub struct RgbaPixel {
    pub r: u8,
    pub g: u8,
    pub b: u8,
    pub a: u8,
}

impl RgbaPixel {
    /// Create a new RGBA pixel
    pub fn new(r: u8, g: u8, b: u8, a: u8) -> Self {
        Self { r, g, b, a }
    }
    
    /// Create from RGB with full opacity
    pub fn from_rgb(r: u8, g: u8, b: u8) -> Self {
        Self::new(r, g, b, 255)
    }
    
    /// Create from RGB with specified opacity
    pub fn from_rgb_opacity(r: u8, g: u8, b: u8, opacity: f32) -> Self {
        let a = (opacity * 255.0) as u8;
        Self::new(r, g, b, a)
    }
    
    /// Blend two pixels (alpha compositing)
    pub fn blend(&self, other: &RgbaPixel) -> RgbaPixel {
        let src_alpha = self.a as f32 / 255.0;
        let dst_alpha = other.a as f32 / 255.0;
        
        let out_alpha = src_alpha + dst_alpha * (1.0 - src_alpha);
        
        if out_alpha == 0.0 {
            return RgbaPixel::new(0, 0, 0, 0);
        }
        
        let r = (self.r as f32 * src_alpha + other.r as f32 * dst_alpha * (1.0 - src_alpha)) / out_alpha;
        let g = (self.g as f32 * src_alpha + other.g as f32 * dst_alpha * (1.0 - src_alpha)) / out_alpha;
        let b = (self.b as f32 * src_alpha + other.b as f32 * dst_alpha * (1.0 - src_alpha)) / out_alpha;
        
        RgbaPixel::new(r as u8, g as u8, b as u8, out_alpha as u8)
    }
}

impl Default for PixelRTSBridge {
    fn default() -> Self {
        Self::new()
    }
}

impl PixelRTSBridge {
    /// Create a new PixelRTS Bridge
    pub fn new() -> Self {
        Self {
            _background_color: (5, 5, 5), // #050505 from design tokens
            _glass_blur: 20,
            glass_opacity: 0.6,
        }
    }
    
    /// Generate PixelRTS texture from visual state
    ///
    /// # Arguments
    ///
    /// * `state` - Current visual state
    /// * `tokens` - Design tokens for visual mapping
    ///
    /// # Returns
    ///
    /// RGBA texture data as byte vector
    ///
    /// # Errors
    ///
    /// Returns error if texture generation fails
    pub fn generate_texture(
        &self,
        state: &VisualState,
        tokens: &DesignTokens,
    ) -> Result<Vec<u8>, VisualShellError> {
        // Parse background color
        let bg_hex = &tokens.color.background.primary;
        let bg_rgb = DesignTokens::parse_hex_color(bg_hex).unwrap_or((5, 5, 5));
        
        // Determine texture size (use Hilbert resolution or default)
        let resolution = 256u32; // Default to 256x256
        
        // Create texture buffer
        let mut texture = vec![RgbaPixel::from_rgb(bg_rgb.0, bg_rgb.1, bg_rgb.2); (resolution * resolution) as usize];
        
        // Render neural nodes
        self.render_nodes(&mut texture, state, resolution)?;
        
        // Render synaptic connections
        self.render_connections(&mut texture, state, resolution)?;
        
        // Apply glassmorphism effect
        self.apply_glassmorphism(&mut texture, resolution, tokens)?;
        
        // Convert to byte vector
        let byte_data = bytemuck::cast_slice::<RgbaPixel, u8>(&texture).to_vec();
        
        Ok(byte_data)
    }
    
    /// Render neural nodes to texture
    fn render_nodes(
        &self,
        texture: &mut [RgbaPixel],
        state: &VisualState,
        resolution: u32,
    ) -> Result<(), VisualShellError> {
        for node in &state.nodes {
            // Convert normalized position to pixel coordinates
            let px = (node.position.0 * resolution as f32) as u32;
            let py = (node.position.1 * resolution as f32) as u32;
            
            // Calculate node radius based on size
            let radius = (node.size / 2.0) as u32;
            
            // Render node as a circle with glow
            self.render_circle(texture, px, py, radius, node.color, node.opacity, resolution)?;
            
            // Render glow effect
            self.render_glow(texture, px, py, radius * 2, node.color, node.opacity * 0.5, resolution)?;
        }
        
        Ok(())
    }
    
    /// Render a circle to the texture
    fn render_circle(
        &self,
        texture: &mut [RgbaPixel],
        cx: u32,
        cy: u32,
        radius: u32,
        color: (u8, u8, u8),
        opacity: f32,
        resolution: u32,
    ) -> Result<(), VisualShellError> {
        let r_sq = radius as f32 * radius as f32;
        
        for dy in -(radius as i32)..=(radius as i32) {
            for dx in -(radius as i32)..=(radius as i32) {
                let px = (cx as i32 + dx) as u32;
                let py = (cy as i32 + dy) as u32;
                
                if px < resolution && py < resolution {
                    let dist_sq = (dx as f32).powi(2) + (dy as f32).powi(2);
                    
                    if dist_sq <= r_sq {
                        // Smooth edge (anti-aliasing)
                        let alpha = if dist_sq > r_sq * 0.9 {
                            let edge_dist = (r_sq - dist_sq) / (r_sq * 0.1);
                            opacity * edge_dist
                        } else {
                            opacity
                        };
                        
                        let pixel = RgbaPixel::from_rgb_opacity(color.0, color.1, color.2, alpha);
                        let idx = (py * resolution + px) as usize;
                        
                        if idx < texture.len() {
                            texture[idx] = pixel.blend(&texture[idx]);
                        }
                    }
                }
            }
        }
        
        Ok(())
    }
    
    /// Render a glow effect around a circle
    fn render_glow(
        &self,
        texture: &mut [RgbaPixel],
        cx: u32,
        cy: u32,
        radius: u32,
        color: (u8, u8, u8),
        opacity: f32,
        resolution: u32,
    ) -> Result<(), VisualShellError> {
        let r_sq = radius as f32 * radius as f32;
        
        for dy in -(radius as i32)..=(radius as i32) {
            for dx in -(radius as i32)..=(radius as i32) {
                let px = (cx as i32 + dx) as u32;
                let py = (cy as i32 + dy) as u32;
                
                if px < resolution && py < resolution {
                    let dist_sq = (dx as f32).powi(2) + (dy as f32).powi(2);
                    
                    if dist_sq <= r_sq && dist_sq > 0.0 {
                        // Gradient glow (fades out from center)
                        let glow_alpha = opacity * (1.0 - (dist_sq / r_sq).sqrt());
                        
                        let pixel = RgbaPixel::from_rgb_opacity(color.0, color.1, color.2, glow_alpha);
                        let idx = (py * resolution + px) as usize;
                        
                        if idx < texture.len() {
                            texture[idx] = pixel.blend(&texture[idx]);
                        }
                    }
                }
            }
        }
        
        Ok(())
    }
    
    /// Render synaptic connections to texture
    fn render_connections(
        &self,
        texture: &mut [RgbaPixel],
        state: &VisualState,
        resolution: u32,
    ) -> Result<(), VisualShellError> {
        for conn in &state.connections {
            if !conn.active {
                continue;
            }
            
            // Find source and target nodes
            let source = state.nodes.get(conn.source_id as usize);
            let target = state.nodes.get(conn.target_id as usize);
            
            if let (Some(src), Some(tgt)) = (source, target) {
                // Convert to pixel coordinates
                let x1 = (src.position.0 * resolution as f32) as u32;
                let y1 = (src.position.1 * resolution as f32) as u32;
                let x2 = (tgt.position.0 * resolution as f32) as u32;
                let y2 = (tgt.position.1 * resolution as f32) as u32;
                
                // Render line
                self.render_line(texture, x1, y1, x2, y2, conn.color, conn.opacity, resolution)?;
            }
        }
        
        Ok(())
    }
    
    /// Render a line to the texture (Bresenham's algorithm)
    fn render_line(
        &self,
        texture: &mut [RgbaPixel],
        x1: u32,
        y1: u32,
        x2: u32,
        y2: u32,
        color: (u8, u8, u8),
        opacity: f32,
        resolution: u32,
    ) -> Result<(), VisualShellError> {
        let mut x0 = x1 as i32;
        let mut y0 = y1 as i32;
        let x1 = x2 as i32;
        let y1 = y2 as i32;
        
        let dx = (x1 - x0).abs();
        let sx = if x0 < x1 { 1 } else { -1 };
        let dy = -(y1 - y0).abs();
        let sy = if y0 < y1 { 1 } else { -1 };
        
        let mut err = dx + dy;
        
        loop {
            // Render pixel
            if x0 >= 0 && y0 >= 0 && (x0 as u32) < resolution && (y0 as u32) < resolution {
                let pixel = RgbaPixel::from_rgb_opacity(color.0, color.1, color.2, opacity);
                let idx = (y0 as u32 * resolution + x0 as u32) as usize;
                
                if idx < texture.len() {
                    texture[idx] = pixel.blend(&texture[idx]);
                }
            }
            
            if x0 == x1 && y0 == y1 {
                break;
            }
            
            let e2 = 2 * err;
            if e2 >= dy {
                err += dy;
                x0 += sx;
            }
            if e2 <= dx {
                err += dx;
                y0 += sy;
            }
        }
        
        Ok(())
    }
    
    /// Apply glassmorphism effect to texture
    fn apply_glassmorphism(
        &self,
        texture: &mut [RgbaPixel],
        resolution: u32,
        _tokens: &DesignTokens,
    ) -> Result<(), VisualShellError> {
        // Simple blur approximation (box blur)
        let blur_radius = 2;
        let mut blurred = texture.to_vec();
        
        for y in 0..resolution {
            for x in 0..resolution {
                let mut sum_r = 0u32;
                let mut sum_g = 0u32;
                let mut sum_b = 0u32;
                let mut sum_a = 0u32;
                let mut count = 0u32;
                
                for dy in -(blur_radius as i32)..=(blur_radius as i32) {
                    for dx in -(blur_radius as i32)..=(blur_radius as i32) {
                        let px = (x as i32 + dx) as u32;
                        let py = (y as i32 + dy) as u32;
                        
                        if px < resolution && py < resolution {
                            let idx = (py * resolution + px) as usize;
                            if idx < texture.len() {
                                sum_r += texture[idx].r as u32;
                                sum_g += texture[idx].g as u32;
                                sum_b += texture[idx].b as u32;
                                sum_a += texture[idx].a as u32;
                                count += 1;
                            }
                        }
                    }
                }
                
                if count > 0 {
                    let idx = (y * resolution + x) as usize;
                    blurred[idx] = RgbaPixel::new(
                        (sum_r / count) as u8,
                        (sum_g / count) as u8,
                        (sum_b / count) as u8,
                        (sum_a / count) as u8,
                    );
                }
            }
        }
        
        // Blend original with blurred for glass effect
        for i in 0..texture.len() {
            let original = texture[i];
            let blurred_pixel = blurred[i];
            
            // Apply glass opacity
            let glass_alpha = self.glass_opacity;
            
            texture[i] = RgbaPixel::new(
                (original.r as f32 * (1.0 - glass_alpha) + blurred_pixel.r as f32 * glass_alpha) as u8,
                (original.g as f32 * (1.0 - glass_alpha) + blurred_pixel.g as f32 * glass_alpha) as u8,
                (original.b as f32 * (1.0 - glass_alpha) + blurred_pixel.b as f32 * glass_alpha) as u8,
                original.a,
            );
        }
        
        Ok(())
    }
    
    /// Save texture as PNG file (for debugging/export)
    #[cfg(feature = "png_export")]
    pub fn save_as_png(
        &self,
        texture: &[u8],
        width: u32,
        height: u32,
        path: &std::path::Path,
    ) -> Result<(), VisualShellError> {
        use image::{ImageBuffer, Rgba};
        
        let img: ImageBuffer<Rgba<u8>, _> = ImageBuffer::from_raw(width, height, texture)
            .ok_or_else(|| VisualShellError::TextureError("Failed to create image buffer".to_string()))?;
        
        img.save(path)
            .map_err(|e| VisualShellError::TextureError(format!("Failed to save PNG: {}", e)))?;
        
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::design_tokens::DesignTokens;
    use crate::visual_state::VisualState;
    
    #[test]
    fn test_rgba_pixel_creation() {
        let pixel = RgbaPixel::new(255, 128, 64, 255);
        assert_eq!(pixel.r, 255);
        assert_eq!(pixel.g, 128);
        assert_eq!(pixel.b, 64);
        assert_eq!(pixel.a, 255);
    }
    
    #[test]
    fn test_rgba_pixel_from_rgb() {
        let pixel = RgbaPixel::from_rgb(255, 128, 64);
        assert_eq!(pixel.r, 255);
        assert_eq!(pixel.g, 128);
        assert_eq!(pixel.b, 64);
        assert_eq!(pixel.a, 255);
    }
    
    #[test]
    fn test_rgba_pixel_from_rgb_opacity() {
        let pixel = RgbaPixel::from_rgb_opacity(255, 128, 64, 0.5);
        assert_eq!(pixel.r, 255);
        assert_eq!(pixel.g, 128);
        assert_eq!(pixel.b, 64);
        assert_eq!(pixel.a, 127); // 0.5 * 255
    }
    
    #[test]
    fn test_rgba_pixel_blend() {
        let pixel1 = RgbaPixel::new(255, 0, 0, 128); // Red, 50% opacity
        let pixel2 = RgbaPixel::new(0, 0, 255, 255); // Blue, 100% opacity
        
        let blended = pixel1.blend(&pixel2);
        
        // Result should be purple-ish
        assert!(blended.r > 0);
        assert!(blended.b > 0);
        assert!(blended.a > 0);
    }
    
    #[test]
    fn test_pixelrts_bridge_creation() {
        let bridge = PixelRTSBridge::new();
        assert_eq!(bridge._background_color, (5, 5, 5));
        assert_eq!(bridge._glass_blur, 20);
        assert_eq!(bridge.glass_opacity, 0.6);
    }
    
    #[test]
    fn test_generate_texture() {
        let bridge = PixelRTSBridge::new();
        let state = VisualState::new();
        
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
        
        let texture = bridge.generate_texture(&state, &tokens);
        assert!(texture.is_ok());
        
        let texture_data = texture.unwrap();
        // 256x256 RGBA = 256 * 256 * 4 bytes
        assert_eq!(texture_data.len(), 256 * 256 * 4);
    }
}
