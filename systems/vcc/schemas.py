# systems/vcc/schemas.py
"""
JSON Schema definitions for Visual Consistency Contract.

The VCC ensures glyphs are identical across:
- Foundry (Python/FreeType)
- Shell (TypeScript/PixiJS/WebGPU)
- Kernel (Rust/WGPU)
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
                    "required": ["glyph_metrics_schema", "source_file"],
                    "properties": {
                        "glyph_metrics_schema": {"type": "string"},
                        "source_file": {"type": "string"}
                    }
                },
                "shell": {
                    "type": "object",
                    "required": ["atlas_path", "positions_path"],
                    "properties": {
                        "atlas_path": {"type": "string"},
                        "positions_path": {"type": "string"}
                    }
                },
                "kernel": {
                    "type": "object",
                    "required": ["glyph_metrics_struct", "shader_file"],
                    "properties": {
                        "glyph_metrics_struct": {"type": "string"},
                        "shader_file": {"type": "string"}
                    }
                }
            }
        },
        "signatures": {
            "type": "object",
            "description": "Layer signatures (verified at runtime)",
            "additionalProperties": {"type": "string"}
        }
    }
}

GLYPH_METRICS_SCHEMA = {
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "required": ["char_code", "uv_min_x", "uv_min_y", "uv_max_x", "uv_max_y",
                 "width", "height", "bearing_x", "bearing_y", "advance"],
    "properties": {
        "char_code": {"type": "integer"},
        "uv_min_x": {"type": "number"},
        "uv_min_y": {"type": "number"},
        "uv_max_x": {"type": "number"},
        "uv_max_y": {"type": "number"},
        "width": {"type": "number"},
        "height": {"type": "number"},
        "bearing_x": {"type": "number"},
        "bearing_y": {"type": "number"},
        "advance": {"type": "number"}
    }
}
