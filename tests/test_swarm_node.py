"""
Tests for SwarmNode - Local and Remote Coordination

TDD tests for SwarmNode that participates in swarm consensus.
"""

import pytest
import tempfile
import os
from pathlib import Path


class TestSwarmNodeCreation:
    """Tests for SwarmNode creation and initialization."""

    def test_swarm_node_creation(self):
        """Test basic SwarmNode creation with required fields."""
        from systems.swarm.swarm_node import SwarmNode

        node = SwarmNode(
            node_id="node-alpha",
            clipboard_url="/tmp/test_clipboard.txt"
        )

        assert node.node_id == "node-alpha"
        assert node.clipboard_url == "/tmp/test_clipboard.txt"
        assert node.threshold == 0.6  # Default threshold

    def test_swarm_node_with_custom_threshold(self):
        """Test SwarmNode creation with custom threshold."""
        from systems.swarm.swarm_node import SwarmNode

        node = SwarmNode(
            node_id="node-beta",
            clipboard_url="/tmp/test_clipboard.txt",
            threshold=0.75
        )

        assert node.node_id == "node-beta"
        assert node.threshold == 0.75

    def test_swarm_node_auto_id(self):
        """Test SwarmNode creation with auto-generated ID."""
        from systems.swarm.swarm_node import SwarmNode

        node = SwarmNode(clipboard_url="/tmp/test_clipboard.txt")

        assert node.node_id is not None
        assert len(node.node_id) > 0


class TestSwarmNodeProposal:
    """Tests for SwarmNode proposal creation."""

    def test_create_proposal(self):
        """Test creating a proposal through SwarmNode."""
        from systems.swarm.swarm_node import SwarmNode
        from systems.swarm.consensus import ProposalStatus

        node = SwarmNode(
            node_id="node-alpha",
            clipboard_url="/tmp/test_clipboard.txt"
        )

        proposal = node.create_proposal(
            title="Test Proposal",
            description="A proposal for testing"
        )

        assert proposal.title == "Test Proposal"
        assert proposal.description == "A proposal for testing"
        assert proposal.proposer == "node-alpha"
        assert proposal.status == ProposalStatus.PENDING
        assert proposal.id is not None

    def test_broadcast_proposal(self):
        """Test broadcasting a proposal to clipboard."""
        from systems.swarm.swarm_node import SwarmNode

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            node = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )

            proposal = node.create_proposal(
                title="Broadcast Test",
                description="Testing broadcast"
            )

            node.broadcast_proposal(proposal)

            # Verify file was created and contains proposal
            assert os.path.exists(clipboard_path)
            with open(clipboard_path, "r") as f:
                content = f.read()
            assert "SWARM_PROPOSAL:" in content
            assert proposal.id in content


class TestSwarmNodeVote:
    """Tests for SwarmNode vote creation."""

    def test_create_vote(self):
        """Test creating a vote through SwarmNode."""
        from systems.swarm.swarm_node import SwarmNode

        node = SwarmNode(
            node_id="node-alpha",
            clipboard_url="/tmp/test_clipboard.txt"
        )

        vote = node.create_vote(
            proposal_id="prop-123",
            approve=True,
            confidence=0.85,
            reasoning="Looks good"
        )

        assert vote.proposal_id == "prop-123"
        assert vote.voter == "node-alpha"
        assert vote.approve is True
        assert vote.confidence == 0.85
        assert vote.reasoning == "Looks good"

    def test_broadcast_vote(self):
        """Test broadcasting a vote to clipboard."""
        from systems.swarm.swarm_node import SwarmNode

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            node = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )

            vote = node.create_vote(
                proposal_id="prop-123",
                approve=True,
                confidence=0.9,
                reasoning="I approve"
            )

            node.broadcast_vote(vote)

            # Verify file was created and contains vote
            assert os.path.exists(clipboard_path)
            with open(clipboard_path, "r") as f:
                content = f.read()
            assert "SWARM_VOTE:" in content
            assert "prop-123" in content


class TestSwarmNodeCheckProposals:
    """Tests for SwarmNode proposal checking."""

    def test_check_for_proposals(self):
        """Test checking for proposals from clipboard."""
        from systems.swarm.swarm_node import SwarmNode

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            # Create node and broadcast a proposal
            node1 = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )
            proposal = node1.create_proposal(
                title="Check Test",
                description="Testing check"
            )
            node1.broadcast_proposal(proposal)

            # Create another node and check for proposals
            node2 = SwarmNode(
                node_id="node-beta",
                clipboard_url=clipboard_path
            )
            proposals = node2.check_for_proposals()

            assert len(proposals) == 1
            assert proposals[0].title == "Check Test"
            assert proposals[0].proposer == "node-alpha"

    def test_check_for_proposals_empty(self):
        """Test checking for proposals when clipboard is empty."""
        from systems.swarm.swarm_node import SwarmNode

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            node = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )

            proposals = node.check_for_proposals()
            assert proposals == []


