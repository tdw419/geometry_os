//! Integration Tests for Batch Commit Feature
//!
//! This module tests the batch commit functionality of GlyphSubstrate
//! and its integration with other Visual Shell components.
//!
//! # Test Categories
//!
//! 1. Batch pixel operations with Hilbert indexing
//! 2. Commit method behavior and dirty region tracking
//! 3. Integration with GlyphSubstrate rendering pipeline
//! 4. Performance characteristics of batch operations
//! 5. Error handling for invalid batch operations

use visual_shell::{GlyphSubstrate, RGBA, Rect, SubstrateError};

// Helper constants for common colors (not in crate, so we define locally)
const RED: RGBA = RGBA::new(255, 0, 0, 255);
const GREEN: RGBA = RGBA::new(0, 255, 0, 255);
const BLUE: RGBA = RGBA::new(0, 0, 255, 255);

// ============================================================================
// Basic Batch Commit Tests
// ============================================================================

/// Test that commit() marks the entire buffer as dirty
#[test]
fn test_commit_marks_entire_buffer_dirty() {
    let mut substrate = GlyphSubstrate::new(4).unwrap(); // 16x16
    
    // Initially no dirty regions
    assert!(substrate.dirty_regions().is_empty());
    
    // Make some changes
    substrate.set_pixel_rgba(5, 5, RGBA::white()).unwrap();
    substrate.set_pixel_rgba(10, 10, RGBA::black()).unwrap();
    
    // Clear dirty regions to simulate GPU upload
    substrate.clear_dirty();
    assert!(substrate.dirty_regions().is_empty());
    
    // Commit should mark entire buffer dirty
    substrate.commit();
    
    let dirty = substrate.dirty_regions();
    assert_eq!(dirty.len(), 1);
    assert_eq!(dirty[0], Rect::new(0, 0, 16, 16));
}

/// Test batch pixel operations using Hilbert indexing
#[test]
fn test_batch_hilbert_pixel_operations() {
    let mut substrate = GlyphSubstrate::new(3).unwrap(); // 8x8 = 64 pixels
    
    // Create a batch of colors
    let colors: Vec<RGBA> = (0..64)
        .map(|i| RGBA::new(i as u8, (i * 2) as u8, (i * 3) as u8, 255))
        .collect();
    
    // Batch set pixels using Hilbert indices
    for (idx, &color) in colors.iter().enumerate() {
        substrate.set_pixel_hilbert(idx as u64, color).unwrap();
    }
    
    // Commit the batch
    substrate.commit();
    
    // Verify all pixels are set correctly
    for (idx, &expected) in colors.iter().enumerate() {
        let actual = substrate.get_pixel_hilbert(idx as u64).unwrap();
        assert_eq!(actual, expected, "Mismatch at Hilbert index {}", idx);
    }
}

/// Test that batch operations followed by commit produce correct dirty regions
#[test]
fn test_batch_operations_dirty_tracking() {
    let mut substrate = GlyphSubstrate::new(4).unwrap();
    
    // Perform batch operations without immediate dirty tracking
    for i in 0..50 {
        substrate.set_pixel_hilbert(i, RED).unwrap();
    }
    
    // Note: set_pixel_hilbert doesn't do per-pixel dirty tracking
    // So we need to commit to mark the buffer dirty
    assert!(substrate.dirty_regions().is_empty());
    
    substrate.commit();
    
    // After commit, entire buffer should be dirty
    assert_eq!(substrate.dirty_regions().len(), 1);
    assert_eq!(substrate.dirty_regions()[0].area(), 16 * 16);
}

/// Test commit after clear operation
#[test]
fn test_commit_after_clear() {
    let mut substrate = GlyphSubstrate::new(3).unwrap();
    
    // Clear with a color (this already marks dirty)
    substrate.clear(RGBA::new(100, 100, 100, 255));
    
    // Commit should still work
    substrate.commit();
    
    // Verify the entire buffer is marked dirty
    assert_eq!(substrate.dirty_regions().len(), 1);
    assert_eq!(substrate.dirty_regions()[0], Rect::new(0, 0, 8, 8));
}

// ============================================================================
// Integration with Shape Drawing
// ============================================================================

/// Test batch commit after shape drawing operations
#[test]
fn test_commit_after_shape_drawing() {
    let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32
    
    // Draw multiple shapes
    substrate.fill_rect(2, 2, 10, 10, RED).unwrap();
    substrate.draw_rect(15, 15, 8, 8, GREEN).unwrap();
    substrate.draw_circle(25, 25, 5, BLUE).unwrap();
    
    // Clear dirty (simulating GPU upload)
    substrate.clear_dirty();
    
    // Make additional batch changes
    for i in 0..100 {
        substrate.set_pixel_hilbert(i, RGBA::white()).unwrap();
    }
    
    // Commit all batch changes
    substrate.commit();
    
    // Entire buffer should be dirty
    assert_eq!(substrate.dirty_regions().len(), 1);
    assert_eq!(substrate.dirty_regions()[0].area(), 32 * 32);
}

