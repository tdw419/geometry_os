"""
Cross-layer validation for Visual Consistency Contract.

Validates that all three layers (Foundry, Shell, Kernel) are
using consistent glyph definitions.
"""

import json
import re
import subprocess
from pathlib import Path
from typing import Dict, Any, Optional, List


# Compute project root relative to this file
PROJECT_ROOT = Path(__file__).parent.parent.parent


class ValidationError(Exception):
    """Raised when VCC validation fails."""
    pass


def validate_foundry_layer(
    positions_path: str,
    expected_glyph_count: Optional[int] = None
) -> Dict[str, Any]:
    """
    Validate Foundry (Python/FreeType) layer.

    Args:
        positions_path: Path to opcode_positions.json
        expected_glyph_count: Optional expected glyph count

    Returns:
        Validation result dict with 'valid' and optional 'errors'
    """
    path = Path(positions_path)
    if not path.exists():
        raise ValidationError(f"positions file not found: {positions_path}")

    with open(path, 'r') as f:
        positions = json.load(f)

    glyphs = positions.get("glyphs", [])
    metadata = positions.get("metadata", {})

    errors = []

    # Check required metadata fields
    required_meta = ["atlas_size", "glyph_count"]
    for field in required_meta:
        if field not in metadata:
            errors.append(f"Missing metadata field: {field}")

    # Check glyph count
    if expected_glyph_count is not None:
        if len(glyphs) != expected_glyph_count:
            errors.append(
                f"Glyph count mismatch: expected {expected_glyph_count}, "
                f"got {len(glyphs)}"
            )

    # Check each glyph has required fields
    required_glyph_fields = [
        "char_code", "uv_min_x", "uv_min_y", "uv_max_x", "uv_max_y",
        "width", "height", "bearing_x", "bearing_y", "advance"
    ]

    for i, glyph in enumerate(glyphs):
        for field in required_glyph_fields:
            if field not in glyph:
                errors.append(f"Glyph {i} missing field: {field}")

    if errors:
        raise ValidationError("; ".join(errors))

    return {
        "valid": True,
        "glyph_count": len(glyphs),
        "atlas_size": metadata.get("atlas_size")
    }


def validate_shell_layer(
    contract: Dict[str, Any],
    atlas_base_dir: str,
    atlas_filename: Optional[str] = None
) -> Dict[str, Any]:
    """
    Validate Shell (TypeScript/PixiJS) layer.

    Args:
        contract: VCC contract dict
        atlas_base_dir: Base directory for atlas files
        atlas_filename: Override atlas filename from contract

    Returns:
        Validation result dict
    """
    shell_config = contract.get("layers", {}).get("shell", {})
    atlas_path = shell_config.get("atlas_path", "")

    if atlas_filename:
        atlas_path = atlas_filename

    full_path = Path(atlas_base_dir) / atlas_path

    if not full_path.exists():
        raise ValidationError(f"Shell atlas not found: {full_path}")

    # Check file is non-empty
    if full_path.stat().st_size == 0:
        raise ValidationError(f"Shell atlas is empty: {full_path}")

    # Check WebP magic bytes
    with open(full_path, 'rb') as f:
        header = f.read(4)
        if header != b"RIFF":
            raise ValidationError(f"Invalid WebP header in: {full_path}")

    return {
        "valid": True,
        "atlas_path": str(full_path),
        "atlas_size_bytes": full_path.stat().st_size
    }


def validate_kernel_layer(
    rust_file: str,
    wgsl_file: Optional[str] = None
) -> Dict[str, Any]:
    """
    Validate Kernel (Rust/WGPU) layer.

    Args:
        rust_file: Path to text_engine.rs or equivalent
        wgsl_file: Optional path to WGSL shader

    Returns:
        Validation result dict
    """
    path = Path(rust_file)
    if not path.exists():
        raise ValidationError(f"Rust file not found: {rust_file}")

    with open(path, 'r') as f:
        content = f.read()

    errors = []

    # Check for GlyphMetrics struct
    struct_match = re.search(
        r'pub\s+struct\s+GlyphMetrics\s*\{([^}]+)\}',
        content,
        re.DOTALL
    )

    if not struct_match:
        raise ValidationError("GlyphMetrics struct not found in Rust file")

    # Check required fields in struct
    required_fields = [
        "char_code", "uv_min_x", "uv_min_y", "uv_max_x", "uv_max_y",
        "width", "height", "bearing_x", "bearing_y", "advance"
    ]

    struct_body = struct_match.group(1)
    missing_fields = []

    for field in required_fields:
        if field not in struct_body:
            missing_fields.append(field)

    if missing_fields:
        raise ValidationError(
            f"GlyphMetrics missing fields: {', '.join(missing_fields)}"
        )

    # Validate WGSL if provided
    wgsl_valid = None
    if wgsl_file:
        wgsl_path = Path(wgsl_file)
        if wgsl_path.exists():
            with open(wgsl_path, 'r') as f:
                wgsl_content = f.read()
            wgsl_valid = "GlyphMetrics" in wgsl_content

    return {
        "valid": True,
        "glyph_metrics_found": True,
        "wgsl_valid": wgsl_valid
    }


