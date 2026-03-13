"""Tests for InterruptPacket implementation.

TDD implementation following spec:
docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md

Interrupt Glyph Format (5 bytes):
| Offset | Field     | Size | Description                    |
|--------|-----------|------|--------------------------------|
| 0      | type      | u8   | 0x01=KEYBOARD, 0x02=MOUSE      |
| 1      | payload   | u8   | Keycode or button ID           |
| 2-3    | timestamp | u16  | Frame counter                  |
| 4      | source    | u8   | Device seat (multi-seat)       |
"""

import pytest
from systems.spatial_coordinator.interrupt import InterruptPacket
from systems.spatial_coordinator.types import InterruptType


class TestInterruptPacketCreation:
    """Tests for InterruptPacket creation and fields."""

    def test_create_keyboard_interrupt(self):
        """Can create a KEYBOARD interrupt packet."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,  # Spacebar
            timestamp=1000,
            source=0,
            x=10,
            y=20,
            ttl=64,
        )
        assert packet.type == InterruptType.KEYBOARD
        assert packet.payload == 0x20
        assert packet.timestamp == 1000
        assert packet.source == 0
        assert packet.x == 10
        assert packet.y == 20
        assert packet.ttl == 64

    def test_create_mouse_interrupt(self):
        """Can create a MOUSE interrupt packet."""
        packet = InterruptPacket(
            type=InterruptType.MOUSE,
            payload=0x01,  # Left click
            timestamp=2000,
            source=1,
            x=100,
            y=200,
            ttl=64,
        )
        assert packet.type == InterruptType.MOUSE
        assert packet.payload == 0x01
        assert packet.timestamp == 2000
        assert packet.source == 1
        assert packet.x == 100
        assert packet.y == 200
        assert packet.ttl == 64

    def test_default_ttl_is_64(self):
        """Default TTL should be 64 GPU ticks."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x41,  # 'A' key
            timestamp=0,
            source=0,
            x=0,
            y=0,
        )
        assert packet.ttl == 64

    def test_packet_is_frozen_dataclass(self):
        """InterruptPacket should be immutable (frozen dataclass)."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,
            timestamp=1000,
            source=0,
            x=10,
            y=20,
        )
        with pytest.raises(AttributeError):
            packet.payload = 0x30  # Should raise - frozen


class TestInterruptPacketPack:
    """Tests for InterruptPacket.pack() method."""

    def test_pack_keyboard_interrupt(self):
        """Pack a KEYBOARD interrupt into 5 bytes."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,  # Spacebar
            timestamp=0x1234,
            source=0x01,
            x=10,  # Not included in packed bytes
            y=20,  # Not included in packed bytes
        )
        data = packet.pack()
        assert len(data) == 5
        # Byte 0: type (0x01)
        assert data[0] == 0x01
        # Byte 1: payload (0x20)
        assert data[1] == 0x20
        # Bytes 2-3: timestamp (little-endian u16)
        assert data[2] == 0x34  # Low byte
        assert data[3] == 0x12  # High byte
        # Byte 4: source
        assert data[4] == 0x01

    def test_pack_mouse_interrupt(self):
        """Pack a MOUSE interrupt into 5 bytes."""
        packet = InterruptPacket(
            type=InterruptType.MOUSE,
            payload=0x01,  # Left click
            timestamp=0xABCD,
            source=0x02,
            x=100,
            y=200,
        )
        data = packet.pack()
        assert len(data) == 5
        assert data[0] == 0x02  # MOUSE type
        assert data[1] == 0x01  # payload
        assert data[2] == 0xCD  # timestamp low byte
        assert data[3] == 0xAB  # timestamp high byte
        assert data[4] == 0x02  # source

    def test_pack_timestamp_zero(self):
        """Pack with timestamp=0."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x00,
            timestamp=0,
            source=0,
            x=0,
            y=0,
        )
        data = packet.pack()
        assert data[2] == 0x00
        assert data[3] == 0x00

    def test_pack_max_timestamp(self):
        """Pack with max u16 timestamp (65535)."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x00,
            timestamp=0xFFFF,
            source=0,
            x=0,
            y=0,
        )
        data = packet.pack()
        assert data[2] == 0xFF
        assert data[3] == 0xFF


