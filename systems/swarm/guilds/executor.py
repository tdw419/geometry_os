# systems/swarm/guilds/executor.py
"""Sandboxed code execution with resource limits."""

import subprocess
import resource
import sys
from dataclasses import dataclass


@dataclass
class ExecutionResult:
    """Result of sandboxed code execution."""

    success: bool
    stdout: str
    stderr: str
    return_code: int
    timed_out: bool = False


class SandboxExecutor:
    """Execute Python code with resource limits."""

    def __init__(
        self,
        timeout_seconds: int = 30,
        max_memory_mb: int = 512,
        max_cpu_seconds: int = 10,
    ):
        self.timeout = timeout_seconds
        self.max_memory = max_memory_mb * 1024 * 1024
        self.max_cpu = max_cpu_seconds

    def run_python(self, code: str) -> ExecutionResult:
        """Execute Python code in sandboxed subprocess."""
        def set_limits():
            try:
                resource.setrlimit(
                    resource.RLIMIT_AS,
                    (self.max_memory, self.max_memory)
                )
            except (ValueError, resource.error):
                pass

            try:
                resource.setrlimit(
                    resource.RLIMIT_CPU,
                    (self.max_cpu, self.max_cpu)
                )
            except (ValueError, resource.error):
                pass

        try:
            result = subprocess.run(
                [sys.executable, "-c", code],
                capture_output=True,
                text=True,
                timeout=self.timeout,
                preexec_fn=set_limits
            )

            return ExecutionResult(
                success=result.returncode == 0,
                stdout=result.stdout,
                stderr=result.stderr,
                return_code=result.returncode
            )

        except subprocess.TimeoutExpired:
            return ExecutionResult(
                success=False,
                stdout="",
                stderr=f"Execution timed out after {self.timeout}s",
                return_code=-1,
                timed_out=True
            )

        except Exception as e:
            return ExecutionResult(
                success=False,
                stdout="",
                stderr=str(e),
                return_code=-1
            )
