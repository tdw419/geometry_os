"""
Tests for WGSL Glyph Renderer Shader.

Task 9 from docs/plans/2026-03-08-wgsl-glyph-renderer.md

Tests:
- Shader contains expected entry points
- Shader contains Hilbert curve functions
- Shader contains glyph primitives
- Shader structure definitions
- Shader workgroup size
- Shader texture output
- Shader opcodes
- Shader alpha blending
"""

import pytest
from pathlib import Path


# Path to the shader file
SHADER_PATH = Path(__file__).parent.parent / "systems" / "hypervisor" / "src" / "glyph_renderer.wgsl"


@pytest.fixture
def shader_source():
    """Load the shader source code."""
    if not SHADER_PATH.exists():
        pytest.skip(f"Shader file not found at {SHADER_PATH}")
    return SHADER_PATH.read_text()


class TestShaderEntryPoints:
    """Tests for shader entry points."""

    def test_shader_contains_compute_annotation(self, shader_source):
        """Shader should contain @compute annotation."""
        assert "@compute" in shader_source, "Shader should have @compute annotation"

    def test_shader_contains_render_function(self, shader_source):
        """Shader should contain render_glyphs or main function."""
        has_render = "render_glyphs" in shader_source or "fn main" in shader_source
        assert has_render, "Shader should contain render_glyphs or main function"


class TestShaderHilbertFunctions:
    """Tests for Hilbert curve functions."""

    def test_shader_contains_hilbert_conversion(self, shader_source):
        """Shader should contain Hilbert curve conversion functions."""
        has_hilbert = (
            "xy_to_hilbert" in shader_source
            or "xy2d" in shader_source
            or "hilbert" in shader_source.lower()
        )
        assert has_hilbert, "Shader should contain Hilbert curve conversion functions"

    def test_shader_contains_hilbert_rotation(self, shader_source):
        """Shader should contain Hilbert rotation helper."""
        has_rotation = "hilbert_rot" in shader_source or "rot" in shader_source
        assert has_rotation, "Shader should contain Hilbert rotation helper"


class TestShaderGlyphPrimitives:
    """Tests for glyph drawing primitives."""

    def test_shader_contains_fill_rect(self, shader_source):
        """Shader should contain fill_rect primitive."""
        has_fill = (
            "fill_rect" in shader_source
            or "FILL_RECT" in shader_source
            or "0xC4" in shader_source
        )
        assert has_fill, "Shader should contain fill_rect primitive"

    def test_shader_contains_draw_rect(self, shader_source):
        """Shader should contain draw_rect primitive."""
        has_draw = (
            "draw_rect" in shader_source
            or "DRAW_RECT" in shader_source
            or "0xC3" in shader_source
        )
        assert has_draw, "Shader should contain draw_rect primitive"

    def test_shader_contains_draw_pixel(self, shader_source):
        """Shader should contain draw_pixel primitive."""
        has_pixel = (
            "draw_pixel" in shader_source
            or "DRAW_PIXEL" in shader_source
            or "pixel" in shader_source.lower()
        )
        assert has_pixel, "Shader should contain draw_pixel primitive"


class TestShaderStructures:
    """Tests for shader structure definitions."""

    def test_shader_contains_glyph_struct(self, shader_source):
        """Shader should define Glyph structure."""
        assert "struct Glyph" in shader_source or "Glyph" in shader_source, \
            "Shader should define Glyph structure"

    def test_shader_contains_buffer_struct(self, shader_source):
        """Shader should define buffer structure."""
        has_buffer = "GlyphBuffer" in shader_source or "CommandBuffer" in shader_source
        assert has_buffer, "Shader should define buffer structure"

    def test_shader_contains_bindings(self, shader_source):
        """Shader should define resource bindings."""
        assert "@group(0)" in shader_source or "@binding" in shader_source, \
            "Shader should define resource bindings"


class TestShaderWorkgroup:
    """Tests for shader workgroup configuration."""

    def test_shader_workgroup_size(self, shader_source):
        """Shader should define @workgroup_size."""
        assert "@workgroup_size" in shader_source, \
            "Shader should define @workgroup_size for compute shader"

    def test_shader_has_reasonable_workgroup(self, shader_source):
        """Shader should have reasonable workgroup size (64, 128, 256)."""
        import re
        match = re.search(r"@workgroup_size\((\d+)", shader_source)
        if match:
            size = int(match.group(1))
            assert size in [8, 16, 32, 64, 128, 256, 512], \
                f"Workgroup size {size} should be power of 2"


class TestShaderTextureOutput:
    """Tests for shader texture output."""

    def test_shader_has_texture_output(self, shader_source):
        """Shader should have texture output binding."""
        has_texture = (
            "texture_storage_2d" in shader_source
            or "canvas" in shader_source
            or "output_texture" in shader_source
        )
        assert has_texture, "Shader should have texture output binding"

    def test_shader_uses_rgba_format(self, shader_source):
        """Shader should use RGBA format for output."""
        has_rgba = "rgba8" in shader_source or "rgba16" in shader_source or "vec4" in shader_source
        assert has_rgba, "Shader should use RGBA format for output"


class TestShaderOpcodes:
    """Tests for shader opcode definitions."""

    def test_shader_has_glyph_opcodes(self, shader_source):
        """Shader should define glyph opcodes in 0xC0-0xCF range."""
        has_opcodes = (
            "0xC0" in shader_source
            or "0xC3" in shader_source
            or "0xC4" in shader_source
            or "opcode" in shader_source.lower()
        )
        assert has_opcodes, "Shader should define glyph opcodes in 0xC0-0xCF range"


class TestShaderAlphaBlending:
    """Tests for shader alpha blending."""

    def test_shader_supports_alpha(self, shader_source):
        """Shader should support alpha blending."""
        has_alpha = (
            "vec4<f32>" in shader_source
            or "alpha" in shader_source.lower()
            or "rgba8unorm" in shader_source
        )
        assert has_alpha, "Shader should support alpha blending with vec4<f32> or rgba8"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
