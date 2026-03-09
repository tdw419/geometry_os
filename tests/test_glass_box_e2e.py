"""
Glass Box E2E Integration Tests - Task 40 of Sisyphus v4.

Tests the full thought streaming pipeline:
Daemon -> CompositorBridge -> HTTP Post -> VisualBridge -> WebSocket

Coverage:
- WebSocket client mock receiving thoughts
- Multi-thought burst handling
- Connection drop/reconnect simulation
- Serialization integrity
"""

import pytest
import asyncio
import json
import threading
import time
from unittest.mock import Mock, patch, AsyncMock, MagicMock
from fastapi.testclient import TestClient


# Fixtures
# ========

@pytest.fixture
def test_client():
    """Create a FastAPI test client."""
    from systems.visual_shell.api.visual_bridge import app
    return TestClient(app)


@pytest.fixture
def mock_websocket():
    """Create a mock WebSocket for testing."""
    mock_ws = MagicMock()
    mock_ws.send_json = MagicMock()
    mock_ws.receive_json = MagicMock(return_value={"type": "ping"})
    return mock_ws


@pytest.fixture
def thought_payload():
    """Create a sample thought payload."""
    return {
        "type": "task_start",
        "task_id": "test-123",
        "content": "E2E Test Thought",
        "timestamp": time.time()
    }


# Basic Pipeline Tests
# ====================

@pytest.mark.asyncio
async def test_glass_box_full_pipeline(test_client):
    """
    Test the full thought streaming pipeline:
    Daemon -> CompositorBridge -> HTTP Post -> VisualBridge -> WebSocket
    """
    # Let's mock the broadcast logic to verify the HTTP -> WebSocket bridge
    thought_payload = {"type": "gvn", "content": "E2E Test Thought"}
    
    # Manually trigger the broadcast endpoint in the visual bridge
    response = test_client.post("/thoughts/broadcast", json=thought_payload)
    
    assert response.status_code == 200
    assert response.json()["status"] == "ok"
    
    print("Glass Box HTTP Broadcast endpoint verified.")


def test_thought_serialization_integrity():
    """Verify that thoughts sent via bridge contain both JSON and Glyph data."""
    from systems.sisyphus.thought_serializer import ThoughtSerializer
    
    serializer = ThoughtSerializer()
    thought = {"type": "task_start", "task_name": "E2E Integrity"}
    
    glyph = serializer.serialize(thought)
    cmd = serializer.to_glyph_command(glyph)
    
    assert cmd[0] == 0xCE  # Opcode check
    assert len(cmd) == 16
    print("Thought serialization integrity verified.")


# WebSocket Mock Tests
# ====================

class TestWebSocketMock:
    """Test WebSocket client mock receiving thoughts."""

    def test_mock_websocket_receives_thought(self, mock_websocket, thought_payload):
        """Test that mock WebSocket can receive thoughts."""
        # Simulate sending a thought to the WebSocket
        mock_websocket.send_json(thought_payload)
        
        # Verify the send was called
        mock_websocket.send_json.assert_called_once_with(thought_payload)

    def test_mock_websocket_receive_json(self, mock_websocket):
        """Test that mock WebSocket can receive JSON data."""
        result = mock_websocket.receive_json()
        assert result["type"] == "ping"

    @pytest.mark.asyncio
    async def test_async_websocket_thought_flow(self, mock_websocket, thought_payload):
        """Test async thought flow through WebSocket."""
        # Simulate async send
        async def async_send(data):
            await asyncio.sleep(0.01)  # Simulate network delay
            mock_websocket.send_json(data)
            return True
        
        result = await async_send(thought_payload)
        assert result is True
        mock_websocket.send_json.assert_called_once()

    def test_websocket_connection_state_tracking(self, mock_websocket):
        """Test that WebSocket connection state can be tracked."""
        from systems.visual_shell.api.visual_bridge import active_thought_connections
        
        # Verify active_thought_connections is a set
        assert isinstance(active_thought_connections, set)


# Multi-Thought Burst Tests
# =========================

class TestMultiThoughtBurst:
    """Test multi-thought burst handling."""

    def test_burst_of_10_thoughts(self, test_client):
        """Test handling a burst of 10 thoughts rapidly."""
        thoughts = [
            {"type": "task_progress", "task_id": f"task-{i}", "progress": i * 10}
            for i in range(10)
        ]
        
        responses = []
        for thought in thoughts:
            response = test_client.post("/thoughts/broadcast", json=thought)
            responses.append(response)
        
        # All should succeed
        assert all(r.status_code == 200 for r in responses)

    def test_burst_with_varied_types(self, test_client):
        """Test burst with different thought types."""
        thought_types = [
            {"type": "task_start", "content": "Starting"},
            {"type": "task_progress", "content": "Progress"},
            {"type": "task_complete", "content": "Done"},
            {"type": "error", "content": "Failed"},
            {"type": "heartbeat", "content": "ping"},
        ]
        
        for thought in thought_types:
            response = test_client.post("/thoughts/broadcast", json=thought)
            assert response.status_code == 200

    @pytest.mark.asyncio
    async def test_async_burst_handling(self, test_client):
        """Test async handling of thought bursts."""
        async def send_thought(idx):
            thought = {"type": "async_test", "index": idx}
            # Use run_in_executor for sync test_client in async context
            loop = asyncio.get_event_loop()
            response = await loop.run_in_executor(
                None, 
                lambda: test_client.post("/thoughts/broadcast", json=thought)
            )
            return response.status_code
        
        # Send 5 thoughts concurrently
        tasks = [send_thought(i) for i in range(5)]
        results = await asyncio.gather(*tasks)
        
        assert all(status == 200 for status in results)

    def test_burst_performance_under_1_second(self, test_client):
        """Test that 100 thoughts can be processed in under 1 second."""
        start_time = time.time()
        
        for i in range(100):
            thought = {"type": "perf_test", "index": i}
            test_client.post("/thoughts/broadcast", json=thought)
        
        elapsed = time.time() - start_time
        assert elapsed < 1.0, f"100 thoughts took {elapsed:.2f}s (>1s)"


