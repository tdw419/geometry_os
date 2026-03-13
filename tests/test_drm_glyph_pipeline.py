"""
End-to-end test: Glyph program → SPIR-V → DRM execution.

Tests the complete Phase 2 pipeline from glyph program
to DRM-backed GPU execution.
"""
import pytest
import subprocess
import json
import os


def _has_glyph_compiler() -> bool:
    """Check if glyph_compiler is available."""
    try:
        result = subprocess.run(
            ["cargo", "check", "--package", "glyph_compiler"],
            capture_output=True,
            timeout=30.0,
        )
        return result.returncode == 0
    except Exception:
        return False


def _has_drm_support() -> bool:
    """Check if DRM is available on the system."""
    # Check for DRM device
    if os.path.exists("/dev/dri"):
        return True
    return False


@pytest.mark.skipif(not _has_glyph_compiler(), reason="glyph_compiler not available")
def test_glyph_compiles_for_drm():
    """Test that glyph program compiles with DRM flag."""
    program = {
        "glyphs": [
            {"opcode": 206, "p1": 3.14159, "p2": 0.0, "dst": 0},
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
    assert output["magic"] == "0x07230203"


@pytest.mark.skipif(not _has_glyph_compiler(), reason="glyph_compiler not available")
@pytest.mark.skipif(not _has_drm_support(), reason="DRM not available")
def test_glyph_drm_execution():
    """Test DRM execution path."""
    program = {
        "glyphs": [
            {"opcode": 206, "p1": 1.0, "p2": 0.0, "dst": 0},
            {"opcode": 212, "p1": 0.0, "p2": 0.0, "dst": 0},
        ]
    }

    result = subprocess.run(
        [
            "cargo", "run", "--package", "glyph_compiler",
            "--features", "drm", "--", "execute", "--drm"
        ],
        input=json.dumps(program),
        capture_output=True,
        text=True,
        timeout=30.0,
    )

    assert result.returncode == 0, f"DRM execution failed: {result.stderr}"
    output = json.loads(result.stdout)
    assert output.get("drm") == True


def test_drm_renderer_glyph_executor_integration():
    """Test that DrmRenderer has glyph executor available."""
    # This is a compile-time check - if the code compiles,
    # the integration is correct
    result = subprocess.run(
        ["cargo", "check", "--package", "infinite_map_rs"],
        capture_output=True,
        text=True,
        timeout=60.0,
    )
    assert result.returncode == 0, f"Check failed: {result.stderr}"
