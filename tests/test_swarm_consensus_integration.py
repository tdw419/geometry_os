"""
Integration Tests for Swarm Consensus

Tests the full consensus flow between two nodes via clipboard-based communication.
Requires a running clipboard server or uses local file-based clipboard.

Run with: pytest tests/test_swarm_consensus_integration.py -v -m integration
Skip if clipboard server not available: pytest tests/test_swarm_consensus_integration.py -v -m integration --skip-integration
Or set env: SKIP_INTEGRATION_TESTS=1
"""

import pytest
import tempfile
import os
import time

from systems.swarm.swarm_node import SwarmNode
from systems.swarm.consensus import ProposalStatus


# Check if we should skip integration tests
def should_skip_integration():
    """Check if integration tests should be skipped."""
    # Skip if explicitly requested
    if os.environ.get("SKIP_INTEGRATION_TESTS", "").lower() in ("1", "true", "yes"):
        return True

    # Check if clipboard server is available (optional check)
    clipboard_url = os.environ.get("SWARM_CLIPBOARD_URL", "")
    if clipboard_url:
        # If a remote clipboard URL is set, check if it's accessible
        # For now, we use local file-based clipboard, so no server needed
        pass

    return False


@pytest.mark.integration
@pytest.mark.skipif(should_skip_integration(), reason="Integration tests skipped")
class TestTwoNodeConsensusFlow:
    """
    Integration tests for full consensus flow between two nodes.

    These tests simulate real-world scenarios where multiple nodes
    communicate via a shared clipboard to reach consensus.
    """

    @pytest.fixture
    def shared_clipboard(self):
        """Create a temporary clipboard file for testing."""
        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "swarm_clipboard.txt")
            yield clipboard_path

    @pytest.fixture
    def node_alpha(self, shared_clipboard):
        """Create node alpha (the proposer)."""
        return SwarmNode(
            node_id="node-alpha",
            clipboard_url=shared_clipboard,
            threshold=0.6
        )

    @pytest.fixture
    def node_beta(self, shared_clipboard):
        """Create node beta (the voter)."""
        return SwarmNode(
            node_id="node-beta",
            clipboard_url=shared_clipboard,
            threshold=0.6
        )

    def test_full_consensus_flow_approval(self, node_alpha, node_beta, shared_clipboard):
        """
        Test complete consensus flow: propose -> broadcast -> vote -> evaluate -> approve.

        Flow:
        1. Node alpha creates and broadcasts a proposal
        2. Node beta sees the proposal, creates and broadcasts a vote
        3. Node alpha collects votes and evaluates consensus
        4. Proposal is approved
        """
        # Step 1: Node alpha proposes
        proposal = node_alpha.propose_and_vote(
            title="Add Feature X",
            description="Implement feature X for improved performance",
            confidence=0.85,
            approve=True,
            reasoning="Feature X will improve throughput by 20%"
        )

        # Verify proposal was broadcast
        assert os.path.exists(shared_clipboard)

        # Step 2: Node beta sees the proposal
        proposals = node_beta.check_for_proposals()
        assert len(proposals) == 1
        seen_proposal = proposals[0]
        assert seen_proposal.title == "Add Feature X"
        assert seen_proposal.proposer == "node-alpha"

        # Step 3: Node beta votes on the proposal
        vote = node_beta.create_vote(
            proposal_id=seen_proposal.id,
            approve=True,
            confidence=0.9,
            reasoning="I agree, this is valuable"
        )
        node_beta.broadcast_vote(vote)

        # Step 4: Node alpha collects votes and evaluates
        votes = node_alpha.collect_votes(proposal.id)
        for v in votes:
            proposal.add_vote(v)

        # Step 5: Evaluate consensus
        result = node_alpha.evaluate_proposal(proposal)

        # Both nodes approved with high confidence -> should pass
        assert result["approved"] is True
        assert proposal.status == ProposalStatus.APPROVED
        assert result["vote_count"] == 2  # Alpha's self-vote + Beta's vote
        assert result["weighted_approval"] >= 0.6

    def test_full_consensus_flow_rejection(self, node_alpha, node_beta, shared_clipboard):
        """
        Test complete consensus flow ending in rejection.

        Flow:
        1. Node alpha proposes
        2. Node beta votes against with high confidence
        3. Consensus is NOT reached for approval
        """
        # Node alpha proposes with moderate confidence
        proposal = node_alpha.propose_and_vote(
            title="Remove Legacy API",
            description="Deprecate the old API endpoint",
            confidence=0.6,
            approve=True,
            reasoning="Time to modernize"
        )

        # Node beta sees and strongly rejects
        proposals = node_beta.check_for_proposals()
        seen_proposal = proposals[0]

        vote = node_beta.create_vote(
            proposal_id=seen_proposal.id,
            approve=False,
            confidence=0.95,  # High confidence rejection
            reasoning="Breaking change for many users"
        )
        node_beta.broadcast_vote(vote)

        # Node alpha collects and evaluates
        votes = node_alpha.collect_votes(proposal.id)
        for v in votes:
            proposal.add_vote(v)

        result = node_alpha.evaluate_proposal(proposal)

        # Weighted: alpha approves (0.6), beta rejects (0.95)
        # Weighted approval = 0.6 / (0.6 + 0.95) = 0.387 < 0.6 -> rejected
        assert result["approved"] is False
        assert proposal.status == ProposalStatus.REJECTED
        assert result["weighted_approval"] < 0.6

    def test_three_node_consensus(self, shared_clipboard):
        """
        Test consensus with three nodes voting.

        This tests the weighted confidence system with multiple voters.
        """
        # Create three nodes
        node_a = SwarmNode(node_id="node-a", clipboard_url=shared_clipboard, threshold=0.6)
        node_b = SwarmNode(node_id="node-b", clipboard_url=shared_clipboard, threshold=0.6)
        node_c = SwarmNode(node_id="node-c", clipboard_url=shared_clipboard, threshold=0.6)

        # Node A proposes
        proposal = node_a.propose_and_vote(
            title="Refactor Module",
            description="Split the monolith into microservices",
            confidence=0.7,
            approve=True
        )

        # Node B approves with high confidence
        proposals = node_b.check_for_proposals()
        vote_b = node_b.create_vote(
            proposal_id=proposals[0].id,
            approve=True,
            confidence=0.9
        )
        node_b.broadcast_vote(vote_b)

        # Node C approves with low confidence
        vote_c = node_c.create_vote(
            proposal_id=proposals[0].id,
            approve=True,
            confidence=0.5
        )
        node_c.broadcast_vote(vote_c)

        # Collect all votes
        votes = node_a.collect_votes(proposal.id)
        for v in votes:
            proposal.add_vote(v)

        result = node_a.evaluate_proposal(proposal)

        # All approve: weighted_approval = (0.7 + 0.9 + 0.5) / (0.7 + 0.9 + 0.5) = 1.0
        assert result["approved"] is True
        assert result["vote_count"] == 3
        assert result["weighted_approval"] == 1.0  # 100% approval

    def test_vote_change_allowed(self, node_alpha, node_beta, shared_clipboard):
        """
        Test that nodes can change their votes.

        The system should allow vote updates (last vote from a voter wins).
        """
        # Node alpha proposes
        proposal = node_alpha.propose_and_vote(
            title="Experimental Feature",
            description="Try new approach",
            confidence=0.5,
            approve=True
        )

        # Node beta votes against
        proposals = node_beta.check_for_proposals()
        vote1 = node_beta.create_vote(
            proposal_id=proposals[0].id,
            approve=False,
            confidence=0.8
        )
        node_beta.broadcast_vote(vote1)

        # Node beta changes mind and votes again
        vote2 = node_beta.create_vote(
            proposal_id=proposals[0].id,
            approve=True,
            confidence=0.9
        )
        node_beta.broadcast_vote(vote2)

        # Collect votes - should have 3 entries but only 2 unique voters
        votes = node_alpha.collect_votes(proposal.id)

        # Add votes to proposal (last vote from same voter wins)
        for v in votes:
            proposal.add_vote(v)

        # Verify only 2 voters (alpha and beta)
        unique_voters = set(v.voter for v in proposal.votes)
        assert len(unique_voters) == 2

        # Evaluate - both approve now
        result = node_alpha.evaluate_proposal(proposal)
        assert result["approved"] is True

    def test_message_ordering(self, node_alpha, node_beta, shared_clipboard):
        """
        Test that messages are processed in order and none are lost.

        Ensures clipboard append mode works correctly.
        """
        # Node alpha creates proposal
        proposal = node_alpha.create_proposal(
            title="Order Test",
            description="Testing message ordering"
        )
        node_alpha.broadcast_proposal(proposal)

        # Multiple rapid votes
        for i in range(5):
            vote = node_beta.create_vote(
                proposal_id=proposal.id,
                approve=True,
                confidence=0.5 + (i * 0.1)
            )
            node_beta.broadcast_vote(vote)

        # Collect all votes
        votes = node_alpha.collect_votes(proposal.id)

        # Should have 5 votes from node_beta
        assert len(votes) == 5

        # All votes should be from node_beta
        assert all(v.voter == "node-beta" for v in votes)

        # Confidence should increase with each vote
        confidences = [v.confidence for v in votes]
        assert confidences == sorted(confidences)


