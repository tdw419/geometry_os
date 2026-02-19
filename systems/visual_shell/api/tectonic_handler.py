#!/usr/bin/env python3
"""
TectonicHandler - Phase 28: Spatial Tectonics

Bridges Python ConsensusEngine proposals to the Rust TectonicSimulator
via file-based IPC. The Rust simulator reads proposals, computes layout
deltas using force-directed layout, and writes results back.

State Directory: .geometry/tectonic/
- proposal.json: Current proposal being processed
- layout_delta.json: Movement results from Rust
- status.json: Processing status

Architecture:
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│ ConsensusEngine  │ ──► │ TectonicHandler  │ ──► │ .geometry/tectonic│
│ (Python)         │     │ (this file)      │     │ /proposal.json   │
└──────────────────┘     └──────────────────┘     └──────────────────┘
                                                          │
                         ┌──────────────────┐             │ read
                         │ Rust Tectonic    │ ◄───────────┘
                         │ Simulator        │             │ write
                         └──────────────────┘             ▼
                                                  layout_delta.json
                                                          │
                         ┌──────────────────┐             │
                         │ VATManager       │ ◄───────────┘
                         │ (apply delta)    │
                         └──────────────────┘
"""

import json
import time
import logging
from dataclasses import dataclass, field, asdict
from pathlib import Path
from typing import Dict, List, Optional, Any, Tuple
from datetime import datetime
import hashlib

logger = logging.getLogger("spatial_tectonics.handler")


@dataclass
class TileMovement:
    """A single tile movement from the Rust simulator."""
    tile_id: int
    old_x: int
    old_y: int
    new_x: int
    new_y: int
    distance: float = 0.0

    def __post_init__(self):
        import math
        self.distance = math.sqrt(
            (self.new_x - self.old_x) ** 2 +
            (self.new_y - self.old_y) ** 2
        )


