"""Tests for GeoASM Assembler."""
import pytest


class TestAssembler:
    """Test assembly from text to binary."""

    @pytest.fixture
    def assembler(self):
        """Create Assembler instance."""
        from systems.visual_shell.geoasm.assembler import Assembler
        return Assembler()

    def test_assemble_single_embed(self, assembler):
        """Assemble single EMBED instruction."""
        program = assembler.assemble("EMBED R1, R2")
        assert len(program) == 1
        assert program[0].opcode.name == "EMBED"

    def test_assemble_multiline(self, assembler):
        """Assemble multi-line program."""
        source = """
        EMBED R1, R2
        ATTEND R2, R3
        PROJECT R3, R4
        SAMPLE R4, R5
        """
        program = assembler.assemble(source)
        assert len(program) == 4

    def test_assemble_to_bytes(self, assembler):
        """Assemble to binary representation."""
        source = "EMBED R1, R2"
        binary = assembler.assemble_to_bytes(source)
        assert len(binary) == 4  # One instruction = 4 bytes
        assert binary[0] == 0xD0  # EMBED opcode

    def test_assemble_layer_with_immediate(self, assembler):
        """LAYER instruction accepts immediate value."""
        program = assembler.assemble("LAYER #3")
        assert len(program) == 1
        assert program[0].imm == 3

    def test_assemble_comments_ignored(self, assembler):
        """Comments starting with ; are ignored."""
        source = """
        ; This is a comment
        EMBED R1, R2
        ; Another comment
        """
        program = assembler.assemble(source)
        assert len(program) == 1

    def test_assemble_labels(self, assembler):
        """Labels can be defined and referenced."""
        source = """
        START:
            EMBED R1, R2
        """
        # For now, just parse labels
        program = assembler.assemble(source)
        assert len(program) >= 1
        assert "START" in assembler.labels

    def test_invalid_opcode_raises(self, assembler):
        """Invalid opcode should raise error."""
        with pytest.raises(ValueError):
            assembler.assemble("INVALID R1, R2")

    def test_assemble_full_inference(self, assembler):
        """Assemble a complete inference program."""
        source = """
        ; Single-token inference through 8 layers
        EMBED R1, R2
        LAYER #0
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #1
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #2
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #3
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #4
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #5
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #6
        ATTEND R2, R2
        PROJECT R2, R2
        LAYER #7
        ATTEND R2, R2
        PROJECT R2, R2
        SAMPLE R2, R5
        THOUGHT_PULSE R5
        """
        program = assembler.assemble(source)
        # Should have instructions for all layers + sample + pulse
        assert len(program) > 15
