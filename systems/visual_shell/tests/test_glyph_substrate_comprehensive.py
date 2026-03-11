"""
Comprehensive test suite for Glyph Substrate - Native Glyph Shell

Tests cover edge cases, boundary conditions, performance scenarios,
and integration patterns for the glyph substrate rendering system.
"""

import pytest
import struct
import math
from typing import List, Tuple


class MockGlyphSubstrate:
    """
    Python mock of the Rust GlyphSubstrate for testing logic.
    Simulates Hilbert curve mapping and pixel operations.
    """

    def __init__(self, order: int):
        if order < 1 or order > 10:
            raise ValueError(f"Order must be 1-10, got {order}")
        self.order = order
        self.dimension = 1 << order  # 2^order
        self.size = self.dimension * self.dimension
        self.buffer = [(0, 0, 0, 0)] * self.size  # RGBA tuples
        self.dirty_regions: List[Tuple[int, int, int, int]] = []

    def _hilbert_index_to_coord(self, index: int) -> Tuple[int, int]:
        """Convert Hilbert index to (x, y) coordinates."""
        x = y = 0
        s = 1
        n = self.dimension

        while s < n:
            rx = 1 & (index >> 1)
            ry = 1 & (index ^ rx)

            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x

            x += s * rx
            y += s * ry
            index >>= 2
            s <<= 1

        return (x, y)

    def _coord_to_hilbert_index(self, x: int, y: int) -> int:
        """Convert (x, y) coordinates to Hilbert index."""
        d = 0
        s = self.dimension >> 1

        while s > 0:
            rx = 1 if (x & s) else 0
            ry = 1 if (y & s) else 0
            d += s * s * ((3 * rx) ^ ry)

            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x

            s >>= 1

        return d

    def set_pixel(self, x: int, y: int, color: Tuple[int, int, int, int]):
        """Set a pixel at (x, y) coordinates."""
        if x < 0 or x >= self.dimension or y < 0 or y >= self.dimension:
            raise IndexError(f"Coordinates ({x}, {y}) out of bounds for {self.dimension}x{self.dimension}")

        idx = self._coord_to_hilbert_index(x, y)
        self.buffer[idx] = color
        self.dirty_regions.append((x, y, 1, 1))

    def get_pixel(self, x: int, y: int) -> Tuple[int, int, int, int]:
        """Get pixel at (x, y) coordinates."""
        if x < 0 or x >= self.dimension or y < 0 or y >= self.dimension:
            raise IndexError(f"Coordinates ({x}, {y}) out of bounds for {self.dimension}x{self.dimension}")

        idx = self._coord_to_hilbert_index(x, y)
        return self.buffer[idx]

    def fill_rect(self, x: int, y: int, w: int, h: int, color: Tuple[int, int, int, int]):
        """Fill a rectangle with a color."""
        for dy in range(h):
            for dx in range(w):
                self.set_pixel(x + dx, y + dy, color)

    def clear(self, color: Tuple[int, int, int, int] = (0, 0, 0, 0)):
        """Clear the entire buffer."""
        self.buffer = [color] * self.size
        self.dirty_regions = [(0, 0, self.dimension, self.dimension)]

    def clear_dirty(self):
        """Clear dirty region tracking."""
        self.dirty_regions = []


class TestGlyphSubstrateCreation:
    """Tests for substrate creation and initialization."""

    def test_valid_order_range(self):
        """Test all valid orders from 1 to 10."""
        for order in range(1, 11):
            substrate = MockGlyphSubstrate(order)
            expected_dim = 1 << order
            assert substrate.dimension == expected_dim
            assert substrate.size == expected_dim * expected_dim

    def test_invalid_order_zero(self):
        """Order 0 should raise ValueError."""
        with pytest.raises(ValueError):
            MockGlyphSubstrate(0)

    def test_invalid_order_eleven(self):
        """Order 11 should raise ValueError (exceeds max)."""
        with pytest.raises(ValueError):
            MockGlyphSubstrate(11)

    def test_invalid_order_negative(self):
        """Negative order should raise ValueError."""
        with pytest.raises(ValueError):
            MockGlyphSubstrate(-1)

    def test_dimension_calculation(self):
        """Verify dimension = 2^order."""
        test_cases = [
            (1, 2),
            (2, 4),
            (3, 8),
            (4, 16),
            (5, 32),
            (6, 64),
            (7, 128),
            (8, 256),
            (9, 512),
            (10, 1024),
        ]
        for order, expected_dim in test_cases:
            substrate = MockGlyphSubstrate(order)
            assert substrate.dimension == expected_dim, f"Order {order} should have dimension {expected_dim}"


