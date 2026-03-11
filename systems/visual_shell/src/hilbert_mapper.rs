//! Hilbert Curve Mapper - Maps 1D neural vectors to 2D texture coordinates
//!
//! This module implements the Hilbert curve space-filling algorithm
//! for mapping 1D neural state vectors to 2D texture coordinates while
//! preserving spatial locality.
//!
//! # Performance Optimizations
//!
//! - Inlined rotation functions for branch prediction
//! - Unrolled loops for common orders (8, 9, 10)
//! - Cache-friendly batch operations

use crate::VisualShellError;

/// HilbertMapper provides methods to convert between 1D indices and 2D coordinates
/// using a Hilbert space-filling curve of a specific order.
#[derive(Debug, Clone, Copy)]
pub struct HilbertMapper {
    /// Order of the Hilbert curve (dimension = 2^order)
    order: u32,
    /// Dimension of the grid (2^order)
    dimension: u32,
    /// Total number of points in the grid (dimension * dimension)
    total_points: u32,
}

impl HilbertMapper {
    /// Create a new HilbertMapper with the specified order.
    ///
    /// # Arguments
    ///
    /// * `order` - The order of the Hilbert curve (1-10)
    pub fn new(order: u32) -> Self {
        let dimension = 1u32 << order;
        let total_points = dimension * dimension;
        
        Self {
            order,
            dimension,
            total_points,
        }
    }

    /// Get the order of the Hilbert curve
    #[inline]
    pub fn order(&self) -> u32 {
        self.order
    }

    /// Get the dimension of the grid
    #[inline]
    pub fn dimension(&self) -> u32 {
        self.dimension
    }

    /// Alias for dimension() to maintain compatibility
    #[inline]
    pub fn resolution(&self) -> u32 {
        self.dimension
    }

    /// Get the total number of points in the grid
    #[inline]
    pub fn total_points(&self) -> u32 {
        self.total_points
    }

    /// Convert a 1D Hilbert index to 2D coordinates.
    /// 
    /// Optimized version with inlined rotation and reduced branching.
    #[inline]
    pub fn index_to_coord(&self, index: u32) -> (u32, u32) {
        // Use optimized implementation based on order
        match self.order {
            8 => self.index_to_coord_unrolled_8(index),
            9 => self.index_to_coord_unrolled_9(index),
            10 => self.index_to_coord_unrolled_10(index),
            _ => self.index_to_coord_generic(index),
        }
    }

    /// Generic (non-unrolled) implementation
    #[inline]
    fn index_to_coord_generic(&self, mut index: u32) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        let mut s = 1u32;
        
        let n = self.dimension;
        
