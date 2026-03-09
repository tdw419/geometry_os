"""
Tests for Semantic Proximity Lines - Token chain visualization.

Verifies that consecutive tokens are connected with faint lines
to visualize the "Chain of Thought" in the Mind's Eye.
"""

import pytest
from unittest.mock import Mock, call
from systems.sisyphus.token_rasterizer import TokenRasterizer
from systems.sisyphus.compositor_bridge import CompositorBridge


class TestTokenChainTracking:
    """Tests for token chain position tracking."""

    def test_rasterizer_tracks_previous_token(self):
        """Test TokenRasterizer tracks previous token position."""
        rasterizer = TokenRasterizer()
        rasterizer.bridge = Mock()

        # Process first token
        rasterizer.process_token("def")
        first_pos = (rasterizer._prev_token_x, rasterizer._prev_token_y)

        # Process second token
        rasterizer.process_token("calculate")
        second_pos = (rasterizer._prev_token_x, rasterizer._prev_token_y)

        # Positions should be different (different tokens hash to different positions)
        assert first_pos != second_pos

    def test_rasterizer_emits_link_on_second_token(self):
        """Test TokenRasterizer emits TOKEN_LINK after first token."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # First token - should NOT emit link (no previous)
        rasterizer.process_token("first")
        first_calls = len(mock_bridge.send_thought.call_args_list)

        # Second token - SHOULD emit link
        rasterizer.process_token("second")
        second_calls = len(mock_bridge.send_thought.call_args_list)

        # Second call should have generated 2 messages: token + link
        assert second_calls >= first_calls + 2

    def test_link_contains_previous_position(self):
        """Test TOKEN_LINK contains previous token position."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        rasterizer.process_token("alpha")
        rasterizer.process_token("beta")

        # Check that a TOKEN_LINK was sent
        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        assert len(link_calls) >= 1

        link_data = link_calls[0][0][0]
        assert "prev_x" in link_data
        assert "prev_y" in link_data
        assert "curr_x" in link_data
        assert "curr_y" in link_data

    def test_first_token_no_link(self):
        """Test first token in stream does not emit a link."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        rasterizer.process_token("first_token")

        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        assert len(link_calls) == 0


class TestTokenLinkColors:
    """Tests for token link coloring."""

    def test_link_uses_source_token_color(self):
        """Test link color derives from source token type."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # Process a keyword followed by identifier
        rasterizer.process_token("if")    # keyword - cyan
        rasterizer.process_token("value") # identifier - white

        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        if len(link_calls) >= 1:
            link_data = link_calls[0][0][0]
            # Link should have color information
            assert "color" in link_data


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
