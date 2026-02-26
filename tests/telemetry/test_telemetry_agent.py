"""Tests for TelemetryAgent NEB integration."""

import pytest
import time

from systems.telemetry.telemetry_agent import TelemetryAgent, SatellitePosition


class TestTelemetryAgent:
    """Tests for TelemetryAgent class."""

    def test_agent_initialization(self):
        """Agent initializes with NEB connection."""
        agent = TelemetryAgent(node_id="test-telemetry-agent")

        assert agent.node_id == "test-telemetry-agent"
        assert agent.neb_bus is not None
        assert agent.neb_bus.node_id == "test-telemetry-agent"
        assert agent._satellite_cache == {}

    def test_publish_satellite_position(self):
        """Agent publishes satellite position to NEB on topic orbital.satellite.{norad_id}."""
        agent = TelemetryAgent(node_id="test-agent")

        # Track received signals
        received = []

        # Subscribe to all satellite topics
        agent.neb_bus.subscribe(
            "orbital.satellite.*",
            lambda signal: received.append(signal)
        )

        # Publish a satellite position
        agent.publish_satellite_position(
            norad_id=25544,  # ISS
            name="ISS (ZARYA)",
            lat=30.0,
            lon=-97.0,
            alt_km=420.0,
            velocity=7.66,
            priority=5
        )

        # Verify signal was published
        assert len(received) == 1
        signal = received[0]

        # Verify topic format
        assert signal.topic == "orbital.satellite.25544"

        # Verify payload
        assert signal.payload["norad_id"] == 25544
        assert signal.payload["name"] == "ISS (ZARYA)"
        assert signal.payload["latitude"] == 30.0
        assert signal.payload["longitude"] == -97.0
        assert signal.payload["altitude_km"] == 420.0
        assert signal.payload["velocity_kmps"] == 7.66
        assert signal.payload["cpu_priority"] == 5

    def test_publish_satellite_position_caches_data(self):
        """Published satellite positions are cached."""
        agent = TelemetryAgent(node_id="test-agent")

        agent.publish_satellite_position(
            norad_id=25544,
            name="ISS",
            lat=30.0,
            lon=-97.0,
            alt_km=420.0,
            velocity=7.66
        )

        # Verify cache
        assert 25544 in agent._satellite_cache
        cached = agent._satellite_cache[25544]

        assert isinstance(cached, SatellitePosition)
        assert cached.norad_id == 25544
        assert cached.name == "ISS"
        assert cached.latitude == 30.0
        assert cached.longitude == -97.0

    def test_map_process_to_satellite(self):
        """Map a system process to a virtual satellite."""
        agent = TelemetryAgent(node_id="test-agent")

        # Map process with high priority to "higher altitude"
        position = agent.map_process_to_satellite(
            process_id=1234,
            process_name="python",
            cpu_priority=10,
            memory_bandwidth=1000.0
        )

        assert isinstance(position, SatellitePosition)
        # Process ID becomes NORAD ID (negative to distinguish from real satellites)
        assert position.norad_id == -1234
        assert position.name == "process:python"
        # CPU priority maps to altitude (scaled)
        assert position.altitude_km > 0
        # Memory bandwidth maps to velocity
        assert position.velocity_kmps > 0
        # cpu_priority and memory_bandwidth stored for reference
        assert position.cpu_priority == 10
        assert position.memory_bandwidth == 1000.0

    def test_map_process_to_satellite_priority_altitude_mapping(self):
        """Higher priority processes map to higher altitude."""
        agent = TelemetryAgent(node_id="test-agent")

        low_priority = agent.map_process_to_satellite(
            process_id=1,
            process_name="background",
            cpu_priority=1,
            memory_bandwidth=100.0
        )

        high_priority = agent.map_process_to_satellite(
            process_id=2,
            process_name="critical",
            cpu_priority=100,
            memory_bandwidth=100.0
        )

        # Higher priority should result in higher altitude
        assert high_priority.altitude_km > low_priority.altitude_km

    def test_map_process_to_satellite_bandwidth_velocity_mapping(self):
        """Higher memory bandwidth maps to higher velocity."""
        agent = TelemetryAgent(node_id="test-agent")

        low_bandwidth = agent.map_process_to_satellite(
            process_id=1,
            process_name="idle",
            cpu_priority=10,
            memory_bandwidth=10.0
        )

        high_bandwidth = agent.map_process_to_satellite(
            process_id=2,
            process_name="streaming",
            cpu_priority=10,
            memory_bandwidth=10000.0
        )

        # Higher bandwidth should result in higher velocity
        assert high_bandwidth.velocity_kmps > low_bandwidth.velocity_kmps

    def test_get_cached_satellite(self):
        """Get cached satellite by NORAD ID."""
        agent = TelemetryAgent(node_id="test-agent")

        agent.publish_satellite_position(
            norad_id=25544,
            name="ISS",
            lat=30.0,
            lon=-97.0,
            alt_km=420.0,
            velocity=7.66
        )

        cached = agent.get_cached_satellite(25544)
        assert cached is not None
        assert cached.name == "ISS"

        # Non-existent satellite returns None
        assert agent.get_cached_satellite(99999) is None

    def test_publish_process_as_satellite(self):
        """Convenience method to publish process as virtual satellite."""
        agent = TelemetryAgent(node_id="test-agent")

        received = []
        agent.neb_bus.subscribe(
            "orbital.process.*",
            lambda signal: received.append(signal)
        )

        agent.publish_process(
            process_id=1234,
            process_name="nginx",
            cpu_priority=50,
            memory_bandwidth=500.0
        )

        assert len(received) == 1
        signal = received[0]

        # Verify topic format for processes
        assert signal.topic == "orbital.process.1234"
        assert signal.payload["norad_id"] == -1234  # Negative to mark as virtual
        assert signal.payload["name"] == "process:nginx"