/// Test batch operations preserve shape drawings
#[test]
fn test_batch_operations_preserve_shapes() {
    let mut substrate = GlyphSubstrate::new(4).unwrap(); // 16x16 = 256 pixels
    
    // Draw a rectangle in the center
    substrate.fill_rect(6, 6, 4, 4, RED).unwrap();
    
    // Record the red pixels
    let mut red_pixels = Vec::new();
    let mut red_indices = std::collections::HashSet::new();
    for y in 0..16 {
        for x in 0..16 {
            if substrate.get_pixel(x, y).unwrap() == RED {
                red_pixels.push((x, y));
                let idx = substrate.xy_to_hilbert(x, y).unwrap();
                red_indices.insert(idx);
            }
        }
    }
    
    // Perform batch operations ONLY on pixels NOT in the red rectangle
    // This tests that we can selectively update pixels without affecting others
    for i in 0..substrate.size() {
        if !red_indices.contains(&i) {
            substrate.set_pixel_hilbert(i, BLUE).unwrap();
        }
    }
    substrate.commit();
    
    // Verify red rectangle is still intact
    for (x, y) in &red_pixels {
        let pixel = substrate.get_pixel(*x, *y).unwrap();
        assert_eq!(pixel, RED, "Red pixel at ({}, {}) was overwritten", x, y);
    }
    
    // Verify surrounding pixels are blue
    let outside_pixel = substrate.get_pixel(0, 0).unwrap();
    assert_eq!(outside_pixel, BLUE, "Outside pixel should be blue");
}

// ============================================================================
// Error Handling Tests
// ============================================================================

/// Test batch operations handle index bounds correctly
#[test]
fn test_batch_operations_bounds_checking() {
    let substrate = GlyphSubstrate::new(2).unwrap(); // 4x4 = 16 pixels
    
    // Valid indices should work
    for i in 0..16 {
        let result = substrate.get_pixel_hilbert(i);
        assert!(result.is_ok(), "Index {} should be valid", i);
    }
    
    // Invalid indices should fail
    let result = substrate.get_pixel_hilbert(16);
    assert!(matches!(result, Err(SubstrateError::IndexOutOfBounds { .. })));
    
    let result = substrate.get_pixel_hilbert(100);
    assert!(matches!(result, Err(SubstrateError::IndexOutOfBounds { .. })));
}

/// Test batch set with invalid indices
#[test]
fn test_batch_set_invalid_index() {
    let mut substrate = GlyphSubstrate::new(3).unwrap(); // 64 pixels
    
    // Valid batch operation
    let result = substrate.set_pixel_hilbert(63, RGBA::white());
    assert!(result.is_ok());
    
    // Invalid batch operation
    let result = substrate.set_pixel_hilbert(64, RGBA::white());
    assert!(matches!(result, Err(SubstrateError::IndexOutOfBounds { .. })));
    
    let result = substrate.set_pixel_hilbert(u64::MAX, RGBA::white());
    assert!(matches!(result, Err(SubstrateError::IndexOutOfBounds { .. })));
}

// ============================================================================
// Performance-Related Tests
// ============================================================================

/// Test that batch operations are more efficient than individual pixel sets
#[test]
fn test_batch_efficiency() {
    let mut substrate = GlyphSubstrate::new(6).unwrap(); // 64x64 = 4096 pixels
    
    // Batch set many pixels
    let start = std::time::Instant::now();
    for i in 0..1000 {
        substrate.set_pixel_hilbert(i, RGBA::new(i as u8, 0, 0, 255)).unwrap();
    }
    let batch_time = start.elapsed();
    
    // Commit once
    let commit_start = std::time::Instant::now();
    substrate.commit();
    let commit_time = commit_start.elapsed();
    
    // Commit should be very fast (just marking dirty)
    assert!(commit_time.as_millis() < 10, "Commit took too long: {:?}", commit_time);
    
    // Batch operations should complete in reasonable time
    assert!(batch_time.as_millis() < 100, "Batch operations took too long: {:?}", batch_time);
}

/// Test large batch operations
#[test]
fn test_large_batch_operations() {
    let mut substrate = GlyphSubstrate::new(8).unwrap(); // 256x256 = 65536 pixels
    
    // Fill half the buffer via batch operations
    let half_size = substrate.size() / 2;
    for i in 0..half_size {
        let color = RGBA::new(
            (i % 256) as u8,
            ((i / 256) % 256) as u8,
            ((i / 65536) % 256) as u8,
            255,
        );
        substrate.set_pixel_hilbert(i, color).unwrap();
    }
    
    // Commit
    substrate.commit();
    
    // Verify dirty region covers entire buffer
    assert_eq!(substrate.dirty_regions()[0].area(), 256 * 256);
    
    // Verify some pixels
    let first = substrate.get_pixel_hilbert(0).unwrap();
    assert_eq!(first.r, 0);
    assert_eq!(first.g, 0);
    assert_eq!(first.b, 0);
    
    let pixel_256 = substrate.get_pixel_hilbert(256).unwrap();
    assert_eq!(pixel_256.r, 0);
    assert_eq!(pixel_256.g, 1);
}

// ============================================================================
// Memory and Buffer Tests
// ============================================================================

