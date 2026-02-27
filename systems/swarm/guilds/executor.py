# systems/swarm/guilds/executor.py
"""Sandboxed code execution with resource limits."""

import subprocess
import resource
import sys
from dataclasses import dataclass
from typing import Dict, Any, Optional, TYPE_CHECKING

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


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


class ExecutorAgent(GuildAgent):
    """
    Agent for executing code in sandboxed environment.

    Capabilities:
    - CODE_EXECUTION: Run Python code with resource limits
    - TEST_RUNNER: Execute test suites
    """

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        event_bus: Optional['NEBBus'] = None,
        auto_claim: bool = False,
        timeout_seconds: int = 30,
        max_memory_mb: int = 512
    ):
        """Initialize ExecutorAgent with sandbox configuration."""
        self.sandbox = SandboxExecutor(
            timeout_seconds=timeout_seconds,
            max_memory_mb=max_memory_mb
        )

        capabilities = [
            TaskType.CODE_EXECUTION.value if hasattr(TaskType, 'CODE_EXECUTION') else 'CODE_EXECUTION',
            TaskType.TEST_RUNNER.value if hasattr(TaskType, 'TEST_RUNNER') else 'TEST_RUNNER'
        ]

        handlers = {
            TaskType.CODE_EXECUTION if hasattr(TaskType, 'CODE_EXECUTION') else 'CODE_EXECUTION': self._execute_code,
            TaskType.TEST_RUNNER if hasattr(TaskType, 'TEST_RUNNER') else 'TEST_RUNNER': self._run_tests
        }

        super().__init__(
            agent_id=agent_id,
            task_board=task_board,
            role="executor",
            event_bus=event_bus,
            capabilities=capabilities,
            handlers=handlers,
            auto_claim=auto_claim
        )

    def _execute_code(self, task: Task) -> Dict[str, Any]:
        """Execute Python code in sandbox."""
        code = task.payload.get("code", "")

        if not code:
            return {
                "success": False,
                "error": "No code provided",
                "stdout": "",
                "stderr": ""
            }

        result = self.sandbox.run_python(code)

        return {
            "success": result.success,
            "stdout": result.stdout,
            "stderr": result.stderr,
            "return_code": result.return_code,
            "timed_out": result.timed_out
        }

    def _run_tests(self, task: Task) -> Dict[str, Any]:
        """Run test suite."""
        test_code = task.payload.get("test_code", "")
        test_file = task.payload.get("test_file", "")

        if test_file:
            # Run pytest on file
            try:
                result = subprocess.run(
                    ["python3", "-m", "pytest", test_file, "-v", "--tb=short"],
                    capture_output=True,
                    text=True,
                    timeout=60
                )
                return {
                    "success": result.returncode == 0,
                    "stdout": result.stdout,
                    "stderr": result.stderr,
                    "return_code": result.returncode
                }
            except subprocess.TimeoutExpired:
                return {
                    "success": False,
                    "stdout": "",
                    "stderr": "Test execution timed out",
                    "return_code": -1
                }
            except Exception as e:
                return {
                    "success": False,
                    "stdout": "",
                    "stderr": str(e),
                    "return_code": -1
                }
        elif test_code:
            # Run inline test code
            return self._execute_code(task)
        else:
            return {
                "success": False,
                "error": "No test code or test file provided",
                "stdout": "",
                "stderr": ""
            }

    def _summarize(self, result: Dict[str, Any]) -> str:
        """Create brief summary of execution result."""
        if result.get("success"):
            return f"Execution succeeded (exit code: {result.get('return_code', 0)})"
        elif result.get("timed_out"):
            return "Execution timed out"
        else:
            return f"Execution failed: {result.get('error', result.get('stderr', 'unknown')[:50])}"

    def complete_task(self, task: Task, result: Dict[str, Any]) -> bool:
        """Complete task and publish result event."""
        success = super().complete_task(task, result)

        if success:
            topic = f"guild.executor.{task.task_type.value.lower() if hasattr(task.task_type, 'value') else 'execution'}"
            self._publish_result(topic, {
                "agent_id": self.agent_id,
                "task_id": task.task_id,
                "summary": self._summarize(result),
                "result": result
            })

        return success
