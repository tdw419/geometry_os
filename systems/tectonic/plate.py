"""
TectonicPlate - District container for neural coalescence.

Phase 49: Neural District Coalescence
A plate represents a cohesive cluster of agents with shared purpose.
"""

from dataclasses import dataclass, field
from enum import Enum
from typing import Dict, List, Optional, Tuple

import numpy as np


class DistrictState(Enum):
    """Possible states for a tectonic plate district."""
    HIGH_COHESION = "high_cohesion"
    LOW_COHESION = "low_cohesion"
    ACTIVE = "active"
    DORMANT = "dormant"
    CONFLICT = "conflict"


# PixelBrain-specified colors (RGBA)
DISTRICT_COLORS: Dict[DistrictState, Tuple[int, int, int, int]] = {
    DistrictState.HIGH_COHESION: (0, 240, 255, 255),    # #00F0FF
    DistrictState.LOW_COHESION: (74, 74, 74, 255),      # #4A4A4A
    DistrictState.ACTIVE: (255, 69, 0, 255),            # #FF4500
    DistrictState.DORMANT: (26, 26, 26, 255),           # #1A1A1A
    DistrictState.CONFLICT: (255, 51, 51, 255),         # #FF3333
}


@dataclass
class TectonicPlate:
    """
    A tectonic plate representing a district of neural agents.

    Plates coalesce from agent clusters and drift based on force calculations.
    """
    plate_id: str
    agents: List[str]
    centroid: np.ndarray  # 64-dim embedding
    cohesion: float = 0.0  # 0-1 scale
    name: str = ""
    purpose: str = ""
    agent_budgets: Dict[str, float] = field(default_factory=dict)
    tiles: List[Tuple[int, int]] = field(default_factory=list)
    state: Optional[DistrictState] = None
    is_active: bool = False
    conflict_count: int = 0

    def __post_init__(self):
        """Derive state from cohesion if not explicitly set."""
        if self.state is None:
            self.state = self._derive_state()

    def _derive_state(self) -> DistrictState:
        """
        Determine state from cohesion/activity/conflict.

        Priority:
        1. CONFLICT if conflict_count > 0
        2. ACTIVE if is_active
        3. HIGH_COHESION if cohesion >= 0.7
        4. LOW_COHESION if cohesion < 0.4
        5. DORMANT otherwise
        """
        if self.conflict_count > 0:
            return DistrictState.CONFLICT
        if self.is_active:
            return DistrictState.ACTIVE
        if self.cohesion >= 0.7:
            return DistrictState.HIGH_COHESION
        if self.cohesion < 0.4:
            return DistrictState.LOW_COHESION
        return DistrictState.DORMANT

    @property
    def total_budget(self) -> float:
        """Sum of all agent budgets."""
        return sum(self.agent_budgets.values())

    def get_color(self) -> Tuple[int, int, int, int]:
        """Return RGBA tuple for current state."""
        if self.state is None:
            return DISTRICT_COLORS[DistrictState.DORMANT]
        return DISTRICT_COLORS[self.state]

    def calculate_force(self) -> float:
        """Return total_budget * cohesion."""
        return self.total_budget * self.cohesion

    def to_dict(self) -> dict:
        """Serialize plate to dictionary (centroid as list)."""
        return {
            "plate_id": self.plate_id,
            "agents": self.agents,
            "centroid": self.centroid.tolist() if isinstance(self.centroid, np.ndarray) else list(self.centroid),
            "cohesion": self.cohesion,
            "name": self.name,
            "purpose": self.purpose,
            "agent_budgets": self.agent_budgets,
            "tiles": self.tiles,
            "state": self.state.value if self.state else None,
            "is_active": self.is_active,
            "conflict_count": self.conflict_count,
        }

    @classmethod
    def from_dict(cls, data: dict) -> "TectonicPlate":
        """Deserialize plate from dictionary (centroid back to np.array)."""
        centroid = data.get("centroid", [])
        if isinstance(centroid, list):
            centroid = np.array(centroid, dtype=np.float32)

        state = None
        if data.get("state"):
            state = DistrictState(data["state"])

        return cls(
            plate_id=data["plate_id"],
            agents=data.get("agents", []),
            centroid=centroid,
            cohesion=data.get("cohesion", 0.0),
            name=data.get("name", ""),
            purpose=data.get("purpose", ""),
            agent_budgets=data.get("agent_budgets", {}),
            tiles=[tuple(t) for t in data.get("tiles", [])],
            state=state,
            is_active=data.get("is_active", False),
            conflict_count=data.get("conflict_count", 0),
        )

    def __repr__(self) -> str:
        """Readable representation."""
        return (
            f"TectonicPlate({self.plate_id!r}, "
            f"agents={len(self.agents)}, "
            f"state={self.state.value if self.state else None}, "
            f"cohesion={self.cohesion:.2f}, "
            f"budget={self.total_budget:.1f})"
        )
