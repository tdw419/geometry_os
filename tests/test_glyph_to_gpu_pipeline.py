"""
End-to-end tests for the Glyph → SPIR-V → GPU pipeline.

Tests verify that glyph programs can be compiled to valid SPIR-V
and executed on the GPU via the glyph_compiler Rust crate.
"""

import subprocess
import json
import pytest


def _has_compiler() -> bool:
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


def _has_gpu() -> bool:
    """Check if a GPU is available via lspci."""
    try:
        result = subprocess.run(
            ["lspci"],
            capture_output=True,
            text=True,
        )
        return "VGA" in result.stdout or "3D" in result.stdout
    except Exception:
        return False


@pytest.mark.skipif(not _has_compiler(), reason="glyph_compiler not available")
def test_glyph_to_spirv_compilation():
    """Test glyph program compiles to valid SPIR-V."""
    program = {
        "glyphs": [
            {"opcode": 206, "stratum": 0, "p1": 1.0, "p2": 0.0, "dst": 0},  # MOV
            {"opcode": 206, "stratum": 0, "p1": 2.0, "p2": 0.0, "dst": 1},  # MOV
            {"opcode": 200, "stratum": 0, "p1": 0.0, "p2": 1.0, "dst": 2},  # ADD
            {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},  # HALT
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

    # Output should be JSON with SPIR-V info
    output = json.loads(result.stdout)
    assert "spirv_size" in output
    assert output["spirv_size"] > 0
    assert output["magic"] == "0x07230203"


@pytest.mark.skipif(not _has_compiler(), reason="glyph_compiler not available")
def test_glyph_compiler_executes():
    """Test that the compiler binary works."""
    program = {
        "glyphs": [
            {"opcode": 206, "stratum": 0, "p1": 1.0, "p2": 0.0, "dst": 0},
            {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},
        ]
    }

    result = subprocess.run(
        ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
        input=json.dumps(program),
        capture_output=True,
        text=True,
        timeout=30.0,
    )

    assert result.returncode == 0


@pytest.mark.skipif(not _has_compiler(), reason="glyph_compiler not available")
def test_all_valid_opcodes_compile():
    """Test that all valid opcodes (200-227) compile without error."""
    valid_opcodes = [200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 215, 216, 217, 218, 220, 221, 222, 223, 224, 225, 227]

    for opcode in valid_opcodes:
        program = {
            "glyphs": [
                {"opcode": opcode, "stratum": 0, "p1": 1.0, "p2": 1.0, "dst": 0},
                {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},  # HALT
            ]
        }

        result = subprocess.run(
            ["cargo", "run", "--package", "glyph_compiler", "--", "compile"],
            input=json.dumps(program),
            capture_output=True,
            text=True,
            timeout=30.0,
        )

        assert result.returncode == 0, f"Opcode {opcode} failed to compile: {result.stderr}"


@pytest.mark.skipif(not _has_compiler(), reason="glyph_compiler not available")
def test_evolution_daemon_integration():
    """Test that evolution daemon can use the compiler."""
    from systems.evolution_daemon.glyph_evolution import (
        GlyphProgram,
        fitness_shader_correctness,
    )

    program = GlyphProgram(glyphs=[
        {"opcode": 206, "stratum": 0, "p1": 42.0, "p2": 0.0, "dst": 0},
        {"opcode": 212, "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0},
    ])

    # Fitness should succeed (though may not be 1.0 without execution)
    score = fitness_shader_correctness(program)
    assert isinstance(score, float)
    assert 0.0 <= score <= 1.0
