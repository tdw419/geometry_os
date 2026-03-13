# systems/vcc/contract.py
"""
Visual Consistency Contract (VCC) generation and serialization.
The "Golden Contract" that all layers must agree on.
"""

import json
import os
from datetime import datetime
from typing import Dict, Any, List, Tuple
from pathlib import Path
from .schemas import VCC_CONTRACT_SCHEMA
from .visual_hash import compute_atlas_sha256

class VCCContract:
    """Represents a Visual Consistency Contract."""

    def __init__(self, version: int = 1):
        self.version = version
        self.generated_at = datetime.utcnow().isoformat() + "Z"
        self.atlas_hash = None
        self.glyph_count = 0
        self.opcode_mappings = {}
        self.layers = {}
        self.signatures = {}

    def generate_from_atlas(
        self,
        atlas_path: str,
        positions_json_path: str,
        dimensions: Tuple[int, int]
    ) -> 'VCCContract':
        """Generate a contract from a built atlas and its position metadata."""
        # 1. Compute hash of atlas bytes
        with open(atlas_path, 'rb') as f:
            atlas_bytes = f.read()
        
        sha256 = compute_atlas_sha256(atlas_bytes)
        self.atlas_hash = {
            "sha256": sha256,
            "size_bytes": len(atlas_bytes),
            "dimensions": list(dimensions)
        }

        # 2. Extract opcode mappings and glyph count
        with open(positions_json_path, 'r') as f:
            positions_data = json.load(f)
            
        # The positions JSON typically has "metadata" or just the glyphs
        if "metadata" in positions_data:
            self.glyph_count = len(positions_data["metadata"])
            self.opcode_mappings = {name: i for i, name in enumerate(positions_data["metadata"].keys())}
        else:
            self.glyph_count = len(positions_data)
            self.opcode_mappings = {name: i for i, name in enumerate(positions_data.keys())}

        # 3. Add default layer config
        self.layers = {
            "foundry": {
                "renderer_path": "systems/fonts/font_renderer.py",
                "metrics_hash": self._compute_metrics_hash(positions_json_path)
            },
            "shell": {
                "pixi_version": "v8",
                "webgpu_enabled": True
            },
            "kernel": {
                "rust_version": "1.75+",
                "wgpu_backend": "vulkan",
                "drm_enabled": True
            }
        }

        return self

    def _compute_metrics_hash(self, path: str) -> str:
        """Compute SHA-256 of the metrics JSON to ensure semantic consistency."""
        with open(path, 'rb') as f:
            return compute_atlas_sha256(f.read())

    def save(self, output_path: str):
        """Save the contract as a JSON file."""
        contract_data = {
            "version": self.version,
            "generated_at": self.generated_at,
            "atlas_hash": self.atlas_hash,
            "glyph_count": self.glyph_count,
            "opcode_mappings": self.opcode_mappings,
            "layers": self.layers,
            "signatures": self.signatures
        }
        
        with open(output_path, 'w') as f:
            json.dump(contract_data, f, indent=2)
        print(f"✅ VCC Contract saved to: {output_path}")

    @classmethod
    def load(cls, path: str) -> 'VCCContract':
        """Load a contract from a JSON file."""
        with open(path, 'r') as f:
            data = json.load(f)
        
        contract = cls(version=data["version"])
        contract.generated_at = data["generated_at"]
        contract.atlas_hash = data["atlas_hash"]
        contract.glyph_count = data["glyph_count"]
        contract.opcode_mappings = data["opcode_mappings"]
        contract.layers = data["layers"]
        contract.signatures = data.get("signatures", {})
        
        return contract
