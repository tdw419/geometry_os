"""
End-to-end tests for Tectonic Negotiation System.

Task 5.1 of Tectonic Realignment Plan.

Tests cover:
1. Two agent negotiation
2. Multi-agent conflict
3. Force resolution
4. GeoASM execution
5. Timeout behavior
6. WebSocket flow
7. Budget exhaustion
8. Concurrent claims
9. Settlement history
10. Error recovery
"""

import asyncio
import math
import struct
import time
import uuid
from unittest.mock import MagicMock

import pytest

from systems.tectonic.claim import (
    TectonicClaim,
    TectonicBid,
    TectonicSettlement,
    ClaimStatus,
    TECTONIC_SETTLE_OPCODE,
)
from systems.tectonic.negotiator import (
    TectonicNegotiator,
    BID_WINDOW_SECONDS,
    DEFAULT_SEMANTIC_WEIGHT,
    DEFAULT_COMPETING_WEIGHT,
    DEFAULT_ANCHOR_CONSTANT,
)
from systems.tectonic.agent import TectonicAgent
from systems.visual_shell.web.tectonic_bridge import TectonicBridge, MockWebSocket


# =============================================================================
# Fixtures
# =============================================================================

@pytest.fixture
def negotiator():
    """Create a fresh TectonicNegotiator for each test."""
    return TectonicNegotiator()


@pytest.fixture
def agents(negotiator):
    """Create three agents with 100.0 spatial budget each."""
    return [
        TectonicAgent(negotiator=negotiator, spatial_budget=100.0),
        TectonicAgent(negotiator=negotiator, spatial_budget=100.0),
        TectonicAgent(negotiator=negotiator, spatial_budget=100.0),
    ]


@pytest.fixture
def bridge(negotiator):
    """Create a TectonicBridge with a fresh negotiator."""
    return TectonicBridge(negotiator=negotiator)


# =============================================================================
# Test 1: Two Agent Negotiation
# =============================================================================

class TestTwoAgentNegotiation:
    """Test basic two-agent negotiation scenario."""

    def test_two_agent_negotiation(self, negotiator, agents):
        """
        Agent A claims tile (42, 17) for "Code Palace".
        Agent B counter-bids within window.
        Settlement resolves correctly.
        Winner's budget consumed, loser's released.
        """
        agent_a, agent_b, _ = agents

        # Agent A claims tile
        claim_id = agent_a.submit_claim(
            tile=(42, 17),
            purpose="Code Palace",
            bid=30.0
        )

        # Verify claim submitted
        assert claim_id is not None
        assert len(agent_a.pending_claims) == 1
        assert agent_a.get_budget_reserved() == 30.0
        assert agent_a.get_budget_remaining() == 70.0

        # Agent B counter-bids within window
        accepted = agent_b.counter_bid(claim_id, amount=25.0)
        assert accepted is True
        assert agent_b.get_budget_reserved() == 25.0

        # Settle the claim
        settlement = negotiator.settle(claim_id)

        # Calculate expected forces
        # F_claim = 30.0 * 1.0 = 30.0
        # F_counter = 25.0 * 0.8 = 20.0
        # F_anchor = sqrt(42^2 + 17^2) * 0.1 = sqrt(1764 + 289) * 0.1 = sqrt(2053) * 0.1 ~ 4.53
        # Winner if F_claim > F_counter + F_anchor
        # 30.0 > 20.0 + 4.53 = 24.53, so Agent A wins

        distance = math.sqrt(42 * 42 + 17 * 17)
        expected_f_claim = 30.0 * DEFAULT_SEMANTIC_WEIGHT
        expected_f_counter = 25.0 * DEFAULT_COMPETING_WEIGHT
        expected_f_anchor = distance * DEFAULT_ANCHOR_CONSTANT

        assert expected_f_claim > expected_f_counter + expected_f_anchor, \
            "Test setup error: Agent A should win this scenario"

        # Verify settlement
        assert settlement.winner == agent_a.agent_id
        assert settlement.claim.tile == (42, 17)
        assert settlement.claim.purpose == "Code Palace"

        # Have agents process the settlement
        agent_a.handle_settlement(settlement)
        agent_b.handle_settlement(settlement)

        # Verify budget changes
        # Winner's budget consumed
        assert agent_a.get_budget_consumed() == 30.0
        assert agent_a.get_budget_remaining() == 70.0
        assert len(agent_a.won_claims) == 1
        assert len(agent_a.lost_claims) == 0

        # Loser's budget released
        assert agent_b.get_budget_consumed() == 0.0
        assert agent_b.get_budget_remaining() == 100.0
        assert len(agent_b.won_claims) == 0
        assert len(agent_b.lost_claims) == 1


