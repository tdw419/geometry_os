"""
Integration tests for PixelRTS v2 Boot Script Generation
Tests boot script generation and QEMU integration.
"""

import pytest
import os
import sys
import subprocess
import tempfile
import json
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))

from systems.pixel_compiler.pixelrts_v2_core import (
    PixelRTSEncoder,
    PixelRTSMetadata
)
from systems.pixel_compiler.pixelrts_v2_converter import (
    generate_boot_script
)


def test_boot_script_generation_kernel():
    """Test boot script generation for kernel type."""
    encoder = PixelRTSEncoder(mode="standard")

    # Simulate kernel data
    kernel_data = b"\x00" * 1024  # 1KB dummy kernel

    metadata = {
        "type": "kernel",
        "name": "test-kernel",
        "version": "1.0.0",
        "description": "Test kernel for boot script"
    }

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    # Generate boot script
    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata},
            qemu_arch="x86_64",
            qemu_memory="2G",
            qemu_cpu="host"
        )

        # Verify boot script was created
        assert os.path.exists(boot_script_path)
        assert boot_script_path.endswith('.boot.sh')

        # Verify script is executable
        assert os.access(boot_script_path, os.X_OK)

        # Read and verify script content
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        # Verify script contains key elements
        assert '#!/bin/bash' in script_content
        assert 'qemu-system-x86_64' in script_content
        assert '-m $QEMU_MEMORY' in script_content or 'QEMU_MEMORY="2G"' in script_content
        assert '-cpu $QEMU_CPU' in script_content or 'QEMU_CPU="host"' in script_content
        assert '-kernel' in script_content
        assert 'test-kernel' in script_content
        assert 'PixelRTS' in script_content

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_boot_script_generation_os():
    """Test boot script generation for OS type."""
    encoder = PixelRTSEncoder(mode="standard")

    # Simulate OS image data
    os_data = b"GEOMETRY_OS_v1" * 100  # 1.4KB dummy OS

    metadata = {
        "type": "os",
        "name": "geometry-os",
        "version": "1.0.0",
        "description": "Geometry OS image"
    }

    png_bytes = encoder.encode(os_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    # Generate boot script
    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata},
            qemu_arch="x86_64"
        )

        # Verify boot script was created
        assert os.path.exists(boot_script_path)

        # Read and verify script content
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        # OS type should have different handling
        assert 'OS' in script_content or 'os' in script_content
        assert 'disk image' in script_content.lower()

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_boot_script_aarch64():
    """Test boot script generation for ARM64 architecture."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"\x00" * 512

    metadata = {
        "type": "kernel",
        "name": "arm64-kernel"
    }

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata},
            qemu_arch="aarch64",
            qemu_memory="4G"
        )

        # Verify ARM64 QEMU binary
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        assert 'qemu-system-aarch64' in script_content
        assert 'QEMU_MEMORY="4G"' in script_content or '4G' in script_content
        assert 'aarch64' in script_content

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_boot_script_riscv64():
    """Test boot script generation for RISC-V architecture."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"\x00" * 512

    metadata = {
        "type": "kernel",
        "name": "riscv-kernel"
    }

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata},
            qemu_arch="riscv64"
        )

        # Verify RISC-V QEMU binary
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        assert 'qemu-system-riscv64' in script_content
        assert 'riscv64' in script_content

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_boot_script_custom_cmdline():
    """Test boot script with custom kernel command line."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"\x00" * 512

    metadata = {
        "type": "kernel",
        "name": "test-kernel"
    }

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        custom_cmdline = "console=ttyS0,115200 earlyprintk=serial,ttyS0,115200 debug"
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata},
            kernel_cmdline=custom_cmdline
        )

        # Verify custom command line is used
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        assert custom_cmdline in script_content
        assert '-append' in script_content

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_boot_script_custom_output_path():
    """Test boot script generation with custom output path."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"\x00" * 512

    metadata = {"type": "kernel", "name": "test"}

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    with tempfile.NamedTemporaryFile(suffix='.sh', delete=False) as f:
        custom_output = f.name

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata},
            output_path=custom_output
        )

        # Verify custom path was used
        assert boot_script_path == custom_output
        assert os.path.exists(custom_output)

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(custom_output):
            os.remove(custom_output)


