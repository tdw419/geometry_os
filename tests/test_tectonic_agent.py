"""
Tests for TectonicAgent base class.

Task 3.1 of Tectonic Realignment Plan.

Tests cover:
- Agent creation with budget
- Submit claim creates TectonicClaim correctly
- Submit claim respects budget limits
- Counter bid works through negotiator
- Handle settlement updates won_claims
- Budget tracking accurate
- Can afford calculation
- Multiple claims from same agent
- Settlement callback triggers correctly
- Pending claims tracking
- Budget consumed on win, released on loss
- Agent ID uniqueness
"""


import pytest

from systems.tectonic.agent import BudgetTracker, TectonicAgent
from systems.tectonic.claim import (
    ClaimStatus,
)
from systems.tectonic.negotiator import TectonicNegotiator
from systems.tectonic.strategy import StrategyProfile, StrategyType


class TestBudgetTracker:
    """Tests for BudgetTracker helper class."""

    def test_budget_tracker_initial_state(self):
        """BudgetTracker should start with correct initial state."""
        tracker = BudgetTracker(total_budget=100.0)
        assert tracker.total_budget == 100.0
        assert tracker.reserved == 0.0
        assert tracker.consumed == 0.0

    def test_budget_tracker_can_afford(self):
        """can_afford should return True for amounts within budget."""
        tracker = BudgetTracker(total_budget=100.0)
        assert tracker.can_afford(50.0) is True
        assert tracker.can_afford(100.0) is True
        assert tracker.can_afford(100.1) is False

    def test_budget_tracker_reserve(self):
        """reserve should correctly reserve budget."""
        tracker = BudgetTracker(total_budget=100.0)
        assert tracker.reserve(30.0) is True
        assert tracker.reserved == 30.0
        assert tracker.can_afford(70.0) is True
        assert tracker.can_afford(71.0) is False

    def test_budget_tracker_reserve_insufficient(self):
        """reserve should fail for insufficient budget."""
        tracker = BudgetTracker(total_budget=50.0)
        assert tracker.reserve(60.0) is False
        assert tracker.reserved == 0.0

    def test_budget_tracker_consume(self):
        """consume should move reserved to consumed."""
        tracker = BudgetTracker(total_budget=100.0)
        tracker.reserve(30.0)
        assert tracker.consume(30.0) is True
        assert tracker.reserved == 0.0
        assert tracker.consumed == 30.0

    def test_budget_tracker_release(self):
        """release should free reserved budget."""
        tracker = BudgetTracker(total_budget=100.0)
        tracker.reserve(30.0)
        assert tracker.release(30.0) is True
        assert tracker.reserved == 0.0
        assert tracker.can_afford(100.0) is True


