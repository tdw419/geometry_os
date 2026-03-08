//! Glyph Substrate - Hilbert-mapped VRAM buffer for native glyph rendering
//!
//! This module implements the core visual memory substrate for the Native Glyph
//! Visual Shell. It uses Hilbert curve indexing to maintain 95% spatial locality,
//! ensuring that adjacent pixels on screen remain close in GPU cache.
//!
//! # Architecture
//!
//! ```text
//! ┌─────────────────────────────────────────────────────────┐
//! │                   GlyphSubstrate                        │
//! ├─────────────────────────────────────────────────────────┤
//! │  width: u32, height: u32                                │
//! │  order: u8 (Hilbert curve order)                        │
//! │  buffer: Vec<RGBA> (Hilbert-indexed pixel buffer)       │
//! │  dirty_regions: Vec<Rect> (for efficient GPU upload)    │
//! └─────────────────────────────────────────────────────────┘
//! ```
//!
//! # Spatial Locality
//!
//! The Hilbert curve ensures that pixels which are close together on screen
//! are also close together in memory. This property is crucial for:
//!
//! - GPU cache efficiency (95% coherence)
//! - Efficient batch rendering
//! - Real-time visual updates

use std::ops::{Index, IndexMut};

/// RGBA pixel color (4 bytes)
#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
#[repr(C)]
pub struct RGBA {
    pub r: u8,
    pub g: u8,
    pub b: u8,
    pub a: u8,
}

impl RGBA {
    /// Create a new RGBA color
    pub const fn new(r: u8, g: u8, b: u8, a: u8) -> Self {
        Self { r, g, b, a }
    }

    /// Create from a packed u32 (0xRRGGBBAA)
    pub const fn from_u32(packed: u32) -> Self {
        Self {
            r: ((packed >> 24) & 0xFF) as u8,
            g: ((packed >> 16) & 0xFF) as u8,
            b: ((packed >> 8) & 0xFF) as u8,
            a: (packed & 0xFF) as u8,
        }
    }

    /// Convert to packed u32 (0xRRGGBBAA)
    pub const fn to_u32(&self) -> u32 {
        ((self.r as u32) << 24)
            | ((self.g as u32) << 16)
            | ((self.b as u32) << 8)
            | (self.a as u32)
    }

    /// Create a transparent black pixel
    pub const fn transparent() -> Self {
        Self::new(0, 0, 0, 0)
    }

    /// Create a black pixel
    pub const fn black() -> Self {
        Self::new(0, 0, 0, 255)
    }

    /// Create a white pixel
    pub const fn white() -> Self {
        Self::new(255, 255, 255, 255)
    }
}

/// A rectangular region for dirty tracking
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct Rect {
    pub x: u32,
    pub y: u32,
    pub width: u32,
    pub height: u32,
}

impl Rect {
    pub const fn new(x: u32, y: u32, width: u32, height: u32) -> Self {
        Self { x, y, width, height }
    }

    /// Check if this rect contains a point
    pub const fn contains(&self, px: u32, py: u32) -> bool {
        px >= self.x
            && py >= self.y
            && px < self.x + self.width
            && py < self.y + self.height
    }

    /// Get the area of this rect
    pub const fn area(&self) -> u32 {
        self.width * self.height
    }

    /// Merge two rects (return bounding box)
    pub fn merge(&self, other: &Rect) -> Rect {
        let x1 = self.x.min(other.x);
        let y1 = self.y.min(other.y);
        let x2 = (self.x + self.width).max(other.x + other.width);
        let y2 = (self.y + self.height).max(other.y + other.height);
        Rect::new(x1, y1, x2 - x1, y2 - y1)
    }
}

/// Errors that can occur in the Glyph Substrate
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum SubstrateError {
    /// Coordinate out of bounds
    OutOfBounds { x: u32, y: u32, width: u32, height: u32 },

    /// Invalid Hilbert order
    InvalidOrder { order: u8, min: u8, max: u8 },

    /// Index out of bounds
    IndexOutOfBounds { index: u64, size: u64 },
}

