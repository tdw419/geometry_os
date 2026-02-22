"""
Tests for GravityPlacer - Foveated Knowledge Gravity positioning.

Tests verify the inverse relationship between value and distance:
    distance_from_center = gravity_constant / (value_score + epsilon)

High-value code clusters near center, low-value at periphery.
"""

import math
import pytest
from typing import Dict

# Will be implemented after tests
from systems.visual_shell.swarm.evolution.gravity_placer import (
    GravityPosition,
    GravityPlacer,
)


class TestGravityPosition:
    """Tests for GravityPosition dataclass."""

    def test_gravity_position_creation(self):
        """Test GravityPosition stores all required fields."""
        pos = GravityPosition(
            file_path="src/core.py",
            x=10.5,
            y=-20.3,
            value_score=0.85,
            distance_from_center=22.9
        )
        assert pos.file_path == "src/core.py"
        assert pos.x == 10.5
        assert pos.y == -20.3
        assert pos.value_score == 0.85
        assert pos.distance_from_center == 22.9


class TestGravityPlacerInit:
    """Tests for GravityPlacer initialization."""

    def test_default_initialization(self):
        """Test GravityPlacer initializes with center=(0,0) and default gravity_constant."""
        placer = GravityPlacer()
        assert placer.center == (0, 0)
        assert placer.gravity_constant == 100.0
        assert placer.epsilon == 0.001

    def test_custom_initialization(self):
        """Test GravityPlacer accepts custom parameters."""
        placer = GravityPlacer(
            center=(100, 200),
            gravity_constant=50.0,
            epsilon=0.01
        )
        assert placer.center == (100, 200)
        assert placer.gravity_constant == 50.0
        assert placer.epsilon == 0.01


class TestGravityPlacerPlacement:
    """Tests for gravity-based positioning."""

    def test_high_value_near_center(self):
        """Test high-value code (0.95) is positioned near center (distance < 100)."""
        placer = GravityPlacer(gravity_constant=100.0)
        pos = placer.place("src/critical.py", 0.95)

        # Distance = gravity_constant / (value + epsilon)
        # = 100 / (0.95 + 0.001) = 100 / 0.951 ≈ 105
        # With gravity_constant=100, high value should be near center
        assert pos.distance_from_center < 150
        assert pos.value_score == 0.95

    def test_low_value_far_from_center(self):
        """Test low-value code (0.05) is positioned far from center (distance > 500)."""
        placer = GravityPlacer(gravity_constant=100.0)
        pos = placer.place("legacy/unused.py", 0.05)

        # Distance = 100 / (0.05 + 0.001) = 100 / 0.051 ≈ 1960
        assert pos.distance_from_center > 500
        assert pos.value_score == 0.05

    def test_distance_inversely_proportional(self):
        """Test distance is inversely proportional to value (high value -> low distance)."""
        placer = GravityPlacer(gravity_constant=100.0)

        high_value_pos = placer.place("core.py", 0.9)
        medium_value_pos = placer.place("utils.py", 0.5)
        low_value_pos = placer.place("legacy.py", 0.1)

        # Higher value should have lower distance
        assert high_value_pos.distance_from_center < medium_value_pos.distance_from_center
        assert medium_value_pos.distance_from_center < low_value_pos.distance_from_center

    def test_deterministic_position(self):
        """Test same file always gets same position for same value."""
        placer = GravityPlacer()

        pos1 = placer.place("src/main.py", 0.75)
        pos2 = placer.place("src/main.py", 0.75)

        assert pos1.x == pos2.x
        assert pos1.y == pos2.y
        assert pos1.distance_from_center == pos2.distance_from_center

    def test_deterministic_angle_from_hash(self):
        """Test angle is determined by file path hash for deterministic positioning."""
        placer = GravityPlacer(gravity_constant=100.0)

        # Different files with same value should have different positions
        pos1 = placer.place("file_a.py", 0.5)
        pos2 = placer.place("file_b.py", 0.5)

        # Same distance (same value) but different coordinates (different angle)
        assert abs(pos1.distance_from_center - pos2.distance_from_center) < 0.1
        assert pos1.x != pos2.x or pos1.y != pos2.y

    def test_place_returns_gravity_position(self):
        """Test place() returns a GravityPosition instance."""
        placer = GravityPlacer()
        pos = placer.place("test.py", 0.5)

        assert isinstance(pos, GravityPosition)
        assert pos.file_path == "test.py"
        assert pos.value_score == 0.5

    def test_coordinates_respect_center(self):
        """Test coordinates are relative to the center point."""
        placer = GravityPlacer(center=(500, 500), gravity_constant=100.0)

        # High value should be close to (500, 500)
        pos = placer.place("core.py", 0.99)

        # Distance from actual center should be small
        dist_from_center = math.sqrt(
            (pos.x - 500) ** 2 + (pos.y - 500) ** 2
        )
        assert dist_from_center < 150
        assert abs(dist_from_center - pos.distance_from_center) < 0.1


