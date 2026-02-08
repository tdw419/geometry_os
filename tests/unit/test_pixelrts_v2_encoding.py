"""
Unit tests for PixelRTS v2 Encoding/Decoding
Tests round-trip encoding and decoding with various data sizes.
"""

import pytest
import os
import sys

# Add parent directory to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../..'))

from geometry_os.systems.pixel_compiler.pixelrts_v2_core import (
    PixelRTSEncoder,
    PixelRTSDecoder,
    PixelRTSMetadata,
    calculate_grid_size
)


def test_encoder_initialization():
    """Test encoder initialization with valid modes."""
    encoder_standard = PixelRTSEncoder(mode="standard")
    assert encoder_standard.mode == "standard"

    encoder_code = PixelRTSEncoder(mode="code")
    assert encoder_code.mode == "code"


def test_encoder_invalid_mode():
    """Test that encoder rejects invalid modes."""
    with pytest.raises(ValueError, match="Invalid mode"):
        PixelRTSEncoder(mode="invalid")


def test_encode_small_data():
    """Test encoding small data (fits in 4x4 grid)."""
    encoder = PixelRTSEncoder(mode="standard")

    # 16 bytes = 4 pixels (4 bytes each) = 4x4 grid minimum
    data = b"Hello, World!!!!"  # 16 bytes

    png_bytes = encoder.encode(data)

    # Verify we got PNG data
    assert png_bytes is not None
    assert len(png_bytes) > 0
    assert png_bytes[:8] == b'\x89PNG\r\n\x1a\n'  # PNG signature


def test_encode_with_metadata():
    """Test encoding with custom metadata."""
    encoder = PixelRTSEncoder(mode="standard")

    data = b"Test data for metadata"
    metadata = {
        "type": "kernel",
        "name": "test-kernel",
        "version": "1.0.0",
        "description": "Test kernel for PixelRTS"
    }

    png_bytes = encoder.encode(data, metadata=metadata)

    # Verify PNG was created
    assert png_bytes is not None
    assert len(png_bytes) > 0

    # Verify metadata was captured
    retrieved_metadata = encoder.get_metadata()
    assert retrieved_metadata is not None
    assert retrieved_metadata["type"] == "kernel"
    assert retrieved_metadata["name"] == "test-kernel"
    assert retrieved_metadata["content_version"] == "1.0.0"
    assert retrieved_metadata["data_hash"] == PixelRTSMetadata.hash_data(data)
    assert retrieved_metadata["data_size"] == len(data)


def test_encode_explicit_grid_size():
    """Test encoding with explicit grid size."""
    encoder = PixelRTSEncoder(mode="standard")

    data = b"Small data"  # 10 bytes

    # Encode with 8x8 grid
    png_bytes = encoder.encode(data, grid_size=8)

    assert png_bytes is not None
    assert len(png_bytes) > 0

    metadata = encoder.get_metadata()
    assert metadata["grid_size"] == 8


def test_encode_invalid_grid_size():
    """Test that encoder rejects non-power-of-2 grid sizes."""
    encoder = PixelRTSEncoder(mode="standard")

    data = b"Test data"

    with pytest.raises(ValueError, match="Grid size must be power of 2"):
        encoder.encode(data, grid_size=15)  # Not a power of 2


def test_decode_png():
    """Test decoding PNG back to binary data."""
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    original_data = b"Hello, PixelRTS v2! This is a test."

    # Encode
    png_bytes = encoder.encode(original_data)

    # Decode
    decoder.set_metadata(encoder.get_metadata())
    decoded_data = decoder.decode(png_bytes)

    # Verify round-trip
    assert decoded_data == original_data


def test_decode_with_expected_size():
    """Test decoding with expected size parameter."""
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    original_data = b"Test data for size parameter"

    # Encode
    png_bytes = encoder.encode(original_data)

    # Decode with expected size
    decoded_data = decoder.decode(png_bytes, expected_size=len(original_data))

    # Verify round-trip
    assert decoded_data == original_data


def test_round_trip_various_sizes():
    """Test round-trip encoding/decoding with various data sizes."""
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    test_cases = [
        b"A",  # 1 byte
        b"AB",  # 2 bytes
        b"ABC",  # 3 bytes
        b"ABCD",  # 4 bytes (exactly one pixel)
        b"ABCDEFGH",  # 8 bytes (exactly two pixels)
        b"A" * 16,  # 16 bytes (exactly four pixels)
        b"A" * 100,  # 100 bytes
        b"A" * 1024,  # 1 KB
        b"A" * 4096,  # 4 KB
    ]

    for original_data in test_cases:
        png_bytes = encoder.encode(original_data)
        decoder.set_metadata(encoder.get_metadata())
        decoded_data = decoder.decode(png_bytes)

        assert decoded_data == original_data, f"Round-trip failed for size {len(original_data)}"


def test_decoder_metadata_handling():
    """Test decoder metadata handling."""
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    data = b"Test data"
    metadata = {
        "type": "test",
        "name": "test-data"
    }

    png_bytes = encoder.encode(data, metadata=metadata)

    # Get metadata from encoder
    encoder_metadata = encoder.get_metadata()

    # Set metadata on decoder
    decoder.set_metadata(encoder_metadata)

    # Verify decoder has metadata
    retrieved_metadata = decoder.get_metadata()
    assert retrieved_metadata is not None
    assert retrieved_metadata["type"] == "test"
    assert retrieved_metadata["name"] == "test-data"


