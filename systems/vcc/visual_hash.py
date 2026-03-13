# systems/vcc/visual_hash.py
"""
Visual hashing for the Visual Consistency Contract (VCC).
Computes the authoritative SHA-256 of the glyph atlas.
"""

import hashlib
from typing import Tuple, List

def compute_atlas_sha256(atlas_bytes: bytes) -> str:
    """Compute the SHA-256 hash of the raw atlas bytes."""
    return hashlib.sha256(atlas_bytes).hexdigest()

def compute_perceptual_hash(atlas_bytes: bytes, dimensions: Tuple[int, int]) -> str:
    """
    Compute a perceptual hash to allow for minor anti-aliasing differences.
    For Phase 1, we use a block-mean hash (bhash).
    """
    # Placeholder for a more robust perceptual hash
    # For now, we use SHA-256 as VCC requires exact visual identity
    return compute_atlas_sha256(atlas_bytes)

def verify_atlas_integrity(atlas_bytes: bytes, expected_hash: str) -> bool:
    """Verify that the atlas matches the expected hash."""
    return compute_atlas_sha256(atlas_bytes) == expected_hash
