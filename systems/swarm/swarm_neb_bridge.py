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

from typing import Callable, Optional, TYPE_CHECKING

from systems.swarm.swarm_node import SwarmNode
from systems.swarm.consensus import SwarmProposal, SwarmVote

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus
    from systems.swarm.neb_signal import NEBSignal


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

    def create_vote(
        self,
        proposal_id: str,
        approve: bool,
        confidence: float,
        reasoning: str = ""
    ) -> SwarmVote:
        """
        Create a new vote and publish to NEBBus if available.

        Delegates to SwarmNode.create_vote() and publishes an event
        to the NEBBus for real-time notification.

        Args:
            proposal_id: ID of the proposal to vote on
            approve: True to approve, False to reject
            confidence: Confidence level (0.0 to 1.0)
            reasoning: Optional explanation for the vote

        Returns:
            The created SwarmVote
        """
        vote = self.node.create_vote(proposal_id, approve, confidence, reasoning)

        if self._event_bus is not None:
            self._event_bus.publish(
                f"swarm.vote.{proposal_id}",
                {
                    "proposal_id": proposal_id,
                    "voter": vote.voter,
                    "approve": approve,
                    "confidence": confidence
                }
            )

        return vote

    def evaluate_consensus(self, proposal_id: str) -> dict:
        """
        Evaluate consensus for a proposal and publish to NEBBus if available.

        Collects votes from the clipboard, adds them to the proposal,
        evaluates consensus, and publishes the result to the NEBBus.

        Args:
            proposal_id: ID of the proposal to evaluate

        Returns:
            Result dictionary with:
                - weighted_approval: Ratio of weighted approval
                - approved: True if approved, False if rejected
                - vote_count: Number of votes
        """
        # Find the proposal from clipboard
        proposals = self.node.check_for_proposals()
        proposal = None
        for p in proposals:
            if p.id == proposal_id:
                proposal = p
                break

        if proposal is None:
            return {
                "weighted_approval": 0.0,
                "approved": False,
                "vote_count": 0
            }

        # Collect votes and add to proposal
        votes = self.node.collect_votes(proposal_id)
        for vote in votes:
            proposal.add_vote(vote)

        # Evaluate consensus
        result = self.node.evaluate_proposal(proposal)

        # Publish to NEBBus if available
        if self._event_bus is not None:
            self._event_bus.publish(
                f"swarm.consensus.{proposal_id}",
                {
                    "proposal_id": proposal_id,
                    "weighted_approval": result["weighted_approval"],
                    "approved": result["approved"],
                    "vote_count": result["vote_count"]
                }
            )

        return result

    def subscribe_to_proposals(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to proposal events.

        Args:
            callback: Function to call with NEBSignal when a proposal is created

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("swarm.proposal.*", callback)

    def subscribe_to_votes(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to vote events.

        Args:
            callback: Function to call with NEBSignal when a vote is cast

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("swarm.vote.*", callback)

    def subscribe_to_consensus(
        self,
        callback: Callable[['NEBSignal'], None]
    ) -> str:
        """
        Subscribe to consensus result events.

        Args:
            callback: Function to call with NEBSignal when consensus is evaluated

        Returns:
            Subscription ID for later unsubscription

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot subscribe without event_bus")
        return self._event_bus.subscribe("swarm.consensus.*", callback)

    def unsubscribe(self, subscription_id: str) -> bool:
        """
        Remove a subscription.

        Args:
            subscription_id: ID returned from subscribe_to_* methods

        Returns:
            True if subscription was found and removed, False otherwise

        Raises:
            RuntimeError: If no event_bus is configured
        """
        if self._event_bus is None:
            raise RuntimeError("Cannot unsubscribe without event_bus")
        return self._event_bus.unsubscribe(subscription_id)
