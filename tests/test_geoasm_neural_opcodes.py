"""Tests for GeoASM neural extension opcodes."""
import sys
from pathlib import Path

import pytest

# Add geoasm-cli directory to path (has hyphen, can't use normal import)
sys.path.insert(0, str(Path(__file__).parent.parent / "geoasm-cli"))

from geoasm_lib import OPCODES, OPCODE_NAMES, GeoASMAssembler


class TestNeuralOpcodes:
    """Test that neural opcodes are defined and parseable."""

    def test_embed_opcode_defined(self):
        """0xD0 EMBED should be defined with 2 args."""
        assert 0xD0 in OPCODES
        name, args, desc = OPCODES[0xD0]
        assert name == "EMBED"
        assert args == 2

    def test_attend_opcode_defined(self):
        """0xD1 ATTEND should be defined with 2 args."""
        assert 0xD1 in OPCODES
        name, args, desc = OPCODES[0xD1]
        assert name == "ATTEND"
        assert args == 2

    def test_project_opcode_defined(self):
        """0xD2 PROJECT should be defined with 2 args."""
        assert 0xD2 in OPCODES
        name, args, desc = OPCODES[0xD2]
        assert name == "PROJECT"
        assert args == 2

    def test_sample_opcode_defined(self):
        """0xD3 SAMPLE should be defined with 2 args."""
        assert 0xD3 in OPCODES
        name, args, desc = OPCODES[0xD3]
        assert name == "SAMPLE"
        assert args == 2

    def test_llm_prompt_opcode_exists(self):
        """0xD4 LLM_PROMPT should already exist."""
        assert 0xD4 in OPCODES
        name, args, desc = OPCODES[0xD4]
        assert name == "LLM_PROMPT"

    def test_kv_append_opcode_defined(self):
        """0xD5 KV_APPEND should be defined with 1 arg."""
        assert 0xD5 in OPCODES
        name, args, desc = OPCODES[0xD5]
        assert name == "KV_APPEND"
        assert args == 1

    def test_thought_pulse_opcode_defined(self):
        """0xD6 THOUGHT_PULSE should be defined with 1 arg."""
        assert 0xD6 in OPCODES
        name, args, desc = OPCODES[0xD6]
        assert name == "THOUGHT_PULSE"
        assert args == 1

    def test_timer_opcodes_moved(self):
        """Timer opcodes should be moved to 0xD7-0xD9."""
        # START_TIMER should now be at 0xD7
        assert 0xD7 in OPCODES
        name, args, desc = OPCODES[0xD7]
        assert name == "START_TIMER"

        # STOP_TIMER should now be at 0xD8
        assert 0xD8 in OPCODES
        name, args, desc = OPCODES[0xD8]
        assert name == "STOP_TIMER"

        # GET_TIMER should now be at 0xD9
        assert 0xD9 in OPCODES
        name, args, desc = OPCODES[0xD9]
        assert name == "GET_TIMER"

    def test_opcode_names_reverse_lookup(self):
        """OPCODE_NAMES should have reverse lookup for neural opcodes."""
        assert "EMBED" in OPCODE_NAMES
        assert OPCODE_NAMES["EMBED"] == 0xD0

        assert "ATTEND" in OPCODE_NAMES
        assert OPCODE_NAMES["ATTEND"] == 0xD1

        assert "PROJECT" in OPCODE_NAMES
        assert OPCODE_NAMES["PROJECT"] == 0xD2

        assert "SAMPLE" in OPCODE_NAMES
        assert OPCODE_NAMES["SAMPLE"] == 0xD3

        assert "KV_APPEND" in OPCODE_NAMES
        assert OPCODE_NAMES["KV_APPEND"] == 0xD5

        assert "THOUGHT_PULSE" in OPCODE_NAMES
        assert OPCODE_NAMES["THOUGHT_PULSE"] == 0xD6

    def test_neural_opcodes_parse_in_source(self):
        """Neural opcodes should parse in GeoASM source."""
        source = """
        ; Test neural opcodes
        EMBED R1, R2
        ATTEND R2, R2
        PROJECT R2, R2
        SAMPLE R2, R3
        KV_APPEND R0
        THOUGHT_PULSE R3
        HALT
        """

        assembler = GeoASMAssembler()
        program = assembler.assemble(source)

        # Should have 7 instructions (6 neural + HALT)
        assert len(program.instructions) == 7
        assert len(program.errors) == 0

        # Verify opcode values
        opcodes = [inst.opcode for inst in program.instructions]
        assert opcodes == [0xD0, 0xD1, 0xD2, 0xD3, 0xD5, 0xD6, 0x02]
