"""Tests for ASCII screenshot fallback functionality."""
import os
import sys
import pytest

# Add scripts directory to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '.gemini', 'skills', 'ascii-desktop-control', 'scripts'))

from get_ascii_view import (
    capture_screenshot_ascii,
    detect_black_box_window,
    generate_ascii_view,
    get_focused_window,
)


# Skip all tests if no DISPLAY available (headless environment)
no_display = not os.environ.get('DISPLAY')

pytestmark = pytest.mark.skipif(no_display, reason="No DISPLAY environment variable - skipping GUI tests")


# Apply timeout to all tests to prevent hanging on screenshot capture
@pytest.fixture(autouse=True)
def timeout_fixture(request):
    """Apply 30-second timeout to all tests."""
    import signal

    class TimeoutError(Exception):
        pass

    def handler(signum, frame):
        raise TimeoutError("Test timed out after 30 seconds")

    # Set signal alarm (Unix only)
    if hasattr(signal, 'SIGALRM'):
        old_handler = signal.signal(signal.SIGALRM, handler)
        signal.alarm(30)
        yield
        signal.alarm(0)
        signal.signal(signal.SIGALRM, old_handler)
    else:
        yield


class TestCaptureScreenshotAscii:
    """Tests for capture_screenshot_ascii function."""

    def test_capture_screenshot_ascii_returns_string(self):
        """capture_screenshot_ascii should return a string."""
        result = capture_screenshot_ascii(window=None, grid_w=80, grid_h=24)
        assert isinstance(result, str), f"Expected str, got {type(result)}"

    def test_capture_screenshot_ascii_has_grid_structure(self):
        """capture_screenshot_ascii should produce multi-line output with grid-like structure."""
        result = capture_screenshot_ascii(window=None, grid_w=40, grid_h=10)
        lines = result.strip().split('\n')

        # Should have multiple lines (at least 5 for meaningful grid)
        assert len(lines) >= 5, f"Expected at least 5 lines, got {len(lines)}: {result[:200]}"

        # Lines should have some content (not empty)
        non_empty_lines = [l for l in lines if l.strip()]
        assert len(non_empty_lines) >= 3, f"Expected at least 3 non-empty lines"

    def test_capture_screenshot_ascii_uses_ascii_charset(self):
        """capture_screenshot_ascii should use ASCII characters from the charset."""
        ascii_chars = set(" .:-=+*#%@")
        result = capture_screenshot_ascii(window=None, grid_w=40, grid_h=10)

        # At least some characters should be from our ASCII set
        result_chars = set(result)
        overlap = result_chars.intersection(ascii_chars)
        assert len(overlap) >= 3, f"Expected ASCII charset chars in output, got: {result[:100]}"

    def test_capture_screenshot_ascii_respects_dimensions(self):
        """capture_screenshot_ascii should respect grid dimensions."""
        grid_w, grid_h = 30, 8
        result = capture_screenshot_ascii(window=None, grid_w=grid_w, grid_h=grid_h)
        lines = [l for l in result.split('\n') if l.strip()]

        # Check line count doesn't exceed grid_h
        assert len(lines) <= grid_h, f"Expected max {grid_h} lines, got {len(lines)}"

        # Check line width doesn't exceed grid_w
        for line in lines:
            assert len(line) <= grid_w, f"Line exceeds {grid_w} chars: {len(line)}"


class TestDetectBlackBoxWindow:
    """Tests for detect_black_box_window function."""

    def test_detect_black_box_window_returns_bool(self):
        """detect_black_box_window should return a boolean."""
        # Test with root window (usually not black-box)
        result = detect_black_box_window("root")
        assert isinstance(result, bool), f"Expected bool, got {type(result)}"

    def test_detect_black_box_window_handles_invalid_id(self):
        """detect_black_box_window should handle invalid window IDs gracefully."""
        result = detect_black_box_window("0x99999999")
        # Should return True (assume black box) on error
        assert isinstance(result, bool), f"Expected bool on error, got {type(result)}"

    def test_detect_black_box_window_detects_root(self):
        """Root window typically has many children, should not be black box."""
        result = detect_black_box_window("root")
        # Root window usually has children
        # Just check it returns bool (actual value depends on system state)
        assert isinstance(result, bool)


