import pytest
from pathlib import Path
from geos.utils.test_runner import TestRunner, TestResult


def test_test_runner_init():
    """Test TestRunner initialization."""
    runner = TestRunner()
    assert runner.pytest_args == ["pytest", "--tb=short", "-q", "tests"]


def test_test_runner_with_path():
    """Test TestRunner with path scope."""
    runner = TestRunner(path="tests/geos")
    assert "tests/geos" in runner.pytest_args


def test_test_runner_with_scope_evolution():
    """Test TestRunner with evolution scope."""
    runner = TestRunner(scope="evolution")
    assert "tests/evolution_daemon" in runner.pytest_args


def test_test_runner_run_empty_path(tmp_path):
    """Test TestRunner returns empty result for no tests."""
    runner = TestRunner(path=str(tmp_path))
    result = runner.run()
    assert isinstance(result, TestResult)
    assert result.total == 0
    assert result.passed == 0
    assert result.failed == 0