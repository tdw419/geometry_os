"""Tests for Application Header parsing.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
Section: 2. Application Header
"""

import pytest

from systems.spatial_coordinator.header import (
    HEADER_SIZE,
    InvalidHeaderError,
    AppHeader,
)
from systems.spatial_coordinator.types import CapabilityFlags


class TestHeaderConstants:
    """Test header size constant."""

    def test_header_size_is_16_bytes(self):
        """Header must be exactly 16 bytes per spec."""
        assert HEADER_SIZE == 16


class TestAppHeaderParse:
    """Test AppHeader.parse() method."""

    def test_parse_valid_header(self):
        """Parse a well-formed 16-byte header."""
        # Build header manually:
        # MAGIC = "GEOS" (4 bytes)
        # WIDTH = 64 (2 bytes, little-endian)
        # HEIGHT = 32 (2 bytes, little-endian)
        # MEM_SIZE = 256 (2 bytes, little-endian)
        # ENTRY_POINT = 0x0000 (x=0, y=0 packed as x | (y << 8))
        # HANDLER_TABLE = 0x0400 (offset 1024)
        # FLAGS = 0x0003 (KEYBOARD + MOUSE)
        data = (
            b"GEOS"  # Magic
            + (64).to_bytes(2, "little")  # Width
            + (32).to_bytes(2, "little")  # Height
            + (256).to_bytes(2, "little")  # Mem size
            + (0).to_bytes(2, "little")  # Entry point (0,0)
            + (1024).to_bytes(2, "little")  # Handler table offset
            + (0x0003).to_bytes(2, "little")  # Flags
        )
        assert len(data) == 16

        header = AppHeader.parse(data)

        assert header.magic == "GEOS"
        assert header.width == 64
        assert header.height == 32
        assert header.mem_size == 256
        assert header.entry_x == 0
        assert header.entry_y == 0
        assert header.handler_table_offset == 1024
        assert header.flags == 0x0003

    def test_parse_unpacked_entry_point(self):
        """Entry point is packed as x | (y << 8)."""
        # Entry point (3, 5) = 3 | (5 << 8) = 3 | 1280 = 1283
        entry_packed = 3 | (5 << 8)  # = 1283
        data = (
            b"GEOS"
            + (64).to_bytes(2, "little")
            + (32).to_bytes(2, "little")
            + (256).to_bytes(2, "little")
            + entry_packed.to_bytes(2, "little")  # Entry point (3, 5)
            + (0).to_bytes(2, "little")
            + (0).to_bytes(2, "little")
        )

        header = AppHeader.parse(data)

        assert header.entry_x == 3
        assert header.entry_y == 5

    def test_parse_with_extra_data(self):
        """Parse succeeds when data is longer than 16 bytes."""
        data = (
            b"GEOS"
            + (64).to_bytes(2, "little")
            + (32).to_bytes(2, "little")
            + (256).to_bytes(2, "little")
            + (0).to_bytes(2, "little")
            + (0).to_bytes(2, "little")
            + (0).to_bytes(2, "little")
            + b"\x00\x00\x00\x00"  # Extra code bytes
        )

        header = AppHeader.parse(data)

        assert header.magic == "GEOS"
        assert header.width == 64

    def test_parse_invalid_magic(self):
        """Raise InvalidHeaderError if magic is not 'GEOS'."""
        data = (
            b"XXXX"  # Wrong magic
            + (64).to_bytes(2, "little")
            + (32).to_bytes(2, "little")
            + (256).to_bytes(2, "little")
            + (0).to_bytes(2, "little")
            + (0).to_bytes(2, "little")
            + (0).to_bytes(2, "little")
        )

        with pytest.raises(InvalidHeaderError) as exc_info:
            AppHeader.parse(data)

        assert "magic" in str(exc_info.value).lower()

    def test_parse_too_short_data(self):
        """Raise InvalidHeaderError if data is less than 16 bytes."""
        data = b"GEOS\x40\x00\x20"  # Only 7 bytes

        with pytest.raises(InvalidHeaderError) as exc_info:
            AppHeader.parse(data)

        assert "too short" in str(exc_info.value).lower() or "16" in str(exc_info.value)

    def test_parse_empty_data(self):
        """Raise InvalidHeaderError for empty data."""
        with pytest.raises(InvalidHeaderError):
            AppHeader.parse(b"")


class TestAppHeaderHasCapability:
    """Test AppHeader.has_capability() method."""

    def test_has_capability_keyboard(self):
        """Check WANTS_KEYBOARD flag."""
        header = AppHeader(
            magic="GEOS",
            width=64,
            height=32,
            mem_size=256,
            entry_x=0,
            entry_y=0,
            handler_table_offset=0,
            flags=CapabilityFlags.WANTS_KEYBOARD,
        )

        assert header.has_capability(CapabilityFlags.WANTS_KEYBOARD) is True
        assert header.has_capability(CapabilityFlags.WANTS_MOUSE) is False

    def test_has_capability_multiple_flags(self):
        """Check combined flags (KEYBOARD + MOUSE)."""
        header = AppHeader(
            magic="GEOS",
            width=64,
            height=32,
            mem_size=256,
            entry_x=0,
            entry_y=0,
            handler_table_offset=0,
            flags=CapabilityFlags.WANTS_KEYBOARD | CapabilityFlags.WANTS_MOUSE,
        )

        assert header.has_capability(CapabilityFlags.WANTS_KEYBOARD) is True
        assert header.has_capability(CapabilityFlags.WANTS_MOUSE) is True
        assert header.has_capability(CapabilityFlags.WANTS_HOVER) is False

    def test_has_capability_no_flags(self):
        """Check when no capabilities are set."""
        header = AppHeader(
            magic="GEOS",
            width=64,
            height=32,
            mem_size=256,
            entry_x=0,
            entry_y=0,
            handler_table_offset=0,
            flags=0,
        )

        assert header.has_capability(CapabilityFlags.WANTS_KEYBOARD) is False
        assert header.has_capability(CapabilityFlags.WANTS_MOUSE) is False

    def test_has_capability_all_flags(self):
        """Check when all capabilities are set."""
        header = AppHeader(
            magic="GEOS",
            width=64,
            height=32,
            mem_size=256,
            entry_x=0,
            entry_y=0,
            handler_table_offset=0,
            flags=(
                CapabilityFlags.WANTS_KEYBOARD
                | CapabilityFlags.WANTS_MOUSE
                | CapabilityFlags.WANTS_HOVER
                | CapabilityFlags.CAN_RESIZE
                | CapabilityFlags.CAN_SPAWN
            ),
        )

        assert header.has_capability(CapabilityFlags.WANTS_KEYBOARD) is True
        assert header.has_capability(CapabilityFlags.WANTS_MOUSE) is True
        assert header.has_capability(CapabilityFlags.WANTS_HOVER) is True
        assert header.has_capability(CapabilityFlags.CAN_RESIZE) is True
        assert header.has_capability(CapabilityFlags.CAN_SPAWN) is True
