#!/usr/bin/env python3
"""
Tests for Evolution Daemon.

Tests cover:
- Daemon initialization and configuration
- State persistence and recovery
- Rate limiting
- Heartbeat writing
- Evolution cycle execution
- Graceful shutdown
"""

import json
import os
import signal
import sys
import tempfile
import threading
import time
import unittest
from datetime import datetime, timedelta
from pathlib import Path
from unittest.mock import MagicMock, patch

# Add parent directories to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent.parent.parent))

from systems.visual_shell.swarm.evolution.evolution_daemon import (
    DaemonConfig,
    DaemonState,
    EvolutionDaemon,
    JSONFormatter,
)


class TestDaemonConfig(unittest.TestCase):
    """Tests for DaemonConfig dataclass."""

    def test_default_values(self):
        """Test that default values are set correctly."""
        config = DaemonConfig()

        self.assertEqual(config.interval, 300)
        self.assertEqual(config.max_per_hour, 10)
        self.assertEqual(config.cooldown, 300)
        self.assertFalse(config.dry_run)
        self.assertEqual(config.target_dir, "")
        self.assertEqual(config.state_file, "evolution_state.json")
        self.assertEqual(config.heartbeat_file, "evolution_heartbeat.json")
        self.assertEqual(config.log_dir, "logs/evolution/")
        self.assertEqual(config.heartbeat_interval, 30)
        self.assertEqual(config.max_iterations, 3)

    def test_custom_values(self):
        """Test that custom values are set correctly."""
        config = DaemonConfig(
            interval=600,
            max_per_hour=5,
            cooldown=120,
            dry_run=True,
            target_dir="/custom/path",
            state_file="/custom/state.json",
            heartbeat_file="/custom/heartbeat.json",
            log_dir="/custom/logs/",
            max_iterations=5,
        )

        self.assertEqual(config.interval, 600)
        self.assertEqual(config.max_per_hour, 5)
        self.assertEqual(config.cooldown, 120)
        self.assertTrue(config.dry_run)
        self.assertEqual(config.target_dir, "/custom/path")
        self.assertEqual(config.state_file, "/custom/state.json")
        self.assertEqual(config.heartbeat_file, "/custom/heartbeat.json")
        self.assertEqual(config.log_dir, "/custom/logs/")
        self.assertEqual(config.max_iterations, 5)


class TestDaemonState(unittest.TestCase):
    """Tests for DaemonState dataclass."""

    def test_default_values(self):
        """Test that default state values are empty."""
        state = DaemonState()

        self.assertEqual(state.started_at, "")
        self.assertEqual(state.total_cycles, 0)
        self.assertEqual(state.total_improvements, 0)
        self.assertEqual(state.total_rejections, 0)
        self.assertEqual(state.total_rollbacks, 0)
        self.assertEqual(state.last_cycle_at, "")
        self.assertEqual(state.last_improvement_at, "")
        self.assertEqual(state.current_target, "")
        self.assertEqual(state.recent_improvements, [])
        self.assertEqual(state.recent_rejections, [])
        self.assertEqual(state.errors, [])

    def test_custom_values(self):
        """Test that custom state values are set correctly."""
        now = datetime.utcnow().isoformat() + "Z"
        state = DaemonState(
            started_at=now,
            total_cycles=10,
            total_improvements=5,
            total_rejections=3,
            total_rollbacks=1,
            last_cycle_at=now,
            last_improvement_at=now,
            current_target="test.py",
            recent_improvements=[now],
            recent_rejections=[],
            errors=[{"error": "test"}],
        )

        self.assertEqual(state.started_at, now)
        self.assertEqual(state.total_cycles, 10)
        self.assertEqual(state.total_improvements, 5)
        self.assertEqual(state.total_rejections, 3)
        self.assertEqual(state.total_rollbacks, 1)
        self.assertEqual(state.last_cycle_at, now)
        self.assertEqual(state.last_improvement_at, now)
        self.assertEqual(state.current_target, "test.py")
        self.assertEqual(len(state.recent_improvements), 1)
        self.assertEqual(len(state.errors), 1)

    def test_serialization(self):
        """Test that state can be serialized to/from dict."""
        from dataclasses import asdict

        state = DaemonState(
            total_cycles=5,
            total_improvements=2,
        )

        data = asdict(state)
        self.assertEqual(data["total_cycles"], 5)
        self.assertEqual(data["total_improvements"], 2)

        # Reconstruct
        state2 = DaemonState(**data)
        self.assertEqual(state2.total_cycles, 5)
        self.assertEqual(state2.total_improvements, 2)


