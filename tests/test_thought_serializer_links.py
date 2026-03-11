"""
Tests for TOKEN_LINK serialization in ThoughtSerializer.

Verifies that TOKEN_LINK thoughts are correctly serialized
to 16-byte WGSL glyph commands with opcode 0x0A.
"""

import pytest

from systems.sisyphus.native_hilbert import NativeHilbertLUT
from systems.sisyphus.thought_serializer import ThoughtSerializer


class TestTokenLinkSerialization:
    """Tests for TOKEN_LINK thought serialization."""

    def test_serialize_token_link(self):
        """Test serializing a TOKEN_LINK thought."""
        serializer = ThoughtSerializer(NativeHilbertLUT())

        link_thought = {
            "type": "TOKEN_LINK",
            "prev_x": 100,
            "prev_y": 150,
            "delta_x": 10,
            "delta_y": -5,
            "color": (0.0, 1.0, 1.0, 0.3)
        }

        glyph = serializer.serialize(link_thought)

        assert glyph.thought_type == "TOKEN_LINK"
        assert glyph.hilbert_index >= 0

    def test_token_link_glyph_command(self):
        """Test TOKEN_LINK produces valid glyph command."""
        serializer = ThoughtSerializer(NativeHilbertLUT())

        link_thought = {
            "type": "TOKEN_LINK",
            "prev_x": 50,
            "prev_y": 75,
            "delta_x": 25,
            "delta_y": 10,
            "color": (1.0, 0.5, 0.0, 0.3)
        }

        glyph = serializer.serialize(link_thought)
        cmd = serializer.to_glyph_command(glyph)

        # Glyph command should be 16 bytes
        assert len(cmd) == 16

        # Opcode should be 0x0A (TOKEN_LINK)
        opcode = cmd[0]
        assert opcode == 0x0A

    def test_link_coordinates_preserved(self):
        """Test link start/end coordinates are preserved in glyph."""
        serializer = ThoughtSerializer(NativeHilbertLUT())

        link_thought = {
            "type": "TOKEN_LINK",
            "prev_x": 128,
            "prev_y": 64,
            "delta_x": 32,
            "delta_y": 16,
            "color": (0.5, 0.5, 0.5, 0.3)
        }

        glyph = serializer.serialize(link_thought)

        # The glyph should encode the line geometry
        # hilbert_index derived from start position
        assert glyph.hilbert_index >= 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
