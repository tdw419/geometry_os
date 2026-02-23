"""
Tests for Swarm Consensus Data Structures

TDD tests for SwarmProposal and SwarmVote dataclasses.
"""

import pytest
from datetime import datetime


class TestSwarmProposalCreation:
    """Tests for SwarmProposal creation and serialization."""

    def test_swarm_proposal_creation(self):
        """Test basic SwarmProposal creation with required fields."""
        from systems.swarm.consensus import SwarmProposal, ProposalStatus

        proposal = SwarmProposal(
            title="Test Proposal",
            description="A test proposal for unit testing",
            proposer="node-alpha"
        )

        assert proposal.title == "Test Proposal"
        assert proposal.description == "A test proposal for unit testing"
        assert proposal.proposer == "node-alpha"
        assert proposal.status == ProposalStatus.PENDING
        assert proposal.id is not None
        assert len(proposal.id) == 36  # UUID format
        assert proposal.votes == []
        assert proposal.created_at is not None

    def test_proposal_to_dict(self):
        """Test SwarmProposal serialization to dictionary."""
        from systems.swarm.consensus import SwarmProposal, ProposalStatus

        proposal = SwarmProposal(
            title="Serialization Test",
            description="Testing to_dict",
            proposer="node-beta"
        )

        data = proposal.to_dict()

        assert data["title"] == "Serialization Test"
        assert data["description"] == "Testing to_dict"
        assert data["proposer"] == "node-beta"
        assert data["status"] == "pending"
        assert "id" in data
        assert "created_at" in data
        assert data["votes"] == []

    def test_proposal_from_dict(self):
        """Test SwarmProposal deserialization from dictionary."""
        from systems.swarm.consensus import SwarmProposal, ProposalStatus

        data = {
            "id": "test-id-123",
            "title": "Deserialization Test",
            "description": "Testing from_dict",
            "proposer": "node-gamma",
            "status": "active",
            "votes": [],
            "created_at": "2026-02-22T12:00:00"
        }

        proposal = SwarmProposal.from_dict(data)

        assert proposal.id == "test-id-123"
        assert proposal.title == "Deserialization Test"
        assert proposal.description == "Testing from_dict"
        assert proposal.proposer == "node-gamma"
        assert proposal.status == ProposalStatus.ACTIVE
        assert proposal.votes == []


class TestSwarmVoteCreation:
    """Tests for SwarmVote creation and validation."""

    def test_swarm_vote_creation(self):
        """Test basic SwarmVote creation with required fields."""
        from systems.swarm.consensus import SwarmVote

        vote = SwarmVote(
            proposal_id="prop-123",
            voter="node-alpha",
            approve=True,
            confidence=0.85,
            reasoning="Looks good to me"
        )

        assert vote.proposal_id == "prop-123"
        assert vote.voter == "node-alpha"
        assert vote.approve is True
        assert vote.confidence == 0.85
        assert vote.reasoning == "Looks good to me"

    def test_swarm_vote_confidence_bounds(self):
        """Test that confidence is clamped to 0.0-1.0 range."""
        from systems.swarm.consensus import SwarmVote

        # Test upper bound clamping
        vote_high = SwarmVote(
            proposal_id="prop-123",
            voter="node-beta",
            approve=True,
            confidence=1.5,  # Over 1.0
            reasoning="Testing upper bound"
        )
        assert vote_high.confidence == 1.0

        # Test lower bound clamping
        vote_low = SwarmVote(
            proposal_id="prop-123",
            voter="node-gamma",
            approve=False,
            confidence=-0.5,  # Below 0.0
            reasoning="Testing lower bound"
        )
        assert vote_low.confidence == 0.0

        # Test valid confidence values
        vote_valid = SwarmVote(
            proposal_id="prop-123",
            voter="node-delta",
            approve=True,
            confidence=0.5,
            reasoning="Testing valid value"
        )
        assert vote_valid.confidence == 0.5

    def test_vote_to_dict(self):
        """Test SwarmVote serialization to dictionary."""
        from systems.swarm.consensus import SwarmVote

        vote = SwarmVote(
            proposal_id="prop-456",
            voter="node-epsilon",
            approve=False,
            confidence=0.3,
            reasoning="Needs more work"
        )

        data = vote.to_dict()

        assert data["proposal_id"] == "prop-456"
        assert data["voter"] == "node-epsilon"
        assert data["approve"] is False
        assert data["confidence"] == 0.3
        assert data["reasoning"] == "Needs more work"

    def test_vote_from_dict(self):
        """Test SwarmVote deserialization from dictionary."""
        from systems.swarm.consensus import SwarmVote

        data = {
            "proposal_id": "prop-789",
            "voter": "node-zeta",
            "approve": True,
            "confidence": 0.95,
            "reasoning": "Excellent proposal"
        }

        vote = SwarmVote.from_dict(data)

        assert vote.proposal_id == "prop-789"
        assert vote.voter == "node-zeta"
        assert vote.approve is True
        assert vote.confidence == 0.95
        assert vote.reasoning == "Excellent proposal"