impl std::fmt::Display for SubstrateError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::OutOfBounds { x, y, width, height } => {
                write!(f, "Coordinate ({}, {}) out of bounds [{}, {})", x, y, width, height)
            }
            Self::InvalidOrder { order, min, max } => {
                write!(f, "Invalid Hilbert order {}: must be between {} and {}", order, min, max)
            }
            Self::IndexOutOfBounds { index, size } => {
                write!(f, "Index {} out of bounds [0, {})", index, size)
            }
        }
    }
}

impl std::error::Error for SubstrateError {}

/// Glyph Substrate - Hilbert-mapped VRAM buffer
///
/// This is the core visual memory for the Native Glyph Visual Shell.
/// All pixel operations use Hilbert curve indexing for spatial locality.
///
/// # Example
///
/// ```
/// use visual_shell::GlyphSubstrate;
///
/// // Create a 1024x1024 substrate (order 10)
/// let mut substrate = GlyphSubstrate::new(10)?;
///
/// // Set a pixel at screen coordinates
/// substrate.set_pixel(100, 100, 0xFF0000FF)?; // Red, fully opaque
///
/// // Get pixel via Hilbert index (GPU cache friendly)
/// let hilbert_idx = substrate.xy_to_hilbert(100, 100)?;
/// let pixel = substrate.get_pixel_hilbert(hilbert_idx);
///
/// # Ok::<(), visual_shell::glyph_substrate::SubstrateError>(())
/// ```
#[derive(Debug, Clone)]
pub struct GlyphSubstrate {
    /// Width of the substrate in pixels
    width: u32,

    /// Height of the substrate in pixels
    height: u32,

    /// Order of the Hilbert curve (2^order = dimension)
    order: u8,

    /// Pixel buffer indexed by Hilbert curve
    /// buffer[hilbert_index] = pixel at (x, y)
    buffer: Vec<RGBA>,

    /// Dirty regions for efficient GPU upload
    dirty_regions: Vec<Rect>,

    /// Total number of pixels
    size: u64,
}

impl GlyphSubstrate {
    /// Minimum Hilbert curve order (2x2 = 4 pixels)
    pub const MIN_ORDER: u8 = 1;

    /// Maximum Hilbert curve order (1024x1024 = 1M pixels)
    pub const MAX_ORDER: u8 = 10;

    /// Create a new Glyph Substrate with the given Hilbert order
    ///
    /// # Arguments
    ///
    /// * `order` - Hilbert curve order (1-10). Dimension = 2^order.
    ///
    /// # Returns
    ///
    /// A new substrate with all pixels initialized to transparent black.
    ///
    /// # Errors
    ///
    /// Returns `SubstrateError::InvalidOrder` if order is outside [1, 10].
    ///
    /// # Example
    ///
    /// ```
    /// use visual_shell::GlyphSubstrate;
    ///
    /// let substrate = GlyphSubstrate::new(8)?; // 256x256
    /// assert_eq!(substrate.width(), 256);
    /// assert_eq!(substrate.height(), 256);
    /// # Ok::<(), visual_shell::glyph_substrate::SubstrateError>(())
    /// ```
    pub fn new(order: u8) -> Result<Self, SubstrateError> {
        if order < Self::MIN_ORDER || order > Self::MAX_ORDER {
            return Err(SubstrateError::InvalidOrder {
                order,
                min: Self::MIN_ORDER,
                max: Self::MAX_ORDER,
            });
        }

        let dimension = 1u32 << order; // 2^order
        let size = (dimension as u64) * (dimension as u64);
        let buffer = vec![RGBA::transparent(); size as usize];

        Ok(Self {
            width: dimension,
            height: dimension,
            order,
            buffer,
            dirty_regions: Vec::new(),
            size,
        })
    }

