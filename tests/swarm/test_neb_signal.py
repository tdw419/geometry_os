"""
Tests for NEBSignal - topic-based event signals.
"""

import pytest
from systems.swarm.neb_signal import NEBSignal


class TestNEBSignal:
    """Test NEBSignal data structure."""

    def test_create_neb_signal_with_topic(self):
        """NEBSignal has topic field in addition to base fields."""
        signal = NEBSignal(
            source_id="agent-001",
            topic="build.frontend.success",
            payload={"duration_ms": 1500}
        )
        assert signal.topic == "build.frontend.success"
        assert signal.source_id == "agent-001"
        assert signal.payload["duration_ms"] == 1500

    def test_neb_signal_serialization(self):
        """NEBSignal can be serialized to bytes for transmission."""
        signal = NEBSignal(
            source_id="agent-001",
            topic="task.available",
            payload={"task_id": "task-123"},
            embedding=[0.1, 0.2, 0.3]
        )
        data = signal.to_bytes()
        assert isinstance(data, bytes)

        recovered = NEBSignal.from_bytes(data)
        assert recovered.topic == "task.available"
        assert recovered.embedding == [0.1, 0.2, 0.3]

    def test_neb_signal_defaults(self):
        """NEBSignal has sensible defaults."""
        signal = NEBSignal(
            source_id="agent-001",
            topic="test.topic"
        )
        assert signal.payload == {}
        assert signal.embedding is None
        assert signal.timestamp > 0
