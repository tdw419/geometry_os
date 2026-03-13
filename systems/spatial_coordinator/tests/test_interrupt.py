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
