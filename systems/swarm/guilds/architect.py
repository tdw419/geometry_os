"""
ArchitectAgent - System design and architecture specialist.

Handles ARCHITECTURE_DESIGN and SYSTEM_PLANNING tasks.
"""

import traceback
from typing import Dict, Any, Optional, List, TYPE_CHECKING

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


class ArchitectAgent(GuildAgent):
    """
    Architect agent for system design and planning tasks.

    Capabilities:
    - ARCHITECTURE_DESIGN: Design system architecture and components
    - SYSTEM_PLANNING: Create system implementation plans
    """

    # Default component template for POC
    COMPONENT_TEMPLATE = {
        "name": "Component",
        "type": "module",
        "description": "A system component",
        "dependencies": [],
        "interfaces": []
    }

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        event_bus: Optional['NEBBus'] = None,
        auto_claim: bool = False
    ):
        """
        Initialize architect agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard to pull tasks from
            event_bus: Optional NEBBus for publishing result events
            auto_claim: If True, automatically claim tasks when notified
        """
        capabilities = [
            TaskType.ARCHITECTURE_DESIGN.value,
            TaskType.SYSTEM_PLANNING.value
        ]

        handlers = {
            TaskType.ARCHITECTURE_DESIGN: self._handle_architecture_design,
            TaskType.SYSTEM_PLANNING: self._handle_system_planning
        }

        super().__init__(
            agent_id=agent_id,
            task_board=task_board,
            role="architect",
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
        if "components" in result:
            count = len(result["components"])
            return f"Designed {count} components"
        elif "phases" in result:
            count = len(result["phases"])
            return f"Created {count}-phase implementation plan"
        elif "error" in result:
            return f"Error: {result['error']}"
        return "Architecture task completed"

    def _handle_architecture_design(self, task: Task) -> Dict[str, Any]:
        """
        Handle ARCHITECTURE_DESIGN task.

        Args:
            task: Task to process

        Returns:
            Result with architecture design
        """
        try:
            # POC: Return mock architecture design
            # TODO: Integrate with actual architecture analysis tools
            description = task.description
            requirements = task.payload.get("requirements", [])

            # Generate mock components based on description keywords
            components = []

            if "api" in description.lower():
                components.append({
                    "name": "APIGateway",
                    "type": "service",
                    "description": "API gateway for request routing",
                    "dependencies": [],
                    "interfaces": ["REST", "WebSocket"]
                })

            if "database" in description.lower() or "storage" in description.lower():
                components.append({
                    "name": "DataStore",
                    "type": "storage",
                    "description": "Persistent data storage layer",
                    "dependencies": [],
                    "interfaces": ["CRUD"]
                })

            if "auth" in description.lower() or "user" in description.lower():
                components.append({
                    "name": "AuthService",
                    "type": "service",
                    "description": "Authentication and authorization service",
                    "dependencies": ["DataStore"],
                    "interfaces": ["OAuth2", "JWT"]
                })

            # Default core component if nothing specific
            if not components:
                components.append({
                    "name": "CoreModule",
                    "type": "module",
                    "description": "Core system module",
                    "dependencies": [],
                    "interfaces": ["Internal"]
                })

            return {
                "components": components,
                "architecture_style": "microservices" if len(components) > 2 else "modular",
                "requirements_addressed": len(requirements),
                "designed_by": self.agent_id,
                "recommendations": [
                    "Consider adding caching layer for performance",
                    "Implement circuit breakers for resilience"
                ]
            }
        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "traceback": traceback.format_exc(),
                "actionable_info": f"Architecture design failed: {e}. Check task description and requirements."
            }

    def _handle_system_planning(self, task: Task) -> Dict[str, Any]:
        """
        Handle SYSTEM_PLANNING task.

        Args:
            task: Task to process

        Returns:
            Result with implementation plan
        """
        try:
            # POC: Return mock implementation plan
            # TODO: Integrate with actual planning tools
            description = task.description
            timeline = task.payload.get("timeline_weeks", 4)

            # Generate mock phases
            phases = [
                {
                    "name": "Phase 1: Foundation",
                    "duration_weeks": max(1, timeline // 4),
                    "tasks": [
                        "Set up development environment",
                        "Define project structure",
                        "Create base abstractions"
                    ]
                },
                {
                    "name": "Phase 2: Core Implementation",
                    "duration_weeks": max(1, timeline // 2),
                    "tasks": [
                        "Implement core components",
                        "Add unit tests",
                        "Integration testing"
                    ]
                },
                {
                    "name": "Phase 3: Polish & Deploy",
                    "duration_weeks": max(1, timeline // 4),
                    "tasks": [
                        "Performance optimization",
                        "Documentation",
                        "Production deployment"
                    ]
                }
            ]

            return {
                "phases": phases,
                "total_duration_weeks": timeline,
                "team_size_recommendation": max(2, len(phases)),
                "planned_by": self.agent_id,
                "milestones": [
                    {"name": "MVP Ready", "week": timeline // 2},
                    {"name": "Production Ready", "week": timeline}
                ]
            }
        except Exception as e:
            return {
                "error": str(e),
                "error_type": type(e).__name__,
                "traceback": traceback.format_exc(),
                "actionable_info": f"System planning failed: {e}. Check task description and timeline."
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
            topic = f"guild.architect.{task.task_type.value.lower()}"
            self._publish_result(topic, {
                "agent_id": self.agent_id,
                "task_id": task.task_id,
                "summary": self._summarize(result),
                "result": result
            })

        return success
