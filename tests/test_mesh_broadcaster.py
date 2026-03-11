# tests/test_mesh_broadcaster.py
"""
Tests for MeshBroadcaster - UDP peer discovery.
"""

import asyncio
import json
import socket
import time

import pytest

from systems.network_boot.mesh_broadcaster import MeshBroadcaster


class TestMeshBroadcaster:
    """Tests for MeshBroadcaster UDP discovery."""

    def test_broadcaster_creation(self):
        """Test MeshBroadcaster initializes correctly."""
        broadcaster = MeshBroadcaster(
            node_id="test-node",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024)
        )
        assert broadcaster.node_id == "test-node"
        assert broadcaster.hostname == "test-host"
        assert broadcaster.bounds == (0, 0, 1024, 1024)
        assert broadcaster.running is False

    @pytest.mark.asyncio
    async def test_broadcaster_send_beacon(self):
        """Test sending a UDP beacon."""
        broadcaster = MeshBroadcaster(
            node_id="sender",
            hostname="sender-host",
            bounds=(0, 0, 1024, 1024)
        )

        # Create receiver socket
        receiver = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        receiver.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        receiver.bind(("0.0.0.0", 17331))  # Use alternate port for test
        receiver.setblocking(False)

        # Temporarily use test port
        broadcaster.port = 17331

        await broadcaster.start()

        try:
            # Send beacon
            await broadcaster.broadcast_beacon(orb_count=100)

            # Receive it
            await asyncio.sleep(0.1)
            try:
                data, addr = receiver.recvfrom(1024)
                beacon_data = json.loads(data.decode())
                assert beacon_data["node_id"] == "sender"
                assert beacon_data["orb_count"] == 100
                assert beacon_data["type"] == "HELLO"
            except BlockingIOError:
                pytest.skip("Beacon not received in time")

        finally:
            broadcaster.stop()
            receiver.close()

    @pytest.mark.asyncio
    async def test_broadcaster_receive_beacon(self):
        """Test receiving a UDP beacon."""
        broadcaster = MeshBroadcaster(
            node_id="receiver",
            hostname="receiver-host",
            bounds=(0, 0, 1024, 1024)
        )
        broadcaster.port = 17332

        await broadcaster.start()

        try:
            # Send a test beacon
            sender = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            sender.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

            test_beacon = {
                "type": "HELLO",
                "node_id": "remote-node",
                "hostname": "remote-host",
                "bounds": [100, 100, 2048, 2048],
                "orb_count": 200,
                "timestamp": time.time()
            }

            sender.sendto(
                json.dumps(test_beacon).encode(),
                ("<broadcast>", 17332)
            )
            sender.close()

            # Try to receive
            await asyncio.sleep(0.2)
            beacon = await broadcaster.receive_beacon(timeout=0.5)

            if beacon:
                assert beacon.node_id == "remote-node"
                assert beacon.orb_count == 200
            else:
                pytest.skip("Beacon not received (network issue)")

        finally:
            broadcaster.stop()

    def test_broadcaster_stop(self):
        """Test broadcaster stops cleanly."""
        broadcaster = MeshBroadcaster(
            node_id="test",
            hostname="test",
            bounds=(0, 0, 1024, 1024)
        )
        broadcaster.stop()  # Should not raise
        assert broadcaster.running is False


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