class TestHilbertCurveMapping:
    """Tests for Hilbert curve coordinate transformations."""

    def test_origin_index(self):
        """Index 0 should map to origin (0, 0)."""
        substrate = MockGlyphSubstrate(4)
        coord = substrate._hilbert_index_to_coord(0)
        assert coord == (0, 0)

    def test_last_index(self):
        """Last index should map to valid coordinates."""
        substrate = MockGlyphSubstrate(4)
        last_idx = substrate.size - 1
        x, y = substrate._hilbert_index_to_coord(last_idx)
        assert 0 <= x < substrate.dimension
        assert 0 <= y < substrate.dimension

    def test_roundtrip_all_indices(self):
        """All indices should roundtrip through coord conversion."""
        substrate = MockGlyphSubstrate(3)  # 8x8 = 64 indices
        for idx in range(substrate.size):
            x, y = substrate._hilbert_index_to_coord(idx)
            recovered = substrate._coord_to_hilbert_index(x, y)
            assert idx == recovered, f"Roundtrip failed for index {idx}: ({x}, {y}) -> {recovered}"

    def test_roundtrip_all_coords(self):
        """All coordinates should roundtrip through index conversion."""
        substrate = MockGlyphSubstrate(3)
        for y in range(substrate.dimension):
            for x in range(substrate.dimension):
                idx = substrate._coord_to_hilbert_index(x, y)
                rx, ry = substrate._hilbert_index_to_coord(idx)
                assert (x, y) == (rx, ry), f"Roundtrip failed for ({x}, {y}) -> idx {idx} -> ({rx}, {ry})"

    def test_locality_preservation(self):
        """Adjacent indices should generally map to nearby coordinates."""
        substrate = MockGlyphSubstrate(4)
        nearby_count = 0
        total_pairs = 100

        for i in range(total_pairs):
            x1, y1 = substrate._hilbert_index_to_coord(i)
            x2, y2 = substrate._hilbert_index_to_coord(i + 1)
            distance = math.sqrt((x2 - x1) ** 2 + (y2 - y1) ** 2)
            if distance <= 2.0:  # Nearby if within 2 pixels
                nearby_count += 1

        locality = nearby_count / total_pairs
        assert locality >= 0.8, f"Locality should be >= 80%, got {locality * 100:.1f}%"

    def test_hilbert_order2_pattern(self):
        """Test known Hilbert pattern for order 2 (4x4 grid)."""
        substrate = MockGlyphSubstrate(2)
        # Expected pattern for order 2:
        # 0  1  14 15
        # 3  2  13 12
        # 4  7  8  11
        # 5  6  9  10
        expected = {
            (0, 0): 0, (1, 0): 1, (2, 0): 14, (3, 0): 15,
            (0, 1): 3, (1, 1): 2, (2, 1): 13, (3, 1): 12,
            (0, 2): 4, (1, 2): 7, (2, 2): 8, (3, 2): 11,
            (0, 3): 5, (1, 3): 6, (2, 3): 9, (3, 3): 10,
        }
        for (x, y), expected_idx in expected.items():
            actual_idx = substrate._coord_to_hilbert_index(x, y)
            assert actual_idx == expected_idx, f"Expected idx {expected_idx} at ({x}, {y}), got {actual_idx}"