    /// Create a substrate with a specific background color
    pub fn with_background(order: u8, color: RGBA) -> Result<Self, SubstrateError> {
        let mut substrate = Self::new(order)?;
        substrate.clear(color);
        Ok(substrate)
    }

    /// Get the width of the substrate
    pub const fn width(&self) -> u32 {
        self.width
    }

    /// Get the height of the substrate
    pub const fn height(&self) -> u32 {
        self.height
    }

    /// Get the Hilbert curve order
    pub const fn order(&self) -> u8 {
        self.order
    }

    /// Get the total number of pixels
    pub const fn size(&self) -> u64 {
        self.size
    }

    /// Get the dimension (width == height for square substrate)
    pub const fn dimension(&self) -> u32 {
        self.width
    }

    /// Clear the entire substrate to a single color
    pub fn clear(&mut self, color: RGBA) {
        for pixel in &mut self.buffer {
            *pixel = color;
        }
        self.dirty_regions.clear();
        self.dirty_regions.push(Rect::new(0, 0, self.width, self.height));
    }

    // ========================================================================
    // Hilbert Curve Conversion (ported from HilbertLUT.ts)
    // ========================================================================

    /// Convert (x, y) screen coordinates to Hilbert index
    ///
    /// This is the core spatial locality transformation.
    /// Adjacent screen pixels map to adjacent (or nearly adjacent) indices.
    ///
    /// # Algorithm
    ///
    /// Based on "Hacker's Delight" by Henry S. Warren.
    /// Uses iterative bit manipulation for efficiency.
    pub fn xy_to_hilbert(&self, x: u32, y: u32) -> Result<u64, SubstrateError> {
        if x >= self.width || y >= self.height {
            return Err(SubstrateError::OutOfBounds {
                x,
                y,
                width: self.width,
                height: self.height,
            });
        }

        Ok(self.xy_to_hilbert_unchecked(x, y))
    }

    /// Convert Hilbert index to (x, y) screen coordinates
    pub fn hilbert_to_xy(&self, index: u64) -> Result<(u32, u32), SubstrateError> {
        if index >= self.size {
            return Err(SubstrateError::IndexOutOfBounds {
                index,
                size: self.size,
            });
        }

        Ok(self.hilbert_to_xy_unchecked(index))
    }

    /// Unchecked version of xy_to_hilbert for internal use
    fn xy_to_hilbert_unchecked(&self, x: u32, y: u32) -> u64 {
        let mut d = 0u64;
        let mut s = self.width as i32 / 2;
        
        let mut xx = x as i32;
        let mut yy = y as i32;
        
        while s > 0 {
            let rx = if (xx & s) > 0 { 1u32 } else { 0u32 };
            let ry = if (yy & s) > 0 { 1u32 } else { 0u32 };
            
            d += s as u64 * s as u64 * ((3 * rx as u64) ^ ry as u64);
            
            let (nx, ny) = self.rot(s, xx, yy, rx as i32, ry as i32);
            xx = nx;
            yy = ny;
            
            s >>= 1;
        }
        
        d
    }

    /// Unchecked version of hilbert_to_xy for internal use
    fn hilbert_to_xy_unchecked(&self, d: u64) -> (u32, u32) {
        let mut x = 0i32;
        let mut y = 0i32;
        let mut t = d;
        let mut s = 1i32;
        
        let n = self.width as i32;
        
        while s < n {
            let rx = 1u32 & (t as u32 >> 1);
            let ry = 1u32 & (t as u32 ^ rx);

            // Rotate
            let (nx, ny) = self.rot(s, x, y, rx as i32, ry as i32);
            x = nx;
            y = ny;
            
            x += s * rx as i32;
            y += s * ry as i32;
            
            t >>= 2;
            s <<= 1;
        }
        
        (x as u32, y as u32)
    }

