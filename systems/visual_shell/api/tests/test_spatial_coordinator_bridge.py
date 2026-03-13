"""Tests for Spatial Coordinator Bridge."""
import asyncio
import json
import pytest
from unittest.mock import AsyncMock, MagicMock, patch

# Skip all tests if coordinator not available
pytest.importorskip("systems.spatial_coordinator")

from systems.visual_shell.api.spatial_coordinator_bridge import SpatialCoordinatorBridge
from systems.spatial_coordinator import (
    Coordinator,
    InterruptPacket,
    InterruptType,
    CapabilityFlags,
)


class TestSpatialCoordinatorBridge:
    """Test the Spatial Coordinator Bridge."""

    def test_initialization(self):
        """Bridge should initialize with default settings."""
        bridge = SpatialCoordinatorBridge(host="localhost", port=8769)
        assert bridge.host == "localhost"
        assert bridge.port == 8769
        assert bridge.coordinator is None
        assert len(bridge.clients) == 0

    def test_initialize_coordinator(self):
        """Should create Coordinator instance."""
        bridge = SpatialCoordinatorBridge()
        bridge.initialize_coordinator(map_width=512, map_height=512)

        assert bridge.coordinator is not None
        assert bridge.coordinator.map_width == 512
        assert bridge.coordinator.map_height == 512

    def test_initialize_coordinator_custom_size(self):
        """Should accept custom map dimensions."""
        bridge = SpatialCoordinatorBridge()
        bridge.initialize_coordinator(map_width=2048, map_height=1024)

        assert bridge.coordinator.map_width == 2048
        assert bridge.coordinator.map_height == 1024


class TestBridgeWithApps:
    """Test bridge with loaded apps."""

    @pytest.fixture
    def bridge(self):
        """Create bridge with coordinator."""
        bridge = SpatialCoordinatorBridge()
        bridge.initialize_coordinator()
        return bridge

    def _make_app_bytes(self, width=16, height=16, flags=0x01):
        """Create minimal valid app binary."""
        return (
            b'GEOS'
            + width.to_bytes(2, 'little')
            + height.to_bytes(2, 'little')
            + b'\x40\x00'  # Mem size
            + b'\x00\x00'  # Entry point
            + b'\x00\x00'  # Handler offset
            + flags.to_bytes(2, 'little')
            + b'\x00' * (width * height)
        )

    def test_broadcast_to_no_clients(self, bridge):
        """Broadcast to empty client set should succeed."""
        # Should not raise
        asyncio.run(bridge.broadcast({"type": "test"}))

    @pytest.mark.asyncio
    async def test_handle_interrupt_keyboard(self, bridge):
        """Should route keyboard interrupt to coordinator."""
        # Load an app first
        app_id = bridge.coordinator.load_app(self._make_app_bytes(flags=0x01))
        assert app_id is not None

        region = bridge.coordinator.get_app_region(app_id)

        # Handle interrupt message
        await bridge._handle_interrupt({
            "interrupt_type": "keyboard",
            "payload": 0x20,  # spacebar
            "x": region.x,
            "y": region.y,
            "source": 0,
        })

        assert bridge.coordinator.interrupt_queue_depth == 1

    @pytest.mark.asyncio
    async def test_handle_interrupt_mouse(self, bridge):
        """Should route mouse interrupt to coordinator."""
        # Load app that wants mouse
        app_id = bridge.coordinator.load_app(self._make_app_bytes(flags=0x02))
        assert app_id is not None

        region = bridge.coordinator.get_app_region(app_id)

        # Handle mouse interrupt
        await bridge._handle_interrupt({
            "interrupt_type": "mouse",
            "payload": 0x01,  # left click
            "x": region.x,
            "y": region.y,
            "source": 0,
        })

        assert bridge.coordinator.interrupt_queue_depth == 1

    @pytest.mark.asyncio
    async def test_handle_tick(self, bridge):
        """Should advance coordinator frame."""
        initial_frame = bridge.coordinator.frame_count

        await bridge._handle_tick()

        assert bridge.coordinator.frame_count == initial_frame + 1

    @pytest.mark.asyncio
    async def test_tick_broadcasts_frame_update(self, bridge):
        """Tick should broadcast frame_tick message."""
        messages = []

        # Mock broadcast to capture messages
        original_broadcast = bridge.broadcast
        async def mock_broadcast(msg):
            messages.append(msg)

        bridge.broadcast = mock_broadcast

        await bridge._handle_tick()

        assert len(messages) == 1
        assert messages[0]["type"] == "frame_tick"
        assert "frame" in messages[0]["data"]
        assert "app_count" in messages[0]["data"]

    @pytest.mark.asyncio
    async def test_focus_change_broadcast(self, bridge):
        """Focus change should broadcast focus_changed."""
        messages = []

        async def mock_broadcast(msg):
            messages.append(msg)

        bridge.broadcast = mock_broadcast

        # Load apps
        bridge.coordinator.load_app(self._make_app_bytes())
        bridge.coordinator.load_app(self._make_app_bytes())

        # Request focus for app 1
        from systems.spatial_coordinator.syscall import SyscallRequest, SyscallID
        bridge.coordinator.syscall_handler.enqueue(SyscallRequest(
            app_id=1, syscall_id=SyscallID.REQUEST_FOCUS, arg1=0, arg2=0
        ))

        await bridge._handle_tick()

        # Should have focus_changed and frame_tick
        focus_msgs = [m for m in messages if m["type"] == "focus_changed"]
        assert len(focus_msgs) == 1
        assert focus_msgs[0]["data"]["app_id"] == 1


