# tests/swarm/test_executor.py
"""Tests for sandbox code executor."""

from systems.swarm.guilds.executor import SandboxExecutor, ExecutionResult


class TestExecutionResult:
    """Test ExecutionResult dataclass."""

    def test_result_has_required_fields(self):
        """Result should have all required fields."""
        result = ExecutionResult(
            success=True,
            stdout="output",
            stderr="",
            return_code=0
        )
        assert result.success is True
        assert result.stdout == "output"
        assert result.return_code == 0


class TestSandboxExecutor:
    """Test sandbox executor implementation."""

    def test_executor_exists(self):
        """SandboxExecutor should be instantiable."""
        executor = SandboxExecutor()
        assert executor is not None

    def test_run_python_simple_code(self):
        """Should execute simple Python code."""
        executor = SandboxExecutor(timeout_seconds=5)
        result = executor.run_python("print('hello')")
        assert result.success is True
        assert "hello" in result.stdout

    def test_run_python_captures_output(self):
        """Should capture stdout."""
        executor = SandboxExecutor()
        result = executor.run_python("print(1 + 2)")
        assert result.success is True
        assert "3" in result.stdout

    def test_run_python_captures_errors(self):
        """Should capture stderr on failure."""
        executor = SandboxExecutor()
        result = executor.run_python("raise ValueError('test error')")
        assert result.success is False
        assert "test error" in result.stderr

    def test_run_python_enforces_timeout(self):
        """Should timeout on infinite loop."""
        executor = SandboxExecutor(timeout_seconds=1)
        result = executor.run_python("while True: pass")
        assert result.success is False
        assert result.timed_out is True

    def test_run_python_returns_code_on_success(self):
        """Should have return_code 0 on success."""
        executor = SandboxExecutor()
        result = executor.run_python("x = 1")
        assert result.return_code == 0

    def test_run_python_returns_code_on_error(self):
        """Should have non-zero return_code on error."""
        executor = SandboxExecutor()
        result = executor.run_python("exit(1)")
        assert result.return_code == 1
