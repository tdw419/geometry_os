"""End-to-end tests for PixelBrain Visual Shell integration."""
import pytest
import asyncio
from unittest.mock import MagicMock, AsyncMock


class TestPixelBrainVisualE2E:
    """Test the complete visual feedback loop."""

    @pytest.fixture
    def mock_bridge(self):
        """Create a mock VisualBridge with WebSocket."""
        from systems.visual_shell.api.visual_bridge import MultiVmStreamer

        bridge = MultiVmStreamer()
        mock_ws = MagicMock()
        mock_ws.send_json = AsyncMock()
        bridge.active_websockets.add(mock_ws)

        yield bridge, mock_ws

        bridge.active_websockets.discard(mock_ws)

    @pytest.mark.asyncio
    async def test_thought_pulse_message_format(self, mock_bridge):
        """THOUGHT_PULSE messages should have correct format."""
        bridge, ws = mock_bridge

        bridge.emit_thought_pulse(
            token_id=15496,
            position=(100, 200),
            intensity=0.75
        )

        await asyncio.sleep(0.1)

        call_args = ws.send_json.call_args[0][0]
        assert call_args["type"] == "THOUGHT_PULSE"
        assert call_args["opcode"] == 0xCE
        assert call_args["token_id"] == 15496
        assert call_args["x"] == 100
        assert call_args["y"] == 200
        assert call_args["intensity"] == 0.75
        assert "timestamp" in call_args

    @pytest.mark.asyncio
    async def test_atlas_glow_message_format(self, mock_bridge):
        """ATLAS_GLOW messages should have correct format."""
        bridge, ws = mock_bridge

        # Skip if emit_atlas_glow not implemented
        if not hasattr(bridge, 'emit_atlas_glow'):
            pytest.skip("emit_atlas_glow not implemented")

        bridge.emit_atlas_glow(
            weight_indices=[0, 64, 128],
            intensity=0.5,
            duration_ms=1000
        )

        await asyncio.sleep(0.1)

        call_args = ws.send_json.call_args[0][0]
        assert call_args["type"] == "ATLAS_GLOW"
        assert call_args["indices"] == [0, 64, 128]
        assert call_args["intensity"] == 0.5
        assert call_args["duration_ms"] == 1000

    @pytest.mark.asyncio
    async def test_generation_triggers_thought_pulse(self, mock_bridge):
        """Generating tokens should emit THOUGHT_PULSE glyphs."""
        bridge, ws = mock_bridge

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        # Skip if brain atlas not available
        try:
            pipeline = PixelBrainPipeline("tinystories_brain.rts.png")
        except FileNotFoundError:
            pytest.skip("Brain atlas not available")

        # Generate tokens and emit thought pulses
        tokens = []
        for i, token in enumerate(pipeline.generate([0], max_tokens=3)):
            tokens.append(token)
            bridge.emit_thought_pulse(
                token_id=token,
                position=(i * 50, 0),
                intensity=1.0
            )

        # Verify pulses were emitted
        assert len(tokens) == 3
        assert bridge.has_active_glyphs()

        await asyncio.sleep(0.1)

        # Verify WebSocket received broadcasts
        assert ws.send_json.call_count == 3

    @pytest.mark.asyncio
    async def test_multiple_pulses_broadcast_in_order(self, mock_bridge):
        """Multiple THOUGHT_PULSE emissions should broadcast in order."""
        bridge, ws = mock_bridge

        # Emit multiple pulses with different tokens
        tokens = [100, 200, 300]
        for i, token_id in enumerate(tokens):
            bridge.emit_thought_pulse(
                token_id=token_id,
                position=(i * 10, i * 20),
                intensity=0.5 + (i * 0.25)
            )

        await asyncio.sleep(0.1)

        # Verify all broadcasts happened in order
        assert ws.send_json.call_count == 3

        # Check each call
        for i, call in enumerate(ws.send_json.call_args_list):
            call_args = call[0][0]
            assert call_args["type"] == "THOUGHT_PULSE"
            assert call_args["opcode"] == 0xCE
            assert call_args["token_id"] == tokens[i]
            assert call_args["x"] == i * 10
            assert call_args["y"] == i * 20
            assert call_args["intensity"] == 0.5 + (i * 0.25)

    @pytest.mark.asyncio
    async def test_broadcast_handles_multiple_clients(self, mock_bridge):
        """Broadcast should reach all connected WebSocket clients."""
        bridge, ws1 = mock_bridge

        # Add second client
        ws2 = MagicMock()
        ws2.send_json = AsyncMock()
        bridge.active_websockets.add(ws2)

        # Emit a pulse
        bridge.emit_thought_pulse(
            token_id=42,
            position=(50, 50),
            intensity=1.0
        )

        await asyncio.sleep(0.1)

        # Both clients should receive
        ws1.send_json.assert_called_once()
        ws2.send_json.assert_called_once()

        # Messages should be identical
        msg1 = ws1.send_json.call_args[0][0]
        msg2 = ws2.send_json.call_args[0][0]
        assert msg1 == msg2
        assert msg1["type"] == "THOUGHT_PULSE"

        # Cleanup
        bridge.active_websockets.discard(ws2)

    @pytest.mark.asyncio
    async def test_broadcast_removes_dead_connections(self, mock_bridge):
        """Broadcast should remove WebSocket clients that fail."""
        bridge, ws1 = mock_bridge

        # Add a dead client that raises on send
        ws_dead = MagicMock()
        ws_dead.send_json = AsyncMock(side_effect=Exception("Connection dead"))
        bridge.active_websockets.add(ws_dead)

        # Emit a pulse
        bridge.emit_thought_pulse(
            token_id=1,
            position=(0, 0),
            intensity=1.0
        )

        await asyncio.sleep(0.1)

        # Dead client should be removed
        assert ws_dead not in bridge.active_websockets
        # Live client should still be connected
        assert ws1 in bridge.active_websockets

    @pytest.mark.asyncio
    async def test_pulse_with_brain_atlas_integration(self, mock_bridge):
        """Full integration test with brain atlas and visual feedback."""
        bridge, ws = mock_bridge

        from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

        # Skip if brain atlas not available
        try:
            pipeline = PixelBrainPipeline("tinystories_brain.rts.png")
        except FileNotFoundError:
            pytest.skip("Brain atlas not available")

        # Simulate a generation session with visual feedback
        prompt_tokens = [0, 100]
        generated = pipeline.generate(prompt_tokens, max_tokens=5)

        # Emit visual feedback for each generated token
        for i, token_id in enumerate(generated):
            bridge.emit_thought_pulse(
                token_id=token_id,
                position=(i * 30, 100),
                intensity=1.0 - (i * 0.15)  # Fading intensity
            )

        await asyncio.sleep(0.1)

        # Verify complete feedback loop
        assert bridge.has_active_glyphs()
        assert len(bridge.get_active_glyphs()) == 5
        assert ws.send_json.call_count == 5

        # Verify each glyph has correct structure
        glyphs = bridge.get_active_glyphs()
        for i, glyph in enumerate(glyphs):
            assert glyph["opcode"] == 0xCE
            assert glyph["token_id"] == generated[i]
            assert glyph["x"] == i * 30
            assert glyph["y"] == 100
            assert glyph["intensity"] == max(0.0, 1.0 - (i * 0.15))
            assert "timestamp" in glyph
