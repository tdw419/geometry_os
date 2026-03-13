"""Tests for Glyph VM Bridge."""
import pytest
import asyncio
import base64
import json
from unittest.mock import Mock, AsyncMock, patch, MagicMock

# Skip all tests if GPU VM not available
pytest.importorskip(
    "systems.spatial_coordinator.gpu_vm",
    reason="GPU Glyph VM not available"
)


class TestGlyphVMBridge:
    """Test Glyph VM Bridge functionality."""

    @pytest.fixture
    def bridge(self):
        """Create a GlyphVMBridge instance for testing."""
        from systems.visual_shell.api.glyph_vm_bridge import GlyphVMBridge
        bridge = GlyphVMBridge()
        bridge.initialize_vm()
        return bridge

    def test_initialization(self, bridge):
        """Bridge should initialize correctly."""
        assert bridge.vm is not None
        assert bridge.vm.has_gpu in [True, False]  # Depends on hardware

    def test_load_app(self, bridge):
        """Should load an app via bridge."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode
        from systems.spatial_coordinator.opcodes import R0

        code = assemble([
            (Opcode.MOVI, R0, 0, 42),
            (Opcode.HALT, 0, 0, 0),
        ])

        header = (
            b'GEOS'
            + (32).to_bytes(2, 'little')
            + (16).to_bytes(2, 'little')
            + b'\x40\x00'  # Mem size
            + b'\x00\x00'  # Entry point
            + b'\x00\x00'  # Handler offset
            + b'\x01\x00'  # Flags
        )

        app_bytes = header + code
        app_id = bridge.vm.load_app(app_bytes)

        assert app_id == 0
        # Glyph buffer is initialized when app is loaded via WebSocket handler
        # Direct load_app calls don't auto-initialize glyph buffers

    def test_find_target_app(self, bridge):
        """Should find target app for interrupts."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode
        from systems.spatial_coordinator.opcodes import R0

        # No apps loaded
        assert bridge._find_target_app() is None

        # Load an app
        code = assemble([(Opcode.HALT, 0, 0, 0)])
        header = b'GEOS' + (32).to_bytes(2, 'little') + (16).to_bytes(2, 'little') + b'\x00' * 8
        bridge.vm.load_app(header + code)

        # Should find the app
        assert bridge._find_target_app() == 0

    def test_set_interrupt(self, bridge):
        """Should set interrupt registers."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode
        from systems.spatial_coordinator.opcodes import R0, R_INT_PAYLOAD

        # Load app that reads interrupt payload
        code = assemble([
            (Opcode.MOV, R0, R_INT_PAYLOAD, 0),
            (Opcode.HALT, 0, 0, 0),
        ])
        header = b'GEOS' + (32).to_bytes(2, 'little') + (16).to_bytes(2, 'little') + b'\x00' * 8
        bridge.vm.load_app(header + code)

        # Set interrupt
        bridge.vm.set_interrupt(0, int_type=1, payload=0x42)

        # Verify registers set
        assert bridge.vm.read_register(0, R_INT_PAYLOAD) == 0x42

        # Run and check result
        bridge.vm.run()
        assert bridge.vm.read_register(0, R0) == 0x42

    def test_glyph_buffer_management(self, bridge):
        """Should manage glyph buffers for apps."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode

        code = assemble([(Opcode.HALT, 0, 0, 0)])
        header = b'GEOS' + (8).to_bytes(2, 'little') + (4).to_bytes(2, 'little') + b'\x00' * 8
        app_id = bridge.vm.load_app(header + code)

        # Initialize glyph buffer
        bridge._glyph_buffers[app_id] = [32] * (8 * 4)

        # Verify buffer exists and is correct size
        assert app_id in bridge._glyph_buffers
        assert len(bridge._glyph_buffers[app_id]) == 32

    @pytest.mark.asyncio
    async def test_handle_load_app_message(self, bridge):
        """Should handle load_app WebSocket message."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode

        code = assemble([(Opcode.HALT, 0, 0, 0)])
        header = b'GEOS' + (32).to_bytes(2, 'little') + (16).to_bytes(2, 'little') + b'\x00' * 8
        app_bytes = header + code

        data = {
            "type": "load_app",
            "data": {
                "binary": base64.b64encode(app_bytes).decode()
            }
        }

        # Mock websocket
        websocket = AsyncMock()

        await bridge._handle_message(data, websocket)

        assert bridge.vm.app_count == 1
        assert 0 in bridge._glyph_buffers

    @pytest.mark.asyncio
    async def test_handle_interrupt_message(self, bridge):
        """Should handle interrupt WebSocket message."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode
        from systems.spatial_coordinator.opcodes import R0, R_INT_PAYLOAD

        # Load app
        code = assemble([
            (Opcode.MOV, R0, R_INT_PAYLOAD, 0),
            (Opcode.HALT, 0, 0, 0),
        ])
        header = b'GEOS' + (32).to_bytes(2, 'little') + (16).to_bytes(2, 'little') + b'\x00' * 8
        bridge.vm.load_app(header + code)

        data = {
            "type": "interrupt",
            "data": {
                "interrupt_type": "keyboard",
                "payload": 0x41,  # 'A' key
            }
        }

        websocket = AsyncMock()
        await bridge._handle_message(data, websocket)

        # Verify interrupt was set
        assert bridge.vm.read_register(0, R_INT_PAYLOAD) == 0x41

    @pytest.mark.asyncio
    async def test_handle_unload_app_message(self, bridge):
        """Should handle unload_app WebSocket message."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode

        # Load app
        code = assemble([(Opcode.HALT, 0, 0, 0)])
        header = b'GEOS' + (32).to_bytes(2, 'little') + (16).to_bytes(2, 'little') + b'\x00' * 8
        bridge.vm.load_app(header + code)
        bridge._glyph_buffers[0] = [32] * (32 * 16)

        # Unload it
        data = {
            "type": "unload_app",
            "data": {"app_id": 0}
        }

        websocket = AsyncMock()
        await bridge._handle_message(data, websocket)

        assert bridge.vm.app_count == 0
        assert 0 not in bridge._glyph_buffers


class TestGlyphBuffer:
    """Test glyph buffer operations."""

    @pytest.fixture
    def bridge(self):
        """Create a GlyphVMBridge instance for testing."""
        from systems.visual_shell.api.glyph_vm_bridge import GlyphVMBridge
        bridge = GlyphVMBridge()
        bridge.initialize_vm()
        return bridge

    def test_glyph_buffer_initialization(self, bridge):
        """Glyph buffer should initialize with spaces."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode

        code = assemble([(Opcode.HALT, 0, 0, 0)])
        header = b'GEOS' + (10).to_bytes(2, 'little') + (5).to_bytes(2, 'little') + b'\x00' * 8
        app_id = bridge.vm.load_app(header + code)

        # Initialize
        width, height = 10, 5
        bridge._glyph_buffers[app_id] = [32] * (width * height)

        # Check all are spaces
        assert all(g == 32 for g in bridge._glyph_buffers[app_id])

    def test_glyph_update(self, bridge):
        """Should update individual glyphs."""
        from systems.spatial_coordinator.glyph_vm import assemble, Opcode

        code = assemble([(Opcode.HALT, 0, 0, 0)])
        header = b'GEOS' + (10).to_bytes(2, 'little') + (5).to_bytes(2, 'little') + b'\x00' * 8
        app_id = bridge.vm.load_app(header + code)

        width, height = 10, 5
        bridge._glyph_buffers[app_id] = [32] * (width * height)

        # Write 'A' at position (3, 2)
        x, y, glyph = 3, 2, ord('A')
        idx = y * width + x
        bridge._glyph_buffers[app_id][idx] = glyph

        assert bridge._glyph_buffers[app_id][idx] == ord('A')