    /// Rotate/flip quadrant appropriately
    fn rot(&self, n: i32, x: i32, y: i32, rx: i32, ry: i32) -> (i32, i32) {
        if ry == 0 {
            let mut nx = x;
            let mut ny = y;
            if rx == 1 {
                nx = n - 1 - x;
                ny = n - 1 - y;
            }
            
            // Swap x and y
            (ny, nx)
        } else {
            (x, y)
        }
    }

    // ========================================================================
    // Pixel Access
    // ========================================================================

    /// Set a pixel at screen coordinates (x, y)
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate [0, width)
    /// * `y` - Y coordinate [0, height)
    /// * `color` - Packed RGBA color (0xRRGGBBAA)
    ///
    /// # Errors
    ///
    /// Returns `SubstrateError::OutOfBounds` if coordinates are outside the substrate.
    pub fn set_pixel(&mut self, x: u32, y: u32, color: u32) -> Result<(), SubstrateError> {
        let idx = self.xy_to_hilbert(x, y)?;
        self.buffer[idx as usize] = RGBA::from_u32(color);
        self.mark_dirty(x, y, 1, 1);
        Ok(())
    }

    /// Set a pixel using RGBA struct
    pub fn set_pixel_rgba(&mut self, x: u32, y: u32, color: RGBA) -> Result<(), SubstrateError> {
        let idx = self.xy_to_hilbert(x, y)?;
        self.buffer[idx as usize] = color;
        self.mark_dirty(x, y, 1, 1);
        Ok(())
    }

    /// Get a pixel at screen coordinates (x, y)
    pub fn get_pixel(&self, x: u32, y: u32) -> Result<RGBA, SubstrateError> {
        let idx = self.xy_to_hilbert(x, y)?;
        Ok(self.buffer[idx as usize])
    }

    /// Set a pixel via Hilbert index (GPU cache friendly)
    ///
    /// Use this for batch operations where you've precomputed Hilbert indices.
    pub fn set_pixel_hilbert(&mut self, index: u64, color: RGBA) -> Result<(), SubstrateError> {
        if index >= self.size {
            return Err(SubstrateError::IndexOutOfBounds {
                index,
                size: self.size,
            });
        }
        self.buffer[index as usize] = color;
        // Note: We don't know the (x,y) for dirty tracking, so we'd need to convert back
        // For batch operations, use commit() to mark the full buffer dirty
        Ok(())
    }

    /// Get a pixel via Hilbert index
    pub fn get_pixel_hilbert(&self, index: u64) -> Result<RGBA, SubstrateError> {
        if index >= self.size {
            return Err(SubstrateError::IndexOutOfBounds {
                index,
                size: self.size,
            });
        }
        Ok(self.buffer[index as usize])
    }

    /// Set pixel without bounds checking (unsafe but fast)
    ///
    /// # Safety
    ///
    /// Caller must ensure (x, y) is within bounds.
    #[inline]
    pub unsafe fn set_pixel_unchecked(&mut self, x: u32, y: u32, color: RGBA) {
        let idx = self.xy_to_hilbert_unchecked(x, y);
        *self.buffer.get_unchecked_mut(idx as usize) = color;
    }

    /// Get pixel without bounds checking (unsafe but fast)
    ///
    /// # Safety
    ///
    /// Caller must ensure (x, y) is within bounds.
    #[inline]
    pub unsafe fn get_pixel_unchecked(&self, x: u32, y: u32) -> RGBA {
        let idx = self.xy_to_hilbert_unchecked(x, y);
        *self.buffer.get_unchecked(idx as usize)
    }

    // ========================================================================
    // Shape Drawing Primitives
    // ========================================================================

