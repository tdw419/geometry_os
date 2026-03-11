"""
TectonicAgent - Base class for agents participating in tectonic negotiation.

Task 3.1 of Tectonic Realignment Plan.

TectonicAgent manages:
- Spatial budget for claim bids
- Pending and won claims tracking
- Integration with TectonicNegotiator
- Optional LLM-based decision making via PixelBrainBridge
"""

import logging
import uuid
from collections.abc import Callable
from dataclasses import dataclass
from typing import TYPE_CHECKING, Optional

from systems.tectonic.claim import (
    TectonicBid,
    TectonicClaim,
    TectonicSettlement,
)
from systems.tectonic.negotiator import TectonicNegotiator
from systems.tectonic.strategy import StrategyProfile

if TYPE_CHECKING:
    from systems.pixel_brain.inference_bridge import PixelBrainBridge

logger = logging.getLogger("tectonic.agent")


@dataclass
class BudgetTracker:
    """
    Tracks budget allocation for an agent.

    Manages:
    - Total budget
    - Budget reserved for pending claims
    - Budget consumed by won claims
    """

    total_budget: float
    reserved: float = 0.0  # Budget reserved for pending claims
    consumed: float = 0.0  # Budget spent on won claims

    def can_afford(self, amount: float) -> bool:
        """Check if agent can afford a bid."""
        available = self.total_budget - self.reserved - self.consumed
        return available >= amount

    def reserve(self, amount: float) -> bool:
        """
        Reserve budget for a pending claim.

        Returns True if successful, False if insufficient budget.
        """
        if not self.can_afford(amount):
            return False
        self.reserved += amount
        return True

    def consume(self, amount: float) -> bool:
        """
        Consume reserved budget for a won claim.

        Returns True if successful, False if not enough reserved.
        """
        if self.reserved < amount:
            return False
        self.reserved -= amount
        self.consumed += amount
        return True

    def release(self, amount: float) -> bool:
        """
        Release reserved budget (for lost claims).

        Returns True if successful, False if not enough reserved.
        """
        if self.reserved < amount:
            return False
        self.reserved -= amount
        return True

    def get_remaining(self) -> float:
        """Get available budget (not reserved or consumed)."""
        return self.total_budget - self.reserved - self.consumed

    def get_total_consumed(self) -> float:
        """Get total budget consumed on won claims."""
        return self.consumed

    def get_total_reserved(self) -> float:
        """Get total budget reserved for pending claims."""
        return self.reserved


