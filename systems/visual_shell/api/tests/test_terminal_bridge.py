#!/usr/bin/env python3
"""
Tests for Terminal WebSocket Bridge - WordPress Web Terminal Integration

Run with: python -m pytest systems/visual_shell/api/tests/test_terminal_bridge.py -v --tb=short

These tests verify the WebSocket-based terminal functionality:
- WebSocket connection to /terminal path with token auth
- Terminal input/output flow
- Terminal resize handling

Tests require a running Visual Bridge server. If not available, tests are skipped.
"""

import pytest
import asyncio
import json
import aiohttp
import time

# Try importing websockets - used for WebSocket client
try:
    import websockets
    HAS_WEBSOCKETS = True
except ImportError:
    HAS_WEBSOCKETS = False

# Visual Bridge default ports
WS_PORT = 8768
HTTP_PORT = 8769
WS_URL = f"ws://localhost:{WS_PORT}"
HTTP_URL = f"http://localhost:{HTTP_PORT}"


def is_visual_bridge_running_sync() -> bool:
    """Synchronous check if Visual Bridge is running (for skipif)."""
    import socket
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(2)
        result = sock.connect_ex(('localhost', HTTP_PORT))
        sock.close()
        return result == 0
    except Exception:
        return False


# Skip decorator for all tests that need Visual Bridge
requires_visual_bridge = pytest.mark.skipif(
    not is_visual_bridge_running_sync(),
    reason="Visual Bridge not running - start with: python systems/visual_shell/api/visual_bridge.py"
)


async def create_terminal_session(user_id: int = 1, rows: int = 24, cols: int = 80):
    """Create a terminal session via HTTP API.

    Returns dict with session_id and token, or None on failure.
    """
    try:
        async with aiohttp.ClientSession() as session:
            async with session.post(
                f"{HTTP_URL}/terminal/session",
                json={"user_id": user_id, "rows": rows, "cols": cols},
                timeout=aiohttp.ClientTimeout(total=5)
            ) as resp:
                if resp.status == 200:
                    return await resp.json()
    except Exception:
        pass
    return None


async def delete_terminal_session(session_id: str) -> bool:
    """Delete a terminal session via HTTP API."""
    try:
        async with aiohttp.ClientSession() as session:
            async with session.delete(
                f"{HTTP_URL}/terminal/session/{session_id}",
                timeout=aiohttp.ClientTimeout(total=5)
            ) as resp:
                return resp.status == 200
    except Exception:
        return False


