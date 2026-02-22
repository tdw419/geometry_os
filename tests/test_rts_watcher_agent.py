#!/usr/bin/env python3
"""
Unit tests for RtsWatcherAgent - RTS Snapshot Ingestion Agent

Tests cover:
- TestHeartbeatSupport: Heartbeat file creation, field presence, updates
- TestScanning: Directory scanning, file discovery, metadata parsing
- TestCLI: CLI argument parsing, main entry point, --once mode
"""

import pytest
from unittest.mock import Mock, patch, mock_open
import json
import os
import sys
import subprocess
from datetime import datetime, timedelta
from pathlib import Path
import tempfile

from systems.intelligence.rts_watcher_agent import RtsWatcherAgent


class TestHeartbeatSupport:
    """Test heartbeat support for daemon monitoring."""

    @pytest.fixture
    def agent(self, tmp_path):
        """Create RtsWatcherAgent with temp heartbeat path."""
        heartbeat_path = tmp_path / "heartbeat.json"
        agent = RtsWatcherAgent(
            wp_url="http://test.local",
            watch_dir="/tmp/test_rts",
            heartbeat_path=str(heartbeat_path),
            log_level="ERROR"  # Suppress logs during tests
        )
        return agent, heartbeat_path

    def test_write_heartbeat_creates_file(self, agent):
        """Test that write_heartbeat creates the heartbeat file."""
        agent_instance, heartbeat_path = agent
        agent_instance._start_time = datetime.utcnow()

        agent_instance.write_heartbeat()

        assert heartbeat_path.exists()

    def test_heartbeat_contains_required_fields(self, agent):
        """Test that heartbeat contains all required fields."""
        agent_instance, heartbeat_path = agent
        agent_instance._start_time = datetime.utcnow()
        agent_instance._running = True  # Set running flag for heartbeat
        agent_instance._files_ingested = 5
        agent_instance._files_skipped = 2
        agent_instance._errors = 1

        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        # Check all required fields
        assert "timestamp" in data
        assert "pid" in data
        assert "running" in data
        assert "uptime_seconds" in data
        assert "files_ingested" in data
        assert "files_skipped" in data
        assert "errors" in data
        assert "watch_dir" in data
        assert "wp_url" in data

        # Check field values
        assert data["pid"] == os.getpid()
        assert data["running"] is True
        assert data["files_ingested"] == 5
        assert data["files_skipped"] == 2
        assert data["errors"] == 1
        assert data["watch_dir"] == "/tmp/test_rts"
        assert data["wp_url"] == "http://test.local"

    def test_heartbeat_updates_on_cycle(self, agent, tmp_path):
        """Test that heartbeat updates after process_one_cycle."""
        agent_instance, heartbeat_path = agent

        # Mock scan_and_ingest to return 3 files ingested
        with patch.object(agent_instance, 'scan_and_ingest', return_value=3):
            # Manually set files_ingested (simulating successful ingestion)
            agent_instance._files_ingested = 3
            result = agent_instance.process_one_cycle()

        # Check heartbeat was written
        assert heartbeat_path.exists()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        # Should have processed files
        assert data["files_ingested"] == 3
        assert data["running"] is True
        assert data["uptime_seconds"] > 0

    def test_heartbeat_not_running_before_first_cycle(self, agent):
        """Test that running is False before first cycle."""
        agent_instance, heartbeat_path = agent

        # Don't call process_one_cycle, just write heartbeat directly
        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        # _start_time is None, so running should be False
        assert data["running"] is False
        assert data["uptime_seconds"] == 0.0

    def test_heartbeat_uptime_increases(self, agent):
        """Test that uptime increases over time."""
        agent_instance, heartbeat_path = agent

        # Set start time in the past
        agent_instance._start_time = datetime.utcnow() - timedelta(seconds=10)

        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        # Uptime should be at least 10 seconds
        assert data["uptime_seconds"] >= 10.0

    def test_heartbeat_creates_parent_directory(self, tmp_path):
        """Test that write_heartbeat creates parent directories."""
        heartbeat_path = tmp_path / "nested" / "dir" / "heartbeat.json"

        agent = RtsWatcherAgent(
            wp_url="http://test.local",
            heartbeat_path=str(heartbeat_path),
            log_level="ERROR"
        )
        agent._start_time = datetime.utcnow()
        agent.write_heartbeat()

        assert heartbeat_path.exists()
        assert heartbeat_path.parent.is_dir()

    def test_heartbeat_file_is_valid_json(self, agent):
        """Test that heartbeat file contains valid JSON."""
        agent_instance, heartbeat_path = agent
        agent_instance._start_time = datetime.utcnow()

        agent_instance.write_heartbeat()

        # Should not raise JSONDecodeError
        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        assert isinstance(data, dict)

    def test_heartbeat_timestamp_format(self, agent):
        """Test that timestamp is in ISO format with Z suffix."""
        agent_instance, heartbeat_path = agent
        agent_instance._start_time = datetime.utcnow()

        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        timestamp = data["timestamp"]
        assert timestamp.endswith("Z")
        # Should be parseable as ISO format
        datetime.fromisoformat(timestamp.replace("Z", "+00:00"))

    def test_heartbeat_tracks_files_ingested(self, agent):
        """Test that files_ingested counter is tracked correctly."""
        agent_instance, heartbeat_path = agent
        agent_instance._start_time = datetime.utcnow()

        # Simulate multiple ingestions
        agent_instance._files_ingested = 0
        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)
        assert data["files_ingested"] == 0

        # Increment and write again
        agent_instance._files_ingested = 10
        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)
        assert data["files_ingested"] == 10

    def test_heartbeat_tracks_errors(self, agent):
        """Test that errors counter is tracked in heartbeat."""
        agent_instance, heartbeat_path = agent
        agent_instance._start_time = datetime.utcnow()
        agent_instance._errors = 5

        agent_instance.write_heartbeat()

        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        assert data["errors"] == 5

    def test_heartbeat_handles_write_error_gracefully(self, tmp_path):
        """Test that heartbeat write errors don't crash the agent."""
        # Use a path that can't be written to
        heartbeat_path = "/nonexistent/path/to/heartbeat.json"

        agent = RtsWatcherAgent(
            wp_url="http://test.local",
            heartbeat_path=heartbeat_path,
            log_level="ERROR"
        )
        agent._start_time = datetime.utcnow()

        # Should not raise an exception
        agent.write_heartbeat()

        # File should not exist
        assert not os.path.exists(heartbeat_path)


