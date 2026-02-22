# tests/genome/test_rust_generator.py
import pytest
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent.resolve() / "systems" / "genome" / "src"))
sys.path.insert(0, str(Path(__file__).parent.parent.parent.resolve() / "systems" / "genome" / "spec"))

def test_generate_simple_function():
    """Test generating a simple Rust function"""
    from rust_generator import RustCodeGenerator
    from genome_schema import Gene, GeneType, Parameter

    gene = Gene(
        id="g1",
        type=GeneType.FUNCTION,
        name="add",
        sequence="ATCG",
        parameters=[
            Parameter(name="a", type="i32"),
            Parameter(name="b", type="i32")
        ],
        return_type="i32",
        body={
            "type": "binary_op",
            "operator": "+",
            "left": {"type": "variable", "name": "a"},
            "right": {"type": "variable", "name": "b"}
        }
    )

    generator = RustCodeGenerator()
    code = generator.generate_function(gene)

    assert "fn add" in code
    assert "a: i32" in code
    assert "b: i32" in code
    assert "-> i32" in code
    assert "a + b" in code

def test_generate_struct():
    """Test generating a Rust struct"""
    from rust_generator import RustCodeGenerator
    from genome_schema import Gene, GeneType

    gene = Gene(
        id="g2",
        type=GeneType.STRUCT,
        name="Point",
        sequence="GCTA",
        fields=[
            {"name": "x", "type": "f64"},
            {"name": "y", "type": "f64"}
        ]
    )

    generator = RustCodeGenerator()
    code = generator.generate_struct(gene)

    assert "struct Point" in code
    assert "x: f64" in code
    assert "y: f64" in code
