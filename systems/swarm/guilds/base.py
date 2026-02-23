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
    from systems.swarm.memory import EpisodicMemory


class GuildAgent(SwarmAgent, ABC):
    """
    Abstract base class for guild agents.

    Guild agents extend SwarmAgent with:
    - A role identifier (e.g., "engineer", "reviewer", "architect")
    - Event bus integration for publishing results
    - Optional episodic memory for learning from experiences
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
        auto_claim: bool = False,
        memory: Optional['EpisodicMemory'] = None
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
            memory: Optional EpisodicMemory for learning from experiences
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
        self._memory = memory

    @property
    def memory(self) -> Optional['EpisodicMemory']:
        """Get the agent's episodic memory (if configured)."""
        return self._memory

    def store_experience(
        self,
        task_type: str,
        action: str,
        outcome: str,
        description: str,
        metadata: Optional[Dict[str, Any]] = None
    ) -> Optional[Any]:
        """
        Store an experience in the agent's memory.

        Convenience method that delegates to EpisodicMemory if available.

        Args:
            task_type: Type of task (e.g., "CODE_GEN", "REVIEW")
            action: Action taken (e.g., "write", "review")
            outcome: Result ("success", "failure", "partial")
            description: Human-readable description
            metadata: Optional additional context

        Returns:
            The created Experience if memory is configured, None otherwise
        """
        if self._memory is None:
            return None
        return self._memory.store_experience(task_type, action, outcome, description, metadata)

    def check_past_experiences(
        self,
        query_text: str,
        outcome_filter: Optional[str] = None,
        k: int = 5
    ) -> List[Any]:
        """
        Check for similar past experiences.

        Convenience method that delegates to EpisodicMemory if available.

        Args:
            query_text: Text to search for similar experiences
            outcome_filter: Optional filter for outcome type
            k: Maximum number of results

        Returns:
            List of similar experiences (empty if no memory configured)
        """
        if self._memory is None:
            return []
        from systems.swarm.memory import generate_embedding
        query_embedding = generate_embedding(query_text)
        return self._memory.find_similar(query_embedding, outcome_filter=outcome_filter, k=k)

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