class TestScanning:
    """Test directory scanning and file ingestion."""

    @pytest.fixture
    def agent(self, tmp_path):
        """Create RtsWatcherAgent with temp paths."""
        heartbeat_path = tmp_path / "heartbeat.json"
        watch_dir = tmp_path / "watch"
        watch_dir.mkdir()

        agent = RtsWatcherAgent(
            wp_url="http://test.local",
            watch_dir=str(watch_dir),
            heartbeat_path=str(heartbeat_path),
            log_level="ERROR"
        )
        return agent, watch_dir, heartbeat_path

    def test_scan_empty_directory(self, agent):
        """Test scanning an empty directory."""
        agent_instance, watch_dir, _ = agent

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._files_ingested == 0

    def test_scan_nonexistent_directory(self, agent):
        """Test scanning a directory that doesn't exist."""
        agent_instance, _, _ = agent

        result = agent_instance.scan_and_ingest("/nonexistent/path")

        assert result == 0

    def test_scan_directory_is_file(self, agent, tmp_path):
        """Test scanning when path is a file not directory."""
        agent_instance, _, _ = agent

        # Create a file instead of directory
        file_path = tmp_path / "notadir.txt"
        file_path.write_text("test")

        result = agent_instance.scan_and_ingest(str(file_path))

        assert result == 0

    def test_scan_finds_rts_files(self, agent):
        """Test that scan discovers .rts.png files."""
        agent_instance, watch_dir, _ = agent

        # Create a mock RTS file
        rts_file = watch_dir / "test.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)  # Minimal PNG header

        # Note: scan_and_ingest will skip files without meta.json
        result = agent_instance.scan_and_ingest(str(watch_dir))

        # Should find the file but skip it (no metadata)
        assert result == 0
        assert agent_instance._files_skipped >= 1

    def test_scan_skips_files_without_metadata(self, agent):
        """Test that files without .rts.meta.json are skipped."""
        agent_instance, watch_dir, _ = agent

        # Create RTS file without metadata
        rts_file = watch_dir / "no_meta.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._files_skipped >= 1

    def test_scan_handles_invalid_json_metadata(self, agent):
        """Test handling of invalid JSON in metadata file."""
        agent_instance, watch_dir, _ = agent

        # Create RTS file with invalid JSON metadata
        rts_file = watch_dir / "bad_json.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "bad_json.rts.meta.json"
        meta_file.write_text("{ invalid json }")

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._files_skipped >= 1
        assert agent_instance._errors >= 1

    def test_scan_handles_missing_metadata_file(self, agent):
        """Test handling when metadata file cannot be read."""
        agent_instance, watch_dir, _ = agent

        # Create RTS file only (no metadata)
        rts_file = watch_dir / "missing_meta.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._files_skipped >= 1

    @patch('systems.intelligence.rts_watcher_agent.requests.post')
    def test_scan_ingests_with_valid_metadata(self, mock_post, agent):
        """Test successful ingestion with valid metadata."""
        agent_instance, watch_dir, _ = agent

        # Create RTS file with valid metadata
        rts_file = watch_dir / "valid.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "valid.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test", "version": "1.0"}))

        # Mock successful API response
        mock_response = Mock()
        mock_response.json.return_value = {"success": True, "post_id": 123}
        mock_response.raise_for_status = Mock()
        mock_post.return_value = mock_response

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result >= 1
        assert agent_instance._files_ingested >= 1

    @patch('systems.intelligence.rts_watcher_agent.requests.post')
    def test_scan_handles_api_error(self, mock_post, agent):
        """Test handling of API errors during ingestion."""
        agent_instance, watch_dir, _ = agent

        # Create RTS file with valid metadata
        rts_file = watch_dir / "api_error.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "api_error.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test"}))

        # Mock API error
        mock_post.side_effect = Exception("API connection failed")

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._errors >= 1

    @patch('systems.intelligence.rts_watcher_agent.requests.post')
    def test_scan_handles_api_failure_response(self, mock_post, agent):
        """Test handling when API returns failure response."""
        agent_instance, watch_dir, _ = agent

        # Create RTS file with valid metadata
        rts_file = watch_dir / "fail_response.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "fail_response.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test"}))

        # Mock API failure response
        mock_response = Mock()
        mock_response.json.return_value = {"success": False, "error": "Database error"}
        mock_response.raise_for_status = Mock()
        mock_post.return_value = mock_response

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._files_skipped >= 1

    def test_process_one_cycle_initializes_start_time(self, agent):
        """Test that process_one_cycle initializes _start_time."""
        agent_instance, watch_dir, _ = agent

        assert agent_instance._start_time is None

        with patch.object(agent_instance, 'scan_and_ingest', return_value=0):
            agent_instance.process_one_cycle()

        assert agent_instance._start_time is not None

    def test_process_one_cycle_writes_heartbeat(self, agent):
        """Test that process_one_cycle writes heartbeat."""
        agent_instance, watch_dir, heartbeat_path = agent

        with patch.object(agent_instance, 'scan_and_ingest', return_value=0):
            agent_instance.process_one_cycle()

        assert heartbeat_path.exists()


