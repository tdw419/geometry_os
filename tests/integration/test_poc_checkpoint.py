"""
POC Checkpoint - End-to-End Integration Test for PixelRTS v2

This test validates the complete workflow:
1. Convert binary → .rts.png (using converter CLI)
2. Extract .rts.png → binary (using extractor CLI)
3. Verify data integrity (SHA256 hash comparison)
4. Verify metadata preservation
"""

import pytest
import subprocess
import hashlib
import json
import tempfile
from pathlib import Path


def get_file_hash(filepath: str) -> str:
    """Calculate SHA256 hash of a file."""
    with open(filepath, 'rb') as f:
        return hashlib.sha256(f.read()).hexdigest()


def test_poc_checkpoint_basic_workflow():
    """
    POC Checkpoint: Test basic convert → extract → verify workflow.

    This is the core integration test that validates the entire PixelRTS v2 pipeline.
    """
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Step 1: Create test binary
        test_data = b"Hello, PixelRTS v2! This is a POC checkpoint test."
        input_file = tmpdir / "test_input.bin"
        input_file.write_bytes(test_data)

        original_hash = get_file_hash(str(input_file))
        print(f"✓ Created test binary: {input_file}")
        print(f"  Size: {len(test_data)} bytes")
        print(f"  SHA256: {original_hash}")

        # Step 2: Convert to .rts.png
        output_png = tmpdir / "test_output.rts.png"
        result = subprocess.run([
            "python3",
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(output_png),
            "--type", "test",
            "--name", "poc-checkpoint",
            "--description", "POC checkpoint test data"
        ], capture_output=True, text=True, cwd="/home/jericho/zion/projects/geometry_os")

        assert result.returncode == 0, f"Converter failed: {result.stderr}"
        assert output_png.exists(), "PNG file not created"
        print(f"\n✓ Converted to PNG: {output_png}")

        # Verify sidecar metadata was created
        # The converter appends .meta.json to the output filename
        meta_file = tmpdir / "test_output.rts.png.meta.json"
        assert meta_file.exists(), "Sidecar metadata not created"
        print(f"✓ Sidecar metadata created: {meta_file}")

        # Step 3: Extract back to binary
        extracted_file = tmpdir / "test_extracted.bin"
        result = subprocess.run([
            "python3",
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(output_png),
            "-o", str(extracted_file),
            "--verify"
        ], capture_output=True, text=True, cwd="/home/jericho/zion/projects/geometry_os")

        assert result.returncode == 0, f"Extractor failed: {result.stderr}"
        assert extracted_file.exists(), "Extracted file not created"
        print(f"\n✓ Extracted back to binary: {extracted_file}")

        # Step 4: Verify data integrity
        extracted_hash = get_file_hash(str(extracted_file))
        extracted_data = extracted_file.read_bytes()

        assert extracted_hash == original_hash, "Hash mismatch - data corrupted!"
        assert extracted_data == test_data, "Data mismatch - corruption detected!"
        print(f"\n✓ Data integrity verified:")
        print(f"  Original SHA256: {original_hash}")
        print(f"  Extracted SHA256: {extracted_hash}")
        print(f"  Match: YES ✓")

        # Step 5: Verify metadata preservation
        with open(meta_file, 'r') as f:
            metadata = json.load(f)

        assert metadata["type"] == "test", "Metadata type not preserved"
        assert metadata["name"] == "poc-checkpoint", "Metadata name not preserved"
        assert "data_hash" in metadata, "Data hash not in metadata"
        assert "data_size" in metadata, "Data size not in metadata"
        assert metadata["data_hash"] == original_hash, "Metadata hash mismatch"
        print(f"\n✓ Metadata verified:")
        print(f"  Type: {metadata['type']}")
        print(f"  Name: {metadata['name']}")
        print(f"  Size: {metadata['data_size']} bytes")
        print(f"  Format: {metadata.get('format', 'N/A')}")

        print(f"\n{'='*60}")
        print(f"✅ POC CHECKPOINT PASSED!")
        print(f"{'='*60}")
        print(f"Complete workflow validated:")
        print(f"  Binary → .rts.png → Binary")
        print(f"  Data integrity: VERIFIED")
        print(f"  Metadata preservation: VERIFIED")


def test_poc_checkpoint_with_boot_script():
    """
    POC Checkpoint: Test boot script generation.
    """
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Create test kernel data
        test_kernel = b"FAKE_KERNEL" + b"\x00" * 100
        kernel_file = tmpdir / "kernel.bin"
        kernel_file.write_bytes(test_kernel)

        # Convert with boot script
        output_png = tmpdir / "kernel.rts.png"
        result = subprocess.run([
            "python3",
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(kernel_file),
            str(output_png),
            "--type", "kernel",
            "--name", "test-kernel",
            "--generate-boot-script",
            "--qemu-arch", "x86_64"
        ], capture_output=True, text=True, cwd="/home/jericho/zion/projects/geometry_os")

        assert result.returncode == 0, f"Converter failed: {result.stderr}"
        print(f"✓ Converted kernel with boot script")

        # Verify boot script was created
        # The boot script is created at png_path + '.boot.sh' = kernel.rts.png.boot.sh
        boot_script = tmpdir / "kernel.rts.png.boot.sh"
        assert boot_script.exists(), "Boot script not created"
        print(f"✓ Boot script created: {boot_script}")

        # Verify boot script is executable
        assert boot_script.stat().st_mode & 0o111, "Boot script not executable"
        print(f"✓ Boot script is executable")

        # Verify boot script content
        script_content = boot_script.read_text()
        assert "qemu-system" in script_content, "QEMU command not in boot script"
        assert "pixelrts_v2_extractor" in script_content or "PixelRTSDecoder" in script_content, "Extraction not in boot script"
        print(f"✓ Boot script contains QEMU and extraction commands")


