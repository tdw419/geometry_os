"""
SwarmNEBBridge - Bridge between SwarmNode consensus and NEBBus pub/sub.

Connects SwarmNode's consensus system with NEBBus for real-time,
event-driven distributed decision-making. This creates a two-layer
coordination system: real-time events (NEBBus) + durable storage (SwarmChannel).

Usage:
    bus = NEBBus(node_id="agent-001")
    bridge = SwarmNEBBridge(clipboard_url="/tmp/clipboard", event_bus=bus)
    proposal = bridge.create_proposal("Fix bug", "Description")
"""

from typing import Optional, TYPE_CHECKING

from systems.swarm.swarm_node import SwarmNode
from systems.swarm.consensus import SwarmProposal, SwarmVote

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


class SwarmNEBBridge:
    """
    Bridge between SwarmNode consensus and NEBBus pub/sub.

    Provides real-time event publishing for swarm consensus operations
    while delegating core consensus logic to SwarmNode.

    Attributes:
        node: The underlying SwarmNode for consensus operations
        event_bus: Optional NEBBus for real-time event publishing
    """

    def __init__(
        self,
        clipboard_url: str,
        node_id: Optional[str] = None,
        threshold: float = 0.6,
        event_bus: Optional['NEBBus'] = None
    ):
        """
        Initialize the SwarmNEBBridge.

        Args:
            clipboard_url: Path to the shared clipboard file
            node_id: Unique identifier (auto-generated if not provided)
            threshold: Minimum weighted approval ratio to approve (default 0.6)
            event_bus: Optional NEBBus for event publishing
        """
        self.node = SwarmNode(
            clipboard_url=clipboard_url,
            node_id=node_id,
            threshold=threshold
        )
        self._event_bus = event_bus

    def create_proposal(
        self,
        title: str,
        description: str,
        metadata: Optional[dict] = None
    ) -> SwarmProposal:
        """
        Create a new proposal and publish to NEBBus if available.

        Delegates to SwarmNode.create_proposal() and publishes an event
        to the NEBBus for real-time notification.

        Args:
            title: Short title of the proposal
            description: Detailed description of the proposal
            metadata: Optional additional metadata

        Returns:
            The created SwarmProposal
        """
        proposal = self.node.create_proposal(title, description, metadata)

        if self._event_bus is not None:
            self._event_bus.publish(
                f"swarm.proposal.{proposal.id}",
                {
                    "proposal_id": proposal.id,
                    "title": proposal.title,
                    "description": proposal.description,
                    "proposer": proposal.proposer
                }
            )

        return proposal
