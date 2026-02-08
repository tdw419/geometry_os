"""
Unit tests for PixelRTS v2 Core Library
"""

import pytest
from geometry_os.systems.pixel_compiler.pixelrts_v2_core import HilbertCurve


def test_hilbert_lut_generation():
    """Test that Hilbert LUT generates correct coordinates for small grid."""
    hilbert = HilbertCurve(order=2)  # 4x4 grid
    lut = hilbert.generate_lut()

    # Expected 4x4 Hilbert curve coordinates
    expected = [
        (0, 0), (0, 1), (1, 1), (1, 0),
        (2, 0), (3, 0), (3, 1), (2, 1),
        (2, 2), (3, 2), (3, 3), (2, 3),
        (1, 3), (1, 2), (0, 2), (0, 3)
    ]

    assert len(lut) == 16
    assert lut == expected


def test_hilbert_index_to_coord():
    """Test bidirectional index <-> coordinate mapping."""
    hilbert = HilbertCurve(order=3)  # 8x8 grid

    # Test known positions
    assert hilbert.index_to_coord(0) == (0, 0)
    assert hilbert.index_to_coord(63) == (0, 7)

    # Test round-trip
    for idx in [0, 15, 31, 47, 63]:
        x, y = hilbert.index_to_coord(idx)
        recovered = hilbert.coord_to_index(x, y)
        assert recovered == idx


def test_hilbert_8x8_coordinates():
    """Test 8x8 Hilbert curve specific coordinates."""
    hilbert = HilbertCurve(order=3)  # 8x8 grid
    lut = hilbert.generate_lut()

    # Verify grid size
    assert len(lut) == 64

    # First few coordinates for 8x8 Hilbert curve
    # The pattern follows Hilbert curve traversal
    assert lut[0] == (0, 0)
    assert lut[1] == (1, 0)
    assert lut[2] == (1, 1)
    assert lut[3] == (0, 1)

    # Last coordinate for this Hilbert curve orientation
    assert lut[63] == (0, 7)


def test_hilbert_grid_size_calculation():
    """Test that grid size is calculated correctly from order."""
    hilbert_order2 = HilbertCurve(order=2)
    assert hilbert_order2.grid_size == 4

    hilbert_order3 = HilbertCurve(order=3)
    assert hilbert_order3.grid_size == 8

    hilbert_order10 = HilbertCurve(order=10)
    assert hilbert_order10.grid_size == 1024


def test_hilbert_lut_caching():
    """Test that LUT is cached and not regenerated."""
    hilbert = HilbertCurve(order=2)

    # Generate LUT first time
    lut1 = hilbert.generate_lut()

    # Generate LUT second time - should return cached version
    lut2 = hilbert.generate_lut()

    assert lut1 is lut2  # Same object reference
    assert lut1 == lut2  # Same values


def test_hilbert_all_coords_unique():
    """Test that all coordinates in LUT are unique."""
    hilbert = HilbertCurve(order=4)  # 16x16 grid
    lut = hilbert.generate_lut()

    # All coordinates should be unique
    assert len(lut) == len(set(lut))

    # All coordinates should be within grid bounds
    for x, y in lut:
        assert 0 <= x < 16
        assert 0 <= y < 16


def test_hilbert_coord_to_index_all_positions():
    """Test coord_to_index for all positions in 4x4 grid."""
    hilbert = HilbertCurve(order=2)
    lut = hilbert.generate_lut()

    # For each coordinate, verify round-trip
    for idx, (x, y) in enumerate(lut):
        recovered_idx = hilbert.coord_to_index(x, y)
        assert recovered_idx == idx