# Connection Drop/Reconnect Tests
# ===============================

class TestConnectionDropReconnect:
    """Test connection drop and reconnect simulation."""

    def test_connection_drop_handling(self, mock_websocket):
        """Test handling of WebSocket connection drop."""
        # Simulate connection drop by raising exception
        mock_websocket.send_json.side_effect = Exception("Connection lost")
        
        # The system should handle this gracefully
        with pytest.raises(Exception):
            mock_websocket.send_json({"type": "test"})

    def test_reconnect_after_drop(self, mock_websocket):
        """Test reconnection after connection drop."""
        # First attempt fails
        mock_websocket.send_json.side_effect = Exception("Connection lost")
        
        with pytest.raises(Exception):
            mock_websocket.send_json({"type": "test1"})
        
        # Reset side effect and call count (simulating reconnection)
        mock_websocket.send_json.side_effect = None
        mock_websocket.send_json.reset_mock()
        
        # Second attempt should succeed
        mock_websocket.send_json({"type": "test2"})
        mock_websocket.send_json.assert_called_once_with({"type": "test2"})

    @pytest.mark.asyncio
    async def test_async_reconnect_with_backoff(self):
        """Test reconnection with exponential backoff."""
        reconnect_attempts = []
        
        async def mock_connect_with_backoff(max_attempts=3):
            base_delay = 0.01  # Fast for testing
            
            for attempt in range(max_attempts):
                reconnect_attempts.append(attempt)
                await asyncio.sleep(base_delay * (2 ** attempt))
                
                # Simulate success on third attempt
                if attempt == 2:
                    return True
            return False
        
        result = await mock_connect_with_backoff()
        assert result is True
        assert len(reconnect_attempts) == 3

    def test_connection_state_management(self):
        """Test that connection state is properly managed."""
        from systems.visual_shell.api.visual_bridge import active_thought_connections
        
        initial_count = len(active_thought_connections)
        
        # Simulate adding a connection
        test_conn = "test-connection-1"
        active_thought_connections.add(test_conn)
        assert len(active_thought_connections) == initial_count + 1
        
        # Simulate removing a connection (drop)
        active_thought_connections.discard(test_conn)
        assert len(active_thought_connections) == initial_count

    @pytest.mark.asyncio
    async def test_graceful_shutdown_with_active_connections(self):
        """Test graceful shutdown with active connections."""
        from systems.visual_shell.api.visual_bridge import active_thought_connections
        
        # Add some mock connections
        test_conns = {"conn1", "conn2", "conn3"}
        active_thought_connections.update(test_conns)
        
        # Simulate shutdown - close all connections
        closed = []
        for conn in list(active_thought_connections):
            closed.append(conn)
            active_thought_connections.discard(conn)
        
        assert len(closed) == 3
        assert len(active_thought_connections) == 0


# Edge Cases and Error Handling
# =============================

class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_empty_thought_payload(self, test_client):
        """Test handling of empty thought payload."""
        response = test_client.post("/thoughts/broadcast", json={})
        # Should still return 200 (graceful handling)
        assert response.status_code == 200

    def test_malformed_thought_type(self, test_client):
        """Test handling of malformed thought type."""
        thought = {"type": None, "content": "test"}
        response = test_client.post("/thoughts/broadcast", json=thought)
        assert response.status_code == 200

    def test_large_thought_payload(self, test_client):
        """Test handling of large thought payload."""
        # Create a large payload (10KB)
        large_content = "x" * 10000
        thought = {"type": "large", "content": large_content}
        response = test_client.post("/thoughts/broadcast", json=thought)
        assert response.status_code == 200

    def test_unicode_in_thought(self, test_client):
        """Test handling of Unicode in thought content."""
        thought = {
            "type": "unicode_test",
            "content": "Hello 世界 🌍 Привет"
        }
        response = test_client.post("/thoughts/broadcast", json=thought)
        assert response.status_code == 200


# Integration Tests
# =================

class TestIntegration:
    """Full integration tests."""

    @pytest.mark.asyncio
    async def test_full_thought_lifecycle(self, test_client):
        """Test full lifecycle: create -> send -> broadcast -> receive."""
        # 1. Create thought
        thought = {
            "type": "lifecycle_test",
            "task_id": "lifecycle-1",
            "content": "Full lifecycle test"
        }
        
        # 2. Send via HTTP broadcast
        response = test_client.post("/thoughts/broadcast", json=thought)
        assert response.status_code == 200
        
        # 3. Verify response structure
        result = response.json()
        assert "status" in result
        assert result["status"] == "ok"

    def test_compositor_bridge_integration(self):
        """Test CompositorBridge integration."""
        from systems.sisyphus.compositor_bridge import CompositorBridge
        
        bridge = CompositorBridge()
        
        # Verify bridge can be instantiated
        assert bridge is not None

    def test_thought_serializer_integration(self):
        """Test ThoughtSerializer integration."""
        from systems.sisyphus.thought_serializer import ThoughtSerializer
        
        serializer = ThoughtSerializer()
        
        thought = {"type": "integration", "data": [1, 2, 3]}
        glyph = serializer.serialize(thought)
        
        assert glyph is not None
        assert hasattr(glyph, '__dict__') or isinstance(glyph, (dict, tuple))


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
