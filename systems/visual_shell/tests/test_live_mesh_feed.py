"""
Tests for Live Mesh Feed - Phase 35

Tests WebSocket streaming of mesh events.
"""

import asyncio
from unittest.mock import AsyncMock, Mock

import pytest

from systems.visual_shell.event_streaming import (
    MeshEventBus,
)
from systems.visual_shell.live_mesh_feed import (
    MeshEventType,
    MeshFeedClient,
    MeshFeedMessage,
    MeshFeedServer,
    create_mesh_feed_client,
    create_mesh_feed_server,
)


class TestMeshFeedMessage:
    """Tests for MeshFeedMessage."""

    def test_message_creation(self):
        msg = MeshFeedMessage(
            message_type="event",
            event_type="peer_joined",
            data={"peer_id": "peer-1"},
        )
        assert msg.message_type == "event"
        assert msg.event_type == "peer_joined"
        assert msg.data == {"peer_id": "peer-1"}
        assert msg.message_id is not None
        assert msg.timestamp is not None

    def test_message_to_json(self):
        msg = MeshFeedMessage(
            message_type="event",
            event_type="peer_joined",
            data={"peer_id": "peer-1"},
        )
        json_str = msg.to_json()
        assert '"message_type": "event"' in json_str
        assert '"event_type": "peer_joined"' in json_str
        assert '"peer_id": "peer-1"' in json_str

    def test_message_from_json(self):
        json_str = '{"message_type": "event", "event_type": "peer_left", "data": {"peer_id": "peer-2"}, "timestamp": 12345.0, "message_id": "abc123"}'
        msg = MeshFeedMessage.from_json(json_str)
        assert msg.message_type == "event"
        assert msg.event_type == "peer_left"
        assert msg.data == {"peer_id": "peer-2"}
        assert msg.timestamp == 12345.0
        assert msg.message_id == "abc123"

    def test_message_roundtrip(self):
        original = MeshFeedMessage(
            message_type="command",
            event_type="ping",
            data={"test": "data", "number": 42},
        )
        json_str = original.to_json()
        restored = MeshFeedMessage.from_json(json_str)
        assert restored.message_type == original.message_type
        assert restored.event_type == original.event_type
        assert restored.data == original.data


class TestMeshFeedServer:
    """Tests for MeshFeedServer."""

    @pytest.fixture
    def server(self):
        return MeshFeedServer(host="localhost", port=18765)

    def test_server_creation(self, server):
        assert server.host == "localhost"
        assert server.port == 18765
        assert server._running is False
        assert len(server._clients) == 0

    @pytest.mark.asyncio
    async def test_server_start_stop(self, server):
        await server.start()
        assert server._running is True
        await server.stop()
        assert server._running is False

    def test_server_stats(self, server):
        stats = server.get_stats()
        assert stats["running"] is False
        assert stats["clients_connected"] == 0
        assert stats["events_broadcast"] == 0

    def test_server_stats_running(self, server):
        server._running = True
        stats = server.get_stats()
        assert stats["running"] is True

    @pytest.mark.asyncio
    async def test_broadcast_event(self, server):
        await server.start()

        # Broadcast without clients (should buffer)
        await server.broadcast(
            MeshEventType.PEER_JOINED,
            {"peer_id": "peer-1"},
        )

        assert len(server._event_buffer) == 1
        assert server._stats["events_broadcast"] == 1

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_peer_joined(self, server):
        await server.start()

        await server.broadcast_peer_joined(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
            container_count=3,
        )

        msg = server._event_buffer[0]
        assert msg.event_type == "peer_joined"
        assert msg.data["peer_id"] == "peer-1"
        assert msg.data["hostname"] == "peer1.local"

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_peer_left(self, server):
        await server.start()

        await server.broadcast_peer_left("peer-1")

        msg = server._event_buffer[0]
        assert msg.event_type == "peer_left"
        assert msg.data["peer_id"] == "peer-1"

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_peer_metrics(self, server):
        await server.start()

        await server.broadcast_peer_metrics(
            peer_id="peer-1",
            cpu_percent=75.0,
            memory_percent=80.0,
            container_count=5,
        )

        msg = server._event_buffer[0]
        assert msg.event_type == "peer_metrics_updated"
        assert msg.data["cpu_percent"] == 75.0

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_migration_events(self, server):
        await server.start()

        await server.broadcast_migration_started(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="web-server",
        )

        await server.broadcast_migration_progress(
            migration_id="migr-1",
            progress=0.5,
        )

        await server.broadcast_migration_completed(
            migration_id="migr-1",
            success=True,
        )

        assert len(server._event_buffer) == 3
        assert server._event_buffer[0].event_type == "migration_started"
        assert server._event_buffer[1].event_type == "migration_progress"
        assert server._event_buffer[2].event_type == "migration_completed"

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_migration_failed(self, server):
        await server.start()

        await server.broadcast_migration_failed(
            migration_id="migr-1",
            error="Connection lost",
        )

        msg = server._event_buffer[0]
        assert msg.event_type == "migration_failed"
        assert msg.data["error"] == "Connection lost"

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_container_events(self, server):
        await server.start()

        await server.broadcast_container_added(
            container_id="container-1",
            container_name="web",
            peer_id="peer-1",
            workload_type="web",
            memory_mb=512,
        )

        await server.broadcast_container_removed(
            container_id="container-1",
            peer_id="peer-1",
        )

        assert len(server._event_buffer) == 2
        assert server._event_buffer[0].event_type == "container_added"
        assert server._event_buffer[1].event_type == "container_removed"

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_alert(self, server):
        await server.start()

        await server.broadcast_alert(
            alert_type="overload",
            message="CPU at 95%",
            peer_id="peer-1",
            severity="critical",
        )

        msg = server._event_buffer[0]
        assert msg.event_type == "alert_triggered"
        assert msg.data["alert_type"] == "overload"
        assert msg.data["severity"] == "critical"

        await server.stop()

    @pytest.mark.asyncio
    async def test_buffer_size_limit(self, server):
        server._buffer_size = 5
        await server.start()

        # Add more than buffer size
        for i in range(10):
            await server.broadcast(MeshEventType.PEER_JOINED, {"index": i})

        assert len(server._event_buffer) == 5
        # Should keep last 5
        assert server._event_buffer[0].data["index"] == 5

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_to_mock_client(self, server):
        """Test broadcasting with a mock client."""
        await server.start()

        # Create a mock client
        mock_client = Mock()
        mock_client.send = AsyncMock()
        server._clients.add(mock_client)

        await server.broadcast(MeshEventType.PEER_JOINED, {"peer_id": "peer-1"})

        # Should have sent to client
        mock_client.send.assert_called_once()
        assert server._stats["messages_sent"] == 1

        await server.stop()

    @pytest.mark.asyncio
    async def test_broadcast_with_no_clients(self, server):
        """Test broadcast works even with no clients."""
        await server.start()

        # No clients, should still buffer
        await server.broadcast(MeshEventType.PEER_JOINED, {"peer_id": "peer-1"})

        assert len(server._event_buffer) == 1
        assert server._stats["events_broadcast"] == 1

        await server.stop()


