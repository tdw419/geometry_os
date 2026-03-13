"""Interrupt packet implementation for Spatial Program Coordinator.

Events (keyboard, mouse) are injected as spatial glyphs that propagate
until caught by a handler.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md

Interrupt Glyph Format (5 bytes):
| Offset | Field     | Size | Description                    |
|--------|-----------|------|--------------------------------|
| 0      | type      | u8   | 0x01=KEYBOARD, 0x02=MOUSE      |
| 1      | payload   | u8   | Keycode or button ID           |
| 2-3    | timestamp | u16  | Frame counter                  |
| 4      | source    | u8   | Device seat (multi-seat)       |

Propagation Limits:
- Max TTL: 64 GPU ticks (prevents infinite loops)
- No handler found: INT expires after TTL, discarded silently
"""

from __future__ import annotations

from dataclasses import dataclass, replace
from typing import ClassVar, Dict, List, Tuple

from systems.spatial_coordinator.types import InterruptType

# Constants
MAX_PROPAGATION_TTL = 64  # Max GPU ticks for interrupt propagation


def get_neighbors(x: int, y: int, grid_width: int, grid_height: int) -> List[Tuple[int, int]]:
    """Get 4-connected neighbors of a cell within grid bounds.

    Args:
        x: X coordinate of the cell
        y: Y coordinate of the cell
        grid_width: Width of the grid
        grid_height: Height of the grid

    Returns:
        List of (x, y) tuples for valid neighbors (up, down, left, right).
        Only returns coordinates within bounds (0 <= x < width, 0 <= y < height).
    """
    neighbors = []
    # 4-connected: up, down, left, right
    directions = [(0, -1), (0, 1), (-1, 0), (1, 0)]

    for dx, dy in directions:
        nx, ny = x + dx, y + dy
        if 0 <= nx < grid_width and 0 <= ny < grid_height:
            neighbors.append((nx, ny))

    return neighbors


def propagate_interrupt(
    packet: InterruptPacket,
    grid: List[List],
    handlers: Dict[Tuple[int, int], str],
) -> List[Tuple[int, int, InterruptPacket]]:
    """Propagate an interrupt to neighboring cells.

    This is a simplified Python implementation for testing. In the actual
    GPU shader, this would spread one cell per GPU tick.

    Args:
        packet: The interrupt packet to propagate
        grid: 2D grid (used for bounds checking)
        handlers: Dict mapping (x, y) to handler IDs for cells with @INT_HANDLER

    Returns:
        List of (x, y, new_packet) tuples for cells that should receive
        the interrupt. Each new_packet has TTL decremented by 1.
        Returns empty list if TTL is 0 (expired).
    """
    if packet.ttl <= 0:
        return []

    grid_height = len(grid)
    grid_width = len(grid[0]) if grid_height > 0 else 0

    neighbors = get_neighbors(packet.x, packet.y, grid_width, grid_height)

    # Create new packets with decremented TTL
    result = []
    for nx, ny in neighbors:
        new_packet = replace(packet, x=nx, y=ny, ttl=packet.ttl - 1)
        result.append((nx, ny, new_packet))

    return result


@dataclass(frozen=True)
class InterruptPacket:
    """A spatial interrupt packet that propagates through the glyph grid.

    Wire Format (5 bytes): type, payload, timestamp (u16 LE), source.
    The x, y coordinates are NOT part of the wire format - they are runtime-only
    fields used for spatial routing and injection positioning. When unpacking,
    x and y default to 0; the coordinator sets them during spatial placement.

    Attributes:
        type: Interrupt type (KEYBOARD=0x01, MOUSE=0x02)
        payload: Keycode or button ID
        timestamp: Frame counter when interrupt was created
        source: Device seat ID for multi-seat support
        x: X coordinate in the infinite map (runtime-only, not in packed format)
        y: Y coordinate in the infinite map (runtime-only, not in packed format)
        ttl: Time-to-live in GPU ticks (default 64)
    """

    type: InterruptType
    payload: int
    timestamp: int
    source: int
    x: int = 0
    y: int = 0
    ttl: int = 64

    # Class constants
    MAX_TTL: ClassVar[int] = 64
    PACKET_SIZE: ClassVar[int] = 5

    def pack(self) -> bytes:
        """Pack the interrupt into a 5-byte binary format.

        The packed format includes type, payload, timestamp, and source.
        Spatial coordinates (x, y) and ttl are NOT included in the packed
        format as they are managed by the spatial coordinator.

        Returns:
            5-byte packed interrupt data.

        Raises:
            ValueError: If any field exceeds its byte range.
        """
        # Validate ranges
        if not (0 <= self.type <= 0xFF):
            raise ValueError(f"type must fit in 1 byte, got {self.type}")
        if not (0 <= self.payload <= 0xFF):
            raise ValueError(f"payload must fit in 1 byte, got {self.payload}")
        if not (0 <= self.timestamp <= 0xFFFF):
            raise ValueError(f"timestamp must fit in 2 bytes, got {self.timestamp}")
        if not (0 <= self.source <= 0xFF):
            raise ValueError(f"source must fit in 1 byte, got {self.source}")

        # Pack in little-endian format
        return bytes([
            self.type & 0xFF,              # Byte 0: type
            self.payload & 0xFF,           # Byte 1: payload
            self.timestamp & 0xFF,         # Byte 2: timestamp low
            (self.timestamp >> 8) & 0xFF,  # Byte 3: timestamp high
            self.source & 0xFF,            # Byte 4: source
        ])

    @classmethod
    def unpack(cls, data: bytes) -> InterruptPacket:
        """Unpack 5 bytes into an InterruptPacket.

        Args:
            data: 5-byte packed interrupt data.

        Returns:
            New InterruptPacket with unpacked fields.
            x, y default to 0; ttl defaults to MAX_TTL (64).

        Raises:
            ValueError: If data is not exactly 5 bytes.
        """
        if len(data) != cls.PACKET_SIZE:
            raise ValueError(
                f"Expected {cls.PACKET_SIZE} bytes, got {len(data)}"
            )

        int_type = InterruptType(data[0])
        payload = data[1]
        timestamp = data[2] | (data[3] << 8)  # Little-endian u16
        source = data[4]

        return cls(
            type=int_type,
            payload=payload,
            timestamp=timestamp,
            source=source,
            x=0,  # Spatial coordinates not in packed form
            y=0,
            ttl=cls.MAX_TTL,  # Default TTL
        )
