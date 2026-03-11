"""
TectonicNegotiator - 3-phase auction negotiation engine for distributed tectonics.

Task 2.1 of Tectonic Realignment Plan.

Phases:
1. CLAIM: Agent submits claim on a tile
2. BID: 500ms window for counter-bids
3. SETTLE: Force calculation determines winner, generates GeoASM program

Force Formula:
    F_claim = bid_amount * semantic_weight
    F_counter = sum(counter_bids) * competing_weight
    F_anchor = distance_from_origin * 0.1

    Winner if: F_claim > F_counter + F_anchor
"""

import logging
import math
import time
from dataclasses import dataclass, field
from typing import Any

from systems.tectonic.claim import (
    ClaimStatus,
    TectonicBid,
    TectonicClaim,
    TectonicSettlement,
)
from systems.tectonic.plate import TectonicPlate

logger = logging.getLogger("tectonic.negotiator")

# Default weights for force calculation
DEFAULT_SEMANTIC_WEIGHT = 1.0
DEFAULT_COMPETING_WEIGHT = 0.8
DEFAULT_ANCHOR_CONSTANT = 0.1

# Bid window duration in seconds
BID_WINDOW_SECONDS = 0.5


@dataclass
class PendingClaim:
    """Internal tracking for a pending claim and its bids."""

    claim: TectonicClaim
    bids: list[TectonicBid] = field(default_factory=list)
    submitted_at: float = field(default_factory=time.time)


