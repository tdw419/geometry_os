"""
Tests for plate-level tectonic negotiation.

Task: Integrate Plates with TectonicNegotiator
"""

import pytest
import numpy as np

from systems.tectonic.claim import TectonicClaim, ClaimStatus
from systems.tectonic.negotiator import TectonicNegotiator
from systems.tectonic.plate import TectonicPlate, DistrictState


def create_test_plate(
    plate_id: str = "plate-001",
    agents: list = None,
    cohesion: float = 0.8,
    budgets: dict = None,
) -> TectonicPlate:
    """Helper to create a test plate."""
    if agents is None:
        agents = ["agent-1", "agent-2", "agent-3"]
    if budgets is None:
        budgets = {a: 10.0 for a in agents}

    centroid = np.zeros(64, dtype=np.float32)

    return TectonicPlate(
        plate_id=plate_id,
        agents=agents,
        centroid=centroid,
        cohesion=cohesion,
        agent_budgets=budgets,
    )


class TestPlateClaimSubmission:
    """Tests for submit_plate_claim method."""

    def test_submit_plate_claim_returns_claim_id(self):
        """Submit plate claim returns a valid claim_id."""
        negotiator = TectonicNegotiator()
        plate = create_test_plate()

        claim_id = negotiator.submit_plate_claim(
            plate=plate,
            tile=(5, 10),
            purpose="build neural cluster",
        )

        # Should return a string claim_id
        assert isinstance(claim_id, str)
        assert len(claim_id) > 0

    def test_plate_claim_includes_plate_id(self):
        """Plate claim has plate_id set correctly."""
        negotiator = TectonicNegotiator()
        plate = create_test_plate(plate_id="my-plate-42")

        claim_id = negotiator.submit_plate_claim(
            plate=plate,
            tile=(3, 7),
            purpose="expand district",
        )

        claim = negotiator.get_claim(claim_id)
        assert claim is not None
        assert claim.plate_id == "my-plate-42"

    def test_plate_claim_purpose_is_prefixed(self):
        """Plate claim purpose is prefixed with [plate_id]."""
        negotiator = TectonicNegotiator()
        plate = create_test_plate(plate_id="alpha-plate")

        claim_id = negotiator.submit_plate_claim(
            plate=plate,
            tile=(1, 2),
            purpose="construct memory hub",
        )

        claim = negotiator.get_claim(claim_id)
        assert claim is not None
        assert claim.purpose == "[alpha-plate] construct memory hub"


class TestPlateForceCalculation:
    """Tests for plate force vs individual agent force."""

    def test_plate_force_exceeds_individual(self):
        """Plate with 3 agents has more force than a single agent."""
        negotiator = TectonicNegotiator()

        # Create a plate with 3 agents, each with budget 10, cohesion 0.8
        # Force = total_budget * cohesion = 30 * 0.8 = 24.0
        plate = create_test_plate(
            agents=["a1", "a2", "a3"],
            cohesion=0.8,
            budgets={"a1": 10.0, "a2": 10.0, "a3": 10.0},
        )

        # Submit plate claim
        plate_claim_id = negotiator.submit_plate_claim(
            plate=plate,
            tile=(10, 20),
            purpose="major expansion",
        )

        # Submit individual agent claim with budget 10
        individual_claim = TectonicClaim(
            tile=(10, 20),
            purpose="individual expansion",
            bid=10.0,  # Single agent's budget
            agent_id="solo-agent",
        )
        individual_claim_id = negotiator.submit_claim(individual_claim)

        # Get both claims
        plate_claim = negotiator.get_claim(plate_claim_id)
        individual_claim = negotiator.get_claim(individual_claim_id)

        # Plate bid (24.0) should exceed individual bid (10.0)
        assert plate_claim.bid == 24.0  # 30 * 0.8
        assert individual_claim.bid == 10.0
        assert plate_claim.bid > individual_claim.bid


class TestGetClaim:
    """Tests for get_claim method."""

    def test_get_claim_returns_none_for_invalid_id(self):
        """get_claim returns None for non-existent claim ID."""
        negotiator = TectonicNegotiator()

        result = negotiator.get_claim("non-existent-claim-id")

        assert result is None

    def test_get_claim_returns_claim_for_valid_id(self):
        """get_claim returns the claim for a valid claim ID."""
        negotiator = TectonicNegotiator()

        # Submit a regular claim
        claim = TectonicClaim(
            tile=(5, 5),
            purpose="test claim",
            bid=15.0,
            agent_id="test-agent",
        )
        claim_id = negotiator.submit_claim(claim)

        # Retrieve it
        retrieved = negotiator.get_claim(claim_id)

        assert retrieved is not None
        assert retrieved.claim_id == claim_id
        assert retrieved.tile == (5, 5)
        assert retrieved.agent_id == "test-agent"

    def test_get_claim_returns_none_after_settlement(self):
        """get_claim returns None after claim is settled (removed from pending)."""
        negotiator = TectonicNegotiator()

        claim = TectonicClaim(
            tile=(0, 0),
            purpose="quick claim",
            bid=5.0,
            agent_id="fast-agent",
        )
        claim_id = negotiator.submit_claim(claim)

        # Should be retrievable before settlement
        assert negotiator.get_claim(claim_id) is not None

        # Settle the claim
        negotiator.settle(claim_id)

        # Should return None after settlement (removed from pending)
        assert negotiator.get_claim(claim_id) is None


class TestPlateClaimSettlement:
    """Tests for settling plate claims."""

    def test_plate_claim_settles_correctly(self):
        """Plate claim can be settled and uses plate force."""
        negotiator = TectonicNegotiator()

        plate = create_test_plate(
            cohesion=0.9,
            budgets={"a1": 20.0, "a2": 20.0},
        )
        # Force = 40 * 0.9 = 36.0

        claim_id = negotiator.submit_plate_claim(
            plate=plate,
            tile=(7, 7),
            purpose="district expansion",
        )

        settlement = negotiator.settle(claim_id)

        assert settlement.winner == plate.plate_id
        assert settlement.force == 36.0
        assert settlement.claim.plate_id == plate.plate_id
