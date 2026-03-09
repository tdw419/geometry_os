"""Tests for GeoASM Instructions."""
import pytest
import numpy as np


class TestInstruction:
    """Test GeoASM instruction encoding/decoding."""

    def test_embed_instruction_create(self):
        """EMBED instruction has opcode 0xD0."""
        from systems.visual_shell.geoasm.instruction import Instruction, Opcode
        inst = Instruction(Opcode.EMBED, rd=2, rs=1)
        assert inst.opcode == Opcode.EMBED
        assert inst.opcode.value == 0xD0

    def test_instruction_from_bytes(self):
        """Can decode instruction from byte representation."""
        from systems.visual_shell.geoasm.instruction import Instruction, Opcode
        # 0xD0 01 02 00 = EMBED R1, R2
        data = bytes([0xD0, 0x01, 0x02, 0x00])
        inst = Instruction.from_bytes(data)
        assert inst.opcode == Opcode.EMBED
        assert inst.rs == 1  # Source: R1
        assert inst.rd == 2  # Dest: R2

    def test_instruction_to_bytes(self):
        """Can encode instruction to bytes."""
        from systems.visual_shell.geoasm.instruction import Instruction, Opcode
        inst = Instruction(Opcode.EMBED, rd=2, rs=1)
        data = inst.to_bytes()
        assert len(data) == 4
        assert data[0] == 0xD0

    def test_all_opcodes_defined(self):
        """All opcodes from architecture are defined."""
        from systems.visual_shell.geoasm.instruction import Opcode
        assert Opcode.EMBED.value == 0xD0
        assert Opcode.ATTEND.value == 0xD1
        assert Opcode.PROJECT.value == 0xD2
        assert Opcode.SAMPLE.value == 0xD3
        assert Opcode.LAYER.value == 0xD4
        assert Opcode.KV_APPEND.value == 0xD5
        assert Opcode.THOUGHT_PULSE.value == 0xD6

    def test_instruction_repr(self):
        """Instructions have readable string representation."""
        from systems.visual_shell.geoasm.instruction import Instruction, Opcode
        inst = Instruction(Opcode.ATTEND, rd=3, rs=2)
        assert "ATTEND" in repr(inst)
        assert "R2" in repr(inst)
        assert "R3" in repr(inst)

    def test_embed_builder(self):
        """EMBED builder creates correct instruction."""
        from systems.visual_shell.geoasm.instruction import EMBED, Opcode
        inst = EMBED(1, 2)
        assert inst.opcode == Opcode.EMBED
        assert inst.rs == 1
        assert inst.rd == 2

    def test_attend_builder(self):
        """ATTEND builder creates correct instruction."""
        from systems.visual_shell.geoasm.instruction import ATTEND, Opcode
        inst = ATTEND(2, 3)
        assert inst.opcode == Opcode.ATTEND
        assert inst.rs == 2
        assert inst.rd == 3

    def test_project_builder(self):
        """PROJECT builder creates correct instruction."""
        from systems.visual_shell.geoasm.instruction import PROJECT, Opcode
        inst = PROJECT(3, 4)
        assert inst.opcode == Opcode.PROJECT
        assert inst.rs == 3
        assert inst.rd == 4

    def test_sample_builder(self):
        """SAMPLE builder creates correct instruction."""
        from systems.visual_shell.geoasm.instruction import SAMPLE, Opcode
        inst = SAMPLE(4, 5)
        assert inst.opcode == Opcode.SAMPLE
        assert inst.rs == 4
        assert inst.rd == 5

    def test_layer_builder(self):
        """LAYER builder creates correct instruction with immediate."""
        from systems.visual_shell.geoasm.instruction import LAYER, Opcode
        inst = LAYER(3)
        assert inst.opcode == Opcode.LAYER
        assert inst.imm == 3

    def test_kv_append_builder(self):
        """KV_APPEND builder creates correct instruction."""
        from systems.visual_shell.geoasm.instruction import KV_APPEND, Opcode
        inst = KV_APPEND(6)
        assert inst.opcode == Opcode.KV_APPEND
        assert inst.rs == 6

    def test_thought_pulse_builder(self):
        """THOUGHT_PULSE builder creates correct instruction."""
        from systems.visual_shell.geoasm.instruction import THOUGHT_PULSE, Opcode
        inst = THOUGHT_PULSE(5)
        assert inst.opcode == Opcode.THOUGHT_PULSE
        assert inst.rs == 5
