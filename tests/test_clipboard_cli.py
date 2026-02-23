"""Tests for clipboard CLI tool."""

import subprocess
import sys
import time
import threading
import pytest
import os

from systems.clipboard.cli import ClipboardCLI
from systems.clipboard.server import ClipboardServer, ClipboardHandler


class TestClipboardCLIUnit:
    """Unit tests for ClipboardCLI class (no server required)."""

    def test_cli_format_output(self):
        """Test basic instantiation."""
        cli = ClipboardCLI(base_url="http://localhost:8767")
        assert cli.base_url == "http://localhost:8767"

    def test_cli_format_output_empty_entry(self):
        """Test formatting an empty/None entry."""
        cli = ClipboardCLI()
        result = cli.format_output(None)
        assert "empty" in result.lower()

    def test_cli_format_output_with_entry(self):
        """Test formatting a valid entry."""
        cli = ClipboardCLI()
        entry = {
            "id": "abc123",
            "content": "test content",
            "source": "test-host",
            "timestamp": 1700000000.0
        }
        result = cli.format_output(entry)
        assert "abc123" in result
        assert "test content" in result

    def test_cli_format_entries_empty(self):
        """Test formatting empty entries list."""
        cli = ClipboardCLI()
        result = cli.format_entries([])
        assert "no entries" in result.lower()

    def test_cli_format_entries_multiple(self):
        """Test formatting multiple entries."""
        cli = ClipboardCLI()
        entries = [
            {"id": "abc123", "content": "first", "source": "host1", "timestamp": 1700000000.0},
            {"id": "def456", "content": "second with a very long content that should be truncated", "source": "host2", "timestamp": 1700000001.0},
        ]
        result = cli.format_entries(entries)
        assert "abc123" in result
        assert "def456" in result
        assert "first" in result


class TestClipboardCLIIntegration:
    """Integration tests for CLI with live server."""

    @pytest.fixture
    def server(self, tmp_path):
        """Start a test server for each test."""
        # Use unique persistence path per test
        persist_path = str(tmp_path / "history.json")

        # Reset class-level history
        ClipboardHandler.history = None

        server = ClipboardServer(
            host="127.0.0.1",
            port=18769,  # Use unique port
            persistence_path=persist_path
        )

        thread = threading.Thread(target=server.serve_forever, daemon=True)
        thread.start()
        time.sleep(0.2)  # Wait for server to start

        yield server, "http://127.0.0.1:18769"

        server.shutdown()

    def test_cli_get_empty(self, server):
        """Test getting from empty clipboard."""
        _, base_url = server
        cli = ClipboardCLI(base_url=base_url)
        result = cli.get()
        assert "empty" in result.lower()

    def test_cli_post_and_get(self, server):
        """Test posting and getting clipboard content."""
        _, base_url = server
        cli = ClipboardCLI(base_url=base_url)

        # Post content
        post_result = cli.post("Hello from CLI", source="test-cli")
        assert "posted" in post_result.lower()

        # Get latest
        get_result = cli.get()
        assert "Hello from CLI" in get_result

    def test_cli_history(self, server):
        """Test getting history."""
        _, base_url = server
        cli = ClipboardCLI(base_url=base_url)

        # Post multiple entries
        cli.post("First entry", source="test-cli")
        cli.post("Second entry", source="test-cli")

        # Get history
        result = cli.history(limit=10)
        assert "First entry" in result or "Second entry" in result

    def test_cli_poll_once_no_new(self, server):
        """Test polling once with no new entries."""
        _, base_url = server
        cli = ClipboardCLI(base_url=base_url)

        # Poll once with no entries
        result = cli.poll(once=True)
        assert "no new" in result.lower() or "no entries" in result.lower()

    def test_cli_delete_not_found(self, server):
        """Test deleting non-existent entry."""
        _, base_url = server
        cli = ClipboardCLI(base_url=base_url)

        result = cli.delete("nonexistent")
        assert "not found" in result.lower() or "error" in result.lower()

    def test_cli_command_line_get(self, server):
        """Test CLI via command line get command."""
        _, base_url = server
        # --url must come before the subcommand
        result = subprocess.run(
            [sys.executable, "-m", "systems.clipboard.cli",
             "--url", base_url, "get"],
            capture_output=True,
            text=True,
            timeout=10,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )
        assert result.returncode == 0

    def test_cli_command_line_post(self, server):
        """Test CLI via command line post command."""
        _, base_url = server
        # --url must come before the subcommand
        result = subprocess.run(
            [sys.executable, "-m", "systems.clipboard.cli",
             "--url", base_url, "post",
             "CLI test content", "--source", "pytest"],
            capture_output=True,
            text=True,
            timeout=10,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )
        assert result.returncode == 0
        assert "posted" in result.stdout.lower()
