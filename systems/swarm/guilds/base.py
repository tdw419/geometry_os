"""
GuildAgent - Abstract base class for specialized guild agents.

Guild agents are specialized SwarmAgents with specific roles like
code generation, review, and architecture design.
"""

from abc import ABC, abstractmethod
from typing import Optional, Dict, Any, List, TYPE_CHECKING

from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.task import TaskType
from systems.swarm.task_board import TaskBoard

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


class GuildAgent(SwarmAgent, ABC):
    """
    Abstract base class for guild agents.

    Guild agents extend SwarmAgent with:
    - A role identifier (e.g., "engineer", "reviewer", "architect")
    - Event bus integration for publishing results
    - Abstract _summarize() method for result summarization

    Subclasses must implement:
    - _summarize(result: Dict) -> str: Summarize task result
    """

    def __init__(
        self,
        agent_id: str,
        task_board: TaskBoard,
        role: str,
        event_bus: Optional['NEBBus'] = None,
        capabilities: Optional[List[str]] = None,
        handlers: Optional[Dict[TaskType, Any]] = None,
        auto_claim: bool = False
    ):
        """
        Initialize a guild agent.

        Args:
            agent_id: Unique identifier for this agent
            task_board: TaskBoard to pull tasks from
            role: Role identifier (e.g., "engineer", "reviewer", "architect")
            event_bus: Optional NEBBus for publishing result events
            capabilities: List of task types this agent can handle
            handlers: Optional mapping of task types to handler functions
            auto_claim: If True, automatically claim tasks when notified via NEB
        """
        super().__init__(
            agent_id=agent_id,
            task_board=task_board,
            capabilities=capabilities,
            handlers=handlers,
            auto_claim=auto_claim
        )
        self.role = role
        self.event_bus = event_bus

    def _publish_result(self, topic: str, payload: Dict[str, Any]) -> None:
        """
        Publish a result event to the event bus.

        Args:
            topic: Event topic (e.g., "guild.engineer.code_generated")
            payload: Event payload data
        """
        if self.event_bus is None:
            return

        self.event_bus.publish(topic, payload)

    @abstractmethod
    def _summarize(self, result: Dict[str, Any]) -> str:
        """
        Summarize a task result for logging/display.

        Args:
            result: The task result dictionary

        Returns:
            Human-readable summary string
        """
        pass
