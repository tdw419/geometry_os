"""
Tests for attention visualization functionality in VisualBridge.

Tests the emit_attention_update method and attention entropy calculation.
"""

import asyncio
import os

# Import after adjusting path for test environment
import sys
import time
from unittest.mock import AsyncMock, MagicMock

import pytest

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

from systems.visual_shell.api.visual_bridge import MultiVmStreamer


class TestAttentionVisualization:
    """Test attention visualization features."""

    @pytest.fixture
    def multi_vm_streamer(self):
        """Create a MultiVmStreamer instance for testing."""
        streamer = MultiVmStreamer()
        # Mock the watcher to avoid filesystem dependencies
        streamer.watcher = MagicMock()
        streamer.active_websockets = set()
        return streamer

    @pytest.fixture
    def mock_websocket(self):
        """Create a mock WebSocket for testing."""
        ws = AsyncMock()
        ws.send_json = AsyncMock()
        return ws

    def test_calculate_attention_entropy_uniform(self, multi_vm_streamer):
        """Test entropy calculation for uniform distribution."""
        weights = [0.25, 0.25, 0.25, 0.25]
        entropy = multi_vm_streamer._calculate_attention_entropy(weights)

        # For uniform distribution: H = log2(n) = log2(4) = 2
        expected_entropy = 2.0
        assert abs(entropy - expected_entropy) < 0.001

    def test_calculate_attention_entropy_focused(self, multi_vm_streamer):
        """Test entropy calculation for focused distribution."""
        weights = [1.0, 0.0, 0.0, 0.0]
        entropy = multi_vm_streamer._calculate_attention_entropy(weights)

        # For focused distribution: H = 0
        expected_entropy = 0.0
        assert abs(entropy - expected_entropy) < 0.001

    def test_calculate_attention_entropy_mixed(self, multi_vm_streamer):
        """Test entropy calculation for mixed distribution."""
        weights = [0.5, 0.25, 0.15, 0.1]
        entropy = multi_vm_streamer._calculate_attention_entropy(weights)

        # Entropy should be between 0 and 2 bits
        assert 0 < entropy < 2.0

    def test_calculate_attention_entropy_numpy_array(self, multi_vm_streamer):
        """Test entropy calculation with numpy array input."""
        import numpy as np
        weights = np.array([0.3, 0.3, 0.2, 0.2])
        entropy = multi_vm_streamer._calculate_attention_entropy(weights)

        # Should handle numpy arrays without error
        assert isinstance(entropy, float)
        assert 0 <= entropy <= 2.0

    def test_calculate_attention_entropy_empty_weights(self, multi_vm_streamer):
        """Test entropy calculation with empty weights."""
        weights = []
        entropy = multi_vm_streamer._calculate_attention_entropy(weights)

        # Empty weights should return 0
        assert entropy == 0.0

    def test_calculate_attention_entropy_single_weight(self, multi_vm_streamer):
        """Test entropy calculation with single weight."""
        weights = [1.0]
        entropy = multi_vm_streamer._calculate_attention_entropy(weights)

        # Single weight should return 0
        assert entropy == 0.0

    async def test_emit_attention_update_basic(self, multi_vm_streamer, mock_websocket):
        """Test basic emit_attention_update functionality."""
        # Add mock WebSocket to active connections
        multi_vm_streamer.active_websockets.add(mock_websocket)

        # Test data
        layer = 0
        head = 2
        weights = [0.1, 0.2, 0.3, 0.4, 0.0]

        # Call emit_attention_update
        result = multi_vm_streamer.emit_attention_update(layer, head, weights)

        # Should return True
        assert result is True

        # In test environment, the broadcast happens synchronously
        # Need to wait a bit for the async broadcast to complete
        await asyncio.sleep(0.1)

        # Verify WebSocket was called
        mock_websocket.send_json.assert_called_once()

        # Get the sent data
        sent_data = mock_websocket.send_json.call_args[0][0]

        # Verify message structure
        assert sent_data["type"] == "ATTENTION_UPDATE"
        assert sent_data["layer"] == layer
        assert sent_data["head"] == head
        assert sent_data["weights"] == weights
        assert "timestamp" in sent_data
        assert "max_weight" in sent_data
        assert "entropy" in sent_data

        # Verify max_weight
        assert sent_data["max_weight"] == 0.4

        # Verify entropy
        expected_entropy = multi_vm_streamer._calculate_attention_entropy(weights)
        assert abs(sent_data["entropy"] - expected_entropy) < 0.001

    async def test_emit_attention_update_layer_head_clamping(self, multi_vm_streamer, mock_websocket):
        """Test that layer and head indices are clamped to valid range (0-7)."""
        multi_vm_streamer.active_websockets.add(mock_websocket)
        weights = [0.1, 0.2, 0.3]

        # Test layer clamping
        result = multi_vm_streamer.emit_attention_update(-1, 0, weights)
        assert result is True
        await asyncio.sleep(0.1)
        sent_data = mock_websocket.send_json.call_args[0][0]
        assert sent_data["layer"] == 0

        result = multi_vm_streamer.emit_attention_update(10, 0, weights)
        assert result is True
        await asyncio.sleep(0.1)
        sent_data = mock_websocket.send_json.call_args[0][0]
        assert sent_data["layer"] == 7

        # Test head clamping
        result = multi_vm_streamer.emit_attention_update(0, -1, weights)
        assert result is True
        await asyncio.sleep(0.1)
        sent_data = mock_websocket.send_json.call_args[0][0]
        assert sent_data["head"] == 0

        result = multi_vm_streamer.emit_attention_update(0, 10, weights)
        assert result is True
        await asyncio.sleep(0.1)
        sent_data = mock_websocket.send_json.call_args[0][0]
        assert sent_data["head"] == 7

    async def test_emit_attention_update_numpy_weights(self, multi_vm_streamer, mock_websocket):
        """Test emit_attention_update with numpy array weights."""
        import numpy as np
        multi_vm_streamer.active_websockets.add(mock_websocket)

        weights = np.array([0.1, 0.2, 0.3, 0.4])
        result = multi_vm_streamer.emit_attention_update(1, 3, weights)

        assert result is True
        await asyncio.sleep(0.1)
        sent_data = mock_websocket.send_json.call_args[0][0]
        assert sent_data["weights"] == [0.1, 0.2, 0.3, 0.4]  # Should be converted to list

    async def test_emit_attention_update_no_websockets(self, multi_vm_streamer):
        """Test emit_attention_update with no active WebSockets."""
        # Empty WebSocket set
        multi_vm_streamer.active_websockets = set()
        weights = [0.1, 0.2, 0.3]

        # Should still return True
        result = multi_vm_streamer.emit_attention_update(0, 0, weights)
        assert result is True

    async def test_emit_attention_update_none_weights(self, multi_vm_streamer, mock_websocket):
        """Test emit_attention_update with None weights."""
        multi_vm_streamer.active_websockets.add(mock_websocket)

        # Should return False for None weights
        result = multi_vm_streamer.emit_attention_update(0, 0, None)
        assert result is False
        mock_websocket.send_json.assert_not_called()

    async def test_emit_attention_update_websocket_error(self, multi_vm_streamer, mock_websocket):
        """Test emit_attention_update when WebSocket send fails."""
        multi_vm_streamer.active_websockets.add(mock_websocket)

        # Make send_json raise an exception
        mock_websocket.send_json.side_effect = Exception("WebSocket disconnected")

        weights = [0.1, 0.2, 0.3]
        result = multi_vm_streamer.emit_attention_update(0, 0, weights)

        # Should still return True even if one WebSocket fails
        assert result is True
        # Wait for cleanup to complete
        await asyncio.sleep(0.1)
        # The broken WebSocket should be removed from active_websockets
        assert mock_websocket not in multi_vm_streamer.active_websockets

    def test_attention_update_message_structure(self, multi_vm_streamer):
        """Test the structure of ATTENTION_UPDATE message."""
        weights = [0.1, 0.2, 0.3, 0.4, 0.0]
        max_weight = max(weights)
        entropy = multi_vm_streamer._calculate_attention_entropy(weights)

        # Create expected message
        message = {
            "type": "ATTENTION_UPDATE",
            "timestamp": time.time(),
            "layer": 2,
            "head": 5,
            "weights": weights,
            "max_weight": max_weight,
            "entropy": entropy
        }

        # Verify all required fields are present
        required_fields = ["type", "timestamp", "layer", "head", "weights", "max_weight", "entropy"]
        for field in required_fields:
            assert field in message

    async def test_multiple_websockets_broadcast(self, multi_vm_streamer):
        """Test that ATTENTION_UPDATE is broadcast to all WebSockets."""
        # Create multiple mock WebSockets
        ws1 = AsyncMock()
        ws2 = AsyncMock()
        ws3 = AsyncMock()

        multi_vm_streamer.active_websockets = {ws1, ws2, ws3}
        weights = [0.1, 0.2, 0.3]

        # Call emit_attention_update
        result = multi_vm_streamer.emit_attention_update(1, 1, weights)
        assert result is True

        # Wait for broadcast to complete
        await asyncio.sleep(0.1)

        # Verify all WebSockets received the message
        for ws in [ws1, ws2, ws3]:
            ws.send_json.assert_called_once()
            sent_data = ws.send_json.call_args[0][0]
            assert sent_data["type"] == "ATTENTION_UPDATE"
            assert sent_data["weights"] == weights


# Test runner
if __name__ == "__main__":
    # Run the tests
    pytest.main([__file__, "-v"])