def test_boot_script_extraction_logic():
    """Test that boot script contains proper extraction logic."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"KERNEL_DATA" * 100

    metadata = {
        "type": "kernel",
        "name": "test-kernel"
    }

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata}
        )

        # Read script content
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        # Verify extraction logic is present
        assert 'PixelRTSDecoder' in script_content
        assert 'decoder.decode' in script_content
        assert 'Extracted to:' in script_content
        assert '/tmp/pixelrts_' in script_content

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_boot_script_metadata_preservation():
    """Test that metadata is preserved in boot script comments."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"\x00" * 512

    metadata = {
        "type": "kernel",
        "name": "linux-v6.0",
        "version": "6.0.1",
        "description": "Linux kernel for testing"
    }

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata}
        )

        # Read script content
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        # Verify metadata is in comments
        assert 'linux-v6.0' in script_content
        # Version might be in metadata or not - just check name is preserved
        assert 'kernel' in script_content

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_boot_script_error_handling():
    """Test that boot script has proper error handling."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"\x00" * 512

    metadata = {"type": "kernel", "name": "test"}

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata}
        )

        # Read script content
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        # Verify error handling
        assert 'set -e' in script_content
        assert '|| exit 1' in script_content

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_boot_script_default_parameters():
    """Test boot script with default QEMU parameters."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"\x00" * 512

    metadata = {"type": "kernel", "name": "test"}

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        # Don't specify parameters - should use defaults
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata}
        )

        # Read script content
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        # Verify defaults
        assert 'qemu-system-x86_64' in script_content  # Default arch
        assert 'QEMU_MEMORY="2G"' in script_content or '2G' in script_content  # Default memory
        assert 'QEMU_CPU="host"' in script_content or 'host' in script_content  # Default CPU

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)


def test_converter_cli_boot_script_flag():
    """Test converter CLI with --generate-boot-script flag."""
    import subprocess

    # Create test input file
    with tempfile.NamedTemporaryFile(suffix='.bin', delete=False) as f:
        input_path = f.name
        f.write(b"TEST_KERNEL_DATA" * 100)

    output_path = input_path.replace('.bin', '.rts.png')
    boot_script_path = output_path + '.boot.sh'
    meta_path = output_path + '.meta.json'

    try:
        # Run converter with boot script flag
        result = subprocess.run(
            [
                sys.executable,
                'systems/pixel_compiler/pixelrts_v2_converter.py',
                input_path,
                output_path,
                '--type', 'kernel',
                '--name', 'test-kernel',
                '--generate-boot-script'
            ],
            capture_output=True,
            text=True
        )

        # Should succeed
        assert result.returncode == 0, f"CLI failed: {result.stderr}"

        # Verify files were created
        assert os.path.exists(output_path), "PNG file not created"
        assert os.path.exists(boot_script_path), "Boot script not created"
        assert os.path.exists(meta_path), "Metadata file not created"

        # Verify boot script is executable
        assert os.access(boot_script_path, os.X_OK), "Boot script not executable"

        # Verify output mentions boot script
        assert 'boot script' in result.stdout.lower() or 'boot.sh' in result.stdout.lower()

    finally:
        # Cleanup
        for path in [input_path, output_path, boot_script_path, meta_path]:
            if os.path.exists(path):
                os.remove(path)


@pytest.mark.parametrize("arch,expected_binary", [
    ("x86_64", "qemu-system-x86_64"),
    ("aarch64", "qemu-system-aarch64"),
    ("riscv64", "qemu-system-riscv64"),
    ("arm", "qemu-system-arm"),
    ("ppc64", "qemu-system-ppc64"),
])
def test_boot_script_all_architectures(arch, expected_binary):
    """Test boot script generation for all supported architectures."""
    encoder = PixelRTSEncoder(mode="standard")

    kernel_data = b"\x00" * 512

    metadata = {"type": "kernel", "name": f"{arch}-kernel"}

    png_bytes = encoder.encode(kernel_data, metadata=metadata)
    encoder_metadata = encoder.get_metadata()

    with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
        png_path = f.name
        f.write(png_bytes)

    try:
        boot_script_path = generate_boot_script(
            png_path,
            {**metadata, **encoder_metadata},
            qemu_arch=arch
        )

        # Verify correct QEMU binary
        with open(boot_script_path, 'r') as f:
            script_content = f.read()

        assert expected_binary in script_content

    finally:
        # Cleanup
        if os.path.exists(png_path):
            os.remove(png_path)
        if os.path.exists(boot_script_path):
            os.remove(boot_script_path)
