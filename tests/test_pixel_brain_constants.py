# tests/test_pixel_brain_constants.py
"""Tests for PixelBrain Visual Training constants."""

from systems.pixel_brain.constants import (
    OPCODE_BASE,
    OPCODE_NOP,
    OPCODE_ALLOC,
    OPCODE_HALT,
    VOCAB_SIZE,
    TEXTURE_SIZE,
    QUADRANT_SIZE,
    QUADRANT_PIXELS,
    Q0_START,
    Q0_END,
    Q1_START,
    Q1_END,
    Q2_START,
    Q2_END,
    Q3_START,
    Q3_END,
)

class TestOpcodeMapping:
    """Test GlyphStratum opcode mapping."""

    def test_opcode_base(self):
        """Opcode base is 200."""
        assert OPCODE_BASE == 200

    def test_nop_opcode(self):
        """Nop opcode is 200."""
        assert OPCODE_NOP == 200

    def test_alloc_opcode(self):
        """Alloc opcode is 201."""
        assert OPCODE_ALLOC == 201

    def test_halt_opcode(self):
        """Halt opcode is 213."""
        assert OPCODE_HALT == 213

class TestVocabBoundaries:
    """Test token vocabulary boundaries."""

    def test_vocab_size(self):
        """Total vocabulary size is 1024."""
        assert VOCAB_SIZE == 1024

class TestTextureDimensions:
    """Test training texture dimensions."""

    def test_texture_size(self):
        """Training texture is 256x256."""
        assert TEXTURE_SIZE == 256

    def test_quadrant_size(self):
        """Each quadrant is 128x128."""
        assert QUADRANT_SIZE == 128

    def test_quadrant_pixels(self):
        """Each quadrant has 16384 pixels."""
        assert QUADRANT_PIXELS == 16384

    def test_total_pixels(self):
        """Total texture has 65536 pixels."""
        assert TEXTURE_SIZE * TEXTURE_SIZE == 65536

class TestQuadrantOffsets:
    """Test Hilbert quadrant offsets."""

    def test_q0_offsets(self):
        """Q0 (Prompt) region is steps 0-16383."""
        assert Q0_START == 0
        assert Q0_END == 16383

    def test_q1_offsets(self):
        """Q1 (Intent) region is steps 16384-32767."""
        assert Q1_START == 16384
        assert Q1_END == 32767

    def test_q2_offsets(self):
        """Q2 (Code) region is steps 32768-49151."""
        assert Q2_START == 32768
        assert Q2_END == 49151

    def test_q3_offsets(self):
        """Q3 (Terminus) region is steps 49152-65535."""
        assert Q3_START == 49152
        assert Q3_END == 65535