    /// Fill a rectangle with a color
    pub fn fill_rect(&mut self, x: u32, y: u32, width: u32, height: u32, color: RGBA) -> Result<(), SubstrateError> {
        // Bounds check
        if x + width > self.width || y + height > self.height {
            return Err(SubstrateError::OutOfBounds {
                x: x + width,
                y: y + height,
                width: self.width,
                height: self.height,
            });
        }

        for py in y..y + height {
            for px in x..x + width {
                unsafe {
                    self.set_pixel_unchecked(px, py, color);
                }
            }
        }

        self.mark_dirty(x, y, width, height);
        Ok(())
    }

    /// Draw a rectangle outline
    pub fn draw_rect(&mut self, x: u32, y: u32, width: u32, height: u32, color: RGBA) -> Result<(), SubstrateError> {
        // Draw horizontal lines
        for px in x..x + width {
            self.set_pixel_rgba(px, y, color)?;
            if height > 1 {
                self.set_pixel_rgba(px, y + height - 1, color)?;
            }
        }

        // Draw vertical lines
        for py in y..y + height {
            self.set_pixel_rgba(x, py, color)?;
            if width > 1 {
                self.set_pixel_rgba(x + width - 1, py, color)?;
            }
        }

        self.mark_dirty(x, y, width, height);
        Ok(())
    }

    /// Draw a line using Bresenham's algorithm
    pub fn draw_line(&mut self, x1: u32, y1: u32, x2: u32, y2: u32, color: RGBA) -> Result<(), SubstrateError> {
        let dx = (x2 as i64 - x1 as i64).abs();
        let dy = -(y2 as i64 - y1 as i64).abs();
        let sx = if x1 < x2 { 1i64 } else { -1i64 };
        let sy = if y1 < y2 { 1i64 } else { -1i64 };
        let mut err = dx + dy;

        let mut x = x1 as i64;
        let mut y = y1 as i64;

        loop {
            if x >= 0 && y >= 0 && (x as u32) < self.width && (y as u32) < self.height {
                self.set_pixel_rgba(x as u32, y as u32, color)?;
            }

            if x == x2 as i64 && y == y2 as i64 {
                break;
            }

            let e2 = 2 * err;
            if e2 >= dy {
                err += dy;
                x += sx;
            }
            if e2 <= dx {
                err += dx;
                y += sy;
            }
        }

        // Mark bounding box as dirty
        let min_x = x1.min(x2);
        let min_y = y1.min(y2);
        let max_x = x1.max(x2);
        let max_y = y1.max(y2);
        self.mark_dirty(min_x, min_y, max_x - min_x + 1, max_y - min_y + 1);

        Ok(())
    }

    /// Draw a circle using midpoint algorithm
    pub fn draw_circle(&mut self, cx: u32, cy: u32, radius: u32, color: RGBA) -> Result<(), SubstrateError> {
        let mut x = 0i32;
        let mut y = radius as i32;
        let mut d = 3 - 2 * (radius as i32);

        while x <= y {
            // Draw 8 octants
            self.plot_circle_points(cx, cy, x, y, color)?;

            if d < 0 {
                d = d + 4 * x + 6;
            } else {
                d = d + 4 * (x - y) + 10;
                y -= 1;
            }
            x += 1;
        }

        // Mark bounding box as dirty
        self.mark_dirty(
            cx.saturating_sub(radius),
            cy.saturating_sub(radius),
            radius * 2 + 1,
            radius * 2 + 1,
        );

        Ok(())
    }

    /// Helper to plot circle points in all 8 octants
    fn plot_circle_points(&mut self, cx: u32, cy: u32, x: i32, y: i32, color: RGBA) -> Result<(), SubstrateError> {
        let points = [
            (cx as i32 + x, cy as i32 + y),
            (cx as i32 - x, cy as i32 + y),
            (cx as i32 + x, cy as i32 - y),
            (cx as i32 - x, cy as i32 - y),
            (cx as i32 + y, cy as i32 + x),
            (cx as i32 - y, cy as i32 + x),
            (cx as i32 + y, cy as i32 - x),
            (cx as i32 - y, cy as i32 - x),
        ];

        for (px, py) in points {
            if px >= 0 && py >= 0 {
                let px = px as u32;
                let py = py as u32;
                if px < self.width && py < self.height {
                    self.set_pixel_rgba(px, py, color)?;
                }
            }
        }

        Ok(())
    }

