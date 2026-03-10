#!/usr/bin/env python3

import pytest
from systems.visual_shell.wgsl.atlas_calculator import calculate_atlas_size


class TestAtlasCalculator:
    """Test suite for atlas size calculator."""

    def test_q4_small_model(self):
        """Test Q4 quantization for small model."""
        # 1M params × 0.5 bytes/param = 500KB
        # Should fit in 1024×1024 (1M pixels × 0.5 bytes/pixel = 500KB)
        size, meta = calculate_atlas_size(1_000_000, "q4")

        assert size == 1024
        assert meta["total_pixels"] == 1024 * 1024
        assert meta["atlas_bytes"] == 524_288  # 1024 * 1024 * 0.5
        assert meta["weights_per_pixel"] == 8
        assert meta["quantization"] == "q4"

    def test_q8_medium_model(self):
        """Test Q8 quantization for medium model."""
        # 16M params × 1 byte/param = 16MB
        # Should fit in 2048×2048 (4M pixels × 1 byte/pixel = 4MB)
        size, meta = calculate_atlas_size(16_000_000, "q8")

        assert size == 2048
        assert meta["total_pixels"] == 2048 * 2048
        assert meta["atlas_bytes"] == 4_194_304  # 2048 * 2048 * 1
        assert meta["weights_per_pixel"] == 4
        assert meta["quantization"] == "q8"

    def test_fp16_large_model(self):
        """Test FP16 quantization for large model."""
        # 32M params × 2 bytes/param = 64MB
        # Should fit in 2048×2048 (4M pixels × 4 bytes/pixel = 16MB for RGBA32Float)
        size, meta = calculate_atlas_size(32_000_000, "fp16")

        assert size == 2048
        assert meta["total_pixels"] == 2048 * 2048
        assert meta["atlas_bytes"] == 16 * 1024 * 1024  # 2048 * 2048 * 4
        assert meta["weights_per_pixel"] == 2
        assert meta["quantization"] == "fp16"

    def test_q4_125m_params(self):
        """Test specific case: 125M params at Q4."""
        # 125M × 0.5 = 62.5MB
        # Needs 4096×4096 (32M pixels × 0.5 bytes/pixel = 16MB storage)
        # Wait, let me recalculate: 125M params / 8 weights/pixel = 15.625M pixels
        # 4096×4096 = 16.78M pixels - that's enough
        size, meta = calculate_atlas_size(125_000_000, "q4")

        assert size == 4096
        assert meta["total_pixels"] == 4096 * 4096
        assert meta["atlas_bytes"] == 8_388_608  # 16.78M pixels × 0.5 bytes/pixel
        assert meta["weights_per_pixel"] == 8
        assert meta["quantization"] == "q4"

    def test_q8_edge_case(self):
        """Test edge case for Q8 - needs exactly 2048x2048."""
        # 4M params × 1 byte/param = 4MB
        # 4M / 4 weights/pixel = 1M pixels = 1024x1024
        size, meta = calculate_atlas_size(4_000_000, "q8")

        assert size == 1024
        assert meta["total_pixels"] == 1024 * 1024
        assert meta["atlas_bytes"] == 1_048_576  # 1024 * 1024 * 1
        assert meta["weights_per_pixel"] == 4

    def test_fp32_edge_case(self):
        """Test FP16 - needs exactly 1024x1024."""
        # 512K params × 2 bytes/param = 1MB
        # 512K / 2 weights/pixel = 256K pixels = 512x512
        size, meta = calculate_atlas_size(512_000, "fp16")

        assert size == 1024  # Round up to next power of 2
        assert meta["total_pixels"] == 1024 * 1024
        assert meta["atlas_bytes"] == 4 * 1024 * 1024  # RGBA32Float: 4 bytes/pixel
        assert meta["weights_per_pixel"] == 2

    def test_power_of_2_rounding(self):
        """Test that sizes are always powers of 2."""
        # Test cases that should round up to next power of 2
        test_cases = [
            (850_000, "q4"),   # Should be 1024
            (3_500_000, "q8"),  # Should be 4096
            (50_000_000, "fp16"),  # Should be 8192
        ]

        for params, quant in test_cases:
            size, meta = calculate_atlas_size(params, quant)

            # Verify size is power of 2
            assert size & (size - 1) == 0, f"Size {size} is not power of 2"
            assert size >= 1024  # Minimum atlas size

    def test_quantization_modes(self):
        """Test all supported quantization modes."""
        num_params = 1_000_000

        for quant in ["q4", "q8", "fp16"]:
            size, meta = calculate_atlas_size(num_params, quant)
            assert meta["quantization"] == quant

    def test_unknown_quantization(self):
        """Test error handling for unknown quantization mode."""
        with pytest.raises(ValueError, match="Unknown quantization"):
            calculate_atlas_size(1_000_000, "q32")

    def test_zero_params(self):
        """Test edge case with zero parameters."""
        size, meta = calculate_atlas_size(0, "q4")
        assert size == 1024  # Still need minimum atlas size
        assert meta["total_pixels"] == 1024 * 1024
        assert meta["atlas_bytes"] == 524_288  # 1024 * 1024 * 0.5
        assert meta["weights_per_pixel"] == 8

    def test_fractional_rounding(self):
        """Test that fractional weights per pixel are handled correctly."""
        # Q4: 1 param × 0.5 bytes/param = 0.5 bytes
        # Need 1 pixel to store 1/8 of a weight
        size, meta = calculate_atlas_size(1, "q4")
        assert size == 1024
        assert meta["total_pixels"] == 1024 * 1024
        assert meta["weights_per_pixel"] == 8

    def test_large_model_fp16(self):
        """Test very large model with FP16 quantization."""
        # 512M params × 2 bytes/param = 1GB
        # Need 512M / 2 = 256M pixels = 16384x16384
        # But we'll cap at 8192 due to VRAM constraints
        size, meta = calculate_atlas_size(512_000_000, "fp16")

        assert size == 8192  # Cap at 8192x8192
        assert meta["total_pixels"] == 8192 * 8192
        assert meta["atlas_bytes"] == 256 * 1024 * 1024  # 256MB for 8192x8192 FP32 texture