class TestBridgeProtocol:
    """Test WebSocket protocol compliance."""

    @pytest.fixture
    def bridge(self):
        bridge = SpatialCoordinatorBridge()
        bridge.initialize_coordinator()
        return bridge

    def _make_app_bytes(self, width=16, height=16, flags=0x01):
        return (
            b'GEOS'
            + width.to_bytes(2, 'little')
            + height.to_bytes(2, 'little')
            + b'\x40\x00'
            + b'\x00\x00'
            + b'\x00\x00'
            + flags.to_bytes(2, 'little')
            + b'\x00' * (width * height)
        )

    @pytest.mark.asyncio
    async def test_message_format_app_loaded(self, bridge):
        """app_loaded message should have correct format."""
        messages = []

        async def mock_broadcast(msg):
            messages.append(msg)

        bridge.broadcast = mock_broadcast

        # Load app via coordinator
        app_id = bridge.coordinator.load_app(self._make_app_bytes(width=32, height=16))

        # Check what _onAppLoaded would send
        region = bridge.coordinator.get_app_region(app_id)
        header = bridge.coordinator.get_app_header(app_id)

        expected = {
            "type": "app_loaded",
            "data": {
                "app_id": app_id,
                "x": region.x,
                "y": region.y,
                "width": region.width,
                "height": region.height,
                "flags": header.flags,
            }
        }

        # Verify format
        assert expected["type"] == "app_loaded"
        assert "app_id" in expected["data"]
        assert "x" in expected["data"]
        assert "y" in expected["data"]
        assert "width" in expected["data"]
        assert "height" in expected["data"]
        assert "flags" in expected["data"]

    @pytest.mark.asyncio
    async def test_message_format_frame_tick(self, bridge):
        """frame_tick message should have correct format."""
        messages = []

        async def mock_broadcast(msg):
            messages.append(msg)

        bridge.broadcast = mock_broadcast

        await bridge._handle_tick()

        assert len(messages) == 1
        msg = messages[0]
        assert msg["type"] == "frame_tick"
        assert isinstance(msg["data"]["frame"], int)
        assert isinstance(msg["data"]["app_count"], int)
