#!/usr/bin/env python3
"""
HeatAggregator - Collects access patterns and computes spatial heat map.

Integrates with:
- RISC-V GPU executor (memory access patterns)
- FUSE filesystem (file read/write events)
- Evolution daemon (mutation hotspots)
- Spatial Tectonics (rebalancing triggers)

Architecture:
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│ RISC-V Executor  │     │ HeatAggregator   │     │ Visual Bridge    │
│ FUSE Access      │ ──► │ record_access()  │ ──► │ _broadcast()     │
│ Evolution Daemon │     │ _update_loop()   │     │ heat_map_update  │
└──────────────────┘     └──────────────────┘     └──────────────────┘
                                │
                                ▼
                         .geometry/heat/
                           heat_state.json
"""

import asyncio
import json
import time
import logging
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple, TYPE_CHECKING, Any

import numpy as np

if TYPE_CHECKING:
    from .visual_bridge import VisualBridge
    from .vat_manager import VATManager

logger = logging.getLogger("heat_aggregator")

# Configuration constants
GRID_SIZE = 64  # 64x64 heat grid
DECAY_RATE = 0.95  # Per-second decay factor
HEAT_INCREMENT = 0.1  # Per-access increment
PERSISTENCE_PATH = Path(".geometry/heat/heat_state.json")
UPDATE_INTERVAL = 1.0  # Seconds between update cycles
PERSISTENCE_INTERVAL = 30  # Seconds between state saves


