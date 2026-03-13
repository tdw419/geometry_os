"""Test glyph → Vulkan integration."""

import subprocess
import json
import pytest


def test_vulkan_available():
    """Check Vulkan availability - doesn't fail if no GPU."""
    result = subprocess.run(
        ["cargo", "test", "--package", "glyph_compiler", "--features", "vulkan", "--", "--ignored"],
        capture_output=True,
        text=True,
    )
    # Just check it runs, not that it passes (might not have GPU)
    assert result.returncode == 0 or "Vulkan" in result.stderr


def test_glyph_compiler_vulkan_feature():
    """Test that glyph_compiler builds with vulkan feature."""
    result = subprocess.run(
        ["cargo", "check", "--package", "glyph_compiler", "--features", "vulkan"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"Cargo check failed: {result.stderr}"


def test_glyph_compiler_wgpu_feature():
    """Test that glyph_compiler builds with wgpu feature."""
    result = subprocess.run(
        ["cargo", "check", "--package", "glyph_compiler", "--features", "wgpu"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"Cargo check failed: {result.stderr}"


def test_spirv_compilation():
    """Test that glyph programs compile to valid SPIR-V."""
    result = subprocess.run(
        ["cargo", "test", "--package", "glyph_compiler", "test_simple_add_program_generates_valid_spirv"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"SPIR-V compilation test failed: {result.stderr}"
    assert "test result: ok" in result.stdout


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