@pytest.mark.skipif(not HAS_WEBSOCKETS, reason="websockets library not installed")
@requires_visual_bridge
class TestTerminalWebSocket:
    """Tests for terminal WebSocket functionality."""

    @pytest.mark.asyncio
    async def test_terminal_websocket_connect(self):
        """Test WebSocket connection to /terminal path with token authentication."""
        # Create session via HTTP API
        session_data = await create_terminal_session(user_id=999)
        assert session_data is not None, "Failed to create terminal session"
        assert session_data.get("status") == "ok"
        assert "session_id" in session_data
        assert "token" in session_data

        session_id = session_data["session_id"]
        token = session_data["token"]

        try:
            # Connect to WebSocket with token
            ws_url = f"{WS_URL}/terminal?token={token}"
            async with websockets.connect(ws_url) as ws:
                # Should receive 'connected' message
                message = await asyncio.wait_for(ws.recv(), timeout=5.0)
                data = json.loads(message)

                assert data.get("type") == "connected", f"Expected connected message, got: {data}"
                assert data.get("session_id") == session_id

        finally:
            # Cleanup
            await delete_terminal_session(session_id)

    @pytest.mark.asyncio
    async def test_terminal_invalid_token(self):
        """Test that invalid token is rejected."""
        ws_url = f"{WS_URL}/terminal?token=invalid_token_12345"

        try:
            async with websockets.connect(ws_url) as ws:
                # Should receive error message
                message = await asyncio.wait_for(ws.recv(), timeout=5.0)
                data = json.loads(message)

                assert data.get("type") == "error"
                assert "Invalid" in data.get("message", "") or "token" in data.get("message", "").lower()
        except websockets.exceptions.ConnectionClosed:
            # Server may close connection immediately - also valid
            pass

    @pytest.mark.asyncio
    async def test_terminal_input_echo(self):
        """Test that input is processed and output is received."""
        # Create session
        session_data = await create_terminal_session(user_id=998)
        assert session_data is not None

        session_id = session_data["session_id"]
        token = session_data["token"]

        try:
            ws_url = f"{WS_URL}/terminal?token={token}"
            async with websockets.connect(ws_url) as ws:
                # Wait for connected message
                connected_msg = await asyncio.wait_for(ws.recv(), timeout=5.0)
                connected_data = json.loads(connected_msg)
                assert connected_data.get("type") == "connected"

                # Send a simple command
                # Note: 'echo' works in most shells
                input_msg = json.dumps({
                    "type": "input",
                    "data": "echo HELLO_TEST_123\n"
                })
                await ws.send(input_msg)

                # Wait for output - might receive multiple messages (prompt, echo, etc.)
                # Collect messages for up to 3 seconds
                outputs = []
                start_time = time.time()
                while time.time() - start_time < 3.0:
                    try:
                        message = await asyncio.wait_for(ws.recv(), timeout=0.5)
                        data = json.loads(message)
                        if data.get("type") == "output":
                            outputs.append(data.get("data", ""))
                            # Check if we got our echo
                            if "HELLO_TEST_123" in data.get("data", ""):
                                break
                    except asyncio.TimeoutError:
                        continue

                # Verify we received some output
                combined_output = "".join(outputs)
                assert "HELLO_TEST_123" in combined_output, f"Echo not found in output: {combined_output[:200]}"

        finally:
            await delete_terminal_session(session_id)

    @pytest.mark.asyncio
    async def test_terminal_resize(self):
        """Test that resize events are handled without errors."""
        # Create session with default size
        session_data = await create_terminal_session(user_id=997, rows=24, cols=80)
        assert session_data is not None

        session_id = session_data["session_id"]
        token = session_data["token"]

        try:
            ws_url = f"{WS_URL}/terminal?token={token}"
            async with websockets.connect(ws_url) as ws:
                # Wait for connected message
                connected_msg = await asyncio.wait_for(ws.recv(), timeout=5.0)
                connected_data = json.loads(connected_msg)
                assert connected_data.get("type") == "connected"

                # Send resize event
                resize_msg = json.dumps({
                    "type": "resize",
                    "rows": 40,
                    "cols": 120
                })
                await ws.send(resize_msg)

                # Wait briefly for any response/error
                # The resize should not cause an error - just update internal state
                await asyncio.sleep(0.5)

                # Send another command to verify terminal still works
                input_msg = json.dumps({
                    "type": "input",
                    "data": "echo RESIZE_TEST\n"
                })
                await ws.send(input_msg)

                # Should still receive output
                outputs = []
                start_time = time.time()
                while time.time() - start_time < 3.0:
                    try:
                        message = await asyncio.wait_for(ws.recv(), timeout=0.5)
                        data = json.loads(message)
                        if data.get("type") == "output":
                            outputs.append(data.get("data", ""))
                            if "RESIZE_TEST" in data.get("data", ""):
                                break
                    except asyncio.TimeoutError:
                        continue

                combined_output = "".join(outputs)
                assert "RESIZE_TEST" in combined_output, f"Terminal not responding after resize: {combined_output[:200]}"

        finally:
            await delete_terminal_session(session_id)

    @pytest.mark.asyncio
    async def test_terminal_missing_token(self):
        """Test that missing token is rejected."""
        ws_url = f"{WS_URL}/terminal"

        try:
            async with websockets.connect(ws_url) as ws:
                message = await asyncio.wait_for(ws.recv(), timeout=5.0)
                data = json.loads(message)

                assert data.get("type") == "error"
                assert "token" in data.get("message", "").lower()
        except websockets.exceptions.ConnectionClosed:
            # Connection closed is also acceptable
            pass

    @pytest.mark.asyncio
    async def test_terminal_session_cleanup(self):
        """Test that session is properly cleaned up after disconnect."""
        # Create session
        session_data = await create_terminal_session(user_id=996)
        assert session_data is not None

        session_id = session_data["session_id"]
        token = session_data["token"]

        # Connect and immediately disconnect
        ws_url = f"{WS_URL}/terminal?token={token}"
        async with websockets.connect(ws_url) as ws:
            connected_msg = await asyncio.wait_for(ws.recv(), timeout=5.0)
            # Connection established

        # Session should still exist (WebSocket disconnect doesn't auto-delete)
        # But should be cleanable via HTTP API
        deleted = await delete_terminal_session(session_id)
        assert deleted, "Failed to delete session after disconnect"


@requires_visual_bridge
@pytest.mark.asyncio
async def test_terminal_session_create_http():
    """Test terminal session creation via HTTP API."""
    session_data = await create_terminal_session(user_id=1, rows=30, cols=100)

    assert session_data is not None
    assert session_data.get("status") == "ok"
    assert "session_id" in session_data
    assert "token" in session_data
    assert len(session_data["token"]) >= 16, "Token should be reasonably long"

    # Cleanup
    await delete_terminal_session(session_data["session_id"])


@requires_visual_bridge
@pytest.mark.asyncio
async def test_terminal_session_delete_http():
    """Test terminal session deletion via HTTP API."""
    # Create then delete
    session_data = await create_terminal_session(user_id=2)
    assert session_data is not None

    session_id = session_data["session_id"]

    # Delete
    deleted = await delete_terminal_session(session_id)
    assert deleted

    # Try to delete again - should fail (404)
    deleted_again = await delete_terminal_session(session_id)
    assert not deleted_again


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