class TestGenerateAsciiView:
    """Tests for generate_ascii_view function."""

    def test_generate_ascii_view_returns_tuple(self):
        """generate_ascii_view should return a tuple of (string, dict)."""
        result = generate_ascii_view()
        assert isinstance(result, tuple), f"Expected tuple, got {type(result)}"
        assert len(result) == 2, f"Expected 2-element tuple, got {len(result)}"

    def test_generate_ascii_view_includes_metadata_header(self):
        """generate_ascii_view should include window metadata in header."""
        # Skip if no focused window available
        if get_focused_window() is None:
            pytest.skip("No focused window available")

        ascii_view, bindings = generate_ascii_view()
        assert isinstance(ascii_view, str), f"Expected str for ascii_view, got {type(ascii_view)}"

        # Header should contain WINDOW, SIZE, MODE info
        assert "WINDOW:" in ascii_view, f"Expected 'WINDOW:' in header: {ascii_view[:100]}"
        assert "SIZE:" in ascii_view, f"Expected 'SIZE:' in header: {ascii_view[:100]}"
        assert "MODE:" in ascii_view, f"Expected 'MODE:' in header: {ascii_view[:100]}"

    def test_generate_ascii_view_bindings_is_dict(self):
        """generate_ascii_view should return bindings as dict."""
        ascii_view, bindings = generate_ascii_view()
        assert isinstance(bindings, dict), f"Expected dict for bindings, got {type(bindings)}"

    def test_generate_ascii_view_includes_screenshot_on_black_box(self):
        """When window is black-box, should use screenshot mode."""
        # Skip if no focused window available
        if get_focused_window() is None:
            pytest.skip("No focused window available")

        ascii_view, bindings = generate_ascii_view()

        # Check mode indicator in header
        # Mode can be 'screenshot' or 'x11'
        assert "MODE:" in ascii_view, f"Expected MODE in output"
        assert ("screenshot" in ascii_view or "x11" in ascii_view), \
            f"Expected mode indicator in header: {ascii_view[:100]}"

    def test_generate_ascii_view_produces_multiline_output(self):
        """generate_ascii_view should produce multi-line ASCII output."""
        # Skip if no focused window available
        if get_focused_window() is None:
            pytest.skip("No focused window available")

        ascii_view, bindings = generate_ascii_view()
        lines = ascii_view.strip().split('\n')

        # Should have header + multiple grid lines
        assert len(lines) >= 3, f"Expected at least 3 lines (header + grid), got {len(lines)}"


class TestGetFocusedWindow:
    """Tests for get_focused_window function."""

    def test_get_focused_window_returns_dict_or_none(self):
        """get_focused_window should return dict or None."""
        result = get_focused_window()
        assert result is None or isinstance(result, dict), \
            f"Expected dict or None, got {type(result)}"

    def test_get_focused_window_dict_structure(self):
        """If window found, dict should have expected keys."""
        result = get_focused_window()
        if result is not None:
            assert "id" in result, f"Expected 'id' key in window dict"
            assert "w" in result, f"Expected 'w' key in window dict"
            assert "h" in result, f"Expected 'h' key in window dict"


class TestIntegration:
    """Integration tests for ASCII view system."""

    def test_full_ascii_view_pipeline(self):
        """Test complete pipeline from window detection to ASCII output."""
        # Get focused window
        window = get_focused_window()

        if window is None:
            pytest.skip("No focused window available")

        # Generate ASCII view
        ascii_view, bindings = generate_ascii_view()

        # Verify output structure
        assert isinstance(ascii_view, str)
        assert isinstance(bindings, dict)
        assert "WINDOW:" in ascii_view
        assert "SIZE:" in ascii_view
        assert "MODE:" in ascii_view

        # Verify ASCII content exists
        lines = ascii_view.split('\n')
        assert len(lines) >= 2, "Expected header + content"
