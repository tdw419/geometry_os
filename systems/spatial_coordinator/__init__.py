# Spatial Program Coordinator
# Geometry OS windowing system for GPU-native glyph applications

from systems.spatial_coordinator.header import (
    HEADER_SIZE,
    InvalidHeaderError,
    AppHeader,
)
from systems.spatial_coordinator.interrupt import (
    MAX_PROPAGATION_TTL,
    InterruptPacket,
    get_neighbors,
    propagate_interrupt,
)
from systems.spatial_coordinator.types import (
    CapabilityFlags,
    ErrorCode,
    InterruptType,
    SyscallID,
)

__all__ = [
    # Header
    "HEADER_SIZE",
    "InvalidHeaderError",
    "AppHeader",
    # Interrupt
    "MAX_PROPAGATION_TTL",
    "InterruptPacket",
    "get_neighbors",
    "propagate_interrupt",
    # Types
    "CapabilityFlags",
    "ErrorCode",
    "InterruptType",
    "SyscallID",
]