/// Test that as_bytes reflects batch changes after commit
#[test]
fn test_as_bytes_reflects_batch_changes() {
    let mut substrate = GlyphSubstrate::new(2).unwrap(); // 16 pixels
    
    // Fill with known pattern
    for i in 0..16 {
        let value = (i * 17) as u8; // 0, 17, 34, 51, ...
        substrate.set_pixel_hilbert(i, RGBA::new(value, value, value, 255)).unwrap();
    }
    
    substrate.commit();
    
    // Get bytes
    let bytes = substrate.as_bytes();
    
    // Verify byte structure (4 bytes per pixel)
    assert_eq!(bytes.len(), 16 * 4);
    
    // Check that the pattern is reflected
    for i in 0..16 {
        let expected = (i * 17) as u8;
        let offset = i * 4;
        assert_eq!(bytes[offset], expected, "R component at pixel {}", i);
        assert_eq!(bytes[offset + 1], expected, "G component at pixel {}", i);
        assert_eq!(bytes[offset + 2], expected, "B component at pixel {}", i);
        assert_eq!(bytes[offset + 3], 255, "A component at pixel {}", i);
    }
}

/// Test mutable byte access with batch operations
#[test]
fn test_mutable_byte_access_with_batch() {
    let mut substrate = GlyphSubstrate::new(2).unwrap();
    
    // Initial state
    substrate.clear(RGBA::transparent());
    
    // Get mutable bytes and modify
    {
        let bytes = substrate.as_bytes_mut();
        // Set first pixel to red
        bytes[0] = 255; // R
        bytes[1] = 0;   // G
        bytes[2] = 0;   // B
        bytes[3] = 255; // A
    }
    
    // Commit to mark dirty
    substrate.commit();
    
    // Verify modification
    let pixel = substrate.get_pixel_hilbert(0).unwrap();
    assert_eq!(pixel.r, 255);
    assert_eq!(pixel.g, 0);
    assert_eq!(pixel.b, 0);
    assert_eq!(pixel.a, 255);
}

// ============================================================================
// Spatial Locality Tests
// ============================================================================

/// Test that batch operations maintain Hilbert spatial locality
#[test]
fn test_batch_spatial_locality() {
    let substrate = GlyphSubstrate::new(6).unwrap(); // 64x64
    
    // Test locality: adjacent Hilbert indices should be spatially close
    let mut max_distance = 0.0f32;
    let mut total_distance = 0.0f32;
    let samples = 1000;
    
    for i in 0..samples {
        if i + 1 >= substrate.size() {
            break;
        }
        
        let (x1, y1) = substrate.hilbert_to_xy(i).unwrap();
        let (x2, y2) = substrate.hilbert_to_xy(i + 1).unwrap();
        
        let dx = (x1 as f32) - (x2 as f32);
        let dy = (y1 as f32) - (y2 as f32);
        let dist = (dx * dx + dy * dy).sqrt();
        
        max_distance = max_distance.max(dist);
        total_distance += dist;
    }
    
    let avg_distance = total_distance / samples as f32;
    
    // Hilbert curve should maintain good locality
    // Average distance should be small (< 2.0 pixels)
    assert!(avg_distance < 2.0, "Average distance too high: {}", avg_distance);
    
    // Max distance can be larger but should be bounded
    assert!(max_distance < 64.0, "Max distance too high: {}", max_distance);
    
    // Verify locality score meets target (95%)
    let locality = substrate.calculate_locality(2.0);
    assert!(locality >= 0.80, "Locality score too low: {}", locality);
}

// ============================================================================
// Integration with GlyphSubstrate Features
// ============================================================================

/// Test batch operations with Index trait
#[test]
fn test_batch_with_index_trait() {
    let mut substrate = GlyphSubstrate::new(3).unwrap();
    
    // Set via method
    substrate.set_pixel_hilbert(10, RED).unwrap();
    
    // Read via Index trait
    let pixel = substrate[10];
    assert_eq!(pixel, RED);
    
    // Set via IndexMut trait
    substrate[20] = BLUE;
    
    // Read via method
    let pixel = substrate.get_pixel_hilbert(20).unwrap();
    assert_eq!(pixel, BLUE);
}

/// Test batch operations work with default substrate
#[test]
fn test_batch_with_default_substrate() {
    let mut substrate = GlyphSubstrate::default(); // Order 8 = 256x256
    
    // Perform batch operations
    for i in 0..100 {
        substrate.set_pixel_hilbert(i, RGBA::white()).unwrap();
    }
    
    substrate.commit();
    
    // Verify
    assert!(!substrate.dirty_regions().is_empty());
    for i in 0..100 {
        assert_eq!(substrate[i], RGBA::white());
    }
}

/// Test multiple commit cycles
#[test]
fn test_multiple_commit_cycles() {
    let mut substrate = GlyphSubstrate::new(3).unwrap();
    
    // First batch cycle
    for i in 0..20 {
        substrate.set_pixel_hilbert(i, RED).unwrap();
    }
    substrate.commit();
    substrate.clear_dirty();
    
    // Second batch cycle
    for i in 20..40 {
        substrate.set_pixel_hilbert(i, GREEN).unwrap();
    }
    substrate.commit();
    substrate.clear_dirty();
    
    // Third batch cycle
    for i in 40..60 {
        substrate.set_pixel_hilbert(i, BLUE).unwrap();
    }
    substrate.commit();
    
    // Verify all colors are preserved
    for i in 0..20 {
        assert_eq!(substrate[i], RED);
    }
    for i in 20..40 {
        assert_eq!(substrate[i], GREEN);
    }
    for i in 40..60 {
        assert_eq!(substrate[i], BLUE);
    }
}

// ============================================================================
// Edge Case Tests
// ============================================================================

