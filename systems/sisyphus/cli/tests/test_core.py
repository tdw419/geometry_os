"""
Unit tests for Sisyphus CLI core functionality.

Tests the CLI commands with mocked daemon responses.
No external dependencies - all daemon interactions are mocked.
"""

import json
import sys
from io import StringIO
from pathlib import Path
from unittest.mock import MagicMock, patch

import pytest
from click.testing import CliRunner

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.sisyphus.cli.core.main import (
    cli,
    daemon_status_dict,
    json_output,
    task_to_dict,
)
from systems.sisyphus.daemon import TaskState, Task


# Fixtures
@pytest.fixture
def runner():
    """Click CLI test runner."""
    return CliRunner()


@pytest.fixture
def mock_daemon():
    """Mock SisyphusDaemon for testing."""
    daemon = MagicMock()
    daemon.running = True
    daemon.enable_brain_evolution = True
    daemon.enable_self_rewriting = False
    daemon.enable_tectonic = True
    daemon.router = MagicMock()
    daemon.brain_hook = MagicMock()
    daemon.critic = MagicMock()
    daemon._generation_failures = 0

    # Mock tasks
    task1 = Task(
        number=1,
        name="Test Task",
        description="Test description",
        verification="Test verification",
        line_number=0,
        state=TaskState.PENDING
    )
    task2 = Task(
        number=2,
        name="Complete Task",
        description="Done",
        verification="Verified",
        line_number=1,
        state=TaskState.COMPLETE
    )
    task3 = Task(
        number=3,
        name="Failed Task",
        description="Error occurred",
        verification="Check logs",
        line_number=2,
        state=TaskState.FAILED
    )

    daemon.get_tasks.return_value = [task1, task2, task3]

    return daemon


# Unit Tests for Helper Functions
class TestHelperFunctions:
    """Test utility functions."""

    def test_json_output_dict(self):
        """json_output should format dict as JSON."""
        data = {"key": "value", "number": 42}
        result = json_output(data)
        parsed = json.loads(result)
        assert parsed["key"] == "value"
        assert parsed["number"] == 42

    def test_json_output_with_datetime(self):
        """json_output should handle datetime objects."""
        from datetime import datetime
        data = {"timestamp": datetime(2024, 1, 1, 12, 0, 0)}
        result = json_output(data)
        parsed = json.loads(result)
        assert "2024-01-01" in parsed["timestamp"]

    def test_task_to_dict(self):
        """task_to_dict should convert Task to dict."""
        task = Task(
            number=42,
            name="Test",
            description="Desc",
            verification="Verif",
            line_number=10,
            state=TaskState.PENDING
        )
        result = task_to_dict(task)
        assert result["number"] == 42
        assert result["name"] == "Test"
        assert result["state"] == " "
        assert result["line_number"] == 10

    def test_daemon_status_dict(self, mock_daemon):
        """daemon_status_dict should return correct structure."""
        result = daemon_status_dict(mock_daemon)

        assert "timestamp" in result
        assert result["running"] is True
        assert result["brain_evolution"] is True
        assert result["tectonic"] is True
        assert result["router_available"] is True
        assert result["generation_failures"] == 0

        assert "tasks" in result
        assert result["tasks"]["total"] == 3
        assert result["tasks"]["pending"] == 1
        assert result["tasks"]["complete"] == 1
        assert result["tasks"]["failed"] == 1


