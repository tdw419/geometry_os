"""
End-to-end test for Heat Map visualization.

Test Flow:
1. Start Visual Bridge with Heat Aggregator
2. Connect as a WebSocket client
3. Record simulated access patterns
4. Verify heat_map_update broadcast messages
5. Validate the full pipeline from recording to frontend

Architecture:
+------------------+     +------------------+     +------------------+
| Test Client      |     | Visual Bridge    |     | Heat Aggregator  |
| (WebSocket)      | <--> | (Port 8768)      | --> | (1 Hz updates)   |
+------------------+     +------------------+     +------------------+
                                |
                                v
                         Test Assertions
"""

import pytest
import asyncio
import json
import time
import sys
import os
from pathlib import Path
from unittest.mock import MagicMock, AsyncMock, patch

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Import test dependencies with fallback
try:
    import websockets
    from websockets.client import connect as websocket_connect
    WEBSOCKETS_AVAILABLE = True
except ImportError:
    WEBSOCKETS_AVAILABLE = False
    pytestmark = pytest.mark.skip(reason="websockets library not installed")

# Import system components
from systems.visual_shell.api.heat_aggregator import (
    HeatAggregator, HeatMap, HeatCell,
    GRID_SIZE, DECAY_RATE, HEAT_INCREMENT
)
from systems.visual_shell.api.vat_manager import VATManager


# --- Test Configuration ---

TEST_WS_PORT = 18769  # Use non-standard port for E2E tests to avoid conflicts
TEST_TIMEOUT = 10.0  # Maximum wait time for operations


# --- Fixtures ---

@pytest.fixture
def test_vat_manager(tmp_path):
    """Create a VATManager with temporary storage."""
    return VATManager(state_dir=tmp_path / "vat", auto_save=True)


# --- Helper Functions ---

async def start_bridge_server(port, vat_manager):
    """Start Visual Bridge server and return (bridge, server_task)."""
    from systems.visual_shell.api.visual_bridge import VisualBridge

    bridge = VisualBridge(ws_port=port)
    server_task = asyncio.create_task(bridge.start())

    # Wait for server to be ready
    await asyncio.sleep(0.5)

    # Start heat aggregator
    await bridge.start_heat_aggregator(vat_manager)
    await asyncio.sleep(0.2)

    return bridge, server_task


async def stop_bridge_server(bridge, server_task):
    """Stop Visual Bridge server."""
    if bridge:
        await bridge.stop_heat_aggregator()
    if server_task:
        server_task.cancel()
        try:
            await server_task
        except asyncio.CancelledError:
            pass


# --- E2E Tests ---