    // ========================================================================
    // Dirty Region Tracking
    // ========================================================================

    /// Mark a region as dirty for GPU upload
    fn mark_dirty(&mut self, x: u32, y: u32, width: u32, height: u32) {
        let rect = Rect::new(x, y, width, height);

        // Try to merge with existing dirty region
        if let Some(last) = self.dirty_regions.last_mut() {
            if last.contains(x, y) || rect.contains(last.x, last.y) {
                *last = last.merge(&rect);
                return;
            }
        }

        self.dirty_regions.push(rect);
    }

    /// Get all dirty regions
    pub fn dirty_regions(&self) -> &[Rect] {
        &self.dirty_regions
    }

    /// Clear dirty regions (call after GPU upload)
    pub fn clear_dirty(&mut self) {
        self.dirty_regions.clear();
    }

    /// Mark the entire substrate as dirty
    pub fn mark_all_dirty(&mut self) {
        self.dirty_regions.clear();
        self.dirty_regions.push(Rect::new(0, 0, self.width, self.height));
    }

    /// Commit all changes (mark entire buffer dirty)
    pub fn commit(&mut self) {
        self.mark_all_dirty();
    }

    // ========================================================================
    // GPU Interop
    // ========================================================================

    /// Get raw buffer for GPU upload
    ///
    /// The buffer is Hilbert-indexed for spatial locality.
    /// GPU shader must convert back to (x,y) for rendering.
    pub fn as_bytes(&self) -> &[u8] {
        // Safety: RGBA is #[repr(C)] with 4 u8 fields
        unsafe {
            std::slice::from_raw_parts(
                self.buffer.as_ptr() as *const u8,
                self.buffer.len() * 4,
            )
        }
    }

    /// Get mutable access to the raw buffer
    pub fn as_bytes_mut(&mut self) -> &mut [u8] {
        // Safety: RGBA is #[repr(C)] with 4 u8 fields
        unsafe {
            std::slice::from_raw_parts_mut(
                self.buffer.as_mut_ptr() as *mut u8,
                self.buffer.len() * 4,
            )
        }
    }

    /// Get the buffer as RGBA slice
    pub fn as_rgba(&self) -> &[RGBA] {
        &self.buffer
    }

    /// Get mutable access to the RGBA buffer
    pub fn as_rgba_mut(&mut self) -> &mut [RGBA] {
        &mut self.buffer
    }

    // ========================================================================
    // Spatial Locality Analysis
    // ========================================================================

    /// Calculate spatial locality score (0.0 to 1.0)
    ///
    /// Measures how well the Hilbert curve preserves spatial locality.
    /// Returns the fraction of adjacent Hilbert indices that are within
    /// a threshold distance in 2D space.
    ///
    /// # Arguments
    ///
    /// * `threshold` - Maximum 2D distance to consider "local" (default: 2.0)
    ///
    /// # Returns
    ///
    /// Score between 0.0 and 1.0. Target is 0.95 (95% locality).
    pub fn calculate_locality(&self, threshold: f32) -> f32 {
        if self.size < 2 {
            return 1.0;
        }

        let mut local_count = 0u64;
        let sample_size = (self.size as usize).min(10000); // Sample for performance

        for i in 0..sample_size {
            let idx = i as u64;
            if idx + 1 >= self.size {
                break;
            }

            let (x1, y1) = self.hilbert_to_xy_unchecked(idx);
            let (x2, y2) = self.hilbert_to_xy_unchecked(idx + 1);

            let dx = (x1 as f32) - (x2 as f32);
            let dy = (y1 as f32) - (y2 as f32);
            let dist = (dx * dx + dy * dy).sqrt();

            if dist <= threshold {
                local_count += 1;
            }
        }

        local_count as f32 / (sample_size as f32 - 1.0).max(1.0)
    }
}

