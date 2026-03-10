"""
Tests for Memory Drift Engine.

Tests the core drift physics for KV-Cache entries.
"""

import time

import numpy as np
import pytest

from systems.memory_drift.drift_engine import DriftEngine, MemoryEntry


class TestMemoryEntry:
    """Tests for MemoryEntry dataclass."""

    def test_memory_entry_creation(self):
        """Test MemoryEntry initializes correctly."""
        vector = np.random.randn(64).astype(np.float32)
        entry = MemoryEntry(
            key="test_key",
            value={"data": "test"},
            position=(100.0, 200.0),
            semantic_vector=vector,
        )

        assert entry.key == "test_key"
        assert entry.value == {"data": "test"}
        assert entry.position == (100.0, 200.0)
        assert np.array_equal(entry.semantic_vector, vector)
        assert entry.access_count == 0
        assert len(entry.drift_history) == 1

    def test_memory_entry_drift_history_initialized(self):
        """Test drift history is initialized with starting position."""
        vector = np.random.randn(64).astype(np.float32)
        entry = MemoryEntry(
            key="test",
            value=1,
            position=(50.0, 75.0),
            semantic_vector=vector,
        )

        assert entry.drift_history == [(50.0, 75.0)]

    def test_memory_entry_to_dict(self):
        """Test MemoryEntry serialization to dictionary."""
        vector = np.array([1.0, 2.0, 3.0], dtype=np.float32)
        entry = MemoryEntry(
            key="test",
            value="data",
            position=(10.0, 20.0),
            semantic_vector=vector,
        )

        d = entry.to_dict()
        assert d["key"] == "test"
        assert d["value"] == "data"
        assert d["position"] == (10.0, 20.0)
        assert d["semantic_vector"] == [1.0, 2.0, 3.0]
        assert "last_access" in d
        assert "access_count" in d


class TestDriftEngine:
    """Tests for DriftEngine class."""

    def test_drift_engine_creation(self):
        """Test DriftEngine initializes with default parameters."""
        engine = DriftEngine()

        assert engine.drift_rate == 0.1
        assert engine.decay_rate == 0.5
        assert engine.bounds == (0.0, 0.0, 1000.0, 1000.0)
        assert len(engine.entries) == 0

    def test_drift_engine_custom_parameters(self):
        """Test DriftEngine with custom parameters."""
        engine = DriftEngine(
            drift_rate=0.2,
            decay_rate=0.3,
            bounds=(0.0, 0.0, 500.0, 500.0),
        )

        assert engine.drift_rate == 0.2
        assert engine.decay_rate == 0.3
        assert engine.bounds == (0.0, 0.0, 500.0, 500.0)

    def test_add_entry(self):
        """Test adding an entry to the engine."""
        engine = DriftEngine()
        vector = np.random.randn(64).astype(np.float32)

        entry = engine.add_entry(
            key="test_key",
            value={"data": "test"},
            semantic_vector=vector,
            initial_position=(100.0, 200.0),
        )

        assert isinstance(entry, MemoryEntry)
        assert entry.key == "test_key"
        assert len(engine.entries) == 1
        assert "test_key" in engine.entries

    def test_get_entry(self):
        """Test retrieving an entry by key."""
        engine = DriftEngine()
        vector = np.random.randn(64).astype(np.float32)

        engine.add_entry(
            key="test_key",
            value="test_value",
            semantic_vector=vector,
            initial_position=(0.0, 0.0),
        )

        entry = engine.get_entry("test_key")
        assert entry is not None
        assert entry.key == "test_key"

    def test_get_entry_not_found(self):
        """Test retrieving a non-existent entry."""
        engine = DriftEngine()

        entry = engine.get_entry("nonexistent")
        assert entry is None

    def test_access_entry(self):
        """Test accessing an entry updates access time and count."""
        engine = DriftEngine()
        vector = np.random.randn(64).astype(np.float32)

        engine.add_entry(
            key="test",
            value=1,
            semantic_vector=vector,
            initial_position=(0.0, 0.0),
        )

        original_access_count = engine.get_entry("test").access_count
        original_last_access = engine.get_entry("test").last_access

        # Small delay to ensure time difference
        time.sleep(0.01)

        entry = engine.access_entry("test")

        assert entry.access_count == original_access_count + 1
        assert entry.last_access > original_last_access

    def test_access_entry_not_found(self):
        """Test accessing a non-existent entry."""
        engine = DriftEngine()

        entry = engine.access_entry("nonexistent")
        assert entry is None


