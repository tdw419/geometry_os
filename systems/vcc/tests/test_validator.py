"""Tests for VCC cross-layer validation."""

import pytest
import json
import tempfile
import subprocess
from unittest.mock import patch, MagicMock
from pathlib import Path
from systems.vcc.validator import (
    validate_foundry_layer,
    validate_shell_layer,
    validate_kernel_layer,
    validate_kernel_layer_hardware,
    validate_all_layers,
    ValidationError,
    PROJECT_ROOT
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


class TestKernelHardwareValidation:
    """Tests for Kernel hardware attestation validation."""

    def test_validate_kernel_hardware_success(self):
        """Should successfully validate with hardware attestation."""
        mock_result = MagicMock()
        mock_result.returncode = 0
        mock_result.stdout = json.dumps({
            "matches": True,
            "computed_hash": "abc123",
            "expected_hash": "abc123",
            "gpu_device": "/dev/dri/card0"
        })
        mock_result.stderr = ""

        with patch('subprocess.run', return_value=mock_result) as mock_run:
            with patch.object(Path, 'exists', return_value=True):
                result = validate_kernel_layer_hardware(
                    dmabuf_path="/dev/dri/card0",
                    expected_hash="abc123",
                    verifier_path="/fake/verifier"
                )

        assert result["valid"] is True
        assert result["computed_hash"] == "abc123"
        assert result["attestation_type"] == "hardware"

        # Verify subprocess was called with correct args
        mock_run.assert_called_once()
        call_args = mock_run.call_args[0][0]
        assert "/fake/verifier" in call_args
        assert "--dmabuf" in call_args
        assert "/dev/dri/card0" in call_args

    def test_validate_kernel_hardware_fails_on_nonzero_exit(self):
        """Should raise ValidationError on subprocess failure."""
        mock_result = MagicMock()
        mock_result.returncode = 1
        mock_result.stdout = ""
        mock_result.stderr = "GPU not found"

        with patch('subprocess.run', return_value=mock_result):
            with patch.object(Path, 'exists', return_value=True):
                with pytest.raises(ValidationError, match="Hardware verification failed"):
                    validate_kernel_layer_hardware(
                        verifier_path="/fake/verifier"
                    )

    def test_validate_kernel_hardware_raises_file_not_found(self):
        """Should raise FileNotFoundError if verifier binary doesn't exist."""
        with pytest.raises(FileNotFoundError, match="Hardware verifier binary not found"):
            validate_kernel_layer_hardware(
                verifier_path="/nonexistent/verifier"
            )

    def test_validate_kernel_hardware_uses_project_root_default(self):
        """Should use PROJECT_ROOT-based default path when verifier_path is None."""
        mock_result = MagicMock()
        mock_result.returncode = 0
        mock_result.stdout = json.dumps({"matches": True})
        mock_result.stderr = ""

        expected_default = str(PROJECT_ROOT / "target/release/vcc_hardware_verify")

        with patch('subprocess.run', return_value=mock_result) as mock_run:
            with patch.object(Path, 'exists', return_value=True) as mock_exists:
                validate_kernel_layer_hardware()

        # Verify default path was used
        mock_exists.assert_called()
        call_args = mock_run.call_args[0][0]
        assert expected_default in call_args

    def test_validate_kernel_hardware_passes_expected_hash(self):
        """Should pass expected hash to verifier."""
        mock_result = MagicMock()
        mock_result.returncode = 0
        mock_result.stdout = json.dumps({"matches": True})
        mock_result.stderr = ""

        with patch('subprocess.run', return_value=mock_result) as mock_run:
            with patch.object(Path, 'exists', return_value=True):
                validate_kernel_layer_hardware(
                    expected_hash="deadbeef",
                    verifier_path="/fake/verifier"
                )

        call_args = mock_run.call_args[0][0]
        assert "--expected-hash" in call_args
        assert "deadbeef" in call_args


class TestValidateAllLayersFallback:
    """Tests for validate_all_layers fallback logic."""

    def _create_valid_contract(self) -> dict:
        """Helper to create a valid VCC contract."""
        return {
            "version": 1,
            "generated_at": "2026-03-13T12:00:00Z",
            "atlas_hash": {
                "sha256": "a" * 64,  # 64 hex chars
                "size_bytes": 1024,
                "dimensions": [1024, 1024]
            },
            "glyph_count": 0,
            "layers": {
                "foundry": {
                    "glyph_metrics_schema": "systems/vcc/schemas.py#GLYPH_METRICS_SCHEMA",
                    "source_file": "systems/glyph_stratum/generate_font_atlas.py"
                },
                "shell": {
                    "atlas_path": "test.webp",
                    "positions_path": "systems/glyph_stratum/opcode_positions.json"
                },
                "kernel": {
                    "glyph_metrics_struct": "GlyphMetrics",
                    "shader_file": "systems/infinite_map_rs/src/shaders/msdf_font.wgsl"
                }
            }
        }

    def _create_test_files(self, tmpdir: Path):
        """Helper to create all required test files."""
        # Create positions file
        positions_dir = tmpdir / "systems/glyph_stratum"
        positions_dir.mkdir(parents=True)
        positions_path = positions_dir / "opcode_positions.json"
        with open(positions_path, 'w') as f:
            json.dump({
                "metadata": {"atlas_size": [1024, 1024], "glyph_count": 0},
                "glyphs": []
            }, f)

        # Create atlas
        atlas_path = tmpdir / "test.webp"
        with open(atlas_path, 'wb') as f:
            f.write(b"RIFF")

        # Create valid Rust file
        rust_dir = tmpdir / "systems/infinite_map_rs/src"
        rust_dir.mkdir(parents=True)
        rust_path = rust_dir / "text_engine.rs"
        with open(rust_path, 'w') as f:
            f.write('''
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
''')

        # Create WGSL shader file
        shader_dir = tmpdir / "systems/infinite_map_rs/src/shaders"
        shader_dir.mkdir(parents=True)
        shader_path = shader_dir / "msdf_font.wgsl"
        with open(shader_path, 'w') as f:
            f.write("// GlyphMetrics struct")

    def test_fallback_to_software_on_hardware_failure(self):
        """Should fall back to software validation when hardware fails."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tmpdir = Path(tmpdir)

            # Create contract
            contract_path = tmpdir / "vcc_contract.json"
            with open(contract_path, 'w') as f:
                json.dump(self._create_valid_contract(), f)

            self._create_test_files(tmpdir)

            # Mock hardware validation to fail
            with patch('systems.vcc.validator.validate_kernel_layer_hardware') as mock_hw:
                mock_hw.side_effect = FileNotFoundError("Binary not found")

                result = validate_all_layers(
                    contract_path=str(contract_path),
                    project_root=str(tmpdir),
                    prefer_hardware=True
                )

            # Should have fallen back to software validation
            assert result["kernel"]["valid"] is True
            assert result["kernel"]["hardware_verified"] is False
            assert "fallback_reason" in result["kernel"]

    def test_prefer_hardware_false_skips_hardware_validation(self):
        """Should skip hardware validation when prefer_hardware=False."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tmpdir = Path(tmpdir)

            contract_path = tmpdir / "vcc_contract.json"
            with open(contract_path, 'w') as f:
                json.dump(self._create_valid_contract(), f)

            self._create_test_files(tmpdir)

            with patch('systems.vcc.validator.validate_kernel_layer_hardware') as mock_hw:
                result = validate_all_layers(
                    contract_path=str(contract_path),
                    project_root=str(tmpdir),
                    prefer_hardware=False
                )

                # Hardware validation should not have been called
                mock_hw.assert_not_called()

            assert result["kernel"]["valid"] is True
            assert result["kernel"]["hardware_verified"] is False

    def test_hardware_validation_success_sets_flag(self):
        """Should set hardware_verified=True when hardware validation succeeds."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tmpdir = Path(tmpdir)

            contract_path = tmpdir / "vcc_contract.json"
            with open(contract_path, 'w') as f:
                json.dump(self._create_valid_contract(), f)

            self._create_test_files(tmpdir)

            with patch('systems.vcc.validator.validate_kernel_layer_hardware') as mock_hw:
                mock_hw.return_value = {
                    "valid": True,
                    "computed_hash": "abc",
                    "attestation_type": "hardware"
                }

                result = validate_all_layers(
                    contract_path=str(contract_path),
                    project_root=str(tmpdir),
                    prefer_hardware=True
                )

            assert result["kernel"]["valid"] is True
            assert result["kernel"]["hardware_verified"] is True

