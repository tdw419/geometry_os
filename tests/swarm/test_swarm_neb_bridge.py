"""
Tests for SwarmNEBBridge - Bridge between SwarmNode consensus and NEBBus pub/sub.
"""

import os
import tempfile
import pytest

from systems.swarm.swarm_neb_bridge import SwarmNEBBridge
from systems.swarm.neb_bus import NEBBus


class TestSwarmNEBBridgeSubscriptions:
    """Test SwarmNEBBridge subscription methods."""

    @pytest.fixture
    def temp_clipboard(self):
        """Create a temporary clipboard file for testing."""
        fd, path = tempfile.mkstemp(suffix=".json")
        os.close(fd)
        yield path
        if os.path.exists(path):
            os.unlink(path)

    @pytest.fixture
    def bridge_with_bus(self, temp_clipboard):
        """Create a SwarmNEBBridge with NEBBus attached."""
        bus = NEBBus(node_id="test-node")
        bridge = SwarmNEBBridge(
            clipboard_url=temp_clipboard,
            node_id="test-agent",
            event_bus=bus
        )
        return bridge, bus

    def test_subscribe_to_proposals(self, bridge_with_bus):
        """Subscribe to proposal events via NEBBus."""
        bridge, bus = bridge_with_bus
        received = []

        # Subscribe to proposal events
        subscription_id = bridge.subscribe_to_proposals(
            lambda s: received.append(s)
        )

        # Create a proposal (should trigger event)
        proposal = bridge.create_proposal(
            title="Test Proposal",
            description="A test proposal for subscription"
        )

        # Verify subscription ID returned
        assert subscription_id is not None
        assert isinstance(subscription_id, str)

        # Verify event was received
        assert len(received) == 1
        assert received[0].topic == f"swarm.proposal.{proposal.id}"
        assert received[0].payload["proposal_id"] == proposal.id
        assert received[0].payload["title"] == "Test Proposal"

    def test_subscribe_to_votes(self, bridge_with_bus):
        """Subscribe to vote events via NEBBus."""
        bridge, bus = bridge_with_bus
        received = []

        # Subscribe to vote events
        subscription_id = bridge.subscribe_to_votes(
            lambda s: received.append(s)
        )

        # Create a proposal first
        proposal = bridge.create_proposal(
            title="Vote Test",
            description="Testing vote subscription"
        )

        # Create a vote (should trigger event)
        vote = bridge.create_vote(
            proposal_id=proposal.id,
            approve=True,
            confidence=0.9,
            reasoning="Good proposal"
        )

        # Verify subscription ID returned
        assert subscription_id is not None
        assert isinstance(subscription_id, str)

        # Verify event was received
        assert len(received) == 1
        assert received[0].topic == f"swarm.vote.{proposal.id}"
        assert received[0].payload["proposal_id"] == proposal.id
        assert received[0].payload["approve"] is True
        assert received[0].payload["confidence"] == 0.9

    def test_subscribe_to_consensus(self, bridge_with_bus):
        """Subscribe to consensus result events via NEBBus."""
        bridge, bus = bridge_with_bus
        received = []

        # Subscribe to consensus events
        subscription_id = bridge.subscribe_to_consensus(
            lambda s: received.append(s)
        )

        # Create a proposal
        proposal = bridge.create_proposal(
            title="Consensus Test",
            description="Testing consensus subscription"
        )

        # Broadcast proposal to clipboard so evaluate_consensus can find it
        bridge.node.broadcast_proposal(proposal)

        # Create and broadcast a vote
        vote = bridge.create_vote(
            proposal_id=proposal.id,
            approve=True,
            confidence=0.95,
            reasoning="Strong approval"
        )
        bridge.node.broadcast_vote(vote)

        # Evaluate consensus (should trigger event)
        result = bridge.evaluate_consensus(proposal.id)

        # Verify subscription ID returned
        assert subscription_id is not None
        assert isinstance(subscription_id, str)

        # Verify event was received
        assert len(received) == 1
        assert received[0].topic == f"swarm.consensus.{proposal.id}"
        assert received[0].payload["proposal_id"] == proposal.id
        assert received[0].payload["approved"] == result["approved"]

    def test_unsubscribe_from_proposals(self, bridge_with_bus):
        """Unsubscribe from proposal events."""
        bridge, bus = bridge_with_bus
        received = []

        # Subscribe to proposal events
        subscription_id = bridge.subscribe_to_proposals(
            lambda s: received.append(s)
        )

        # Create a proposal (should trigger event)
        bridge.create_proposal("First", "First proposal")

        assert len(received) == 1

        # Unsubscribe
        success = bridge.unsubscribe(subscription_id)

        # Verify unsubscription succeeded
        assert success is True

        # Create another proposal (should NOT trigger event)
        bridge.create_proposal("Second", "Second proposal")

        # Should still be 1 (no new event)
        assert len(received) == 1