@dataclass
class HeatCell:
    """Single cell in the heat grid with detailed tracking."""
    value: float = 0.0
    access_count: int = 0
    last_access: float = 0.0
    sources: Dict[str, float] = field(default_factory=dict)  # source -> contribution

    def to_dict(self) -> Dict[str, Any]:
        return {
            "value": self.value,
            "access_count": self.access_count,
            "last_access": self.last_access,
            "sources": self.sources
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "HeatCell":
        return cls(
            value=data.get("value", 0.0),
            access_count=data.get("access_count", 0),
            last_access=data.get("last_access", 0.0),
            sources=data.get("sources", {})
        )


@dataclass
class HeatMap:
    """64x64 heat map with diffusion and decay."""

    grid: np.ndarray = field(default_factory=lambda: np.zeros((GRID_SIZE, GRID_SIZE), dtype=np.float32))
    last_update: float = field(default_factory=time.time)

    # Optional detailed cell tracking (disabled by default for performance)
    detailed_cells: Optional[Dict[Tuple[int, int], HeatCell]] = field(default=None)

    def __post_init__(self):
        """Initialize detailed cells if needed."""
        if self.detailed_cells is None:
            self.detailed_cells = {}

    def apply_decay(self, dt: float):
        """
        Apply temporal decay to all cells.

        Uses exponential decay: new_value = value * (DECAY_RATE ** dt)
        This creates a natural "cooling" effect over time.

        Args:
            dt: Time elapsed since last update in seconds
        """
        decay_factor = DECAY_RATE ** dt
        self.grid *= decay_factor

        # Also decay detailed cell values
        if self.detailed_cells:
            for cell in self.detailed_cells.values():
                cell.value *= decay_factor

    def add_heat(self, x: int, y: int, amount: float, source: str = "unknown"):
        """
        Add heat at specific coordinates.

        Heat is clamped to [0, 1] range to prevent overflow.

        Args:
            x: Grid X coordinate (0 to GRID_SIZE-1)
            y: Grid Y coordinate (0 to GRID_SIZE-1)
            amount: Heat amount to add (typically HEAT_INCREMENT)
            source: Source identifier for tracking (e.g., "riscv", "fuse", "evolution")
        """
        if 0 <= x < GRID_SIZE and 0 <= y < GRID_SIZE:
            # Add heat with clamping
            self.grid[y, x] = min(1.0, self.grid[y, x] + amount)

            # Track in detailed cells if enabled
            if self.detailed_cells is not None:
                key = (x, y)
                if key not in self.detailed_cells:
                    self.detailed_cells[key] = HeatCell()

                cell = self.detailed_cells[key]
                cell.value = self.grid[y, x]
                cell.access_count += 1
                cell.last_access = time.time()
                cell.sources[source] = cell.sources.get(source, 0.0) + amount

    def diffuse(self, iterations: int = 1):
        """
        Apply heat diffusion (blur) for smooth visualization.

        Uses a 3x3 Gaussian-like kernel for heat spreading:
        [[0.05, 0.1, 0.05],
         [0.1,  0.4, 0.1 ],
         [0.05, 0.1, 0.05]]

        Args:
            iterations: Number of diffusion iterations (more = smoother)
        """
        kernel = np.array([
            [0.05, 0.1, 0.05],
            [0.1, 0.4, 0.1],
            [0.05, 0.1, 0.05]
        ], dtype=np.float32)

        for _ in range(iterations):
            # Pad with edge values for boundary handling
            padded = np.pad(self.grid, 1, mode='edge')
            new_grid = np.zeros_like(self.grid)

            # Apply convolution
            for dy in range(3):
                for dx in range(3):
                    new_grid += padded[dy:dy + GRID_SIZE, dx:dx + GRID_SIZE] * kernel[dy, dx]

            self.grid = new_grid

    def get_hotspots(self, threshold: float = 0.7) -> List[Tuple[int, int, float]]:
        """
        Return cells above threshold as hotspots.

        Hotspots are sorted by intensity in descending order.

        Args:
            threshold: Minimum heat value to be considered a hotspot (0.0 to 1.0)

        Returns:
            List of (x, y, intensity) tuples sorted by intensity
        """
        hotspots = []
        for y in range(GRID_SIZE):
            for x in range(GRID_SIZE):
                if self.grid[y, x] >= threshold:
                    hotspots.append((x, y, float(self.grid[y, x])))

        return sorted(hotspots, key=lambda h: h[2], reverse=True)

    def get_total_heat(self) -> float:
        """Get total heat across all cells."""
        return float(np.sum(self.grid))

    def get_average_heat(self) -> float:
        """Get average heat per cell."""
        return float(np.mean(self.grid))

    def get_max_heat(self) -> Tuple[int, int, float]:
        """Get coordinates and value of hottest cell."""
        idx = np.argmax(self.grid)
        y, x = np.unravel_index(idx, self.grid.shape)
        return (int(x), int(y), float(self.grid[y, x]))

    def to_dict(self) -> Dict[str, Any]:
        """Serialize heat map to dictionary."""
        return {
            "grid": self.grid.tolist(),
            "last_update": self.last_update,
            "grid_size": GRID_SIZE
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "HeatMap":
        """Deserialize heat map from dictionary."""
        grid_data = data.get("grid", [])
        if grid_data:
            grid = np.array(grid_data, dtype=np.float32)
        else:
            grid = np.zeros((GRID_SIZE, GRID_SIZE), dtype=np.float32)

        return cls(
            grid=grid,
            last_update=data.get("last_update", time.time())
        )


class HeatAggregator:
    """
    Central heat map aggregator with WebSocket broadcast.

    The HeatAggregator collects access patterns from multiple sources
    (RISC-V execution, FUSE filesystem, Evolution Daemon) and maintains
    a 64x64 heat map that decays and diffuses over time.

    Usage:
        bridge = VisualBridge()
        vat_manager = VATManager()
        aggregator = HeatAggregator(bridge, vat_manager)
        await aggregator.start()

        # Record access events
        aggregator.record_access(10, 20, "riscv")
        aggregator.record_memory_access(0x1000, "riscv")

        # Stop when done
        await aggregator.stop()
    """

    def __init__(self, bridge: "VisualBridge", vat_manager: "VATManager"):
        """
        Initialize HeatAggregator.

        Args:
            bridge: VisualBridge instance for WebSocket broadcasting
            vat_manager: VATManager for coordinate lookups
        """
        self.bridge = bridge
        self.vat_manager = vat_manager
        self.heat_map = HeatMap()
        self._running = False
        self._task: Optional[asyncio.Task] = None
        self._last_persist_time = time.time()

        # Statistics
        self.total_accesses = 0
        self.accesses_by_source: Dict[str, int] = {}

        # Load persisted state
        self._load_state()

        logger.info(f"HeatAggregator initialized (grid_size={GRID_SIZE})")

    def _load_state(self):
        """Load persisted heat state from disk."""
        if PERSISTENCE_PATH.exists():
            try:
                data = json.loads(PERSISTENCE_PATH.read_text())
                self.heat_map = HeatMap.from_dict(data)
                self.total_accesses = data.get("total_accesses", 0)
                self.accesses_by_source = data.get("accesses_by_source", {})
                logger.info(f"Loaded heat state: {self.total_accesses} total accesses")
            except Exception as e:
                logger.warning(f"Failed to load heat state: {e}")

    def _save_state(self):
        """Persist heat state to disk."""
        try:
            PERSISTENCE_PATH.parent.mkdir(parents=True, exist_ok=True)
            data = {
                "grid": self.heat_map.grid.tolist(),
                "last_update": self.heat_map.last_update,
                "total_accesses": self.total_accesses,
                "accesses_by_source": self.accesses_by_source
            }
            PERSISTENCE_PATH.write_text(json.dumps(data))
            logger.debug("Saved heat state to disk")
        except Exception as e:
            logger.error(f"Failed to save heat state: {e}")

    async def start(self):
        """Start the heat aggregation loop."""
        if self._running:
            logger.warning("HeatAggregator already running")
            return

        self._running = True
        self._task = asyncio.create_task(self._update_loop())
        logger.info("HeatAggregator started")

    async def stop(self):
        """Stop aggregation and persist state."""
        self._running = False
        if self._task:
            self._task.cancel()
            try:
                await self._task
            except asyncio.CancelledError:
                pass
            self._task = None

        self._save_state()
        logger.info("HeatAggregator stopped")

    async def _update_loop(self):
        """
        Periodic update loop: decay, diffuse, broadcast.

        Runs at UPDATE_INTERVAL (1 second) frequency.
        """
        while self._running:
            try:
                now = time.time()
                dt = now - self.heat_map.last_update

                # Apply temporal decay
                self.heat_map.apply_decay(dt)

                # Diffuse for smooth visualization
                self.heat_map.diffuse(iterations=1)

                # Broadcast update to connected clients
                await self._broadcast_update()

                self.heat_map.last_update = now

                # Persist state periodically
                if now - self._last_persist_time >= PERSISTENCE_INTERVAL:
                    self._save_state()
                    self._last_persist_time = now

                await asyncio.sleep(UPDATE_INTERVAL)

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error in update loop: {e}")
                await asyncio.sleep(1.0)

    async def _broadcast_update(self):
        """
        Broadcast heat map to connected WebSocket clients.

        Message format:
        {
            "type": "heat_map_update",
            "data": {
                "grid": "<hex-encoded float32 bytes>",
                "grid_shape": [64, 64],
                "timestamp": 1234567890.123,
                "hotspots": [{"x": 10, "y": 20, "intensity": 0.85}, ...],
                "stats": {
                    "total_heat": 12.34,
                    "avg_heat": 0.03,
                    "max_heat": {"x": 32, "y": 32, "value": 0.95},
                    "hotspot_count": 5
                }
            }
        }
        """
        hotspots = self.heat_map.get_hotspots()

        # Get statistics
        max_x, max_y, max_val = self.heat_map.get_max_heat()

        message = {
            "type": "heat_map_update",
            "data": {
                # Compact hex encoding of float32 grid
                "grid": self.heat_map.grid.tobytes().hex(),
                "grid_shape": [GRID_SIZE, GRID_SIZE],
                "timestamp": time.time(),
                # Top 10 hotspots for quick access
                "hotspots": [
                    {"x": x, "y": y, "intensity": i}
                    for x, y, i in hotspots[:10]
                ],
                "stats": {
                    "total_heat": self.heat_map.get_total_heat(),
                    "avg_heat": self.heat_map.get_average_heat(),
                    "max_heat": {"x": max_x, "y": max_y, "value": max_val},
                    "hotspot_count": len(hotspots),
                    "total_accesses": self.total_accesses
                }
            }
        }

        # Use the bridge's broadcast method
        await self.bridge._broadcast(message)

    def record_access(self, hilbert_x: int, hilbert_y: int, source: str = "unknown"):
        """
        Record an access event at the given Hilbert coordinates.

        Coordinates are mapped to the 64x64 grid using modulo.
        This is appropriate for the fractal nature of Hilbert curves.

        Args:
            hilbert_x: X coordinate in Hilbert space
            hilbert_y: Y coordinate in Hilbert space
            source: Source identifier (e.g., "riscv", "fuse", "evolution")
        """
        # Map to grid coordinates
        grid_x = hilbert_x % GRID_SIZE
        grid_y = hilbert_y % GRID_SIZE

        self.heat_map.add_heat(grid_x, grid_y, HEAT_INCREMENT, source)

        # Update statistics
        self.total_accesses += 1
        self.accesses_by_source[source] = self.accesses_by_source.get(source, 0) + 1

        logger.debug(f"Recorded access at ({grid_x}, {grid_y}) from {source}")

    def record_memory_access(self, address: int, source: str = "riscv"):
        """
        Record a memory access by linear address.

        Linear addresses are converted to grid coordinates using
        a simple division scheme. Each 4-byte word maps to a cell.

        Args:
            address: Linear memory address
            source: Source identifier (default: "riscv")
        """
        # Simple linear-to-grid mapping
        # Each 4-byte word gets a unique position, wrapped to grid
        word_address = address // 4
        grid_x = word_address % GRID_SIZE
        grid_y = (word_address // GRID_SIZE) % GRID_SIZE

        self.heat_map.add_heat(grid_x, grid_y, HEAT_INCREMENT, source)

        # Update statistics
        self.total_accesses += 1
        self.accesses_by_source[source] = self.accesses_by_source.get(source, 0) + 1

        logger.debug(f"Recorded memory access at 0x{address:x} -> ({grid_x}, {grid_y})")

    def get_heat_at(self, x: int, y: int) -> float:
        """
        Get current heat value at coordinates.

        Args:
            x: Grid X coordinate
            y: Grid Y coordinate

        Returns:
            Heat value (0.0 to 1.0), or 0.0 if out of bounds
        """
        if 0 <= x < GRID_SIZE and 0 <= y < GRID_SIZE:
            return float(self.heat_map.grid[y, x])
        return 0.0

    def get_stats(self) -> Dict[str, Any]:
        """
        Get aggregator statistics.

        Returns:
            Dict with total_heat, avg_heat, max_heat, total_accesses, etc.
        """
        max_x, max_y, max_val = self.heat_map.get_max_heat()
        hotspots = self.heat_map.get_hotspots()

        return {
            "total_heat": self.heat_map.get_total_heat(),
            "average_heat": self.heat_map.get_average_heat(),
            "max_heat": {"x": max_x, "y": max_y, "value": max_val},
            "hotspot_count": len(hotspots),
            "total_accesses": self.total_accesses,
            "accesses_by_source": self.accesses_by_source,
            "grid_size": GRID_SIZE,
            "running": self._running,
            "last_update": self.heat_map.last_update
        }

    def clear(self):
        """Reset the heat map to zero state."""
        self.heat_map = HeatMap()
        self.total_accesses = 0
        self.accesses_by_source = {}
        logger.info("Heat map cleared")

    def force_persist(self):
        """Force immediate state persistence."""
        self._save_state()


# Factory function for convenience
def create_heat_aggregator(bridge: "VisualBridge", vat_manager: "VATManager") -> HeatAggregator:
    """Create a HeatAggregator instance."""
    return HeatAggregator(bridge, vat_manager)


if __name__ == "__main__":
    # Demo / standalone test
    import sys

    print("HeatAggregator Demo")
    print("===================")
    print()

    # Create mock objects for demo
    class MockBridge:
        async def _broadcast(self, msg):
            print(f"Broadcast: {msg['type']}")
            if 'stats' in msg.get('data', {}):
                stats = msg['data']['stats']
                print(f"  Total heat: {stats['total_heat']:.2f}")
                print(f"  Avg heat: {stats['avg_heat']:.4f}")
                print(f"  Hotspots: {stats['hotspot_count']}")

    class MockVATManager:
        pass

    # Create aggregator
    bridge = MockBridge()
    vat = MockVATManager()
    aggregator = HeatAggregator(bridge, vat)

    print("Recording test accesses...")
    for i in range(20):
        aggregator.record_access(i * 3, i * 3, "test")

    print(f"\nHeat at (0, 0): {aggregator.get_heat_at(0, 0):.2f}")
    print(f"Heat at (30, 30): {aggregator.get_heat_at(30, 30):.2f}")
    print(f"Total accesses: {aggregator.total_accesses}")

    print("\nStatistics:")
    stats = aggregator.get_stats()
    for key, value in stats.items():
        print(f"  {key}: {value}")

    print("\nHotspots (threshold=0.1):")
    hotspots = aggregator.heat_map.get_hotspots(threshold=0.1)
    for x, y, intensity in hotspots[:5]:
        print(f"  ({x}, {y}): {intensity:.2f}")