# =============================================================================
# Test 2: Multi-Agent Conflict
# =============================================================================

class TestMultiAgentConflict:
    """Test scenarios with 3+ agents competing."""

    def test_multi_agent_conflict(self, negotiator, agents):
        """
        3+ agents competing for same tile.
        Multiple counter-bids.
        Force calculation determines winner correctly.
        All agents notified of settlement.
        """
        agent_a, agent_b, agent_c = agents

        # Agent A claims tile (10, 10)
        claim_id = agent_a.submit_claim(
            tile=(10, 10),
            purpose="Shared Workspace",
            bid=20.0
        )

        # Agent B and C both counter-bid
        agent_b.counter_bid(claim_id, amount=15.0)
        agent_c.counter_bid(claim_id, amount=18.0)

        # Calculate expected forces
        # F_claim = 20.0 * 1.0 = 20.0
        # F_counter = (15.0 + 18.0) * 0.8 = 33.0 * 0.8 = 26.4
        # F_anchor = sqrt(100 + 100) * 0.1 = sqrt(200) * 0.1 ~ 1.414
        # F_claim (20.0) < F_counter + F_anchor (26.4 + 1.414 = 27.814)
        # So Agent A loses, highest counter-bidder (Agent C with 18.0) wins

        # Settle
        settlement = negotiator.settle(claim_id)

        # Agent C should win (highest counter-bidder)
        assert settlement.winner == agent_c.agent_id

        # All agents process settlement
        agent_a.handle_settlement(settlement)
        agent_b.handle_settlement(settlement)
        agent_c.handle_settlement(settlement)

        # Verify results
        assert len(agent_a.lost_claims) == 1
        assert len(agent_b.lost_claims) == 1
        assert len(agent_c.won_claims) == 1

        # Budget checks
        assert agent_a.get_budget_remaining() == 100.0  # Released
        assert agent_b.get_budget_remaining() == 100.0  # Released
        assert agent_c.get_budget_consumed() == 18.0    # Consumed


# =============================================================================
# Test 3: Force Resolution
# =============================================================================

class TestForceResolution:
    """Test physics-based force calculation."""

    def test_force_resolution_basic(self, negotiator):
        """Verify force calculation matches expected formula."""
        claim = TectonicClaim(
            tile=(3, 4),  # distance = 5
            purpose="Test",
            bid=10.0,
            agent_id="agent-1",
        )
        claim_id = negotiator.submit_claim(claim)

        # Add counter-bid
        bid = TectonicBid(
            claim_id=claim_id,
            amount=5.0,
            agent_id="agent-2",
        )
        negotiator.submit_bid(bid)

        # Manually calculate forces
        # F_claim = 10.0 * 1.0 = 10.0
        # F_counter = 5.0 * 0.8 = 4.0
        # F_anchor = 5.0 * 0.1 = 0.5
        expected_f_claim = 10.0
        expected_f_counter = 4.0
        expected_f_anchor = 0.5

        # Get forces via settlement
        settlement = negotiator.settle(claim_id)

        # Verify winner (10.0 > 4.0 + 0.5 = 4.5)
        assert settlement.winner == "agent-1"
        assert settlement.force == expected_f_claim

    def test_force_claim_barely_wins(self, negotiator):
        """
        Test edge case where F_claim barely beats F_counter + F_anchor.
        """
        # We need: F_claim > F_counter + F_anchor
        # bid_claim * 1.0 > sum(counter_bids) * 0.8 + distance * 0.1
        #
        # With tile (1, 0), distance = 1, F_anchor = 0.1
        # With claim bid = 10.0, F_claim = 10.0
        # With counter = 12.0, F_counter = 12.0 * 0.8 = 9.6
        # F_claim (10.0) > F_counter (9.6) + F_anchor (0.1) = 9.7
        # So claimant wins by 0.3

        claim = TectonicClaim(
            tile=(1, 0),
            purpose="Edge Case Test",
            bid=10.0,
            agent_id="claimant",
        )
        claim_id = negotiator.submit_claim(claim)

        bid = TectonicBid(
            claim_id=claim_id,
            amount=12.0,
            agent_id="challenger",
        )
        negotiator.submit_bid(bid)

        settlement = negotiator.settle(claim_id)

        # Claimant should barely win
        assert settlement.winner == "claimant"

    def test_force_anchor_tips_balance(self, negotiator):
        """
        Test where F_anchor tips the balance.
        When F_claim ~ F_counter, anchor can decide.
        """
        # With tile (50, 0), distance = 50, F_anchor = 5.0
        # With claim bid = 8.0, F_claim = 8.0
        # With counter = 5.0, F_counter = 5.0 * 0.8 = 4.0
        # F_claim (8.0) < F_counter (4.0) + F_anchor (5.0) = 9.0
        # Claimant loses!

        claim = TectonicClaim(
            tile=(50, 0),
            purpose="Far Territory",
            bid=8.0,
            agent_id="claimant",
        )
        claim_id = negotiator.submit_claim(claim)

        bid = TectonicBid(
            claim_id=claim_id,
            amount=5.0,
            agent_id="challenger",
        )
        negotiator.submit_bid(bid)

        settlement = negotiator.settle(claim_id)

        # Challenger wins because anchor tips the balance
        assert settlement.winner == "challenger"


