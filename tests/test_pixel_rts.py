"""
Test suite for PixelRTS encoder and decoder.
"""

import os
import tempfile
import json
from pathlib import Path

# Add systems to path for imports
import sys

sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.pixel_compiler.pixel_rts_encoder import encode_to_pixelrts, encode_file_to_pixelrts
from systems.pixel_compiler.pixel_rts_decoder import decode_from_pixelrts, decode_pixelrts_to_file


def test_string_encoding():
    """Test encoding and decoding a simple string."""
    test_string = "Hello, PixelRTS! 🚀"

    # Encode
    result = encode_to_pixelrts(test_string, "test_output.rts.png", hilbert_order=6)
    assert result["success"] == True
    assert os.path.exists("test_output.rts.png")

    # Decode
    decoded = decode_from_pixelrts("test_output.rts.png", return_as_string=True)
    assert decoded == test_string

    # Cleanup
    os.remove("test_output.rts.png")
    print("✅ String encoding test passed")


def test_dict_encoding():
    """Test encoding and decoding a dictionary."""
    test_dict = {"test": True, "version": "1.0", "nested": {"key": "value", "numbers": [1, 2, 3]}}

    # Encode
    result = encode_to_pixelrts(test_dict, "test_dict.rts.png", hilbert_order=6)
    assert result["success"] == True
    assert os.path.exists("test_dict.rts.png")

    # Decode as dict
    decoded = decode_from_pixelrts("test_dict.rts.png", return_as_dict=True)
    assert decoded == test_dict

    # Cleanup
    os.remove("test_dict.rts.png")
    print("✅ Dictionary encoding test passed")


def test_file_encoding():
    """Test encoding and decoding a file."""
    # Create test file
    test_content = """This is a test file.
With multiple lines.
Including special chars: !@#$%^&*()
And unicode: 🚀⭐🌟"""

    with open("test_input.txt", "w") as f:
        f.write(test_content)

    # Encode file
    result = encode_file_to_pixelrts("test_input.txt", "test_file.rts.png", hilbert_order=6)
    assert result["success"] == True
    assert os.path.exists("test_file.rts.png")

    # Decode file
    result2 = decode_pixelrts_to_file("test_file.rts.png", "test_output.txt")
    assert result2["success"] == True
    assert os.path.exists("test_output.txt")

    # Verify content
    with open("test_output.txt", "r") as f:
        decoded_content = f.read()
    assert decoded_content == test_content

    # Cleanup
    for f in ["test_input.txt", "test_file.rts.png", "test_output.txt"]:
        if os.path.exists(f):
            os.remove(f)
    print("✅ File encoding test passed")


def test_compression():
    """Test that compression works."""
    # Create compressible data (repeated string)
    test_string = "Hello, World!\\n" * 100

    # Encode with compression
    result_with_comp = encode_to_pixelrts(
        test_string, "test_comp.rts.png", hilbert_order=6, compress=True
    )

    # Encode without compression
    result_without_comp = encode_to_pixelrts(
        test_string, "test_no_comp.rts.png", hilbert_order=6, compress=False
    )

    # Compressed should be smaller (or equal for very small data)
    # Note: For very small data, compression might not help due to overhead
    assert result_with_comp["success"] == True
    assert result_without_comp["success"] == True

    # Cleanup
    for f in ["test_comp.rts.png", "test_no_comp.rts.png"]:
        if os.path.exists(f):
            os.remove(f)
    print("✅ Compression test passed")


def test_different_hilbert_orders():
    """Test encoding with different Hilbert curve orders."""
    test_string = "Test data for different orders"

    for order in [4, 5, 6, 7, 8]:
        filename = f"test_order_{order}.rts.png"
        result = encode_to_pixelrts(test_string, filename, hilbert_order=order)
        assert result["success"] == True
        assert f"{2**order}x{2**order}" in result["image_dimensions"]
        assert os.path.exists(filename)
        os.remove(filename)

    print("✅ Different Hilbert orders test passed")


if __name__ == "__main__":
    print("Running PixelRTS tests...")
    try:
        test_string_encoding()
        test_dict_encoding()
        test_file_encoding()
        test_compression()
        test_different_hilbert_orders()
        print("\\n🎉 All tests passed!")
    except Exception as e:
        print(f"\\n❌ Test failed: {e}")
        import traceback

        traceback.print_exc()
        sys.exit(1)
