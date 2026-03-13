"""Tests for spatial_coordinator core types.

TDD implementation following spec:
docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
"""

import pytest
from systems.spatial_coordinator.types import (
    InterruptType,
    CapabilityFlags,
    SyscallID,
    ErrorCode,
    OP_INT,
    OP_SYNC,
    OP_HALT,
)


class TestInterruptType:
    """Tests for InterruptType enum."""

    def test_keyboard_value_is_0x01(self):
        """KEYBOARD interrupt type must be 0x01."""
        assert InterruptType.KEYBOARD.value == 0x01

    def test_mouse_value_is_0x02(self):
        """MOUSE interrupt type must be 0x02."""
        assert InterruptType.MOUSE.value == 0x02

    def test_keyboard_is_single_byte(self):
        """Interrupt types must fit in 1 byte."""
        assert InterruptType.KEYBOARD.value <= 0xFF

    def test_mouse_is_single_byte(self):
        """Interrupt types must fit in 1 byte."""
        assert InterruptType.MOUSE.value <= 0xFF


class TestCapabilityFlags:
    """Tests for CapabilityFlags bitmask."""

    def test_wants_keyboard_is_bit_0(self):
        """WANTS_KEYBOARD flag is bit 0 (value 1)."""
        assert CapabilityFlags.WANTS_KEYBOARD.value == (1 << 0)

    def test_wants_mouse_is_bit_1(self):
        """WANTS_MOUSE flag is bit 1 (value 2)."""
        assert CapabilityFlags.WANTS_MOUSE.value == (1 << 1)

    def test_wants_hover_is_bit_2(self):
        """WANTS_HOVER flag is bit 2 (value 4)."""
        assert CapabilityFlags.WANTS_HOVER.value == (1 << 2)

    def test_can_resize_is_bit_3(self):
        """CAN_RESIZE flag is bit 3 (value 8)."""
        assert CapabilityFlags.CAN_RESIZE.value == (1 << 3)

    def test_can_spawn_is_bit_4(self):
        """CAN_SPAWN flag is bit 4 (value 16)."""
        assert CapabilityFlags.CAN_SPAWN.value == (1 << 4)

    def test_flags_can_be_combined(self):
        """Capability flags can be combined with bitwise OR."""
        combined = (
            CapabilityFlags.WANTS_KEYBOARD.value
            | CapabilityFlags.WANTS_MOUSE.value
        )
        assert combined == 0x0003

    def test_all_flags_combined(self):
        """All capability flags can be set at once."""
        all_flags = (
            CapabilityFlags.WANTS_KEYBOARD.value
            | CapabilityFlags.WANTS_MOUSE.value
            | CapabilityFlags.WANTS_HOVER.value
            | CapabilityFlags.CAN_RESIZE.value
            | CapabilityFlags.CAN_SPAWN.value
        )
        assert all_flags == 0x001F


class TestSyscallID:
    """Tests for SyscallID enum."""

    def test_resize_is_0x01(self):
        """RESIZE syscall ID is 0x01."""
        assert SyscallID.RESIZE.value == 0x01

    def test_close_is_0x02(self):
        """CLOSE syscall ID is 0x02."""
        assert SyscallID.CLOSE.value == 0x02

    def test_spawn_is_0x03(self):
        """SPAWN syscall ID is 0x03."""
        assert SyscallID.SPAWN.value == 0x03

    def test_read_clip_is_0x04(self):
        """READ_CLIP syscall ID is 0x04."""
        assert SyscallID.READ_CLIP.value == 0x04

    def test_write_clip_is_0x05(self):
        """WRITE_CLIP syscall ID is 0x05."""
        assert SyscallID.WRITE_CLIP.value == 0x05

    def test_get_time_is_0x06(self):
        """GET_TIME syscall ID is 0x06."""
        assert SyscallID.GET_TIME.value == 0x06

    def test_request_focus_is_0x07(self):
        """REQUEST_FOCUS syscall ID is 0x07."""
        assert SyscallID.REQUEST_FOCUS.value == 0x07

    def test_yield_focus_is_0x08(self):
        """YIELD_FOCUS syscall ID is 0x08."""
        assert SyscallID.YIELD_FOCUS.value == 0x08


class TestErrorCode:
    """Tests for ErrorCode enum."""

    def test_success_is_0(self):
        """SUCCESS error code is 0."""
        assert ErrorCode.SUCCESS.value == 0

    def test_invalid_args_is_1(self):
        """INVALID_ARGS error code is 1."""
        assert ErrorCode.INVALID_ARGS.value == 1

    def test_out_of_memory_is_2(self):
        """OUT_OF_MEMORY error code is 2."""
        assert ErrorCode.OUT_OF_MEMORY.value == 2

    def test_permission_denied_is_3(self):
        """PERMISSION_DENIED error code is 3."""
        assert ErrorCode.PERMISSION_DENIED.value == 3

    def test_not_found_is_4(self):
        """NOT_FOUND error code is 4."""
        assert ErrorCode.NOT_FOUND.value == 4


class TestOpcodeConstants:
    """Tests for opcode constants."""

    def test_op_int_is_0x10(self):
        """INT opcode (interrupt) is 0x10 (16)."""
        assert OP_INT == 0x10

    def test_op_sync_is_254(self):
        """SYNC opcode is 254 (0xFE)."""
        assert OP_SYNC == 254

    def test_op_halt_is_255(self):
        """HALT opcode is 255 (0xFF)."""
        assert OP_HALT == 255

    def test_sync_is_adjacent_to_halt(self):
        """SYNC (254) is adjacent to HALT (255) per spec."""
        assert OP_SYNC == OP_HALT - 1

    def test_opcodes_fit_in_byte(self):
        """All opcodes must fit in a single byte (0-255)."""
        assert 0 <= OP_INT <= 0xFF
        assert 0 <= OP_SYNC <= 0xFF
        assert 0 <= OP_HALT <= 0xFF