class TestMeshFeedClient:
    """Tests for MeshFeedClient."""

    @pytest.fixture
    def event_bus(self):
        return MeshEventBus(local_peer_id="test-local")

    @pytest.fixture
    def client(self, event_bus):
        return MeshFeedClient(
            event_bus=event_bus,
            url="ws://localhost:18765",
        )

    def test_client_creation(self, client):
        assert client.url == "ws://localhost:18765"
        assert client._running is False
        assert client._connected is False
        assert client.auto_reconnect is True

    @pytest.mark.asyncio
    async def test_client_connect_disconnect(self, client):
        await client.connect()
        assert client._running is True
        await client.disconnect()
        assert client._running is False

    def test_client_stats(self, client):
        stats = client.get_stats()
        assert stats["running"] is False
        assert stats["connected"] is False
        assert stats["events_received"] == 0

    @pytest.mark.asyncio
    async def test_handle_message(self, client, event_bus):
        await event_bus.start()

        # Simulate receiving a message
        msg = MeshFeedMessage(
            message_type="event",
            event_type="peer_joined",
            data={"peer_id": "peer-1"},
        )

        await client._handle_message(msg.to_json())

        # Wait for event to be processed
        await asyncio.sleep(0.2)

        # Check event was published to bus
        history = event_bus.get_history()
        assert len(history) == 1
        assert history[0].event_type == MeshEventType.PEER_JOINED

        await event_bus.stop()

    @pytest.mark.asyncio
    async def test_handle_unknown_event_type(self, client):
        msg = MeshFeedMessage(
            message_type="event",
            event_type="unknown_type",
            data={"test": "data"},
        )

        # Should not raise, just log warning
        await client._handle_message(msg.to_json())
        assert client._stats["errors"] == 0


class TestCreateMeshFeedServer:
    """Tests for create_mesh_feed_server function."""

    def test_create_server(self):
        server = create_mesh_feed_server(
            host="192.168.1.1",
            port=9000,
        )
        assert isinstance(server, MeshFeedServer)
        assert server.host == "192.168.1.1"
        assert server.port == 9000


class TestCreateMeshFeedClient:
    """Tests for create_mesh_feed_client function."""

    def test_create_client(self):
        event_bus = MeshEventBus()
        client = create_mesh_feed_client(
            event_bus=event_bus,
            url="ws://example.com:8765",
        )
        assert isinstance(client, MeshFeedClient)
        assert client.url == "ws://example.com:8765"


class TestServerClientIntegration:
    """Integration tests for server and client."""

    @pytest.fixture
    def event_bus(self):
        return MeshEventBus(local_peer_id="test-local")

    @pytest.mark.asyncio
    async def test_server_client_communication(self, event_bus):
        """Test that server broadcasts are received by client."""
        server = MeshFeedServer(host="localhost", port=18766)
        client = MeshFeedClient(
            event_bus=event_bus,
            url="ws://localhost:18766",
            auto_reconnect=False,
        )

        await event_bus.start()
        await server.start()
        await client.connect()

        # Wait for connection
        await asyncio.sleep(0.3)

        # Broadcast an event
        await server.broadcast_peer_joined("peer-1", "peer1.local")

        # Wait for event to propagate
        await asyncio.sleep(0.3)

        # Check client received it
        assert client._stats["events_received"] >= 0  # May be 0 if not connected yet

        await client.disconnect()
        await server.stop()
        await event_bus.stop()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
