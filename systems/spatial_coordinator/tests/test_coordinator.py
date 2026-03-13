"""Integration tests for Spatial Coordinator."""
import pytest
from systems.spatial_coordinator.coordinator import Coordinator
from systems.spatial_coordinator.interrupt import InterruptPacket
from systems.spatial_coordinator.syscall import SyscallRequest
from systems.spatial_coordinator.types import InterruptType, SyscallID, CapabilityFlags


def make_app_bytes(width: int = 16, height: int = 16, flags: int = 0x01) -> bytes:
    """Create a minimal valid app binary."""
    header = (
        b'GEOS'  # Magic (4 bytes)
        + width.to_bytes(2, 'little')   # Width
        + height.to_bytes(2, 'little')  # Height
        + b'\x40\x00'  # Mem size: 64
        + b'\x00\x00'  # Entry point: (0, 0)
        + b'\x00\x00'  # Handler table offset: 0
        + flags.to_bytes(2, 'little')  # Flags
    )
    # Pad with zeros for code section
    return header + b'\x00' * (width * height)


class TestCoordinatorCreation:
    """Test coordinator initialization."""

    def test_default_map_size(self):
        """Default map should be 1024x1024."""
        coordinator = Coordinator()
        assert coordinator.map_width == 1024
        assert coordinator.map_height == 1024

    def test_custom_map_size(self):
        """Should accept custom map dimensions."""
        coordinator = Coordinator(map_width=2048, map_height=512)
        assert coordinator.map_width == 2048
        assert coordinator.map_height == 512

    def test_initial_state(self):
        """Initial state should be empty."""
        coordinator = Coordinator()
        assert coordinator.app_count == 0
        assert coordinator.frame_count == 0
        assert coordinator.interrupt_queue_depth == 0


class TestLoadApp:
    """Test app loading."""

    def test_load_valid_app(self):
        """Should load a valid app and return app_id."""
        coordinator = Coordinator()
        app_data = make_app_bytes()

        app_id = coordinator.load_app(app_data)

        assert app_id is not None
        assert app_id == 0
        assert coordinator.app_count == 1

    def test_load_multiple_apps(self):
        """Should assign sequential app_ids."""
        coordinator = Coordinator()

        id1 = coordinator.load_app(make_app_bytes())
        id2 = coordinator.load_app(make_app_bytes())
        id3 = coordinator.load_app(make_app_bytes())

        assert all([id1 is not None, id2 is not None, id3 is not None])
        assert len(set([id1, id2, id3])) == 3
        assert coordinator.app_count == 3

    def test_load_rejects_invalid_magic(self):
        """Should reject apps without GEOS magic."""
        coordinator = Coordinator()
        bad_data = b'XXXX' + b'\x00' * 12

        app_id = coordinator.load_app(bad_data)

        assert app_id is None
        assert coordinator.app_count == 0

    def test_load_rejects_too_short(self):
        """Should reject data shorter than header size."""
        coordinator = Coordinator()

        app_id = coordinator.load_app(b'GEOS')

        assert app_id is None

    def test_unload_app(self):
        """Should unload app and free region."""
        coordinator = Coordinator()
        app_id = coordinator.load_app(make_app_bytes())

        result = coordinator.unload_app(app_id)

        assert result is True
        assert coordinator.app_count == 0


class TestInjectInterrupt:
    """Test interrupt injection."""

    def test_inject_keyboard_interrupt(self):
        """Should queue keyboard interrupt."""
        coordinator = Coordinator()
        coordinator.load_app(make_app_bytes(flags=0x01))  # WANTS_KEYBOARD

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,  # spacebar
            timestamp=1,
            source=0,
            x=0,
            y=0,
        )

        result = coordinator.inject_interrupt(packet)

        assert result is True
        assert coordinator.interrupt_queue_depth == 1

    def test_inject_to_non_keyboard_app_rejected(self):
        """Should reject keyboard interrupt if app doesn't want it."""
        coordinator = Coordinator()
        coordinator.load_app(make_app_bytes(flags=0x02))  # WANTS_MOUSE only

        packet = InterruptPacket(
            type=InterruptType.KEYBOARD,
            payload=0x20,
            timestamp=1,
            source=0,
            x=0,
            y=0,
        )

        result = coordinator.inject_interrupt(packet)

        assert result is False
        assert coordinator.interrupt_queue_depth == 0


class TestProcessSyscalls:
    """Test syscall processing."""

    def test_process_get_time(self):
        """GET_TIME should return frame count."""
        coordinator = Coordinator()
        coordinator.frame_count = 100

        request = SyscallRequest(
            app_id=0,
            syscall_id=SyscallID.GET_TIME,
            arg1=0,
            arg2=0,
        )
        coordinator.syscall_handler.enqueue(request)
        coordinator.process_syscalls()

        assert coordinator.syscall_handler.queue_depth == 0


class TestMultipleAppsCoexist:
    """Test multi-app scenarios."""

    def test_no_spatial_overlap(self):
        """Multiple apps should not overlap."""
        coordinator = Coordinator()

        # Load apps of different sizes
        id1 = coordinator.load_app(make_app_bytes(width=64, height=32))
        id2 = coordinator.load_app(make_app_bytes(width=128, height=64))
        id3 = coordinator.load_app(make_app_bytes(width=32, height=32))

        region1 = coordinator.get_app_region(id1)
        region2 = coordinator.get_app_region(id2)
        region3 = coordinator.get_app_region(id3)

        # Check no overlaps
        def overlaps(r1, r2):
            return not (r1.x + r1.width <= r2.x or
                       r2.x + r2.width <= r1.x or
                       r1.y + r1.height <= r2.y or
                       r2.y + r2.height <= r1.y)

        assert not overlaps(region1, region2)
        assert not overlaps(region1, region3)
        assert not overlaps(region2, region3)


class TestFocusArbitration:
    """Test focus arbitration."""

    def test_lowest_id_wins(self):
        """When multiple apps request focus, lowest ID wins."""
        coordinator = Coordinator()
        coordinator.load_app(make_app_bytes())  # id 0
        coordinator.load_app(make_app_bytes())  # id 1

        coordinator.syscall_handler.enqueue(SyscallRequest(
            app_id=1, syscall_id=SyscallID.REQUEST_FOCUS, arg1=0, arg2=0
        ))
        coordinator.syscall_handler.enqueue(SyscallRequest(
            app_id=0, syscall_id=SyscallID.REQUEST_FOCUS, arg1=0, arg2=0
        ))

        coordinator.process_syscalls()

        # Lowest ID (0) should have focus
        assert coordinator.focused_app_id == 0


class TestTick:
    """Test frame advancement."""

    def test_tick_increments_frame(self):
        """Each tick should increment frame count."""
        coordinator = Coordinator()

        coordinator.tick()
        assert coordinator.frame_count == 1

        coordinator.tick()
        assert coordinator.frame_count == 2

    def test_tick_clears_interrupt_queue(self):
        """Tick should process and clear interrupt queue."""
        coordinator = Coordinator()
        coordinator.load_app(make_app_bytes(flags=0x01))
        coordinator.inject_interrupt(InterruptPacket(
            type=InterruptType.KEYBOARD, payload=0x20,
            timestamp=0, source=0, x=0, y=0
        ))

        coordinator.tick()

        assert coordinator.interrupt_queue_depth == 0