class TectonicNegotiator:
    """
    3-phase auction negotiation engine for tectonic claims.

    Manages the lifecycle of spatial claims through claim -> bid -> settle phases.
    Uses physics-based force calculation to determine winners.

    Attributes:
        tectonic_engine: Optional TectonicEngine for advanced physics
        semantic_weight: Weight for claim bid amount (default 1.0)
        competing_weight: Weight for counter-bids (default 0.8)
        anchor_constant: Weight for distance from origin (default 0.1)
    """

    def __init__(
        self,
        tectonic_engine: Any | None = None,
        semantic_weight: float = DEFAULT_SEMANTIC_WEIGHT,
        competing_weight: float = DEFAULT_COMPETING_WEIGHT,
        anchor_constant: float = DEFAULT_ANCHOR_CONSTANT,
    ):
        """
        Initialize the negotiator.

        Args:
            tectonic_engine: Optional TectonicEngine instance for physics
            semantic_weight: Weight for claim bid amount
            competing_weight: Weight for counter-bids
            anchor_constant: Weight for distance from origin
        """
        self.tectonic_engine = tectonic_engine
        self.semantic_weight = semantic_weight
        self.competing_weight = competing_weight
        self.anchor_constant = anchor_constant

        # State tracking
        self._pending_claims: dict[str, PendingClaim] = {}
        self._settlements: list[TectonicSettlement] = []
        self._claims_by_agent: dict[str, list[str]] = {}

    def submit_claim(self, claim: TectonicClaim) -> str:
        """
        Submit a new tectonic claim and start the 500ms bid window.

        Args:
            claim: The TectonicClaim to submit

        Returns:
            str: The claim_id for tracking

        Raises:
            ValueError: If claim is invalid
        """
        if not isinstance(claim, TectonicClaim):
            raise ValueError("claim must be a TectonicClaim instance")

        claim_id = claim.claim_id

        # Create pending claim entry
        pending = PendingClaim(claim=claim)
        self._pending_claims[claim_id] = pending

        # Track by agent
        if claim.agent_id not in self._claims_by_agent:
            self._claims_by_agent[claim.agent_id] = []
        self._claims_by_agent[claim.agent_id].append(claim_id)

        logger.info(
            f"Claim submitted: {claim_id} by {claim.agent_id} "
            f"for tile {claim.tile} with bid {claim.bid}"
        )

        return claim_id

    def submit_plate_claim(
        self, plate: TectonicPlate, tile: tuple[int, int], purpose: str
    ) -> str:
        """
        Submit a claim on behalf of a tectonic plate.

        The bid is calculated as plate.calculate_force() (budget * cohesion).

        Args:
            plate: The TectonicPlate submitting the claim
            tile: The (x, y) tile coordinates to claim
            purpose: The purpose description (will be prefixed with plate_id)

        Returns:
            str: The claim_id for tracking
        """
        # Calculate bid from plate force
        bid = plate.calculate_force()

        # Prefix purpose with plate_id
        prefixed_purpose = f"[{plate.plate_id}] {purpose}"

        # Create claim with plate_id
        claim = TectonicClaim(
            tile=tile,
            purpose=prefixed_purpose,
            bid=bid,
            agent_id=plate.plate_id,
            plate_id=plate.plate_id,
        )

        return self.submit_claim(claim)

    def get_claim(self, claim_id: str) -> TectonicClaim | None:
        """
        Get a claim by its ID.

        Args:
            claim_id: The claim ID to look up

        Returns:
            TectonicClaim if found, None otherwise
        """
        if claim_id in self._pending_claims:
            return self._pending_claims[claim_id].claim
        return None

    def submit_bid(self, bid: TectonicBid) -> bool:
        """
        Submit a counter-bid on an existing claim.

        Args:
            bid: The TectonicBid to submit

        Returns:
            bool: True if bid accepted (within window), False otherwise
        """
        if not isinstance(bid, TectonicBid):
            raise ValueError("bid must be a TectonicBid instance")

        claim_id = bid.claim_id

        # Check if claim exists
        if claim_id not in self._pending_claims:
            logger.warning(f"Bid rejected: claim {claim_id} not found")
            return False

        pending = self._pending_claims[claim_id]

        # Check if within bid window
        elapsed = time.time() - pending.submitted_at
        if elapsed > BID_WINDOW_SECONDS:
            logger.warning(
                f"Bid rejected: bid window closed for claim {claim_id} "
                f"(elapsed: {elapsed:.3f}s)"
            )
            return False

        # Accept bid
        pending.bids.append(bid)
        logger.info(
            f"Bid accepted: {bid.amount} by {bid.agent_id} on claim {claim_id}"
        )
        return True

    def settle(self, claim_id: str) -> TectonicSettlement:
        """
        Settle a claim using force calculation.

        Determines winner based on:
        F_claim = bid_amount * semantic_weight
        F_counter = sum(counter_bids) * competing_weight
        F_anchor = distance_from_origin * anchor_constant

        Winner if: F_claim > F_counter + F_anchor

        Args:
            claim_id: The claim to settle

        Returns:
            TectonicSettlement: The settlement result

        Raises:
            KeyError: If claim not found
        """
        if claim_id not in self._pending_claims:
            raise KeyError(f"Claim {claim_id} not found")

        pending = self._pending_claims[claim_id]
        claim = pending.claim

        # Calculate forces
        f_claim, f_counter, f_anchor = self._calculate_force(claim)

        # Determine winner
        # Original claimant wins if their force exceeds counter + anchor
        claimant_wins = f_claim > (f_counter + f_anchor)

        if claimant_wins:
            winner = claim.agent_id
            winning_force = f_claim
        else:
            # Find highest bidder among counter-bids
            if pending.bids:
                highest_bid = max(pending.bids, key=lambda b: b.amount)
                winner = highest_bid.agent_id
                winning_force = f_counter
            else:
                # No counter-bids but claimant still loses to anchor
                # This shouldn't happen with positive bids, but handle it
                winner = claim.agent_id
                winning_force = f_claim

        # Update claim status
        claim.status = ClaimStatus.APPROVED if claimant_wins else ClaimStatus.REJECTED

        # Create settlement
        settlement = TectonicSettlement(
            claim=claim,
            winner=winner,
            force=winning_force,
            program=self._generate_geoasm_program(claim.tile),
        )

        # Store settlement history
        self._settlements.append(settlement)

        # Remove from pending
        del self._pending_claims[claim_id]

        logger.info(
            f"Claim {claim_id} settled: winner={winner}, "
            f"force={winning_force:.3f}, "
            f"F_claim={f_claim:.3f}, F_counter={f_counter:.3f}, F_anchor={f_anchor:.3f}"
        )

        return settlement

    def _calculate_force(
        self, claim: TectonicClaim
    ) -> tuple[float, float, float]:
        """
        Calculate forces for a claim.

        Args:
            claim: The claim to calculate forces for

        Returns:
            Tuple of (F_claim, F_counter, F_anchor)
        """
        pending = self._pending_claims.get(claim.claim_id)
        if not pending:
            return (0.0, 0.0, 0.0)

        # F_claim = bid_amount * semantic_weight
        f_claim = claim.bid * self.semantic_weight

        # F_counter = sum of counter-bids * competing_weight
        counter_sum = sum(b.amount for b in pending.bids)
        f_counter = counter_sum * self.competing_weight

        # F_anchor = distance from origin (0,0) * anchor_constant
        x, y = claim.tile
        distance = math.sqrt(x * x + y * y)
        f_anchor = distance * self.anchor_constant

        return (f_claim, f_counter, f_anchor)

    def _generate_geoasm_program(self, tile: tuple[int, int]) -> bytes:
        """
        Generate a GeoASM program for settling a tile.

        Program format:
        - 1 byte: TECTONIC_SETTLE opcode (0xE2)
        - 4 bytes: tile x coordinate (little-endian int32)
        - 4 bytes: tile y coordinate (little-endian int32)

        Args:
            tile: The (x, y) coordinates to settle

        Returns:
            bytes: The GeoASM program
        """
        return TectonicSettlement.create_program(tile)

    def get_pending_claims(self) -> dict[str, TectonicClaim]:
        """Get all pending claims."""
        return {
            cid: pc.claim for cid, pc in self._pending_claims.items()
        }

    def get_bids_for_claim(self, claim_id: str) -> list[TectonicBid]:
        """Get all bids for a specific claim."""
        if claim_id not in self._pending_claims:
            return []
        return list(self._pending_claims[claim_id].bids)

    def get_settlement_history(self) -> list[TectonicSettlement]:
        """Get all settlements."""
        return list(self._settlements)

    def get_settlements_by_winner(self, agent_id: str) -> list[TectonicSettlement]:
        """Get settlements won by a specific agent."""
        return [s for s in self._settlements if s.winner == agent_id]

    def get_claims_by_agent(self, agent_id: str) -> list[TectonicClaim]:
        """Get all claims submitted by an agent."""
        claim_ids = self._claims_by_agent.get(agent_id, [])
        claims = []
        for cid in claim_ids:
            if cid in self._pending_claims:
                claims.append(self._pending_claims[cid].claim)
        return claims

    async def settle_all_pending(self) -> list[TectonicSettlement]:
        """
        Settle all pending claims.

        Returns:
            List of all settlements
        """
        settlements = []
        claim_ids = list(self._pending_claims.keys())

        for claim_id in claim_ids:
            try:
                settlement = self.settle(claim_id)
                settlements.append(settlement)
            except Exception as e:
                logger.error(f"Failed to settle claim {claim_id}: {e}")

        return settlements

    def is_bid_window_open(self, claim_id: str) -> bool:
        """Check if the bid window is still open for a claim."""
        if claim_id not in self._pending_claims:
            return False
        pending = self._pending_claims[claim_id]
        elapsed = time.time() - pending.submitted_at
        return elapsed <= BID_WINDOW_SECONDS

    def get_statistics(self) -> dict[str, Any]:
        """Get negotiator statistics."""
        total_settlements = len(self._settlements)
        wins_by_agent: dict[str, int] = {}
        for s in self._settlements:
            wins_by_agent[s.winner] = wins_by_agent.get(s.winner, 0) + 1

        return {
            "pending_claims": len(self._pending_claims),
            "total_settlements": total_settlements,
            "wins_by_agent": wins_by_agent,
            "semantic_weight": self.semantic_weight,
            "competing_weight": self.competing_weight,
            "anchor_constant": self.anchor_constant,
        }
