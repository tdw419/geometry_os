"""Performance tests for PixelRTS v2 Core Library."""
import sys
from pathlib import Path

# Add systems/pixel_compiler to path for imports
pixel_compiler_path = Path(__file__).parent.parent.parent / "systems" / "pixel_compiler"
sys.path.insert(0, str(pixel_compiler_path))

import pytest
import time
import numpy as np
from pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder


def test_encode_small_file_performance():
    """Test encoding performance on small file (10KB)."""
    test_data = np.random.bytes(10 * 1024)

    encoder = PixelRTSEncoder(mode="standard")

    start = time.time()
    png_bytes = encoder.encode(test_data)
    elapsed = time.time() - start

    # Should complete in under 1 second for 10KB
    assert elapsed < 1.0, f"Encoding 10KB took {elapsed:.2f}s, expected < 1s"
    assert png_bytes is not None
    assert len(png_bytes) > 0


def test_encode_medium_file_performance():
    """Test encoding performance on medium file (1MB)."""
    test_data = np.random.bytes(1024 * 1024)

    encoder = PixelRTSEncoder(mode="standard")

    start = time.time()
    png_bytes = encoder.encode(test_data)
    elapsed = time.time() - start

    # Should complete in under 10 seconds for 1MB
    assert elapsed < 10.0, f"Encoding 1MB took {elapsed:.2f}s, expected < 10s"
    assert png_bytes is not None


def test_decode_performance():
    """Test decoding performance."""
    # Create test data
    test_data = np.random.bytes(100 * 1024)  # 100KB

    encoder = PixelRTSEncoder(mode="standard")
    png_bytes = encoder.encode(test_data)

    decoder = PixelRTSDecoder()
    decoder.set_metadata(encoder.get_metadata())

    start = time.time()
    decoded = decoder.decode(png_bytes)
    elapsed = time.time() - start

    # Should complete in under 1 second for 100KB
    assert elapsed < 1.0, f"Decoding 100KB took {elapsed:.2f}s, expected < 1s"
    assert decoded == test_data


def test_round_trip_integrity():
    """Test that encode/decode preserves data integrity."""
    test_sizes = [100, 1024, 10 * 1024, 100 * 1024]

    for size in test_sizes:
        test_data = np.random.bytes(size)

        encoder = PixelRTSEncoder(mode="standard")
        decoder = PixelRTSDecoder()

        png_bytes = encoder.encode(test_data)
        decoder.set_metadata(encoder.get_metadata())
        decoded = decoder.decode(png_bytes)

        assert decoded == test_data, f"Round-trip failed for size {size}"


@pytest.mark.parametrize("mode", ["standard", "code"])
def test_encoding_modes(mode):
    """Test both encoding modes produce valid output."""
    test_data = np.random.bytes(1024)

    encoder = PixelRTSEncoder(mode=mode)
    png_bytes = encoder.encode(test_data)

    decoder = PixelRTSDecoder()
    decoder.set_metadata(encoder.get_metadata())
    decoded = decoder.decode(png_bytes)

    assert decoded == test_data, f"Round-trip failed for mode {mode}"


def test_encode_100kb_performance():
    """Test encoding performance on 100KB file."""
    test_data = np.random.bytes(100 * 1024)

    encoder = PixelRTSEncoder(mode="standard")

    start = time.time()
    png_bytes = encoder.encode(test_data)
    elapsed = time.time() - start

    # Should complete in under 2 seconds for 100KB
    assert elapsed < 2.0, f"Encoding 100KB took {elapsed:.2f}s, expected < 2s"
    assert png_bytes is not None


