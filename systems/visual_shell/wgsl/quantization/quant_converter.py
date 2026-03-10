import numpy as np
import struct
from typing import Tuple


def quantize_q4(weights: np.ndarray) -> bytes:
    """
    Quantize 32 FP32 weights to Q4_0 format.
    Returns: 18 bytes (2 byte fp16 scale + 16 bytes packed 4-bit weights)

    Q4_0 format:
    - Block size: 32 weights
    - Storage per block: 18 bytes (2 for fp16 scale + 16 for packed 4-bit weights)
    - Quantization: Find scale = max(|weights|) / 7, then weight_4bit = round(weight / scale + 8)
    """
    if len(weights) != 32:
        raise ValueError("quantize_q4 requires exactly 32 weights")

    # Find scale: max(|weights|) / 7
    max_abs = np.max(np.abs(weights))
    scale = max_abs / 7.0

    # Avoid division by zero
    if scale == 0:
        scale = 1.0

    # Calculate 4-bit weights: round(weight / scale + 8)
    normalized_weights = weights / scale
    shifted_weights = normalized_weights + 8.0
    quantized_weights = np.round(shifted_weights).astype(np.int8)

    # Clamp to ensure 4-bit range [0, 15]
    quantized_weights = np.clip(quantized_weights, 0, 15)

    # Pack 4-bit weights into bytes (2 weights per byte)
    packed_bytes = bytearray()
    for i in range(0, 32, 2):
        # Take two 4-bit values and pack them into one byte
        high_nibble = quantized_weights[i]
        low_nibble = quantized_weights[i + 1]
        packed_byte = (high_nibble << 4) | low_nibble
        packed_bytes.append(packed_byte)

    # Convert scale to fp16 (2 bytes)
    scale_fp16 = np.float16(scale)
    scale_bytes = struct.pack('>f', scale_fp16)  # Pack as float32 first

    # Convert to fp16 manually since struct.pack doesn't support fp16 directly
    # Extract the 16-bit IEEE 754 representation
    scale_f16 = np.array([scale_fp16], dtype=np.float16)
    scale_bytes = scale_f16.tobytes()

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
    num_blocks = (len(weights) + 31) // 32
    quantized_blocks = bytearray()

    # Process each block
    for i in range(num_blocks):
        start_idx = i * 32
        end_idx = min(start_idx + 32, len(weights))
        block_weights = weights[start_idx:end_idx]

        # Pad with zeros if this is the last block and not full
        if len(block_weights) < 32:
            padded_weights = np.zeros(32, dtype=np.float32)
            padded_weights[:len(block_weights)] = block_weights
            quantized_block = quantize_q4(padded_weights)
        else:
            quantized_block = quantize_q4(block_weights)

        quantized_blocks.extend(quantized_block)

    # Create metadata
    metadata = {
        "format": "q4_0",
        "block_size": 32,
        "original_size": len(weights) * 4,  # 4 bytes per float32
        "quantized_size": len(quantized_blocks),
        "num_blocks": num_blocks
    }

    return bytes(quantized_blocks), metadata


# Utility function for debugging - shows the quantization details
def debug_quantize_q4(weights: np.ndarray) -> dict:
    """
    Debug version that shows quantization details.
    Returns: dict with scale, original weights, quantized values, and packed bytes
    """
    if len(weights) != 32:
        raise ValueError("debug_quantize_q4 requires exactly 32 weights")

    debug_info = {
        "original_weights": weights.copy(),
        "max_abs": np.max(np.abs(weights)),
        "scale": 0.0,
        "normalized_weights": None,
        "shifted_weights": None,
        "quantized_weights": None,
        "packed_bytes": None
    }

    # Find scale
    debug_info["scale"] = debug_info["max_abs"] / 7.0
    if debug_info["scale"] == 0:
        debug_info["scale"] = 1.0

    # Calculate quantized weights
    debug_info["normalized_weights"] = weights / debug_info["scale"]
    debug_info["shifted_weights"] = debug_info["normalized_weights"] + 8.0
    debug_info["quantized_weights"] = np.round(debug_info["shifted_weights"]).astype(np.int8)
    debug_info["quantized_weights"] = np.clip(debug_info["quantized_weights"], 0, 15)

    # Pack into bytes
    packed_bytes = bytearray()
    for i in range(0, 32, 2):
        high_nibble = debug_info["quantized_weights"][i]
        low_nibble = debug_info["quantized_weights"][i + 1]
        packed_byte = (high_nibble << 4) | low_nibble
        packed_bytes.append(packed_byte)

    debug_info["packed_bytes"] = bytes(packed_bytes)

    return debug_info