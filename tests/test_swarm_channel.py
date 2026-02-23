"""
Tests for SwarmChannel - Clipboard-based Communication

TDD tests for SwarmChannel that enables clipboard-based communication
between swarm nodes.
"""

import pytest
from unittest.mock import Mock, patch, MagicMock
import json


class TestSwarmChannelCreation:
    """Tests for SwarmChannel creation and initialization."""

    def test_swarm_channel_creation(self):
        """Test basic SwarmChannel creation with required fields."""
        from systems.swarm.swarm_channel import SwarmChannel

        channel = SwarmChannel(
            clipboard_url="/tmp/swarm_clipboard",
            node_id="node-alpha"
        )

        assert channel.clipboard_url == "/tmp/swarm_clipboard"
        assert channel.node_id == "node-alpha"

    def test_swarm_channel_default_node_id(self):
        """Test SwarmChannel with default node_id generation."""
        from systems.swarm.swarm_channel import SwarmChannel

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")

        assert channel.clipboard_url == "/tmp/swarm_clipboard"
        assert channel.node_id is not None
        assert len(channel.node_id) > 0


class TestProposalSerialization:
    """Tests for proposal serialization/deserialization."""

    def test_serialize_proposal(self):
        """Test serializing a SwarmProposal to clipboard format."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmProposal

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")
        proposal = SwarmProposal(
            title="Test Proposal",
            description="A test proposal",
            proposer="node-alpha"
        )

        serialized = channel.serialize_proposal(proposal)

        assert serialized.startswith("SWARM_PROPOSAL:")
        # Verify the JSON part is valid
        json_part = serialized[len("SWARM_PROPOSAL:"):]
        data = json.loads(json_part)
        assert data["title"] == "Test Proposal"
        assert data["description"] == "A test proposal"
        assert data["proposer"] == "node-alpha"

    def test_deserialize_proposal(self):
        """Test deserializing clipboard data to SwarmProposal."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmProposal, ProposalStatus

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")

        # Create a proposal and serialize it
        original = SwarmProposal(
            title="Deserialize Test",
            description="Testing deserialization",
            proposer="node-beta",
            id="test-id-123"
        )
        serialized = channel.serialize_proposal(original)

        # Deserialize it back
        proposal = channel.deserialize_proposal(serialized)

        assert proposal.id == "test-id-123"
        assert proposal.title == "Deserialize Test"
        assert proposal.description == "Testing deserialization"
        assert proposal.proposer == "node-beta"
        assert proposal.status == ProposalStatus.PENDING

    def test_deserialize_proposal_invalid(self):
        """Test deserializing invalid data raises appropriate error."""
        from systems.swarm.swarm_channel import SwarmChannel

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")

        with pytest.raises(ValueError, match="Invalid proposal format"):
            channel.deserialize_proposal("INVALID_DATA")

    def test_deserialize_proposal_invalid_json(self):
        """Test deserializing with invalid JSON raises appropriate error."""
        from systems.swarm.swarm_channel import SwarmChannel

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")

        with pytest.raises(ValueError, match="Invalid proposal JSON"):
            channel.deserialize_proposal("SWARM_PROPOSAL:{invalid json}")


