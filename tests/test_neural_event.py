# tests/test_neural_event.py
"""
Tests for NeuralEvent data structure - hybrid symbolic/metabolic thought.

Part of Phase 27: Distributed Neural Memory
"""
import pytest
import numpy as np
from systems.evolution_daemon.neural_event import NeuralEvent, EventType


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
