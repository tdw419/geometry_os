"""
Tests for NEBBus - Pub/Sub API for the Neural Event Bus.
"""

import pytest


class TestNEBBus:
    """Test NEBBus pub/sub API."""

    def test_publish_to_topic(self):
        """Publish and receive via wildcard subscription."""
        from systems.swarm.neb_bus import NEBBus

        bus = NEBBus(node_id="test-node-001")
        received = []

        # Subscribe with wildcard pattern
        bus.subscribe("build.*.success", lambda s: received.append(s))

        # Publish a signal
        signal = bus.publish(
            topic="build.frontend.success",
            payload={"duration_ms": 1500}
        )

        assert signal.topic == "build.frontend.success"
        assert signal.source_id == "test-node-001"
        assert len(received) == 1
        assert received[0].topic == "build.frontend.success"

    def test_publish_with_embedding(self):
        """Semantic matching via bus with embedding."""
        from systems.swarm.neb_bus import NEBBus

        bus = NEBBus(node_id="test-node-002")
        received = []

        # Subscribe semantically (filesystem errors)
        bus.subscribe_semantic(
            embedding=[0.9, 0.1, 0.0],
            callback=lambda s: received.append(s),
            threshold=0.8
        )

        # Publish with similar embedding
        bus.publish(
            topic="disk.read.failure",
            payload={"error": "IO error"},
            embedding=[0.85, 0.15, 0.05]
        )

        # Publish with dissimilar embedding
        bus.publish(
            topic="build.success",
            payload={"status": "ok"},
            embedding=[0.1, 0.9, 0.0]
        )

        assert len(received) == 1
        assert received[0].topic == "disk.read.failure"

    def test_list_active_subscriptions(self):
        """List all active subscriptions."""
        from systems.swarm.neb_bus import NEBBus

        bus = NEBBus(node_id="test-node-003")

        bus.subscribe("build.success", lambda s: None)
        bus.subscribe("task.**", lambda s: None)
        bus.subscribe_semantic([0.5, 0.5], lambda s: None, threshold=0.7)

        subs = bus.list_subscriptions()

        assert len(subs) == 3
        # Each entry is (subscription_id, pattern)
        patterns = [s[1] for s in subs]
        assert "build.success" in patterns
        assert "task.**" in patterns

    def test_unsubscribe_from_bus(self):
        """Unsubscribe from bus works correctly."""
        from systems.swarm.neb_bus import NEBBus

        bus = NEBBus(node_id="test-node-004")
        received = []

        sub_id = bus.subscribe("test.topic", lambda s: received.append(s))

        # First publish should be received
        bus.publish("test.topic", {"a": 1})
        assert len(received) == 1

        # Unsubscribe
        result = bus.unsubscribe(sub_id)
        assert result is True

        # Second publish should NOT be received
        bus.publish("test.topic", {"b": 2})
        assert len(received) == 1  # Still only 1

        # Unsubscribing again should return False
        result = bus.unsubscribe(sub_id)
        assert result is False