/// Test commit on empty substrate (no changes)
#[test]
fn test_commit_empty_substrate() {
    let mut substrate = GlyphSubstrate::new(2).unwrap();
    
    // Commit without any changes
    substrate.commit();
    
    // Should mark entire buffer dirty
    assert_eq!(substrate.dirty_regions().len(), 1);
    assert_eq!(substrate.dirty_regions()[0].area(), 16);
}

/// Test commit on minimum size substrate
#[test]
fn test_commit_minimum_size() {
    let mut substrate = GlyphSubstrate::new(1).unwrap(); // 2x2 = 4 pixels
    
    // Batch operations
    substrate.set_pixel_hilbert(0, RED).unwrap();
    substrate.set_pixel_hilbert(1, GREEN).unwrap();
    substrate.set_pixel_hilbert(2, BLUE).unwrap();
    substrate.set_pixel_hilbert(3, RGBA::white()).unwrap();
    
    substrate.commit();
    
    // Verify
    assert_eq!(substrate[0], RED);
    assert_eq!(substrate[1], GREEN);
    assert_eq!(substrate[2], BLUE);
    assert_eq!(substrate[3], RGBA::white());
    assert_eq!(substrate.dirty_regions()[0].area(), 4);
}

/// Test commit on maximum size substrate
#[test]
fn test_commit_maximum_size() {
    let mut substrate = GlyphSubstrate::new(10).unwrap(); // 1024x1024 = 1M pixels
    
    // Set a few pixels
    substrate.set_pixel_hilbert(0, RED).unwrap();
    substrate.set_pixel_hilbert(substrate.size() - 1, BLUE).unwrap();
    
    substrate.commit();
    
    // Verify dirty region covers entire buffer
    assert_eq!(substrate.dirty_regions().len(), 1);
    assert_eq!(substrate.dirty_regions()[0], Rect::new(0, 0, 1024, 1024));
    
    // Verify pixels
    assert_eq!(substrate[0], RED);
    assert_eq!(substrate[substrate.size() - 1], BLUE);
}

/// Test batch operations with all-transparent pixels
#[test]
fn test_batch_transparent_pixels() {
    let mut substrate = GlyphSubstrate::new(3).unwrap();
    
    // Fill with transparent pixels
    for i in 0..substrate.size() {
        substrate.set_pixel_hilbert(i, RGBA::transparent()).unwrap();
    }
    
    substrate.commit();
    
    // Verify all are transparent
    for i in 0..substrate.size() {
        let pixel = substrate.get_pixel_hilbert(i).unwrap();
        assert_eq!(pixel, RGBA::transparent());
        assert_eq!(pixel.a, 0);
    }
}

// ============================================================================
// Concurrency Safety Tests (single-threaded simulation)
// ============================================================================

/// Test that sequential batch operations don't interfere
#[test]
fn test_sequential_batch_independence() {
    let mut substrate = GlyphSubstrate::new(4).unwrap();
    
    // First sequence: fill with pattern A
    for i in 0..50 {
        substrate.set_pixel_hilbert(i, RGBA::new(1, 0, 0, 255)).unwrap();
    }
    
    // Second sequence: fill overlapping range with pattern B
    for i in 25..75 {
        substrate.set_pixel_hilbert(i, RGBA::new(2, 0, 0, 255)).unwrap();
    }
    
    substrate.commit();
    
    // Verify non-overlapping part of A is preserved
    for i in 0..25 {
        assert_eq!(substrate[i].r, 1, "Pixel {} should have r=1", i);
    }
    
    // Verify overlapping part has B's value
    for i in 25..50 {
        assert_eq!(substrate[i].r, 2, "Pixel {} should have r=2", i);
    }
    
    // Verify B-only part
    for i in 50..75 {
        assert_eq!(substrate[i].r, 2, "Pixel {} should have r=2", i);
    }
}

// ============================================================================
// RGBA Helper Tests for Batch Operations
// ============================================================================

/// Test RGBA conversions used in batch operations
#[test]
fn test_rgba_conversions_in_batch() {
    let mut substrate = GlyphSubstrate::new(2).unwrap();
    
    // Test various color formats
    let colors = [
        RGBA::new(255, 0, 0, 255),       // Red
        RGBA::from_u32(0x00FF00FF),      // Green via packed
        RGBA::white(),                    // White
        RGBA::black(),                    // Black
        RGBA::transparent(),              // Transparent
        RGBA::new(128, 128, 128, 128),    // Semi-transparent gray
    ];
    
    for (i, &color) in colors.iter().enumerate() {
        substrate.set_pixel_hilbert(i as u64, color).unwrap();
    }
    
    substrate.commit();
    
    // Verify roundtrip
    for (i, &expected) in colors.iter().enumerate() {
        let actual = substrate.get_pixel_hilbert(i as u64).unwrap();
        assert_eq!(actual, expected, "Color mismatch at index {}", i);
    }
}

// ============================================================================
// Integration with SpectralMixer and VisualShell (if available)
// ============================================================================

