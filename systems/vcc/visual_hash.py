# systems/vcc/visual_hash.py
"""
Visual hash computation for VCC.

Provides:
- compute_atlas_hash: SHA-256 hash of raw atlas bytes
- compute_perceptual_hash: DCT-based perceptual hash for visual comparison
"""

import hashlib
import numpy as np
from typing import Optional


def compute_atlas_hash(atlas_data: np.ndarray) -> str:
    """
    Compute SHA-256 hash of atlas pixel data.

    Args:
        atlas_data: 3D numpy array (height, width, 4) in RGBA format

    Returns:
        64-character hex string (SHA-256)
    """
    if atlas_data.ndim != 3 or atlas_data.shape[2] != 4:
        raise ValueError(f"Expected RGBA array (H, W, 4), got shape {atlas_data.shape}")

    # Convert to bytes and hash
    raw_bytes = atlas_data.astype(np.uint8).tobytes()
    return hashlib.sha256(raw_bytes).hexdigest()


def compute_perceptual_hash(atlas_data: np.ndarray, hash_size: int = 8) -> str:
    """
    Compute perceptual hash using DCT.

    This hash is resilient to minor pixel changes and useful for
    detecting visual drift between layers.

    Args:
        atlas_data: 3D numpy array (height, width, 4) in RGBA format
        hash_size: Size of the hash (default 8 = 64 bits = 16 hex chars)

    Returns:
        16-character hex string (64-bit perceptual hash)
    """
    from scipy.fftpack import dct

    # Convert to grayscale using luminance
    gray = (0.299 * atlas_data[:, :, 0] +
            0.587 * atlas_data[:, :, 1] +
            0.114 * atlas_data[:, :, 2])

    # Resize to hash_size * 4 for better DCT
    resize_dim = hash_size * 4
    if gray.shape[0] != resize_dim or gray.shape[1] != resize_dim:
        # Simple box resize
        y_scale = gray.shape[0] / resize_dim
        x_scale = gray.shape[1] / resize_dim
        resized = np.zeros((resize_dim, resize_dim), dtype=np.float64)
        for y in range(resize_dim):
            for x in range(resize_dim):
                src_y = int(y * y_scale)
                src_x = int(x * x_scale)
                resized[y, x] = gray[src_y, src_x]
        gray = resized

    # Apply DCT
    dct_result = dct(dct(gray, axis=0), axis=1)

    # Take top-left block (low frequencies)
    dct_low = dct_result[:hash_size, :hash_size]

    # Compute median (excluding DC component)
    median = np.median(dct_low.flatten()[1:])

    # Generate hash: 1 if above median, 0 otherwise
    bits = (dct_low > median).flatten()

    # Convert to hex
    hash_int = 0
    for bit in bits[:64]:  # Limit to 64 bits
        hash_int = (hash_int << 1) | int(bit)

    return f"{hash_int:016x}"


# Backwards compatibility aliases for legacy code
def compute_atlas_sha256(atlas_bytes: bytes) -> str:
    """
    Compute SHA-256 hash of raw atlas bytes.

    This is a backwards-compatible function for code that works with
    raw bytes instead of numpy arrays.

    Args:
        atlas_bytes: Raw atlas bytes

    Returns:
        64-character hex string (SHA-256)
    """
    return hashlib.sha256(atlas_bytes).hexdigest()


def verify_atlas_integrity(atlas_bytes: bytes, expected_hash: str) -> bool:
    """
    Verify that the atlas matches the expected hash.

    Args:
        atlas_bytes: Raw atlas bytes
        expected_hash: Expected SHA-256 hash

    Returns:
        True if hashes match, False otherwise
    """
    return compute_atlas_sha256(atlas_bytes) == expected_hash
