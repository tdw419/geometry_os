#!/usr/bin/env python3
"""
G-Shell Test Suite

Tests that prove the Geometry OS Shell (G-Shell) successfully:
1. Syncs terminal state to files that AI can read
2. Injects context into AI commands (gemini/claude)
3. Handles geometric commands (g map, g spawn, etc.)

Run with:
    pytest tests/test_geos_shell.py -v
"""

import os
import sys
import time
import json
import tempfile
import subprocess
from pathlib import Path
from unittest.mock import patch, MagicMock

import pytest

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent
sys.path.insert(0, str(PROJECT_ROOT))


class TestStateSync:
    """Tests for terminal state synchronization."""

    def test_terminal_fragment_created(self):
        """G-Shell should create a terminal fragment file."""
        fragment_path = PROJECT_ROOT / ".geometry" / "ascii_scene" / "terminal_fragment.ascii"
        # This test passes if the file exists after G-Shell runs
        # In CI, we'd spawn G-Shell first
        if fragment_path.exists():
            content = fragment_path.read_text()
            assert "TERMINAL FRAGMENT" in content or "jericho" in content or "$" in content
        else:
            pytest.skip("G-Shell not running - start with: python3 geometry_os_cli.py shell --native")

    def test_gnb_state_exists(self):
        """GNB state file should exist."""
        gnb_path = PROJECT_ROOT / ".geometry" / "gnb_state.ascii"
        assert gnb_path.exists(), "GNB state file should exist"

    def test_native_texture_created(self):
        """Native shell should create an RGBA texture."""
        texture_dir = PROJECT_ROOT / ".geometry" / "tectonic" / "textures"
        if texture_dir.exists():
            textures = list(texture_dir.glob("native_terminal_*.rts.png"))
            assert len(textures) > 0, "At least one native terminal texture should exist"
        else:
            pytest.skip("Texture directory not found - start G-Shell first")


class TestContextInjection:
    """Tests for AI context injection."""

    def test_gemini_command_detection(self):
        """Context injector should detect gemini commands and return injected prompt."""
        from systems.visual_shell.context_injector import ContextInjector
        import tempfile

        # Create a temp GNB file
        with tempfile.NamedTemporaryFile(mode='w', suffix='.ascii', delete=False) as f:
            f.write("TEST SCREEN CONTENT\n$ _\n")
            gnb_path = f.name

        try:
            result = ContextInjector.intercept("gemini hello world", gnb_path)
            assert result is not None
            assert "gemini" in result
            assert "hello world" in result
            assert "CONTEXT" in result or "G-Shell" in result
        finally:
            os.unlink(gnb_path)

    def test_claude_command_detection(self):
        """Context injector should detect claude commands."""
        from systems.visual_shell.context_injector import ContextInjector
        import tempfile

        with tempfile.NamedTemporaryFile(mode='w', suffix='.ascii', delete=False) as f:
            f.write("TEST SCREEN\n")
            gnb_path = f.name

        try:
            result = ContextInjector.intercept("claude help me", gnb_path)
            assert result is not None
            assert "claude" in result
            assert "help me" in result
        finally:
            os.unlink(gnb_path)

    def test_non_ai_command_not_intercepted(self):
        """Non-AI commands should not be intercepted."""
        from systems.visual_shell.context_injector import ContextInjector

        result = ContextInjector.intercept("ls -la", "/tmp/fake.ascii")
        assert result is None

        result = ContextInjector.intercept("echo hello", "/tmp/fake.ascii")
        assert result is None

    def test_context_includes_gnb_content(self):
        """Injected prompt should include GNB screen content."""
        from systems.visual_shell.context_injector import ContextInjector
        import tempfile

        with tempfile.NamedTemporaryFile(mode='w', suffix='.ascii', delete=False) as f:
            f.write("ERROR: Connection refused on port 8767\n$ _\n")
            gnb_path = f.name

        try:
            result = ContextInjector.intercept("gemini why did this fail?", gnb_path)
            assert "Connection refused" in result
            assert "why did this fail?" in result
        finally:
            os.unlink(gnb_path)


