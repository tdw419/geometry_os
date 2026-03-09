"""
Tests for PeerRegistry - tracks known nodes in the mesh.
"""

import pytest
import time
from systems.network_boot.peer_registry import PeerRegistry, Peer, NodeBeacon


class TestNodeBeacon:
    """Tests for NodeBeacon dataclass."""

    def test_beacon_creation(self):
        """Test NodeBeacon initializes correctly."""
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        assert beacon.node_id == "test-123"
        assert beacon.hostname == "test-host"
        assert beacon.bounds == (0, 0, 1024, 1024)
        assert beacon.orb_count == 100

    def test_beacon_to_dict(self):
        """Test NodeBeacon serialization."""
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=1709900000.0
        )
        d = beacon.to_dict()
        assert d["node_id"] == "test-123"
        assert d["bounds"] == [0, 0, 1024, 1024]

    def test_beacon_from_dict(self):
        """Test NodeBeacon deserialization."""
        d = {
            "node_id": "test-456",
            "hostname": "other-host",
            "bounds": [100, 100, 2048, 2048],
            "orb_count": 200,
            "timestamp": 1709900100.0
        }
        beacon = NodeBeacon.from_dict(d)
        assert beacon.node_id == "test-456"
        assert beacon.bounds == (100, 100, 2048, 2048)


class TestPeer:
    """Tests for Peer dataclass."""

    def test_peer_creation(self):
        """Test Peer initializes correctly."""
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        peer = Peer(beacon=beacon)
        assert peer.beacon == beacon
        assert peer.websocket is None
        assert peer.sync_active is False

    def test_peer_is_stale(self):
        """Test Peer staleness detection."""
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        peer = Peer(beacon=beacon, last_heartbeat=time.time() - 10)
        assert peer.is_stale(timeout=30) is False

        peer.last_heartbeat = time.time() - 35
        assert peer.is_stale(timeout=30) is True


class TestPeerRegistry:
    """Tests for PeerRegistry."""

    def test_registry_empty_on_start(self):
        """Test PeerRegistry starts empty."""
        registry = PeerRegistry()
        assert len(registry.peers) == 0

    def test_registry_add_peer_from_beacon(self):
        """Test adding peer from beacon."""
        registry = PeerRegistry()
        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon)
        assert "test-123" in registry.peers
        assert registry.peers["test-123"].beacon == beacon

    def test_registry_update_existing_peer(self):
        """Test updating existing peer."""
        registry = PeerRegistry()

        # Add initial beacon
        beacon1 = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon1)

        # Update with new orb count
        beacon2 = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=150,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon2)

        assert registry.peers["test-123"].beacon.orb_count == 150
        assert len(registry.peers) == 1

    def test_registry_remove_stale(self):
        """Test removing stale peers."""
        registry = PeerRegistry()

        # Add fresh peer
        beacon1 = NodeBeacon(
            node_id="fresh",
            hostname="fresh-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon1)

        # Add stale peer
        beacon2 = NodeBeacon(
            node_id="stale",
            hostname="stale-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=50,
            timestamp=time.time() - 35
        )
        registry.update_from_beacon(beacon2)
        registry.peers["stale"].last_heartbeat = time.time() - 35

        removed = registry.remove_stale()
        assert "stale" in removed
        assert "fresh" not in removed
        assert "fresh" in registry.peers
        assert "stale" not in registry.peers

    def test_registry_get_active_peers(self):
        """Test getting active (connected) peers."""
        registry = PeerRegistry()

        beacon = NodeBeacon(
            node_id="test-123",
            hostname="test-host",
            bounds=(0, 0, 1024, 1024),
            orb_count=100,
            timestamp=time.time()
        )
        registry.update_from_beacon(beacon)

        # Not active by default
        assert len(registry.get_active_peers()) == 0

        # Mark as active
        registry.peers["test-123"].sync_active = True
        assert len(registry.get_active_peers()) == 1

    def test_registry_get_peer_count(self):
        """Test getting peer count."""
        registry = PeerRegistry()

        for i in range(5):
            beacon = NodeBeacon(
                node_id=f"node-{i}",
                hostname=f"host-{i}",
                bounds=(0, 0, 1024, 1024),
                orb_count=100,
                timestamp=time.time()
            )
            registry.update_from_beacon(beacon)

        assert registry.get_peer_count() == 5


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