impl Index<u64> for GlyphSubstrate {
    type Output = RGBA;

    fn index(&self, index: u64) -> &Self::Output {
        &self.buffer[index as usize]
    }
}

impl IndexMut<u64> for GlyphSubstrate {
    fn index_mut(&mut self, index: u64) -> &mut Self::Output {
        &mut self.buffer[index as usize]
    }
}

impl Default for GlyphSubstrate {
    fn default() -> Self {
        Self::new(8).expect("Default order 8 should always be valid")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_substrate_creation() {
        let substrate = GlyphSubstrate::new(8).unwrap();
        assert_eq!(substrate.width(), 256);
        assert_eq!(substrate.height(), 256);
        assert_eq!(substrate.size(), 256 * 256);
        assert_eq!(substrate.order(), 8);
    }

    #[test]
    fn test_invalid_order() {
        assert!(GlyphSubstrate::new(0).is_err());
        assert!(GlyphSubstrate::new(11).is_err());
        assert!(GlyphSubstrate::new(1).is_ok());
        assert!(GlyphSubstrate::new(10).is_ok());
    }

    #[test]
    fn test_hilbert_roundtrip() {
        let substrate = GlyphSubstrate::new(4).unwrap();

        for y in 0..substrate.height() {
            for x in 0..substrate.width() {
                let idx = substrate.xy_to_hilbert(x, y).unwrap();
                let (x2, y2) = substrate.hilbert_to_xy(idx).unwrap();
                assert_eq!((x, y), (x2, y2), "Roundtrip failed for ({}, {})", x, y);
            }
        }
    }

    #[test]
    fn test_pixel_set_get() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let color = RGBA::new(255, 128, 64, 255);
        substrate.set_pixel_rgba(5, 5, color).unwrap();

        let retrieved = substrate.get_pixel(5, 5).unwrap();
        assert_eq!(retrieved, color);
    }

    #[test]
    fn test_pixel_hilbert_access() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let idx = substrate.xy_to_hilbert(10, 10).unwrap();
        let color = RGBA::new(100, 150, 200, 255);
        substrate.set_pixel_hilbert(idx, color).unwrap();

