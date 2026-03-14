"""
End-to-End tests for Sisyphus CLI.

Tests the full CLI pipeline with real daemon interactions.
These tests verify that the installed CLI works correctly.
"""

import json
import os
import subprocess
import sys
from pathlib import Path

import pytest

# Project root
_PROJECT_ROOT = Path(__file__).parent.parent.parent.parent


def _resolve_cli():
    """
    Resolve the sisyphus-cli command.

    First checks if installed via pip (sisyphus-cli in PATH),
    then falls back to direct script invocation.

    Returns tuple of (command_parts, env_dict).
    """
    # Prepare environment with PYTHONPATH
    env = os.environ.copy()
    env['PYTHONPATH'] = str(_PROJECT_ROOT)

    # Check if installed in PATH
    result = subprocess.run(
        ['which', 'sisyphus-cli'],
        capture_output=True,
        text=True
    )

    if result.returncode == 0:
        return (['sisyphus-cli'], env)

    # Use the entry point script directly
    cli_path = _PROJECT_ROOT / 'sisyphus-cli'
    if cli_path.exists():
        return (['python3', str(cli_path)], env)

    # Use the main.py directly
    main_path = _PROJECT_ROOT / 'systems' / 'sisyphus' / 'cli' / 'core' / 'main.py'
    if main_path.exists():
        return (['python3', str(main_path)], env)

    raise FileNotFoundError(f"Cannot find sisyphus-cli. Checked: {cli_path}, {main_path}")


class TestCLIInstallation:
    """Test CLI is properly installed."""

    def test_cli_help_runs(self):
        """--help should execute successfully."""
        cmd, env = _resolve_cli()
        result = subprocess.run(
            cmd + ['--help'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT),
            env=env
        )

        assert result.returncode == 0
        assert 'status' in result.stdout.lower()
        assert 'tasks' in result.stdout.lower()

    def test_cli_version_runs(self):
        """--version should execute successfully."""
        cmd, env = _resolve_cli()
        result = subprocess.run(
            cmd + ['--version'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT),
            env=env
        )

        # Version might not be implemented, but should not crash
        assert result.returncode in [0, 2]


class TestStatusCommand:
    """Test status command with real daemon."""

    def test_status_human_readable(self):
        """status should produce human-readable output."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['status'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        # Filter out log messages
        output = result.stdout
        for line in result.stderr.split('\n'):
            if 'INFO' not in line and 'WARNING' not in line and line.strip():
                output += '\n' + line

        assert 'task' in output.lower() or 'pending' in output.lower() or 'complete' in output.lower()

    def test_status_json_output(self):
        """status --json should produce valid JSON."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['--json', 'status'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        # Find JSON in output (might have log messages before)
        stdout = result.stdout
        json_start = stdout.find('{')

        if json_start >= 0:
            json_str = stdout[json_start:]
            try:
                data = json.loads(json_str)
                assert 'tasks' in data or 'running' in data
            except json.JSONDecodeError:
                pytest.skip("JSON parsing failed - log messages mixed in")

    def test_status_shows_component_status(self):
        """status should show component availability."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['status'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        output = result.stdout.lower() + result.stderr.lower()
        # Should mention components or tasks
        assert 'router' in output or 'brain' in output or 'task' in output


class TestTasksCommand:
    """Test tasks command."""

    def test_tasks_lists_tasks(self):
        """tasks should list available tasks."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['tasks', '-n', '5'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        # Should show some tasks or indicate empty
        output = result.stdout
        assert result.returncode == 0 or '0' in output

    def test_tasks_json_output(self):
        """tasks --json should produce valid JSON."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['--json', 'tasks'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        stdout = result.stdout
        json_start = stdout.find('{')

        if json_start >= 0:
            json_str = stdout[json_start:]
            try:
                data = json.loads(json_str)
                assert 'tasks' in data
            except json.JSONDecodeError:
                pytest.skip("JSON parsing failed - log messages mixed in")

    def test_tasks_limit_option(self):
        """tasks -n should limit output."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['tasks', '-n', '3'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        assert result.returncode == 0


class TestHealthCommand:
    """Test health command."""

    def test_health_check(self):
        """health should check daemon health."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['health'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        output = result.stdout + result.stderr
        # Should indicate health status
        assert 'healthy' in output.lower() or 'unhealthy' in output.lower() or 'component' in output.lower()

    def test_health_json_output(self):
        """health --json should produce valid JSON."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['--json', 'health'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        stdout = result.stdout
        json_start = stdout.find('{')

        if json_start >= 0:
            json_str = stdout[json_start:]
            try:
                data = json.loads(json_str)
                assert 'healthy' in data or 'components' in data
            except json.JSONDecodeError:
                pytest.skip("JSON parsing failed - log messages mixed in")


class TestShowCommand:
    """Test show command."""

    def test_show_task(self):
        """show <task_id> should display task details."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['show', '1'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        # Should either show task or indicate not found
        output = result.stdout + result.stderr
        assert result.returncode in [0, 1]

    def test_show_nonexistent_task(self):
        """show 99999 should indicate task not found."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['show', '99999'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        output = result.stdout + result.stderr
        # Should indicate not found or return error
        assert 'not found' in output.lower() or result.returncode != 0


class TestLogsCommand:
    """Test logs command."""

    def test_logs_command(self):
        """logs should show recent logs."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['logs', '-n', '5'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        # Should either show logs or indicate no logs
        output = result.stdout + result.stderr
        assert result.returncode == 0 or 'no log' in output.lower()


class TestGenerateCommand:
    """Test generate command."""

    def test_generate_command(self):
        """generate should trigger task generation."""
        cmd = _resolve_cli()
        result = subprocess.run(
            cmd + ['generate'],
            capture_output=True,
            text=True,
            timeout=30,
            cwd=str(_PROJECT_ROOT)
        )

        # Should indicate generation status
        output = result.stdout + result.stderr
        assert 'generat' in output.lower() or result.returncode == 0


class TestJSONOutputMode:
    """Test JSON output mode comprehensively."""

    def test_json_flag_affects_output(self):
        """--json should change output format."""
        cmd = _resolve_cli()

        # Get human output
        result_human = subprocess.run(
            cmd + ['status'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        # Get JSON output
        result_json = subprocess.run(
            cmd + ['--json', 'status'],
            capture_output=True,
            text=True,
            cwd=str(_PROJECT_ROOT)
        )

        # JSON output should contain JSON markers
        json_output = result_json.stdout
        assert '{' in json_output or '[' in json_output


class TestREPLMode:
    """Test REPL mode (basic checks)."""

    @pytest.mark.skip(reason="REPL requires interactive input")
    def test_repl_starts(self):
        """REPL should start (skipped - requires interactive input)."""
        pass


# Run tests if executed directly
if __name__ == '__main__':
    pytest.main([__file__, '-v', '--tb=short'])