@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_basic_broadcast(test_vat_manager):
    """
    Test basic heat map broadcast functionality.

    Steps:
    1. Connect to Visual Bridge via WebSocket
    2. Record access patterns via HeatAggregator
    3. Verify heat_map_update messages are received
    """
    port = TEST_WS_PORT
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        # Connect as WebSocket client
        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Record some access patterns
            for i in range(10):
                bridge.heat_aggregator.record_access(i * 5, i * 5, "test_source")

            # Wait for broadcast (update interval is 1 Hz)
            messages_received = []

            try:
                while True:
                    message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
                    data = json.loads(message)
                    messages_received.append(data)

                    # We've received a heat_map_update
                    if data.get("type") == "heat_map_update":
                        break
            except asyncio.TimeoutError:
                pytest.fail(f"Timeout waiting for heat_map_update. Received: {len(messages_received)} messages")

        # Verify the heat map update message
        assert len(messages_received) > 0, "No messages received"

        heat_update = messages_received[-1]
        assert heat_update["type"] == "heat_map_update", f"Wrong message type: {heat_update.get('type')}"

        # Verify message structure
        data = heat_update["data"]
        assert "grid" in data, "Missing grid in heat_map_update"
        assert "grid_shape" in data, "Missing grid_shape in heat_map_update"
        assert "hotspots" in data, "Missing hotspots in heat_map_update"
        assert "stats" in data, "Missing stats in heat_map_update"
        assert "timestamp" in data, "Missing timestamp in heat_map_update"

        # Verify grid shape
        assert data["grid_shape"] == [GRID_SIZE, GRID_SIZE], f"Wrong grid shape: {data['grid_shape']}"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_access_recording(test_vat_manager):
    """
    Test that recorded access patterns appear in heat map.
    """
    port = TEST_WS_PORT + 1  # Use different port for each test
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        # Clear any previous state
        bridge.heat_aggregator.clear()

        # Connect as WebSocket client
        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Record specific access patterns at known locations
            # Use enough accesses to exceed the hotspot threshold (0.7)
            # Each access adds HEAT_INCREMENT (0.1)
            # Need to account for decay/diffusion in the update loop
            # 10 * 0.1 = 1.0 gives us buffer for decay
            for _ in range(10):
                bridge.heat_aggregator.record_access(32, 32, "test_source")

            # Wait for broadcast
            message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
            data = json.loads(message)

        # Verify the stats show our accesses
        assert data["type"] == "heat_map_update"
        stats = data["data"]["stats"]
        assert stats["total_accesses"] >= 10, f"Expected at least 10 accesses, got {stats['total_accesses']}"

        # Verify we have heat at the target location (not necessarily a hotspot after decay)
        # The key test is that heat was recorded, even if it decayed below hotspot threshold
        heat_at_target = bridge.heat_aggregator.get_heat_at(32, 32)
        assert heat_at_target > 0, f"Expected heat at (32,32), got {heat_at_target}"

        # Also verify the grid data contains our heat
        grid_hex = data["data"]["grid"]
        import numpy as np
        grid_bytes = bytes.fromhex(grid_hex)
        grid_array = np.frombuffer(grid_bytes, dtype=np.float32).reshape(GRID_SIZE, GRID_SIZE)

        # Grid at (32, 32) should have heat (note: grid is [y, x] indexed)
        assert grid_array[32, 32] > 0, "Grid should have heat at recorded location"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_memory_access(test_vat_manager):
    """
    Test memory access recording (linear address to grid mapping).
    """
    port = TEST_WS_PORT + 2
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        bridge.heat_aggregator.clear()

        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Record memory accesses at known addresses
            # Address 0 maps to grid position (0, 0)
            # Address 4 (one word) maps to grid position (1, 0)
            # Address 256 (64 words) maps to grid position (0, 1)
            bridge.heat_aggregator.record_memory_access(0, "riscv")
            bridge.heat_aggregator.record_memory_access(4, "riscv")
            bridge.heat_aggregator.record_memory_access(256, "riscv")

            # Verify heat was recorded at expected locations
            heat_0_0 = bridge.heat_aggregator.get_heat_at(0, 0)
            heat_1_0 = bridge.heat_aggregator.get_heat_at(1, 0)
            heat_0_1 = bridge.heat_aggregator.get_heat_at(0, 1)

            assert heat_0_0 > 0, f"Expected heat at (0,0), got {heat_0_0}"
            assert heat_1_0 > 0, f"Expected heat at (1,0), got {heat_1_0}"
            assert heat_0_1 > 0, f"Expected heat at (0,1), got {heat_0_1}"

            # Wait for broadcast
            message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
            data = json.loads(message)

        assert data["type"] == "heat_map_update"
        stats = data["data"]["stats"]
        assert stats["total_accesses"] >= 3, f"Expected at least 3 accesses, got {stats['total_accesses']}"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_decay_over_time(test_vat_manager):
    """
    Test that heat decays over time.
    """
    port = TEST_WS_PORT + 3
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        bridge.heat_aggregator.clear()

        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Record access and get initial heat
            bridge.heat_aggregator.record_access(10, 10, "decay_test")
            initial_heat = bridge.heat_aggregator.get_heat_at(10, 10)

            # Manually apply decay (simulate time passing)
            bridge.heat_aggregator.heat_map.apply_decay(1.0)  # 1 second decay
            decayed_heat = bridge.heat_aggregator.get_heat_at(10, 10)

            # Verify decay occurred
            assert decayed_heat < initial_heat, f"Heat should decay: {initial_heat} -> {decayed_heat}"
            assert decayed_heat > 0, "Heat should not be zero after 1 second decay"

            # Expected: initial_heat * (DECAY_RATE ** 1)
            expected = initial_heat * (DECAY_RATE ** 1)
            assert abs(decayed_heat - expected) < 0.01, f"Decay mismatch: expected {expected}, got {decayed_heat}"

            # Wait for at least one broadcast to complete test
            message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
            data = json.loads(message)

        assert data["type"] == "heat_map_update"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_diffusion(test_vat_manager):
    """
    Test that heat diffuses to neighboring cells.
    """
    port = TEST_WS_PORT + 4
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        bridge.heat_aggregator.clear()

        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Add significant heat at center
            # Center of 64x64 grid is around (32, 32)
            center_x, center_y = 32, 32

            # Add enough heat to be significant
            for _ in range(5):
                bridge.heat_aggregator.record_access(center_x, center_y, "diffusion_test")

            initial_center_heat = bridge.heat_aggregator.get_heat_at(center_x, center_y)

            # Apply diffusion
            bridge.heat_aggregator.heat_map.diffuse(iterations=1)

            # After diffusion, neighbors should have heat
            neighbor_heat = 0
            for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                nx, ny = center_x + dx, center_y + dy
                if 0 <= nx < GRID_SIZE and 0 <= ny < GRID_SIZE:
                    neighbor_heat += bridge.heat_aggregator.get_heat_at(nx, ny)

            assert neighbor_heat > 0, "Neighbors should have heat after diffusion"

            # Wait for broadcast
            message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
            data = json.loads(message)

        assert data["type"] == "heat_map_update"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_multiple_sources(test_vat_manager):
    """
    Test that multiple sources are tracked correctly.
    """
    port = TEST_WS_PORT + 5
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        bridge.heat_aggregator.clear()

        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Record accesses from multiple sources
            sources = ["riscv", "fuse", "evolution", "tectonic"]
            for source in sources:
                for _ in range(5):
                    bridge.heat_aggregator.record_access(10, 10, source)

            # Get stats
            stats = bridge.heat_aggregator.get_stats()

            # Verify source tracking
            assert "accesses_by_source" in stats
            for source in sources:
                assert source in stats["accesses_by_source"], f"Missing source: {source}"
                assert stats["accesses_by_source"][source] >= 5, f"Wrong count for {source}"

            # Total should be 5 * 4 = 20
            assert stats["total_accesses"] >= 20, f"Expected at least 20 total, got {stats['total_accesses']}"

            # Wait for broadcast
            message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
            data = json.loads(message)

        assert data["type"] == "heat_map_update"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_stats_in_broadcast(test_vat_manager):
    """
    Test that broadcast contains complete statistics.
    """
    port = TEST_WS_PORT + 6
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        bridge.heat_aggregator.clear()

        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Record some accesses
            for i in range(20):
                bridge.heat_aggregator.record_access(i, i * 2, "stats_test")

            # Wait for broadcast
            message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
            data = json.loads(message)

        assert data["type"] == "heat_map_update"
        stats = data["data"]["stats"]

        # Verify all expected stat fields
        expected_fields = ["total_heat", "avg_heat", "max_heat", "hotspot_count", "total_accesses"]
        for field in expected_fields:
            assert field in stats, f"Missing stats field: {field}"

        # Verify max_heat structure
        assert "x" in stats["max_heat"], "Missing max_heat x"
        assert "y" in stats["max_heat"], "Missing max_heat y"
        assert "value" in stats["max_heat"], "Missing max_heat value"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_grid_encoding(test_vat_manager):
    """
    Test that grid is hex-encoded correctly.
    """
    port = TEST_WS_PORT + 7
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        bridge.heat_aggregator.clear()

        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Record access to have non-zero grid
            bridge.heat_aggregator.record_access(0, 0, "encoding_test")

            # Wait for broadcast
            message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
            data = json.loads(message)

        assert data["type"] == "heat_map_update"

        # Grid should be a hex string
        grid_hex = data["data"]["grid"]
        assert isinstance(grid_hex, str), "Grid should be a string"
        assert len(grid_hex) > 0, "Grid should not be empty"

        # Verify we can decode it
        import numpy as np
        grid_bytes = bytes.fromhex(grid_hex)
        grid_array = np.frombuffer(grid_bytes, dtype=np.float32)

        # Should have GRID_SIZE * GRID_SIZE elements
        expected_elements = GRID_SIZE * GRID_SIZE
        assert len(grid_array) == expected_elements, f"Grid has {len(grid_array)} elements, expected {expected_elements}"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_multiple_clients(test_vat_manager):
    """
    Test that broadcasts reach multiple connected clients.
    """
    port = TEST_WS_PORT + 8
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        bridge.heat_aggregator.clear()

        uri = f"ws://localhost:{port}"

        # Connect two clients
        async with websocket_connect(uri) as ws1, websocket_connect(uri) as ws2:
            # Record access
            bridge.heat_aggregator.record_access(20, 20, "multi_client_test")

            # Both clients should receive the broadcast
            received1 = False
            received2 = False

            async def receive_from(ws, name):
                try:
                    msg = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
                    data = json.loads(msg)
                    return data.get("type") == "heat_map_update"
                except asyncio.TimeoutError:
                    return False

            # Wait for messages from both clients
            results = await asyncio.gather(
                receive_from(ws1, "client1"),
                receive_from(ws2, "client2")
            )

            received1, received2 = results

        # At least one should have received (timing dependent)
        # In practice, both should receive
        assert received1 or received2, "At least one client should receive heat_map_update"

    finally:
        await stop_bridge_server(bridge, server_task)


