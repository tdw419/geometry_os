# systems/testing/tests/test_test_runner.py
"""
Tests for TestRunner component.

TDD: Tests written first, implementation follows.
"""

import pytest
from pathlib import Path
from unittest.mock import patch, MagicMock


class TestTestRunnerInit:
    """Test TestRunner initialization."""

    def test_init_with_project_root(self):
        """TestRunner initializes with project root path."""
        from systems.testing.test_runner import TestRunner

        runner = TestRunner(project_root="/path/to/project")

        assert runner.project_root == Path("/path/to/project")

    def test_init_with_default_project_root(self):
        """TestRunner uses cwd as default project root."""
        from systems.testing.test_runner import TestRunner

        runner = TestRunner()

        assert runner.project_root == Path.cwd()

    def test_init_stores_options(self):
        """TestRunner stores execution options."""
        from systems.testing.test_runner import TestRunner

        runner = TestRunner(
            project_root="/path/to/project",
            coverage=True,
            failfast=True,
            verbose=True
        )

        assert runner.coverage is True
        assert runner.failfast is True
        assert runner.verbose is True


class TestTestRunnerBuildCommand:
    """Test pytest command building."""

    def test_build_basic_command(self):
        """Builds basic pytest command."""
        from systems.testing.test_runner import TestRunner

        runner = TestRunner(project_root="/project")

        cmd = runner.build_command()

        assert "python3" in cmd
        assert "-m" in cmd
        assert "pytest" in cmd
        assert "--junitxml" in cmd

    def test_build_command_with_pattern(self):
        """Builds command with test pattern (-k)."""
        from systems.testing.test_runner import TestRunner

        runner = TestRunner(project_root="/project")

        cmd = runner.build_command(test_pattern="test_wasm_*")

        assert "-k" in cmd
        assert "test_wasm_*" in cmd

    def test_build_command_with_failfast(self):
        """Builds command with failfast flag (-x)."""
        from systems.testing.test_runner import TestRunner

        runner = TestRunner(project_root="/project", failfast=True)

        cmd = runner.build_command()

        assert "-x" in cmd

    def test_build_command_with_verbose(self):
        """Builds command with verbose flag (-v)."""
        from systems.testing.test_runner import TestRunner

        runner = TestRunner(project_root="/project", verbose=True)

        cmd = runner.build_command()

        assert "-v" in cmd

    def test_build_command_with_coverage(self):
        """Builds command with coverage flags."""
        from systems.testing.test_runner import TestRunner

        runner = TestRunner(project_root="/project", coverage=True)

        cmd = runner.build_command()

        assert "--cov=." in cmd
        assert "--cov-report" in cmd


class TestTestRunnerRunTests:
    """Test test execution."""

    @patch("subprocess.run")
    def test_run_returns_structured_results(self, mock_run):
        """run() returns structured test results."""
        from systems.testing.test_runner import TestRunner

        # Mock subprocess result
        mock_result = MagicMock()
        mock_result.returncode = 0
        mock_result.stdout = ""
        mock_run.return_value = mock_result

        runner = TestRunner(project_root="/project")
        result = runner.run()

        assert "success" in result
        assert "total" in result
        assert "passed" in result
        assert "failed" in result
        assert "results" in result

    @patch("subprocess.run")
    def test_run_with_test_file(self, mock_run):
        """run() accepts specific test file."""
        from systems.testing.test_runner import TestRunner

        mock_result = MagicMock()
        mock_result.returncode = 0
        mock_result.stdout = ""
        mock_run.return_value = mock_result

        runner = TestRunner(project_root="/project")
        result = runner.run(test_file="tests/test_example.py")

        # Verify the command includes the test file
        call_args = mock_run.call_args[0][0]
        assert "tests/test_example.py" in call_args
