import numpy as np
from typing import Dict, Union

# Q4_0 Format Constants
Q4_BLOCK_SIZE = 32  # Number of weights per block
Q4_ZERO_POINT = 8.0  # Zero point for 4-bit signed representation


def q4_dequantize_block(packed_weights: np.ndarray, scale: np.float16) -> np.ndarray:
    """
    Dequantize a Q4_0 block into float32 values.

    Args:
        packed_weights: Array of 16 bytes containing packed 4-bit weights
        scale: float16 scale factor

    Returns:
        Array of 32 float32 dequantized values

    Formula: value = scale × (weight_4bit - 8)
    """
    # Validate input
    if packed_weights.shape != (16,):
        raise ValueError(f"packed_weights must be shape (16,), got {packed_weights.shape}")

    # Convert scale to float32 for calculations
    scale_f32 = np.float32(scale)

    # Unpack 4-bit weights (2 per byte)
    weights_4bit = np.zeros(Q4_BLOCK_SIZE, dtype=np.uint8)
    for i in range(16):
        byte = packed_weights[i]
        weights_4bit[i * 2] = byte >> 4             # High 4 bits
        weights_4bit[i * 2 + 1] = byte & 0xF       # Low 4 bits

    # Apply dequantization formula
    dequantized = scale_f32 * (weights_4bit.astype(np.float32) - Q4_ZERO_POINT)

    return dequantized


def q4_quantize_block(values: np.ndarray) -> Dict[str, Union[np.float16, np.ndarray]]:
    """
    Quantize a block of float32 values into Q4_0 format.

    Args:
        values: Array of 32 float32 values to quantize

    Returns:
        Dictionary containing:
        - 'scale': float16 scale factor
        - 'packed_weights': Array of 16 bytes containing packed 4-bit weights

    The scale is computed as max(abs(values)) / 7.0 to ensure all values
    can be represented in the range [-8*scale, 7*scale].
    """
    # Validate input
    if len(values) != Q4_BLOCK_SIZE:
        raise ValueError(f"values must be length {Q4_BLOCK_SIZE}, got {len(values)}")

    # Calculate scale to fit all values in the representable range
    max_val = np.max(np.abs(values))
    if max_val == 0:
        scale = np.float16(1.0)
    else:
        # Scale so that max_value = 7*scale
        scale = max_val / 7.0

    # Use float16 for storage as per Q4_0 format
    scale_f16 = np.float16(scale)

    # Quantize values to 4-bit integers
    # Apply reverse formula: weight_4bit = round(value / scale) + 8
    quantized_weights = np.round(values / np.float32(scale_f16)) + Q4_ZERO_POINT

    # Clip to valid range [0, 15]
    quantized_weights = np.clip(quantized_weights, 0, 15).astype(np.uint8)

    # Pack weights into bytes (2 per byte)
    packed_weights = np.zeros(16, dtype=np.uint8)
    for i in range(16):
        # High 4 bits
        packed_weights[i] = (quantized_weights[i * 2] << 4) & 0xF0
        # Low 4 bits
        packed_weights[i] |= quantized_weights[i * 2 + 1] & 0x0F

    return {
        'scale': scale_f16,
        'packed_weights': packed_weights
    }
