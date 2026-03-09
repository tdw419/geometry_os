"""Tests for THOUGHT_PULSE visual emission."""
import asyncio
import time
import pytest
from unittest.mock import MagicMock, AsyncMock


class TestThoughtPulse:
    """Test that 0xD6 emits visual glyphs."""

    def test_thought_pulse_emits_glyph(self):
        """emit_thought_pulse returns True on successful emission."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()

        # Emit thought pulse for token "Hello" (hypothetical)
        result = bridge.emit_thought_pulse(
            token_id=15496,  # "Hello" in GPT-2 tokenizer
            position=(100, 100),
            intensity=1.0
        )

        assert result is True
        assert bridge.has_active_glyphs()

    def test_thought_pulse_uses_glyph_0xCE(self):
        """THOUGHT_PULSE should use the THOUGHT_RENDER opcode (0xCE)."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()

        bridge.emit_thought_pulse(token_id=0, position=(0, 0))
        glyphs = bridge.get_active_glyphs()

        assert len(glyphs) > 0
        assert glyphs[0]["opcode"] == 0xCE

    def test_has_active_glyphs(self):
        """has_active_glyphs should track emitted glyphs."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()

        # Initially no active glyphs
        assert bridge.has_active_glyphs() is False

        # After emission, should have active glyphs
        bridge.emit_thought_pulse(token_id=1, position=(10, 10))
        assert bridge.has_active_glyphs() is True

    def test_get_active_glyphs(self):
        """get_active_glyphs should return list of active glyphs."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()

        # Emit multiple glyphs
        bridge.emit_thought_pulse(token_id=1, position=(10, 10), intensity=0.5)
        bridge.emit_thought_pulse(token_id=2, position=(20, 20), intensity=1.0)

        glyphs = bridge.get_active_glyphs()

        assert len(glyphs) == 2

        # Check first glyph structure
        glyph1 = glyphs[0]
        assert glyph1["opcode"] == 0xCE
        assert glyph1["token_id"] == 1
        assert glyph1["x"] == 10
        assert glyph1["y"] == 10
        assert glyph1["intensity"] == 0.5
        assert "timestamp" in glyph1

        # Check second glyph structure
        glyph2 = glyphs[1]
        assert glyph2["opcode"] == 0xCE
        assert glyph2["token_id"] == 2
        assert glyph2["x"] == 20
        assert glyph2["y"] == 20
        assert glyph2["intensity"] == 1.0

    def test_glyph_has_timestamp(self):
        """Each glyph should have a timestamp."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()

        before = time.time()
        bridge.emit_thought_pulse(token_id=42, position=(50, 50))
        after = time.time()

        glyphs = bridge.get_active_glyphs()
        assert len(glyphs) == 1

        timestamp = glyphs[0]["timestamp"]
        assert before <= timestamp <= after

    def test_get_active_glyphs_returns_copy(self):
        """get_active_glyphs should return a copy, not the internal list."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()

        bridge.emit_thought_pulse(token_id=1, position=(10, 10))
        glyphs1 = bridge.get_active_glyphs()
        glyphs2 = bridge.get_active_glyphs()

        # Should be different list objects
        assert glyphs1 is not glyphs2
        # But same content
        assert glyphs1 == glyphs2


class TestThoughtPulseBroadcast:
    """Test THOUGHT_PULSE WebSocket broadcast functionality."""

    @pytest.mark.asyncio
    async def test_emit_thought_pulse_broadcasts_to_websockets(self):
        """emit_thought_pulse should broadcast to all connected clients."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        streamer = MultiVmStreamer()
        mock_ws = MagicMock()
        mock_ws.send_json = AsyncMock()
        streamer.active_websockets.add(mock_ws)

        result = streamer.emit_thought_pulse(15496, (100, 100), 0.8)

        assert result is True
        await asyncio.sleep(0.1)  # Let async broadcast complete
        mock_ws.send_json.assert_called_once()
        call_args = mock_ws.send_json.call_args[0][0]
        assert call_args["type"] == "THOUGHT_PULSE"

        streamer.active_websockets.discard(mock_ws)