def test_hash_verification():
    """Test SHA256 hash verification."""
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    data = b"Data for hash verification test"

    png_bytes = encoder.encode(data)
    encoder_metadata = encoder.get_metadata()

    # Get expected hash
    expected_hash = encoder_metadata["data_hash"]

    # Decode and verify
    decoder.set_metadata(encoder_metadata)
    decoded_data = decoder.decode(png_bytes)

    # Verify hash matches
    assert decoder.verify_hash(decoded_data, expected_hash)


def test_hash_verification_mismatch():
    """Test hash verification with mismatched data."""
    decoder = PixelRTSDecoder()

    data = b"Original data"
    wrong_data = b"Wrong data"

    hash1 = PixelRTSMetadata.hash_data(data)
    hash2 = PixelRTSMetadata.hash_data(wrong_data)

    # Hashes should be different
    assert hash1 != hash2

    # Verify hash should fail for wrong data
    assert not decoder.verify_hash(wrong_data, hash1)


def test_calculate_grid_size():
    """Test grid size calculation."""
    # Test various data sizes
    # 4 bytes = 1 pixel, sqrt(1) = 1, next power of 2 = 1
    assert calculate_grid_size(4) == 1
    # 16 bytes = 4 pixels, sqrt(4) = 2, power of 2 = 2
    assert calculate_grid_size(16) == 2
    # 64 bytes = 16 pixels, sqrt(16) = 4, power of 2 = 4
    assert calculate_grid_size(64) == 4
    # 256 bytes = 64 pixels, sqrt(64) = 8, power of 2 = 8
    assert calculate_grid_size(256) == 8
    # 1024 bytes = 256 pixels, sqrt(256) = 16, power of 2 = 16
    assert calculate_grid_size(1024) == 16
    # Edge case: zero bytes should return 1
    assert calculate_grid_size(0) == 1


def test_non_square_image_rejection():
    """Test that decoder rejects non-square images."""
    from PIL import Image
    from io import BytesIO

    decoder = PixelRTSDecoder()

    # Create a non-square PNG
    img = Image.new('RGBA', (64, 32), color='red')
    buffer = BytesIO()
    img.save(buffer, format='PNG')
    png_bytes = buffer.getvalue()

    # Should raise ValueError
    with pytest.raises(ValueError, match="Image must be square"):
        decoder.decode(png_bytes)


def test_metadata_preservation():
    """Test that metadata is properly preserved during encoding."""
    encoder = PixelRTSEncoder(mode="standard")

    data = b"Data with complex metadata"
    metadata = {
        "type": "kernel",
        "name": "linux-v6.0",
        "version": "6.0.1",
        "description": "Linux kernel for Geometry OS",
        "segments": {
            "kernel": {
                "offset": 0,
                "size": len(data),
                "sha256": PixelRTSMetadata.hash_data(data)
            }
        }
    }

    png_bytes = encoder.encode(data, metadata=metadata)
    retrieved_metadata = encoder.get_metadata()

    # Verify all metadata fields
    assert retrieved_metadata["type"] == "kernel"
    assert retrieved_metadata["name"] == "linux-v6.0"
    assert retrieved_metadata["content_version"] == "6.0.1"
    assert retrieved_metadata["description"] == "Linux kernel for Geometry OS"
    assert "kernel" in retrieved_metadata["segments"]
    assert retrieved_metadata["data_size"] == len(data)


def test_code_mode_encoding():
    """Test encoding in code mode (for future WASM visualization)."""
    encoder = PixelRTSEncoder(mode="code")

    data = b"\x00\x61\x73\x6d"  # WASM magic number

    png_bytes = encoder.encode(data)

    assert png_bytes is not None
    assert len(png_bytes) > 0

    metadata = encoder.get_metadata()
    assert metadata["encoding"]["type"] == "RGBA-code"


def test_zero_length_data():
    """Test encoding zero-length data."""
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    data = b""

    png_bytes = encoder.encode(data)
    decoder.set_metadata(encoder.get_metadata())
    decoded_data = decoder.decode(png_bytes)

    assert decoded_data == data


def test_large_data_round_trip():
    """Test round-trip with larger data (simulating small kernel)."""
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    # Simulate 64KB of data (small kernel or initrd)
    data = b"X" * (64 * 1024)

    png_bytes = encoder.encode(data)
    decoder.set_metadata(encoder.get_metadata())
    decoded_data = decoder.decode(png_bytes)

    assert decoded_data == data
    assert len(decoded_data) == 64 * 1024


def test_metadata_data_size_field():
    """Test that metadata includes correct data_size."""
    encoder = PixelRTSEncoder(mode="standard")

    test_sizes = [1, 10, 100, 1000, 10000]

    for size in test_sizes:
        data = b"X" * size
        encoder.encode(data)
        metadata = encoder.get_metadata()

        assert metadata["data_size"] == size


def test_encoding_preserves_byte_exactness():
    """Test that encoding preserves exact byte values."""
    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    # Use all possible byte values
    data = bytes(range(256))

    png_bytes = encoder.encode(data)
    decoder.set_metadata(encoder.get_metadata())
    decoded_data = decoder.decode(png_bytes)

    # Should preserve all byte values exactly
    assert decoded_data == data
    assert len(decoded_data) == 256
    for i in range(256):
        assert decoded_data[i] == i