class TestDriftPhysics:
    """Tests for drift physics calculations."""

    def test_drift_toward_basic(self):
        """Test basic drift toward a target position."""
        engine = DriftEngine(drift_rate=0.5, decay_rate=0.0)
        vector = np.random.randn(64).astype(np.float32)

        engine.add_entry(
            key="test",
            value=1,
            semantic_vector=vector,
            initial_position=(0.0, 0.0),
        )

        # Access entry to reset last_access
        engine.access_entry("test")

        new_pos = engine.drift_toward("test", (100.0, 100.0))

        assert new_pos is not None
        # Should have moved toward target
        assert new_pos[0] > 0.0
        assert new_pos[1] > 0.0
        assert new_pos[0] < 100.0  # But not reached target
        assert new_pos[1] < 100.0

    def test_drift_toward_respects_bounds(self):
        """Test drift respects spatial bounds."""
        engine = DriftEngine(bounds=(0.0, 0.0, 100.0, 100.0))
        vector = np.random.randn(64).astype(np.float32)

        engine.add_entry(
            key="test",
            value=1,
            semantic_vector=vector,
            initial_position=(50.0, 50.0),
        )

        # Try to drift outside bounds
        new_pos = engine.drift_toward("test", (200.0, 200.0), similarity=1.0)

        assert new_pos is not None
        assert new_pos[0] <= 100.0
        assert new_pos[1] <= 100.0

    def test_drift_toward_updates_history(self):
        """Test drift updates the drift history."""
        engine = DriftEngine()
        vector = np.random.randn(64).astype(np.float32)

        engine.add_entry(
            key="test",
            value=1,
            semantic_vector=vector,
            initial_position=(0.0, 0.0),
        )

        initial_history_len = len(engine.get_entry("test").drift_history)

        engine.drift_toward("test", (100.0, 100.0))

        new_history_len = len(engine.get_entry("test").drift_history)
        assert new_history_len == initial_history_len + 1

    def test_drift_toward_nonexistent_entry(self):
        """Test drift toward with non-existent entry returns None."""
        engine = DriftEngine()

        result = engine.drift_toward("nonexistent", (100.0, 100.0))
        assert result is None


class TestBatchDrift:
    """Tests for batch drift operations."""

    def test_batch_drift_basic(self):
        """Test batch drift toward code tiles."""
        engine = DriftEngine()

        # Add entries
        for i in range(3):
            vector = np.zeros(64, dtype=np.float32)
            vector[i] = 1.0  # Different vector for each
            engine.add_entry(
                key=f"entry_{i}",
                value=i,
                semantic_vector=vector,
                initial_position=(0.0, 0.0),
            )

        # Add code tiles with matching vectors
        code_tiles = [
            ((100, 100), np.array([1.0] + [0.0] * 63, dtype=np.float32)),
            ((200, 200), np.array([0.0, 1.0] + [0.0] * 62, dtype=np.float32)),
            ((300, 300), np.array([0.0, 0.0, 1.0] + [0.0] * 61, dtype=np.float32)),
        ]

        results = engine.batch_drift(code_tiles=code_tiles)

        assert len(results) == 3
        for key in ["entry_0", "entry_1", "entry_2"]:
            assert key in results

    def test_batch_drift_with_similarity_threshold(self):
        """Test batch drift respects similarity threshold."""
        engine = DriftEngine()

        vector = np.random.randn(64).astype(np.float32)
        engine.add_entry(
            key="test",
            value=1,
            semantic_vector=vector,
            initial_position=(0.0, 0.0),
        )

        # Code tile with orthogonal vector (low similarity)
        orthogonal_vector = np.roll(vector, 32)  # Shift to reduce similarity
        code_tiles = [((100, 100), orthogonal_vector)]

        # High threshold should prevent drift
        results = engine.batch_drift(code_tiles=code_tiles, min_similarity=0.99)
        assert len(results) == 0

    def test_batch_drift_empty_code_tiles(self):
        """Test batch drift with no code tiles."""
        engine = DriftEngine()

        vector = np.random.randn(64).astype(np.float32)
        engine.add_entry(
            key="test",
            value=1,
            semantic_vector=vector,
            initial_position=(0.0, 0.0),
        )

        results = engine.batch_drift(code_tiles=[])
        assert len(results) == 0