class TestCLI:
    """Test CLI interface for daemon control."""

    def test_cli_help_shows_options(self):
        """Test that --help shows all expected options."""
        result = subprocess.run(
            [sys.executable, "systems/intelligence/rts_watcher_agent.py", "--help"],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )

        assert result.returncode == 0
        assert "--wp-url" in result.stdout
        assert "--watch-dir" in result.stdout
        assert "--poll-interval" in result.stdout
        assert "--heartbeat" in result.stdout
        assert "--once" in result.stdout
        assert "--log-level" in result.stdout

    def test_cli_version(self):
        """Test that --version shows version string."""
        result = subprocess.run(
            [sys.executable, "systems/intelligence/rts_watcher_agent.py", "--version"],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )

        assert result.returncode == 0
        assert "1.0" in result.stdout

    def test_cli_once_mode_exits(self, tmp_path):
        """Test that --once mode runs and exits."""
        heartbeat_path = tmp_path / "heartbeat.json"
        watch_dir = tmp_path / "watch"
        watch_dir.mkdir()

        result = subprocess.run(
            [
                sys.executable, "systems/intelligence/rts_watcher_agent.py",
                "--once",
                "--watch-dir", str(watch_dir),
                "--heartbeat", str(heartbeat_path),
                "--log-level", "ERROR"
            ],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
            timeout=10
        )

        assert result.returncode == 0
        assert heartbeat_path.exists()

    def test_cli_custom_options(self, tmp_path):
        """Test that custom CLI options are applied."""
        heartbeat_path = tmp_path / "custom_heartbeat.json"
        watch_dir = tmp_path / "custom_watch"
        watch_dir.mkdir()

        result = subprocess.run(
            [
                sys.executable, "systems/intelligence/rts_watcher_agent.py",
                "--once",
                "--wp-url", "http://custom.local/api",
                "--watch-dir", str(watch_dir),
                "--poll-interval", "60",
                "--heartbeat", str(heartbeat_path),
                "--log-level", "DEBUG"
            ],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
            timeout=10
        )

        assert result.returncode == 0

        # Check heartbeat has custom values
        with open(heartbeat_path, 'r') as f:
            data = json.load(f)

        assert data["wp_url"] == "http://custom.local/api"
        assert data["watch_dir"] == str(watch_dir)

    def test_cli_default_heartbeat_path(self, tmp_path):
        """Test default heartbeat path is used when not specified."""
        # Run with --once and check default path
        result = subprocess.run(
            [
                sys.executable, "systems/intelligence/rts_watcher_agent.py",
                "--once",
                "--watch-dir", "/tmp",
                "--log-level", "ERROR"
            ],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os",
            timeout=10
        )

        assert result.returncode == 0
        # Default heartbeat path is .geometry/rts_watcher_heartbeat.json
        assert os.path.exists(".geometry/rts_watcher_heartbeat.json")

    def test_cli_log_level_option(self):
        """Test that --log-level option is accepted."""
        result = subprocess.run(
            [
                sys.executable, "systems/intelligence/rts_watcher_agent.py",
                "--help"
            ],
            capture_output=True,
            text=True,
            cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
        )

        assert "--log-level" in result.stdout
        assert "DEBUG" in result.stdout
        assert "INFO" in result.stdout
        assert "WARNING" in result.stdout
        assert "ERROR" in result.stdout


