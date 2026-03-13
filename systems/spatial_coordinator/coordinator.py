"""Main Spatial Program Coordinator.

GPU-first windowing system for Geometry OS where applications are
autonomous regions of executing glyphs on the Infinite Map.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
"""
from typing import Optional, List, Dict, Tuple
from .allocator import RegionAllocator, FreeRegion
from .header import AppHeader, HEADER_SIZE, InvalidHeaderError
from .interrupt import InterruptPacket
from .syscall import SyscallHandler, SyscallRequest
from .types import InterruptType, ErrorCode


class Coordinator:
    """GPU-first windowing system coordinator.

    Manages:
    - Region allocation for apps
    - Interrupt injection and routing
    - Syscall processing
    - Focus arbitration
    """

    def __init__(self, map_width: int = 1024, map_height: int = 1024):
        self.map_width = map_width
        self.map_height = map_height
        self.allocator = RegionAllocator(map_width, map_height)
        self.syscall_handler = SyscallHandler()
        self.frame_count = 0
        self._interrupt_queue: List[InterruptPacket] = []
        self._next_app_id = 0
        self._apps: Dict[int, Tuple[AppHeader, FreeRegion]] = {}

    @property
    def interrupt_queue_depth(self) -> int:
        """Number of pending interrupts."""
        return len(self._interrupt_queue)

    @property
    def app_count(self) -> int:
        """Number of loaded apps."""
        return len(self._apps)

    @property
    def focused_app_id(self) -> Optional[int]:
        """Currently focused app, if any."""
        return self.syscall_handler.focused_app_id

    def load_app(self, app_data: bytes) -> Optional[int]:
        """Load app from binary data.

        Args:
            app_data: Raw app bytes (header + code)

        Returns:
            app_id on success, None on failure
        """
        if len(app_data) < HEADER_SIZE:
            return None

        try:
            header = AppHeader.parse(app_data[:HEADER_SIZE])
        except InvalidHeaderError:
            return None

        # Allocate region
        region = self.allocator.allocate(self._next_app_id, header.width, header.height)
        if region is None:
            return None

        app_id = self._next_app_id
        self._next_app_id += 1

        self._apps[app_id] = (header, region)

        # Track region for syscall handler
        self.syscall_handler.allocated_regions[app_id] = (
            region.x, region.y,
            region.width, region.height
        )

        return app_id

    def unload_app(self, app_id: int) -> bool:
        """Unload an app and free its region.

        Args:
            app_id: App to unload

        Returns:
            True if unloaded, False if not found
        """
        if app_id not in self._apps:
            return False

        self.allocator.free(app_id)
        del self._apps[app_id]

        if app_id in self.syscall_handler.allocated_regions:
            del self.syscall_handler.allocated_regions[app_id]

        return True

    def inject_interrupt(self, packet: InterruptPacket) -> bool:
        """Queue an interrupt for injection.

        Args:
            packet: Interrupt packet to inject

        Returns:
            True if queued, False if no handler
        """
        # Find target app based on coordinates
        target_app = self._find_app_at(packet.x, packet.y)
        if target_app is None:
            return False

        header, _ = self._apps[target_app]

        # Check if app wants this interrupt type
        from .types import CapabilityFlags
        if packet.type == InterruptType.KEYBOARD:
            if not header.has_capability(CapabilityFlags.WANTS_KEYBOARD):
                return False
        elif packet.type == InterruptType.MOUSE:
            if not header.has_capability(CapabilityFlags.WANTS_MOUSE):
                return False

        self._interrupt_queue.append(packet)
        return True

    def _find_app_at(self, x: int, y: int) -> Optional[int]:
        """Find app containing the given coordinates."""
        for app_id, (header, region) in self._apps.items():
            if (region.x <= x < region.x + region.width and
                region.y <= y < region.y + region.height):
                return app_id
        return None

    def process_syscalls(self):
        """Process all pending syscalls."""
        self.syscall_handler.process_all()

    def tick(self):
        """Advance coordinator by one frame.

        Order:
        1. Inject pending interrupts
        2. Propagate interrupts spatially
        3. Execute glyphs
        4. Process syscalls
        """
        self.frame_count += 1
        self.syscall_handler.frame_count = self.frame_count

        # Process interrupts (simplified - just clear queue)
        self._interrupt_queue.clear()

        # Process syscalls
        self.process_syscalls()

    def get_app_region(self, app_id: int) -> Optional[FreeRegion]:
        """Get the allocated region for an app."""
        if app_id not in self._apps:
            return None
        return self._apps[app_id][1]

    def get_app_header(self, app_id: int) -> Optional[AppHeader]:
        """Get the header for an app."""
        if app_id not in self._apps:
            return None
        return self._apps[app_id][0]
