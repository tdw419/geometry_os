# tests/genome/test_genome_schema.py
import pytest
import json
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "systems" / "genome" / "spec"))

def test_genome_schema_validates():
    """Test that genome schema can be loaded and validated"""
    from genome_schema import GenomeSchema

    # Valid minimal genome
    valid_genome = {
        "version": "1.0",
        "genes": [
            {
                "id": "g1",
                "type": "function",
                "name": "add",
                "sequence": "ATCG",
                "parameters": [
                    {"name": "a", "type": "i32"},
                    {"name": "b", "type": "i32"}
                ],
                "return_type": "i32",
                "body": {
                    "type": "binary_op",
                    "operator": "+",
                    "left": {"type": "variable", "name": "a"},
                    "right": {"type": "variable", "name": "b"}
                }
            }
        ],
        "regulatory_regions": {
            "promoters": ["g1"],
            "enhancers": []
        }
    }

    schema = GenomeSchema()
    errors = schema.validate(valid_genome)
    assert len(errors) == 0, f"Validation failed: {errors}"

def test_genome_schema_rejects_invalid():
    """Test that invalid genomes are rejected"""
    from genome_schema import GenomeSchema

    invalid_genome = {
        "version": "1.0",
        "genes": [
            {
                "id": "g1",
                "type": "function",
                # Missing required fields
            }
        ]
    }

    schema = GenomeSchema()
    errors = schema.validate(invalid_genome)
    assert len(errors) > 0, "Should have validation errors"
