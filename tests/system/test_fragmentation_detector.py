import pytest
import math
from systems.visual_shell.swarm.fragmentation_detector import FragmentationDetector

class TestFragmentationDetector:
    """Tests for the FragmentationDetector agent."""

    @pytest.fixture
    def detector(self):
        return FragmentationDetector()

    def test_detector_initialization(self, detector):
        """FragmentationDetector initializes with empty state."""
        assert detector.file_positions == {}
        assert detector.relationships == []

    def test_related_file_group_detection(self, detector):
        """Detector identifies groups of related files based on graph."""
        relationships = [
            ("file_a", "file_b", 5),
            ("file_b", "file_c", 3),
            ("file_d", "file_e", 10)
        ]
        
        groups = detector.find_related_groups(relationships)
        
        # Should find two groups: {a, b, c} and {d, e}
        assert len(groups) == 2
        group_abc = next(g for g in groups if "file_a" in g)
        assert "file_b" in group_abc
        assert "file_c" in group_abc

    def test_spatial_distance_measurement(self, detector):
        """Detector computes Euclidean distance between file positions."""
        detector.file_positions = {
            "file_a": {"x": 0, "y": 0},
            "file_b": {"x": 300, "y": 400} # 3-4-5 triangle
        }
        
        dist = detector.get_distance("file_a", "file_b")
        assert dist == 500.0

    def test_fragmentation_score_computation(self, detector):
        """Detector computes score based on relationship weight vs spatial distance."""
        detector.file_positions = {
            "file_a": {"x": 0, "y": 0},
            "file_b": {"x": 1000, "y": 1000}
        }
        
        # Heavily related but far apart = high fragmentation
        score = detector.compute_fragmentation_score("file_a", "file_b", weight=10)
        assert score > 0.5
        
        # Closely placed = low fragmentation
        detector.file_positions["file_b"] = {"x": 10, "y": 10}
        score_low = detector.compute_fragmentation_score("file_a", "file_b", weight=10)
        assert score_low < score

    def test_high_value_target_identification(self, detector):
        """Detector identifies the most fragmented relationships as targets."""
        detector.file_positions = {
            "a": {"x": 0, "y": 0},
            "b": {"x": 1000, "y": 0},
            "c": {"x": 10, "y": 0}
        }
        relationships = [("a", "b", 10), ("a", "c", 10)]
        
        targets = detector.get_optimization_targets(relationships)
        assert targets[0][0] == "a"
        assert targets[0][1] == "b" # Most fragmented
