#!/usr/bin/env python3
"""
Unit tests for TruthTextureEncoder.

Tests RGBA texture encoding for CTRM results including:
- Encoder creation and initialization
- Texture dimensions
- RGBA channel verification
- Channel mapping (R=E1, G=E2, B=E3, A=confidence)
- File saving functionality
"""

import os
import tempfile
import unittest
from PIL import Image

from systems.intelligence.truth_texture import TruthTextureEncoder


class TestTruthTexture(unittest.TestCase):
    """Test cases for TruthTextureEncoder RGBA encoding."""

    def test_encoder_creation(self):
        """TruthTextureEncoder(10) should create successfully."""
        encoder = TruthTextureEncoder(size=10)
        self.assertIsNotNone(encoder)
        self.assertEqual(encoder.size, 10)

    def test_texture_dimensions(self):
        """encode() should return 10x10 image for size=10 encoder."""
        encoder = TruthTextureEncoder(size=10)
        results = [
            {
                "triad_scores": {
                    "E1_archaeology": 0.5,
                    "E2_manuscript": 0.5,
                    "E3_prophecy": 0.5
                },
                "ctrm_evaluation": {"confidence": 0.5}
            }
        ]
        img = encoder.encode(results)
        self.assertEqual(img.size, (10, 10))

    def test_rgba_channels(self):
        """Image mode should be RGBA."""
        encoder = TruthTextureEncoder(size=10)
        results = [
            {
                "triad_scores": {
                    "E1_archaeology": 0.5,
                    "E2_manuscript": 0.5,
                    "E3_prophecy": 0.5
                },
                "ctrm_evaluation": {"confidence": 0.5}
            }
        ]
        img = encoder.encode(results)
        self.assertEqual(img.mode, 'RGBA')

    def test_channel_mapping(self):
        """Verify R=E1, G=E2, B=E3, A=confidence channel mapping."""
        encoder = TruthTextureEncoder(size=10)

        # Create sample with known values for precise channel verification
        # E1=0.80, E2=0.60, E3=0.40, confidence=0.90
        results = [
            {
                "triad_scores": {
                    "E1_archaeology": 0.80,  # Expected R = 204
                    "E2_manuscript": 0.60,   # Expected G = 153
                    "E3_prophecy": 0.40      # Expected B = 102
                },
                "ctrm_evaluation": {"confidence": 0.90}  # Expected A = 230
            }
        ]

        img = encoder.encode(results)
        pixel = img.getpixel((0, 0))

        # Verify each channel maps correctly (with small tolerance for rounding)
        expected_r = int(0.80 * 255)  # 204
        expected_g = int(0.60 * 255)  # 153
        expected_b = int(0.40 * 255)  # 102
        expected_a = int(0.90 * 255)  # 230

        self.assertEqual(pixel[0], expected_r,
                         f"R channel should be E1*255={expected_r}, got {pixel[0]}")
        self.assertEqual(pixel[1], expected_g,
                         f"G channel should be E2*255={expected_g}, got {pixel[1]}")
        self.assertEqual(pixel[2], expected_b,
                         f"B channel should be E3*255={expected_b}, got {pixel[2]}")
        self.assertEqual(pixel[3], expected_a,
                         f"A channel should be confidence*255={expected_a}, got {pixel[3]}")

    def test_save_creates_file(self):
        """save() should create a PNG file at the specified path."""
        encoder = TruthTextureEncoder(size=10)
        results = [
            {
                "triad_scores": {
                    "E1_archaeology": 0.5,
                    "E2_manuscript": 0.5,
                    "E3_prophecy": 0.5
                },
                "ctrm_evaluation": {"confidence": 0.5}
            }
        ]

        with tempfile.TemporaryDirectory() as tmpdir:
            output_path = os.path.join(tmpdir, "test_texture.rts.png")
            encoder.save(results, output_path)

            # Verify file was created
            self.assertTrue(os.path.exists(output_path),
                            f"PNG file should be created at {output_path}")

            # Verify it's a valid PNG by loading it
            loaded_img = Image.open(output_path)
            self.assertEqual(loaded_img.format, 'PNG')
            self.assertEqual(loaded_img.mode, 'RGBA')
            self.assertEqual(loaded_img.size, (10, 10))


if __name__ == "__main__":
    unittest.main()