@pytest.mark.integration
@pytest.mark.skipif(should_skip_integration(), reason="Integration tests skipped")
class TestConsensusEdgeCases:
    """Integration tests for edge cases in consensus."""

    @pytest.fixture
    def shared_clipboard(self):
        """Create a temporary clipboard file for testing."""
        with tempfile.TemporaryDirectory() as tmpdir:
            clipboard_path = os.path.join(tmpdir, "swarm_clipboard.txt")
            yield clipboard_path

    def test_no_votes_proposal(self, shared_clipboard):
        """Test proposal with no votes (besides proposer)."""
        node = SwarmNode(node_id="lonely-node", clipboard_url=shared_clipboard)

        proposal = node.create_proposal(
            title="Solo Proposal",
            description="No one else is here"
        )
        node.broadcast_proposal(proposal)

        # Check proposals
        proposals = node.check_for_proposals()
        assert len(proposals) == 1

        # No votes collected
        votes = node.collect_votes(proposal.id)
        assert len(votes) == 0

        # Evaluate with no votes
        result = node.evaluate_proposal(proposal)
        assert result["approved"] is False
        assert result["vote_count"] == 0

    def test_empty_clipboard(self, shared_clipboard):
        """Test behavior with empty clipboard."""
        node = SwarmNode(node_id="test-node", clipboard_url=shared_clipboard)

        # Check for proposals on empty clipboard
        proposals = node.check_for_proposals()
        assert proposals == []

        # Collect votes for non-existent proposal
        votes = node.collect_votes("non-existent-id")
        assert votes == []

    def test_concurrent_proposals(self, shared_clipboard):
        """Test handling of multiple concurrent proposals."""
        node_a = SwarmNode(node_id="node-a", clipboard_url=shared_clipboard)
        node_b = SwarmNode(node_id="node-b", clipboard_url=shared_clipboard)

        # Both nodes propose simultaneously
        proposal_a = node_a.propose_and_vote(
            title="Proposal A",
            description="First proposal",
            confidence=0.8,
            approve=True
        )

        proposal_b = node_b.propose_and_vote(
            title="Proposal B",
            description="Second proposal",
            confidence=0.7,
            approve=True
        )

        # Each node should see both proposals
        proposals_a = node_a.check_for_proposals()
        proposals_b = node_b.check_for_proposals()

        assert len(proposals_a) == 2
        assert len(proposals_b) == 2

        # Verify both proposals are present
        titles = {p.title for p in proposals_a}
        assert titles == {"Proposal A", "Proposal B"}

    def test_malformed_message_ignored(self, shared_clipboard):
        """Test that malformed messages are ignored without breaking the system."""
        node = SwarmNode(node_id="test-node", clipboard_url=shared_clipboard)

        # Write malformed data to clipboard
        with open(shared_clipboard, "w") as f:
            f.write("INVALID_LINE\n")
            f.write("SWARM_PROPOSAL:not json at all\n")
            f.write("SWARM_VOTE:also not json\n")

        # Create valid proposal
        proposal = node.create_proposal(
            title="Valid Proposal",
            description="This one is valid"
        )
        node.broadcast_proposal(proposal)

        # Should still be able to read the valid proposal
        proposals = node.check_for_proposals()
        assert len(proposals) == 1
        assert proposals[0].title == "Valid Proposal"
