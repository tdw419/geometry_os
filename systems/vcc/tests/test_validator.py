"""Tests for VCC cross-layer validation."""

import pytest
import json
import tempfile
import numpy as np
from pathlib import Path
from systems.vcc.validator import (
    validate_foundry_layer,
    validate_shell_layer,
    validate_kernel_layer,
    validate_all_layers,
    ValidationError
)


class TestFoundryValidation:
    """Tests for Foundry (Python) layer validation."""

    def test_validate_foundry_checks_positions_file(self):
        """Should verify positions file exists and is valid JSON."""
        with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode='w') as f:
            json.dump({
                "metadata": {
                    "atlas_size": [1024, 1024],
                    "glyph_count": 0
                },
                "glyphs": []
            }, f)
            positions_path = f.name

        try:
            result = validate_foundry_layer(positions_path=positions_path)
            assert result["valid"] is True
        finally:
            Path(positions_path).unlink()

    def test_validate_foundry_fails_on_missing_file(self):
        """Should fail if positions file doesn't exist."""
        with pytest.raises(ValidationError, match="positions file not found"):
            validate_foundry_layer(positions_path="/nonexistent/path.json")


class TestShellValidation:
    """Tests for Shell (TypeScript/WebGPU) layer validation."""

    def test_validate_shell_checks_atlas_webp_exists(self):
        """Should verify WebP atlas exists."""
        # Create a minimal contract
        contract = {
            "layers": {
                "shell": {
                    "atlas_path": "test_atlas.webp"
                }
            }
        }

        with tempfile.NamedTemporaryFile(suffix=".webp", delete=False) as f:
            f.write(b"RIFF")  # Minimal WebP header
            atlas_path = f.name

        try:
            result = validate_shell_layer(
                contract=contract,
                atlas_base_dir=str(Path(atlas_path).parent),
                atlas_filename=Path(atlas_path).name
            )
            assert result["valid"] is True
        finally:
            Path(atlas_path).unlink()


class TestKernelValidation:
    """Tests for Kernel (Rust/WGPU) layer validation."""

    def test_validate_kernel_checks_glyph_metrics_struct(self):
        """Should verify GlyphMetrics struct exists in Rust."""
        rust_content = '''
pub struct GlyphMetrics {
    pub char_code: u32,
    pub uv_min_x: f32,
    pub uv_min_y: f32,
    pub uv_max_x: f32,
    pub uv_max_y: f32,
    pub width: f32,
    pub height: f32,
    pub bearing_x: f32,
    pub bearing_y: f32,
    pub advance: f32,
}
'''
        with tempfile.NamedTemporaryFile(suffix=".rs", delete=False, mode='w') as f:
            f.write(rust_content)
            rust_path = f.name

        try:
            result = validate_kernel_layer(rust_file=rust_path)
            assert result["valid"] is True
            assert result["glyph_metrics_found"] is True
        finally:
            Path(rust_path).unlink()

    def test_validate_kernel_fails_on_missing_fields(self):
        """Should fail if GlyphMetrics is missing required fields."""
        rust_content = '''
pub struct GlyphMetrics {
    pub char_code: u32,
    // Missing most fields
}
'''
        with tempfile.NamedTemporaryFile(suffix=".rs", delete=False, mode='w') as f:
            f.write(rust_content)
            rust_path = f.name

        try:
            with pytest.raises(ValidationError, match="missing.*fields"):
                validate_kernel_layer(rust_file=rust_path)
        finally:
            Path(rust_path).unlink()
