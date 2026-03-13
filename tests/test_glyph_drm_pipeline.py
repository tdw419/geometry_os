"""Test glyph → DRM/KMS pipeline integration."""

import subprocess
import json
import pytest


def test_glyph_compiler_builds():
    """Test that glyph_compiler builds successfully."""
    result = subprocess.run(
        ["cargo", "check", "--package", "glyph_compiler", "--features", "vulkan"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"Build failed: {result.stderr}"


def test_infinite_map_rs_builds():
    """Test that infinite_map_rs builds with DRM backend."""
    result = subprocess.run(
        ["cargo", "check", "--package", "infinite_map_rs"],
        capture_output=True,
        text=True,
    )
    assert result.returncode == 0, f"Build failed: {result.stderr}"


def test_glyph_to_spirv():
    """Test glyph program compiles to valid SPIR-V."""
    program = {
        "glyphs": [
            {"opcode": 206, "p1": 42.0, "p2": 0.0, "dst": 0},
            {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},
        ]
    }

    result = subprocess.run(
        ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
        input=json.dumps(program),
        capture_output=True,
        text=True,
        timeout=30.0,
    )

    assert result.returncode == 0, f"Compilation failed: {result.stderr}"

    output = json.loads(result.stdout)
    assert output["magic"] == "0x07230203", "Invalid SPIR-V magic number"
    assert output["spirv_size"] > 0, "Empty SPIR-V output"


def test_drm_device_available():
    """Test if DRM device is available for direct GPU access."""
    import os.path
    drm_path = "/dev/dri/card0"
    if os.path.exists(drm_path):
        # Check if we can open it (requires permissions)
        try:
            with open(drm_path, "rb") as f:
                assert f is not None
        except PermissionError:
            pytest.skip("Permission denied for DRM device")
    else:
        pytest.skip("No DRM device available")


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