class TestSpatialQueries:
    """Tests for spatial query operations."""

    def test_get_entries_in_region(self):
        """Test retrieving entries within a region."""
        engine = DriftEngine()

        for i in range(5):
            vector = np.random.randn(64).astype(np.float32)
            engine.add_entry(
                key=f"entry_{i}",
                value=i,
                semantic_vector=vector,
                initial_position=(float(i * 100), float(i * 100)),
            )

        # Query region that should contain entries 1, 2
        entries = engine.get_entries_in_region(50, 50, 250, 250)

        assert len(entries) == 2
        keys = [e.key for e in entries]
        assert "entry_1" in keys
        assert "entry_2" in keys

    def test_get_entries_in_region_empty(self):
        """Test querying an empty region."""
        engine = DriftEngine()

        vector = np.random.randn(64).astype(np.float32)
        engine.add_entry(
            key="test",
            value=1,
            semantic_vector=vector,
            initial_position=(500.0, 500.0),
        )

        entries = engine.get_entries_in_region(0, 0, 100, 100)
        assert len(entries) == 0

    def test_get_entries_in_region_boundary(self):
        """Test entries on region boundary are included."""
        engine = DriftEngine()

        vector = np.random.randn(64).astype(np.float32)
        engine.add_entry(
            key="boundary",
            value=1,
            semantic_vector=vector,
            initial_position=(100.0, 100.0),
        )

        entries = engine.get_entries_in_region(0, 0, 100, 100)
        assert len(entries) == 1


class TestDriftEngineUtilities:
    """Tests for utility methods."""

    def test_remove_entry(self):
        """Test removing an entry."""
        engine = DriftEngine()

        vector = np.random.randn(64).astype(np.float32)
        engine.add_entry(
            key="test",
            value=1,
            semantic_vector=vector,
            initial_position=(0.0, 0.0),
        )

        assert len(engine.entries) == 1

        result = engine.remove_entry("test")
        assert result is True
        assert len(engine.entries) == 0

    def test_remove_entry_not_found(self):
        """Test removing a non-existent entry."""
        engine = DriftEngine()

        result = engine.remove_entry("nonexistent")
        assert result is False

    def test_clear(self):
        """Test clearing all entries."""
        engine = DriftEngine()

        for i in range(5):
            vector = np.random.randn(64).astype(np.float32)
            engine.add_entry(
                key=f"entry_{i}",
                value=i,
                semantic_vector=vector,
                initial_position=(0.0, 0.0),
            )

        assert len(engine.entries) == 5

        engine.clear()
        assert len(engine.entries) == 0

    def test_get_statistics(self):
        """Test getting engine statistics."""
        engine = DriftEngine()

        stats = engine.get_statistics()
        assert stats["entry_count"] == 0
        assert stats["avg_access_count"] == 0.0

        # Add and access entries
        for i in range(3):
            vector = np.random.randn(64).astype(np.float32)
            engine.add_entry(
                key=f"entry_{i}",
                value=i,
                semantic_vector=vector,
                initial_position=(0.0, 0.0),
            )
            engine.access_entry(f"entry_{i}")

        stats = engine.get_statistics()
        assert stats["entry_count"] == 3
        assert stats["total_access_count"] == 3
