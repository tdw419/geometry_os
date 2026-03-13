"""Core types for Spatial Program Coordinator.

This module defines the fundamental types, constants, and opcodes used by
the Spatial Program Coordinator to manage GPU-native glyph applications.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
"""

from enum import IntEnum


class InterruptType(IntEnum):
    """Interrupt type identifiers (1-byte).

    Used in interrupt glyph packets to identify the event source.
    """

    KEYBOARD = 0x01
    MOUSE = 0x02


class CapabilityFlags(IntEnum):
    """Application capability flags (bitmask).

    Apps declare these in their header to request specific capabilities.
    Multiple flags can be combined with bitwise OR.
    """

    WANTS_KEYBOARD = 1 << 0  # Receive keyboard events
    WANTS_MOUSE = 1 << 1  # Receive mouse events
    WANTS_HOVER = 1 << 2  # Receive continuous hover stream
    CAN_RESIZE = 1 << 3  # Handle resize notifications
    CAN_SPAWN = 1 << 4  # Can spawn child processes


class SyscallID(IntEnum):
    """Syscall identifiers for SYNC opcode.

    Apps use these with the SYNC opcode to request coordinator services.
    """

    RESIZE = 0x01  # Request region resize
    CLOSE = 0x02  # Terminate self
    SPAWN = 0x03  # Spawn child app
    READ_CLIP = 0x04  # Read clipboard
    WRITE_CLIP = 0x05  # Write clipboard
    GET_TIME = 0x06  # Current frame
    REQUEST_FOCUS = 0x07  # Grab keyboard focus
    YIELD_FOCUS = 0x08  # Release focus


class ErrorCode(IntEnum):
    """Syscall return codes.

    Returned in R3 after SYNC to indicate success or failure.
    """

    SUCCESS = 0
    INVALID_ARGS = 1
    OUT_OF_MEMORY = 2
    PERMISSION_DENIED = 3
    NOT_FOUND = 4


# Opcode constants
OP_INT = 0x10  # Interrupt opcode (16)
OP_SYNC = 0xFE  # Sync/syscall opcode (254)
OP_HALT = 0xFF  # Halt opcode (255)

# Register indices for interrupt handling (per spec section "Register Conventions")
INT_PAYLOAD_REG = 29  # registers[29] = interrupt payload
INT_TYPE_REG = 30  # registers[30] = interrupt type
INT_SOURCE_REG = 31  # registers[31] = interrupt source