class TestProposalVoteIntegration:
    """Tests for proposal-vote interactions."""

    def test_proposal_add_vote(self):
        """Test adding votes to a proposal."""
        from systems.swarm.consensus import SwarmProposal, SwarmVote

        proposal = SwarmProposal(
            title="Vote Test",
            description="Testing vote addition",
            proposer="node-alpha"
        )

        vote1 = SwarmVote(
            proposal_id=proposal.id,
            voter="node-beta",
            approve=True,
            confidence=0.9,
            reasoning="I approve"
        )

        vote2 = SwarmVote(
            proposal_id=proposal.id,
            voter="node-gamma",
            approve=False,
            confidence=0.7,
            reasoning="I have concerns"
        )

        proposal.add_vote(vote1)
        assert len(proposal.votes) == 1
        assert proposal.votes[0].voter == "node-beta"

        proposal.add_vote(vote2)
        assert len(proposal.votes) == 2
        assert proposal.votes[1].voter == "node-gamma"

    def test_proposal_prevents_duplicate_voters(self):
        """Test that a voter can only vote once per proposal."""
        from systems.swarm.consensus import SwarmProposal, SwarmVote

        proposal = SwarmProposal(
            title="Duplicate Test",
            description="Testing duplicate prevention",
            proposer="node-alpha"
        )

        vote1 = SwarmVote(
            proposal_id=proposal.id,
            voter="node-beta",
            approve=True,
            confidence=0.8,
            reasoning="First vote"
        )

        vote2 = SwarmVote(
            proposal_id=proposal.id,
            voter="node-beta",  # Same voter
            approve=False,
            confidence=0.9,
            reasoning="Changed my mind"
        )

        proposal.add_vote(vote1)
        proposal.add_vote(vote2)  # Should update, not add

        assert len(proposal.votes) == 1
        assert proposal.votes[0].approve is False  # Updated vote
        assert proposal.votes[0].confidence == 0.9

    def test_proposal_get_vote_summary(self):
        """Test getting vote summary statistics."""
        from systems.swarm.consensus import SwarmProposal, SwarmVote

        proposal = SwarmProposal(
            title="Summary Test",
            description="Testing vote summary",
            proposer="node-alpha"
        )

        # Add 3 approve votes with different confidences
        proposal.add_vote(SwarmVote(proposal.id, "n1", True, 0.9, "Yes"))
        proposal.add_vote(SwarmVote(proposal.id, "n2", True, 0.8, "Yes"))
        proposal.add_vote(SwarmVote(proposal.id, "n3", False, 0.7, "No"))

        summary = proposal.get_vote_summary()

        assert summary["total_votes"] == 3
        assert summary["approve_count"] == 2
        assert summary["reject_count"] == 1
        assert summary["approve_ratio"] == 2/3