class TestEvolutionDaemon(unittest.TestCase):
    """Tests for EvolutionDaemon class."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()
        self.swarm_dir = Path(self.temp_dir) / "swarm"
        self.swarm_dir.mkdir()

        # Create a sample Python file to target
        self.sample_file = self.swarm_dir / "sample.py"
        self.sample_file.write_text("""
def hello():
    '''A simple function.'''
    return "Hello, World!"
""")

        # Create config
        self.config = DaemonConfig(
            interval=1,  # Short for testing
            max_per_hour=100,  # High limit for testing
            cooldown=0,  # No cooldown for testing
            dry_run=True,  # Don't actually modify files
            target_dir=str(self.swarm_dir),
            state_file=str(Path(self.temp_dir) / "state.json"),
            heartbeat_file=str(Path(self.temp_dir) / "heartbeat.json"),
            log_dir=str(Path(self.temp_dir) / "logs"),
        )

    def tearDown(self):
        """Clean up test fixtures."""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_initialization(self):
        """Test daemon initializes correctly."""
        daemon = EvolutionDaemon(self.config)

        self.assertIsNotNone(daemon.orchestrator)
        self.assertIsNotNone(daemon.tracker)
        self.assertIsNotNone(daemon.evaluator)
        self.assertIsNotNone(daemon.axion_core)
        self.assertFalse(daemon.running)

    def test_state_persistence(self):
        """Test that state is saved and loaded correctly."""
        daemon1 = EvolutionDaemon(self.config)
        daemon1.state.total_cycles = 10
        daemon1.state.total_improvements = 5
        daemon1._save_state()

        # Create new daemon instance - should load state
        daemon2 = EvolutionDaemon(self.config)

        self.assertEqual(daemon2.state.total_cycles, 10)
        self.assertEqual(daemon2.state.total_improvements, 5)

    def test_heartbeat_writing(self):
        """Test that heartbeat file is written correctly."""
        daemon = EvolutionDaemon(self.config)
        daemon._write_heartbeat()

        heartbeat_path = Path(self.config.heartbeat_file)
        self.assertTrue(heartbeat_path.exists())

        with open(heartbeat_path) as f:
            data = json.load(f)

        self.assertIn("timestamp", data)
        self.assertIn("running", data)
        self.assertIn("pid", data)
        self.assertIn("state", data)
        self.assertIn("orchestrator", data)

    def test_rate_limiting(self):
        """Test rate limiting functionality."""
        config = DaemonConfig(
            max_per_hour=2,
            target_dir=str(self.swarm_dir),
            state_file=str(Path(self.temp_dir) / "state.json"),
            heartbeat_file=str(Path(self.temp_dir) / "heartbeat.json"),
            log_dir=str(Path(self.temp_dir) / "logs"),
        )

        daemon = EvolutionDaemon(config)

        # Should be under limit initially
        self.assertTrue(daemon._check_rate_limit())

        # Add improvements
        daemon._record_improvement()
        self.assertTrue(daemon._check_rate_limit())

        daemon._record_improvement()
        # Now at limit
        self.assertFalse(daemon._check_rate_limit())

    def test_rate_limiting_time_window(self):
        """Test that rate limiting respects time window."""
        config = DaemonConfig(
            max_per_hour=1,
            target_dir=str(self.swarm_dir),
            state_file=str(Path(self.temp_dir) / "state.json"),
            heartbeat_file=str(Path(self.temp_dir) / "heartbeat.json"),
            log_dir=str(Path(self.temp_dir) / "logs"),
        )

        daemon = EvolutionDaemon(config)

        # Add an old improvement (more than 1 hour ago)
        old_time = (datetime.utcnow() - timedelta(hours=2)).isoformat() + "Z"
        daemon.state.recent_improvements = [old_time]

        # Should be under limit because old entry is expired
        self.assertTrue(daemon._check_rate_limit())

    def test_target_selection(self):
        """Test target file selection."""
        daemon = EvolutionDaemon(self.config)

        target = daemon._select_target()

        # Should find our sample file
        self.assertIsNotNone(target)
        self.assertIn("sample.py", target.file_path)

    def test_evolution_cycle_dry_run(self):
        """Test evolution cycle in dry-run mode."""
        daemon = EvolutionDaemon(self.config)

        # Create a mock target
        from systems.visual_shell.swarm.evolution import AxionTarget

        target = AxionTarget(
            file_path=str(self.sample_file),
            value_score=0.5,
        )

        result = daemon._run_evolution_cycle(target)

        self.assertTrue(result.success)
        self.assertTrue(result.metadata.get("dry_run", False))
        self.assertEqual(daemon.state.total_cycles, 1)
        self.assertEqual(daemon.state.total_improvements, 1)

    def test_error_recording(self):
        """Test error recording functionality."""
        daemon = EvolutionDaemon(self.config)

        daemon._record_error("Test error", {"context": "test"})
        daemon._record_error("Another error")

        self.assertEqual(len(daemon.state.errors), 2)
        self.assertEqual(daemon.state.errors[0]["error"], "Test error")
        self.assertEqual(daemon.state.errors[0]["context"]["context"], "test")

    def test_uptime_calculation(self):
        """Test uptime calculation."""
        daemon = EvolutionDaemon(self.config)

        # No start time
        self.assertEqual(daemon._calculate_uptime(), 0.0)

        # Set start time
        daemon.state.started_at = datetime.utcnow().isoformat() + "Z"
        uptime = daemon._calculate_uptime()

        # Should be very small (just set)
        self.assertGreaterEqual(uptime, 0.0)
        self.assertLess(uptime, 1.0)

    def test_status_report(self):
        """Test status report generation."""
        daemon = EvolutionDaemon(self.config)
        daemon.state.total_cycles = 5
        daemon.state.total_improvements = 3

        report = daemon.generate_status_report()

        self.assertIn("daemon", report)
        self.assertIn("state", report)
        self.assertIn("orchestrator", report)
        self.assertIn("tracker", report)
        self.assertIn("config", report)
        self.assertIn("rate_limit", report)

        self.assertEqual(report["state"]["total_cycles"], 5)
        self.assertEqual(report["state"]["total_improvements"], 3)

    def test_graceful_shutdown(self):
        """Test graceful shutdown handling."""
        daemon = EvolutionDaemon(self.config)

        # Initially not requesting shutdown
        self.assertFalse(daemon._should_shutdown())

        # Simulate SIGTERM
        daemon._handle_shutdown_signal(signal.SIGTERM, None)

        # Should now be requesting shutdown
        self.assertTrue(daemon._should_shutdown())


class TestJSONFormatter(unittest.TestCase):
    """Tests for JSONFormatter logging class."""

    def test_basic_formatting(self):
        """Test basic JSON log formatting."""
        import logging

        formatter = JSONFormatter()
        record = logging.LogRecord(
            name="test",
            level=logging.INFO,
            pathname="test.py",
            lineno=1,
            msg="Test message",
            args=(),
            exc_info=None,
        )

        output = formatter.format(record)
        data = json.loads(output)

        self.assertEqual(data["level"], "INFO")
        self.assertEqual(data["logger"], "test")
        self.assertEqual(data["message"], "Test message")
        self.assertIn("timestamp", data)

    def test_extra_fields(self):
        """Test that extra fields are included in JSON output."""
        import logging

        formatter = JSONFormatter()
        record = logging.LogRecord(
            name="test",
            level=logging.INFO,
            pathname="test.py",
            lineno=1,
            msg="Test message",
            args=(),
            exc_info=None,
        )
        record.target_file = "/path/to/file.py"
        record.duration_ms = 123

        output = formatter.format(record)
        data = json.loads(output)

        self.assertEqual(data["target_file"], "/path/to/file.py")
        self.assertEqual(data["duration_ms"], 123)


class TestIntegration(unittest.TestCase):
    """Integration tests for the evolution daemon."""

    def setUp(self):
        """Set up test fixtures."""
        self.temp_dir = tempfile.mkdtemp()
        self.swarm_dir = Path(self.temp_dir) / "swarm"
        self.swarm_dir.mkdir()

        # Create sample files
        for i in range(3):
            sample_file = self.swarm_dir / f"module_{i}.py"
            sample_file.write_text(f"""