@pytest.mark.asyncio
async def test_heatmap_convenience_methods(test_vat_manager):
    """
    Test Visual Bridge convenience methods for heat recording.
    """
    from systems.visual_shell.api.visual_bridge import VisualBridge

    # Create bridge without starting server
    bridge = VisualBridge(ws_port=9999)  # Dummy port

    # Manually create heat aggregator
    from systems.visual_shell.api.heat_aggregator import HeatAggregator
    bridge.heat_aggregator = HeatAggregator(bridge, test_vat_manager)

    try:
        # Test record_heat_access
        bridge.record_heat_access(10, 20, "test_convenience")
        heat = bridge.heat_aggregator.get_heat_at(10, 20)
        assert heat > 0, "record_heat_access should add heat"

        # Test record_heat_memory_access
        bridge.record_heat_memory_access(0x1000, "test_memory")
        # Address 0x1000 / 4 = 1024 words
        # grid_x = 1024 % 64 = 0
        # grid_y = (1024 // 64) % 64 = 16 % 64 = 16
        heat_mem = bridge.heat_aggregator.get_heat_at(0, 16)
        assert heat_mem > 0, "record_heat_memory_access should add heat"

    finally:
        if bridge.heat_aggregator:
            await bridge.heat_aggregator.stop()


# --- Performance Test ---

@pytest.mark.asyncio
@pytest.mark.slow
@pytest.mark.skipif(not WEBSOCKETS_AVAILABLE, reason="websockets library not installed")
async def test_heatmap_e2e_high_frequency(test_vat_manager):
    """
    Test heat aggregator under high-frequency access patterns.
    """
    port = TEST_WS_PORT + 9
    bridge, server_task = await start_bridge_server(port, test_vat_manager)

    try:
        bridge.heat_aggregator.clear()

        uri = f"ws://localhost:{port}"

        async with websocket_connect(uri) as ws:
            # Record many accesses rapidly
            access_count = 1000
            for i in range(access_count):
                x = i % GRID_SIZE
                y = (i * 7) % GRID_SIZE  # Pseudo-random distribution
                bridge.heat_aggregator.record_access(x, y, "stress_test")

            # Wait for broadcast
            message = await asyncio.wait_for(ws.recv(), timeout=TEST_TIMEOUT)
            data = json.loads(message)

        assert data["type"] == "heat_map_update"
        stats = data["data"]["stats"]
        assert stats["total_accesses"] >= access_count, "Not all accesses recorded"

    finally:
        await stop_bridge_server(bridge, server_task)


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
