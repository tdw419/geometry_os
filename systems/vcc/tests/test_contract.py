# systems/vcc/tests/test_contract.py
"""Tests for VCC contract generation and verification."""

import pytest
import json
import tempfile
import numpy as np
from datetime import datetime
from pathlib import Path
from systems.vcc.contract import VCCContract, generate_contract


class TestVCCContract:
    """Tests for VCC contract data structure."""

    def test_contract_creation_requires_atlas_path(self):
        """Contract should require atlas path."""
        with pytest.raises(ValueError, match="atlas_path"):
            generate_contract(atlas_path=None, positions_path="test.json")

    def test_contract_creation_requires_positions_path(self):
        """Contract should require positions path."""
        with pytest.raises(ValueError, match="positions_path"):
            generate_contract(atlas_path="test.raw", positions_path=None)

    def test_contract_includes_atlas_hash(self):
        """Contract should include SHA-256 hash of atlas."""
        with tempfile.NamedTemporaryFile(suffix=".raw", delete=False) as atlas:
            # Write 4x4 RGBA test data
            test_data = np.zeros((4, 4, 4), dtype=np.uint8)
            test_data[1, 1] = [255, 255, 255, 255]
            atlas.write(test_data.tobytes())
            atlas_path = atlas.name

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode='w') as pos:
            json.dump({
                "metadata": {"atlas_size": [4, 4]},
                "glyphs": [{"char_code": 0}]
            }, pos)
            positions_path = pos.name

        try:
            contract = generate_contract(
                atlas_path=atlas_path,
                positions_path=positions_path
            )

            assert "atlas_hash" in contract
            assert "sha256" in contract["atlas_hash"]
            assert len(contract["atlas_hash"]["sha256"]) == 64
        finally:
            Path(atlas_path).unlink()
            Path(positions_path).unlink()

    def test_contract_validates_against_schema(self):
        """Generated contract should validate against VCC schema."""
        from systems.vcc.schemas import VCC_CONTRACT_SCHEMA
        import jsonschema

        with tempfile.NamedTemporaryFile(suffix=".raw", delete=False) as atlas:
            test_data = np.zeros((4, 4, 4), dtype=np.uint8)
            atlas.write(test_data.tobytes())
            atlas_path = atlas.name

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode='w') as pos:
            json.dump({
                "metadata": {"atlas_size": [4, 4]},
                "glyphs": []
            }, pos)
            positions_path = pos.name

        try:
            contract = generate_contract(
                atlas_path=atlas_path,
                positions_path=positions_path
            )

            # Should not raise
            jsonschema.validate(contract, VCC_CONTRACT_SCHEMA)
        finally:
            Path(atlas_path).unlink()
            Path(positions_path).unlink()


class TestContractSigning:
    """Tests for contract signing and verification."""

    def test_contract_includes_generation_timestamp(self):
        """Contract should include ISO 8601 timestamp."""
        with tempfile.NamedTemporaryFile(suffix=".raw", delete=False) as atlas:
            np.zeros((4, 4, 4), dtype=np.uint8).tofile(atlas)
            atlas_path = atlas.name

        with tempfile.NamedTemporaryFile(suffix=".json", delete=False, mode='w') as pos:
            json.dump({"metadata": {"atlas_size": [4, 4]}, "glyphs": []}, pos)
            positions_path = pos.name

        try:
            contract = generate_contract(atlas_path, positions_path)

            assert "generated_at" in contract
            # Should parse as ISO 8601
            datetime.fromisoformat(contract["generated_at"].replace('Z', '+00:00'))
        finally:
            Path(atlas_path).unlink()
            Path(positions_path).unlink()