class TestVoteSerialization:
    """Tests for vote serialization/deserialization."""

    def test_serialize_vote(self):
        """Test serializing a SwarmVote to clipboard format."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmVote

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")
        vote = SwarmVote(
            proposal_id="prop-123",
            voter="node-alpha",
            approve=True,
            confidence=0.85,
            reasoning="Looks good"
        )

        serialized = channel.serialize_vote(vote)

        assert serialized.startswith("SWARM_VOTE:")
        # Verify the JSON part is valid
        json_part = serialized[len("SWARM_VOTE:"):]
        data = json.loads(json_part)
        assert data["proposal_id"] == "prop-123"
        assert data["voter"] == "node-alpha"
        assert data["approve"] is True
        assert data["confidence"] == 0.85
        assert data["reasoning"] == "Looks good"

    def test_deserialize_vote(self):
        """Test deserializing clipboard data to SwarmVote."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmVote

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")

        # Create a vote and serialize it
        original = SwarmVote(
            proposal_id="prop-456",
            voter="node-beta",
            approve=False,
            confidence=0.3,
            reasoning="Needs work"
        )
        serialized = channel.serialize_vote(original)

        # Deserialize it back
        vote = channel.deserialize_vote(serialized)

        assert vote.proposal_id == "prop-456"
        assert vote.voter == "node-beta"
        assert vote.approve is False
        assert vote.confidence == 0.3
        assert vote.reasoning == "Needs work"

    def test_deserialize_vote_invalid(self):
        """Test deserializing invalid data raises appropriate error."""
        from systems.swarm.swarm_channel import SwarmChannel

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")

        with pytest.raises(ValueError, match="Invalid vote format"):
            channel.deserialize_vote("INVALID_DATA")

    def test_deserialize_vote_invalid_json(self):
        """Test deserializing with invalid JSON raises appropriate error."""
        from systems.swarm.swarm_channel import SwarmChannel

        channel = SwarmChannel(clipboard_url="/tmp/swarm_clipboard")

        with pytest.raises(ValueError, match="Invalid vote JSON"):
            channel.deserialize_vote("SWARM_VOTE:{invalid json}")


