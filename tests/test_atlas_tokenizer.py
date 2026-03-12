# tests/test_atlas_tokenizer.py
"""Tests for Atlas tokenizer (RGB ↔ Index conversion)."""

import pytest
import numpy as np
from systems.pixel_brain.atlas_tokenizer import (
    AtlasTokenizer,
    rgb_to_index,
    index_to_rgb,
    ascii_to_index,
    index_to_ascii,
    byte_to_index,
    index_to_byte,
)
from systems.pixel_brain.constants import (
    ASCII_START,
    ASCII_END,
    OPCODE_NOP,
    OPCODE_ALLOC,
    OPCODE_HALT,
    BYTE_LITERAL_START,
)


class TestRGBIndexConversion:
    """Test RGB to atlas index conversion."""

    def test_black_is_zero(self):
        """RGB (0, 0, 0) should map to index 0."""
        assert rgb_to_index(0, 0, 0) == 0

    def test_index_zero_is_black(self):
        """Index 0 should map to RGB (0, 0, 0)."""
        assert index_to_rgb(0) == (0, 0, 0)

    def test_roundtrip_preserves_rgb_with_tolerance(self):
        """Converting RGB→index→RGB should return approximately original."""
        test_colors = [
            (0, 0, 0),
            (255, 0, 0),
            (0, 255, 0),
            (0, 0, 255),
            (128, 128, 128),
            (255, 255, 255),
        ]
        for r, g, b in test_colors:
            index = rgb_to_index(r, g, b)
            decoded_r, decoded_g, decoded_b = index_to_rgb(index)
            # Allow quantization tolerance
            assert abs(decoded_r - r) < 64, f"R mismatch for ({r}, {g}, {b}): got {decoded_r}"
            assert abs(decoded_g - g) < 16, f"G mismatch for ({r}, {g}, {b}): got {decoded_g}"
            assert abs(decoded_b - b) < 16, f"B mismatch for ({r}, {g}, {b}): got {decoded_b}"

    def test_index_range(self):
        """Index should be in range 0-1023."""
        index = rgb_to_index(255, 255, 255)
        assert 0 <= index < 1024


class TestASCIITokenization:
    """Test ASCII character tokenization."""

    def test_space_is_32(self):
        """Space character should map to index 32."""
        assert ascii_to_index(" ") == 32

    def test_a_is_65(self):
        """'A' (65) should map to index 65."""
        assert ascii_to_index("A") == 65

    def test_index_65_is_a(self):
        """Index 65 should decode to 'A'."""
        assert index_to_ascii(65) == "A"

    def test_roundtrip_preserves_ascii(self):
        """ASCII→index→ASCII should return original."""
        for char in "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ":
            index = ascii_to_index(char)
            decoded = index_to_ascii(index)
            assert decoded == char, f"Failed for '{char}'"


class TestByteLiteralTokenization:
    """Test byte literal tokenization."""

    def test_zero_is_256(self):
        """Byte 0 should map to index 256."""
        assert byte_to_index(0) == 256

    def test_255_is_511(self):
        """Byte 255 should map to index 511."""
        assert byte_to_index(255) == 511

    def test_index_256_is_zero(self):
        """Index 256 should decode to byte 0."""
        assert index_to_byte(256) == 0

    def test_index_511_is_255(self):
        """Index 511 should decode to byte 255."""
        assert index_to_byte(511) == 255


class TestOpcodeTokenization:
    """Test opcode tokenization."""

    def test_nop_is_200(self):
        """NOP opcode should be index 200."""
        assert OPCODE_NOP == 200

    def test_alloc_is_201(self):
        """ALLOC opcode should be index 201."""
        assert OPCODE_ALLOC == 201

    def test_halt_is_213(self):
        """HALT opcode should be index 213."""
        assert OPCODE_HALT == 213


class TestAtlasTokenizer:
    """Test AtlasTokenizer class."""

    @pytest.fixture
    def tokenizer(self):
        return AtlasTokenizer()

    def test_tokenize_prompt(self, tokenizer):
        """Tokenize a prompt string to indices."""
        prompt = "ALLOC 4x4"
        indices = tokenizer.tokenize_prompt(prompt)
        assert indices == [65, 76, 76, 79, 67, 32, 52, 120, 52]

    def test_detokenize_prompt(self, tokenizer):
        """Detokenize indices back to prompt string."""
        indices = [65, 76, 76, 79, 67, 32, 52, 120, 52]
        prompt = tokenizer.detokenize_prompt(indices)
        assert prompt == "ALLOC 4x4"

    def test_tokenize_codel_array(self, tokenizer):
        """Tokenize a 2D codel array to indices."""
        codels = np.array([
            [[0, 0, 255], [0, 0, 0]],
            [[0, 0, 0], [0, 0, 0]],
        ], dtype=np.uint8)

        indices = tokenizer.tokenize_codels(codels)
        assert all(isinstance(i, int) for i in indices)

    def test_detokenize_codel_array(self, tokenizer):
        """Detokenize indices back to 2D codel array."""
        codels = np.array([
            [[0, 0, 255], [0, 0, 0]],
            [[0, 0, 0], [0, 0, 0]],
        ], dtype=np.uint8)

        indices = tokenizer.tokenize_codels(codels)
        decoded = tokenizer.detokenize_codels(indices, (2, 2))

        # Check with tolerance for quantization
        for y in range(2):
            for x in range(2):
                orig = codels[y, x]
                dec = decoded[y, x]
                assert abs(int(dec[0]) - int(orig[0])) < 64
                assert abs(int(dec[1]) - int(orig[1])) < 16
                assert abs(int(dec[2]) - int(orig[2])) < 16
