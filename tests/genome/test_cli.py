# tests/genome/test_cli.py
import pytest
import subprocess
import sys
from pathlib import Path
import tempfile
import json
import os

# Path to the genome CLI wrapper script
# Go up from tests/genome/ to the project root, then into systems/genome/bin/
GENOME_CLI = Path(__file__).parent.parent.parent / "systems" / "genome" / "bin" / "genome"

def test_cli_validate_command():
    """Test genome validate command"""
    result = subprocess.run(
        [str(GENOME_CLI), "validate", "--help"],
        capture_output=True,
        cwd="/home/jericho/zion/projects/geometry_os"
    )
    assert result.returncode == 0, f"validate --help failed: {result.stderr.decode()}"

def test_cli_generate_command():
    """Test genome generate command"""
    result = subprocess.run(
        [str(GENOME_CLI), "generate", "--help"],
        capture_output=True,
        cwd="/home/jericho/zion/projects/geometry_os"
    )
    assert result.returncode == 0, f"generate --help failed: {result.stderr.decode()}"

def test_cli_mutate_command():
    """Test genome mutate command"""
    result = subprocess.run(
        [str(GENOME_CLI), "mutate", "--help"],
        capture_output=True,
        cwd="/home/jericho/zion/projects/geometry_os"
    )
    assert result.returncode == 0, f"mutate --help failed: {result.stderr.decode()}"

def test_cli_crossover_command():
    """Test genome crossover command"""
    result = subprocess.run(
        [str(GENOME_CLI), "crossover", "--help"],
        capture_output=True,
        cwd="/home/jericho/zion/projects/geometry_os"
    )
    assert result.returncode == 0, f"crossover --help failed: {result.stderr.decode()}"

def test_cli_info_command():
    """Test genome info command"""
    result = subprocess.run(
        [str(GENOME_CLI), "info", "--help"],
        capture_output=True,
        cwd="/home/jericho/zion/projects/geometry_os"
    )
    assert result.returncode == 0, f"info --help failed: {result.stderr.decode()}"

def test_cli_validate_valid_genome():
    """Test validating a valid genome file"""
    # Create a temporary valid genome file
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
            "enhancers": [],
            "suppressors": []
        }
    }

    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        json.dump(valid_genome, f)
        genome_file = f.name

    try:
        result = subprocess.run(
            [str(GENOME_CLI), "validate", genome_file],
            capture_output=True,
            cwd="/home/jericho/zion/projects/geometry_os"
        )
        assert result.returncode == 0, f"validate failed: {result.stderr.decode()}"
        assert "valid" in result.stdout.decode().lower()
    finally:
        Path(genome_file).unlink()

def test_cli_info_command_with_file():
    """Test info command with a genome file"""
    # Create a temporary genome file
    genome = {
        "version": "1.0",
        "genes": [
            {
                "id": "g1",
                "type": "function",
                "name": "test_func",
                "sequence": "ATCG"
            }
        ],
        "regulatory_regions": {
            "promoters": [],
            "enhancers": [],
            "suppressors": []
        },
        "author": "Test Author",
        "description": "Test genome",
        "generation": 5
    }

    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
        json.dump(genome, f)
        genome_file = f.name

    try:
        result = subprocess.run(
            [str(GENOME_CLI), "info", genome_file],
            capture_output=True,
            cwd="/home/jericho/zion/projects/geometry_os"
        )
        assert result.returncode == 0, f"info failed: {result.stderr.decode()}"
        output = result.stdout.decode()
        assert "Test Author" in output
        assert "generation" in output.lower()
    finally:
        Path(genome_file).unlink()