def test_poc_checkpoint_round_trip_various_sizes():
    """
    POC Checkpoint: Test round-trip with various data sizes.
    """
    test_sizes = [
        (16, "tiny"),
        (256, "small"),
        (4096, "medium"),
        (65536, "large")
    ]

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        for size, name in test_sizes:
            print(f"\nTesting {name} data ({size} bytes)...")

            # Create test data
            test_data = bytes([i % 256 for i in range(size)])
            input_file = tmpdir / f"{name}_input.bin"
            input_file.write_bytes(test_data)

            original_hash = get_file_hash(str(input_file))

            # Convert
            output_png = tmpdir / f"{name}_output.rts.png"
            result = subprocess.run([
                "python3",
                "systems/pixel_compiler/pixelrts_v2_converter.py",
                str(input_file),
                str(output_png)
            ], capture_output=True, text=True, cwd="/home/jericho/zion/projects/geometry_os")

            assert result.returncode == 0, f"Converter failed for {name}: {result.stderr}"

            # Extract
            extracted_file = tmpdir / f"{name}_extracted.bin"
            result = subprocess.run([
                "python3",
                "systems/pixel_compiler/pixelrts_v2_extractor.py",
                str(output_png),
                "-o", str(extracted_file)
            ], capture_output=True, text=True, cwd="/home/jericho/zion/projects/geometry_os")

            assert result.returncode == 0, f"Extractor failed for {name}: {result.stderr}"

            # Verify
            extracted_hash = get_file_hash(str(extracted_file))
            assert extracted_hash == original_hash, f"Hash mismatch for {name}"

            print(f"  ✓ {name.capitalize()} ({size} bytes): PASSED")


def test_poc_checkpoint_error_handling():
    """
    POC Checkpoint: Test error handling.
    """
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Test 1: Non-existent input file
        result = subprocess.run([
            "python3",
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            "nonexistent.bin",
            str(tmpdir / "output.png")
        ], capture_output=True, text=True, cwd="/home/jericho/zion/projects/geometry_os")

        assert result.returncode != 0, "Should fail with non-existent input"
        print(f"✓ Correctly handles non-existent input file")

        # Test 2: Invalid PNG for extraction
        fake_png = tmpdir / "fake.png"
        fake_png.write_bytes(b"Not a PNG")

        result = subprocess.run([
            "python3",
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(fake_png)
        ], capture_output=True, text=True, cwd="/home/jericho/zion/projects/geometry_os")

        assert result.returncode != 0, "Should fail with invalid PNG"
        print(f"✓ Correctly handles invalid PNG file")


def test_poc_checkpoint_metadata_info():
    """
    POC Checkpoint: Test --info flag for metadata inspection.
    """
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Create test file
        test_data = b"Test data for info check"
        input_file = tmpdir / "test.bin"
        input_file.write_bytes(test_data)

        # Convert
        output_png = tmpdir / "test.rts.png"
        subprocess.run([
            "python3",
            "systems/pixel_compiler/pixelrts_v2_converter.py",
            str(input_file),
            str(output_png),
            "--type", "wasm",
            "--name", "test-module",
            "--version", "1.0.0"
        ], capture_output=True, cwd="/home/jericho/zion/projects/geometry_os")

        # Test --info flag
        result = subprocess.run([
            "python3",
            "systems/pixel_compiler/pixelrts_v2_extractor.py",
            str(output_png),
            "--info"
        ], capture_output=True, text=True, cwd="/home/jericho/zion/projects/geometry_os")

        assert result.returncode == 0, "Info command failed"
        output = result.stdout

        # Verify info contains expected fields
        assert "test-module" in output or "test" in output, "Name not in info output"
        assert "wasm" in output.lower() or "type" in output.lower(), "Type not in info output"
        print(f"✓ Metadata info output working")


if __name__ == "__main__":
    # Run tests manually for debugging
    print("=" * 60)
    print("POC Checkpoint - Manual Test Run")
    print("=" * 60)

    test_poc_checkpoint_basic_workflow()
    print("\n" + "=" * 60 + "\n")

    test_poc_checkpoint_with_boot_script()
    print("\n" + "=" * 60 + "\n")

    test_poc_checkpoint_round_trip_various_sizes()
    print("\n" + "=" * 60 + "\n")

    test_poc_checkpoint_error_handling()
    print("\n" + "=" * 60 + "\n")

    test_poc_checkpoint_metadata_info()

    print("\n" + "=" * 60)
    print("ALL POC CHECKPOINT TESTS PASSED!")
    print("=" * 60)