        let retrieved = substrate.get_pixel_hilbert(idx).unwrap();
        assert_eq!(retrieved, color);
    }

    #[test]
    fn test_fill_rect() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let color = RGBA::new(255, 0, 0, 255);
        substrate.fill_rect(2, 2, 4, 4, color).unwrap();

        // Check interior
        for y in 2..6 {
            for x in 2..6 {
                let pixel = substrate.get_pixel(x, y).unwrap();
                assert_eq!(pixel, color, "Pixel at ({}, {}) should be red", x, y);
            }
        }

        // Check exterior
        let outside = substrate.get_pixel(0, 0).unwrap();
        assert_eq!(outside, RGBA::transparent());
    }

    #[test]
    fn test_draw_rect() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let color = RGBA::new(0, 255, 0, 255);
        substrate.draw_rect(2, 2, 4, 4, color).unwrap();

        // Check corners (should be drawn)
        assert_eq!(substrate.get_pixel(2, 2).unwrap(), color);
        assert_eq!(substrate.get_pixel(5, 2).unwrap(), color);
        assert_eq!(substrate.get_pixel(2, 5).unwrap(), color);
        assert_eq!(substrate.get_pixel(5, 5).unwrap(), color);

        // Check interior (should be transparent)
        assert_eq!(substrate.get_pixel(3, 3).unwrap(), RGBA::transparent());
    }

    #[test]
    fn test_draw_line() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        let color = RGBA::new(0, 0, 255, 255);
        substrate.draw_line(0, 0, 5, 5, color).unwrap();

        // Check diagonal pixels
        for i in 0..=5 {
            let pixel = substrate.get_pixel(i, i).unwrap();
            assert_eq!(pixel, color, "Pixel at ({}, {}) should be blue", i, i);
        }
    }

    #[test]
    fn test_draw_circle() {
        let mut substrate = GlyphSubstrate::new(5).unwrap();

        let color = RGBA::new(255, 255, 0, 255);
        substrate.draw_circle(8, 8, 4, color).unwrap();

        // Check a few points on the circle
        // (8, 4) should be on the circle (top)
        let pixel = substrate.get_pixel(8, 4).unwrap();
        assert_eq!(pixel, color, "Top of circle should be yellow");

        // (8, 8) should NOT be on the circle (center)
        let center = substrate.get_pixel(8, 8).unwrap();
        assert_eq!(center, RGBA::transparent(), "Center should be transparent");
    }

    #[test]
    fn test_clear() {
        let mut substrate = GlyphSubstrate::new(2).unwrap();

        let color = RGBA::new(128, 128, 128, 255);
        substrate.clear(color);

        for y in 0..substrate.height() {
            for x in 0..substrate.width() {
                assert_eq!(substrate.get_pixel(x, y).unwrap(), color);
            }
        }
    }

    #[test]
    fn test_dirty_tracking() {
        let mut substrate = GlyphSubstrate::new(4).unwrap();

        assert!(substrate.dirty_regions().is_empty());

        substrate.set_pixel_rgba(5, 5, RGBA::white()).unwrap();
        assert_eq!(substrate.dirty_regions().len(), 1);
        assert_eq!(substrate.dirty_regions()[0], Rect::new(5, 5, 1, 1));

        substrate.clear_dirty();
        assert!(substrate.dirty_regions().is_empty());
    }

    #[test]
    fn test_locality_calculation() {
        let substrate = GlyphSubstrate::new(4).unwrap();

        // Hilbert curve should have high locality (target: 95%)
        let locality = substrate.calculate_locality(2.0);
        assert!(locality >= 0.8, "Locality should be >= 0.8, got {}", locality);

        println!("Spatial locality: {:.2}%", locality * 100.0);
    }

    #[test]
    fn test_rgba_conversion() {
        let color = RGBA::new(0x12, 0x34, 0x56, 0x78);
        let packed = color.to_u32();
        assert_eq!(packed, 0x12345678);

        let unpacked = RGBA::from_u32(0xFF00FF00);
        assert_eq!(unpacked.r, 0xFF);
        assert_eq!(unpacked.g, 0x00);
        assert_eq!(unpacked.b, 0xFF);
        assert_eq!(unpacked.a, 0x00);
    }

    #[test]
    fn test_as_bytes() {
        let mut substrate = GlyphSubstrate::new(1).unwrap(); // 2x2 = 4 pixels
        substrate.clear(RGBA::new(1, 2, 3, 4));

        let bytes = substrate.as_bytes();
        assert_eq!(bytes.len(), 4 * 4); // 4 pixels * 4 bytes

        // Check first pixel
        assert_eq!(bytes[0], 1); // R
        assert_eq!(bytes[1], 2); // G
        assert_eq!(bytes[2], 3); // B
        assert_eq!(bytes[3], 4); // A
    }

    #[test]
    fn test_bounds_checking() {
        let substrate = GlyphSubstrate::new(2).unwrap(); // 4x4

        // Valid
        assert!(substrate.xy_to_hilbert(0, 0).is_ok());
        assert!(substrate.xy_to_hilbert(3, 3).is_ok());

        // Invalid
        assert!(substrate.xy_to_hilbert(4, 0).is_err());
        assert!(substrate.xy_to_hilbert(0, 4).is_err());
        assert!(substrate.xy_to_hilbert(4, 4).is_err());
    }
}