class TestWeightedConfidenceCalculator:
    """Tests for WeightedConfidenceCalculator - weighted voting strategy."""

    def test_weighted_confidence_calculator(self):
        """Test weighted confidence: approve=True wins with higher confidence."""
        from systems.swarm.consensus import (
            WeightedConfidenceCalculator, SwarmProposal, SwarmVote
        )

        calc = WeightedConfidenceCalculator()
        proposal = SwarmProposal(
            title="Test Proposal",
            description="Testing weighted confidence",
            proposer="node-alpha"
        )

        # 2 approve with high confidence (0.9, 0.8) = 1.7 weighted
        # 1 reject with low confidence (0.3) = 0.3 weighted
        # Weighted approval: (0.9 + 0.8) / (0.9 + 0.8 + 0.3) = 1.7 / 2.0 = 0.85
        proposal.add_vote(SwarmVote(proposal.id, "n1", True, 0.9, "Approve"))
        proposal.add_vote(SwarmVote(proposal.id, "n2", True, 0.8, "Approve"))
        proposal.add_vote(SwarmVote(proposal.id, "n3", False, 0.3, "Reject"))

        result = calc.calculate(proposal.votes)

        assert result["weighted_approval"] == pytest.approx(0.85, rel=0.01)
        assert result["approved"] is True  # 0.85 > 0.6 threshold
        assert result["vote_count"] == 3

    def test_weighted_confidence_rejection(self):
        """Test weighted confidence: approve=False wins with higher confidence."""
        from systems.swarm.consensus import (
            WeightedConfidenceCalculator, SwarmProposal, SwarmVote
        )

        calc = WeightedConfidenceCalculator()
        proposal = SwarmProposal(
            title="Reject Proposal",
            description="Testing rejection",
            proposer="node-alpha"
        )

        # 1 approve with low confidence (0.2) = 0.2 weighted
        # 2 reject with high confidence (0.9, 0.8) = 1.7 weighted
        # Weighted approval: 0.2 / (0.2 + 0.9 + 0.8) = 0.2 / 1.9 = 0.105
        proposal.add_vote(SwarmVote(proposal.id, "n1", True, 0.2, "Weak approve"))
        proposal.add_vote(SwarmVote(proposal.id, "n2", False, 0.9, "Strong reject"))
        proposal.add_vote(SwarmVote(proposal.id, "n3", False, 0.8, "Strong reject"))

        result = calc.calculate(proposal.votes)

        assert result["weighted_approval"] == pytest.approx(0.105, rel=0.01)
        assert result["approved"] is False  # 0.105 < 0.6 threshold
        assert result["vote_count"] == 3

    def test_weighted_confidence_empty(self):
        """Test weighted confidence with no votes."""
        from systems.swarm.consensus import (
            WeightedConfidenceCalculator, SwarmProposal
        )

        calc = WeightedConfidenceCalculator()
        proposal = SwarmProposal(
            title="Empty Proposal",
            description="No votes",
            proposer="node-alpha"
        )

        result = calc.calculate(proposal.votes)

        assert result["weighted_approval"] == 0.0
        assert result["approved"] is False  # No votes = not approved
        assert result["vote_count"] == 0

    def test_weighted_confidence_tie(self):
        """Test weighted confidence with exact tie."""
        from systems.swarm.consensus import (
            WeightedConfidenceCalculator, SwarmProposal, SwarmVote
        )

        calc = WeightedConfidenceCalculator()
        proposal = SwarmProposal(
            title="Tie Proposal",
            description="Testing tie",
            proposer="node-alpha"
        )

        # Equal weighted approve and reject: 0.5 each
        proposal.add_vote(SwarmVote(proposal.id, "n1", True, 0.5, "Approve"))
        proposal.add_vote(SwarmVote(proposal.id, "n2", False, 0.5, "Reject"))

        result = calc.calculate(proposal.votes)

        assert result["weighted_approval"] == 0.5
        assert result["approved"] is False  # 0.5 < 0.6 threshold
        assert result["vote_count"] == 2

    def test_weighted_confidence_custom_threshold(self):
        """Test weighted confidence with custom threshold."""
        from systems.swarm.consensus import (
            WeightedConfidenceCalculator, SwarmProposal, SwarmVote
        )

        calc = WeightedConfidenceCalculator()
        proposal = SwarmProposal(
            title="Custom Threshold",
            description="Testing custom threshold",
            proposer="node-alpha"
        )

        # Weighted approval: 0.55 (below 0.6, above 0.5)
        proposal.add_vote(SwarmVote(proposal.id, "n1", True, 0.55, "Approve"))
        proposal.add_vote(SwarmVote(proposal.id, "n2", False, 0.45, "Reject"))

        # Default threshold (0.6) should reject
        result_default = calc.calculate(proposal.votes, threshold=0.6)
        assert result_default["approved"] is False

        # Lower threshold (0.5) should approve
        result_lower = calc.calculate(proposal.votes, threshold=0.5)
        assert result_lower["approved"] is True

    def test_evaluate_proposal_updates_status(self):
        """Test that evaluate_proposal updates proposal status."""
        from systems.swarm.consensus import (
            WeightedConfidenceCalculator, SwarmProposal, SwarmVote, ProposalStatus
        )

        calc = WeightedConfidenceCalculator()
        proposal = SwarmProposal(
            title="Status Update Test",
            description="Testing status update",
            proposer="node-alpha"
        )

        # Add votes that will approve
        proposal.add_vote(SwarmVote(proposal.id, "n1", True, 0.9, "Approve"))
        proposal.add_vote(SwarmVote(proposal.id, "n2", True, 0.8, "Approve"))

        # Before evaluation, status should be ACTIVE (votes added)
        assert proposal.status == ProposalStatus.ACTIVE

        # Evaluate
        result = calc.evaluate_proposal(proposal)

        # After evaluation, status should be APPROVED
        assert proposal.status == ProposalStatus.APPROVED
        assert result["approved"] is True
