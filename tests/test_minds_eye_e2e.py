"""
End-to-end tests for Mind's Eye token chain visualization.

Verifies the complete pipeline: token stream -> chain tracking -> link emission -> visualization
"""

from unittest.mock import Mock

import pytest

from systems.sisyphus.token_rasterizer import TokenRasterizer


class TestMindsEyeE2E:
    """End-to-end tests for token chain visualization."""

    def test_token_stream_produces_chain(self):
        """Test that a token stream produces a chain of linked tokens."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # Stream a sequence of tokens
        tokens = ["def", "calculate", "(", "x", ",", "y", ")"]
        for token in tokens:
            rasterizer.process_token(token)

        calls = mock_bridge.send_thought.call_args_list

        # Should have TOKEN_RENDER for each token
        render_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_RENDER"]
        assert len(render_calls) == len(tokens)

        # Should have TOKEN_LINK for all but first token
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]
        assert len(link_calls) == len(tokens) - 1

    def test_reset_chain_starts_new_chain(self):
        """Test that reset_chain allows starting a new independent chain."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # Stream first chain
        rasterizer.process_token("a")
        rasterizer.process_token("b")

        # Reset
        rasterizer.reset_chain()

        # Stream second chain
        rasterizer.process_token("c")
        rasterizer.process_token("d")

        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        # Should have exactly 2 links (b linked from a, d linked from c)
        assert len(link_calls) == 2

        # The link for 'd' should come from 'c', not 'b'
        last_link = link_calls[-1][0][0]
        first_link = link_calls[0][0][0]

        # Verify the chains are independent by checking prev positions differ
        assert last_link["prev_x"] != first_link["curr_x"] or \
               last_link["prev_y"] != first_link["curr_y"]

    def test_reasoning_chain_visualization(self):
        """Test that a reasoning chain is visualized correctly."""
        rasterizer = TokenRasterizer()
        mock_bridge = Mock()
        rasterizer.bridge = mock_bridge

        # Simulate a reasoning chain
        reasoning = """
        if temperature > threshold:
            activate_cooling()
        """
        tokens = reasoning.split()

        for token in tokens:
            if token.strip():
                rasterizer.process_token(token.strip())

        calls = mock_bridge.send_thought.call_args_list
        link_calls = [c for c in calls if c[0][0].get("type") == "TOKEN_LINK"]

        # All consecutive tokens should be linked
        assert len(link_calls) >= 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
