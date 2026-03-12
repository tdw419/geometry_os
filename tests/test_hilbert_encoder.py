# tests/test_hilbert_encoder.py
"""Tests for Hilbert encoder (2D ↔ 1D spatial encoding)."""

import pytest
import numpy as np
from systems.pixel_brain.hilbert_encoder import HilbertEncoder
from systems.pixel_brain.constants import TEXTURE_SIZE, QUADRANT_SIZE


class TestHilbertEncoderBasic:
    """Test basic Hilbert encoding/decoding."""

    @pytest.fixture
    def encoder(self):
        """Create encoder with default 256x256 grid."""
        return HilbertEncoder(grid_size=TEXTURE_SIZE)

    def test_origin_maps_to_zero(self, encoder):
        """(0, 0) should map to Hilbert index 0."""
        assert encoder.xy_to_hilbert(0, 0) == 0

    def test_zero_maps_to_origin(self, encoder):
        """Hilbert index 0 should map to (0, 0)."""
        assert encoder.hilbert_to_xy(0) == (0, 0)

    def test_roundtrip_preserves_coordinates(self, encoder):
        """Encoding then decoding should return original coordinates."""
        # Test corners and midpoints
        for x, y in [(0, 0), (0, 255), (255, 255), (255, 0), (128, 128)]:
            index = encoder.xy_to_hilbert(x, y)
            decoded_x, decoded_y = encoder.hilbert_to_xy(index)
            assert (decoded_x, decoded_y) == (x, y), f"Failed for ({x}, {y})"

    def test_roundtrip_preserves_index(self, encoder):
        """Decoding then encoding should return original index."""
        for index in [0, 1000, 16383, 32768, 65535]:
            x, y = encoder.hilbert_to_xy(index)
            decoded_index = encoder.xy_to_hilbert(x, y)
            assert decoded_index == index, f"Failed for index {index}"

    def test_indices_are_unique(self, encoder):
        """Each (x, y) should map to a unique index."""
        indices = set()
        for x in range(0, 256, 8):
            for y in range(0, 256, 8):
                index = encoder.xy_to_hilbert(x, y)
                assert index not in indices, f"Duplicate index {index} for ({x}, {y})"
                indices.add(index)


class TestHilbertSpatialLocality:
    """Test that Hilbert curve preserves spatial locality."""

    @pytest.fixture
    def encoder(self):
        return HilbertEncoder(grid_size=TEXTURE_SIZE)

    def test_quadrant_indices_in_correct_range(self, encoder):
        """Verify quadrant boundaries match expected Hilbert ranges."""
        # Hilbert Order-8 progression:
        # Q0: [0, 127] x [0, 127] (Top-Left) -> 0-16383
        # Q1: [0, 127] x [128, 255] (Bottom-Left) -> 16384-32767
        # Q2: [128, 255] x [128, 255] (Bottom-Right) -> 32768-49151
        # Q3: [128, 255] x [0, 127] (Top-Right) -> 49152-65535
        
        q0_count = 0
        q1_count = 0
        q2_count = 0
        q3_count = 0

        for x in range(128):
            for y in range(128):
                if encoder.xy_to_hilbert(x, y) < 16384:
                    q0_count += 1

        for x in range(128, 256):
            for y in range(128, 256):
                if 32768 <= encoder.xy_to_hilbert(x, y) < 49152:
                    q2_count += 1

        for x in range(128, 256):
            for y in range(128):
                if encoder.xy_to_hilbert(x, y) >= 49152:
                    q3_count += 1

        assert q0_count == 16384
        assert q2_count == 16384
        assert q3_count == 16384


class TestHilbertEncoderEncoding:
    """Test encoding/decoding of texture regions."""

    @pytest.fixture
    def encoder(self):
        return HilbertEncoder(grid_size=TEXTURE_SIZE)

    def test_encode_quadrant_returns_correct_length(self, encoder):
        """encode_quadrant should return 16384 indices."""
        texture = np.zeros((256, 256), dtype=np.uint16)
        indices = encoder.encode_quadrant(texture, quadrant=0)
        assert len(indices) == 16384

    def test_decode_to_quadrant_preserves_values(self, encoder):
        """Decoding encoded indices should preserve values."""
        original = np.zeros((256, 256), dtype=np.uint16)
        original[10, 10] = 500
        original[100, 100] = 800
        
        indices = encoder.encode_quadrant(original, quadrant=0)
        decoded = encoder.decode_to_quadrant(indices, quadrant=0)

        assert decoded[10, 10] == 500
        assert decoded[100, 100] == 800
        assert decoded[200, 200] == 0