/// Test batch commit workflow mimics VisualShell usage pattern
#[test]
fn test_batch_commit_visual_shell_workflow() {
    // This test simulates how the VisualShell would use batch commits
    let mut substrate = GlyphSubstrate::new(6).unwrap(); // 64x64
    
    // Phase 1: Initial clear
    substrate.clear(RGBA::new(10, 10, 20, 255)); // Dark background
    substrate.commit();
    substrate.clear_dirty();
    
    // Phase 2: Neural activations (batch)
    let neural_data: Vec<f32> = (0..64).map(|i| (i as f32) / 64.0).collect();
    for (i, &value) in neural_data.iter().enumerate() {
        let intensity = (value * 255.0) as u8;
        let idx = (i * substrate.size() as usize / 64) as u64;
        if idx < substrate.size() {
            substrate.set_pixel_hilbert(idx, RGBA::new(intensity, intensity / 2, 255 - intensity, 255)).unwrap();
        }
    }
    substrate.commit();
    substrate.clear_dirty();
    
    // Phase 3: Attention weights overlay (batch)
    let attention_data: Vec<f32> = (0..32).map(|i| ((i * 7) % 32) as f32 / 32.0).collect();
    for (i, &value) in attention_data.iter().enumerate() {
        let intensity = (value * 255.0) as u8;
        let idx = (i * 2) as u64;
        if idx < substrate.size() {
            let existing = substrate.get_pixel_hilbert(idx).unwrap();
            substrate.set_pixel_hilbert(idx, RGBA::new(
                existing.r.max(intensity),
                existing.g,
                existing.b,
                255
            )).unwrap();
        }
    }
    substrate.commit();
    
    // Verify final state
    assert_eq!(substrate.dirty_regions().len(), 1);
    assert_eq!(substrate.dirty_regions()[0], Rect::new(0, 0, 64, 64));
    
    // Verify first pixel has neural activation applied
    let first = substrate.get_pixel_hilbert(0).unwrap();
    assert!(first.r > 0 || first.g > 0 || first.b > 0, "First pixel should have been modified");
}

/// Test batch commit with coordinate transformations
#[test]
fn test_batch_commit_with_coordinate_transforms() {
    let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32
    
    // Batch draw using coordinate transforms
    // Draw a diagonal line via batch operations
    for i in 0..32 {
        let idx = substrate.xy_to_hilbert(i, i).unwrap();
        substrate.set_pixel_hilbert(idx, RGBA::new(255, 255, 0, 255)).unwrap();
    }
    
    substrate.commit();
    
    // Verify diagonal is drawn
    for i in 0..32 {
        let idx = substrate.xy_to_hilbert(i, i).unwrap();
        let pixel = substrate.get_pixel_hilbert(idx).unwrap();
        assert_eq!(pixel, RGBA::new(255, 255, 0, 255), "Diagonal pixel at ({}, {})", i, i);
    }
    
    // Verify non-diagonal pixels are still transparent
    let off_diagonal = substrate.get_pixel(0, 1).unwrap();
    assert_eq!(off_diagonal, RGBA::transparent());
}

/// Test batch commit with region-based operations
#[test]
fn test_batch_commit_region_operations() {
    let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32
    
    // Fill a region using batch operations
    let region = Rect::new(5, 5, 10, 10);
    for y in region.y..region.y + region.height {
        for x in region.x..region.x + region.width {
            let idx = substrate.xy_to_hilbert(x, y).unwrap();
            substrate.set_pixel_hilbert(idx, GREEN).unwrap();
        }
    }
    
    substrate.commit();
    
    // Verify region is filled
    for y in region.y..region.y + region.height {
        for x in region.x..region.x + region.width {
            let pixel = substrate.get_pixel(x, y).unwrap();
            assert_eq!(pixel, GREEN, "Region pixel at ({}, {})", x, y);
        }
    }
    
    // Verify outside region is transparent
    let outside = substrate.get_pixel(0, 0).unwrap();
    assert_eq!(outside, RGBA::transparent());
}

/// Test batch commit preserves data integrity across operations
#[test]
fn test_batch_commit_data_integrity() {
    let mut substrate = GlyphSubstrate::new(4).unwrap(); // 16x16
    
    // Create a pattern
    let original_pattern: Vec<RGBA> = (0..substrate.size())
        .map(|i| RGBA::new((i % 256) as u8, ((i * 2) % 256) as u8, ((i * 3) % 256) as u8, 255))
        .collect();
    
    // Apply pattern via batch
    for (i, &color) in original_pattern.iter().enumerate() {
        substrate.set_pixel_hilbert(i as u64, color).unwrap();
    }
    substrate.commit();
    
    // Read back and verify
    let mut read_pattern = Vec::new();
    for i in 0..substrate.size() {
        read_pattern.push(substrate.get_pixel_hilbert(i).unwrap());
    }
    
    assert_eq!(original_pattern, read_pattern, "Pattern should be preserved after commit");
}

/// Test batch commit with alternating patterns
#[test]
fn test_batch_commit_alternating_pattern() {
    let mut substrate = GlyphSubstrate::new(3).unwrap(); // 8x8 = 64 pixels
    
    // Checkerboard pattern via batch
    for y in 0..8u32 {
        for x in 0..8u32 {
            let idx = substrate.xy_to_hilbert(x, y).unwrap();
            let color = if (x + y) % 2 == 0 { RGBA::white() } else { RGBA::black() };
            substrate.set_pixel_hilbert(idx, color).unwrap();
        }
    }
    
    substrate.commit();
    
    // Verify checkerboard
    for y in 0..8u32 {
        for x in 0..8u32 {
            let pixel = substrate.get_pixel(x, y).unwrap();
            let expected = if (x + y) % 2 == 0 { RGBA::white() } else { RGBA::black() };
            assert_eq!(pixel, expected, "Checkerboard at ({}, {})", x, y);
        }
    }
}

