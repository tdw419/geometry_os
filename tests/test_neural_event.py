# tests/test_neural_event.py
"""
Tests for NeuralEvent data structure - hybrid symbolic/metabolic thought.

Part of Phase 27: Distributed Neural Memory
"""
import numpy as np

from systems.evolution_daemon.neural_event import EventType, NeuralEvent


def test_create_neural_event():
    """Test creating a basic neural event."""
    event = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["ls", "-la", "/home"],
        cpu_jitter=0.15,
        memory_delta=0.02,
        io_frequency=10.5
    )
    assert event.tile_id == "alpine-01"
    assert event.shell_tokens == ["ls", "-la", "/home"]
    assert event.event_type == EventType.CODE_DISCOVERY


def test_event_vector_generation():
    """Test that event generates embedding vector."""
    event = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["grep", "-r", "pattern"],
        cpu_jitter=0.5,
        memory_delta=0.1,
        io_frequency=50.0
    )
    assert event.event_vector is not None
    assert len(event.event_vector) == 384
    # Vector should be normalized
    assert abs(np.linalg.norm(event.event_vector) - 1.0) < 0.01


def test_event_type_classification():
    """Test automatic event type classification."""
    # High IO -> RESOURCE_PRESSURE
    event1 = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["cat", "file.txt"],
        cpu_jitter=0.1,
        memory_delta=0.01,
        io_frequency=100.0  # High IO
    )
    assert event1.event_type == EventType.RESOURCE_PRESSURE

    # Normal -> CODE_DISCOVERY
    event2 = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["ls", "-la"],
        cpu_jitter=0.05,
        memory_delta=0.01,
        io_frequency=5.0
    )
    assert event2.event_type == EventType.CODE_DISCOVERY


def test_event_serialization():
    """Test event can be serialized for WebSocket."""
    event = NeuralEvent(
        tile_id="alpine-01",
        shell_tokens=["echo", "hello"],
        cpu_jitter=0.1,
        memory_delta=0.02,
        io_frequency=10.0
    )
    data = event.to_dict()
    assert "tile_id" in data
    assert "event_vector" in data
    assert isinstance(data["event_vector"], list)


def test_event_from_tile_metrics():
    """Test creating event from tile metrics."""
    metrics = {
        "cpu": 45.0,
        "memory": 128,
        "uptime": 60
    }
    console_lines = [
        {"text": "root@alpine:~# ls -la"},
        {"text": "total 32"},
        {"text": "drwxr-xr-x  2 root root 4096"}
    ]

    event = NeuralEvent.from_tile_data(
        tile_id="alpine-01",
        district="substrate",
        metrics=metrics,
        console_lines=console_lines
    )
    assert event is not None
    assert event.district_id == "substrate"


def test_event_from_dict():
    """Test deserializing event from dict."""
    data = {
        "tile_id": "alpine-02",
        "shell_tokens": ["cat", "/etc/hosts"],
        "cpu_jitter": 0.25,
        "memory_delta": 0.05,
        "io_frequency": 15.0,
        "event_id": "test-event-123",
        "broadcast": True,
        "event_type": "code_discovery"
    }

    event = NeuralEvent.from_dict(data)

    assert event.tile_id == "alpine-02"
    assert event.shell_tokens == ["cat", "/etc/hosts"]
    assert event.cpu_jitter == 0.25
    assert event.memory_delta == 0.05
    assert event.io_frequency == 15.0
    assert event.event_id == "test-event-123"
    assert event.broadcast is True
    assert event.event_type == EventType.CODE_DISCOVERY


def test_event_from_dict_without_optional_fields():
    """Test deserializing event without optional fields."""
    data = {
        "tile_id": "alpine-03",
        "shell_tokens": ["ls"],
        "cpu_jitter": 0.1,
        "memory_delta": 0.01,
        "io_frequency": 5.0
    }

    event = NeuralEvent.from_dict(data)

    assert event.tile_id == "alpine-03"
    assert event.broadcast is False  # Default
    assert event.event_type == EventType.CODE_DISCOVERY  # Default


def test_event_from_dict_with_event_type():
    """Test deserializing event with different event types."""
    data = {
        "tile_id": "alpine-04",
        "shell_tokens": [],
        "cpu_jitter": 0.8,
        "memory_delta": 0.5,
        "io_frequency": 100.0,
        "event_type": "resource_pressure"
    }

    event = NeuralEvent.from_dict(data)

    assert event.event_type == EventType.RESOURCE_PRESSURE


def test_event_from_tile_data_empty_console():
    """Test creating event from tile with empty console."""
    metrics = {
        "cpu": 10.0,
        "memory": 64,
        "uptime": 10
    }

    event = NeuralEvent.from_tile_data(
        tile_id="alpine-05",
        district="test",
        metrics=metrics,
        console_lines=[]
    )

    assert event is not None
    assert event.tile_id == "alpine-05"


def test_event_from_tile_data_high_cpu():
    """Test creating event with high CPU jitter."""
    metrics = {
        "cpu": 95.0,  # High CPU
        "memory": 512,
        "uptime": 300
    }
    console_lines = [{"text": "compiling..."}]

    event = NeuralEvent.from_tile_data(
        tile_id="alpine-06",
        district="build",
        metrics=metrics,
        console_lines=console_lines
    )

    assert event is not None
    # cpu_jitter = (cpu % 30) / 100.0, so 95.0 -> 5.0 / 100.0 = 0.05
    assert event.cpu_jitter > 0.0
    assert event.cpu_jitter == (95.0 % 30) / 100.0


def test_event_from_tile_data_high_memory():
    """Test creating event with high memory usage."""
    metrics = {
        "cpu": 20.0,
        "memory": 900,  # High memory (MB)
        "uptime": 120
    }
    console_lines = [{"text": "loading data..."}]

    event = NeuralEvent.from_tile_data(
        tile_id="alpine-07",
        district="data",
        metrics=metrics,
        console_lines=console_lines
    )

    assert event is not None
    # High memory should result in higher memory_delta
    assert event.memory_delta > 0.5


def test_event_to_dict_roundtrip():
    """Test that to_dict and from_dict are inverses."""
    original = NeuralEvent(
        tile_id="alpine-08",
        shell_tokens=["echo", "test"],
        cpu_jitter=0.33,
        memory_delta=0.11,
        io_frequency=22.0,
        district_id="roundtrip"
    )
    original.broadcast = True

    data = original.to_dict()
    restored = NeuralEvent.from_dict(data)

    assert restored.tile_id == original.tile_id
    assert restored.shell_tokens == original.shell_tokens
    assert abs(restored.cpu_jitter - original.cpu_jitter) < 0.01
    assert abs(restored.memory_delta - original.memory_delta) < 0.01
    assert abs(restored.io_frequency - original.io_frequency) < 0.01
    assert restored.broadcast == original.broadcast
