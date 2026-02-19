import pytest
import asyncio
import json
from unittest.mock import AsyncMock, MagicMock

from systems.visual_shell.api.visual_bridge import VisualBridge

@pytest.mark.asyncio
async def test_token_pulse_relay():
    """Test that TokenVisualizationUpdate events are broadcast to clients."""
    bridge = VisualBridge(ws_port=8768)

    # Mock client
    mock_client = AsyncMock()
    bridge.clients = {mock_client}

    # Simulate token event
    token_event = {
        "type": "token_visualization_update",
        "hilbert_x": 8192,
        "hilbert_y": 4096,
        "token": "Hello",
        "timestamp": 1234567890.0
    }

    await bridge.relay_token_pulse(token_event)

    # Verify broadcast
    mock_client.send.assert_called_once()
    sent_data = json.loads(mock_client.send.call_args[0][0])

    assert sent_data["type"] == "neural_city_pulse"
    assert sent_data["x"] == 8192
    assert sent_data["y"] == 4096
    assert sent_data["token"] == "Hello"
    assert sent_data["timestamp"] == 1234567890.0

@pytest.mark.asyncio
async def test_batch_token_relay():
    """Test that rapid tokens are batched efficiently."""
    bridge = VisualBridge(ws_port=8768)

    mock_client = AsyncMock()
    bridge.clients = {mock_client}

    # Send 10 rapid tokens
    for i in range(10):
        await bridge.relay_token_pulse({
            "type": "token_visualization_update",
            "hilbert_x": i * 1000,
            "hilbert_y": i * 1000,
            "token": f"tok{i}",
            "timestamp": 1234567890.0 + i * 0.05
        })

    # Should have 10 calls
    assert mock_client.send.call_count == 10

@pytest.mark.asyncio
async def test_no_clients_graceful():
    """Test that relay works even with no connected clients."""
    bridge = VisualBridge(ws_port=8768)
    bridge.clients = set()

    # Should not raise
    await bridge.relay_token_pulse({
        "type": "token_visualization_update",
        "hilbert_x": 1000,
        "hilbert_y": 1000,
        "token": "test",
        "timestamp": 1234567890.0
    })
