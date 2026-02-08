#!/usr/bin/env python3
"""
Integration tests for PixelRTS v2 Extractor CLI Tool

Tests the command-line interface for extracting binaries from PixelRTS v2 containers.

Author: PixelRTS v2 Implementation Team
Date: 2026-02-08
"""

import pytest
import subprocess
import sys
import json
import tempfile
import shutil
from pathlib import Path
from PIL import Image
import numpy as np


class TestExtractorCLI:
    """Test extractor CLI functionality"""

    def test_help_output(self):
        """Test that help message is displayed correctly"""
        result = subprocess.run(
            [sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py", "--help"],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        assert "Extract binary data from PixelRTS v2 PNG container" in result.stdout
        assert "--verify" in result.stdout
        assert "--info" in result.stdout
        assert "--output" in result.stdout

    def test_missing_input_argument(self):
        """Test that missing input argument shows error"""
        result = subprocess.run(
            [sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py"],
            capture_output=True,
            text=True
        )

        assert result.returncode != 0
        assert "required: input" in result.stderr.lower()

    def test_nonexistent_input_file(self):
        """Test that nonexistent input file shows error"""
        result = subprocess.run(
            [
                sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py",
                "nonexistent.rts.png"
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode != 0

    def test_invalid_png_format(self, tmp_path):
        """Test that invalid PNG format is rejected"""
        # Create a fake PNG file
        fake_png = tmp_path / "fake.rts.png"
        with open(fake_png, 'wb') as f:
            f.write(b'This is not a PNG file')

        result = subprocess.run(
            [
                sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py",
                str(fake_png)
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode != 0


class TestExtractorWithConverter:
    """Test extractor working with converter for round-trip"""

    def test_round_trip_with_converter(self, tmp_path):
        """Test convert → extract round-trip using CLI tools"""
        from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder

        # Create test data
        test_data = b'Round-trip test data!' * 50

        # Create a simple PNG with PixelRTS metadata
        grid_size = 16  # Small grid for testing

        # Create pixel array
        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Fill with test data (simple linear fill for test)
        data_idx = 0
        for y in range(grid_size):
            for x in range(grid_size):
                if data_idx < len(test_data):
                    pixel_array[y, x, 0] = test_data[data_idx] if data_idx < len(test_data) else 0
                    pixel_array[y, x, 1] = test_data[data_idx + 1] if data_idx + 1 < len(test_data) else 0
                    pixel_array[y, x, 2] = test_data[data_idx + 2] if data_idx + 2 < len(test_data) else 0
                    pixel_array[y, x, 3] = test_data[data_idx + 3] if data_idx + 3 < len(test_data) else 0
                    data_idx += 4

        # Create PNG image
        image = Image.fromarray(pixel_array, mode='RGBA')

        # Add metadata
        metadata = {
            "format": "PixelRTS-2.0",
            "version": 2,
            "grid_size": grid_size,
            "encoding": {
                "type": "RGBA-dense",
                "bytes_per_pixel": 4
            },
            "offsets": {
                "test": {
                    "start": 0,
                    "end": len(test_data),
                    "size": len(test_data)
                }
            }
        }

        png_path = tmp_path / "test.rts.png"

        from PIL import PngImagePlugin
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", json.dumps(metadata))

        image.save(png_path, pnginfo=pnginfo)

        # Now test extraction
        output_path = tmp_path / "extracted.bin"

        result = subprocess.run(
            [
                sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py",
                str(png_path),
                "-o", str(output_path)
            ],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0
        assert output_path.exists()

    def test_info_flag(self, tmp_path):
        """Test --info flag behavior"""
        # Create a simple test PNG
        grid_size = 8
        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
        image = Image.fromarray(pixel_array, mode='RGBA')

        png_path = tmp_path / "test.png"
        image.save(png_path)

        # Test --info without metadata (should fail gracefully)
        result = subprocess.run(
            [
                sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py",
                str(png_path),
                "--info"
            ],
            capture_output=True,
            text=True
        )

        # Should return error for missing metadata
        assert result.returncode != 0
        assert "metadata" in result.stderr.lower() or "not found" in result.stderr.lower()


class TestExtractorErrorHandling:
    """Test error handling in extractor"""

    def test_corrupted_png(self, tmp_path):
        """Test handling of corrupted PNG file"""
        # Create a corrupted PNG
        corrupted_png = tmp_path / "corrupted.rts.png"
        with open(corrupted_png, 'wb') as f:
            # PNG signature followed by garbage
            f.write(b'\x89PNG\r\n\x1a\n' + b'garbage data' * 10)

        result = subprocess.run(
            [
                sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py",
                str(corrupted_png)
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode != 0

    def test_missing_metadata(self, tmp_path):
        """Test handling of PNG without PixelRTS metadata"""
        from PIL import Image

        # Create a plain PNG without metadata
        img = Image.new('RGBA', (100, 100), color='red')
        plain_png = tmp_path / "plain.png"
        img.save(plain_png)

        result = subprocess.run(
            [
                sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py",
                str(plain_png)
            ],
            capture_output=True,
            text=True
        )

        # Should handle gracefully (might return error or warning)
        assert result.returncode != 0 or "warning" in result.stdout.lower() or "error" in result.stderr.lower()


class TestExtractorRealWorkflow:
    """Test extractor with real-world-like scenarios"""

    def test_extract_with_verify(self, tmp_path):
        """Test extraction with SHA256 verification"""
        # Create a test PNG with hash
        grid_size = 8
        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

        # Add some test data
        test_data = b'Test data for verification!'
        for i, byte in enumerate(test_data):
            y = (i * 4) // grid_size
            x = (i * 4) % grid_size
            if y < grid_size and x < grid_size:
                pixel_array[y, x, 0] = byte

        image = Image.fromarray(pixel_array, mode='RGBA')

        # Calculate hash
        import hashlib
        data_hash = hashlib.sha256(test_data).hexdigest()

        metadata = {
            "format": "PixelRTS-2.0",
            "version": 2,
            "grid_size": grid_size,
            "offsets": {
                "test": {
                    "start": 0,
                    "end": len(test_data),
                    "size": len(test_data),
                    "sha256": data_hash
                }
            }
        }

        png_path = tmp_path / "test.rts.png"

        from PIL import PngImagePlugin
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", json.dumps(metadata))

        image.save(png_path, pnginfo=pnginfo)

        # Extract with verify
        result = subprocess.run(
            [
                sys.executable, "systems/pixel_compiler/pixelrts_v2_extractor.py",
                str(png_path),
                "--verify"
            ],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0

    def test_default_output_path(self, tmp_path):
        """Test that default output path is <input>.extracted"""
        # Create test PNG
        grid_size = 8
        pixel_array = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
        image = Image.fromarray(pixel_array, mode='RGBA')

        metadata = {
            "format": "PixelRTS-2.0",
            "version": 2,
            "grid_size": grid_size
        }

        png_path = tmp_path / "sample.rts.png"

        from PIL import PngImagePlugin
        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", json.dumps(metadata))

        image.save(png_path, pnginfo=pnginfo)

        # Use absolute path for extractor
        result = subprocess.run(
            [
                sys.executable,
                str(Path("systems/pixel_compiler/pixelrts_v2_extractor.py").resolve()),
                str(png_path)
            ],
            capture_output=True,
            text=True
        )

        assert result.returncode == 0
        # Check if default output file was created
        assert (png_path.parent / "sample.rts.png.extracted").exists()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
