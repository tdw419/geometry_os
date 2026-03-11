"""Tectonic negotiation system for distributed spatial claims."""

from systems.tectonic.agent import (
    BudgetTracker,
    TectonicAgent,
)
from systems.tectonic.claim import (
    ClaimStatus,
    TectonicBid,
    TectonicClaim,
    TectonicSettlement,
)
from systems.tectonic.negotiator import (
    BID_WINDOW_SECONDS,
    DEFAULT_ANCHOR_CONSTANT,
    DEFAULT_COMPETING_WEIGHT,
    DEFAULT_SEMANTIC_WEIGHT,
    PendingClaim,
    TectonicNegotiator,
)
from systems.tectonic.plate import (
    DISTRICT_COLORS,
    DistrictState,
    TectonicPlate,
)
from systems.tectonic.strategy import (
    StrategyProfile,
    StrategyType,
)
from systems.tectonic.visual import (
    DistrictHeatmap,
    GhostLayer,
)

__all__ = [
    # Claim data structures
    "ClaimStatus",
    "TectonicClaim",
    "TectonicBid",
    "TectonicSettlement",
    # Negotiator
    "TectonicNegotiator",
    "PendingClaim",
    # Agent
    "TectonicAgent",
    "BudgetTracker",
    # Strategy
    "StrategyType",
    "StrategyProfile",
    # Plate (Phase 49: Neural District Coalescence)
    "DistrictState",
    "DISTRICT_COLORS",
    "TectonicPlate",
    # Visual (Phase 49: District Visualization)
    "DistrictHeatmap",
    "GhostLayer",
    # Constants
    "BID_WINDOW_SECONDS",
    "DEFAULT_SEMANTIC_WEIGHT",
    "DEFAULT_COMPETING_WEIGHT",
    "DEFAULT_ANCHOR_CONSTANT",
]
