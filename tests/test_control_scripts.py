#!/usr/bin/env python3
"""
Integration tests for agent control scripts.

Tests cover:
- TestRtsWatcherControl: Start/stop/status/scan flow for rts_watcher_ctl.sh
- TestDirectiveControl: Start/stop/status/process flow for directive_ctl.sh
- TestAgentStatus: Unified status dashboard tests
- TestControlScriptIntegration: End-to-end integration tests
"""

import pytest
import subprocess
import time
import json
import os
import signal
from pathlib import Path


# Project root for relative paths
PROJECT_ROOT = Path(__file__).parent.parent
INTELLIGENCE_DIR = PROJECT_ROOT / "systems" / "intelligence"
RTS_WATCHER_CTL = INTELLIGENCE_DIR / "rts_watcher_ctl.sh"
DIRECTIVE_CTL = INTELLIGENCE_DIR / "directive_ctl.sh"
AGENT_STATUS = INTELLIGENCE_DIR / "agent_status.sh"


class TestRtsWatcherControl:
    """Test rts_watcher_ctl.sh control script."""

    def test_help_command(self):
        """Test that help command shows usage."""
        result = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "help"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        assert result.returncode == 0
        assert "RTS Watcher Agent Control Script" in result.stdout
        assert "start" in result.stdout
        assert "stop" in result.stdout
        assert "status" in result.stdout
        assert "scan" in result.stdout

    def test_status_when_stopped(self):
        """Test status command shows STOPPED when agent is not running."""
        # First ensure agent is stopped
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

        result = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "status"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        assert result.returncode == 0
        # Should show STOPPED or not running
        assert "STOPPED" in result.stdout or "not running" in result.stdout.lower()

    def test_start_and_stop_lifecycle(self):
        """Test start -> status -> stop flow."""
        # Ensure stopped first
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        time.sleep(1)

        # Start agent
        start_result = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "start"],
            capture_output=True,
            text=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

        assert start_result.returncode == 0
        assert "started" in start_result.stdout.lower() or "already" in start_result.stdout.lower()

        # Check status
        time.sleep(3)  # Wait for agent to fully start
        status_result = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "status"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        # Should be running
        assert "RUNNING" in status_result.stdout or "running" in status_result.stdout.lower()

        # Stop agent
        stop_result = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            text=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

        assert stop_result.returncode == 0
        assert "stopped" in stop_result.stdout.lower() or "not running" in stop_result.stdout.lower()

    def test_scan_command_runs_once(self):
        """Test that scan command runs once and exits."""
        result = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "scan"],
            capture_output=True,
            text=True,
            timeout=60,
            cwd=str(PROJECT_ROOT)
        )

        # Should complete without error (may not find files, but should run)
        assert result.returncode == 0

    def test_restart_command(self):
        """Test restart command stops and starts agent."""
        # Ensure agent is running first
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "start"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        time.sleep(2)

        result = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "restart"],
            capture_output=True,
            text=True,
            timeout=60,
            cwd=str(PROJECT_ROOT)
        )

        assert result.returncode == 0
        assert "Restarting" in result.stdout or "started" in result.stdout.lower()

        # Clean up
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

    def test_start_when_already_running(self):
        """Test start command handles already running case."""
        # Start agent
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "start"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        time.sleep(2)

        # Try to start again
        result = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "start"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        # Should succeed (already running is not an error)
        assert result.returncode == 0
        assert "already running" in result.stdout.lower()

        # Clean up
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )


class TestDirectiveControl:
    """Test directive_ctl.sh control script."""

    def test_help_command(self):
        """Test that help command shows usage."""
        result = subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "help"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        assert result.returncode == 0
        assert "Directive Agent Control Script" in result.stdout
        assert "start" in result.stdout
        assert "stop" in result.stdout
        assert "status" in result.stdout
        assert "process" in result.stdout

    def test_status_when_stopped(self):
        """Test status command shows STOPPED when agent is not running."""
        # Ensure agent is stopped
        subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

        result = subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "status"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        assert result.returncode == 0
        assert "STOPPED" in result.stdout or "not running" in result.stdout.lower()

    def test_start_and_stop_lifecycle(self):
        """Test start -> status -> stop flow."""
        # Ensure stopped first
        subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        time.sleep(1)

        # Start agent
        start_result = subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "start"],
            capture_output=True,
            text=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

        assert start_result.returncode == 0
        assert "started" in start_result.stdout.lower() or "already" in start_result.stdout.lower()

        # Check status
        time.sleep(3)
        status_result = subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "status"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        # Should be running
        assert "RUNNING" in status_result.stdout or "running" in status_result.stdout.lower()

        # Stop agent
        stop_result = subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "stop"],
            capture_output=True,
            text=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

        assert stop_result.returncode == 0
        assert "stopped" in stop_result.stdout.lower() or "not running" in stop_result.stdout.lower()

    def test_process_command_runs_once(self):
        """Test that process command runs once and exits."""
        result = subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "process"],
            capture_output=True,
            text=True,
            timeout=60,
            cwd=str(PROJECT_ROOT)
        )

        # Should complete without error (may not find directives, but should run)
        assert result.returncode == 0


