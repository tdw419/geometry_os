# systems/vcc/contract.py
"""
Visual Consistency Contract (VCC) generation and serialization.

The VCC is a signed document that captures the state of the font
atlas at generation time. All layers validate against this contract.
"""

import json
import hashlib
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, Any, Optional, Tuple

from systems.vcc.schemas import VCC_CONTRACT_SCHEMA
from systems.vcc.visual_hash import compute_atlas_sha256


class VCCContract:
    """Represents a Visual Consistency Contract."""

    def __init__(self, data: Dict[str, Any] = None, version: int = 1):
        if data is not None:
            self.data = data
            self._validate()
        else:
            # Legacy constructor path
            self.data = None
            self.version = version
            self.generated_at = datetime.now(timezone.utc).isoformat().replace('+00:00', 'Z')
            self.atlas_hash = None
            self.glyph_count = 0
            self.opcode_mappings = {}
            self.layers = {}
            self.signatures = {}

    def _validate(self) -> None:
        """Validate contract against schema."""
        import jsonschema
        jsonschema.validate(self.data, VCC_CONTRACT_SCHEMA)

    @property
    def version(self) -> int:
        if self.data is not None:
            return self.data["version"]
        return self._version

    @version.setter
    def version(self, value: int):
        self._version = value

    @property
    def atlas_hash(self) -> str:
        """Get the SHA-256 hash from the atlas_hash field."""
        if self.data is not None:
            return self.data["atlas_hash"]["sha256"]
        if isinstance(self._atlas_hash, dict):
            return self._atlas_hash.get("sha256", "")
        return ""

    @atlas_hash.setter
    def atlas_hash(self, value):
        self._atlas_hash = value

    @property
    def glyph_count(self) -> int:
        """Get the glyph count."""
        if self.data is not None:
            return self.data["glyph_count"]
        return self._glyph_count

    @glyph_count.setter
    def glyph_count(self, value: int):
        self._glyph_count = value

    def to_json(self, path: Path) -> None:
        """Write contract to JSON file."""
        path = Path(path)
        path.parent.mkdir(parents=True, exist_ok=True)
        if self.data is not None:
            with open(path, 'w') as f:
                json.dump(self.data, f, indent=2)
        else:
            # Legacy path
            self.save(str(path))

    @classmethod
    def from_json(cls, path: Path) -> "VCCContract":
        """Load contract from JSON file."""
        with open(path, 'r') as f:
            data = json.load(f)
        return cls(data=data)

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
            "atlas_hash": self._atlas_hash,
            "glyph_count": self._glyph_count,
            "opcode_mappings": self.opcode_mappings,
            "layers": self.layers,
            "signatures": self.signatures
        }

        with open(output_path, 'w') as f:
            json.dump(contract_data, f, indent=2)
        print(f"VCC Contract saved to: {output_path}")

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


def generate_contract(
    atlas_path: str,
    positions_path: str,
    opcode_mappings: Optional[Dict[str, int]] = None
) -> Dict[str, Any]:
    """
    Generate a VCC contract from atlas and positions files.

    Args:
        atlas_path: Path to the .raw atlas file
        positions_path: Path to the opcode_positions.json file
        opcode_mappings: Optional opcode name -> ID mapping

    Returns:
        Contract dictionary ready for serialization
    """
    if atlas_path is None:
        raise ValueError("atlas_path is required")

    atlas_path = Path(atlas_path)
    positions_path = Path(positions_path)

    # Read atlas file
    with open(atlas_path, 'rb') as f:
        atlas_bytes = f.read()

    # Compute SHA-256
    sha256 = hashlib.sha256(atlas_bytes).hexdigest()

    # Read positions file for metadata
    with open(positions_path, 'r') as f:
        positions = json.load(f)

    metadata = positions.get("metadata", {})
    atlas_size = metadata.get("atlas_size", [0, 0])
    glyphs = positions.get("glyphs", [])

    # Build contract
    contract = {
        "version": 1,
        "generated_at": datetime.now(timezone.utc).isoformat().replace('+00:00', 'Z'),
        "atlas_hash": {
            "sha256": sha256,
            "size_bytes": len(atlas_bytes),
            "dimensions": atlas_size
        },
        "glyph_count": len(glyphs),
        "opcode_mappings": opcode_mappings or {},
        "layers": {
            "foundry": {
                "glyph_metrics_schema": "systems.vcc.schemas.GLYPH_METRICS_SCHEMA",
                "source_file": "systems/fonts/font_renderer.py"
            },
            "shell": {
                "atlas_path": "systems/glyph_stratum/opcode_atlas.webp",
                "positions_path": "systems/glyph_stratum/opcode_positions.json"
            },
            "kernel": {
                "glyph_metrics_struct": "text_engine.rs::GlyphMetrics",
                "shader_file": "systems/infinite_map_rs/src/shaders/msdf_font.wgsl"
            }
        },
        "signatures": {}
    }

    return contract
