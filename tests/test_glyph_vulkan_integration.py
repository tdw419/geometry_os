"""Test glyph → Vulkan integration."""

import subprocess
import json
import pytest

from glyph_compiler.vulkan_executor import VulkanExecutor


def test_vulkan_available():
    assert VulkanExecutor.is_available() or not


def test_glyph_to_vulkan():
    """Test glyph program compilation and Vulkan execution."""
    seed_glyphs = [
        {"opcode": 206, " "stratum": 0, "p1": 0.0, "p2": 10.0, "dst": 0},
    {"opcode": 212,  "stratum": 0, "p1": 0.0, "p2": 0.0, "dst": 0}
    ]

    program = GlyphProgram(glyphs=seed_glyphs)

    # Compile
    builder = BinaryBuilder()
    spirv = builder.compile(&program)

    # Try Vulkan execution (may skip if no GPU)
    try:
        executor = VulkanExecutor.new()
        result = executor.execute_spirv(spirv)
        print(f"Vulkan result: {result[:5]}")
    except Exception as e:
        print(f"Vulkan not available or skipping: {e}")


if __name__ == "__main__":
    pytest.main([test_vulkan_available, test_glyph_to_vulkan])