class TestErrorHandling:
    """Test error handling branches for improved coverage."""

    @pytest.fixture
    def agent(self, tmp_path):
        """Create RtsWatcherAgent with temp heartbeat path."""
        heartbeat_path = tmp_path / "heartbeat.json"
        watch_dir = tmp_path / "watch"
        watch_dir.mkdir()
        agent = RtsWatcherAgent(
            wp_url="http://test.local",
            watch_dir=str(watch_dir),
            heartbeat_path=str(heartbeat_path),
            log_level="ERROR"
        )
        return agent, watch_dir, heartbeat_path

    def test_handles_ioerror_reading_metadata(self, agent):
        """Test IOError handling when reading metadata file."""
        agent_instance, watch_dir, _ = agent

        # Create RTS file
        rts_file = watch_dir / "ioerror.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "ioerror.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test"}))

        # Mock open to raise IOError
        import builtins
        original_open = builtins.open

        def mock_open_func(file, *args, **kwargs):
            if "ioerror.rts.meta.json" in str(file):
                raise IOError("Permission denied")
            return original_open(file, *args, **kwargs)

        with patch.object(builtins, 'open', mock_open_func):
            result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._errors >= 1
        assert agent_instance._files_skipped >= 1

    def test_handles_unicode_decode_error(self, agent):
        """Test UnicodeDecodeError handling when reading metadata file."""
        agent_instance, watch_dir, _ = agent

        # Create RTS file
        rts_file = watch_dir / "unicode.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        # Create file with invalid UTF-8
        meta_file = watch_dir / "unicode.rts.meta.json"
        meta_file.write_bytes(b"\xff\xfe {" + b"\x00" * 10)  # Invalid UTF-8

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._errors >= 1
        assert agent_instance._files_skipped >= 1

    @patch('systems.intelligence.rts_watcher_agent.requests.post')
    def test_handles_api_timeout(self, mock_post, agent):
        """Test handling of API timeout errors."""
        import requests
        agent_instance, watch_dir, _ = agent

        rts_file = watch_dir / "timeout.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "timeout.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test"}))

        mock_post.side_effect = requests.exceptions.Timeout("Connection timed out")

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._errors >= 1

    @patch('systems.intelligence.rts_watcher_agent.requests.post')
    def test_handles_api_connection_error(self, mock_post, agent):
        """Test handling of API connection errors."""
        import requests
        agent_instance, watch_dir, _ = agent

        rts_file = watch_dir / "connerr.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "connerr.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test"}))

        mock_post.side_effect = requests.exceptions.ConnectionError("Failed to connect")

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._errors >= 1

    @patch('systems.intelligence.rts_watcher_agent.requests.post')
    def test_handles_api_http_error(self, mock_post, agent):
        """Test handling of HTTP errors from API."""
        import requests
        agent_instance, watch_dir, _ = agent

        rts_file = watch_dir / "httperr.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "httperr.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test"}))

        mock_post.side_effect = requests.exceptions.HTTPError("500 Server Error")

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._errors >= 1

    @patch('systems.intelligence.rts_watcher_agent.requests.post')
    def test_handles_api_generic_request_error(self, mock_post, agent):
        """Test handling of generic request errors."""
        import requests
        agent_instance, watch_dir, _ = agent

        rts_file = watch_dir / "reqerr.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "reqerr.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test"}))

        mock_post.side_effect = requests.exceptions.RequestException("Unknown error")

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._errors >= 1

    @patch('systems.intelligence.rts_watcher_agent.requests.post')
    def test_handles_api_json_decode_error(self, mock_post, agent):
        """Test handling of invalid JSON response from API."""
        agent_instance, watch_dir, _ = agent

        rts_file = watch_dir / "jsonerr.rts.png"
        rts_file.write_bytes(b"\x89PNG" + b"\x00" * 100)

        meta_file = watch_dir / "jsonerr.rts.meta.json"
        meta_file.write_text(json.dumps({"name": "Test"}))

        # Mock response that raises JSONDecodeError when .json() is called
        mock_response = Mock()
        mock_response.raise_for_status = Mock()
        mock_response.json.side_effect = json.JSONDecodeError("Invalid", "", 0)
        mock_post.return_value = mock_response

        result = agent_instance.scan_and_ingest(str(watch_dir))

        assert result == 0
        assert agent_instance._errors >= 1


