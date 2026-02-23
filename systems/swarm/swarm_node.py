"""
SwarmNode - Local and Remote Coordination for Swarm Consensus

A SwarmNode participates in distributed consensus by:
- Creating and broadcasting proposals
- Creating and broadcasting votes
- Checking for proposals from other nodes
- Collecting votes for proposals
- Evaluating proposals for consensus

Uses SwarmChannel for clipboard-based communication.
"""

import uuid
from typing import List, Optional

from systems.swarm.consensus import (
    SwarmProposal,
    SwarmVote,
    WeightedConfidenceCalculator,
    ProposalStatus
)
from systems.swarm.swarm_channel import SwarmChannel


class SwarmNode:
    """
    A node participating in swarm consensus.

    Coordinates with other nodes via a shared clipboard channel to:
    - Propose new decisions
    - Vote on proposals
    - Evaluate consensus

    Attributes:
        node_id: Unique identifier for this node
        clipboard_url: Path to the shared clipboard file
        threshold: Minimum weighted approval ratio to approve (default 0.6)
        channel: SwarmChannel instance for communication
    """

    def __init__(
        self,
        clipboard_url: str,
        node_id: Optional[str] = None,
        threshold: float = 0.6
    ):
        """
        Initialize a SwarmNode.

        Args:
            clipboard_url: Path to the shared clipboard file
            node_id: Unique identifier (auto-generated if not provided)
            threshold: Minimum weighted approval ratio to approve (default 0.6)
        """
        self.node_id = node_id or str(uuid.uuid4())[:8]
        self.clipboard_url = clipboard_url
        self.threshold = threshold
        self.channel = SwarmChannel(clipboard_url, self.node_id)
        self._calculator = WeightedConfidenceCalculator()

    def create_proposal(
        self,
        title: str,
        description: str,
        metadata: Optional[dict] = None
    ) -> SwarmProposal:
        """
        Create a new proposal.

        Args:
            title: Short title of the proposal
            description: Detailed description of the proposal
            metadata: Optional additional metadata

        Returns:
            A new SwarmProposal with this node as proposer
        """
        return SwarmProposal(
            title=title,
            description=description,
            proposer=self.node_id,
            metadata=metadata or {}
        )

    def create_vote(
        self,
        proposal_id: str,
        approve: bool,
        confidence: float,
        reasoning: str = ""
    ) -> SwarmVote:
        """
        Create a new vote.

        Args:
            proposal_id: ID of the proposal to vote on
            approve: True to approve, False to reject
            confidence: Confidence level (0.0 to 1.0)
            reasoning: Optional explanation for the vote

        Returns:
            A new SwarmVote from this node
        """
        return SwarmVote(
            proposal_id=proposal_id,
            voter=self.node_id,
            approve=approve,
            confidence=confidence,
            reasoning=reasoning
        )

    def broadcast_proposal(self, proposal: SwarmProposal) -> None:
        """
        Broadcast a proposal to the clipboard channel.

        Args:
            proposal: The SwarmProposal to broadcast
        """
        self.channel.post_proposal(proposal)

    def broadcast_vote(self, vote: SwarmVote) -> None:
        """
        Broadcast a vote to the clipboard channel.

        Args:
            vote: The SwarmVote to broadcast
        """
        self.channel.post_vote(vote)

    def check_for_proposals(self) -> List[SwarmProposal]:
        """
        Check for all proposals in the clipboard.

        Returns:
            List of SwarmProposal objects from the clipboard
        """
        return self.channel.find_proposals()

    def collect_votes(self, proposal_id: str) -> List[SwarmVote]:
        """
        Collect all votes for a specific proposal.

        Args:
            proposal_id: The ID of the proposal

        Returns:
            List of SwarmVote objects for the proposal
        """
        return self.channel.find_votes_for_proposal(proposal_id)

    def evaluate_proposal(
        self,
        proposal: SwarmProposal,
        threshold: Optional[float] = None
    ) -> dict:
        """
        Evaluate a proposal for consensus.

        Uses weighted confidence voting to determine if the proposal
        should be approved or rejected.

        Args:
            proposal: The SwarmProposal to evaluate
            threshold: Override threshold (uses node default if not provided)

        Returns:
            Result dictionary with:
                - weighted_approval: Ratio of weighted approval
                - approved: True if approved, False if rejected
                - vote_count: Number of votes
        """
        effective_threshold = threshold if threshold is not None else self.threshold
        return self._calculator.evaluate_proposal(proposal, effective_threshold)

    def propose_and_vote(
        self,
        title: str,
        description: str,
        confidence: float,
        approve: bool,
        reasoning: str = "",
        metadata: Optional[dict] = None
    ) -> SwarmProposal:
        """
        Convenience method to create a proposal, vote on it, and broadcast both.

        This is useful when a node wants to propose something and immediately
        cast their vote in a single operation.

        Args:
            title: Short title of the proposal
            description: Detailed description of the proposal
            confidence: Confidence level for the vote (0.0 to 1.0)
            approve: True to approve, False to reject
            reasoning: Optional explanation for the vote
            metadata: Optional additional metadata for the proposal

        Returns:
            The SwarmProposal with the vote already added
        """
        # Create the proposal
        proposal = self.create_proposal(title, description, metadata)

        # Create and add our vote
        vote = self.create_vote(proposal.id, approve, confidence, reasoning)
        proposal.add_vote(vote)

        # Broadcast both
        self.broadcast_proposal(proposal)
        self.broadcast_vote(vote)

        return proposal