# =============================================================================
# Test 4: GeoASM Execution
# =============================================================================

class TestGeoASMExecution:
    """Test GeoASM program generation."""

    def test_geoasm_execution(self, negotiator):
        """
        Settlement generates valid GeoASM program.
        Program contains TECTONIC_SETTLE opcode (0xE2).
        Program encodes tile coordinates correctly.
        """
        claim = TectonicClaim(
            tile=(123, -456),
            purpose="GeoASM Test",
            bid=5.0,
            agent_id="test-agent",
        )
        claim_id = negotiator.submit_claim(claim)

        settlement = negotiator.settle(claim_id)

        # Get the program
        program = settlement.to_geoasm()

        # Verify program structure
        assert len(program) == 9  # 1 byte opcode + 2 * 4 bytes for coordinates

        # Parse the program
        opcode, x, y = struct.unpack("<Bii", program)

        # Verify opcode
        assert opcode == TECTONIC_SETTLE_OPCODE
        assert opcode == 0xE2

        # Verify coordinates
        assert x == 123
        assert y == -456

    def test_geoasm_program_structure(self, negotiator):
        """Test GeoASM program with various coordinate values."""
        test_cases = [
            (0, 0),
            (1, 1),
            (-1, -1),
            (1000, 2000),
            (-999, 999),
        ]

        for tile in test_cases:
            claim = TectonicClaim(
                tile=tile,
                purpose="Structure Test",
                bid=1.0,
                agent_id="test",
            )
            claim_id = negotiator.submit_claim(claim)
            settlement = negotiator.settle(claim_id)

            program = settlement.to_geoasm()
            opcode, x, y = struct.unpack("<Bii", program)

            assert opcode == 0xE2
            assert (x, y) == tile, f"Failed for tile {tile}"


# =============================================================================
# Test 5: Timeout Behavior
# =============================================================================

class TestTimeoutBehavior:
    """Test bid window timeout behavior."""

    def test_timeout_behavior(self, negotiator):
        """
        Claim submitted, bid window passes.
        Late bids rejected.
        Settlement auto-triggers after window.
        """
        claim = TectonicClaim(
            tile=(5, 5),
            purpose="Timeout Test",
            bid=10.0,
            agent_id="test-agent",
        )
        claim_id = negotiator.submit_claim(claim)

        # Verify window is open
        assert negotiator.is_bid_window_open(claim_id)

        # Wait for window to close (500ms + buffer)
        time.sleep(BID_WINDOW_SECONDS + 0.1)

        # Verify window is closed
        assert not negotiator.is_bid_window_open(claim_id)

        # Try to submit late bid
        late_bid = TectonicBid(
            claim_id=claim_id,
            amount=20.0,
            agent_id="late-bidder",
        )
        accepted = negotiator.submit_bid(late_bid)

        # Bid should be rejected
        assert accepted is False

        # Settle should still work
        settlement = negotiator.settle(claim_id)
        assert settlement is not None
        assert settlement.winner == "test-agent"

    def test_bid_accepted_just_before_timeout(self, negotiator):
        """Test that bid is accepted if submitted just before timeout."""
        claim = TectonicClaim(
            tile=(7, 7),
            purpose="Edge Timing Test",
            bid=10.0,
            agent_id="test-agent",
        )
        claim_id = negotiator.submit_claim(claim)

        # Wait just under the window
        time.sleep(BID_WINDOW_SECONDS - 0.1)

        # Bid should still be accepted
        bid = TectonicBid(
            claim_id=claim_id,
            amount=15.0,
            agent_id="quick-bidder",
        )
        accepted = negotiator.submit_bid(bid)

        assert accepted is True