class TestPixelOperations:
    """Tests for pixel read/write operations."""

    def test_set_and_get_pixel(self):
        """Set and retrieve a single pixel."""
        substrate = MockGlyphSubstrate(4)
        color = (255, 128, 64, 255)
        substrate.set_pixel(5, 7, color)
        assert substrate.get_pixel(5, 7) == color

    def test_set_pixel_bounds_check_low(self):
        """Setting pixel at negative coordinates should fail."""
        substrate = MockGlyphSubstrate(4)
        with pytest.raises(IndexError):
            substrate.set_pixel(-1, 0, (255, 0, 0, 255))
        with pytest.raises(IndexError):
            substrate.set_pixel(0, -1, (255, 0, 0, 255))

    def test_set_pixel_bounds_check_high(self):
        """Setting pixel beyond dimension should fail."""
        substrate = MockGlyphSubstrate(4)  # 16x16
        with pytest.raises(IndexError):
            substrate.set_pixel(16, 0, (255, 0, 0, 255))
        with pytest.raises(IndexError):
            substrate.set_pixel(0, 16, (255, 0, 0, 255))

    def test_get_pixel_bounds_check_low(self):
        """Getting pixel at negative coordinates should fail."""
        substrate = MockGlyphSubstrate(4)
        with pytest.raises(IndexError):
            substrate.get_pixel(-1, 0)
        with pytest.raises(IndexError):
            substrate.get_pixel(0, -1)

    def test_get_pixel_bounds_check_high(self):
        """Getting pixel beyond dimension should fail."""
        substrate = MockGlyphSubstrate(4)  # 16x16
        with pytest.raises(IndexError):
            substrate.get_pixel(16, 0)
        with pytest.raises(IndexError):
            substrate.get_pixel(0, 16)

    def test_fill_rect_basic(self):
        """Fill a rectangle and verify all pixels."""
        substrate = MockGlyphSubstrate(4)
        color = (255, 0, 0, 255)
        substrate.fill_rect(2, 2, 4, 4, color)

        # Check interior
        for y in range(2, 6):
            for x in range(2, 6):
                assert substrate.get_pixel(x, y) == color, f"Pixel at ({x}, {y}) should be red"

        # Check some exterior points
        assert substrate.get_pixel(0, 0) == (0, 0, 0, 0)  # Should be transparent
        assert substrate.get_pixel(7, 7) == (0, 0, 0, 0)

    def test_fill_rect_single_pixel(self):
        """Fill a 1x1 rectangle."""
        substrate = MockGlyphSubstrate(4)
        color = (0, 255, 0, 255)
        substrate.fill_rect(5, 5, 1, 1, color)
        assert substrate.get_pixel(5, 5) == color

    def test_clear_to_color(self):
        """Clear buffer to a specific color."""
        substrate = MockGlyphSubstrate(2)
        color = (128, 128, 128, 255)
        substrate.clear(color)

        for y in range(substrate.dimension):
            for x in range(substrate.dimension):
                assert substrate.get_pixel(x, y) == color


class TestDirtyRegionTracking:
    """Tests for dirty region tracking functionality."""

    def test_initial_dirty_regions_empty(self):
        """New substrate should have no dirty regions."""
        substrate = MockGlyphSubstrate(4)
        assert len(substrate.dirty_regions) == 0

    def test_set_pixel_adds_dirty_region(self):
        """Setting a pixel should add a dirty region."""
        substrate = MockGlyphSubstrate(4)
        substrate.set_pixel(5, 5, (255, 255, 255, 255))
        assert len(substrate.dirty_regions) == 1
        assert substrate.dirty_regions[0] == (5, 5, 1, 1)

    def test_multiple_pixels_multiple_regions(self):
        """Multiple pixel sets should create multiple dirty regions."""
        substrate = MockGlyphSubstrate(4)
        substrate.set_pixel(1, 1, (255, 0, 0, 255))
        substrate.set_pixel(2, 2, (0, 255, 0, 255))
        substrate.set_pixel(3, 3, (0, 0, 255, 255))
        assert len(substrate.dirty_regions) == 3

    def test_clear_dirty(self):
        """clear_dirty should remove all tracked regions."""
        substrate = MockGlyphSubstrate(4)
        substrate.set_pixel(1, 1, (255, 0, 0, 255))
        substrate.set_pixel(2, 2, (0, 255, 0, 255))
        substrate.clear_dirty()
        assert len(substrate.dirty_regions) == 0

    def test_clear_creates_full_region(self):
        """Clear operation should create full-buffer dirty region."""
        substrate = MockGlyphSubstrate(4)
        substrate.clear((128, 128, 128, 255))
        assert len(substrate.dirty_regions) == 1
        assert substrate.dirty_regions[0] == (0, 0, 16, 16)