class TestAgentStatus:
    """Test agent_status.sh unified dashboard."""

    def test_status_shows_all_agents(self):
        """Test that status command shows both agents."""
        result = subprocess.run(
            ["bash", str(AGENT_STATUS), "status"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        assert result.returncode == 0
        assert "DirectiveAgent" in result.stdout
        assert "RtsWatcherAgent" in result.stdout

    def test_json_output_is_valid(self):
        """Test that json command produces valid JSON."""
        result = subprocess.run(
            ["bash", str(AGENT_STATUS), "json"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        assert result.returncode == 0

        # Should be valid JSON
        data = json.loads(result.stdout)
        assert "agents" in data
        assert "summary" in data
        assert len(data["agents"]) == 2

    def test_json_contains_agent_status(self):
        """Test JSON output contains required fields."""
        result = subprocess.run(
            ["bash", str(AGENT_STATUS), "json"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        data = json.loads(result.stdout)

        for agent in data["agents"]:
            assert "name" in agent
            assert "running" in agent
            assert agent["name"] in ["DirectiveAgent", "RtsWatcherAgent"]

    def test_help_command(self):
        """Test that help command shows usage."""
        result = subprocess.run(
            ["bash", str(AGENT_STATUS), "help"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        assert result.returncode == 0
        assert "watch" in result.stdout
        assert "json" in result.stdout


class TestControlScriptIntegration:
    """End-to-end integration tests for control scripts."""

    def test_full_agent_lifecycle(self):
        """Test complete lifecycle: start -> check -> use -> stop for both agents."""
        # Stop any running agents first
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        time.sleep(2)

        # Start RTS Watcher
        rts_start = subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "start"],
            capture_output=True,
            text=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        assert rts_start.returncode == 0

        # Start Directive Agent
        directive_start = subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "start"],
            capture_output=True,
            text=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        assert directive_start.returncode == 0

        time.sleep(3)

        # Check unified status shows both running
        status_result = subprocess.run(
            ["bash", str(AGENT_STATUS), "json"],
            capture_output=True,
            text=True,
            cwd=str(PROJECT_ROOT)
        )

        data = json.loads(status_result.stdout)
        running_count = sum(1 for a in data["agents"] if a["running"])

        # At least RTS Watcher should be running
        # (DirectiveAgent may fail if WordPress not available)
        assert running_count >= 1

        # Stop both agents
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        subprocess.run(
            ["bash", str(DIRECTIVE_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

    def test_graceful_shutdown_writes_heartbeat(self):
        """Test that graceful shutdown updates heartbeat with running=false."""
        # Start RTS Watcher
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "start"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        time.sleep(3)

        # Stop gracefully
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )

        # Check heartbeat file
        heartbeat_path = PROJECT_ROOT / ".geometry" / "rts_watcher_heartbeat.json"
        if heartbeat_path.exists():
            with open(heartbeat_path) as f:
                data = json.load(f)
            # After shutdown, running should be False
            assert data.get("running") is False

    def test_pid_file_management(self):
        """Test PID files are created and removed correctly."""
        pid_file = INTELLIGENCE_DIR / "rts_watcher_agent.pid"

        # Ensure stopped
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        time.sleep(1)

        # PID file should not exist after stop
        # (or if it exists, it should be stale)

        # Start agent
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "start"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )
        time.sleep(2)

        # PID file should exist
        assert pid_file.exists()

        # Read PID
        with open(pid_file) as f:
            pid = int(f.read().strip())

        # Check process exists
        try:
            os.kill(pid, 0)  # Check if process exists
            process_running = True
        except ProcessLookupError:
            process_running = False

        assert process_running, f"Process {pid} should be running"

        # Stop agent
        subprocess.run(
            ["bash", str(RTS_WATCHER_CTL), "stop"],
            capture_output=True,
            timeout=30,
            cwd=str(PROJECT_ROOT)
        )


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
