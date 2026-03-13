# systems/vcc/schemas.py
"""
JSON Schema definitions for Visual Consistency Contract.

The VCC ensures glyphs are identical across:
- Foundry (Python/FreeType)
- Shell (TypeScript/PixiJS/WebGPU)
- Kernel (Rust/WGPU/DRM)
"""

VCC_CONTRACT_SCHEMA = {
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "required": ["version", "generated_at", "atlas_hash", "glyph_count", "layers"],
    "properties": {
        "version": {
            "type": "integer",
            "description": "VCC schema version",
            "const": 1
        },
        "generated_at": {
            "type": "string",
            "format": "date-time",
            "description": "ISO 8601 timestamp of contract generation"
        },
        "atlas_hash": {
            "type": "object",
            "required": ["sha256", "size_bytes", "dimensions"],
            "properties": {
                "sha256": {"type": "string", "pattern": "^[a-f0-9]{64}$"},
                "size_bytes": {"type": "integer", "minimum": 0},
                "dimensions": {
                    "type": "array",
                    "items": {"type": "integer"},
                    "minItems": 2,
                    "maxItems": 2
                }
            }
        },
        "glyph_count": {
            "type": "integer",
            "minimum": 0,
            "description": "Number of glyphs in atlas"
        },
        "opcode_mappings": {
            "type": "object",
            "description": "Opcode name to ID mapping",
            "additionalProperties": {"type": "integer"}
        },
        "layers": {
            "type": "object",
            "required": ["foundry", "shell", "kernel"],
            "properties": {
                "foundry": {
                    "type": "object",
                    "required": ["renderer_path", "metrics_hash"]
                },
                "shell": {
                    "type": "object",
                    "required": ["pixi_version", "webgpu_enabled"]
                },
                "kernel": {
                    "type": "object",
                    "required": ["rust_version", "wgpu_backend", "drm_enabled"]
                }
            }
        },
        "signatures": {
            "type": "object",
            "description": "Cryptographic signatures for hardware attestation",
            "properties": {
                "hardware_vcc_sig": {"type": "string"},
                "scanout_attestation_sig": {"type": "string"}
            }
        }
    }
}

GLYPH_METRICS_SCHEMA = {
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "additionalProperties": {
        "type": "object",
        "required": ["uv", "width", "height", "advance"],
        "properties": {
            "uv": {
                "type": "array",
                "items": {"type": "number"},
                "minItems": 2,
                "maxItems": 2
            },
            "width": {"type": "integer"},
            "height": {"type": "integer"},
            "advance": {"type": "integer"}
        }
    }
}
