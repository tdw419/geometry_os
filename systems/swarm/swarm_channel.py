"""
SwarmChannel - Clipboard-based Communication for Swarm Nodes

Provides a simple file-based communication channel for swarm nodes
to exchange proposals and votes via a shared clipboard file.

Protocol:
- SWARM_PROPOSAL:{json} - A proposal posted by a node
- SWARM_VOTE:{json} - A vote posted by a node

Lines are appended to the clipboard file, allowing multiple messages
to coexist.
"""

import json
import uuid
from pathlib import Path
from typing import List, Optional

from systems.swarm.consensus import SwarmProposal, SwarmVote


class SwarmChannel:
    """
    Clipboard-based communication channel for swarm nodes.

    Enables nodes to exchange proposals and votes via a shared file.
    Each message is serialized with a prefix (SWARM_PROPOSAL: or SWARM_VOTE:)
    followed by JSON data.

    Attributes:
        clipboard_url: Path to the clipboard file
        node_id: Unique identifier for this node
    """

    PROPOSAL_PREFIX = "SWARM_PROPOSAL:"
    VOTE_PREFIX = "SWARM_VOTE:"

    def __init__(self, clipboard_url: str, node_id: Optional[str] = None):
        """
        Initialize the SwarmChannel.

        Args:
            clipboard_url: Path to the clipboard file
            node_id: Unique identifier for this node (auto-generated if not provided)
        """
        self.clipboard_url = clipboard_url
        self.node_id = node_id or str(uuid.uuid4())[:8]

    def serialize_proposal(self, proposal: SwarmProposal) -> str:
        """
        Serialize a proposal to clipboard format.

        Args:
            proposal: The SwarmProposal to serialize

        Returns:
            String in format: SWARM_PROPOSAL:{json}
        """
        return f"{self.PROPOSAL_PREFIX}{json.dumps(proposal.to_dict())}"

    def deserialize_proposal(self, data: str) -> SwarmProposal:
        """
        Deserialize clipboard data to a SwarmProposal.

        Args:
            data: String in format: SWARM_PROPOSAL:{json}

        Returns:
            SwarmProposal object

        Raises:
            ValueError: If data is not in valid proposal format
        """
        if not data.startswith(self.PROPOSAL_PREFIX):
            raise ValueError(f"Invalid proposal format: expected prefix {self.PROPOSAL_PREFIX}")

        json_part = data[len(self.PROPOSAL_PREFIX):]
        try:
            proposal_data = json.loads(json_part)
        except json.JSONDecodeError as e:
            raise ValueError(f"Invalid proposal JSON: {e}")

        return SwarmProposal.from_dict(proposal_data)

    def serialize_vote(self, vote: SwarmVote) -> str:
        """
        Serialize a vote to clipboard format.

        Args:
            vote: The SwarmVote to serialize

        Returns:
            String in format: SWARM_VOTE:{json}
        """
        return f"{self.VOTE_PREFIX}{json.dumps(vote.to_dict())}"

    def deserialize_vote(self, data: str) -> SwarmVote:
        """
        Deserialize clipboard data to a SwarmVote.

        Args:
            data: String in format: SWARM_VOTE:{json}

        Returns:
            SwarmVote object

        Raises:
            ValueError: If data is not in valid vote format
        """
        if not data.startswith(self.VOTE_PREFIX):
            raise ValueError(f"Invalid vote format: expected prefix {self.VOTE_PREFIX}")

        json_part = data[len(self.VOTE_PREFIX):]
        try:
            vote_data = json.loads(json_part)
        except json.JSONDecodeError as e:
            raise ValueError(f"Invalid vote JSON: {e}")

        return SwarmVote.from_dict(vote_data)

    def post_proposal(self, proposal: SwarmProposal) -> None:
        """
        Post a proposal to the clipboard file.

        Appends the serialized proposal to the clipboard file.

        Args:
            proposal: The SwarmProposal to post
        """
        serialized = self.serialize_proposal(proposal)
        self._append_to_clipboard(serialized)

    def post_vote(self, vote: SwarmVote) -> None:
        """
        Post a vote to the clipboard file.

        Appends the serialized vote to the clipboard file.

        Args:
            vote: The SwarmVote to post
        """
        serialized = self.serialize_vote(vote)
        self._append_to_clipboard(serialized)

    def find_proposals(self) -> List[SwarmProposal]:
        """
        Find all proposals in the clipboard.

        Returns:
            List of SwarmProposal objects found in the clipboard
        """
        proposals = []
        for line in self._read_clipboard_lines():
            if line.startswith(self.PROPOSAL_PREFIX):
                try:
                    proposal = self.deserialize_proposal(line)
                    proposals.append(proposal)
                except ValueError:
                    # Skip malformed proposals
                    pass
        return proposals

    def find_votes_for_proposal(self, proposal_id: str) -> List[SwarmVote]:
        """
        Find all votes for a specific proposal.

        Args:
            proposal_id: The ID of the proposal to find votes for

        Returns:
            List of SwarmVote objects for the specified proposal
        """
        votes = []
        for line in self._read_clipboard_lines():
            if line.startswith(self.VOTE_PREFIX):
                try:
                    vote = self.deserialize_vote(line)
                    if vote.proposal_id == proposal_id:
                        votes.append(vote)
                except ValueError:
                    # Skip malformed votes
                    pass
        return votes

    def _append_to_clipboard(self, data: str) -> None:
        """
        Append a line to the clipboard file.

        Args:
            data: The data to append
        """
        path = Path(self.clipboard_url)
        path.parent.mkdir(parents=True, exist_ok=True)
        with open(path, "a") as f:
            f.write(data + "\n")

    def _read_clipboard_lines(self) -> List[str]:
        """
        Read all lines from the clipboard file.

        Returns:
            List of lines (stripped of whitespace)
        """
        path = Path(self.clipboard_url)
        if not path.exists():
            return []

        with open(path, "r") as f:
            return [line.strip() for line in f if line.strip()]
