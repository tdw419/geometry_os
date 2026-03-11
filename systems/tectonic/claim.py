"""
TectonicClaim data structures for distributed tectonic negotiation.

Task 1.1 of Tectonic Realignment Plan.
"""

import struct
import time
import uuid
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class ClaimStatus(Enum):
    """Status of a tectonic claim."""

    PENDING = "pending"
    APPROVED = "approved"
    REJECTED = "rejected"
    ESCALATED = "escalated"


# GeoASM opcode for tectonic settlement
TECTONIC_SETTLE_OPCODE = 0xE2


@dataclass
class TectonicClaim:
    """
    A claim on a spatial tile by an agent.

    Represents an agent's intent to build or perform an action on a specific
    spatial coordinate within the tectonic grid.
    """

    tile: tuple[int, int]
    purpose: str
    bid: float
    agent_id: str
    timestamp: float = field(default_factory=time.time)
    status: ClaimStatus = ClaimStatus.PENDING
    claim_id: str = field(default_factory=lambda: str(uuid.uuid4()))
    plate_id: str | None = None

    def to_dict(self) -> dict[str, Any]:
        """Serialize claim to dictionary for JSON."""
        return {
            "tile": list(self.tile),
            "purpose": self.purpose,
            "bid": self.bid,
            "agent_id": self.agent_id,
            "timestamp": self.timestamp,
            "status": self.status.value,
            "claim_id": self.claim_id,
            "plate_id": self.plate_id,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "TectonicClaim":
        """Deserialize claim from dictionary."""
        return cls(
            tile=tuple(data["tile"]),
            purpose=data["purpose"],
            bid=data["bid"],
            agent_id=data["agent_id"],
            timestamp=data["timestamp"],
            status=ClaimStatus(data["status"]),
            claim_id=data["claim_id"],
            plate_id=data.get("plate_id"),
        )

    def __post_init__(self):
        """Validate claim after initialization."""
        if not isinstance(self.tile, tuple) or len(self.tile) != 2:
            raise ValueError("tile must be a tuple of (int, int)")
        if not isinstance(self.status, ClaimStatus):
            raise ValueError("status must be a ClaimStatus enum")


@dataclass
class TectonicBid:
    """
    A counter-bid on an existing tectonic claim.

    Agents can submit counter-bids to compete for spatial claims,
    with higher bids potentially winning the tile.
    """

    claim_id: str
    amount: float
    agent_id: str
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> dict[str, Any]:
        """Serialize bid to dictionary for JSON."""
        return {
            "claim_id": self.claim_id,
            "amount": self.amount,
            "agent_id": self.agent_id,
            "timestamp": self.timestamp,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "TectonicBid":
        """Deserialize bid from dictionary."""
        return cls(
            claim_id=data["claim_id"],
            amount=data["amount"],
            agent_id=data["agent_id"],
            timestamp=data["timestamp"],
        )


@dataclass
class TectonicSettlement:
    """
    A settled tectonic claim with execution program.

    Represents the final resolution of a claim negotiation,
    including the winner, calculated force, and GeoASM program.
    """

    claim: TectonicClaim
    winner: str
    force: float
    program: bytes
    settled_at: float = field(default_factory=time.time)

    def to_dict(self) -> dict[str, Any]:
        """Serialize settlement to dictionary for JSON."""
        return {
            "claim": self.claim.to_dict(),
            "winner": self.winner,
            "force": self.force,
            "program": list(self.program),  # bytes as list for JSON
            "settled_at": self.settled_at,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "TectonicSettlement":
        """Deserialize settlement from dictionary."""
        return cls(
            claim=TectonicClaim.from_dict(data["claim"]),
            winner=data["winner"],
            force=data["force"],
            program=bytes(data["program"]),
            settled_at=data["settled_at"],
        )

    def to_geoasm(self) -> bytes:
        """
        Return the GeoASM program bytes.

        The program format is:
        - 1 byte: TECTONIC_SETTLE opcode (0xE2)
        - 4 bytes: tile x coordinate (little-endian int32)
        - 4 bytes: tile y coordinate (little-endian int32)
        """
        return self.program

    @classmethod
    def create_program(cls, tile: tuple[int, int]) -> bytes:
        """
        Create a GeoASM program for settling a tile.

        Args:
            tile: The (x, y) coordinates to settle

        Returns:
            bytes: The GeoASM program
        """
        x, y = tile
        return struct.pack(
            "<Bii",
            TECTONIC_SETTLE_OPCODE,
            x,
            y
        )