class TestSwarmChannelFileOperations:
    """Tests for clipboard file operations."""

    def test_post_proposal(self, tmp_path):
        """Test posting a proposal to clipboard file."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmProposal

        clipboard_file = tmp_path / "swarm_clipboard"
        channel = SwarmChannel(clipboard_url=str(clipboard_file), node_id="node-alpha")

        proposal = SwarmProposal(
            title="Post Test",
            description="Testing post_proposal",
            proposer="node-alpha"
        )

        channel.post_proposal(proposal)

        # Verify file was written
        assert clipboard_file.exists()
        content = clipboard_file.read_text()
        assert "SWARM_PROPOSAL:" in content
        assert "Post Test" in content

    def test_post_vote(self, tmp_path):
        """Test posting a vote to clipboard file."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmVote

        clipboard_file = tmp_path / "swarm_clipboard"
        channel = SwarmChannel(clipboard_url=str(clipboard_file), node_id="node-alpha")

        vote = SwarmVote(
            proposal_id="prop-123",
            voter="node-alpha",
            approve=True,
            confidence=0.9,
            reasoning="I approve"
        )

        channel.post_vote(vote)

        # Verify file was written
        assert clipboard_file.exists()
        content = clipboard_file.read_text()
        assert "SWARM_VOTE:" in content
        assert "prop-123" in content

    def test_find_proposals(self, tmp_path):
        """Test finding proposals from clipboard file."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmProposal

        clipboard_file = tmp_path / "swarm_clipboard"
        channel = SwarmChannel(clipboard_url=str(clipboard_file), node_id="node-alpha")

        # Post multiple proposals
        proposal1 = SwarmProposal(
            title="Proposal 1",
            description="First proposal",
            proposer="node-alpha",
            id="prop-1"
        )
        proposal2 = SwarmProposal(
            title="Proposal 2",
            description="Second proposal",
            proposer="node-beta",
            id="prop-2"
        )

        channel.post_proposal(proposal1)
        channel.post_proposal(proposal2)

        # Find all proposals
        proposals = channel.find_proposals()

        assert len(proposals) == 2
        titles = [p.title for p in proposals]
        assert "Proposal 1" in titles
        assert "Proposal 2" in titles

    def test_find_proposals_empty(self, tmp_path):
        """Test finding proposals from empty clipboard."""
        from systems.swarm.swarm_channel import SwarmChannel

        clipboard_file = tmp_path / "swarm_clipboard"
        # Don't create the file
        channel = SwarmChannel(clipboard_url=str(clipboard_file), node_id="node-alpha")

        proposals = channel.find_proposals()

        assert proposals == []

    def test_find_votes_for_proposal(self, tmp_path):
        """Test finding votes for a specific proposal."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmProposal, SwarmVote

        clipboard_file = tmp_path / "swarm_clipboard"
        channel = SwarmChannel(clipboard_url=str(clipboard_file), node_id="node-alpha")

        # Post a proposal
        proposal = SwarmProposal(
            title="Vote Test Proposal",
            description="Testing votes",
            proposer="node-alpha",
            id="prop-target"
        )
        channel.post_proposal(proposal)

        # Post votes for this proposal
        vote1 = SwarmVote("prop-target", "node-beta", True, 0.9, "Approve")
        vote2 = SwarmVote("prop-target", "node-gamma", False, 0.6, "Reject")
        vote3 = SwarmVote("prop-other", "node-delta", True, 0.8, "Other vote")

        channel.post_vote(vote1)
        channel.post_vote(vote2)
        channel.post_vote(vote3)

        # Find votes for prop-target
        votes = channel.find_votes_for_proposal("prop-target")

        assert len(votes) == 2
        voters = [v.voter for v in votes]
        assert "node-beta" in voters
        assert "node-gamma" in voters
        assert "node-delta" not in voters

    def test_find_votes_for_proposal_none(self, tmp_path):
        """Test finding votes for a proposal with no votes."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmProposal

        clipboard_file = tmp_path / "swarm_clipboard"
        channel = SwarmChannel(clipboard_url=str(clipboard_file), node_id="node-alpha")

        # Post a proposal (no votes)
        proposal = SwarmProposal(
            title="No Votes Proposal",
            description="No votes",
            proposer="node-alpha",
            id="prop-novotes"
        )
        channel.post_proposal(proposal)

        # Find votes for this proposal
        votes = channel.find_votes_for_proposal("prop-novotes")

        assert votes == []

    def test_post_append_mode(self, tmp_path):
        """Test that posting appends rather than overwrites."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import SwarmProposal, SwarmVote

        clipboard_file = tmp_path / "swarm_clipboard"
        channel = SwarmChannel(clipboard_url=str(clipboard_file), node_id="node-alpha")

        # Post proposal
        proposal = SwarmProposal(
            title="Append Test",
            description="Testing append",
            proposer="node-alpha",
            id="prop-append"
        )
        channel.post_proposal(proposal)

        # Post vote
        vote = SwarmVote("prop-append", "node-beta", True, 0.9, "Approve")
        channel.post_vote(vote)

        # Both should be in the file
        content = clipboard_file.read_text()
        assert "SWARM_PROPOSAL:" in content
        assert "SWARM_VOTE:" in content
        assert "Append Test" in content
        assert "node-beta" in content

    def test_roundtrip_proposal_with_votes(self, tmp_path):
        """Test roundtrip: post proposal + votes, read back and evaluate."""
        from systems.swarm.swarm_channel import SwarmChannel
        from systems.swarm.consensus import (
            SwarmProposal, SwarmVote, WeightedConfidenceCalculator
        )

        clipboard_file = tmp_path / "swarm_clipboard"
        channel = SwarmChannel(clipboard_url=str(clipboard_file), node_id="node-alpha")

        # Post a proposal
        proposal = SwarmProposal(
            title="Roundtrip Test",
            description="Full roundtrip test",
            proposer="node-alpha",
            id="prop-roundtrip"
        )
        channel.post_proposal(proposal)

        # Post votes
        channel.post_vote(SwarmVote("prop-roundtrip", "n1", True, 0.9, "Yes"))
        channel.post_vote(SwarmVote("prop-roundtrip", "n2", True, 0.8, "Yes"))
        channel.post_vote(SwarmVote("prop-roundtrip", "n3", False, 0.3, "No"))

        # Read back
        proposals = channel.find_proposals()
        votes = channel.find_votes_for_proposal("prop-roundtrip")

        assert len(proposals) == 1
        assert proposals[0].title == "Roundtrip Test"
        assert len(votes) == 3

        # Evaluate using weighted confidence
        calc = WeightedConfidenceCalculator()
        result = calc.calculate(votes)

        # 0.9 + 0.8 = 1.7 approve, 0.3 reject
        # Weighted approval: 1.7 / 2.0 = 0.85
        assert result["weighted_approval"] == pytest.approx(0.85, rel=0.01)
        assert result["approved"] is True
