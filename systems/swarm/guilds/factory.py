"""
GuildFactory - Factory for creating guild agents.

Provides a clean API for instantiating the correct agent type
based on a role string.
"""

from typing import Optional, TYPE_CHECKING

from systems.swarm.task_board import TaskBoard
from systems.swarm.guilds.base import GuildAgent
from systems.swarm.guilds.engineer import EngineerAgent
from systems.swarm.transmission.scribe_agent import ScribeAgent
from systems.swarm.transmission.sprout_agent import SproutAgent

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


class GuildFactory:
    """
    Factory for creating guild agents.

    Usage:
        agent = GuildFactory.create("engineer", "agent-001", task_board)
        agent = GuildFactory.create("engineer", "agent-001", task_board, event_bus=bus)
    """

    # Registry of role -> agent class
    _registry = {
        "engineer": EngineerAgent,
        "scribe": ScribeAgent,
        "sprout": SproutAgent,
    }

    @classmethod
    def create(
        cls,
        role: str,
        agent_id: str,
        task_board: TaskBoard,
        event_bus: Optional['NEBBus'] = None,
        auto_claim: bool = False
    ) -> Optional[GuildAgent]:
        """
        Create a guild agent by role.

        Args:
            role: Role identifier (e.g., "engineer", "reviewer", "architect")
            agent_id: Unique identifier for the agent
            task_board: TaskBoard for task management
            event_bus: Optional NEBBus for event publishing
            auto_claim: If True, agent auto-claims tasks on notification

        Returns:
            GuildAgent instance, or None if role not found
        """
        agent_class = cls._registry.get(role.lower())
        if agent_class is None:
            return None

        return agent_class(
            agent_id=agent_id,
            task_board=task_board,
            event_bus=event_bus,
            auto_claim=auto_claim
        )

    @classmethod
    def register_role(cls, role: str, agent_class: type) -> None:
        """
        Register a new agent class for a role.

        Args:
            role: Role identifier
            agent_class: Agent class (must extend GuildAgent)
        """
        cls._registry[role.lower()] = agent_class

    @classmethod
    def available_roles(cls) -> list:
        """
        Get list of available roles.

        Returns:
            List of role strings
        """
        return list(cls._registry.keys())
