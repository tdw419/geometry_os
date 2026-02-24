"""
EngineerAgent - Code generation specialist.

Handles CODE_GENERATION and CODE_TESTING tasks.
"""

import traceback
from typing import Dict, Any, Optional, TYPE_CHECKING

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


class EngineerAgent(GuildAgent):
    """
    Engineer agent for code generation and testing tasks.

    Capabilities:
    - CODE_GENERATION: Generate code from specifications using LLM
    - CODE_TESTING: Execute tests in sandbox
    """

    # Default code template for fallback
    CODE_TEMPLATE = '''"""
Generated code module.
"""

def main():
    """Entry point."""
    print("Hello from generated code!")

if __name__ == "__main__":
    main()
'''

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        event_bus: Optional['NEBBus'] = None,
        auto_claim: bool = False,
        llm_provider=None,
        executor=None,
    ):
        """
        Initialize engineer agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard to pull tasks from
            event_bus: Optional NEBBus for publishing result events
            auto_claim: If True, automatically claim tasks when notified
            llm_provider: Optional LLM provider for code generation
            executor: Optional SandboxExecutor for code testing
        """
        self.llm = llm_provider
        self.executor = executor

        capabilities = [
            TaskType.CODE_GENERATION.value,
            TaskType.CODE_TESTING.value
        ]

        handlers = {
            TaskType.CODE_GENERATION: self._handle_code_generation,
            TaskType.CODE_TESTING: self._handle_code_testing
        }

        super().__init__(
            agent_id=agent_id,
            task_board=task_board,
            role="engineer",
            event_bus=event_bus,
            capabilities=capabilities,
            handlers=handlers,
            auto_claim=auto_claim
        )

    def _summarize(self, result: Dict[str, Any]) -> str:
        """
        Summarize task result.

        Args:
            result: Task result dictionary

        Returns:
            Human-readable summary
        """
        if result.get("success"):
            if "code" in result:
                lines = result["code"].count("\n") + 1
                lang = result.get("language", "unknown")
                return f"Generated {lines} lines of {lang} code"
            elif "passed" in result:
                return "Tests passed" if result["passed"] else "Tests failed"
        elif "error" in result:
            return f"Error: {result['error']}"
        return "Task completed"

    async def write_code(self, task: Task) -> Dict[str, Any]:
        """
        Generate code using LLM provider.

        Args:
            task: Task with code generation payload

        Returns:
            Result with generated code
        """
        spec = task.payload.get("spec", task.description)
        language = task.payload.get("language", "python")

        if self.llm is None:
            return self._template_code(spec, language)

        try:
            prompt = f"""Generate {language} code for:
{spec}

Return only the code, no explanations."""

            code = await self.llm.generate(prompt, temperature=0.3)
            return {
                "code": code,
                "language": language,
                "success": True,
                "generated_by": self.agent_id
            }

        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "success": False
            }

    def test_code(self, task: Task) -> Dict[str, Any]:
        """
        Execute tests in sandbox.

        Args:
            task: Task with code and tests payload

        Returns:
            Result with test execution status
        """
        code = task.payload.get("code", "")
        tests = task.payload.get("tests", "")

        if self.executor is None:
            return {"passed": False, "error": "No executor configured"}

        full_code = f"{code}\n\n{tests}"
        result = self.executor.run_python(full_code)

        return {
            "passed": result.success,
            "output": result.stdout or result.stderr,
            "timed_out": result.timed_out,
            "generated_by": self.agent_id
        }

    def _template_code(self, spec: str, language: str) -> Dict[str, Any]:
        """Fallback template code generation."""
        return {
            "code": f"# TODO: Implement\n# {spec}\npass",
            "language": language,
            "success": True,
            "generated_by": self.agent_id
        }

    def _handle_code_generation(self, task: Task) -> Dict[str, Any]:
        """
        Handle CODE_GENERATION task (sync wrapper).

        Args:
            task: Task to process

        Returns:
            Result with generated code
        """
        try:
            import asyncio
            # Handle both async and sync contexts
            try:
                asyncio.get_running_loop()
                # We're in an async context, create a task
                import concurrent.futures
                with concurrent.futures.ThreadPoolExecutor() as pool:
                    future = pool.submit(asyncio.run, self.write_code(task))
                    return future.result()
            except RuntimeError:
                # No running loop, we can use asyncio.run
                return asyncio.run(self.write_code(task))
        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "traceback": traceback.format_exc(),
                "actionable_info": f"Code generation failed: {e}"
            }

    def _handle_code_testing(self, task: Task) -> Dict[str, Any]:
        """
        Handle CODE_TESTING task.

        Args:
            task: Task to process

        Returns:
            Result with test execution status
        """
        try:
            return self.test_code(task)
        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "traceback": traceback.format_exc(),
                "passed": False,
                "actionable_info": f"Test execution failed: {e}"
            }

    def complete_task(self, task: Task, result: Dict[str, Any]) -> bool:
        """
        Complete task and publish result event.

        Args:
            task: Task to complete
            result: Result data

        Returns:
            True if successful
        """
        success = super().complete_task(task, result)

        if success:
            # Publish result event
            topic = f"guild.engineer.{task.task_type.value.lower()}"
            self._publish_result(topic, {
                "agent_id": self.agent_id,
                "task_id": task.task_id,
                "summary": self._summarize(result),
                "result": result
            })

        return success
