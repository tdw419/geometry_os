"""Tectonic negotiation system for distributed spatial claims."""

from systems.tectonic.claim import (
    ClaimStatus,
    TectonicClaim,
    TectonicBid,
    TectonicSettlement,
)
from systems.tectonic.negotiator import (
    TectonicNegotiator,
    PendingClaim,
    BID_WINDOW_SECONDS,
    DEFAULT_SEMANTIC_WEIGHT,
    DEFAULT_COMPETING_WEIGHT,
    DEFAULT_ANCHOR_CONSTANT,
)
from systems.tectonic.agent import (
    TectonicAgent,
    BudgetTracker,
)
from systems.tectonic.strategy import (
    StrategyType,
    StrategyProfile,
)
from systems.tectonic.plate import (
    DistrictState,
    DISTRICT_COLORS,
    TectonicPlate,
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