# =============================================================================
# Test 6: WebSocket Flow
# =============================================================================

class TestBridgeWebSocketFlow:
    """Test full WebSocket flow through TectonicBridge."""

    @pytest.mark.asyncio
    async def test_bridge_websocket_flow(self, bridge):
        """
        Full flow through TectonicBridge.
        WebSocket notifications work.
        JSON serialization correct.
        """
        # Create mock WebSocket
        ws = MockWebSocket()

        # Subscribe to settlements
        await bridge.handle_subscribe({}, ws)
        assert ws in bridge.subscribers

        # Submit claim
        claim_response = await bridge.handle_claim({
            "tile": [20, 30],
            "purpose": "WebSocket Test",
            "bid": 15.0,
            "agent_id": "ws-agent",
        }, ws)

        assert claim_response["success"] is True
        claim_id = claim_response["claim_id"]

        # Submit counter-bid
        bid_response = await bridge.handle_bid({
            "claim_id": claim_id,
            "amount": 12.0,
            "agent_id": "ws-challenger",
        }, ws)

        assert bid_response["success"] is True
        assert bid_response["accepted"] is True

        # Settle
        settle_response = await bridge.handle_settle({
            "claim_id": claim_id,
        }, ws)

        assert settle_response["success"] is True
        assert "settlement" in settle_response

        # Verify WebSocket received notification
        assert len(ws.messages) == 1
        notification = ws.messages[0]

        assert notification["type"] == "settlement"
        assert "settlement" in notification
        assert notification["settlement"]["winner"] == "ws-agent"
        assert notification["settlement"]["claim"]["tile"] == [20, 30]

    @pytest.mark.asyncio
    async def test_bridge_claim_specific_subscription(self, bridge):
        """Test subscription to specific claim notifications."""
        ws1 = MockWebSocket()
        ws2 = MockWebSocket()

        # Submit claim
        claim_response = await bridge.handle_claim({
            "tile": [1, 1],
            "purpose": "Specific Sub Test",
            "bid": 5.0,
            "agent_id": "agent-1",
        }, ws1)
        claim_id = claim_response["claim_id"]

        # ws2 subscribes to this specific claim
        await bridge.handle_subscribe({"claim_id": claim_id}, ws2)

        # Settle
        await bridge.handle_settle({"claim_id": claim_id}, ws1)

        # ws2 should receive notification
        assert len(ws2.messages) == 1
        assert ws2.messages[0]["type"] == "settlement"

    @pytest.mark.asyncio
    async def test_bridge_json_serialization(self, bridge):
        """Test that all responses are JSON serializable."""
        import json

        ws = MockWebSocket()

        # Test claim response
        claim_response = await bridge.handle_claim({
            "tile": [10, 20],
            "purpose": "JSON Test",
            "bid": 10.0,
            "agent_id": "json-agent",
        }, ws)

        # Should not raise
        json_str = json.dumps(claim_response)
        assert json.loads(json_str) == claim_response

        claim_id = claim_response["claim_id"]

        # Test settle response
        settle_response = await bridge.handle_settle({
            "claim_id": claim_id,
        }, ws)

        json_str = json.dumps(settle_response)
        parsed = json.loads(json_str)

        # Verify program is serialized as list
        assert isinstance(parsed["settlement"]["program"], list)


# =============================================================================
# Test 7: Budget Exhaustion
# =============================================================================

