"""
Swarm Consensus - Core Data Structures

Provides data structures for distributed decision-making in the Geometry OS swarm:
- SwarmProposal: A proposal to be voted on by swarm nodes
- SwarmVote: A vote cast by a swarm node on a proposal
- ProposalStatus: Lifecycle states for proposals

Used by the Swarm Channel and Swarm Node for coordination.
"""

from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import List, Dict, Any, Optional
import uuid


class ProposalStatus(str, Enum):
    """Lifecycle states for a swarm proposal."""
    PENDING = "pending"       # Newly created, awaiting votes
    ACTIVE = "active"         # Being actively voted on
    APPROVED = "approved"     # Reached consensus to approve
    REJECTED = "rejected"     # Reached consensus to reject
    EXPIRED = "expired"       # Timed out without consensus
    CANCELLED = "cancelled"   # Cancelled by proposer


@dataclass
class SwarmVote:
    """
    A vote cast by a swarm node on a proposal.

    Attributes:
        proposal_id: ID of the proposal being voted on
        voter: Identifier of the voting node
        approve: True to approve, False to reject
        confidence: Confidence level (0.0 to 1.0, clamped)
        reasoning: Optional explanation for the vote
        voted_at: Timestamp of when the vote was cast
    """
    proposal_id: str
    voter: str
    approve: bool
    confidence: float
    reasoning: str = ""
    voted_at: str = field(
        default_factory=lambda: datetime.now().isoformat()
    )

    def __post_init__(self):
        """Clamp confidence to valid range [0.0, 1.0]."""
        self.confidence = max(0.0, min(1.0, self.confidence))

    def to_dict(self) -> Dict[str, Any]:
        """Serialize vote to dictionary for JSON export."""
        return {
            "proposal_id": self.proposal_id,
            "voter": self.voter,
            "approve": self.approve,
            "confidence": self.confidence,
            "reasoning": self.reasoning,
            "voted_at": self.voted_at
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "SwarmVote":
        """Deserialize vote from dictionary."""
        return cls(
            proposal_id=data["proposal_id"],
            voter=data["voter"],
            approve=data["approve"],
            confidence=data["confidence"],
            reasoning=data.get("reasoning", ""),
            voted_at=data.get("voted_at", datetime.now().isoformat())
        )


@dataclass
class SwarmProposal:
    """
    A proposal to be voted on by swarm nodes.

    Supports weighted confidence voting where each node's vote is
    weighted by their confidence level.

    Attributes:
        title: Short title of the proposal
        description: Detailed description of what's being proposed
        proposer: Identifier of the node that created the proposal
        id: Unique identifier (UUID)
        status: Current lifecycle status
        votes: List of votes cast on this proposal
        created_at: Timestamp of creation
        expires_at: Optional expiration timestamp
        metadata: Additional metadata for extensibility
    """
    title: str
    description: str
    proposer: str
    id: str = field(default_factory=lambda: str(uuid.uuid4()))
    status: ProposalStatus = ProposalStatus.PENDING
    votes: List[SwarmVote] = field(default_factory=list)
    created_at: str = field(
        default_factory=lambda: datetime.now().isoformat()
    )
    expires_at: Optional[str] = None
    metadata: Dict[str, Any] = field(default_factory=dict)

    def add_vote(self, vote: SwarmVote) -> None:
        """
        Add a vote to the proposal.

        If a vote from the same voter already exists, it will be replaced
        (allows voters to change their mind).

        Args:
            vote: The SwarmVote to add
        """
        # Remove existing vote from same voter if present
        self.votes = [v for v in self.votes if v.voter != vote.voter]
        self.votes.append(vote)

        # Update status to ACTIVE if we have votes
        if self.status == ProposalStatus.PENDING and len(self.votes) > 0:
            self.status = ProposalStatus.ACTIVE

    def get_vote_summary(self) -> Dict[str, Any]:
        """
        Get summary statistics of votes.

        Returns:
            Dictionary with vote counts, ratios, and weighted scores
        """
        total_votes = len(self.votes)
        approve_count = sum(1 for v in self.votes if v.approve)
        reject_count = total_votes - approve_count

        approve_ratio = approve_count / total_votes if total_votes > 0 else 0.0

        return {
            "total_votes": total_votes,
            "approve_count": approve_count,
            "reject_count": reject_count,
            "approve_ratio": approve_ratio
        }

    def to_dict(self) -> Dict[str, Any]:
        """Serialize proposal to dictionary for JSON export."""
        return {
            "id": self.id,
            "title": self.title,
            "description": self.description,
            "proposer": self.proposer,
            "status": self.status.value,
            "votes": [v.to_dict() for v in self.votes],
            "created_at": self.created_at,
            "expires_at": self.expires_at,
            "metadata": self.metadata
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "SwarmProposal":
        """Deserialize proposal from dictionary."""
        votes = [SwarmVote.from_dict(v) for v in data.get("votes", [])]
        status = ProposalStatus(data.get("status", "pending"))

        return cls(
            id=data["id"],
            title=data["title"],
            description=data["description"],
            proposer=data["proposer"],
            status=status,
            votes=votes,
            created_at=data.get("created_at", datetime.now().isoformat()),
            expires_at=data.get("expires_at"),
            metadata=data.get("metadata", {})
        )