class TectonicAgent:
    """
    Base class for agents participating in tectonic negotiation.

    TectonicAgent handles:
    - Budget management for spatial claims
    - Submitting claims through TectonicNegotiator
    - Submitting counter-bids on other agents' claims
    - Tracking pending and won claims

    Attributes:
        agent_id: Unique identifier for this agent
        spatial_budget: Total budget for claim bids
        negotiator: Reference to shared TectonicNegotiator
    """

    def __init__(
        self,
        negotiator: TectonicNegotiator,
        agent_id: str | None = None,
        spatial_budget: float = 100.0,
        strategy: StrategyProfile | None = None,
        use_llm: bool = False,
        llm_bridge: Optional["PixelBrainBridge"] = None,
    ):
        """
        Initialize a TectonicAgent.

        Args:
            negotiator: The TectonicNegotiator to use for claims
            agent_id: Unique identifier (auto-generated UUID if not provided)
            spatial_budget: Total budget available for claims
            strategy: StrategyProfile for autonomous bidding (default if not provided)
            use_llm: If True, use PixelBrainBridge for decisions instead of StrategyProfile
            llm_bridge: Optional pre-configured PixelBrainBridge instance
        """
        self.agent_id = agent_id or str(uuid.uuid4())
        self.negotiator = negotiator
        self._budget = BudgetTracker(total_budget=spatial_budget)
        self.strategy = strategy or StrategyProfile()
        self.use_llm = use_llm
        self._llm_bridge = llm_bridge

        # Track claims
        self._pending_claims: dict[str, TectonicClaim] = {}
        self._pending_bids: dict[str, float] = {}  # claim_id -> bid amount
        self._won_claims: list[TectonicSettlement] = []
        self._lost_claims: list[TectonicSettlement] = []

        # Settlement callbacks
        self._on_settlement_callbacks: list[Callable[[TectonicSettlement], None]] = []

    @property
    def llm_bridge(self) -> Optional["PixelBrainBridge"]:
        """Get the LLM bridge, creating one lazily if needed."""
        if self.use_llm and self._llm_bridge is None:
            # Lazy import to avoid circular dependency
            from systems.pixel_brain.inference_bridge import PixelBrainBridge
            self._llm_bridge = PixelBrainBridge()
        return self._llm_bridge

    @property
    def spatial_budget(self) -> float:
        """Get the total spatial budget."""
        return self._budget.total_budget

    @property
    def pending_claims(self) -> dict[str, TectonicClaim]:
        """Get pending claims submitted by this agent."""
        return dict(self._pending_claims)

    @property
    def won_claims(self) -> list[TectonicSettlement]:
        """Get settlements won by this agent."""
        return list(self._won_claims)

    @property
    def lost_claims(self) -> list[TectonicSettlement]:
        """Get settlements lost by this agent."""
        return list(self._lost_claims)

    def can_afford(self, bid: float) -> bool:
        """
        Check if the agent can afford a bid.

        Args:
            bid: The bid amount to check

        Returns:
            bool: True if bid is within remaining budget
        """
        return self._budget.can_afford(bid)

    def get_budget_remaining(self) -> float:
        """
        Get the current available budget.

        Returns:
            float: Budget not reserved or consumed
        """
        return self._budget.get_remaining()

    def get_budget_consumed(self) -> float:
        """
        Get total budget consumed on won claims.

        Returns:
            float: Total budget spent
        """
        return self._budget.get_total_consumed()

    def get_budget_reserved(self) -> float:
        """
        Get total budget reserved for pending claims.

        Returns:
            float: Total budget reserved
        """
        return self._budget.get_total_reserved()

    def calculate_bid(self, tile: tuple[int, int], purpose: str) -> float:
        """
        Calculate optimal bid amount for a tile using the strategy profile.

        Args:
            tile: The (x, y) coordinates of the tile to bid on
            purpose: Description of intended use

        Returns:
            float: The calculated optimal bid amount
        """
        return self.strategy.calculate_optimal_bid(
            tile, purpose, self.get_budget_remaining()
        )

    def submit_claim_with_strategy(
        self, tile: tuple[int, int], purpose: str
    ) -> str:
        """
        Calculate optimal bid using strategy and submit claim.

        Args:
            tile: The (x, y) coordinates of the tile to claim
            purpose: Description of intended use

        Returns:
            str: The claim_id for tracking

        Raises:
            ValueError: If calculated bid exceeds available budget
        """
        bid = self.calculate_bid(tile, purpose)
        return self.submit_claim(tile, purpose, bid)

    async def submit_claim_with_llm(
        self,
        tile: tuple[int, int],
        purpose: str,
    ) -> str:
        """
        Calculate optimal bid using LLM and submit claim.

        This is the async version that uses PixelBrainBridge for
        intelligent bid calculation.

        Args:
            tile: The (x, y) coordinates of the tile to claim
            purpose: Description of intended use

        Returns:
            str: The claim_id for tracking

        Raises:
            ValueError: If calculated bid exceeds available budget
            RuntimeError: If use_llm is False or bridge is unavailable
        """
        if not self.use_llm or self.llm_bridge is None:
            raise RuntimeError(
                "LLM-based decisions not enabled. Initialize with use_llm=True"
            )

        # Get LLM recommendation
        result = await self.llm_bridge.analyze_claim(
            tile=tile,
            purpose=purpose,
            budget=self._budget.total_budget,
            reserved=self._budget.get_total_reserved(),
            consumed=self._budget.get_total_consumed(),
        )

        logger.info(
            f"Agent {self.agent_id} LLM recommended bid {result.recommended_bid:.2f} "
            f"(confidence: {result.confidence:.2f}): {result.reasoning}"
        )

        return self.submit_claim(tile, purpose, result.recommended_bid)

    def should_counter_bid(self, original_bid: float) -> bool:
        """
        Determine whether to submit a counter-bid using the strategy profile.

        Args:
            original_bid: The bid amount to potentially counter

        Returns:
            bool: True if a counter-bid should be submitted
        """
        return self.strategy.should_counter_bid(
            original_bid, self.get_budget_remaining()
        )

    async def should_counter_bid_with_llm(
        self,
        original_bid: float,
        tile: tuple[int, int],
        purpose: str = "",
        original_agent_id: str = "",
    ) -> tuple[bool, float | None]:
        """
        Determine whether to counter-bid using LLM.

        This is the async version that uses PixelBrainBridge for
        intelligent counter-bid decisions.

        Args:
            original_bid: The bid amount to potentially counter
            tile: The tile coordinates being contested
            purpose: Purpose of the original claim
            original_agent_id: ID of the agent making the original claim

        Returns:
            Tuple of (should_counter, suggested_counter_bid)

        Raises:
            RuntimeError: If use_llm is False or bridge is unavailable
        """
        if not self.use_llm or self.llm_bridge is None:
            raise RuntimeError(
                "LLM-based decisions not enabled. Initialize with use_llm=True"
            )

        result = await self.llm_bridge.should_counter_bid(
            original_bid=original_bid,
            my_budget=self.get_budget_remaining(),
            tile=tile,
            purpose=purpose,
            original_agent_id=original_agent_id,
            my_reserved=self._budget.get_total_reserved(),
            won_claims_count=len(self._won_claims),
        )

        logger.info(
            f"Agent {self.agent_id} LLM counter-bid decision: {result.should_counter} "
            f"(confidence: {result.confidence:.2f}): {result.reasoning}"
        )

        return (result.should_counter, result.suggested_counter_bid)

    def submit_claim(
        self,
        tile: tuple[int, int],
        purpose: str,
        bid: float
    ) -> str:
        """
        Create and submit a tectonic claim.

        Args:
            tile: The (x, y) coordinates of the tile to claim
            purpose: Description of intended use
            bid: The bid amount (must be within budget)

        Returns:
            str: The claim_id for tracking

        Raises:
            ValueError: If bid exceeds available budget
        """
        # Check budget
        if not self.can_afford(bid):
            raise ValueError(
                f"Bid {bid} exceeds available budget {self.get_budget_remaining():.2f}"
            )

        # Create the claim
        claim = TectonicClaim(
            tile=tile,
            purpose=purpose,
            bid=bid,
            agent_id=self.agent_id,
        )

        # Reserve budget
        if not self._budget.reserve(bid):
            raise ValueError(f"Failed to reserve budget for bid {bid}")

        # Submit to negotiator
        claim_id = self.negotiator.submit_claim(claim)

        # Track locally
        self._pending_claims[claim_id] = claim
        self._pending_bids[claim_id] = bid

        logger.info(
            f"Agent {self.agent_id} submitted claim {claim_id} "
            f"for tile {tile} with bid {bid}"
        )

        return claim_id

    def counter_bid(self, claim_id: str, amount: float) -> bool:
        """
        Submit a counter-bid on another agent's claim.

        Args:
            claim_id: The claim to bid on
            amount: The counter-bid amount

        Returns:
            bool: True if bid was accepted by negotiator

        Raises:
            ValueError: If bid exceeds available budget
        """
        # Check budget
        if not self.can_afford(amount):
            raise ValueError(
                f"Counter-bid {amount} exceeds available budget {self.get_budget_remaining():.2f}"
            )

        # Reserve budget
        if not self._budget.reserve(amount):
            raise ValueError(f"Failed to reserve budget for counter-bid {amount}")

        # Create and submit bid
        bid = TectonicBid(
            claim_id=claim_id,
            amount=amount,
            agent_id=self.agent_id,
        )

        accepted = self.negotiator.submit_bid(bid)

        if accepted:
            # Track the pending bid
            self._pending_bids[f"counter_{claim_id}"] = amount
            logger.info(
                f"Agent {self.agent_id} submitted counter-bid {amount} on claim {claim_id}"
            )
        else:
            # Release reserved budget if bid rejected
            self._budget.release(amount)
            logger.warning(
                f"Agent {self.agent_id} counter-bid rejected on claim {claim_id}"
            )

        return accepted

    def handle_settlement(self, settlement: TectonicSettlement) -> None:
        """
        Handle a settlement notification.

        This callback is invoked when a settlement is received for a claim
        this agent participated in.

        Args:
            settlement: The settlement result
        """
        claim_id = settlement.claim.claim_id
        is_own_claim = settlement.claim.agent_id == self.agent_id
        is_winner = settlement.winner == self.agent_id

        if is_own_claim:
            # This was our claim
            bid_amount = self._pending_bids.get(claim_id, settlement.claim.bid)

            if is_winner:
                # We won - consume the reserved budget
                self._budget.consume(bid_amount)
                self._won_claims.append(settlement)
                logger.info(
                    f"Agent {self.agent_id} WON claim {claim_id} "
                    f"with force {settlement.force:.3f}"
                )
            else:
                # We lost - release the reserved budget
                self._budget.release(bid_amount)
                self._lost_claims.append(settlement)
                logger.info(
                    f"Agent {self.agent_id} LOST claim {claim_id} "
                    f"to {settlement.winner}"
                )

            # Remove from pending
            self._pending_claims.pop(claim_id, None)
            self._pending_bids.pop(claim_id, None)

        else:
            # This was a counter-bid we made on someone else's claim
            counter_key = f"counter_{claim_id}"
            bid_amount = self._pending_bids.get(counter_key)

            if bid_amount is not None:
                if is_winner:
                    # Our counter-bid won
                    self._budget.consume(bid_amount)
                    self._won_claims.append(settlement)
                    logger.info(
                        f"Agent {self.agent_id} WON counter-bid on claim {claim_id}"
                    )
                else:
                    # Our counter-bid lost
                    self._budget.release(bid_amount)
                    self._lost_claims.append(settlement)
                    logger.info(
                        f"Agent {self.agent_id} LOST counter-bid on claim {claim_id}"
                    )

                self._pending_bids.pop(counter_key, None)

        # Trigger registered callbacks
        for callback in self._on_settlement_callbacks:
            try:
                callback(settlement)
            except Exception as e:
                logger.error(f"Settlement callback error: {e}")

    def on_settlement(self, callback: Callable[[TectonicSettlement], None]) -> None:
        """
        Register a callback for settlement notifications.

        Args:
            callback: Function to call when settlement received
        """
        self._on_settlement_callbacks.append(callback)

    def get_claim_by_id(self, claim_id: str) -> TectonicClaim | None:
        """
        Get a pending claim by ID.

        Args:
            claim_id: The claim ID to look up

        Returns:
            TectonicClaim or None if not found
        """
        return self._pending_claims.get(claim_id)

    def get_statistics(self) -> dict[str, any]:
        """
        Get agent statistics.

        Returns:
            Dict with budget, claims, and win/loss stats
        """
        return {
            "agent_id": self.agent_id,
            "total_budget": self._budget.total_budget,
            "budget_remaining": self.get_budget_remaining(),
            "budget_consumed": self.get_budget_consumed(),
            "budget_reserved": self.get_budget_reserved(),
            "pending_claims": len(self._pending_claims),
            "won_claims": len(self._won_claims),
            "lost_claims": len(self._lost_claims),
            "win_rate": (
                len(self._won_claims) / (len(self._won_claims) + len(self._lost_claims))
                if (len(self._won_claims) + len(self._lost_claims)) > 0
                else 0.0
            ),
        }

    def __repr__(self) -> str:
        return (
            f"TectonicAgent(agent_id={self.agent_id!r}, "
            f"budget={self.get_budget_remaining():.2f}/{self._budget.total_budget:.2f})"
        )
