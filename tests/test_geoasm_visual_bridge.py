"""Tests for GeoASM Visual Bridge."""
import pytest


class TestGeoASMVisualBridge:
    """Test visual feedback for neural execution."""

    @pytest.fixture
    def bridge(self):
        """Create VisualBridge instance."""
        from systems.visual_shell.geoasm.visual_bridge import GeoASMVisualBridge
        return GeoASMVisualBridge()

    def test_emit_thought_pulse(self, bridge):
        """THOUGHT_PULSE creates visual event."""
        event = bridge.emit_thought_pulse(token=42, position=0, layer=7)

        assert event is not None
        assert event.data['token'] == 42
        assert event.data['position'] == 0
        assert event.data['layer'] == 7

    def test_emit_atlas_glow(self, bridge):
        """Atlas glow highlights accessed weights."""
        indices = [0, 16, 32, 48]
        event = bridge.emit_atlas_glow(indices, intensity=0.8)

        assert event.data['indices'] == indices
        assert event.data['intensity'] == 0.8

    def test_events_buffer(self, bridge):
        """Events are buffered for replay."""
        bridge.emit_thought_pulse(1, 0, 0)
        bridge.emit_thought_pulse(2, 1, 0)

        events = bridge.get_events()
        assert len(events) >= 2

    def test_clear_events(self, bridge):
        """Can clear event buffer."""
        bridge.emit_thought_pulse(1, 0, 0)
        bridge.clear_events()
        assert len(bridge.get_events()) == 0

    def test_token_color_mapping(self, bridge):
        """Tokens get semantic colors."""
        # Punctuation
        color = bridge.get_token_color(13)  # newline
        assert color is not None

        # Common words
        color = bridge.get_token_color(15496)  # "Hello"
        assert color is not None
