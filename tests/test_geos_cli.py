"""Tests for geos CLI."""

import subprocess
import sys
from pathlib import Path


def test_geos_help():
    """Test geos --help works."""
    result = subprocess.run(
        [sys.executable, "-m", "geos.cli", "--help"],
        capture_output=True,
        text=True,
        cwd=Path(__file__).parent.parent,
    )
    assert result.returncode == 0
    assert "status" in result.stdout
    assert "chat" in result.stdout
    assert "map" in result.stdout


def test_geos_status():
    """Test geos status works."""
    result = subprocess.run(
        [sys.executable, "-m", "geos.cli", "status"],
        capture_output=True,
        text=True,
        cwd=Path(__file__).parent.parent,
    )
    assert result.returncode == 0
    assert "GEOMETRY OS STATUS" in result.stdout


def test_geos_map():
    """Test geos map works."""
    result = subprocess.run(
        [sys.executable, "-m", "geos.cli", "map", "--view", "districts"],
        capture_output=True,
        text=True,
        cwd=Path(__file__).parent.parent,
    )
    assert result.returncode == 0
    assert "┌" in result.stdout  # Box drawing


def test_geos_inspect():
    """Test geos inspect works."""
    result = subprocess.run(
        [sys.executable, "-m", "geos.cli", "inspect", "0x8000"],
        capture_output=True,
        text=True,
        cwd=Path(__file__).parent.parent,
    )
    assert result.returncode == 0
    assert "0x8000" in result.stdout


def test_chat_backend_fallback():
    """Test ChatBackend fallback mode."""
    from geos.backends.pixelbrain import ChatBackend
    from geos.chat.context import gather_system_context

    backend = ChatBackend()
    context = gather_system_context()

    # Fallback should work even without PixelBrain
    response = backend._fallback_response("what's the cycle count?", context)
    assert "Cycle" in response or "Unknown" in response


def test_context_gathering():
    """Test system context gathering."""
    from geos.chat.context import gather_system_context

    context = gather_system_context()

    # Should have all expected keys
    assert "cycle" in context
    assert "agents" in context
    assert "mutations" in context


def test_hilbert_renderer():
    """Test ASCII map rendering."""
    from geos.backends.hilbert import HilbertRenderer

    renderer = HilbertRenderer()
    output = renderer.render_ascii(view="districts", zoom=1)

    # Should have box drawing characters
    assert "┌" in output
    assert "└" in output
    assert "│" in output


def test_hilbert_inspector():
    """Test Hilbert sector inspection."""
    from geos.backends.hilbert import HilbertInspector

    inspector = HilbertInspector()

    # Test hex address
    result = inspector.inspect("0x8000")
    assert "0x8000" in result

    # Test decimal address
    result = inspector.inspect("32768")
    assert "32768" in result
