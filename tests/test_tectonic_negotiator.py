"""
Tests for TectonicNegotiator - 3-phase auction negotiation engine.

Task 2.1 of Tectonic Realignment Plan.
"""

import asyncio
import math
import pytest
import time
from unittest.mock import MagicMock

from systems.tectonic.claim import (
    TectonicClaim,
    TectonicBid,
    TectonicSettlement,
    ClaimStatus,
)
from systems.tectonic.negotiator import (
    TectonicNegotiator,
    PendingClaim,
    BID_WINDOW_SECONDS,
    DEFAULT_SEMANTIC_WEIGHT,
    DEFAULT_COMPETING_WEIGHT,
    DEFAULT_ANCHOR_CONSTANT,
)


class TestTectonicNegotiator:
    """Test suite for TectonicNegotiator."""

    def test_claim_submission_and_id_generation(self):
        """Test that claims are submitted and get unique IDs."""
        negotiator = TectonicNegotiator()

        claim = TectonicClaim(
            tile=(10, 20),
            purpose="build_shelter",
            bid=100.0,
            agent_id="agent_1",
        )

        claim_id = negotiator.submit_claim(claim)

        # Claim ID should be returned
        assert claim_id is not None
        assert claim_id == claim.claim_id

        # Claim should be in pending
        pending = negotiator.get_pending_claims()
        assert claim_id in pending
        assert pending[claim_id].tile == (10, 20)
        assert pending[claim_id].purpose == "build_shelter"

    def test_claim_id_is_unique(self):
        """Test that different claims get different IDs."""
        negotiator = TectonicNegotiator()

        claim1 = TectonicClaim(
            tile=(10, 20),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim2 = TectonicClaim(
            tile=(30, 40),
            purpose="build",
            bid=200.0,
            agent_id="agent_2",
        )

        id1 = negotiator.submit_claim(claim1)
        id2 = negotiator.submit_claim(claim2)

        assert id1 != id2

    def test_bid_submission_within_window(self):
        """Test that bids submitted within the window are accepted."""
        negotiator = TectonicNegotiator()

        claim = TectonicClaim(
            tile=(10, 20),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        # Submit bid immediately (within window)
        bid = TectonicBid(
            claim_id=claim_id,
            amount=150.0,
            agent_id="agent_2",
        )

        result = negotiator.submit_bid(bid)

        assert result is True
        bids = negotiator.get_bids_for_claim(claim_id)
        assert len(bids) == 1
        assert bids[0].amount == 150.0

    @pytest.mark.asyncio
    async def test_bid_rejection_after_window(self):
        """Test that bids submitted after the window are rejected."""
        negotiator = TectonicNegotiator()

        claim = TectonicClaim(
            tile=(10, 20),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        # Wait for bid window to expire
        await asyncio.sleep(BID_WINDOW_SECONDS + 0.1)

        # Submit bid after window
        bid = TectonicBid(
            claim_id=claim_id,
            amount=150.0,
            agent_id="agent_2",
        )

        result = negotiator.submit_bid(bid)

        assert result is False
        bids = negotiator.get_bids_for_claim(claim_id)
        assert len(bids) == 0

    def test_force_calculation_matches_formula(self):
        """Test that force calculation follows the expected formula."""
        # Use specific weights for predictable testing
        negotiator = TectonicNegotiator(
            semantic_weight=1.0,
            competing_weight=0.8,
            anchor_constant=0.1,
        )

        # Create claim at tile (30, 40) - distance = 50
        claim = TectonicClaim(
            tile=(30, 40),  # sqrt(30^2 + 40^2) = 50
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        # Add a counter-bid of 50
        bid = TectonicBid(
            claim_id=claim_id,
            amount=50.0,
            agent_id="agent_2",
        )
        negotiator.submit_bid(bid)

        # Calculate expected forces:
        # F_claim = 100.0 * 1.0 = 100.0
        # F_counter = 50.0 * 0.8 = 40.0
        # F_anchor = 50.0 * 0.1 = 5.0

        f_claim, f_counter, f_anchor = negotiator._calculate_force(claim)

        assert f_claim == pytest.approx(100.0)
        assert f_counter == pytest.approx(40.0)
        assert f_anchor == pytest.approx(5.0)

    def test_settlement_uncontested_claim(self):
        """Test settlement for an uncontested claim (no counter-bids)."""
        negotiator = TectonicNegotiator()

        # Claim at origin - no anchor penalty
        claim = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        settlement = negotiator.settle(claim_id)

        # Uncontested claim at origin should win
        assert settlement.winner == "agent_1"
        assert settlement.force == pytest.approx(100.0)
        assert settlement.claim.status == ClaimStatus.APPROVED

    def test_settlement_contested_claim(self):
        """Test settlement for a contested claim."""
        negotiator = TectonicNegotiator()

        # Claim at origin
        claim = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        # Counter-bid that overpowers original claim
        # For claimant to lose: F_counter > F_claim
        # 50 * 0.8 = 40, which is < 100, so claimant wins
        # Let's use 200: 200 * 0.8 = 160 > 100
        bid = TectonicBid(
            claim_id=claim_id,
            amount=200.0,
            agent_id="agent_2",
        )
        negotiator.submit_bid(bid)

        settlement = negotiator.settle(claim_id)

        # Counter-bidder should win (F_counter = 160 > F_claim = 100)
        assert settlement.winner == "agent_2"
        assert settlement.claim.status == ClaimStatus.REJECTED

    def test_settlement_generates_geoasm_program(self):
        """Test that settlement generates a valid GeoASM program."""
        negotiator = TectonicNegotiator()

        claim = TectonicClaim(
            tile=(10, 20),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        settlement = negotiator.settle(claim_id)

        # Check program is bytes
        assert isinstance(settlement.program, bytes)
        assert len(settlement.program) == 9  # 1 byte opcode + 4 + 4 bytes

        # Check first byte is opcode
        assert settlement.program[0] == 0xE2

        # to_geoasm should return the same program
        assert settlement.to_geoasm() == settlement.program

    def test_multiple_concurrent_claims(self):
        """Test handling multiple concurrent claims."""
        negotiator = TectonicNegotiator()

        claim1 = TectonicClaim(
            tile=(10, 10),
            purpose="build_a",
            bid=100.0,
            agent_id="agent_1",
        )
        claim2 = TectonicClaim(
            tile=(20, 20),
            purpose="build_b",
            bid=200.0,
            agent_id="agent_2",
        )
        claim3 = TectonicClaim(
            tile=(30, 30),
            purpose="build_c",
            bid=300.0,
            agent_id="agent_3",
        )

        id1 = negotiator.submit_claim(claim1)
        id2 = negotiator.submit_claim(claim2)
        id3 = negotiator.submit_claim(claim3)

        pending = negotiator.get_pending_claims()
        assert len(pending) == 3

        # All should be independent
        assert id1 in pending
        assert id2 in pending
        assert id3 in pending

    @pytest.mark.asyncio
    async def test_bid_window_timing(self):
        """Test precise bid window timing."""
        negotiator = TectonicNegotiator()

        claim = TectonicClaim(
            tile=(10, 10),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        # Window should be open initially
        assert negotiator.is_bid_window_open(claim_id) is True

        # Wait just under window
        await asyncio.sleep(BID_WINDOW_SECONDS - 0.1)
        assert negotiator.is_bid_window_open(claim_id) is True

        # Wait for window to close
        await asyncio.sleep(0.2)
        assert negotiator.is_bid_window_open(claim_id) is False

    def test_settlement_history_tracking(self):
        """Test that settlement history is tracked correctly."""
        negotiator = TectonicNegotiator()

        # Create and settle multiple claims
        claim1 = TectonicClaim(
            tile=(10, 10),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim2 = TectonicClaim(
            tile=(20, 20),
            purpose="build",
            bid=200.0,
            agent_id="agent_2",
        )

        id1 = negotiator.submit_claim(claim1)
        id2 = negotiator.submit_claim(claim2)

        negotiator.settle(id1)
        negotiator.settle(id2)

        history = negotiator.get_settlement_history()
        assert len(history) == 2

        # Check settlements are in order
        assert history[0].claim.claim_id == id1
        assert history[1].claim.claim_id == id2

    def test_get_settlements_by_winner(self):
        """Test filtering settlements by winner."""
        negotiator = TectonicNegotiator()

        # Create claims for different agents
        claim1 = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim2 = TectonicClaim(
            tile=(1, 1),
            purpose="build",
            bid=200.0,
            agent_id="agent_2",
        )

        id1 = negotiator.submit_claim(claim1)
        id2 = negotiator.submit_claim(claim2)

        negotiator.settle(id1)
        negotiator.settle(id2)

        agent1_wins = negotiator.get_settlements_by_winner("agent_1")
        agent2_wins = negotiator.get_settlements_by_winner("agent_2")

        assert len(agent1_wins) == 1
        assert len(agent2_wins) == 1

    def test_statistics(self):
        """Test negotiator statistics."""
        negotiator = TectonicNegotiator()

        claim = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)
        negotiator.settle(claim_id)

        stats = negotiator.get_statistics()

        assert stats["pending_claims"] == 0
        assert stats["total_settlements"] == 1
        assert stats["wins_by_agent"]["agent_1"] == 1
        assert stats["semantic_weight"] == DEFAULT_SEMANTIC_WEIGHT

    def test_invalid_claim_raises_error(self):
        """Test that invalid claim raises ValueError."""
        negotiator = TectonicNegotiator()

        with pytest.raises(ValueError):
            negotiator.submit_claim("not a claim")

    def test_invalid_bid_raises_error(self):
        """Test that invalid bid raises ValueError."""
        negotiator = TectonicNegotiator()

        with pytest.raises(ValueError):
            negotiator.submit_bid("not a bid")

    def test_settle_nonexistent_claim_raises_error(self):
        """Test that settling nonexistent claim raises KeyError."""
        negotiator = TectonicNegotiator()

        with pytest.raises(KeyError):
            negotiator.settle("nonexistent_claim_id")

    def test_bid_on_nonexistent_claim_rejected(self):
        """Test that bid on nonexistent claim is rejected."""
        negotiator = TectonicNegotiator()

        bid = TectonicBid(
            claim_id="nonexistent",
            amount=100.0,
            agent_id="agent_1",
        )

        result = negotiator.submit_bid(bid)
        assert result is False

    def test_anchor_force_with_distance(self):
        """Test that anchor force increases with distance from origin."""
        negotiator = TectonicNegotiator(anchor_constant=0.1)

        # Claim at origin - no anchor
        claim_origin = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        id_origin = negotiator.submit_claim(claim_origin)

        # Claim at (100, 0) - distance 100
        claim_far = TectonicClaim(
            tile=(100, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_2",
        )
        id_far = negotiator.submit_claim(claim_far)

        _, _, anchor_origin = negotiator._calculate_force(claim_origin)
        _, _, anchor_far = negotiator._calculate_force(claim_far)

        assert anchor_origin == 0.0
        assert anchor_far == pytest.approx(10.0)  # 100 * 0.1

    def test_claimant_wins_when_force_exceeds_counter_plus_anchor(self):
        """Test claimant wins when F_claim > F_counter + F_anchor."""
        negotiator = TectonicNegotiator(
            semantic_weight=1.0,
            competing_weight=0.8,
            anchor_constant=0.1,
        )

        # Claim at (0, 0) with bid 100 -> F_claim = 100
        # Counter-bid 50 -> F_counter = 40
        # Anchor = 0
        # 100 > 40 + 0, so claimant wins
        claim = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        bid = TectonicBid(
            claim_id=claim_id,
            amount=50.0,
            agent_id="agent_2",
        )
        negotiator.submit_bid(bid)

        settlement = negotiator.settle(claim_id)
        assert settlement.winner == "agent_1"

    def test_claimant_loses_when_force_less_than_counter_plus_anchor(self):
        """Test claimant loses when F_claim <= F_counter + F_anchor."""
        negotiator = TectonicNegotiator(
            semantic_weight=1.0,
            competing_weight=0.8,
            anchor_constant=0.1,
        )

        # Claim at (0, 0) with bid 50 -> F_claim = 50
        # Counter-bid 100 -> F_counter = 80
        # Anchor = 0
        # 50 <= 80 + 0, so claimant loses
        claim = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=50.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        bid = TectonicBid(
            claim_id=claim_id,
            amount=100.0,
            agent_id="agent_2",
        )
        negotiator.submit_bid(bid)

        settlement = negotiator.settle(claim_id)
        assert settlement.winner == "agent_2"

    @pytest.mark.asyncio
    async def test_settle_all_pending(self):
        """Test settling all pending claims at once."""
        negotiator = TectonicNegotiator()

        claim1 = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim2 = TectonicClaim(
            tile=(1, 1),
            purpose="build",
            bid=200.0,
            agent_id="agent_2",
        )

        negotiator.submit_claim(claim1)
        negotiator.submit_claim(claim2)

        settlements = await negotiator.settle_all_pending()

        assert len(settlements) == 2
        assert len(negotiator.get_pending_claims()) == 0


class TestPendingClaim:
    """Tests for PendingClaim dataclass."""

    def test_pending_claim_creation(self):
        """Test creating a pending claim."""
        claim = TectonicClaim(
            tile=(10, 20),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )

        pending = PendingClaim(claim=claim)

        assert pending.claim == claim
        assert pending.bids == []
        assert pending.submitted_at > 0


class TestForceCalculation:
    """Detailed tests for force calculation."""

    def test_semantic_weight_affects_claim_force(self):
        """Test that semantic_weight affects F_claim."""
        negotiator = TectonicNegotiator(semantic_weight=2.0)

        claim = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        f_claim, _, _ = negotiator._calculate_force(claim)

        # 100 * 2.0 = 200
        assert f_claim == pytest.approx(200.0)

    def test_competing_weight_affects_counter_force(self):
        """Test that competing_weight affects F_counter."""
        negotiator = TectonicNegotiator(competing_weight=0.5)

        claim = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        bid = TectonicBid(
            claim_id=claim_id,
            amount=100.0,
            agent_id="agent_2",
        )
        negotiator.submit_bid(bid)

        _, f_counter, _ = negotiator._calculate_force(claim)

        # 100 * 0.5 = 50
        assert f_counter == pytest.approx(50.0)

    def test_multiple_counter_bids_summed(self):
        """Test that multiple counter-bids are summed."""
        negotiator = TectonicNegotiator(competing_weight=1.0)

        claim = TectonicClaim(
            tile=(0, 0),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        claim_id = negotiator.submit_claim(claim)

        # Multiple bids
        for i in range(3):
            bid = TectonicBid(
                claim_id=claim_id,
                amount=50.0,
                agent_id=f"agent_{i}",
            )
            negotiator.submit_bid(bid)

        _, f_counter, _ = negotiator._calculate_force(claim)

        # 50 * 3 * 1.0 = 150
        assert f_counter == pytest.approx(150.0)

    def test_anchor_force_diagonal_distance(self):
        """Test anchor force for diagonal tiles."""
        negotiator = TectonicNegotiator(anchor_constant=0.1)

        # Tile (3, 4) - distance = 5
        claim = TectonicClaim(
            tile=(3, 4),
            purpose="build",
            bid=100.0,
            agent_id="agent_1",
        )
        negotiator.submit_claim(claim)

        _, _, f_anchor = negotiator._calculate_force(claim)

        # sqrt(9 + 16) * 0.1 = 5 * 0.1 = 0.5
        assert f_anchor == pytest.approx(0.5)