class TestTectonicAgentCreation:
    """Tests for TectonicAgent creation and initialization."""

    def test_agent_creation_with_budget(self):
        """Agent should be created with specified budget."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, spatial_budget=500.0)

        assert agent.spatial_budget == 500.0
        assert agent.get_budget_remaining() == 500.0
        assert agent.get_budget_consumed() == 0.0
        assert agent.get_budget_reserved() == 0.0

    def test_agent_id_auto_generated(self):
        """Agent ID should be auto-generated as UUID if not provided."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator)

        assert agent.agent_id is not None
        assert len(agent.agent_id) == 36  # UUID format
        assert "-" in agent.agent_id

    def test_agent_id_custom(self):
        """Agent ID should use provided value."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="custom_agent_001")

        assert agent.agent_id == "custom_agent_001"

    def test_agent_id_uniqueness(self):
        """Multiple agents should have unique IDs."""
        negotiator = TectonicNegotiator()
        agent1 = TectonicAgent(negotiator)
        agent2 = TectonicAgent(negotiator)
        agent3 = TectonicAgent(negotiator)

        assert agent1.agent_id != agent2.agent_id
        assert agent2.agent_id != agent3.agent_id
        assert agent1.agent_id != agent3.agent_id


class TestTectonicAgentClaims:
    """Tests for claim submission and tracking."""

    def test_submit_claim_creates_tectonic_claim_correctly(self):
        """submit_claim should create a valid TectonicClaim."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="test_agent", spatial_budget=100.0)

        claim_id = agent.submit_claim(
            tile=(10, 20),
            purpose="Build structure",
            bid=25.0
        )

        # Verify claim was created correctly
        assert claim_id is not None
        pending = agent.pending_claims
        assert claim_id in pending

        claim = pending[claim_id]
        assert claim.tile == (10, 20)
        assert claim.purpose == "Build structure"
        assert claim.bid == 25.0
        assert claim.agent_id == "test_agent"
        assert claim.status == ClaimStatus.PENDING

    def test_submit_claim_respects_budget_limits(self):
        """submit_claim should reject bids exceeding budget."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, spatial_budget=50.0)

        # Should succeed
        agent.submit_claim(tile=(0, 0), purpose="Claim 1", bid=30.0)

        # Should fail - exceeds remaining budget
        with pytest.raises(ValueError, match="exceeds available budget"):
            agent.submit_claim(tile=(1, 1), purpose="Claim 2", bid=30.0)

    def test_submit_claim_reserves_budget(self):
        """submit_claim should reserve budget for the bid."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, spatial_budget=100.0)

        agent.submit_claim(tile=(0, 0), purpose="Test", bid=40.0)

        assert agent.get_budget_reserved() == 40.0
        assert agent.get_budget_remaining() == 60.0

    def test_multiple_claims_from_same_agent(self):
        """Agent should be able to submit multiple claims within budget."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, spatial_budget=100.0)

        claim_id1 = agent.submit_claim(tile=(0, 0), purpose="Claim 1", bid=30.0)
        claim_id2 = agent.submit_claim(tile=(1, 1), purpose="Claim 2", bid=25.0)
        claim_id3 = agent.submit_claim(tile=(2, 2), purpose="Claim 3", bid=20.0)

        assert len(agent.pending_claims) == 3
        assert claim_id1 in agent.pending_claims
        assert claim_id2 in agent.pending_claims
        assert claim_id3 in agent.pending_claims

        # Remaining budget should be 100 - 30 - 25 - 20 = 25
        assert agent.get_budget_remaining() == 25.0
        assert agent.get_budget_reserved() == 75.0


class TestTectonicAgentCounterBid:
    """Tests for counter-bid functionality."""

    def test_counter_bid_works_through_negotiator(self):
        """counter_bid should submit bid through negotiator."""
        negotiator = TectonicNegotiator()
        agent1 = TectonicAgent(negotiator, agent_id="agent1", spatial_budget=100.0)
        agent2 = TectonicAgent(negotiator, agent_id="agent2", spatial_budget=100.0)

        # Agent 1 submits claim
        claim_id = agent1.submit_claim(tile=(5, 5), purpose="Test", bid=20.0)

        # Agent 2 counters
        result = agent2.counter_bid(claim_id, 30.0)

        assert result is True
        assert agent2.get_budget_reserved() == 30.0

        # Verify bid was recorded in negotiator
        bids = negotiator.get_bids_for_claim(claim_id)
        assert len(bids) == 1
        assert bids[0].amount == 30.0
        assert bids[0].agent_id == "agent2"

    def test_counter_bid_respects_budget(self):
        """counter_bid should reject bids exceeding budget."""
        negotiator = TectonicNegotiator()
        agent1 = TectonicAgent(negotiator, agent_id="agent1", spatial_budget=100.0)
        agent2 = TectonicAgent(negotiator, agent_id="agent2", spatial_budget=10.0)

        claim_id = agent1.submit_claim(tile=(0, 0), purpose="Test", bid=5.0)

        with pytest.raises(ValueError, match="exceeds available budget"):
            agent2.counter_bid(claim_id, 50.0)


class TestTectonicAgentSettlement:
    """Tests for settlement handling."""

    def test_handle_settlement_updates_won_claims(self):
        """handle_settlement should add to won_claims when agent wins."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="test_agent", spatial_budget=100.0)

        # Submit claim
        claim_id = agent.submit_claim(tile=(0, 0), purpose="Test", bid=50.0)

        # Settle the claim (agent should win with high bid at origin)
        settlement = negotiator.settle(claim_id)

        # Handle settlement
        agent.handle_settlement(settlement)

        assert len(agent.won_claims) == 1
        assert len(agent.lost_claims) == 0
        assert settlement in agent.won_claims

    def test_handle_settlement_budget_consumed_on_win(self):
        """Budget should be consumed when claim wins."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="test_agent", spatial_budget=100.0)

        claim_id = agent.submit_claim(tile=(0, 0), purpose="Test", bid=40.0)
        assert agent.get_budget_reserved() == 40.0

        settlement = negotiator.settle(claim_id)
        agent.handle_settlement(settlement)

        # Budget should move from reserved to consumed
        assert agent.get_budget_reserved() == 0.0
        assert agent.get_budget_consumed() == 40.0
        assert agent.get_budget_remaining() == 60.0

    def test_handle_settlement_budget_released_on_loss(self):
        """Budget should be released when claim loses."""
        negotiator = TectonicNegotiator(
            semantic_weight=0.1,  # Low claim weight
            competing_weight=10.0  # High counter weight
        )
        agent1 = TectonicAgent(negotiator, agent_id="agent1", spatial_budget=100.0)
        agent2 = TectonicAgent(negotiator, agent_id="agent2", spatial_budget=100.0)

        # Agent 1 submits claim with low bid
        claim_id = agent1.submit_claim(tile=(100, 100), purpose="Test", bid=1.0)
        assert agent1.get_budget_reserved() == 1.0

        # Agent 2 counters with high bid
        agent2.counter_bid(claim_id, 50.0)

        # Settle - agent 2 should win
        settlement = negotiator.settle(claim_id)

        # Agent 1 handles settlement (they lost)
        agent1.handle_settlement(settlement)

        # Budget should be released back
        assert agent1.get_budget_reserved() == 0.0
        assert agent1.get_budget_consumed() == 0.0
        assert agent1.get_budget_remaining() == 100.0
        assert len(agent1.lost_claims) == 1

    def test_settlement_callback_triggers_correctly(self):
        """Registered callbacks should be triggered on settlement."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="test_agent", spatial_budget=100.0)

        callback_results = []

        def my_callback(settlement):
            callback_results.append(settlement)

        agent.on_settlement(my_callback)

        claim_id = agent.submit_claim(tile=(0, 0), purpose="Test", bid=10.0)
        settlement = negotiator.settle(claim_id)
        agent.handle_settlement(settlement)

        assert len(callback_results) == 1
        assert callback_results[0] == settlement

    def test_pending_claims_tracking(self):
        """pending_claims should accurately track submitted claims."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, spatial_budget=100.0)

        claim_id1 = agent.submit_claim(tile=(0, 0), purpose="Test 1", bid=10.0)
        claim_id2 = agent.submit_claim(tile=(1, 1), purpose="Test 2", bid=20.0)

        assert len(agent.pending_claims) == 2

        # Settle one claim
        settlement = negotiator.settle(claim_id1)
        agent.handle_settlement(settlement)

        assert len(agent.pending_claims) == 1
        assert claim_id1 not in agent.pending_claims
        assert claim_id2 in agent.pending_claims


class TestTectonicAgentBudgetTracking:
    """Tests for budget tracking accuracy."""

    def test_can_afford_calculation(self):
        """can_afford should correctly calculate available budget."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, spatial_budget=100.0)

        assert agent.can_afford(100.0) is True
        assert agent.can_afford(100.1) is False

        # Submit claim
        agent.submit_claim(tile=(0, 0), purpose="Test", bid=30.0)

        assert agent.can_afford(70.0) is True
        assert agent.can_afford(71.0) is False

    def test_budget_tracking_across_multiple_operations(self):
        """Budget should be tracked accurately across win/lose scenarios."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="test_agent", spatial_budget=100.0)

        # Submit multiple claims
        claim_id1 = agent.submit_claim(tile=(0, 0), purpose="Win", bid=20.0)
        claim_id2 = agent.submit_claim(tile=(0, 0), purpose="Lose", bid=30.0)

        # Initial state
        assert agent.get_budget_reserved() == 50.0
        assert agent.get_budget_remaining() == 50.0

        # Win first claim
        settlement1 = negotiator.settle(claim_id1)
        agent.handle_settlement(settlement1)

        assert agent.get_budget_consumed() == 20.0
        assert agent.get_budget_reserved() == 30.0
        assert agent.get_budget_remaining() == 50.0

    def test_get_statistics(self):
        """get_statistics should return accurate agent stats."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="stats_agent", spatial_budget=100.0)

        stats = agent.get_statistics()

        assert stats["agent_id"] == "stats_agent"
        assert stats["total_budget"] == 100.0
        assert stats["budget_remaining"] == 100.0
        assert stats["budget_consumed"] == 0.0
        assert stats["pending_claims"] == 0
        assert stats["won_claims"] == 0
        assert stats["lost_claims"] == 0