# CLI Command Tests
class TestCLICommands:
    """Test CLI commands."""

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_status_command(self, mock_daemon_class, runner, mock_daemon):
        """status command should show daemon status."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['status'])

        assert result.exit_code == 0
        assert "Sisyphus Daemon Status" in result.output
        assert "pending" in result.output.lower()

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_status_json_command(self, mock_daemon_class, runner, mock_daemon):
        """status --json should output JSON."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['--json', 'status'])

        assert result.exit_code == 0
        # Parse JSON output
        json_start = result.output.find('{')
        assert json_start >= 0
        parsed = json.loads(result.output[json_start:])
        assert "tasks" in parsed
        assert parsed["running"] is True

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_tasks_command(self, mock_daemon_class, runner, mock_daemon):
        """tasks command should list tasks."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['tasks'])

        assert result.exit_code == 0
        assert "Test Task" in result.output

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_tasks_json_command(self, mock_daemon_class, runner, mock_daemon):
        """tasks --json should output JSON."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['--json', 'tasks'])

        assert result.exit_code == 0
        json_start = result.output.find('{')
        parsed = json.loads(result.output[json_start:])
        assert "tasks" in parsed
        assert len(parsed["tasks"]) >= 1

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_show_command(self, mock_daemon_class, runner, mock_daemon):
        """show command should display task details."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['show', '1'])

        assert result.exit_code == 0
        assert "Test Task" in result.output
        assert "Test description" in result.output

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_show_nonexistent_task(self, mock_daemon_class, runner, mock_daemon):
        """show command should error on non-existent task."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['show', '999'])

        assert result.exit_code == 1
        assert "not found" in result.output.lower()

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_health_command(self, mock_daemon_class, runner, mock_daemon):
        """health command should check component status."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['health'])

        assert result.exit_code == 0
        assert "HEALTHY" in result.output

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_health_json_command(self, mock_daemon_class, runner, mock_daemon):
        """health --json should output JSON health status."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['--json', 'health'])

        assert result.exit_code == 0
        json_start = result.output.find('{')
        parsed = json.loads(result.output[json_start:])
        assert "healthy" in parsed
        assert "components" in parsed


class TestHelpCommands:
    """Test help and discovery."""

    def test_main_help(self, runner):
        """--help should show all commands."""
        result = runner.invoke(cli, ['--help'])

        assert result.exit_code == 0
        assert "status" in result.output
        assert "tasks" in result.output
        assert "show" in result.output
        assert "run" in result.output
        assert "generate" in result.output
        assert "logs" in result.output
        assert "health" in result.output
        assert "repl" in result.output

    def test_status_help(self, runner):
        """status --help should describe the command."""
        result = runner.invoke(cli, ['status', '--help'])

        assert result.exit_code == 0
        assert "daemon status" in result.output.lower()

    def test_tasks_help(self, runner):
        """tasks --help should show options."""
        result = runner.invoke(cli, ['tasks', '--help'])

        assert result.exit_code == 0
        assert "--limit" in result.output
        assert "--state" in result.output


class TestTaskStates:
    """Test task state handling."""

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_tasks_filter_pending(self, mock_daemon_class, runner, mock_daemon):
        """tasks --state pending should filter correctly."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['tasks', '--state', 'pending'])

        assert result.exit_code == 0
        assert "Test Task" in result.output

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_tasks_filter_complete(self, mock_daemon_class, runner, mock_daemon):
        """tasks --state complete should filter correctly."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['tasks', '--state', 'complete'])

        assert result.exit_code == 0
        assert "Complete Task" in result.output

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_tasks_filter_failed(self, mock_daemon_class, runner, mock_daemon):
        """tasks --state failed should filter correctly."""
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['tasks', '--state', 'failed'])

        assert result.exit_code == 0
        assert "Failed Task" in result.output


class TestEdgeCases:
    """Test edge cases and error handling."""

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_empty_task_list(self, mock_daemon_class, runner):
        """Should handle empty task list gracefully."""
        mock_daemon = MagicMock()
        mock_daemon.get_tasks.return_value = []
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['tasks'])

        assert result.exit_code == 0
        assert "0" in result.output

    @patch('systems.sisyphus.cli.core.main.SisyphusDaemon')
    def test_no_router_available(self, mock_daemon_class, runner):
        """Should report when router is unavailable."""
        mock_daemon = MagicMock()
        mock_daemon.get_tasks.return_value = []
        mock_daemon.router = None
        mock_daemon.brain_hook = None
        mock_daemon.critic = None
        mock_daemon._generation_failures = 5
        mock_daemon_class.return_value = mock_daemon

        result = runner.invoke(cli, ['health'])

        assert result.exit_code == 0
        # Should show degraded status

    def test_invalid_command(self, runner):
        """Should error on invalid command."""
        result = runner.invoke(cli, ['invalid-command'])

        assert result.exit_code != 0


# Run tests if executed directly
if __name__ == '__main__':
    pytest.main([__file__, '-v'])