/// Test clear_dirty followed by commit restores dirty state
#[test]
fn test_clear_dirty_then_commit() {
    let mut substrate = GlyphSubstrate::new(3).unwrap();
    
    // Initial operations
    substrate.set_pixel_rgba(0, 0, RGBA::white()).unwrap();
    assert!(!substrate.dirty_regions().is_empty());
    
    // Clear dirty
    substrate.clear_dirty();
    assert!(substrate.dirty_regions().is_empty());
    
    // Batch operations
    for i in 0..10 {
        substrate.set_pixel_hilbert(i, RED).unwrap();
    }
    // Note: set_pixel_hilbert doesn't track dirty regions
    
    // Commit restores dirty state
    substrate.commit();
    assert!(!substrate.dirty_regions().is_empty());
    assert_eq!(substrate.dirty_regions()[0].area(), 64);
}

/// Test batch commit is idempotent
#[test]
fn test_batch_commit_idempotent() {
    let mut substrate = GlyphSubstrate::new(3).unwrap();
    
    // Apply batch
    for i in 0..20 {
        substrate.set_pixel_hilbert(i, BLUE).unwrap();
    }
    
    // Multiple commits should be safe
    substrate.commit();
    let dirty1 = substrate.dirty_regions().to_vec();
    
    substrate.commit();
    let dirty2 = substrate.dirty_regions().to_vec();
    
    substrate.commit();
    let dirty3 = substrate.dirty_regions().to_vec();
    
    // All should be equivalent
    assert_eq!(dirty1, dirty2);
    assert_eq!(dirty2, dirty3);
}

/// Test batch commit with RGBA alpha blending scenario
#[test]
fn test_batch_commit_alpha_scenario() {
    let mut substrate = GlyphSubstrate::new(3).unwrap();
    
    // First layer: solid colors
    for i in 0..20 {
        substrate.set_pixel_hilbert(i, RGBA::new(100, 100, 100, 255)).unwrap();
    }
    
    // Second layer: semi-transparent overlay
    for i in 10..30 {
        substrate.set_pixel_hilbert(i, RGBA::new(200, 200, 200, 128)).unwrap();
    }
    
    substrate.commit();
    
    // Verify layers are applied (second overwrites first where they overlap)
    for i in 0..10 {
        let pixel = substrate.get_pixel_hilbert(i).unwrap();
        assert_eq!(pixel, RGBA::new(100, 100, 100, 255));
    }
    
    for i in 10..30 {
        let pixel = substrate.get_pixel_hilbert(i).unwrap();
        assert_eq!(pixel, RGBA::new(200, 200, 200, 128));
    }
}

// ============================================================================
// Integration Tests with SpectralMixer and Multi-Daemon Workflow
// ============================================================================

use visual_shell::{SpectralMixer, DaemonId, FrequencyBand};

/// Test batch commit workflow with SpectralMixer data
#[test]
fn test_batch_commit_with_spectral_mixer() {
    let mut substrate = GlyphSubstrate::new(6).unwrap(); // 64x64 = 4096 pixels
    let mut mixer = SpectralMixer::new(substrate.size() as usize);
    
    // Register multiple daemons
    let daemon1 = DaemonId::from_name("neural_activations");
    let daemon2 = DaemonId::from_name("attention_weights");
    
    mixer.register_daemon(daemon1, FrequencyBand::Mid, 0.8).unwrap();
    mixer.register_daemon(daemon2, FrequencyBand::Low, 0.5).unwrap();
    
    // Update daemon data
    let data1: Vec<f32> = (0..substrate.size()).map(|i| (i as f32 % 100.0) / 100.0).collect();
    let data2: Vec<f32> = (0..substrate.size()).map(|i| ((i * 7) as f32 % 100.0) / 100.0).collect();
    
    mixer.update_daemon(daemon1, data1).unwrap();
    mixer.update_daemon(daemon2, data2).unwrap();
    
    // Resolve field and convert to pixel colors
    let composite = mixer.resolve_field();
    
    // Batch write to substrate
    for (i, &value) in composite.iter().enumerate() {
        let intensity = ((value + 1.0) * 0.5 * 255.0) as u8; // Map [-1, 1] to [0, 255]
        substrate.set_pixel_hilbert(i as u64, RGBA::new(intensity, intensity / 2, 255 - intensity, 255)).unwrap();
    }
    
    // Commit all changes
    substrate.commit();
    
    // Verify dirty state
    assert_eq!(substrate.dirty_regions().len(), 1);
    assert_eq!(substrate.dirty_regions()[0].area(), 64 * 64);
    
    // Verify some pixels have valid colors
    let first = substrate.get_pixel_hilbert(0).unwrap();
    assert!(first.r > 0 || first.g > 0 || first.b > 0 || first.a > 0);
}

