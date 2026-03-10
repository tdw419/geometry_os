import pytest
import numpy as np
from systems.visual_shell.wgsl.quantization.q4_utils import q4_dequantize_block, q4_quantize_block


def test_q4_dequantize_single_block():
    """Test dequantization of a single Q4_0 block."""
    # Scale = 2.0 (fp16: 0x4000)
    scale = np.float16(2.0)
    # Create a full 16-byte block with pattern at the beginning
    packed_weights = np.zeros(16, dtype=np.uint8)
    # Weights: [8, 9, 10, 11] packed as 0x98, 0xBA for first two bytes
    packed_weights[0] = 0x98  # 8,9 packed
    packed_weights[1] = 0xBA  # 10,11 packed

    # Expected: [0.0, 2.0, 4.0, 6.0] for first 4 weights
    expected = np.array([0.0, 2.0, 4.0, 6.0] + [0.0] * 28, dtype=np.float32)

    result = q4_dequantize_block(packed_weights, scale)

    assert result.shape == (32,), f"Expected shape (32,), got {result.shape}"
    np.testing.assert_array_almost_equal(result, expected, decimal=6)


def test_q4_roundtrip():
    """Test that quantize→dequantize preserves values within tolerance."""
    # Original values - create 32 values
    np.random.seed(42)  # For reproducible tests
    original = np.random.uniform(-10, 10, 32).astype(np.float32)

    # Quantize then dequantize
    quantized = q4_quantize_block(original)
    scale = quantized['scale']
    packed_weights = quantized['packed_weights']
    dequantized = q4_dequantize_block(packed_weights, scale)

    # Check that dequantized values are close to original
    np.testing.assert_array_almost_equal(
        dequantized,
        original,
        decimal=1,  # 1 decimal place tolerance for 4-bit quantization
        err_msg="Dequantized values too far from original"
    )


def test_q4_dequantize_full_block():
    """Test dequantization of a full 32-weight Q4_0 block."""
    # Create test data
    scale = np.float16(1.5)
    # Create packed weights for 32 weights (16 bytes)
    # For testing, use a simple pattern: [0, 1, 2, 3, 4, 5, ..., 15]
    weights_4bit = np.arange(16, dtype=np.uint8)  # Just first 16 values
    packed_weights = np.zeros(16, dtype=np.uint8)

    # Extend pattern for full 32 weights
    weights_4bit_full = np.concatenate([weights_4bit, weights_4bit])

    # Pack 4-bit weights into bytes (2 per byte)
    for i in range(16):
        packed_weights[i] = (weights_4bit_full[i * 2] << 4) | weights_4bit_full[i * 2 + 1]

    # Dequantize
    result = q4_dequantize_block(packed_weights, scale)

    # Check shape
    assert result.shape == (32,), f"Expected shape (32,), got {result.shape}"

    # Check that values follow the formula: value = scale × (weight - 8)
    expected = scale * (weights_4bit_full - 8)
    np.testing.assert_array_almost_equal(result, expected.astype(np.float32), decimal=6)


def test_q4_quantize_block():
    """Test quantization of a block of floats."""
    # Test data - create 32 values
    np.random.seed(123)
    values = np.random.uniform(-5, 5, 32).astype(np.float32)

    # Quantize
    result = q4_quantize_block(values)

    # Check structure
    assert 'scale' in result
    assert 'packed_weights' in result
    assert isinstance(result['scale'], np.float16)
    assert isinstance(result['packed_weights'], np.ndarray)
    assert result['packed_weights'].shape == (16,)  # 16 bytes for 32 weights

    # Check that scale is reasonable
    assert result['scale'] > 0, "Scale must be positive"

    # Check that weights are 4-bit values (0-15)
    unpacked_weights = unpack_4bit_weights(result['packed_weights'])
    assert np.all((unpacked_weights >= 0) & (unpacked_weights <= 15)), "Weights must be 4-bit values"


def unpack_4bit_weights(packed_weights):
    """Helper to unpack 4-bit weights for testing."""
    unpacked = np.zeros(len(packed_weights) * 2, dtype=np.uint8)
    for i, byte in enumerate(packed_weights):
        unpacked[i * 2] = (byte >> 4) & 0xF
        unpacked[i * 2 + 1] = byte & 0xF
    return unpacked