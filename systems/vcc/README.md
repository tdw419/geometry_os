# Visual Consistency Contract (VCC)

Ensures glyph rendering is semantically and visually identical across all Geometry OS layers.

## Purpose

When a glyph is rendered in:
- **Foundry** (Python/FreeType)
- **Shell** (TypeScript/PixiJS/WebGPU)
- **Kernel** (Rust/WGPU)

...it must be pixel-identical and semantically equivalent.

## Components

| File | Purpose |
|------|---------|
| `contract.py` | Contract generation and serialization |
| `validator.py` | Cross-layer validation logic |
| `schemas.py` | JSON schema definitions |
| `visual_hash.py` | Atlas hash computation |
| `cli.py` | Command-line interface |

## Usage

```bash
# Validate all layers
python3 -m systems.vcc.cli validate

# Generate new contract
python3 -m systems.vcc.cli generate --atlas=atlas.raw --positions=positions.json

# Check status
python3 -m systems.vcc.cli status
```

## Contract Schema

See `schemas.py` for full JSON schema. Key fields:

- `version`: Schema version (currently 1)
- `atlas_hash`: SHA-256 of atlas bytes
- `glyph_count`: Number of glyphs
- `layers`: Layer-specific configuration
- `signatures`: Runtime verification hashes

## Adding a New Layer

1. Create validator in `systems/vcc/validator.py`
2. Add layer config to contract schema in `schemas.py`
3. Update `validate_all_layers()` to include new layer
