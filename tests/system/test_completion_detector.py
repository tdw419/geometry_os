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
