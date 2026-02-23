"""
EngineerAgent - Code generation specialist.

Handles CODE_GENERATION and CODE_TESTING tasks.
"""

import traceback
from typing import Dict, Any, Optional, List, TYPE_CHECKING

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


class EngineerAgent(GuildAgent):
    """
    Engineer agent for code generation and testing tasks.

    Capabilities:
    - CODE_GENERATION: Generate code from specifications
    - CODE_TESTING: Write tests for code
    """

    # Default code template for POC
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
        auto_claim: bool = False
    ):
        """
        Initialize engineer agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard to pull tasks from
            event_bus: Optional NEBBus for publishing result events
            auto_claim: If True, automatically claim tasks when notified
        """
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
        if "code" in result:
            lines = result["code"].count("\n") + 1
            lang = result.get("language", "unknown")
            return f"Generated {lines} lines of {lang} code"
        elif "tests" in result:
            count = len(result["tests"])
            return f"Generated {count} test cases"
        elif "error" in result:
            return f"Error: {result['error']}"
        return "Task completed"

    def _handle_code_generation(self, task: Task) -> Dict[str, Any]:
        """
        Handle CODE_GENERATION task.

        Args:
            task: Task to process

        Returns:
            Result with generated code
        """
        try:
            # POC: Use template code
            # TODO: Integrate with actual LLM for code generation
            description = task.description
            language = task.payload.get("language", "python")

            code = self.CODE_TEMPLATE

            return {
                "code": code,
                "language": language,
                "description": description,
                "generated_by": self.agent_id
            }
        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "traceback": traceback.format_exc(),
                "actionable_info": f"Code generation failed: {e}. Check task description and payload."
            }

    def _handle_code_testing(self, task: Task) -> Dict[str, Any]:
        """
        Handle CODE_TESTING task.

        Args:
            task: Task to process

        Returns:
            Result with generated tests
        """
        try:
            # POC: Return mock test structure
            # TODO: Integrate with actual test generation
            code = task.payload.get("code", "")

            return {
                "tests": [
                    {
                        "name": "test_main",
                        "code": "def test_main():\\n    assert True",
                        "description": "Basic smoke test"
                    }
                ],
                "target_code": code[:100] + "..." if len(code) > 100 else code,
                "generated_by": self.agent_id
            }
        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "traceback": traceback.format_exc(),
                "actionable_info": f"Test generation failed: {e}. Check task payload for valid code."
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