class TestRunForever:
    """Test run_forever and signal handling for improved coverage."""

    @pytest.fixture
    def agent(self, tmp_path):
        """Create RtsWatcherAgent with temp heartbeat path."""
        heartbeat_path = tmp_path / "heartbeat.json"
        watch_dir = tmp_path / "watch"
        watch_dir.mkdir()
        agent = RtsWatcherAgent(
            wp_url="http://test.local",
            watch_dir=str(watch_dir),
            heartbeat_path=str(heartbeat_path),
            log_level="ERROR"
        )
        return agent, watch_dir, heartbeat_path

    def test_sigterm_handler_sets_running_false(self, agent):
        """Test that SIGTERM handler sets _running to False."""
        agent_instance, _, _ = agent
        agent_instance._running = True

        # Call handler directly
        agent_instance._handle_sigterm(15, None)

        assert agent_instance._running == False

    def test_run_forever_initializes_state(self, agent):
        """Test that run_forever initializes start time and running flag."""
        agent_instance, _, heartbeat_path = agent

        # Set running to False immediately after first cycle to exit loop
        original_process = agent_instance.process_one_cycle
        def stop_after_first(*args):
            agent_instance._running = False
            return 0

        with patch.object(agent_instance, 'process_one_cycle', stop_after_first):
            agent_instance.run_forever()

        assert agent_instance._start_time is not None
        assert heartbeat_path.exists()

    def test_run_forever_handles_cycle_exception(self, agent):
        """Test that run_forever continues on cycle exceptions."""
        agent_instance, _, heartbeat_path = agent

        call_count = [0]
        def failing_cycle(*args):
            call_count[0] += 1
            if call_count[0] == 1:
                raise Exception("Cycle error")
            agent_instance._running = False
            return 0

        with patch.object(agent_instance, 'process_one_cycle', failing_cycle):
            agent_instance.run_forever()

        assert call_count[0] == 2  # Failed once, then stopped
        assert agent_instance._errors >= 1

    def test_run_forever_writes_shutdown_heartbeat(self, agent):
        """Test that run_forever writes heartbeat with running=False on exit."""
        agent_instance, _, heartbeat_path = agent

        with patch.object(agent_instance, 'process_one_cycle', lambda: setattr(agent_instance, '_running', False) or 0):
            agent_instance.run_forever()

        with open(heartbeat_path) as f:
            data = json.load(f)

        assert data["running"] == False


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