class TestAgentBudgetExhaustion:
    """Test agent budget management edge cases."""

    def test_agent_budget_exhaustion(self, negotiator):
        """
        Agent with limited budget.
        Cannot submit claims beyond budget.
        Budget recovers when claims lose.
        """
        # Create agent with small budget
        agent = TectonicAgent(negotiator=negotiator, spatial_budget=30.0)

        # Submit first claim
        claim_id_1 = agent.submit_claim((1, 1), "First", 15.0)
        assert agent.get_budget_remaining() == 15.0
        assert agent.get_budget_reserved() == 15.0

        # Submit second claim
        claim_id_2 = agent.submit_claim((2, 2), "Second", 10.0)
        assert agent.get_budget_remaining() == 5.0
        assert agent.get_budget_reserved() == 25.0

        # Try to claim beyond budget - should fail
        with pytest.raises(ValueError, match="exceeds available budget"):
            agent.submit_claim((3, 3), "Too Much", 10.0)

        # Budget should be unchanged after failed attempt
        assert agent.get_budget_remaining() == 5.0

        # Lose the first claim (someone else counter-bids)
        challenger = TectonicAgent(negotiator=negotiator, spatial_budget=100.0)
        challenger.counter_bid(claim_id_1, 20.0)

        settlement = negotiator.settle(claim_id_1)
        agent.handle_settlement(settlement)

        # Budget should be released
        assert agent.get_budget_consumed() == 0.0
        assert agent.get_budget_reserved() == 10.0  # Only second claim reserved
        assert agent.get_budget_remaining() == 20.0  # 30 - 0 consumed - 10 reserved

    def test_agent_cannot_counter_bid_without_budget(self, negotiator):
        """Agent cannot submit counter-bid if budget exhausted."""
        agent = TectonicAgent(negotiator=negotiator, spatial_budget=10.0)

        # Use up budget
        agent.submit_claim((1, 1), "Full Budget", 10.0)

        # Someone else claims
        other = TectonicAgent(negotiator=negotiator, spatial_budget=100.0)
        other_claim_id = other.submit_claim((5, 5), "Other Claim", 5.0)

        # Try to counter-bid without budget
        with pytest.raises(ValueError, match="exceeds available budget"):
            agent.counter_bid(other_claim_id, 5.0)


# =============================================================================
# Test 8: Concurrent Claims
# =============================================================================

class TestConcurrentClaimsDifferentTiles:
    """Test multiple agents claiming different tiles."""

    def test_concurrent_claims_different_tiles(self, negotiator, agents):
        """
        Multiple agents claiming different tiles.
        All succeed without conflict.
        Independent settlements.
        """
        agent_a, agent_b, agent_c = agents

        # Each agent claims a different tile
        claim_a = agent_a.submit_claim((1, 1), "Tile A", 10.0)
        claim_b = agent_b.submit_claim((2, 2), "Tile B", 15.0)
        claim_c = agent_c.submit_claim((3, 3), "Tile C", 20.0)

        # All claims should be pending
        assert len(negotiator.get_pending_claims()) == 3

        # Settle all
        settlement_a = negotiator.settle(claim_a)
        settlement_b = negotiator.settle(claim_b)
        settlement_c = negotiator.settle(claim_c)

        # Each agent should win their own claim
        assert settlement_a.winner == agent_a.agent_id
        assert settlement_b.winner == agent_b.agent_id
        assert settlement_c.winner == agent_c.agent_id

        # Verify different tiles
        assert settlement_a.claim.tile == (1, 1)
        assert settlement_b.claim.tile == (2, 2)
        assert settlement_c.claim.tile == (3, 3)

    def test_same_agent_multiple_claims(self, negotiator):
        """Single agent can have multiple pending claims."""
        agent = TectonicAgent(negotiator=negotiator, spatial_budget=100.0)

        # Submit multiple claims
        claim_ids = []
        for i in range(5):
            claim_id = agent.submit_claim((i, i), f"Claim {i}", 10.0)
            claim_ids.append(claim_id)

        assert len(agent.pending_claims) == 5
        assert agent.get_budget_reserved() == 50.0

        # Settle all
        for claim_id in claim_ids:
            settlement = negotiator.settle(claim_id)
            agent.handle_settlement(settlement)

        assert len(agent.won_claims) == 5
        assert agent.get_budget_consumed() == 50.0


# =============================================================================
# Test 9: Settlement History
# =============================================================================