@dataclass
class LayoutDelta:
    """Layout realignment result from Rust TectonicSimulator."""
    proposal_id: str
    movements: List[TileMovement]
    bond_strength: float
    cycle: int
    processing_time_ms: float
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> Dict[str, Any]:
        return {
            "proposal_id": self.proposal_id,
            "movements": [asdict(m) for m in self.movements],
            "bond_strength": self.bond_strength,
            "cycle": self.cycle,
            "processing_time_ms": self.processing_time_ms,
            "timestamp": self.timestamp
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "LayoutDelta":
        movements = [
            TileMovement(**m) for m in data.get("movements", [])
        ]
        return cls(
            proposal_id=data.get("proposal_id", ""),
            movements=movements,
            bond_strength=data.get("bond_strength", 0.0),
            cycle=data.get("cycle", 0),
            processing_time_ms=data.get("processing_time_ms", 0.0),
            timestamp=data.get("timestamp", time.time())
        )


@dataclass
class TectonicStatus:
    """Current status of tectonic processing."""
    state: str  # 'idle', 'processing', 'complete', 'error'
    proposal_id: Optional[str] = None
    last_cycle: int = 0
    top_bond: Optional[Tuple[int, int, float]] = None  # (source, dest, strength)
    last_realignment: Optional[float] = None
    total_movements: int = 0
    error: Optional[str] = None


class TectonicHandler:
    """
    Handles tectonic proposals and communicates with Rust TectonicSimulator.

    Uses file-based IPC for simplicity and reliability. The Rust simulator
    polls for proposal.json and writes layout_delta.json when done.
    """

    STATE_DIR = Path(".geometry/tectonic")
    PROPOSAL_FILE = "proposal.json"
    DELTA_FILE = "layout_delta.json"
    STATUS_FILE = "status.json"

    def __init__(self, state_dir: Optional[Path] = None):
        self.state_dir = state_dir or self.STATE_DIR
        self.state_dir.mkdir(parents=True, exist_ok=True)

        self.status = TectonicStatus(state="idle")
        self._last_delta: Optional[LayoutDelta] = None

        logger.info(f"TectonicHandler initialized at {self.state_dir}")

    def process_proposal(self, proposal: Dict[str, Any]) -> bool:
        """
        Process a tectonic proposal from ConsensusEngine.

        Writes proposal to state directory for Rust simulator to process.
        The simulator will write layout_delta.json when complete.

        Args:
            proposal: TectonicProposal as dict with bonds, proposal_id, etc.

        Returns:
            True if proposal was written successfully
        """
        try:
            proposal_id = proposal.get("proposal_id", f"prop-{time.time():.0f}")
            bonds = proposal.get("bonds", [])

            logger.info(f"Processing proposal {proposal_id} with {len(bonds)} bonds")

            # Update status
            self.status.state = "processing"
            self.status.proposal_id = proposal_id
            self._write_status()

            # Write proposal for Rust
            proposal_data = {
                "proposal_id": proposal_id,
                "bonds": bonds,
                "expected_improvement": proposal.get("expected_improvement", 0),
                "pulse_count": proposal.get("pulse_count", 0),
                "timestamp": time.time(),
                "format_version": "1.0"
            }

            self._write_proposal(proposal_data)

            # Find top bond for status
            if bonds:
                top = max(bonds, key=lambda b: b.get("strength", 0))
                self.status.top_bond = (
                    top.get("source", 0),
                    top.get("dest", 0),
                    top.get("strength", 0)
                )

            return True

        except Exception as e:
            logger.error(f"Failed to process proposal: {e}")
            self.status.state = "error"
            self.status.error = str(e)
            self._write_status()
            return False

    def read_layout_delta(self) -> Optional[LayoutDelta]:
        """
        Read layout delta from Rust TectonicSimulator.

        Returns:
            LayoutDelta if available, None otherwise
        """
        delta_path = self.state_dir / self.DELTA_FILE

        if not delta_path.exists():
            return None

        try:
            with open(delta_path, "r") as f:
                data = json.load(f)

            delta = LayoutDelta.from_dict(data)
            self._last_delta = delta

            # Update status
            self.status.state = "complete"
            self.status.last_cycle = delta.cycle
            self.status.total_movements += len(delta.movements)
            self.status.last_realignment = time.time()
            self._write_status()

            logger.info(
                f"Read layout delta: {len(delta.movements)} movements, "
                f"bond_strength={delta.bond_strength:.2f}"
            )

            return delta

        except Exception as e:
            logger.error(f"Failed to read layout delta: {e}")
            return None

    def get_status(self) -> Dict[str, Any]:
        """Get current tectonic status."""
        return {
            "state": self.status.state,
            "proposal_id": self.status.proposal_id,
            "last_cycle": self.status.last_cycle,
            "top_bond": list(self.status.top_bond) if self.status.top_bond else None,
            "last_realignment": self.status.last_realignment,
            "total_movements": self.status.total_movements,
            "error": self.status.error
        }

    def get_last_delta(self) -> Optional[LayoutDelta]:
        """Get the most recent layout delta."""
        return self._last_delta

    def _write_proposal(self, data: Dict[str, Any]):
        """Write proposal to state directory."""
        path = self.state_dir / self.PROPOSAL_FILE
        with open(path, "w") as f:
            json.dump(data, f, indent=2)

    def _write_status(self):
        """Write status to state directory."""
        path = self.state_dir / self.STATUS_FILE
        status_data = self.get_status()
        status_data["timestamp"] = time.time()
        with open(path, "w") as f:
            json.dump(status_data, f, indent=2)

    def simulate_delta(self, proposal: Dict[str, Any]) -> LayoutDelta:
        """
        Simulate a layout delta (for testing without Rust).

        Creates a mock LayoutDelta with small random movements.
        """
        import random
        import math

        proposal_id = proposal.get("proposal_id", f"sim-{time.time():.0f}")
        bonds = proposal.get("bonds", [])

        # Extract unique tile IDs
        tile_ids = set()
        for bond in bonds:
            tile_ids.add(bond.get("source", 0))
            tile_ids.add(bond.get("dest", 0))

        # Generate small movements
        movements = []
        for tile_id in tile_ids:
            old_x = random.randint(0, 100)
            old_y = random.randint(0, 100)
            # Small random shift (1-5 pixels)
            new_x = old_x + random.randint(-5, 5)
            new_y = old_y + random.randint(-5, 5)

            movements.append(TileMovement(
                tile_id=tile_id,
                old_x=old_x,
                old_y=old_y,
                new_x=max(0, new_x),
                new_y=max(0, new_y)
            ))

        return LayoutDelta(
            proposal_id=proposal_id,
            movements=movements,
            bond_strength=sum(b.get("strength", 0) for b in bonds) / max(len(bonds), 1),
            cycle=random.randint(1, 100),
            processing_time_ms=random.uniform(10, 50)
        )


# Standalone function for Visual Bridge integration
def create_tectonic_handler(state_dir: Optional[Path] = None) -> TectonicHandler:
    """Factory function for creating TectonicHandler."""
    return TectonicHandler(state_dir)


if __name__ == "__main__":
    # Demo
    handler = TectonicHandler()

    # Simulate a proposal
    proposal = {
        "proposal_id": "demo-001",
        "bonds": [
            {"source": 1, "dest": 2, "strength": 0.9, "volume": 10},
            {"source": 2, "dest": 3, "strength": 0.7, "volume": 8},
            {"source": 1, "dest": 3, "strength": 0.5, "volume": 5},
        ],
        "expected_improvement": 25.0,
        "pulse_count": 100
    }

    print("Processing proposal...")
    handler.process_proposal(proposal)

    print("Status:", json.dumps(handler.get_status(), indent=2))

    # Simulate delta (would normally come from Rust)
    delta = handler.simulate_delta(proposal)
    print("\nSimulated delta:", json.dumps(delta.to_dict(), indent=2))