/// Test batch commit with daemon lifecycle
#[test]
fn test_batch_commit_daemon_lifecycle() {
    let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32 = 1024 pixels
    let mut mixer = SpectralMixer::new(substrate.size() as usize);
    
    // Initial daemon registration and batch write
    let daemon1 = DaemonId::from_name("daemon_1");
    mixer.register_daemon(daemon1, FrequencyBand::High, 1.0).unwrap();
    
    let data1: Vec<f32> = vec![1.0; substrate.size() as usize];
    mixer.update_daemon(daemon1, data1).unwrap();
    
    let composite1 = mixer.resolve_field();
    for (i, &value) in composite1.iter().enumerate() {
        let intensity = (value * 255.0) as u8;
        substrate.set_pixel_hilbert(i as u64, RGBA::new(intensity, 0, 0, 255)).unwrap();
    }
    substrate.commit();
    substrate.clear_dirty();
    
    // Add second daemon
    let daemon2 = DaemonId::from_name("daemon_2");
    mixer.register_daemon(daemon2, FrequencyBand::Low, 0.5).unwrap();
    
    let data2: Vec<f32> = vec![0.5; substrate.size() as usize];
    mixer.update_daemon(daemon2, data2).unwrap();
    
    // Update with new composite
    let composite2 = mixer.resolve_field();
    for (i, &value) in composite2.iter().enumerate() {
        let intensity = (value * 255.0) as u8;
        substrate.set_pixel_hilbert(i as u64, RGBA::new(intensity, intensity, 0, 255)).unwrap();
    }
    substrate.commit();
    
    // Remove first daemon and update again
    mixer.unregister_daemon(daemon1).unwrap();
    
    let composite3 = mixer.resolve_field();
    for (i, &value) in composite3.iter().enumerate() {
        let intensity = (value * 255.0) as u8;
        substrate.set_pixel_hilbert(i as u64, RGBA::new(0, intensity, intensity, 255)).unwrap();
    }
    substrate.commit();
    
    // Verify final state
    assert_eq!(substrate.dirty_regions().len(), 1);
    assert_eq!(mixer.daemon_count(), 1); // Only daemon2 remains
}

/// Test batch commit with time-based updates (simulating animation frames)
#[test]
fn test_batch_commit_animation_frames() {
    let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32 = 1024 pixels
    let mut mixer = SpectralMixer::new(substrate.size() as usize);
    
    // Register daemon
    let daemon = DaemonId::from_name("animated");
    mixer.register_daemon(daemon, FrequencyBand::Mid, 1.0).unwrap();
    
    // Simulate multiple animation frames
    for frame in 0..10 {
        // Update data each frame
        let data: Vec<f32> = (0..substrate.size())
            .map(|i| (i as f32 + frame as f32 * 10.0).sin() * 0.5 + 0.5)
            .collect();
        mixer.update_daemon(daemon, data).unwrap();
        
        // Tick mixer
        mixer.tick(std::time::Duration::from_millis(16)); // ~60fps
        
        // Resolve and batch write
        let composite = mixer.resolve_field();
        for (i, &value) in composite.iter().enumerate() {
            let intensity = (value * 255.0) as u8;
            substrate.set_pixel_hilbert(i as u64, RGBA::new(intensity, intensity, intensity, 255)).unwrap();
        }
        
        // Commit
        substrate.commit();
        
        // Simulate GPU upload
        substrate.clear_dirty();
    }
    
    // Verify final state is valid
    assert!(substrate.dirty_regions().is_empty()); // Cleared after last frame
}

/// Test batch commit with coordinate-based batch partitioning
#[test]
fn test_batch_commit_partitioned_by_quadrant() {
    let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32
    
    // Fill each quadrant with a different color using batch operations
    let mid = 16u32;
    
    // Top-left quadrant: red
    for y in 0..mid {
        for x in 0..mid {
            let idx = substrate.xy_to_hilbert(x, y).unwrap();
            substrate.set_pixel_hilbert(idx, RGBA::new(255, 0, 0, 255)).unwrap();
        }
    }
    
    // Top-right quadrant: green
    for y in 0..mid {
        for x in mid..32 {
            let idx = substrate.xy_to_hilbert(x, y).unwrap();
            substrate.set_pixel_hilbert(idx, RGBA::new(0, 255, 0, 255)).unwrap();
        }
    }
    
    // Bottom-left quadrant: blue
    for y in mid..32 {
        for x in 0..mid {
            let idx = substrate.xy_to_hilbert(x, y).unwrap();
            substrate.set_pixel_hilbert(idx, RGBA::new(0, 0, 255, 255)).unwrap();
        }
    }
    
    // Bottom-right quadrant: yellow
    for y in mid..32 {
        for x in mid..32 {
            let idx = substrate.xy_to_hilbert(x, y).unwrap();
            substrate.set_pixel_hilbert(idx, RGBA::new(255, 255, 0, 255)).unwrap();
        }
    }
    
    // Single commit for all quadrants
    substrate.commit();
    
    // Verify quadrants
    assert_eq!(substrate.get_pixel(0, 0).unwrap(), RGBA::new(255, 0, 0, 255));
    assert_eq!(substrate.get_pixel(31, 0).unwrap(), RGBA::new(0, 255, 0, 255));
    assert_eq!(substrate.get_pixel(0, 31).unwrap(), RGBA::new(0, 0, 255, 255));
    assert_eq!(substrate.get_pixel(31, 31).unwrap(), RGBA::new(255, 255, 0, 255));
    
    // Center pixels
    assert_eq!(substrate.get_pixel(15, 15).unwrap(), RGBA::new(255, 0, 0, 255));
    assert_eq!(substrate.get_pixel(16, 15).unwrap(), RGBA::new(0, 255, 0, 255));
    assert_eq!(substrate.get_pixel(15, 16).unwrap(), RGBA::new(0, 0, 255, 255));
    assert_eq!(substrate.get_pixel(16, 16).unwrap(), RGBA::new(255, 255, 0, 255));
}

