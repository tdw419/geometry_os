"""
Tests for CompletionDetector - Pattern matching for render completion.
"""

import pytest
import re
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestCompletionDetectorInit:
    """Test CompletionDetector initialization."""

    def test_completion_detector_imports(self):
        """Test that CompletionDetector can be imported."""
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector
        assert CompletionDetector is not None

    def test_completion_detector_has_patterns(self):
        """Test that CompletionDetector has completion patterns."""
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector

        detector = CompletionDetector()
        assert hasattr(detector, 'patterns')
        assert len(detector.patterns) > 0

    def test_default_patterns_include_100_percent(self):
        """Test that default patterns include 100% detection."""
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector

        detector = CompletionDetector()
        pattern_strs = [str(p) for p in detector.patterns]

        # Should have a pattern that matches "100%"
        assert any("100" in p for p in pattern_strs)


class TestCompletionDetectorMatching:
    """Test CompletionDetector pattern matching."""

    @pytest.fixture
    def detector(self):
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector
        return CompletionDetector()

    def test_detects_100_percent(self, detector):
        """Test detection of '100%' text."""
        result = {
            "widgets": [
                {"type": "label", "text": "Progress: 100%", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is not None
        assert "100" in match.text

    def test_detects_complete_text(self, detector):
        """Test detection of 'Complete' text."""
        result = {
            "widgets": [
                {"type": "button", "text": "Export Complete", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is not None
        assert "complete" in match.text.lower()

    def test_detects_finished_text(self, detector):
        """Test detection of 'Finished' text."""
        result = {
            "widgets": [
                {"type": "label", "text": "Export finished successfully", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is not None

    def test_returns_none_for_incomplete(self, detector):
        """Test that incomplete progress returns None."""
        result = {
            "widgets": [
                {"type": "label", "text": "Progress: 50%", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is None

    def test_returns_none_for_empty_widgets(self, detector):
        """Test that empty widgets returns None."""
        result = {"widgets": []}
        match = detector.detect(result)
        assert match is None

    def test_custom_patterns(self):
        """Test that custom patterns can be provided."""
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector

        detector = CompletionDetector(patterns=[r"CustomDone"])
        result = {
            "widgets": [
                {"type": "label", "text": "CustomDone", "bbox": [10, 10, 100, 30]}
            ]
        }

        match = detector.detect(result)
        assert match is not None
