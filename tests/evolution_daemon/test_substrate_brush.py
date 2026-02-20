"""
Tests for SubstrateBrush and HilbertBrush - binary painting on PixelRTS substrate.

Task 2 of substrate-cloning spec.
"""

import pytest
import numpy as np


class TestSubstrateBrush:
    """Tests for base SubstrateBrush class."""

    def test_brush_initializes_with_texture(self):
        """Brush should initialize with a texture array."""
        from systems.evolution_daemon.substrate_brush import SubstrateBrush

        # Create brush with 64x64 texture
        brush = SubstrateBrush(size=64)

        # Verify texture is initialized
        assert brush.size == 64
        assert brush.texture.shape == (64, 64, 4)
        assert brush.texture.dtype == np.uint8
        # Should start as all zeros (transparent black)
        assert np.all(brush.texture == 0)

    def test_brush_paint_pixel_at_coordinate(self):
        """Brush should paint a single pixel at given coordinates."""
        from systems.evolution_daemon.substrate_brush import SubstrateBrush

        brush = SubstrateBrush(size=64)

        # Paint a red pixel at (10, 20)
        color = (255, 0, 0, 255)  # RGBA: full red
        brush.paint_pixel(10, 20, color)

        # Verify pixel was painted
        texture = brush.get_texture()
        assert tuple(texture[20, 10]) == color  # Note: y, x indexing for numpy

        # Verify only that pixel was painted
        # Red pixel: R=255, A=255 -> 2 non-zero values
        # Check by looking for pixels that match the color
        matching_pixels = np.sum(np.all(texture == color, axis=2))
        assert matching_pixels == 1  # Exactly 1 red pixel

    def test_brush_paint_rect_region(self):
        """Brush should paint a rectangular region."""
        from systems.evolution_daemon.substrate_brush import SubstrateBrush

        brush = SubstrateBrush(size=64)

        # Paint a blue rectangle at (5, 5) with size 10x10
        color = (0, 0, 255, 255)  # RGBA: full blue
        brush.paint_rect(5, 5, 10, 10, color)

        # Verify rectangle was painted
        texture = brush.get_texture()

        # Check corners of rectangle
        assert tuple(texture[5, 5]) == color  # Top-left
        assert tuple(texture[14, 5]) == color  # Bottom-left
        assert tuple(texture[5, 14]) == color  # Top-right
        assert tuple(texture[14, 14]) == color  # Bottom-right

        # Check just outside rectangle (should be zero)
        assert tuple(texture[4, 4]) == (0, 0, 0, 0)  # Above/left
        assert tuple(texture[15, 15]) == (0, 0, 0, 0)  # Below/right

        # Count pixels matching the color
        matching_pixels = np.sum(np.all(texture == color, axis=2))
        assert matching_pixels == 10 * 10  # 10x10 rectangle


class TestHilbertBrush:
    """Tests for HilbertBrush with curve-indexed painting."""

    def test_hilbert_brush_uses_curve_index(self):
        """HilbertBrush should paint using Hilbert curve index instead of x,y."""
        from systems.evolution_daemon.substrate_brush import HilbertBrush

        # Create brush with 4x4 texture (order 2)
        brush = HilbertBrush(order=2)

        # Paint at Hilbert index 0
        color = (255, 255, 255, 255)  # White
        brush.paint_at_hilbert(0, color)

        # For order 2 (4x4 grid), index 0 maps to (0, 0) in Hilbert curve
        texture = brush.get_texture()

        # There should be exactly one white pixel
        white_pixels = np.sum(np.all(texture == color, axis=2))
        assert white_pixels == 1

    def test_hilbert_d2xy_roundtrip(self):
        """HilbertBrush d2xy and xy2d should be inverse operations."""
        from systems.evolution_daemon.substrate_brush import HilbertBrush

        # Create brush with 16x16 texture (order 4)
        brush = HilbertBrush(order=4)

        # Test roundtrip for several indices
        for test_index in [0, 5, 50, 100, 200, 255]:
            if test_index >= brush.grid_size * brush.grid_size:
                continue  # Skip indices outside grid

            # Convert index to coordinates
            x, y = brush.d2xy(test_index)

            # Convert back to index
            recovered_index = brush.xy2d(x, y)

            assert recovered_index == test_index, \
                f"Roundtrip failed: {test_index} -> ({x}, {y}) -> {recovered_index}"
