#!/usr/bin/env python3



def calculate_atlas_size(num_params: int, quantization: str = "q4") -> tuple[int, dict]:
    """
    Calculate required atlas texture size.

    Args:
        num_params: Number of model parameters
        quantization: "q4", "q8", or "fp16"

    Returns:
        (atlas_size, metadata)
        - atlas_size: Power of 2 (1024, 2048, 4096, 8192)
        - metadata: dict with total_pixels, atlas_bytes, weights_per_pixel, quantization
    """
    if quantization not in ["q4", "q8", "fp16"]:
        raise ValueError("Unknown quantization mode. Must be 'q4', 'q8', or 'fp16'")

    # Calculate storage requirements
    if quantization == "q4":
        bytes_per_weight = 0.5
        weights_per_pixel = 8
    elif quantization == "q8":
        bytes_per_weight = 1.0
        weights_per_pixel = 4
    else:  # fp16
        bytes_per_weight = 2.0
        weights_per_pixel = 2

    # Calculate minimum atlas size based on required pixels
    # Atlas texture must be power of 2 and at least 1024x1024
    if num_params <= 8_388_608:  # 8M weights fits in 1024x1024 with Q4
        atlas_size = 1024
    elif num_params <= 33_554_432:  # 32M weights fits in 2048x2048
        atlas_size = 2048
    elif num_params <= 134_217_728:  # 128M weights fits in 4096x4096
        atlas_size = 4096
    elif num_params <= 536_870_912:  # 512M weights fits in 8192x8192
        atlas_size = 8192
    else:
        # Cap at 8192x8192 for VRAM constraints
        atlas_size = 8192

    total_pixels = atlas_size * atlas_size

    # Calculate total bytes based on quantization
    if quantization == "fp16":
        # FP16 uses RGBA32Float texture (4 bytes per pixel)
        atlas_bytes = total_pixels * 4
    else:
        # Q4 and Q8 use RGBA8 texture packed with weights
        atlas_bytes = total_pixels * bytes_per_weight

    metadata = {
        "total_pixels": total_pixels,
        "atlas_bytes": atlas_bytes,
        "weights_per_pixel": weights_per_pixel,
        "quantization": quantization
    }

    return atlas_size, metadata