def test_decode_large_file_performance():
    """Test decoding performance on larger file (500KB)."""
    test_data = np.random.bytes(500 * 1024)

    encoder = PixelRTSEncoder(mode="standard")
    png_bytes = encoder.encode(test_data)

    decoder = PixelRTSDecoder()
    decoder.set_metadata(encoder.get_metadata())

    start = time.time()
    decoded = decoder.decode(png_bytes)
    elapsed = time.time() - start

    # Should complete in under 3 seconds for 500KB
    assert elapsed < 3.0, f"Decoding 500KB took {elapsed:.2f}s, expected < 3s"
    assert decoded == test_data


def test_round_trip_with_metadata():
    """Test round-trip integrity with metadata."""
    test_data = np.random.bytes(50 * 1024)  # 50KB
    metadata = {
        "type": "kernel",
        "name": "test-kernel",
        "version": "1.0.0",
        "description": "Performance test kernel"
    }

    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    png_bytes = encoder.encode(test_data, metadata=metadata)
    decoder.set_metadata(encoder.get_metadata())
    decoded = decoder.decode(png_bytes)

    assert decoded == test_data

    # Verify metadata was preserved
    retrieved_metadata = decoder.get_metadata()
    assert retrieved_metadata["type"] == "kernel"
    assert retrieved_metadata["name"] == "test-kernel"


def test_encoding_throughput():
    """Test encoding throughput in bytes per second."""
    test_data = np.random.bytes(256 * 1024)  # 256KB

    encoder = PixelRTSEncoder(mode="standard")

    start = time.time()
    png_bytes = encoder.encode(test_data)
    elapsed = time.time() - start

    throughput = len(test_data) / elapsed

    # Should achieve at least 50KB/s throughput
    assert throughput >= 50 * 1024, f"Encoding throughput {throughput/1024:.2f}KB/s, expected >= 50KB/s"


def test_decoding_throughput():
    """Test decoding throughput in bytes per second."""
    test_data = np.random.bytes(256 * 1024)  # 256KB

    encoder = PixelRTSEncoder(mode="standard")
    png_bytes = encoder.encode(test_data)

    decoder = PixelRTSDecoder()
    decoder.set_metadata(encoder.get_metadata())

    start = time.time()
    decoded = decoder.decode(png_bytes)
    elapsed = time.time() - start

    throughput = len(test_data) / elapsed

    # Should achieve at least 100KB/s throughput
    assert throughput >= 100 * 1024, f"Decoding throughput {throughput/1024:.2f}KB/s, expected >= 100KB/s"


def test_small_file_overhead():
    """Test that small files have acceptable overhead."""
    test_data = b"Hello, World!"  # 13 bytes

    encoder = PixelRTSEncoder(mode="standard")

    start = time.time()
    png_bytes = encoder.encode(test_data)
    elapsed = time.time() - start

    # Small files should still be fast (< 100ms)
    assert elapsed < 0.1, f"Encoding small file took {elapsed:.3f}s, expected < 0.1s"

    # PNG overhead should be reasonable (less than 10KB for tiny data)
    assert len(png_bytes) < 10 * 1024, f"PNG size {len(png_bytes)} bytes, expected < 10KB"


@pytest.mark.parametrize("size_kb", [1, 10, 50, 100, 500])
def test_round_trip_various_sizes(size_kb):
    """Test round-trip integrity for various sizes."""
    test_data = np.random.bytes(size_kb * 1024)

    encoder = PixelRTSEncoder(mode="standard")
    decoder = PixelRTSDecoder()

    start = time.time()
    png_bytes = encoder.encode(test_data)
    encode_time = time.time() - start

    decoder.set_metadata(encoder.get_metadata())

    start = time.time()
    decoded = decoder.decode(png_bytes)
    decode_time = time.time() - start

    assert decoded == test_data, f"Round-trip failed for size {size_kb}KB"

    # Performance should scale reasonably
    # Allow up to 2 seconds per 100KB
    max_time = (size_kb / 100) * 2.0
    total_time = encode_time + decode_time
    assert total_time < max_time, f"Round-trip for {size_kb}KB took {total_time:.2f}s, expected < {max_time:.2f}s"