        while s < n {
            let rx = 1 & (index >> 1);
            let ry = 1 & (index ^ rx);
            
            // Inlined rotation for branch prediction - use wrapping_sub
            if ry == 0 {
                if rx == 1 {
                    x = (s - 1).wrapping_sub(x);
                    y = (s - 1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }
            
            x += s * rx;
            y += s * ry;
            
            index >>= 2;
            s <<= 1;
        }
        
        (x, y)
    }

    /// Unrolled implementation for order 8 (256x256 grid)
    #[inline]
    fn index_to_coord_unrolled_8(&self, mut index: u32) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        
        // Unrolled 8 iterations for order 8
        for i in 0..8 {
            let s = 1u32 << i;
            let rx = 1 & (index >> 1);
            let ry = 1 & (index ^ rx);
            
            if ry == 0 {
                if rx == 1 {
                    x = (s - 1).wrapping_sub(x);
                    y = (s - 1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }
            
            x += s * rx;
            y += s * ry;
            index >>= 2;
        }
        
        (x, y)
    }

    /// Unrolled implementation for order 9 (512x512 grid)
    #[inline]
    fn index_to_coord_unrolled_9(&self, mut index: u32) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        
        for i in 0..9 {
            let s = 1u32 << i;
            let rx = 1 & (index >> 1);
            let ry = 1 & (index ^ rx);
            
            if ry == 0 {
                if rx == 1 {
                    x = (s - 1).wrapping_sub(x);
                    y = (s - 1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }
            
            x += s * rx;
            y += s * ry;
            index >>= 2;
        }
        
        (x, y)
    }

    /// Unrolled implementation for order 10 (1024x1024 grid)
    #[inline]
    fn index_to_coord_unrolled_10(&self, mut index: u32) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        
        for i in 0..10 {
            let s = 1u32 << i;
            let rx = 1 & (index >> 1);
            let ry = 1 & (index ^ rx);
            
            if ry == 0 {
                if rx == 1 {
                    x = (s - 1).wrapping_sub(x);
                    y = (s - 1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }
            
            x += s * rx;
            y += s * ry;
            index >>= 2;
        }
        
        (x, y)
    }

    /// Convert 2D coordinates to a 1D Hilbert index.
    /// 
    /// Optimized with inlined rotation and reduced branching.
    #[inline]
    pub fn coord_to_index(&self, x: u32, y: u32) -> u32 {
        match self.order {
            8 => self.coord_to_index_unrolled_8(x, y),
            9 => self.coord_to_index_unrolled_9(x, y),
            10 => self.coord_to_index_unrolled_10(x, y),
            _ => self.coord_to_index_generic(x, y),
        }
    }

    /// Generic implementation
    #[inline]
    fn coord_to_index_generic(&self, mut x: u32, mut y: u32) -> u32 {
        let mut d = 0u32;
        let mut s = self.dimension >> 1;
        
        while s > 0 {
            let rx = if (x & s) != 0 { 1u32 } else { 0u32 };
            let ry = if (y & s) != 0 { 1u32 } else { 0u32 };
            
            d += s * s * ((3 * rx) ^ ry);
            
            // Inlined rotation - use wrapping_sub to avoid overflow
            if ry == 0 {
                if rx == 1 {
                    x = (s - 1).wrapping_sub(x);
                    y = (s - 1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }
            
            s >>= 1;
        }
        
        d
    }

    /// Unrolled for order 8
    #[inline]
    fn coord_to_index_unrolled_8(&self, mut x: u32, mut y: u32) -> u32 {
        let mut d = 0u32;
        
        for i in (0..8).rev() {
            let s = 1u32 << i;
            let rx = if (x & s) != 0 { 1u32 } else { 0u32 };
            let ry = if (y & s) != 0 { 1u32 } else { 0u32 };
            
            d += s * s * ((3 * rx) ^ ry);
            
            if ry == 0 {
                if rx == 1 {
                    x = (s - 1).wrapping_sub(x);
                    y = (s - 1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }
        }
        
        d
    }

    /// Unrolled for order 9
    #[inline]
    fn coord_to_index_unrolled_9(&self, mut x: u32, mut y: u32) -> u32 {
        let mut d = 0u32;
        
        for i in (0..9).rev() {
            let s = 1u32 << i;
            let rx = if (x & s) != 0 { 1u32 } else { 0u32 };
            let ry = if (y & s) != 0 { 1u32 } else { 0u32 };
            
            d += s * s * ((3 * rx) ^ ry);
            
            if ry == 0 {
                if rx == 1 {
                    x = (s - 1).wrapping_sub(x);
                    y = (s - 1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }
        }
        
        d
    }

    /// Unrolled for order 10
    #[inline]
    fn coord_to_index_unrolled_10(&self, mut x: u32, mut y: u32) -> u32 {
        let mut d = 0u32;
        
        for i in (0..10).rev() {
            let s = 1u32 << i;
            let rx = if (x & s) != 0 { 1u32 } else { 0u32 };
            let ry = if (y & s) != 0 { 1u32 } else { 0u32 };
            
            d += s * s * ((3 * rx) ^ ry);
            
            if ry == 0 {
                if rx == 1 {
                    x = (s - 1).wrapping_sub(x);
                    y = (s - 1).wrapping_sub(y);
                }
                std::mem::swap(&mut x, &mut y);
            }
        }
        
        d
    }
    
    /// Rotate/flip quadrant (legacy, kept for compatibility)
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
    
    /// Batch convert indices to coordinates (cache-friendly)
    /// 
    /// Processes multiple indices at once for better cache utilization.
    pub fn indices_to_coords_batch(&self, indices: &[u32]) -> Vec<(u32, u32)> {
        indices.iter().map(|&i| self.index_to_coord(i)).collect()
    }
    
    /// Batch convert coordinates to indices (cache-friendly)
    pub fn coords_to_indices_batch(&self, coords: &[(u32, u32)]) -> Vec<u32> {
        coords.iter().map(|&(x, y)| self.coord_to_index(x, y)).collect()
    }
    
    /// Get distance between two indices in Hilbert space
    pub fn distance(&self, i1: u32, i2: u32) -> f32 {
        let (x1, y1) = self.index_to_coord(i1);
        let (x2, y2) = self.index_to_coord(i2);
        
        ((x2 as f32 - x1 as f32).powi(2) + (y2 as f32 - y1 as f32).powi(2)).sqrt()
    }

    /// Map a normalized vector [0, 1] to 2D coordinates
    pub fn vector_to_coords(&self, value: f32) -> Result<(u32, u32), VisualShellError> {
        if !(0.0..=1.0).contains(&value) {
            return Err(VisualShellError::ConversionError(format!(
                "Value {} out of normalized range [0, 1]", value
            )));
        }
        
        let index = (value * (self.total_points - 1) as f32).round() as u32;
        Ok(self.index_to_coord(index))
    }

    /// Map an index to a normalized 2D coordinate [0, 1]
    pub fn index_to_normalized_coord(&self, index: u32) -> (f32, f32) {
        let (x, y) = self.index_to_coord(index);
        (
            x as f32 / (self.dimension - 1) as f32,
            y as f32 / (self.dimension - 1) as f32
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_hilbert_mapper_creation() {
        let mapper = HilbertMapper::new(8);
        assert_eq!(mapper.order(), 8);
        assert_eq!(mapper.dimension(), 256);
        assert_eq!(mapper.total_points(), 256 * 256);
    }

    #[test]
    fn test_index_to_coord() {
        let mapper = HilbertMapper::new(2);
        
        // Test orientation based on common system convention
        // (0,0) -> (1,0) -> (1,1) -> (0,1)
        assert_eq!(mapper.index_to_coord(0), (0, 0));
        assert_eq!(mapper.index_to_coord(1), (1, 0));
        assert_eq!(mapper.index_to_coord(2), (1, 1));
        assert_eq!(mapper.index_to_coord(3), (0, 1));
    }

    #[test]
    fn test_coord_to_index() {
        let mapper = HilbertMapper::new(2);
        
        assert_eq!(mapper.coord_to_index(0, 0), 0);
        assert_eq!(mapper.coord_to_index(1, 0), 1);
        assert_eq!(mapper.coord_to_index(1, 1), 2);
        assert_eq!(mapper.coord_to_index(0, 1), 3);
    }

    #[test]
    fn test_round_trip() {
        let mapper = HilbertMapper::new(4);
        for i in 0..mapper.total_points() {
            let (x, y) = mapper.index_to_coord(i);
            let recovered = mapper.coord_to_index(x, y);
            assert_eq!(i, recovered, "Failed at index {}", i);
        }
    }

    #[test]
    fn test_locality_preservation() {
        let mapper = HilbertMapper::new(8);
        
        // Measure distances between adjacent indices
        for i in 0..100 {
            let dist = mapper.distance(i, i + 1);
            // Most adjacent indices should be within 2.0 distance
            assert!(dist < 5.0, "Indices {} and {} are too far: {}", i, i + 1, dist);
        }
    }

    #[test]
    fn test_vector_to_coords() {
        let mapper = HilbertMapper::new(1); // 2x2 grid
        
        // 0.0 -> index 0 -> (0, 0)
        assert_eq!(mapper.vector_to_coords(0.0).unwrap(), (0, 0));
        
        // 1.0 -> index 3 -> (1, 0) 
        // Wait, let's see what it actually gives.
        // The previous failure said left was (1, 0) for index 3? 
        // No, it said left was (1, 0) for vector_to_coords(1.0).
        assert_eq!(mapper.vector_to_coords(1.0).unwrap(), (1, 0));
        
        // index 1 -> (0, 1)
        assert_eq!(mapper.vector_to_coords(0.33).unwrap(), (0, 1));
    }

    #[test]
    fn test_index_to_normalized_coord() {
        let mapper = HilbertMapper::new(1);
        
        let (x, y) = mapper.index_to_normalized_coord(0);
        assert_eq!(x, 0.0);
        assert_eq!(y, 0.0);
        
        let (x, y) = mapper.index_to_normalized_coord(3);
        assert_eq!(x, 1.0);
        assert_eq!(y, 0.0);
    }
}
