# tests/test_tectonic_sync.py
"""
Tests for TectonicSync - WebSocket tectonic state synchronization.
"""

import pytest
import asyncio
import json
from unittest.mock import AsyncMock, MagicMock, patch
from systems.network_boot.tectonic_sync import TectonicSync, SyncMessage
from systems.network_boot.peer_registry import Peer, NodeBeacon


class TestSyncMessage:
    """Tests for SyncMessage dataclass."""

    def test_orb_update_message(self):
        """Test creating ORB_UPDATE message."""
        msg = SyncMessage.orb_update(
            node_id="node-1",
            path="systems/core.py",
            pos=(128.5, 256.0)
        )
        assert msg["type"] == "ORB_UPDATE"
        assert msg["node_id"] == "node-1"
        assert msg["path"] == "systems/core.py"
        assert msg["pos"] == [128.5, 256.0]

    def test_ripple_message(self):
        """Test creating RIPPLE message."""
        msg = SyncMessage.ripple(
            node_id="node-1",
            epicenter=(100.0, 200.0),
            energy=0.8,
            event_type="modify"
        )
        assert msg["type"] == "RIPPLE"
        assert msg["epicenter"] == [100.0, 200.0]
        assert msg["energy"] == 0.8
        assert msg["event"] == "modify"

    def test_heartbeat_message(self):
        """Test creating HEARTBEAT message."""
        msg = SyncMessage.heartbeat(
            node_id="node-1",
            orb_count=500
        )
        assert msg["type"] == "HEARTBEAT"
        assert msg["node_id"] == "node-1"
        assert msg["orb_count"] == 500


class TestTectonicSync:
    """Tests for TectonicSync WebSocket server/client."""

    def test_sync_creation(self):
        """Test TectonicSync initializes correctly."""
        sync = TectonicSync(node_id="test-node")
        assert sync.node_id == "test-node"
        assert sync.port == 8080
        assert sync.running is False

    @pytest.mark.asyncio
    async def test_sync_encode_message(self):
        """Test message encoding."""
        sync = TectonicSync(node_id="test")

        msg = SyncMessage.orb_update("test", "file.py", (100, 200))
        encoded = sync.encode_message(msg)

        decoded = json.loads(encoded)
        assert decoded["type"] == "ORB_UPDATE"
        assert decoded["path"] == "file.py"

    @pytest.mark.asyncio
    async def test_sync_decode_message(self):
        """Test message decoding."""
        sync = TectonicSync(node_id="test")

        encoded = json.dumps({
            "type": "RIPPLE",
            "node_id": "remote",
            "epicenter": [50.0, 100.0],
            "energy": 0.9,
            "event": "delete"
        })

        msg = sync.decode_message(encoded)
        assert msg["type"] == "RIPPLE"
        assert msg["epicenter"] == [50.0, 100.0]

    @pytest.mark.asyncio
    async def test_sync_broadcast_to_peers(self):
        """Test broadcasting message to connected peers."""
        sync = TectonicSync(node_id="test")

        # Create mock peer with websocket
        beacon = NodeBeacon(
            node_id="peer-1",
            hostname="peer-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=0.0
        )
        peer = Peer(beacon=beacon)
        peer.websocket = AsyncMock()
        peer.sync_active = True
        sync.peers = {"peer-1": peer}

        msg = SyncMessage.heartbeat("test", 500)
        await sync.broadcast_to_peers(msg)

        peer.websocket.send.assert_called_once()

    @pytest.mark.asyncio
    async def test_sync_handle_incoming_orb_update(self):
        """Test handling incoming ORB_UPDATE."""
        sync = TectonicSync(node_id="test")
        sync.on_orb_update = AsyncMock()

        msg = {
            "type": "ORB_UPDATE",
            "node_id": "remote",
            "path": "remote/file.py",
            "pos": [100.0, 200.0]
        }

        await sync.handle_message(msg)

        sync.on_orb_update.assert_called_once_with(
            node_id="remote",
            path="remote/file.py",
            pos=(100.0, 200.0)
        )

    @pytest.mark.asyncio
    async def test_sync_handle_incoming_ripple(self):
        """Test handling incoming RIPPLE."""
        sync = TectonicSync(node_id="test")
        sync.on_ripple = AsyncMock()

        msg = {
            "type": "RIPPLE",
            "node_id": "remote",
            "epicenter": [50.0, 100.0],
            "energy": 0.8,
            "event": "modify"
        }

        await sync.handle_message(msg)

        sync.on_ripple.assert_called_once_with(
            node_id="remote",
            epicenter=(50.0, 100.0),
            energy=0.8,
            event_type="modify"
        )


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
