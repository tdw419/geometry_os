# systems/vcc/tests/test_visual_hash.py
"""Tests for visual hash computation."""

import pytest
import numpy as np
from systems.vcc.visual_hash import compute_atlas_hash, compute_perceptual_hash


class TestComputeAtlasHash:
    """Tests for atlas SHA-256 hash computation."""

    def test_compute_atlas_hash_returns_64_char_hex(self):
        """Hash should be 64 character hex string."""
        # Create a simple 4x4 RGBA test atlas
        test_data = np.zeros((4, 4, 4), dtype=np.uint8)
        test_data[1, 1] = [255, 255, 255, 255]

        result = compute_atlas_hash(test_data)

        assert isinstance(result, str)
        assert len(result) == 64
        assert all(c in '0123456789abcdef' for c in result)

    def test_identical_atlases_produce_same_hash(self):
        """Identical atlas data should produce identical hashes."""
        test_data = np.random.randint(0, 256, (16, 16, 4), dtype=np.uint8)

        hash1 = compute_atlas_hash(test_data)
        hash2 = compute_atlas_hash(test_data)

        assert hash1 == hash2

    def test_different_atlases_produce_different_hashes(self):
        """Different atlas data should produce different hashes."""
        data1 = np.zeros((4, 4, 4), dtype=np.uint8)
        data2 = np.ones((4, 4, 4), dtype=np.uint8) * 255

        hash1 = compute_atlas_hash(data1)
        hash2 = compute_atlas_hash(data2)

        assert hash1 != hash2


class TestComputePerceptualHash:
    """Tests for perceptual hash computation."""

    def test_perceptual_hash_is_16_hex_chars(self):
        """Perceptual hash should be 16 character hex string."""
        test_data = np.zeros((64, 64, 4), dtype=np.uint8)
        test_data[10:50, 10:50] = [255, 255, 255, 255]

        result = compute_perceptual_hash(test_data)

        assert isinstance(result, str)
        assert len(result) == 16

    def test_similar_images_similar_hash(self):
        """Visually similar images should have similar hashes."""
        # Create base image
        base = np.zeros((64, 64, 4), dtype=np.uint8)
        base[10:50, 10:50] = [255, 255, 255, 255]

        # Slightly modified (1 pixel difference)
        modified = base.copy()
        modified[11, 11] = [254, 254, 254, 255]

        hash_base = compute_perceptual_hash(base)
        hash_modified = compute_perceptual_hash(modified)

        # Hamming distance should be small (<= 4 bits different)
        hamming = sum(c1 != c2 for c1, c2 in zip(hash_base, hash_modified))
        assert hamming <= 4
