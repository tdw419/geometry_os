# tests/unit/test_vasm.py
import pytest
from systems.pixel_compiler.vasm import VisualAssembler

def test_parse_load_instruction():
    assembler = VisualAssembler()
    result = assembler.parse_line("LOAD R0, 42")
    assert result.opcode == 0x01
    assert result.dest == 0
    assert result.immediate == 42

def test_parse_add_instruction():
    assembler = VisualAssembler()
    result = assembler.parse_line("ADD R0, R1")
    assert result.opcode == 0x10
    assert result.dest == 0
    assert result.src == 1

def test_parse_label_definition():
    assembler = VisualAssembler()
    assembler.parse_line("main:")
    assert "main" in assembler.labels
    assert assembler.labels["main"] == 0

def test_parse_forward_jump():
    assembler = VisualAssembler()
    assembler.parse_line("LOAD R0, 0")
    assembler.parse_line("JZ R0, end")
    assembler.parse_line("LOAD R0, 1")
    assembler.parse_line("end:")
    assembler.parse_line("RET R0")
    # Resolve labels
    assembler.resolve_labels()
    # Should resolve forward reference - 'end' label is at pc=3 (before RET)
    assert assembler.instructions[1].immediate == 3