class TestTectonicAgentIntegration:
    """Integration tests with TectonicNegotiator."""

    def test_full_claim_lifecycle(self):
        """Test complete claim lifecycle from submission to settlement."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="lifecycle_agent", spatial_budget=100.0)

        # Submit claim
        claim_id = agent.submit_claim(tile=(5, 5), purpose="Integration test", bid=25.0)

        # Verify in negotiator
        pending = negotiator.get_pending_claims()
        assert claim_id in pending

        # Settle
        settlement = negotiator.settle(claim_id)
        agent.handle_settlement(settlement)

        # Verify final state
        assert len(agent.pending_claims) == 0
        assert len(agent.won_claims) == 1
        assert agent.get_budget_consumed() == 25.0

    def test_agent_repr(self):
        """Agent repr should show useful information."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, agent_id="repr_agent", spatial_budget=100.0)

        repr_str = repr(agent)
        assert "TectonicAgent" in repr_str
        assert "repr_agent" in repr_str
        assert "100.00" in repr_str


class TestTectonicAgentWithStrategy:
    """Tests for TectonicAgent with StrategyProfile integration."""

    def test_agent_with_aggressive_strategy_preset(self):
        """Agent should accept and store AGGRESSIVE strategy preset."""
        negotiator = TectonicNegotiator()
        aggressive_strategy = StrategyProfile.get_preset(StrategyType.AGGRESSIVE)
        agent = TectonicAgent(
            negotiator,
            agent_id="aggressive_agent",
            spatial_budget=100.0,
            strategy=aggressive_strategy,
        )

        assert agent.strategy is not None
        assert agent.strategy.aggression_level == 0.9
        assert agent.strategy.base_bid_fraction == 0.25

    def test_agent_autonomous_bid_calculation(self):
        """Agent should calculate bids autonomously using strategy profile."""
        negotiator = TectonicNegotiator()
        strategy = StrategyProfile(
            base_bid_fraction=0.1,
            distance_weight=0.05,
            aggression_level=0.5,
            budget_reserve_fraction=0.2,
        )
        agent = TectonicAgent(
            negotiator,
            agent_id="auto_agent",
            spatial_budget=100.0,
            strategy=strategy,
        )

        # Calculate bid for tile at origin
        bid = agent.calculate_bid(tile=(0, 0), purpose="Test")

        # Bid should be positive and within budget constraints
        assert bid > 0
        assert bid <= 100.0 * (1 - 0.2)  # max bid respects reserve

    def test_agent_submit_claim_with_strategy(self):
        """Agent should submit claim with strategy-calculated bid."""
        negotiator = TectonicNegotiator()
        strategy = StrategyProfile(
            base_bid_fraction=0.2,
            distance_weight=0.0,  # No distance penalty for this test
            aggression_level=0.0,  # No aggression multiplier
            budget_reserve_fraction=0.2,
        )
        agent = TectonicAgent(
            negotiator,
            agent_id="strategy_agent",
            spatial_budget=100.0,
            strategy=strategy,
        )

        # Submit claim with strategy
        claim_id = agent.submit_claim_with_strategy(tile=(0, 0), purpose="Auto claim")

        # Verify claim was submitted
        assert claim_id is not None
        assert claim_id in agent.pending_claims

        # Verify budget was reserved
        assert agent.get_budget_reserved() > 0

    def test_far_tile_gets_lower_bid_than_near_tile(self):
        """Strategy should result in lower bids for distant tiles."""
        negotiator = TectonicNegotiator()
        strategy = StrategyProfile(
            base_bid_fraction=0.2,
            distance_weight=0.1,  # Strong distance weighting
            aggression_level=0.0,
            budget_reserve_fraction=0.2,
        )
        agent = TectonicAgent(
            negotiator,
            agent_id="distance_agent",
            spatial_budget=100.0,
            strategy=strategy,
        )

        # Calculate bids for near and far tiles
        near_bid = agent.calculate_bid(tile=(0, 0), purpose="Near tile")
        far_bid = agent.calculate_bid(tile=(50, 50), purpose="Far tile")

        # Near tile should get higher bid
        assert near_bid > far_bid

    def test_counter_bid_decision_using_strategy(self):
        """Agent should use strategy to decide on counter-bids."""
        negotiator = TectonicNegotiator()
        # Use a strategy with known aggression level
        strategy = StrategyProfile(
            aggression_level=1.0,  # Always counter (probabilistically)
            counter_bid_threshold=0.5,  # Only counter bids below 50% of budget
            budget_reserve_fraction=0.0,
        )
        agent = TectonicAgent(
            negotiator,
            agent_id="counter_agent",
            spatial_budget=100.0,
            strategy=strategy,
        )

        # Test counter-bid decision for a small bid (well below threshold)
        # With aggression_level=1.0, should always return True
        # Test multiple times to account for probabilistic behavior
        results = [agent.should_counter_bid(10.0) for _ in range(20)]
        assert all(results) is True  # All should be True with aggression=1.0

        # Test counter-bid decision for a large bid (above threshold)
        # With threshold=0.5, bids > 50 should be rejected
        result = agent.should_counter_bid(60.0)
        assert result is False

    def test_agent_default_strategy_when_not_provided(self):
        """Agent should use default StrategyProfile when none provided."""
        negotiator = TectonicNegotiator()
        agent = TectonicAgent(negotiator, spatial_budget=100.0)

        assert agent.strategy is not None
        assert isinstance(agent.strategy, StrategyProfile)
        # Default values
        assert agent.strategy.base_bid_fraction == 0.1
        assert agent.strategy.aggression_level == 0.5
