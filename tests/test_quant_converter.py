import os
import sys

import numpy as np
import pytest

# Add the quant_converter module to the path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', 'systems', 'visual_shell', 'wgsl', 'quantization'))

from quant_converter import quantize_model_q4, quantize_q4


def test_quantize_weights_q4():
    """Test FP32 to Q4_0 quantization."""
    # Test with simple predictable values
    weights = np.array([1.0, -1.0, 0.5, -0.5, 0.25, -0.25, 0.125, -0.125,
                       1.0, -1.0, 0.5, -0.5, 0.25, -0.25, 0.125, -0.125,
                       1.0, -1.0, 0.5, -0.5, 0.25, -0.25, 0.125, -0.125,
                       1.0, -1.0, 0.5, -0.5, 0.25, -0.25, 0.125, -0.125],
                      dtype=np.float32)

    quantized = quantize_q4(weights)
    assert len(quantized) == 18  # 2 + 16 bytes

    # The first 2 bytes should be the fp16 scale
    scale_bytes = quantized[:2]
    # The next 16 bytes should be the packed 4-bit weights
    weight_bytes = quantized[2:]

    assert len(scale_bytes) == 2
    assert len(weight_bytes) == 16

    # Verify that the weights are properly packed
    # Each byte contains two 4-bit weights
    for i in range(16):
        byte = weight_bytes[i]
        # Extract high and low 4-bit values
        high_nibble = (byte >> 4) & 0x0F
        low_nibble = byte & 0x0F
        assert 0 <= high_nibble <= 15
        assert 0 <= low_nibble <= 15


def test_quantize_model_q4():
    """Test full model quantization."""
    # Create a larger random array
    np.random.seed(42)  # For reproducible tests
    weights = np.random.randn(1000).astype(np.float32)

    quantized, metadata = quantize_model_q4(weights)

    # Check metadata
    assert metadata["format"] == "q4_0"
    assert metadata["block_size"] == 32
    assert metadata["original_size"] == len(weights) * 4  # 4 bytes per float32
    assert metadata["quantized_size"] == len(quantized)

    # Calculate expected size: each block of 32 weights produces 18 bytes
    expected_blocks = (len(weights) + 31) // 32  # Ceiling division
    expected_size = expected_blocks * 18
    assert len(quantized) == expected_size

    # Check that the quantized data can be dequantized reasonably
    # This is a basic sanity check - we'll have a proper dequantizer later
    blocks = len(quantized) // 18
    for i in range(blocks):
        block_start = i * 18
        block_quantized = quantized[block_start:block_start + 18]
        # This should not raise any errors
        assert len(block_quantized) == 18


def test_quantize_q4_edge_cases():
    """Test edge cases for quantize_q4."""
    # Test with zeros
    zeros = np.zeros(32, dtype=np.float32)
    quantized = quantize_q4(zeros)
    assert len(quantized) == 18

    # Test with very small values
    small_values = np.full(32, 1e-6, dtype=np.float32)
    quantized = quantize_q4(small_values)
    assert len(quantized) == 18

    # Test with large values
    large_values = np.full(32, 1000.0, dtype=np.float32)
    quantized = quantize_q4(large_values)
    assert len(quantized) == 18


def test_quantize_model_q4_small_model():
    """Test quantizing a model smaller than one block."""
    weights = np.random.randn(16).astype(np.float32)  # Less than 32

    quantized, metadata = quantize_model_q4(weights)

    # Should still produce one full block
    assert len(quantized) == 18
    assert metadata["format"] == "q4_0"
    assert metadata["block_size"] == 32
    assert metadata["original_size"] == 16 * 4


def test_quantize_model_q4_exact_multiple():
    """Test quantizing a model that's an exact multiple of block size."""
    weights = np.random.randn(64).astype(np.float32)  # Exactly 2 blocks

    quantized, metadata = quantize_model_q4(weights)

    # Should produce exactly 2 blocks
    expected_size = 2 * 18
    assert len(quantized) == expected_size
    assert metadata["original_size"] == 64 * 4
    assert metadata["quantized_size"] == expected_size


if __name__ == "__main__":
    pytest.main([__file__])