class TestSettlementHistory:
    """Test settlement history tracking."""

    def test_settlement_history(self, negotiator, agents):
        """
        Negotiator tracks all settlements.
        Can query history.
        History persists correctly.
        """
        agent_a, agent_b, agent_c = agents

        # Create and settle multiple claims
        claim_1 = agent_a.submit_claim((1, 1), "History 1", 10.0)
        agent_b.counter_bid(claim_1, 5.0)
        settlement_1 = negotiator.settle(claim_1)

        claim_2 = agent_b.submit_claim((2, 2), "History 2", 20.0)
        settlement_2 = negotiator.settle(claim_2)

        claim_3 = agent_c.submit_claim((3, 3), "History 3", 15.0)
        agent_a.counter_bid(claim_3, 25.0)
        settlement_3 = negotiator.settle(claim_3)

        # Get history
        history = negotiator.get_settlement_history()

        assert len(history) == 3
        assert settlement_1 in history
        assert settlement_2 in history
        assert settlement_3 in history

    def test_settlements_by_winner(self, negotiator, agents):
        """Can query settlements by winner."""
        agent_a, agent_b, _ = agents

        # Agent A wins two claims
        claim_1 = agent_a.submit_claim((1, 1), "A Win 1", 50.0)
        negotiator.settle(claim_1)

        claim_2 = agent_a.submit_claim((2, 2), "A Win 2", 50.0)
        negotiator.settle(claim_2)

        # Agent B wins one claim
        claim_3 = agent_b.submit_claim((3, 3), "B Win", 50.0)
        negotiator.settle(claim_3)

        # Query by winner
        a_wins = negotiator.get_settlements_by_winner(agent_a.agent_id)
        b_wins = negotiator.get_settlements_by_winner(agent_b.agent_id)

        assert len(a_wins) == 2
        assert len(b_wins) == 1

    def test_negotiator_statistics(self, negotiator, agents):
        """Negotiator provides useful statistics."""
        agent_a, agent_b, _ = agents

        # Create some settlements
        claim_1 = agent_a.submit_claim((1, 1), "Stat 1", 10.0)
        negotiator.settle(claim_1)

        claim_2 = agent_b.submit_claim((2, 2), "Stat 2", 15.0)
        negotiator.settle(claim_2)

        stats = negotiator.get_statistics()

        assert stats["total_settlements"] == 2
        assert stats["pending_claims"] == 0
        assert stats["wins_by_agent"][agent_a.agent_id] == 1
        assert stats["wins_by_agent"][agent_b.agent_id] == 1


# =============================================================================
# Test 10: Error Recovery
# =============================================================================

class TestErrorRecovery:
    """Test error handling and recovery."""

    def test_invalid_claim_id_for_settlement(self, negotiator):
        """Settling non-existent claim raises KeyError."""
        with pytest.raises(KeyError, match="not found"):
            negotiator.settle("non-existent-claim-id")

    def test_agent_not_found_handling(self, negotiator):
        """Operations gracefully handle unknown agents."""
        # This is more about ensuring no crash when looking up
        # claims for non-existent agent
        claims = negotiator.get_claims_by_agent("unknown-agent-id")
        assert claims == []

        settlements = negotiator.get_settlements_by_winner("unknown-agent-id")
        assert settlements == []

    def test_malformed_claim_request(self, bridge):
        """Malformed claim requests handled gracefully."""
        import asyncio

        # Missing fields
        response = asyncio.run(bridge.handle_claim({
            "tile": [1, 2],
            # Missing purpose, bid, agent_id
        }, None))

        assert response["success"] is False
        assert "Missing required fields" in response["error"]

    def test_malformed_bid_request(self, bridge):
        """Malformed bid requests handled gracefully."""
        import asyncio

        response = asyncio.run(bridge.handle_bid({
            "claim_id": "some-id",
            # Missing amount, agent_id
        }, None))

        assert response["success"] is False
        assert "Missing required fields" in response["error"]

    def test_malformed_settle_request(self, bridge):
        """Malformed settle requests handled gracefully."""
        import asyncio

        response = asyncio.run(bridge.handle_settle({
            # Missing claim_id
        }, None))

        assert response["success"] is False
        assert "Missing required field" in response["error"]

    def test_bid_on_nonexistent_claim(self, negotiator):
        """Bidding on non-existent claim returns False."""
        bid = TectonicBid(
            claim_id="non-existent-claim",
            amount=10.0,
            agent_id="test-agent",
        )

        accepted = negotiator.submit_bid(bid)
        assert accepted is False

    def test_bridge_settle_nonexistent_claim(self, bridge):
        """Settling non-existent claim through bridge returns error."""
        import asyncio

        response = asyncio.run(bridge.handle_settle({
            "claim_id": "non-existent",
        }, None))

        assert response["success"] is False
        assert "not found" in response["error"]

    def test_invalid_claim_tile(self):
        """Claim with invalid tile raises ValueError."""
        with pytest.raises(ValueError, match="tile must be a tuple"):
            TectonicClaim(
                tile="not-a-tuple",  # Invalid
                purpose="Test",
                bid=10.0,
                agent_id="test",
            )

    def test_invalid_claim_status(self):
        """Claim with invalid status raises ValueError."""
        with pytest.raises(ValueError, match="status must be a ClaimStatus"):
            TectonicClaim(
                tile=(1, 1),
                purpose="Test",
                bid=10.0,
                agent_id="test",
                status="invalid-status",  # Invalid
            )

    def test_bid_type_validation(self, negotiator):
        """Non-TectonicBid object raises ValueError."""
        with pytest.raises(ValueError, match="must be a TectonicBid"):
            negotiator.submit_bid("not-a-bid")

    def test_claim_type_validation(self, negotiator):
        """Non-TectonicClaim object raises ValueError."""
        with pytest.raises(ValueError, match="must be a TectonicClaim"):
            negotiator.submit_claim("not-a-claim")