def function_{i}():
    '''Module {i} function.'''
    return {i}
""")

    def tearDown(self):
        """Clean up test fixtures."""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)

    def test_full_cycle_dry_run(self):
        """Test a full evolution cycle in dry-run mode."""
        config = DaemonConfig(
            interval=1,
            max_per_hour=100,
            cooldown=0,
            dry_run=True,
            target_dir=str(self.swarm_dir),
            state_file=str(Path(self.temp_dir) / "state.json"),
            heartbeat_file=str(Path(self.temp_dir) / "heartbeat.json"),
            log_dir=str(Path(self.temp_dir) / "logs"),
        )

        daemon = EvolutionDaemon(config)

        # Select target and run cycle
        target = daemon._select_target()
        self.assertIsNotNone(target)

        result = daemon._run_evolution_cycle(target)

        self.assertTrue(result.success)
        self.assertEqual(daemon.state.total_cycles, 1)
        self.assertEqual(daemon.state.total_improvements, 1)

        # Verify state was saved
        state_path = Path(config.state_file)
        self.assertTrue(state_path.exists())

        # Verify heartbeat was written
        daemon._write_heartbeat()
        heartbeat_path = Path(config.heartbeat_file)
        self.assertTrue(heartbeat_path.exists())


if __name__ == "__main__":
    unittest.main()