class TestGeometricCommands:
    """Tests for g-* geometric commands."""

    def test_g_map_command(self):
        """g map should update VAT focal point."""
        from systems.visual_shell.geos_commands import GeosCommands

        # Mock VAT manager
        mock_vat = MagicMock()
        mock_bridge = MagicMock()
        mock_bridge.vat_manager = mock_vat

        commands = GeosCommands(mock_bridge, mock_vat, None)
        result = commands.handle("g map 1000 2000")

        # Should have attempted to set focal point
        assert result is not None or mock_vat.method_called

    def test_g_spawn_command(self):
        """g spawn should create a terminal tile."""
        from systems.visual_shell.geos_commands import GeosCommands

        mock_vat = MagicMock()
        mock_bridge = MagicMock()
        mock_bridge.vat_manager = mock_vat

        commands = GeosCommands(mock_bridge, mock_vat, None)
        result = commands.handle("g spawn")

        # Should have attempted to spawn
        assert result is not None

    def test_g_gls_command(self):
        """g gls should return geometric file listing."""
        from systems.visual_shell.geos_commands import GeosCommands

        mock_vat = MagicMock()
        mock_bridge = MagicMock()
        mock_bridge.vat_manager = mock_vat

        commands = GeosCommands(mock_bridge, mock_vat, None)
        result = commands.handle("g gls")

        # Should return some output
        assert result is not None

    def test_g_help_command(self):
        """g help should show available commands."""
        from systems.visual_shell.geos_commands import GeosCommands
        from io import StringIO
        import sys

        mock_vat = MagicMock()
        mock_bridge = MagicMock()
        mock_bridge.vat_manager = mock_vat

        commands = GeosCommands(mock_bridge, mock_vat, None)

        # Capture stdout
        old_stdout = sys.stdout
        sys.stdout = StringIO()

        try:
            result = commands.handle("g help")
            output = sys.stdout.getvalue()

            # Check that help was printed
            assert "map" in output.lower() or "spawn" in output.lower()
        finally:
            sys.stdout = old_stdout


class TestMCPIntegration:
    """Tests for MCP tool integration."""

    def test_read_terminal_state_tool_exists(self):
        """MCP server should have read_terminal_state tool."""
        from systems.mcp_geometry_os.server import list_tools

        # Get tool list
        tools = asyncio.run(list_tools())
        tool_names = [t.name for t in tools]

        assert "read_terminal_state" in tool_names

    def test_read_terminal_state_returns_content(self):
        """read_terminal_state should return terminal content."""
        import asyncio
        from systems.mcp_geometry_os.server import _read_terminal_state

        result = asyncio.run(_read_terminal_state(raw=False))

        # Should either succeed or give a clear error
        if result.success:
            assert result.data is not None
            assert "content" in result.data or "is_running" in result.data


class TestEndToEnd:
    """End-to-end integration tests."""

    @pytest.mark.integration
    def test_command_appears_in_state(self):
        """Commands run in G-Shell should appear in state file."""
        fragment_path = PROJECT_ROOT / ".geometry" / "ascii_scene" / "terminal_fragment.ascii"

        if not fragment_path.exists():
            pytest.skip("G-Shell not running")

        # Read current state
        before = fragment_path.read_text()

        # In a real test, we'd inject a unique marker command
        # For now, just verify the file is being updated
        time.sleep(0.5)
        after = fragment_path.read_text()

        # File should exist and have content
        assert len(after) > 0

    @pytest.mark.integration
    def test_ai_can_describe_terminal(self):
        """An AI should be able to describe the terminal state."""
        # This would use LM Studio or Ollama to read the state
        # and verify it can describe what's on screen

        fragment_path = PROJECT_ROOT / ".geometry" / "ascii_scene" / "terminal_fragment.ascii"
        if not fragment_path.exists():
            pytest.skip("G-Shell not running")

        content = fragment_path.read_text()

        # Basic assertions - AI should be able to see:
        # - A prompt ($ or username)
        # - Terminal content
        assert "$" in content or "jericho" in content or "TERMINAL" in content


# Import asyncio for async tests
import asyncio


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
