//! Hilbert Curve Mapper - Maps 1D neural vectors to 2D texture coordinates
//!
//! This module implements the Hilbert curve space-filling algorithm
//! for mapping 1D neural state vectors to 2D texture coordinates while
//! preserving locality (similar values map to nearby pixels).

use crate::VisualShellError;

/// Hilbert curve mapper for 1D->2D conversion
#[derive(Debug, Clone)]
pub struct HilbertMapper {
    /// Order of the Hilbert curve (determines resolution)
    order: u32,
    
    /// Resolution (2^order)
    resolution: u32,
    
    /// Total number of points (resolution^2)
    total_points: u32,
}

impl HilbertMapper {
    /// Create a new Hilbert mapper
    ///
    /// # Arguments
    ///
    /// * `order` - Order of the Hilbert curve (higher = more resolution)
    ///
    /// # Example
    ///
    /// ```
    /// use visual_shell::HilbertMapper;
    ///
    /// let mapper = HilbertMapper::new(8);
    /// assert_eq!(mapper.resolution(), 256);
    /// ```
    pub fn new(order: u32) -> Self {
        let resolution = 1u32 << order; // 2^order
        let total_points = resolution * resolution;
        
        Self {
            order,
            resolution,
            total_points,
        }
    }
    
    /// Get the resolution of the Hilbert curve
    pub fn resolution(&self) -> u32 {
        self.resolution
    }
    
    /// Get the total number of points
    pub fn total_points(&self) -> u32 {
        self.total_points
    }
    
    /// Get the order of the Hilbert curve
    pub fn order(&self) -> u32 {
        self.order
    }
    
    /// Convert 1D index to 2D coordinates (x, y)
    ///
    /// # Arguments
    ///
    /// * `index` - 1D index in range [0, total_points)
    ///
    /// # Returns
    ///
    /// (x, y) coordinates in range [0, resolution)
    ///
    /// # Example
    ///
    /// ```
    /// use visual_shell::HilbertMapper;
    ///
    /// let mapper = HilbertMapper::new(2);
    /// let (x, y) = mapper.index_to_coord(0);
    /// assert_eq!(x, 0);
    /// assert_eq!(y, 0);
    /// ```
    pub fn index_to_coord(&self, index: u32) -> (u32, u32) {
        let mut x = 0u32;
        let mut y = 0u32;
        let mut t = index;
        
        for s in 0..self.order {
            let rx = 1u32 & (t >> 1);
            let ry = 1u32 & (t ^ rx);
            
            // Rotate/flip
            let (new_x, new_y) = self.rot(s, x, y, rx, ry);
            x = new_x;
            y = new_y;
            
            x += rx << s;
            y += ry << s;
            
            t >>= 2;
        }
        
        (x, y)
    }
    
    /// Convert 2D coordinates to 1D index
    ///
    /// # Arguments
    ///
    /// * `x` - X coordinate in range [0, resolution)
    /// * `y` - Y coordinate in range [0, resolution)
    ///
    /// # Returns
    ///
    /// 1D index in range [0, total_points)
    ///
    /// # Example
    ///
    /// ```
    /// use visual_shell::HilbertMapper;
    ///
    /// let mapper = HilbertMapper::new(2);
    /// let index = mapper.coord_to_index(0, 0);
    /// assert_eq!(index, 0);
    /// ```
    pub fn coord_to_index(&self, mut x: u32, mut y: u32) -> u32 {
        let mut d = 0u32;
        let mut s = self.order - 1;
        
        loop {
            let rx = 1u32 & (x >> s);
            let ry = 1u32 & (y >> s);
            
            d += (rx * 3) ^ ry;
            
            let (new_x, new_y) = self.rot(s, x, y, rx, ry);
            x = new_x;
            y = new_y;
            
            if s == 0 {
                break;
            }
            s -= 1;
        }
        
        d
    }
    
    /// Rotate/flip quadrant
    fn rot(&self, n: u32, mut x: u32, mut y: u32, rx: u32, ry: u32) -> (u32, u32) {
        if ry == 0 {
            if rx == 1 {
                x = (1u32 << n) - 1 - x;
                y = (1u32 << n) - 1 - y;
            }
            
            // Swap x and y
            let temp = x;
            x = y;
            y = temp;
        }
        
        (x, y)
    }
    
    /// Get distance between two indices in Hilbert space
    ///
    /// This measures the locality preservation - smaller distances
    /// indicate that the values are closer in the 2D space.
    ///
    /// # Arguments
    ///
    /// * `index1` - First index
    /// * `index2` - Second index
    ///
    /// # Returns
    ///
    /// Euclidean distance between the two points in 2D space
    pub fn distance(&self, index1: u32, index2: u32) -> f32 {
        let (x1, y1) = self.index_to_coord(index1);
        let (x2, y2) = self.index_to_coord(index2);
        
        let dx = (x1 as f32) - (x2 as f32);
        let dy = (y1 as f32) - (y2 as f32);
        
        (dx * dx + dy * dy).sqrt()
    }
    
    /// Get normalized coordinates (0.0 to 1.0) for an index
    ///
    /// # Arguments
    ///
    /// * `index` - 1D index
    ///
    /// # Returns
    ///
    /// (x, y) normalized coordinates in range [0.0, 1.0]
    pub fn index_to_normalized_coord(&self, index: u32) -> (f32, f32) {
        let (x, y) = self.index_to_coord(index);
        let inv_res = 1.0 / self.resolution as f32;
        
        (x as f32 * inv_res, y as f32 * inv_res)
    }
    
