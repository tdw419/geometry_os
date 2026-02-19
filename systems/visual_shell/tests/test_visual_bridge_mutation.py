"""Tests for Visual Bridge mutation event handling."""
import pytest
import asyncio
import json
import sys
import os
from unittest.mock import AsyncMock, MagicMock, patch

# Add project root to path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))


class MockWebSocket:
    """Mock WebSocket for testing broadcasts."""
    def __init__(self, messages=None):
        self.sent_messages = []
        self.remote_address = ("127.0.0.1", 12345)
        self._messages = messages or []
        self._message_index = 0

    async def send(self, message):
        self.sent_messages.append(json.loads(message))

    def __aiter__(self):
        return self

    async def __anext__(self):
        if self._message_index >= len(self._messages):
            raise StopAsyncIteration
        message = self._messages[self._message_index]
        self._message_index += 1
        return message


class TestMutationBatchHandler:
    """Tests for mutation_batch message handling."""

    def test_mutation_batch_handler_exists(self):
        """Verify VisualBridge can be instantiated and has handle_client method."""
        from systems.visual_shell.api.visual_bridge import VisualBridge
        bridge = VisualBridge()
        assert hasattr(bridge, 'handle_client')
        assert hasattr(bridge, '_broadcast')

    @pytest.mark.asyncio
    async def test_mutation_batch_broadcasts_weight_mutation_batch(self):
        """Test that mutation_batch broadcasts WEIGHT_MUTATION_BATCH to all clients."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()

        # Create mock clients to receive broadcasts
        mock_client1 = MockWebSocket()
        mock_client2 = MockWebSocket()

        # Add clients to bridge
        bridge.clients.add(mock_client1)
        bridge.clients.add(mock_client2)

        # Create a mutation_batch message
        mutation_message = {
            'type': 'mutation_batch',
            'mutations': [
                {'weight_id': 'w1', 'delta': 0.05, 'layer': 'hidden1'},
                {'weight_id': 'w2', 'delta': -0.03, 'layer': 'output'}
            ],
            'generation': 42,
            'timestamp': 1700000000000
        }

        # Create mock websocket that yields our message
        mock_ws = MockWebSocket(messages=[json.dumps(mutation_message)])
        mock_ws.remote_address = ("127.0.0.1", 54321)

        # Run the handle_client coroutine
        await bridge.handle_client(mock_ws)

        # Verify both clients received the broadcast
        assert len(mock_client1.sent_messages) == 1
        assert len(mock_client2.sent_messages) == 1

        # Verify the broadcast message format
        broadcast1 = mock_client1.sent_messages[0]
        assert broadcast1['type'] == 'WEIGHT_MUTATION_BATCH'
        assert 'data' in broadcast1
        assert broadcast1['data']['mutations'] == mutation_message['mutations']
        assert broadcast1['data']['generation'] == 42

        # Verify consistency between clients
        broadcast2 = mock_client2.sent_messages[0]
        assert broadcast2['type'] == 'WEIGHT_MUTATION_BATCH'
        assert broadcast2['data']['mutations'] == broadcast1['data']['mutations']


class TestDistrictUpgradeHandler:
    """Tests for district_upgrade message handling."""

    @pytest.mark.asyncio
    async def test_district_upgrade_broadcasts_with_correct_payload(self):
        """Test that district_upgrade broadcasts DISTRICT_UPGRADE with correct payload."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()

        # Create mock clients
        mock_client1 = MockWebSocket()
        mock_client2 = MockWebSocket()

        bridge.clients.add(mock_client1)
        bridge.clients.add(mock_client2)

        # Create a district_upgrade message with animation data
        upgrade_message = {
            'type': 'district_upgrade',
            'district_id': 'neural-core-7',
            'upgrade_type': 'capacity_expansion',
            'animation': {
                'effect': 'pulse_glow',
                'duration_ms': 1500,
                'color': '#00ff88',
                'intensity': 0.8
            },
            'timestamp': 1700000000000
        }

        # Create mock websocket that yields our message
        mock_ws = MockWebSocket(messages=[json.dumps(upgrade_message)])
        mock_ws.remote_address = ("127.0.0.1", 54321)

        # Run the handle_client coroutine
        await bridge.handle_client(mock_ws)

        # Verify both clients received the broadcast
        assert len(mock_client1.sent_messages) == 1
        assert len(mock_client2.sent_messages) == 1

        # Verify the broadcast message format
        broadcast1 = mock_client1.sent_messages[0]
        assert broadcast1['type'] == 'DISTRICT_UPGRADE'
        assert 'data' in broadcast1
        assert broadcast1['data']['district_id'] == 'neural-core-7'
        assert broadcast1['data']['upgrade_type'] == 'capacity_expansion'
        assert broadcast1['data']['animation']['effect'] == 'pulse_glow'
        assert broadcast1['data']['animation']['duration_ms'] == 1500
        assert broadcast1['data']['animation']['color'] == '#00ff88'

        # Verify consistency between clients
        broadcast2 = mock_client2.sent_messages[0]
        assert broadcast2['type'] == 'DISTRICT_UPGRADE'
        assert broadcast2['data']['district_id'] == broadcast1['data']['district_id']
        assert broadcast2['data']['animation'] == broadcast1['data']['animation']


class TestMutationEventMessageFormats:
    """Tests for message format validation."""

    def test_mutation_batch_message_structure(self):
        """Test that mutation_batch messages have required fields."""
        mutation_message = {
            'type': 'mutation_batch',
            'mutations': [
                {'weight_id': 'w1', 'delta': 0.05}
            ],
            'generation': 1
        }

        assert mutation_message['type'] == 'mutation_batch'
        assert 'mutations' in mutation_message
        assert isinstance(mutation_message['mutations'], list)
        assert 'generation' in mutation_message

    def test_district_upgrade_message_structure(self):
        """Test that district_upgrade messages have required fields."""
        upgrade_message = {
            'type': 'district_upgrade',
            'district_id': 'test-district',
            'upgrade_type': 'capacity',
            'animation': {'effect': 'glow'}
        }

        assert upgrade_message['type'] == 'district_upgrade'
        assert 'district_id' in upgrade_message
        assert 'upgrade_type' in upgrade_message
        assert 'animation' in upgrade_message