def validate_kernel_layer_hardware(
    dmabuf_path: Optional[str] = None,
    expected_hash: Optional[str] = None,
    verifier_path: Optional[str] = None
) -> Dict[str, Any]:
    """
    Validate Kernel layer using hardware attestation.
    This is the authoritative validation - GPU is the source of truth.

    Args:
        dmabuf_path: Path to DMA-BUF device (e.g., /dev/dri/card0)
        expected_hash: Expected SHA-256 hash from contract
        verifier_path: Path to hardware verifier binary. If None, uses
                       PROJECT_ROOT/target/release/vcc_hardware_verify

    Returns:
        Hardware attestation result

    Raises:
        ValidationError: If hardware verification fails
        FileNotFoundError: If hardware verifier binary not found
        subprocess.SubprocessError: If subprocess execution fails
    """
    # Determine verifier path
    if verifier_path is None:
        verifier_path = str(PROJECT_ROOT / "target/release/vcc_hardware_verify")
    else:
        verifier_path = str(Path(verifier_path).expanduser().resolve())

    # Check if verifier binary exists
    if not Path(verifier_path).exists():
        raise FileNotFoundError(
            f"Hardware verifier binary not found: {verifier_path}"
        )

    # Call Rust hardware verifier
    result = subprocess.run(
        [verifier_path,
         "--dmabuf", dmabuf_path or "/dev/dri/card0",
         "--expected-hash", expected_hash or ""],
        capture_output=True,
        text=True
    )

    if result.returncode != 0:
        raise ValidationError(f"Hardware verification failed: {result.stderr}")

    hw_result = json.loads(result.stdout)

    return {
        "valid": hw_result.get("matches", False),
        "computed_hash": hw_result.get("computed_hash"),
        "expected_hash": hw_result.get("expected_hash"),
        "gpu_device": hw_result.get("gpu_device"),
        "attestation_type": "hardware"
    }


def validate_all_layers(
    contract_path: str,
    project_root: str,
    prefer_hardware: bool = True
) -> Dict[str, Any]:
    """
    Validate all layers against a VCC contract.

    Args:
        contract_path: Path to vcc_contract.json
        project_root: Project root directory
        prefer_hardware: If True, try hardware attestation for kernel first

    Returns:
        Combined validation results
    """
    from systems.vcc.contract import VCCContract

    contract = VCCContract.from_json(Path(contract_path))
    root = Path(project_root)

    results = {
        "contract_valid": True,
        "foundry": None,
        "shell": None,
        "kernel": None,
        "all_valid": False
    }

    try:
        results["foundry"] = validate_foundry_layer(
            positions_path=str(root / "systems/glyph_stratum/opcode_positions.json")
        )
    except ValidationError as e:
        results["foundry"] = {"valid": False, "error": str(e)}

    try:
        results["shell"] = validate_shell_layer(
            contract=contract.data,
            atlas_base_dir=str(root)
        )
    except ValidationError as e:
        results["shell"] = {"valid": False, "error": str(e)}

    # For kernel, try hardware first if preferred
    if prefer_hardware:
        try:
            results["kernel"] = validate_kernel_layer_hardware(
                dmabuf_path="/dev/dri/card0",
                expected_hash=contract.data.get("atlas_hash")
            )
            results["kernel"]["hardware_verified"] = True
        except (ValidationError, FileNotFoundError, subprocess.SubprocessError, json.JSONDecodeError) as e:
            # Fall back to software validation
            try:
                results["kernel"] = validate_kernel_layer(
                    rust_file=str(root / "systems/infinite_map_rs/src/text_engine.rs"),
                    wgsl_file=str(root / "systems/infinite_map_rs/src/shaders/msdf_font.wgsl")
                )
                results["kernel"]["hardware_verified"] = False
                results["kernel"]["fallback_reason"] = str(e)
            except ValidationError as e2:
                results["kernel"] = {"valid": False, "error": str(e2)}
    else:
        try:
            results["kernel"] = validate_kernel_layer(
                rust_file=str(root / "systems/infinite_map_rs/src/text_engine.rs"),
                wgsl_file=str(root / "systems/infinite_map_rs/src/shaders/msdf_font.wgsl")
            )
            results["kernel"]["hardware_verified"] = False
        except ValidationError as e:
            results["kernel"] = {"valid": False, "error": str(e)}

    # Overall status
    results["all_valid"] = all(
        r.get("valid", False) for r in [
            results["foundry"],
            results["shell"],
            results["kernel"]
        ] if r is not None
    )

    return results