    /// Map a 1D vector to 2D texture coordinates
    ///
    /// # Arguments
    ///
    /// * `vector` - 1D vector of values
    ///
    /// # Returns
    ///
    /// Vector of (x, y) coordinates
    ///
    /// # Errors
    ///
    /// Returns error if vector length exceeds total_points
    pub fn vector_to_coords(&self, vector: &[f32]) -> Result<Vec<(u32, u32)>, VisualShellError> {
        if vector.len() > self.total_points as usize {
            return Err(VisualShellError::ConversionError(format!(
                "Vector length {} exceeds total points {}",
                vector.len(),
                self.total_points
            )));
        }
        
        let coords: Vec<(u32, u32)> = vector
            .iter()
            .enumerate()
            .map(|(i, _)| self.index_to_coord(i as u32))
            .collect();
        
        Ok(coords)
    }
    
    /// Map a 1D vector to normalized 2D coordinates
    ///
    /// # Arguments
    ///
    /// * `vector` - 1D vector of values
    ///
    /// # Returns
    ///
    /// Vector of (x, y) normalized coordinates in range [0.0, 1.0]
    ///
    /// # Errors
    ///
    /// Returns error if vector length exceeds total_points
    pub fn vector_to_normalized_coords(&self, vector: &[f32]) -> Result<Vec<(f32, f32)>, VisualShellError> {
        if vector.len() > self.total_points as usize {
            return Err(VisualShellError::ConversionError(format!(
                "Vector length {} exceeds total points {}",
                vector.len(),
                self.total_points
            )));
        }
        
        let coords: Vec<(f32, f32)> = vector
            .iter()
            .enumerate()
            .map(|(i, _)| self.index_to_normalized_coord(i as u32))
            .collect();
        
        Ok(coords)
    }
}

impl Default for HilbertMapper {
    fn default() -> Self {
        Self::new(8) // Default to order 8 (256x256)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_hilbert_mapper_creation() {
        let mapper = HilbertMapper::new(2);
        assert_eq!(mapper.order(), 2);
        assert_eq!(mapper.resolution(), 4);
        assert_eq!(mapper.total_points(), 16);
    }
    
    #[test]
    fn test_index_to_coord() {
        let mapper = HilbertMapper::new(2);
        
        // Test first few points
        assert_eq!(mapper.index_to_coord(0), (0, 0));
        assert_eq!(mapper.index_to_coord(1), (0, 1));
        assert_eq!(mapper.index_to_coord(2), (1, 1));
        assert_eq!(mapper.index_to_coord(3), (1, 0));
    }
    
    #[test]
    fn test_coord_to_index() {
        let mapper = HilbertMapper::new(2);
        
        // Test round-trip conversion
        assert_eq!(mapper.coord_to_index(0, 0), 0);
        assert_eq!(mapper.coord_to_index(0, 1), 1);
        assert_eq!(mapper.coord_to_index(1, 1), 2);
        assert_eq!(mapper.coord_to_index(1, 0), 3);
    }
    
    #[test]
    fn test_round_trip() {
        let mapper = HilbertMapper::new(4);
        
        // Test round-trip for all points
        for i in 0..mapper.total_points() {
            let (x, y) = mapper.index_to_coord(i);
            let j = mapper.coord_to_index(x, y);
            assert_eq!(i, j, "Round-trip failed for index {}", i);
        }
    }
    
    #[test]
    fn test_index_to_normalized_coord() {
        let mapper = HilbertMapper::new(2);
        
        let (x, y) = mapper.index_to_normalized_coord(0);
        assert_eq!(x, 0.0);
        assert_eq!(y, 0.0);
        
        let (x, y) = mapper.index_to_normalized_coord(3);
        assert_eq!(x, 0.25); // 1/4
        assert_eq!(y, 0.0);
    }
    
    #[test]
    fn test_distance() {
        let mapper = HilbertMapper::new(2);
        
        // Adjacent indices should be close
        let dist = mapper.distance(0, 1);
        assert!(dist < 2.0);
        
        // Far apart indices should be far
        let dist = mapper.distance(0, 15);
        assert!(dist > 2.0);
    }
    
    #[test]
    fn test_vector_to_coords() {
        let mapper = HilbertMapper::new(2);
        let vector = vec![0.0, 1.0, 2.0, 3.0];
        
        let coords = mapper.vector_to_coords(&vector).unwrap();
        assert_eq!(coords.len(), 4);
        assert_eq!(coords[0], (0, 0));
        assert_eq!(coords[1], (0, 1));
    }
    
    #[test]
    fn test_vector_to_coords_error() {
        let mapper = HilbertMapper::new(2);
        let vector = vec![0.0; 20]; // More than total_points (16)
        
        let result = mapper.vector_to_coords(&vector);
        assert!(result.is_err());
    }
    
    #[test]
    fn test_locality_preservation() {
        let mapper = HilbertMapper::new(4);
        
        // Adjacent indices should be close in 2D space
        for i in 0..mapper.total_points() - 1 {
            let dist = mapper.distance(i, i + 1);
            // Most adjacent indices should be within 2.0 distance
            // (this is a property of the Hilbert curve)
            assert!(dist < 5.0, "Indices {} and {} are too far: {}", i, i + 1, dist);
        }
    }
}
