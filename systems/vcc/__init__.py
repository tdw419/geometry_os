"""
Visual Consistency Contract (VCC) Module

The VCC ensures glyphs are semantically and visually identical across:
- Foundry (Python/FreeType) - where raw glyphs are forged
- Shell (TypeScript/PixiJS/WebGPU) - where they are interacted with
- Kernel (Rust/WGPU) - where they are executed as spatial instructions
"""

from .schemas import VCC_CONTRACT_SCHEMA, GLYPH_METRICS_SCHEMA

__all__ = ["VCC_CONTRACT_SCHEMA", "GLYPH_METRICS_SCHEMA"]
