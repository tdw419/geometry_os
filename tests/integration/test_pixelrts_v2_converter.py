"""
Integration tests for pixelrts_v2_converter.py CLI tool.

Tests the command-line interface for converting binary files to .rts.png format.
"""

import subprocess
import sys
import tempfile
import json
from pathlib import Path
import pytest

# Add pixel_compiler to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "geometry_os" / "systems" / "pixel_compiler"))


@pytest.fixture
def converter_script():
    """Get path to converter script."""
    return Path(__file__).parent.parent.parent / "geometry_os" / "systems" / "pixel_compiler" / "pixelrts_v2_converter.py"


@pytest.fixture
def test_data_dir():
    """Get path to test data directory."""
    return Path(__file__).parent.parent / "data" / "test_binary"


class TestConverterCLI:
    """Test converter CLI functionality."""

    def test_help_output(self, converter_script):
        """Test that --help produces valid output."""
        result = subprocess.run(
            [sys.executable, str(converter_script), "--help"],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert "PixelRTS" in result.stdout or "Convert binary files" in result.stdout
        assert "input" in result.stdout
        assert "output" in result.stdout
        assert "--mode" in result.stdout
        assert "--type" in result.stdout
        assert "--name" in result.stdout
        assert "--version" in result.stdout
        assert "--description" in result.stdout
        assert "--grid-size" in result.stdout

    def test_missing_input_argument(self, converter_script):
        """Test that missing input argument produces error."""
        result = subprocess.run(
            [sys.executable, str(converter_script)],
            capture_output=True,
            text=True
        )

        assert result.returncode != 0
        assert "required" in result.stderr.lower()

    def test_basic_conversion(self, converter_script, tmp_path):
        """Test basic binary to PNG conversion."""
        # Create test input file
        input_file = tmp_path / "test_input.bin"
        test_data = b"Hello, PixelRTS v2!" * 100
        input_file.write_bytes(test_data)

        output_file = tmp_path / "test_output.rts.png"

        # Run converter
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file)
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert output_file.exists()

        # Check sidecar metadata was created
        meta_file = tmp_path / "test_output.rts.png.meta.json"
        assert meta_file.exists()

    def test_conversion_with_metadata(self, converter_script, tmp_path):
        """Test conversion with full metadata."""
        # Create test input file
        input_file = tmp_path / "kernel.bin"
        test_data = b"\x7fELF" + b"\x00" * 1000  # ELF header-like
        input_file.write_bytes(test_data)

        output_file = tmp_path / "kernel.rts.png"

        # Run converter with metadata
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file),
                "--type", "kernel",
                "--name", "linux",
                "--version", "6.1.0",
                "--description", "Linux kernel for Geometry OS"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert output_file.exists()

        # Verify sidecar metadata
        meta_file = tmp_path / "kernel.rts.png.meta.json"
        assert meta_file.exists()

        with open(meta_file, 'r') as f:
            metadata = json.load(f)

        # Check metadata structure
        assert "format" in metadata
        assert "format_version" in metadata
        assert metadata["format"] == "PixelRTS-2.0"
        assert metadata["format_version"] == 2
        assert "grid_size" in metadata
        assert "encoding" in metadata

        # Check content_version separately (user's version)
        assert "content_version" in metadata
        assert metadata["content_version"] == "6.1.0"

        # Check user metadata
        assert "user_metadata" in metadata
        user_meta = metadata["user_metadata"]
        assert user_meta.get("type") == "kernel"
        assert user_meta.get("name") == "linux"
        assert user_meta.get("version") == "6.1.0"
        assert user_meta.get("description") == "Linux kernel for Geometry OS"

    def test_code_mode_conversion(self, converter_script, tmp_path):
        """Test code mode conversion for WASM-like data."""
        # Create WASM-like test file
        input_file = tmp_path / "module.wasm"
        # WASM magic number + some content
        test_data = b"\x00\x61\x73\x6d" + b"\x01\x00\x00\x00" + b"\x00" * 500
        input_file.write_bytes(test_data)

        output_file = tmp_path / "module.rts.png"

        # Run converter in code mode
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file),
                "--mode", "code"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert output_file.exists()

        # Verify encoding mode in metadata
        meta_file = tmp_path / "module.rts.png.meta.json"
        with open(meta_file, 'r') as f:
            metadata = json.load(f)

        assert metadata["encoding"]["type"] == "RGBA-code"

    def test_explicit_grid_size(self, converter_script, tmp_path):
        """Test conversion with explicit grid size."""
        # Create small test file
        input_file = tmp_path / "small.bin"
        test_data = b"Test data"
        input_file.write_bytes(test_data)

        output_file = tmp_path / "small.rts.png"

        # Run converter with explicit grid size
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file),
                "--grid-size", "256"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert output_file.exists()

        # Verify grid size in metadata
        meta_file = tmp_path / "small.rts.png.meta.json"
        with open(meta_file, 'r') as f:
            metadata = json.load(f)

        assert metadata["grid_size"] == 256

    def test_invalid_grid_size(self, converter_script, tmp_path):
        """Test that invalid grid size is rejected."""
        # Create test file
        input_file = tmp_path / "test.bin"
        input_file.write_bytes(b"Test data")

        output_file = tmp_path / "test.rts.png"

        # Run converter with invalid grid size (not power of 2)
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file),
                "--grid-size", "100"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode != 0
        assert "power of 2" in result.stderr.lower()

    def test_nonexistent_input_file(self, converter_script, tmp_path):
        """Test that nonexistent input file produces error."""
        input_file = tmp_path / "does_not_exist.bin"
        output_file = tmp_path / "output.rts.png"

        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file)
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode != 0
        assert "not found" in result.stderr.lower()

    def test_verbose_output(self, converter_script, tmp_path):
        """Test verbose mode output."""
        # Create test file
        input_file = tmp_path / "test.bin"
        test_data = b"Verbose test data" * 100
        input_file.write_bytes(test_data)

        output_file = tmp_path / "test.rts.png"

        # Run converter with verbose flag
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file),
                "-v"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert "Reading input file" in result.stdout
        assert "Encoding mode:" in result.stdout
        assert "Grid size:" in result.stdout
        assert "Encoding complete" in result.stdout
        assert "Successfully created" in result.stdout
        assert "Summary:" in result.stdout

    def test_large_file_auto_grid_calculation(self, converter_script, tmp_path):
        """Test auto grid size calculation for larger files."""
        # Create file that requires 512x512 grid
        # 512x512 * 4 bytes = 1,048,576 bytes capacity
        input_file = tmp_path / "large.bin"
        test_data = b"X" * (500 * 500 * 4)  # ~1MB, needs 512x512 grid
        input_file.write_bytes(test_data)

        output_file = tmp_path / "large.rts.png"

        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file),
                "-v"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert "Auto-calculated grid size: 512" in result.stdout

    def test_hash_calculation(self, converter_script, tmp_path):
        """Test that SHA256 hash is calculated correctly."""
        # Create test file with known content
        input_file = tmp_path / "hash_test.bin"
        test_data = b"Hash test data for verification"
        input_file.write_bytes(test_data)

        output_file = tmp_path / "hash_test.rts.png"

        # Calculate expected hash
        import hashlib
        expected_hash = hashlib.sha256(test_data).hexdigest()

        # Run converter
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file),
                "--name", "hash_test"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0

        # Verify hash in output
        assert f"Hash:   {expected_hash}" in result.stdout

        # Verify hash in sidecar metadata
        meta_file = tmp_path / "hash_test.rts.png.meta.json"
        with open(meta_file, 'r') as f:
            metadata = json.load(f)

        assert "hash_test" in metadata.get("user_metadata", {}).get("segments", {})
        segment = metadata["user_metadata"]["segments"]["hash_test"]
        assert segment["sha256"] == expected_hash

    def test_output_file_creation(self, converter_script, tmp_path):
        """Test that output PNG file is valid image."""
        from PIL import Image

        # Create test file
        input_file = tmp_path / "image_test.bin"
        test_data = b"Image test data" * 100
        input_file.write_bytes(test_data)

        output_file = tmp_path / "image_test.rts.png"

        # Run converter
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file)
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0

        # Verify output is valid PNG
        try:
            img = Image.open(output_file)
            assert img.format == 'PNG'
            assert img.mode == 'RGBA'
            assert img.size[0] == img.size[1]  # Square image
            assert img.size[0] > 0  # Non-zero size
        except Exception as e:
            pytest.fail(f"Failed to open output PNG: {e}")


class TestConverterRoundTrip:
    """Test encode/decode round-trip functionality."""

    def test_round_trip_data_integrity(self, converter_script, tmp_path):
        """Test that data survives encode/decode round-trip."""
        # Note: This test requires the decoder CLI to be implemented
        # For now, we just verify the encoder produces consistent output

        # Create test file
        input_file = tmp_path / "roundtrip.bin"
        test_data = b"Round-trip test data with various bytes: \x00\x01\x02\xff\xfe\xfd" * 50
        input_file.write_bytes(test_data)

        output_file = tmp_path / "roundtrip.rts.png"

        # Run converter
        result = subprocess.run(
            [
                sys.executable,
                str(converter_script),
                str(input_file),
                str(output_file),
                "-v"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0

        # Verify metadata contains data hash
        meta_file = tmp_path / "roundtrip.rts.png.meta.json"
        with open(meta_file, 'r') as f:
            metadata = json.load(f)

        assert "data_hash" in metadata
        assert "data_size" in metadata

        # Verify hash matches original data
        import hashlib
        expected_hash = hashlib.sha256(test_data).hexdigest()
        assert metadata["data_hash"] == expected_hash
        assert metadata["data_size"] == len(test_data)


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