# =============================================================================
# Additional Edge Case Tests
# =============================================================================

class TestEdgeCases:
    """Additional edge case tests."""

    def test_zero_bid(self, negotiator):
        """Claim with zero bid is allowed."""
        claim = TectonicClaim(
            tile=(1, 1),
            purpose="Zero Bid",
            bid=0.0,
            agent_id="test",
        )
        claim_id = negotiator.submit_claim(claim)
        settlement = negotiator.settle(claim_id)

        # With zero bid, claimant still wins (no counter-bids)
        assert settlement.winner == "test"

    def test_negative_coordinates(self, negotiator):
        """Claims with negative coordinates work correctly."""
        claim = TectonicClaim(
            tile=(-100, -200),
            purpose="Negative Coords",
            bid=10.0,
            agent_id="test",
        )
        claim_id = negotiator.submit_claim(claim)
        settlement = negotiator.settle(claim_id)

        assert settlement.claim.tile == (-100, -200)

        # Verify GeoASM encodes negative correctly
        program = settlement.to_geoasm()
        _, x, y = struct.unpack("<Bii", program)
        assert x == -100
        assert y == -200

    def test_large_coordinates(self, negotiator):
        """Claims with large coordinates work correctly."""
        large_x = 1000000
        large_y = -1000000

        claim = TectonicClaim(
            tile=(large_x, large_y),
            purpose="Large Coords",
            bid=10.0,
            agent_id="test",
        )
        claim_id = negotiator.submit_claim(claim)
        settlement = negotiator.settle(claim_id)

        program = settlement.to_geoasm()
        _, x, y = struct.unpack("<Bii", program)
        assert x == large_x
        assert y == large_y

    def test_agent_statistics(self, negotiator):
        """Agent provides comprehensive statistics."""
        agent = TectonicAgent(negotiator=negotiator, spatial_budget=50.0)

        # Initial stats
        stats = agent.get_statistics()
        assert stats["total_budget"] == 50.0
        assert stats["budget_remaining"] == 50.0
        assert stats["pending_claims"] == 0
        assert stats["won_claims"] == 0
        assert stats["win_rate"] == 0.0

        # Submit and win a claim
        claim_id = agent.submit_claim((1, 1), "Test", 10.0)
        settlement = negotiator.settle(claim_id)
        agent.handle_settlement(settlement)

        stats = agent.get_statistics()
        assert stats["budget_consumed"] == 10.0
        assert stats["won_claims"] == 1
        assert stats["win_rate"] == 1.0

    def test_agent_repr(self, negotiator):
        """Agent has useful string representation."""
        agent = TectonicAgent(
            negotiator=negotiator,
            agent_id="test-agent-123",
            spatial_budget=100.0
        )

        repr_str = repr(agent)
        assert "test-agent-123" in repr_str
        assert "100.00" in repr_str

    def test_unsubscribe(self, bridge):
        """Unsubscribing removes WebSocket from all subscriptions."""
        import asyncio

        ws = MockWebSocket()

        # Subscribe
        asyncio.run(bridge.handle_subscribe({}, ws))
        assert ws in bridge.subscribers

        # Unsubscribe
        bridge.handle_unsubscribe(ws)
        assert ws not in bridge.subscribers


# =============================================================================
# Run Tests
# =============================================================================

if __name__ == "__main__":
    pytest.main([__file__, "-v"])