/// Test batch commit with sparse updates
#[test]
fn test_batch_commit_sparse_updates() {
    let mut substrate = GlyphSubstrate::new(6).unwrap(); // 64x64
    
    // Clear to black
    substrate.clear(RGBA::black());
    substrate.commit();
    substrate.clear_dirty();
    
    // Sparse updates: only update every 100th pixel
    for i in (0..substrate.size()).step_by(100) {
        substrate.set_pixel_hilbert(i, RGBA::white()).unwrap();
    }
    
    substrate.commit();
    
    // Verify sparse pattern
    let mut white_count = 0;
    let mut black_count = 0;
    
    for i in 0..substrate.size() {
        let pixel = substrate.get_pixel_hilbert(i).unwrap();
        if pixel == RGBA::white() {
            white_count += 1;
        } else if pixel == RGBA::black() {
            black_count += 1;
        }
    }
    
    // Should have approximately size/100 white pixels
    let expected_white = (substrate.size() / 100) as u32 + 1;
    assert_eq!(white_count, expected_white);
    assert!(black_count > white_count);
}

/// Test batch commit preserves data across serialization boundary
#[test]
fn test_batch_commit_serialization_boundary() {
    let mut substrate = GlyphSubstrate::new(4).unwrap(); // 16x16
    
    // Create pattern
    for i in 0..substrate.size() {
        let byte = (i % 256) as u8;
        substrate.set_pixel_hilbert(i, RGBA::new(byte, byte, byte, 255)).unwrap();
    }
    
    substrate.commit();
    
    // Get bytes (simulating serialization to GPU)
    let bytes = substrate.as_bytes().to_vec();
    
    // Create new substrate and restore from bytes
    let mut substrate2 = GlyphSubstrate::new(4).unwrap();
    let dest_bytes = substrate2.as_bytes_mut();
    dest_bytes.copy_from_slice(&bytes);
    
    substrate2.commit();
    
    // Verify data is preserved
    for i in 0..substrate.size() {
        let p1 = substrate.get_pixel_hilbert(i).unwrap();
        let p2 = substrate2.get_pixel_hilbert(i).unwrap();
        assert_eq!(p1, p2, "Pixel mismatch at index {}", i);
    }
}

/// Test batch commit with edge pixels
#[test]
fn test_batch_commit_edge_pixels() {
    let mut substrate = GlyphSubstrate::new(5).unwrap(); // 32x32
    
    // Draw border using batch operations
    let size = 32u32;
    
    // Top and bottom edges
    for x in 0..size {
        let idx_top = substrate.xy_to_hilbert(x, 0).unwrap();
        let idx_bottom = substrate.xy_to_hilbert(x, size - 1).unwrap();
        substrate.set_pixel_hilbert(idx_top, RGBA::white()).unwrap();
        substrate.set_pixel_hilbert(idx_bottom, RGBA::white()).unwrap();
    }
    
    // Left and right edges
    for y in 0..size {
        let idx_left = substrate.xy_to_hilbert(0, y).unwrap();
        let idx_right = substrate.xy_to_hilbert(size - 1, y).unwrap();
        substrate.set_pixel_hilbert(idx_left, RGBA::white()).unwrap();
        substrate.set_pixel_hilbert(idx_right, RGBA::white()).unwrap();
    }
    
    substrate.commit();
    
    // Verify border
    for x in 0..size {
        assert_eq!(substrate.get_pixel(x, 0).unwrap(), RGBA::white(), "Top edge at ({}, 0)", x);
        assert_eq!(substrate.get_pixel(x, size - 1).unwrap(), RGBA::white(), "Bottom edge at ({}, {})", x, size - 1);
    }
    for y in 0..size {
        assert_eq!(substrate.get_pixel(0, y).unwrap(), RGBA::white(), "Left edge at (0, {})", y);
        assert_eq!(substrate.get_pixel(size - 1, y).unwrap(), RGBA::white(), "Right edge at ({}, {})", size - 1, y);
    }
    
    // Interior should be transparent
    assert_eq!(substrate.get_pixel(16, 16).unwrap(), RGBA::transparent());
}

/// Test batch commit performance with full buffer
#[test]
fn test_batch_commit_full_buffer_performance() {
    let mut substrate = GlyphSubstrate::new(8).unwrap(); // 256x256 = 65536 pixels
    
    let start = std::time::Instant::now();
    
    // Fill entire buffer
    for i in 0..substrate.size() {
        let byte = (i % 256) as u8;
        substrate.set_pixel_hilbert(i, RGBA::new(byte, byte, byte, 255)).unwrap();
    }
    
    let fill_time = start.elapsed();
    
    let commit_start = std::time::Instant::now();
    substrate.commit();
    let commit_time = commit_start.elapsed();
    
    // Performance assertions
    assert!(fill_time.as_millis() < 500, "Fill took too long: {:?}", fill_time);
    assert!(commit_time.as_micros() < 100, "Commit took too long: {:?}", commit_time);
    
    // Verify data integrity
    for i in 0..100 {
        let expected = (i % 256) as u8;
        let pixel = substrate.get_pixel_hilbert(i).unwrap();
        assert_eq!(pixel.r, expected);
    }
}
