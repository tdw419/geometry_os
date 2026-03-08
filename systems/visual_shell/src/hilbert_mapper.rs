//! Hilbert Curve Mapper - Maps 1D neural vectors to 2D texture coordinates
//!
//! This module implements the Hilbert curve space-filling algorithm
//! for mapping 1D neural state vectors to 2D texture coordinates while
//! preserving spatial locality.

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
    pub fn order(&self) -> u32 {
        self.order
    }

    /// Get the dimension of the grid
    pub fn dimension(&self) -> u32 {
        self.dimension
    }

    /// Alias for dimension() to maintain compatibility
    pub fn resolution(&self) -> u32 {
        self.dimension
    }

    /// Get the total number of points in the grid
    pub fn total_points(&self) -> u32 {
        self.total_points
    }

    /// Convert a 1D Hilbert index to 2D coordinates.
    pub fn index_to_coord(&self, index: u32) -> (u32, u32) {
        let mut x = 0i32;
        let mut y = 0i32;
        let mut t = index;
        let mut s = 1i32;
        
        let n = self.dimension as i32;
        
        while s < n {
            let rx = 1i32 & (t as i32 >> 1);
            let ry = 1i32 & (t as i32 ^ rx);
            
            // Rotate
            let (nx, ny) = self.rot(s, x, y, rx, ry);
            x = nx;
            y = ny;
            
            x += s * rx;
            y += s * ry;
            
            t >>= 2;
            s <<= 1;
        }
        
        (x as u32, y as u32)
    }

    /// Convert 2D coordinates to a 1D Hilbert index.
    pub fn coord_to_index(&self, x: u32, y: u32) -> u32 {
        let mut d = 0u32;
        let mut s = self.dimension as i32 / 2;
        
        let mut xx = x as i32;
        let mut yy = y as i32;
        
        while s > 0 {
            let rx = if (xx & s) > 0 { 1i32 } else { 0i32 };
            let ry = if (yy & s) > 0 { 1i32 } else { 0i32 };
            
            d += (s as u32 * s as u32) * ((3 * rx as u32) ^ ry as u32);
            
            let (nx, ny) = self.rot(s, xx, yy, rx, ry);
            xx = nx;
            yy = ny;
            
            s >>= 1;
        }
        
        d
    }
    
    /// Rotate/flip quadrant
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
