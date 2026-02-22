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


class TestCompletionDetectorPixelRTS3:
    """Test CompletionDetector PixelRTS v3 integration."""

    @pytest.fixture
    def detector(self):
        from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector
        return CompletionDetector(detect_pixelrts3=True)

    @pytest.fixture
    def halt_image(self):
        """Create a test PixelRTS v3 image with HALT."""
        import tempfile
        from PIL import Image

        img = Image.new('RGBA', (2, 2), (0, 0, 0, 0))
        pixels = img.load()

        # Hilbert order for 2x2: (0,0), (0,1), (1,1), (1,0)
        pixels[0, 0] = (0x08, 10, 0, 1)   # LDI r1, 10 at PC=0
        pixels[0, 1] = (0x08, 20, 0, 2)   # LDI r2, 20 at PC=1
        pixels[1, 1] = (0x33, 1, 2, 3)    # ADD r3, r1, r2 at PC=2
        pixels[1, 0] = (0x07, 0, 0, 0)    # HALT at PC=3

        fd, path = tempfile.mkstemp(suffix='.rts.png')
        os.close(fd)
        img.save(path)
        return path

    def test_detect_pixelrts3_enabled(self, detector):
        """Test that PixelRTS v3 detection is enabled by default."""
        assert detector.detect_pixelrts3 is True
        assert detector._pixelrts3_detector is not None

    def test_detect_from_screenshot_pixelrts3(self, detector, halt_image):
        """Test PixelRTS v3 HALT detection from screenshot."""
        match = detector.detect_from_screenshot(halt_image)

        assert match is not None
        assert match.source == "pixelrts3"
        assert match.pattern == "pixelrts3:halt"
        assert "HALT" in match.text
        assert match.pixelrts3_data is not None
        assert match.pixelrts3_data["pc"] == 3

        os.unlink(halt_image)

    def test_detect_from_screenshot_no_halt(self, detector):
        """Test that non-PixelRTS images return None."""
        import tempfile
        from PIL import Image

        # Create regular image without HALT
        img = Image.new('RGBA', (2, 2), (0x08, 0, 0, 0))

        fd, path = tempfile.mkstemp(suffix='.png')
        os.close(fd)
        img.save(path)

        match = detector.detect_from_screenshot(path)
        assert match is None

        os.unlink(path)

    def test_extract_pixelrts3_program(self, detector, halt_image):
        """Test extracting PixelRTS v3 program."""
        instructions = detector.extract_pixelrts3_program(halt_image)

        assert len(instructions) == 4
        assert instructions[0]["opcode"] == "LDI"
        assert instructions[3]["opcode"] == "HALT"

        os.unlink(halt_image)

    def test_match_has_source_field(self, detector):
        """Test that CompletionMatch has source field."""
        result = {
            "widgets": [
                {"type": "label", "text": "100%", "bbox": [0, 0, 100, 20]}
            ]
        }

        match = detector.detect(result)
        assert match is not None
        assert match.source == "text"