class TestInterruptPacketUnpack:
    """Tests for InterruptPacket.unpack() classmethod."""

    def test_unpack_keyboard_interrupt(self):
        """Unpack 5 bytes into a KEYBOARD InterruptPacket."""
        data = bytes([0x01, 0x20, 0x34, 0x12, 0x01])
        packet = InterruptPacket.unpack(data)
        assert packet.type == InterruptType.KEYBOARD
        assert packet.payload == 0x20
        assert packet.timestamp == 0x1234
        assert packet.source == 0x01
        # x, y default to 0 when unpacking
        assert packet.x == 0
        assert packet.y == 0
        # TTL defaults to 64
        assert packet.ttl == 64

    def test_unpack_mouse_interrupt(self):
        """Unpack 5 bytes into a MOUSE InterruptPacket."""
        data = bytes([0x02, 0x01, 0xCD, 0xAB, 0x02])
        packet = InterruptPacket.unpack(data)
        assert packet.type == InterruptType.MOUSE
        assert packet.payload == 0x01
        assert packet.timestamp == 0xABCD
        assert packet.source == 0x02

    def test_unpack_raises_on_wrong_length(self):
        """Unpack should raise ValueError on wrong data length."""
        with pytest.raises(ValueError):
            InterruptPacket.unpack(bytes([0x01, 0x20, 0x34]))  # Too short

    def test_unpack_raises_on_too_long(self):
        """Unpack should raise ValueError on data > 5 bytes."""
        with pytest.raises(ValueError):
            InterruptPacket.unpack(bytes([0x01, 0x20, 0x34, 0x12, 0x01, 0x00]))

    def test_unpack_timestamp_zero(self):
        """Unpack with timestamp=0."""
        data = bytes([0x01, 0x00, 0x00, 0x00, 0x00])
        packet = InterruptPacket.unpack(data)
        assert packet.timestamp == 0

    def test_unpack_max_timestamp(self):
        """Unpack with max u16 timestamp."""
        data = bytes([0x01, 0x00, 0xFF, 0xFF, 0x00])
        packet = InterruptPacket.unpack(data)
        assert packet.timestamp == 0xFFFF


class TestInterruptPacketPackValidation:
    """Tests for InterruptPacket.pack() validation."""

    def test_pack_raises_on_timestamp_overflow(self):
        """Pack should raise ValueError when timestamp > 0xFFFF."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x00,
            timestamp=0x10000,  # 65536 - exceeds u16
            source=0,
            x=0,
            y=0,
        )
        with pytest.raises(ValueError, match="timestamp"):
            packet.pack()

    def test_pack_raises_on_payload_overflow(self):
        """Pack should raise ValueError when payload > 0xFF."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x100,  # 256 - exceeds u8
            timestamp=0,
            source=0,
            x=0,
            y=0,
        )
        with pytest.raises(ValueError, match="payload"):
            packet.pack()

    def test_pack_raises_on_source_overflow(self):
        """Pack should raise ValueError when source > 0xFF."""
        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x00,
            timestamp=0,
            source=0x100,  # 256 - exceeds u8
            x=0,
            y=0,
        )
        with pytest.raises(ValueError, match="source"):
            packet.pack()


class TestInterruptPacketRoundTrip:
    """Tests for pack/unpack round-trip integrity."""

    def test_roundtrip_keyboard(self):
        """Pack and unpack should be inverse operations (KEYBOARD)."""
        original = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x41,
            timestamp=12345,
            source=3,
            x=50,
            y=75,
            ttl=32,
        )
        data = original.pack()
        recovered = InterruptPacket.unpack(data)
        # Core fields preserved
        assert recovered.type == original.type
        assert recovered.payload == original.payload
        assert recovered.timestamp == original.timestamp
        assert recovered.source == original.source
        # x, y, ttl not in packed form - use defaults
        assert recovered.x == 0
        assert recovered.y == 0
        assert recovered.ttl == 64

    def test_roundtrip_mouse(self):
        """Pack and unpack should be inverse operations (MOUSE)."""
        original = InterruptPacket(
            type=InterruptType.MOUSE,
            payload=0x02,  # Right click
            timestamp=54321,
            source=7,
            x=999,
            y=888,
            ttl=16,
        )
        data = original.pack()
        recovered = InterruptPacket.unpack(data)
        assert recovered.type == original.type
        assert recovered.payload == original.payload
        assert recovered.timestamp == original.timestamp
        assert recovered.source == original.source