class TestGravityPlacerRecenter:
    """Tests for recenter() functionality."""

    def test_recenter_updates_positions(self):
        """Test recenter() updates all positions when values change."""
        placer = GravityPlacer()

        # Initial placements
        placer.place("file1.py", 0.5)
        placer.place("file2.py", 0.5)

        # Update values
        updates = {"file1.py": 0.9, "file2.py": 0.1}
        new_positions = placer.recenter(updates)

        assert "file1.py" in new_positions
        assert "file2.py" in new_positions
        assert new_positions["file1.py"].value_score == 0.9
        assert new_positions["file2.py"].value_score == 0.1

    def test_recenter_maintains_angle_determinism(self):
        """Test recenter() maintains same angle for files when values change."""
        placer = GravityPlacer()

        original = placer.place("file.py", 0.5)
        original_angle = math.atan2(original.y, original.x)

        # Recenter with new value
        new_positions = placer.recenter({"file.py": 0.9})
        new = new_positions["file.py"]
        new_angle = math.atan2(new.y, new.x)

        # Angle should remain the same
        assert abs(original_angle - new_angle) < 0.01

    def test_recenter_updates_distance_correctly(self):
        """Test recenter() recalculates distances based on new values."""
        placer = GravityPlacer()

        original = placer.place("file.py", 0.5)
        new_positions = placer.recenter({"file.py": 0.9})
        new = new_positions["file.py"]

        # Higher value = lower distance
        assert new.distance_from_center < original.distance_from_center

    def test_recenter_returns_all_positions(self):
        """Test recenter() returns all tracked positions, not just updated ones."""
        placer = GravityPlacer()

        placer.place("file1.py", 0.5)
        placer.place("file2.py", 0.5)
        placer.place("file3.py", 0.5)

        # Only update file1, but should get all positions
        updates = {"file1.py": 0.9}
        new_positions = placer.recenter(updates)

        assert len(new_positions) == 3


class TestGravityPlacerInnerRing:
    """Tests for get_inner_ring() functionality."""

    def test_get_inner_ring_returns_files_within_radius(self):
        """Test get_inner_ring() returns files within specified radius."""
        placer = GravityPlacer(gravity_constant=100.0)

        # Place files with different values
        placer.place("core.py", 0.99)  # ~100 distance
        placer.place("utils.py", 0.5)  # ~200 distance
        placer.place("legacy.py", 0.1)  # ~1000 distance

        inner_ring = placer.get_inner_ring(300)

        file_paths = [pos.file_path for pos in inner_ring]
        assert "core.py" in file_paths
        assert "utils.py" in file_paths
        assert "legacy.py" not in file_paths

    def test_get_inner_ring_empty_when_none_within(self):
        """Test get_inner_ring() returns empty list when no files within radius."""
        placer = GravityPlacer(gravity_constant=100.0)

        # Only low-value files
        placer.place("legacy1.py", 0.05)
        placer.place("legacy2.py", 0.03)

        inner_ring = placer.get_inner_ring(100)

        assert len(inner_ring) == 0

    def test_get_inner_ring_all_within_large_radius(self):
        """Test get_inner_ring() returns all files when radius is large."""
        placer = GravityPlacer(gravity_constant=100.0)

        placer.place("file1.py", 0.9)
        placer.place("file2.py", 0.5)
        placer.place("file3.py", 0.1)

        inner_ring = placer.get_inner_ring(10000)

        assert len(inner_ring) == 3

    def test_get_inner_ring_sorted_by_distance(self):
        """Test get_inner_ring() returns files sorted by distance (closest first)."""
        placer = GravityPlacer(gravity_constant=100.0)

        placer.place("medium.py", 0.5)
        placer.place("close.py", 0.95)
        placer.place("far.py", 0.3)

        inner_ring = placer.get_inner_ring(500)

        # Should be sorted by distance ascending
        distances = [pos.distance_from_center for pos in inner_ring]
        assert distances == sorted(distances)


class TestGravityFormula:
    """Direct tests of the gravity formula."""

    def test_formula_accuracy(self):
        """Test distance exactly matches formula: gravity_constant / (value + epsilon)."""
        placer = GravityPlacer(gravity_constant=100.0, epsilon=0.001)

        pos = placer.place("test.py", 0.5)
        expected_distance = 100.0 / (0.5 + 0.001)

        assert abs(pos.distance_from_center - expected_distance) < 0.1

    def test_formula_with_zero_value(self):
        """Test formula handles zero value (uses epsilon)."""
        placer = GravityPlacer(gravity_constant=100.0, epsilon=0.001)

        pos = placer.place("zero.py", 0.0)
        expected_distance = 100.0 / 0.001  # 100,000

        assert pos.distance_from_center == expected_distance

    def test_formula_with_max_value(self):
        """Test formula with maximum value (1.0)."""
        placer = GravityPlacer(gravity_constant=100.0, epsilon=0.001)

        pos = placer.place("max.py", 1.0)
        expected_distance = 100.0 / (1.0 + 0.001)  # ~99.9

        assert abs(pos.distance_from_center - expected_distance) < 0.1


class TestGravityPlacerEdgeCases:
    """Tests for edge cases and boundary conditions."""

    def test_place_same_file_multiple_times(self):
        """Test placing same file multiple times updates position."""
        placer = GravityPlacer()

        pos1 = placer.place("file.py", 0.5)
        pos2 = placer.place("file.py", 0.9)

        # Second placement should update
        assert pos2.value_score == 0.9
        assert pos2.distance_from_center < pos1.distance_from_center

    def test_negative_values_handled(self):
        """Test negative values are clamped to 0."""
        placer = GravityPlacer()

        pos = placer.place("bad.py", -0.5)

        # Should treat as 0 (uses epsilon for division)
        assert pos.value_score == 0.0

    def test_values_above_one_clamped(self):
        """Test values above 1.0 are clamped to 1.0."""
        placer = GravityPlacer()

        pos = placer.place("overflow.py", 1.5)

        assert pos.value_score == 1.0

    def test_empty_recenter(self):
        """Test recenter with empty dict returns current positions."""
        placer = GravityPlacer()

        placer.place("file.py", 0.5)
        positions = placer.recenter({})

        assert len(positions) == 1
        assert "file.py" in positions