class TestEdgeCases:
    """Tests for edge cases and boundary conditions."""

    def test_corner_pixels(self):
        """Test setting/getting all four corner pixels."""
        substrate = MockGlyphSubstrate(4)  # 16x16
        colors = [
            ((0, 0), (255, 0, 0, 255)),      # Top-left
            ((15, 0), (0, 255, 0, 255)),     # Top-right
            ((0, 15), (0, 0, 255, 255)),     # Bottom-left
            ((15, 15), (255, 255, 0, 255)),  # Bottom-right
        ]

        for (x, y), color in colors:
            substrate.set_pixel(x, y, color)
            assert substrate.get_pixel(x, y) == color

    def test_max_order_substrate(self):
        """Test substrate at maximum order (10 = 1024x1024)."""
        substrate = MockGlyphSubstrate(10)
        assert substrate.dimension == 1024
        assert substrate.size == 1024 * 1024

        # Test a few pixel operations
        substrate.set_pixel(0, 0, (255, 255, 255, 255))
        substrate.set_pixel(1023, 1023, (128, 128, 128, 255))
        assert substrate.get_pixel(0, 0) == (255, 255, 255, 255)
        assert substrate.get_pixel(1023, 1023) == (128, 128, 128, 255)

    def test_min_order_substrate(self):
        """Test substrate at minimum order (1 = 2x2)."""
        substrate = MockGlyphSubstrate(1)
        assert substrate.dimension == 2
        assert substrate.size == 4

        # Fill all pixels
        colors = [(255, 0, 0, 255), (0, 255, 0, 255), (0, 0, 255, 255), (255, 255, 255, 255)]
        indices = [(0, 0), (1, 0), (0, 1), (1, 1)]
        for (x, y), color in zip(indices, colors):
            substrate.set_pixel(x, y, color)

        for (x, y), color in zip(indices, colors):
            assert substrate.get_pixel(x, y) == color

    def test_transparent_pixels(self):
        """Test handling of fully transparent pixels."""
        substrate = MockGlyphSubstrate(4)
        transparent = (0, 0, 0, 0)
        substrate.set_pixel(5, 5, transparent)
        assert substrate.get_pixel(5, 5) == transparent

    def test_semi_transparent_pixels(self):
        """Test handling of semi-transparent pixels."""
        substrate = MockGlyphSubstrate(4)
        semi_transparent = (255, 128, 64, 128)
        substrate.set_pixel(5, 5, semi_transparent)
        assert substrate.get_pixel(5, 5) == semi_transparent

    def test_extreme_color_values(self):
        """Test all-0 and all-255 color values."""
        substrate = MockGlyphSubstrate(4)

        # All zeros (black, transparent)
        substrate.set_pixel(1, 1, (0, 0, 0, 0))

        # All 255 (white, opaque)
        substrate.set_pixel(2, 2, (255, 255, 255, 255))

        assert substrate.get_pixel(1, 1) == (0, 0, 0, 0)
        assert substrate.get_pixel(2, 2) == (255, 255, 255, 255)


class TestPerformancePatterns:
    """Tests that simulate performance-sensitive usage patterns."""

    def test_sequential_pixel_writes(self):
        """Test sequential pixel write pattern (common in rendering)."""
        substrate = MockGlyphSubstrate(4)
        color = (255, 128, 64, 255)

        # Sequential writes along a row
        for x in range(substrate.dimension):
            substrate.set_pixel(x, 5, color)

        # Verify
        for x in range(substrate.dimension):
            assert substrate.get_pixel(x, 5) == color

    def test_column_pixel_writes(self):
        """Test column-wise pixel write pattern."""
        substrate = MockGlyphSubstrate(4)
        color = (64, 128, 255, 255)

        # Column writes
        for y in range(substrate.dimension):
            substrate.set_pixel(5, y, color)

        # Verify
        for y in range(substrate.dimension):
            assert substrate.get_pixel(5, y) == color

    def test_diagonal_pixel_writes(self):
        """Test diagonal pixel write pattern."""
        substrate = MockGlyphSubstrate(4)
        color = (255, 0, 255, 255)

        # Diagonal writes
        for i in range(substrate.dimension):
            substrate.set_pixel(i, i, color)

        # Verify
        for i in range(substrate.dimension):
            assert substrate.get_pixel(i, i) == color

    def test_scattered_pixel_writes(self):
        """Test scattered (non-sequential) pixel write pattern."""
        substrate = MockGlyphSubstrate(4)
        color = (0, 255, 255, 255)

        # Scattered writes (checkerboard-like)
        for y in range(substrate.dimension):
            for x in range(substrate.dimension):
                if (x + y) % 2 == 0:
                    substrate.set_pixel(x, y, color)

        # Verify checkerboard
        for y in range(substrate.dimension):
            for x in range(substrate.dimension):
                expected = color if (x + y) % 2 == 0 else (0, 0, 0, 0)
                assert substrate.get_pixel(x, y) == expected