class TestSwarmNodeCollectVotes:
    """Tests for SwarmNode vote collection."""

    def test_collect_votes(self):
        """Test collecting votes for a proposal."""
        from systems.swarm.swarm_node import SwarmNode

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            # Create proposer node
            node1 = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )
            proposal = node1.create_proposal(
                title="Collect Test",
                description="Testing vote collection"
            )
            node1.broadcast_proposal(proposal)

            # Create voter nodes and cast votes
            node2 = SwarmNode(
                node_id="node-beta",
                clipboard_url=clipboard_path
            )
            vote1 = node2.create_vote(
                proposal_id=proposal.id,
                approve=True,
                confidence=0.9
            )
            node2.broadcast_vote(vote1)

            node3 = SwarmNode(
                node_id="node-gamma",
                clipboard_url=clipboard_path
            )
            vote2 = node3.create_vote(
                proposal_id=proposal.id,
                approve=False,
                confidence=0.7
            )
            node3.broadcast_vote(vote2)

            # Collect votes as proposer
            votes = node1.collect_votes(proposal.id)

            assert len(votes) == 2
            voters = [v.voter for v in votes]
            assert "node-beta" in voters
            assert "node-gamma" in voters


class TestSwarmNodeEvaluateProposal:
    """Tests for SwarmNode proposal evaluation."""

    def test_evaluate_proposal(self):
        """Test evaluating a proposal with collected votes."""
        from systems.swarm.swarm_node import SwarmNode
        from systems.swarm.consensus import ProposalStatus

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            # Create proposer node
            node1 = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )
            proposal = node1.create_proposal(
                title="Evaluate Test",
                description="Testing evaluation"
            )
            node1.broadcast_proposal(proposal)

            # Cast approving votes with high confidence
            node2 = SwarmNode(
                node_id="node-beta",
                clipboard_url=clipboard_path
            )
            vote1 = node2.create_vote(
                proposal_id=proposal.id,
                approve=True,
                confidence=0.9
            )
            node2.broadcast_vote(vote1)

            node3 = SwarmNode(
                node_id="node-gamma",
                clipboard_url=clipboard_path
            )
            vote2 = node3.create_vote(
                proposal_id=proposal.id,
                approve=True,
                confidence=0.8
            )
            node3.broadcast_vote(vote2)

            # Collect and evaluate
            votes = node1.collect_votes(proposal.id)
            for v in votes:
                proposal.add_vote(v)

            result = node1.evaluate_proposal(proposal)

            assert result["approved"] is True
            assert proposal.status == ProposalStatus.APPROVED
            assert result["weighted_approval"] > 0.6

    def test_evaluate_proposal_rejection(self):
        """Test evaluating a proposal that should be rejected."""
        from systems.swarm.swarm_node import SwarmNode
        from systems.swarm.consensus import ProposalStatus

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            # Create proposer node
            node1 = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )
            proposal = node1.create_proposal(
                title="Reject Test",
                description="Testing rejection"
            )
            node1.broadcast_proposal(proposal)

            # Cast rejecting votes with high confidence
            node2 = SwarmNode(
                node_id="node-beta",
                clipboard_url=clipboard_path
            )
            vote1 = node2.create_vote(
                proposal_id=proposal.id,
                approve=False,
                confidence=0.9
            )
            node2.broadcast_vote(vote1)

            node3 = SwarmNode(
                node_id="node-gamma",
                clipboard_url=clipboard_path
            )
            vote2 = node3.create_vote(
                proposal_id=proposal.id,
                approve=False,
                confidence=0.8
            )
            node3.broadcast_vote(vote2)

            # Collect and evaluate
            votes = node1.collect_votes(proposal.id)
            for v in votes:
                proposal.add_vote(v)

            result = node1.evaluate_proposal(proposal)

            assert result["approved"] is False
            assert proposal.status == ProposalStatus.REJECTED


class TestSwarmNodeProposeAndVote:
    """Tests for the convenience method propose_and_vote."""

    def test_propose_and_vote(self):
        """Test the convenience method for proposing and voting in one call."""
        from systems.swarm.swarm_node import SwarmNode
        from systems.swarm.consensus import ProposalStatus

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            node = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )

            proposal = node.propose_and_vote(
                title="Convenience Test",
                description="Testing propose_and_vote",
                confidence=0.9,
                approve=True
            )

            assert proposal.title == "Convenience Test"
            assert proposal.proposer == "node-alpha"
            assert len(proposal.votes) == 1
            assert proposal.votes[0].voter == "node-alpha"
            assert proposal.votes[0].approve is True
            assert proposal.votes[0].confidence == 0.9

            # Verify both proposal and vote were broadcast
            proposals = node.check_for_proposals()
            assert len(proposals) == 1
            assert proposals[0].title == "Convenience Test"

    def test_propose_and_vote_with_reasoning(self):
        """Test propose_and_vote with reasoning."""
        from systems.swarm.swarm_node import SwarmNode

        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "clipboard.txt")

            node = SwarmNode(
                node_id="node-alpha",
                clipboard_url=clipboard_path
            )

            proposal = node.propose_and_vote(
                title="Reasoning Test",
                description="Testing with reasoning",
                confidence=0.85,
                approve=False,
                reasoning="I have concerns"
            )

            assert proposal.votes[0].reasoning == "I have concerns"
            assert proposal.votes[0].approve is False
