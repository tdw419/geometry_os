import numpy as np
import struct
from typing import Tuple

# Q4_0 Format Constants
Q4_BLOCK_SIZE = 32  # Number of weights per block
Q4_SCALE_DIVISOR = 7.0  # Scale divisor: max(|weights|) / 7.0
Q4_ZERO_POINT = 8.0  # Zero point for 4-bit signed representation
Q4_SCALE_BYTES = 2  # Bytes for fp16 scale
Q4_WEIGHTS_BYTES = 16  # Bytes for packed 4-bit weights (32 weights * 4 bits)
Q4_BLOCK_BYTES = Q4_SCALE_BYTES + Q4_WEIGHTS_BYTES  # Total bytes per block (18)
Q4_MIN_VALUE = 0  # Minimum 4-bit value
Q4_MAX_VALUE = 15  # Maximum 4-bit value


def quantize_q4(weights: np.ndarray) -> bytes:
    """
    Quantize 32 FP32 weights to Q4_0 format.
    Returns: 18 bytes (2 byte fp16 scale + 16 bytes packed 4-bit weights)

    Q4_0 format:
    - Block size: 32 weights
    - Storage per block: 18 bytes (2 for fp16 scale + 16 for packed 4-bit weights)
    - Quantization: Find scale = max(|weights|) / 7, then weight_4bit = round(weight / scale + 8)
    - Endianness: fp16 scale is stored in little-endian (numpy default), matching WGSL expectations
    """
    if len(weights) != Q4_BLOCK_SIZE:
        raise ValueError(f"quantize_q4 requires exactly {Q4_BLOCK_SIZE} weights")

    # Find scale: max(|weights|) / 7
    max_abs = np.max(np.abs(weights))
    scale = max_abs / Q4_SCALE_DIVISOR

    # Avoid division by zero
    if scale == 0:
        scale = 1.0

    # Calculate 4-bit weights: round(weight / scale + 8)
    normalized_weights = weights / scale
    shifted_weights = normalized_weights + Q4_ZERO_POINT
    quantized_weights = np.round(shifted_weights).astype(np.int8)

    # Clamp to ensure 4-bit range [0, 15]
    quantized_weights = np.clip(quantized_weights, Q4_MIN_VALUE, Q4_MAX_VALUE)

    # Pack 4-bit weights into bytes (2 weights per byte)
    packed_bytes = bytearray()
    for i in range(0, Q4_BLOCK_SIZE, 2):
        # Take two 4-bit values and pack them into one byte
        high_nibble = quantized_weights[i]
        low_nibble = quantized_weights[i + 1]
        packed_byte = (high_nibble << 4) | low_nibble
        packed_bytes.append(packed_byte)

    # Convert scale to fp16 (2 bytes)
    # Numpy's tobytes() uses little-endian by default, which matches WGSL expectations
    scale_fp16 = np.float16(scale)
    scale_f16_array = np.array([scale_fp16], dtype=np.float16)
    scale_bytes = scale_f16_array.tobytes()

    # Combine scale bytes and packed weights
    quantized_data = scale_bytes + bytes(packed_bytes)

    return quantized_data


def quantize_model_q4(weights: np.ndarray) -> Tuple[bytes, dict]:
    """
    Quantize full model weights to Q4_0.
    Returns: (quantized_bytes, metadata_dict)
    """
    if len(weights) == 0:
        raise ValueError("Cannot quantize empty weight array")

    # Calculate number of blocks needed (ceiling division)
    num_blocks = (len(weights) + Q4_BLOCK_SIZE - 1) // Q4_BLOCK_SIZE
    quantized_blocks = bytearray()

    # Process each block
    for i in range(num_blocks):
        start_idx = i * Q4_BLOCK_SIZE
        end_idx = min(start_idx + Q4_BLOCK_SIZE, len(weights))
        block_weights = weights[start_idx:end_idx]

        # Pad with zeros if this is the last block and not full
        if len(block_weights) < Q4_BLOCK_SIZE:
            padded_weights = np.zeros(Q4_BLOCK_SIZE, dtype=np.float32)
            padded_weights[:len(block_weights)] = block_weights
            quantized_block = quantize_q4(padded_weights)
        else:
            quantized_block = quantize_q4(block_weights)

        quantized_blocks.extend(quantized_block)

    # Create metadata
    metadata = {
        "format": "q4_0",
        "block_size": Q4_BLOCK_SIZE,
        "original_size": len(weights) * 4,  # 4 bytes per float32
        "quantized_size": len(quantized_blocks),
        "num_blocks": num_blocks
    }

    return bytes(quantized_blocks), metadata