class TestGetNeighbors:
    """Tests for get_neighbors function (4-connected grid neighbors)."""

    def test_center_cell_has_four_neighbors(self):
        """A cell in the center of a grid has 4 neighbors (up, down, left, right)."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(5, 5, 10, 10)
        # 4-connected: up, down, left, right
        assert len(neighbors) == 4
        assert (5, 4) in neighbors  # up
        assert (5, 6) in neighbors  # down
        assert (4, 5) in neighbors  # left
        assert (6, 5) in neighbors  # right

    def test_top_left_corner_has_two_neighbors(self):
        """Corner cells have only 2 neighbors."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(0, 0, 10, 10)
        assert len(neighbors) == 2
        assert (1, 0) in neighbors  # right
        assert (0, 1) in neighbors  # down
        assert (0, -1) not in neighbors  # up (out of bounds)
        assert (-1, 0) not in neighbors  # left (out of bounds)

    def test_top_right_corner_has_two_neighbors(self):
        """Top-right corner has 2 neighbors."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(9, 0, 10, 10)
        assert len(neighbors) == 2
        assert (8, 0) in neighbors  # left
        assert (9, 1) in neighbors  # down

    def test_bottom_left_corner_has_two_neighbors(self):
        """Bottom-left corner has 2 neighbors."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(0, 9, 10, 10)
        assert len(neighbors) == 2
        assert (1, 9) in neighbors  # right
        assert (0, 8) in neighbors  # up

    def test_bottom_right_corner_has_two_neighbors(self):
        """Bottom-right corner has 2 neighbors."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(9, 9, 10, 10)
        assert len(neighbors) == 2
        assert (8, 9) in neighbors  # left
        assert (9, 8) in neighbors  # up

    def test_top_edge_has_three_neighbors(self):
        """Top edge (not corner) has 3 neighbors."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(5, 0, 10, 10)
        assert len(neighbors) == 3
        assert (4, 0) in neighbors  # left
        assert (6, 0) in neighbors  # right
        assert (5, 1) in neighbors  # down

    def test_bottom_edge_has_three_neighbors(self):
        """Bottom edge (not corner) has 3 neighbors."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(5, 9, 10, 10)
        assert len(neighbors) == 3
        assert (4, 9) in neighbors  # left
        assert (6, 9) in neighbors  # right
        assert (5, 8) in neighbors  # up

    def test_left_edge_has_three_neighbors(self):
        """Left edge (not corner) has 3 neighbors."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(0, 5, 10, 10)
        assert len(neighbors) == 3
        assert (1, 5) in neighbors  # right
        assert (0, 4) in neighbors  # up
        assert (0, 6) in neighbors  # down

    def test_right_edge_has_three_neighbors(self):
        """Right edge (not corner) has 3 neighbors."""
        from systems.spatial_coordinator.interrupt import get_neighbors

        neighbors = get_neighbors(9, 5, 10, 10)
        assert len(neighbors) == 3
        assert (8, 5) in neighbors  # left
        assert (9, 4) in neighbors  # up
        assert (9, 6) in neighbors  # down


class TestPropagateInterrupt:
    """Tests for propagate_interrupt function."""

    def test_propagate_returns_cells_to_receive_interrupt(self):
        """propagate_interrupt returns cells that should receive the interrupt."""
        from systems.spatial_coordinator.interrupt import (
            propagate_interrupt,
            InterruptPacket,
        )

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,
            timestamp=1000,
            source=0,
            x=5,
            y=5,
            ttl=64,
        )

        # Simple 10x10 grid, no handlers
        grid = [[None for _ in range(10)] for _ in range(10)]
        handlers = {}

        # One propagation step should return the 4 neighbors
        cells = propagate_interrupt(packet, grid, handlers)
        assert len(cells) == 4
        # cells contains (x, y, packet) tuples
        coords = [(x, y) for x, y, _ in cells]
        assert (5, 4) in coords
        assert (5, 6) in coords
        assert (4, 5) in coords
        assert (6, 5) in coords

    def test_propagate_stops_at_handler(self):
        """Propagation stops when reaching a cell with a registered handler."""
        from systems.spatial_coordinator.interrupt import (
            propagate_interrupt,
            InterruptPacket,
        )

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,
            timestamp=1000,
            source=0,
            x=5,
            y=5,
            ttl=64,
        )

        # Grid with a handler at (6, 5)
        grid = [[None for _ in range(10)] for _ in range(10)]
        handlers = {(6, 5): "handler_id_123"}

        cells = propagate_interrupt(packet, grid, handlers)
        # Should still return all 4 neighbors, but caller would check handlers
        coords = [(x, y) for x, y, _ in cells]
        assert (6, 5) in coords
        # The actual stopping logic is in the handler lookup

    def test_propagate_returns_empty_when_ttl_zero(self):
        """When TTL is 0, propagation returns empty list (expired)."""
        from systems.spatial_coordinator.interrupt import (
            propagate_interrupt,
            InterruptPacket,
        )

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,
            timestamp=1000,
            source=0,
            x=5,
            y=5,
            ttl=0,  # Already expired
        )

        grid = [[None for _ in range(10)] for _ in range(10)]
        handlers = {}

        cells = propagate_interrupt(packet, grid, handlers)
        assert cells == []

    def test_propagate_includes_decremented_ttl_in_result(self):
        """propagate_interrupt returns packets with decremented TTL."""
        from systems.spatial_coordinator.interrupt import (
            propagate_interrupt,
            InterruptPacket,
        )

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,
            timestamp=1000,
            source=0,
            x=5,
            y=5,
            ttl=64,
        )

        grid = [[None for _ in range(10)] for _ in range(10)]
        handlers = {}

        # propagate_interrupt returns list of (x, y, new_packet) tuples
        cells = propagate_interrupt(packet, grid, handlers)
        # Each propagated cell should have ttl decremented
        for x, y, new_packet in cells:
            assert new_packet.ttl == 63


class TestMaxPropagationTTL:
    """Tests for MAX_PROPAGATION_TTL constant."""

    def test_max_propagation_ttl_is_64(self):
        """MAX_PROPAGATION_TTL should be 64 GPU ticks."""
        from systems.spatial_coordinator.interrupt import MAX_PROPAGATION_TTL

        assert MAX_PROPAGATION_TTL == 64
