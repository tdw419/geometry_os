"""Application Header parsing for Spatial Program Coordinator.

Every glyph program declares spatial requirements in the first 16 bytes.
Code execution begins at byte 16 - the header is never executed.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
Section: 2. Application Header
"""

from dataclasses import dataclass
from typing import Union

from systems.spatial_coordinator.types import CapabilityFlags


# Header occupies bytes 0-15 (16 bytes total)
HEADER_SIZE = 16

# Magic signature for Geometry OS applications
MAGIC_SIGNATURE = b"GEOS"


class InvalidHeaderError(Exception):
    """Raised when an application header is malformed or invalid."""

    pass


@dataclass
class AppHeader:
    """Parsed application header from a glyph program.

    Header Structure (16 bytes):
    | Offset | Size | Field           | Description          |
    |--------|------|-----------------|----------------------|
    | 0      | 4    | MAGIC           | "GEOS" signature     |
    | 4-5    | 2    | WIDTH           | Grid columns         |
    | 6-7    | 2    | HEIGHT          | Grid rows            |
    | 8-9    | 2    | MEM_SIZE        | Local memory slots   |
    | 10-11  | 2    | ENTRY_POINT     | Start coord (x,y) packed as x | (y << 8) |
    | 12-13  | 2    | HANDLER_TABLE   | Offset to handlers   |
    | 14-15  | 2    | FLAGS           | Capabilities         |
    """

    magic: str
    width: int
    height: int
    mem_size: int
    entry_x: int
    entry_y: int
    handler_table_offset: int
    flags: int

    @classmethod
    def parse(cls, data: bytes) -> "AppHeader":
        """Parse a 16-byte application header from raw bytes.

        Args:
            data: Raw bytes containing the header (must be >= 16 bytes)

        Returns:
            Parsed AppHeader instance

        Raises:
            InvalidHeaderError: If data is too short or magic is invalid
        """
        if len(data) < HEADER_SIZE:
            raise InvalidHeaderError(
                f"Header too short: expected {HEADER_SIZE} bytes, got {len(data)}"
            )

        # Parse magic (bytes 0-3)
        magic_bytes = data[0:4]
        if magic_bytes != MAGIC_SIGNATURE:
            raise InvalidHeaderError(
                f"Invalid magic: expected {MAGIC_SIGNATURE!r}, got {magic_bytes!r}"
            )

        # Parse little-endian u16 values
        width = int.from_bytes(data[4:6], "little")
        height = int.from_bytes(data[6:8], "little")
        mem_size = int.from_bytes(data[8:10], "little")

        # Unpack entry point: x | (y << 8)
        entry_packed = int.from_bytes(data[10:12], "little")
        entry_x = entry_packed & 0xFF
        entry_y = (entry_packed >> 8) & 0xFF

        handler_table_offset = int.from_bytes(data[12:14], "little")
        flags = int.from_bytes(data[14:16], "little")

        return cls(
            magic="GEOS",
            width=width,
            height=height,
            mem_size=mem_size,
            entry_x=entry_x,
            entry_y=entry_y,
            handler_table_offset=handler_table_offset,
            flags=flags,
        )

    def has_capability(self, flag: Union[CapabilityFlags, int]) -> bool:
        """Check if the application has a specific capability flag set.

        Args:
            flag: A CapabilityFlags enum value or integer bitmask

        Returns:
            True if the flag is set in the header's flags field
        """
        return bool(self.flags & int(flag))