class TestColorOperations:
    """Tests for color handling and manipulation."""

    def test_rgb_preservation(self):
        """RGB values should be preserved exactly."""
        substrate = MockGlyphSubstrate(4)
        color = (123, 45, 67)
        full_color = (*color, 255)
        substrate.set_pixel(0, 0, full_color)
        r, g, b, a = substrate.get_pixel(0, 0)
        assert (r, g, b) == color

    def test_alpha_preservation(self):
        """Alpha values should be preserved exactly."""
        substrate = MockGlyphSubstrate(4)
        for alpha in [0, 64, 128, 192, 255]:
            color = (255, 128, 64, alpha)
            substrate.set_pixel(alpha % 16, alpha % 16, color)
            _, _, _, a = substrate.get_pixel(alpha % 16, alpha % 16)
            assert a == alpha


class TestIntegrationScenarios:
    """Tests that simulate real-world usage scenarios."""

    def test_draw_simple_shape(self):
        """Simulate drawing a simple rectangular shape."""
        substrate = MockGlyphSubstrate(4)
        fill_color = (100, 150, 200, 255)
        border_color = (50, 75, 100, 255)

        # Draw fill
        substrate.fill_rect(4, 4, 8, 8, fill_color)

        # Draw borders
        for x in range(4, 12):
            substrate.set_pixel(x, 4, border_color)
            substrate.set_pixel(x, 11, border_color)
        for y in range(4, 12):
            substrate.set_pixel(4, y, border_color)
            substrate.set_pixel(11, y, border_color)

        # Verify corners have border color
        assert substrate.get_pixel(4, 4) == border_color
        assert substrate.get_pixel(11, 4) == border_color
        assert substrate.get_pixel(4, 11) == border_color
        assert substrate.get_pixel(11, 11) == border_color

        # Verify interior has fill color
        assert substrate.get_pixel(6, 6) == fill_color

    def test_layer_composition_simulation(self):
        """Simulate compositing multiple layers."""
        substrate = MockGlyphSubstrate(4)

        # Background layer
        bg_color = (0, 0, 40, 255)
        substrate.clear(bg_color)

        # Mid layer (semi-transparent overlay)
        mid_color = (128, 128, 128, 128)
        substrate.fill_rect(4, 4, 8, 8, mid_color)

        # Top layer (fully opaque accent)
        accent_color = (255, 0, 0, 255)
        substrate.fill_rect(6, 6, 4, 4, accent_color)

        # Verify top layer overwrites
        assert substrate.get_pixel(7, 7) == accent_color

        # Background outside should be unchanged
        assert substrate.get_pixel(0, 0) == bg_color

    def test_text_cursor_simulation(self):
        """Simulate drawing a blinking cursor."""
        substrate = MockGlyphSubstrate(4)
        cursor_color = (0, 255, 136, 255)  # Terminal green

        # Draw cursor bar
        for y in range(8):
            substrate.set_pixel(5, y, cursor_color)

        # Verify cursor is drawn
        for y in range(8):
            assert substrate.get_pixel(5, y) == cursor_color

        # Clear cursor (simulate blink off)
        for y in range(8):
            substrate.set_pixel(5, y, (0, 0, 0, 0))

        # Verify cursor is cleared
        for y in range(8):
            assert substrate.get_pixel(5, y) == (0, 0, 0, 0)
