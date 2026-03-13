# Spatial Program Coordinator
# Geometry OS windowing system for GPU-native glyph applications

from systems.spatial_coordinator.allocator import (
    AllocationFailedError,
    AllocatedRegion,
    FreeRegion,
    RegionAllocator,
)
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
from systems.spatial_coordinator.syscall import (
    SyscallHandler,
    SyscallRequest,
)
from systems.spatial_coordinator.coordinator import Coordinator
from systems.spatial_coordinator.types import (
    CapabilityFlags,
    ErrorCode,
    InterruptType,
    SyscallID,
)

__all__ = [
    # Allocator
    "AllocationFailedError",
    "AllocatedRegion",
    "FreeRegion",
    "RegionAllocator",
    # Header
    "HEADER_SIZE",
    "InvalidHeaderError",
    "AppHeader",
    # Interrupt
    "MAX_PROPAGATION_TTL",
    "InterruptPacket",
    "get_neighbors",
    "propagate_interrupt",
    # Syscall
    "SyscallHandler",
    "SyscallRequest",
    # Coordinator
    "Coordinator",
    # Types
    "CapabilityFlags",
    "ErrorCode",
    "InterruptType",
    "SyscallID",
]
