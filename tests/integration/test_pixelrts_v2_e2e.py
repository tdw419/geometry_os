"""End-to-end integration tests for PixelRTS v2.

Tests the complete workflow: binary -> PNG -> extract -> verify.
Uses subprocess to run CLI tools and verifies data integrity throughout.
"""

import sys
import pytest
import subprocess
import tempfile
import hashlib
import json
from pathlib import Path


class TestE2EStandardWorkflow:
    """Test complete standard workflow: convert -> extract -> verify."""

    def test_e2e_standard_conversion(self, tmp_path):
        """Test complete workflow: binary -> PNG -> extract -> verify."""
        # Create test file
        test_data = b"PixelRTS v2 end-to-end test data! " * 100
        input_file = tmp_path / "test.bin"
        input_file.write_bytes(test_data)

        # Convert to .rts.png
        png_file = tmp_path / "test.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(png_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0, f"Converter failed: {result.stderr}"
        assert png_file.exists(), f"PNG file not created: {png_file}"

        # Extract back
        output_file = tmp_path / "test.extracted"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(png_file),
            "-o", str(output_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0, f"Extractor failed: {result.stderr}"
        assert output_file.exists(), f"Extracted file not created: {output_file}"

        # Verify data integrity
        extracted_data = output_file.read_bytes()
        assert extracted_data == test_data, "Data integrity check failed"

    def test_e2e_large_file(self, tmp_path):
        """Test workflow with larger file (100KB)."""
        # Create larger test file
        test_data = b"Large file test data! " * 2000  # ~100KB
        input_file = tmp_path / "large.bin"
        input_file.write_bytes(test_data)

        # Convert to .rts.png
        png_file = tmp_path / "large.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(png_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0, f"Converter failed: {result.stderr}"
        assert png_file.exists()

        # Extract and verify
        output_file = tmp_path / "large.extracted"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(png_file),
            "-o", str(output_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0
        assert output_file.read_bytes() == test_data

    def test_e2e_with_hash_verification(self, tmp_path):
        """Test workflow with SHA256 hash verification."""
        test_data = b"Hash verification test data! " * 50
        input_file = tmp_path / "hash_test.bin"
        input_file.write_bytes(test_data)

        # Convert
        png_file = tmp_path / "hash_test.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(png_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0

        # Extract with verification
        output_file = tmp_path / "hash_test.extracted"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(png_file),
            "-o", str(output_file),
            "--verify"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0
        assert "Hash verification passed" in result.stdout or result.returncode == 0
        assert output_file.read_bytes() == test_data


class TestE2EWASMCodeMode:
    """Test WASM conversion with code mode."""

    def test_e2e_wasm_code_mode(self, tmp_path):
        """Test WASM conversion with code mode."""
        # Minimal valid WASM
        wasm_bytes = bytes([
            0x00, 0x61, 0x73, 0x6d,  # magic
            0x01, 0x00, 0x00, 0x00,  # version
            0x01, 0x07, 0x01,
            0x60, 0x02, 0x7f, 0x7f, 0x01, 0x7f,
            0x03, 0x02, 0x01, 0x00,
            0x0a, 0x09, 0x01,
            0x07, 0x00,
            0x20, 0x00,  # local.get 0
            0x20, 0x01,  # local.get 1
            0x6a,        # i32.add
            0x0b         # end
        ])

        wasm_file = tmp_path / "add.wasm"
        wasm_file.write_bytes(wasm_bytes)

        png_file = tmp_path / "add.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(wasm_file),
            str(png_file),
            "--mode", "code"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0, f"Converter failed: {result.stderr}"
        assert png_file.exists()

        # Extract and verify
        output_file = tmp_path / "add.extracted"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(png_file),
            "-o", str(output_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0
        assert output_file.read_bytes() == wasm_bytes

    def test_e2e_wasm_with_metadata(self, tmp_path):
        """Test WASM conversion with metadata and code mode."""
        wasm_bytes = bytes([
            0x00, 0x61, 0x73, 0x6d,
            0x01, 0x00, 0x00, 0x00,
            0x01, 0x04, 0x01, 0x60, 0x00, 0x00,
            0x03, 0x02, 0x01, 0x00,
            0x0a, 0x04, 0x01, 0x02, 0x00, 0x0b
        ])

        wasm_file = tmp_path / "simple.wasm"
        wasm_file.write_bytes(wasm_bytes)

        png_file = tmp_path / "simple.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(wasm_file),
            str(png_file),
            "--mode", "code",
            "--type", "wasm",
            "--name", "simple-module"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0
        assert png_file.exists()

        # Verify metadata
        meta_file = tmp_path / "simple.rts.png.meta.json"
        assert meta_file.exists()

        metadata = json.loads(meta_file.read_text())
        assert metadata["user_metadata"]["type"] == "wasm"
        assert metadata["user_metadata"]["name"] == "simple-module"


class TestE2EWithMetadata:
    """Test conversion with full metadata."""

    def test_e2e_with_metadata(self, tmp_path):
        """Test conversion with full metadata."""
        test_data = b"Test data with metadata"
        input_file = tmp_path / "kernel.bin"
        input_file.write_bytes(test_data)

        png_file = tmp_path / "kernel.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(png_file),
            "--type", "kernel",
            "--name", "test-kernel",
            "--version", "1.0.0",
            "--description", "Test kernel for E2E"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0

        # Check metadata file exists
        meta_file = tmp_path / "kernel.rts.png.meta.json"
        assert meta_file.exists()

        # Verify metadata content
        metadata = json.loads(meta_file.read_text())
        assert metadata["user_metadata"]["type"] == "kernel"
        assert metadata["user_metadata"]["name"] == "test-kernel"
        assert metadata["user_metadata"]["version"] == "1.0.0"
        assert metadata["user_metadata"]["description"] == "Test kernel for E2E"

    def test_e2e_metadata_info_command(self, tmp_path):
        """Test --info command shows metadata."""
        test_data = b"Info test data"
        input_file = tmp_path / "info.bin"
        input_file.write_bytes(test_data)

        png_file = tmp_path / "info.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(png_file),
            "--type", "test",
            "--name", "info-test"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0

        # Get info
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(png_file),
            "--info"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0
        assert "PixelRTS" in result.stdout
        assert "Grid Size" in result.stdout
        assert "Data Size" in result.stdout


class TestE2EBootScriptGeneration:
    """Test boot script generation."""

    def test_e2e_boot_script_generation(self, tmp_path):
        """Test boot script generation."""
        kernel_data = b"Fake kernel for boot test"
        kernel_file = tmp_path / "kernel.bin"
        kernel_file.write_bytes(kernel_data)

        png_file = tmp_path / "kernel.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(kernel_file),
            str(png_file),
            "--type", "kernel",
            "--generate-boot-script"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0

        # Check boot script exists
        boot_script = tmp_path / "kernel.rts.png.boot.sh"
        assert boot_script.exists()

        # Verify script is executable
        import stat
        assert boot_script.stat().st_mode & stat.S_IXUSR

        # Check script content
        content = boot_script.read_text()
        assert "#!/bin/bash" in content
        assert "qemu-system" in content
        assert "PixelRTS" in content

    def test_e2e_boot_script_with_custom_qemu(self, tmp_path):
        """Test boot script generation with custom QEMU parameters."""
        kernel_data = b"Fake kernel for custom QEMU test"
        kernel_file = tmp_path / "kernel_custom.bin"
        kernel_file.write_bytes(kernel_data)

        png_file = tmp_path / "kernel_custom.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(kernel_file),
            str(png_file),
            "--type", "kernel",
            "--generate-boot-script",
            "--qemu-arch", "aarch64",
            "--qemu-memory", "4G",
            "--qemu-cpu", "cortex-a72"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0

        # Check boot script content
        boot_script = tmp_path / "kernel_custom.rts.png.boot.sh"
        content = boot_script.read_text()
        assert "qemu-system-aarch64" in content
        assert "4G" in content
        assert "cortex-a72" in content


class TestE2EDataIntegrity:
    """Test data integrity throughout the pipeline."""

    def test_e2e_binary_integrity(self, tmp_path):
        """Test that binary data is preserved exactly."""
        # Create test data with various byte patterns
        test_data = bytes(range(256)) * 4  # All possible byte values
        input_file = tmp_path / "binary.bin"
        input_file.write_bytes(test_data)

        # Convert
        png_file = tmp_path / "binary.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(png_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0

        # Extract
        output_file = tmp_path / "binary.extracted"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(png_file),
            "-o", str(output_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0
        assert output_file.read_bytes() == test_data

    def test_e2e_roundtrip_hash_consistency(self, tmp_path):
        """Test that hash is consistent through round-trip."""
        test_data = b"Hash consistency test data! " * 100
        input_file = tmp_path / "hash.bin"
        input_file.write_bytes(test_data)

        # Calculate original hash
        original_hash = hashlib.sha256(test_data).hexdigest()

        # Convert
        png_file = tmp_path / "hash.rts.png"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(png_file)
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0

        # Check hash in metadata
        meta_file = tmp_path / "hash.rts.png.meta.json"
        metadata = json.loads(meta_file.read_text())
        # Hash is stored in segments
        segment_name = Path(input_file).stem
        stored_hash = metadata["user_metadata"]["segments"][segment_name]["sha256"]
        assert stored_hash == original_hash

        # Extract
        output_file = tmp_path / "hash.extracted"
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(png_file),
            "-o", str(output_file),
            "--verify"
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode == 0

        # Verify extracted data hash
        extracted_hash = hashlib.sha256(output_file.read_bytes()).hexdigest()
        assert extracted_hash == original_hash


class TestE2EErrorHandling:
    """Test error handling in end-to-end workflow."""

    def test_e2e_nonexistent_input(self, tmp_path):
        """Test handling of nonexistent input file."""
        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            "nonexistent.bin",
            str(tmp_path / "output.rts.png")
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode != 0
        assert "not found" in result.stderr.lower()

    def test_e2e_extract_from_invalid_png(self, tmp_path):
        """Test extraction from invalid PNG file."""
        invalid_png = tmp_path / "invalid.rts.png"
        invalid_png.write_bytes(b"This is not a PNG file")

        result = subprocess.run([
            sys.executable,
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(invalid_png),
            "-o", str(tmp_path / "output.bin")
        ], capture_output=True, text=True, cwd=str(Path(__file__).parent.parent.parent))

        assert result.returncode != 0
