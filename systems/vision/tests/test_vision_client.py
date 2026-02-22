"""
Tests for VisionClient.

Note: These tests use a mock daemon since the actual VisionDaemon
requires GPU access.
"""

import asyncio
import json
import os
import tempfile
from unittest.mock import AsyncMock, patch

import pytest
from PIL import Image

from systems.vision.clients.vision_client import (
    VisionClient,
    VisionClientError,
    SyncVisionClient,
)


@pytest.fixture
def sample_image():
    """Create a sample image for testing."""
    return Image.new("RGB", (800, 600), color="white")


@pytest.fixture
def mock_socket_path():
    """Create a temporary socket path for testing."""
    return tempfile.mktemp(suffix=".sock")


@pytest.fixture
def client(mock_socket_path):
    """Create a VisionClient for testing."""
    return VisionClient(socket_path=mock_socket_path, timeout=5.0)


class TestVisionClientLocal:
    """Tests that don't require a running daemon."""

    def test_init(self, mock_socket_path):
        """Test VisionClient initialization."""
        client = VisionClient(socket_path=mock_socket_path)
        assert client.socket_path == mock_socket_path
        assert client.timeout == VisionClient.DEFAULT_TIMEOUT

    def test_image_to_base64(self, client, sample_image):
        """Test image to base64 conversion."""
        b64 = client._image_to_base64(sample_image)
        assert isinstance(b64, str)
        assert len(b64) > 0

    @pytest.mark.asyncio
    async def test_health_check_no_socket(self, client):
        """Test health check when socket doesn't exist."""
        result = await client.health_check()
        assert result is False

    @pytest.mark.asyncio
    async def test_click_point_single_element(self, client):
        """Test click_point with single element."""
        element = {"bbox": [10, 10, 100, 30], "text": "Export"}
        coords = await client.click_point(element)
        assert coords == (60, 25)

    @pytest.mark.asyncio
    async def test_click_point_list(self, client):
        """Test click_point with list of elements."""
        elements = [
            {"bbox": [10, 10, 100, 30], "text": "Export"},
            {"bbox": [120, 10, 100, 30], "text": "Cancel"},
        ]
        coords = await client.click_point(elements)
        assert coords == (60, 25)  # First element

    @pytest.mark.asyncio
    async def test_click_point_empty_list(self, client):
        """Test click_point with empty list."""
        with pytest.raises(ValueError):
            await client.click_point([])

    @pytest.mark.asyncio
    async def test_click_point_no_bbox(self, client):
        """Test click_point with element missing bbox."""
        with pytest.raises(ValueError):
            await client.click_point({"text": "No bbox"})

    @pytest.mark.asyncio
    async def test_query_invalid_image(self, client):
        """Test query with invalid image type."""
        with pytest.raises(ValueError):
            await client.query({"image": 123, "steps": []})

    @pytest.mark.asyncio
    async def test_query_no_socket(self, client, sample_image):
        """Test query when socket doesn't exist."""
        with pytest.raises(VisionClientError) as exc_info:
            await client.query({"image": sample_image, "steps": []})
        assert "socket not found" in str(exc_info.value).lower()


class TestVisionClientIntegration:
    """Integration tests that require a mock daemon."""

    @pytest.mark.asyncio
    async def test_query_with_mock_daemon(self, sample_image):
        """Test query with a mock Unix socket server."""
        socket_path = tempfile.mktemp(suffix=".sock")

        async def mock_server():
            """Mock VisionDaemon server."""
            server = await asyncio.start_unix_server(
                handle_client,
                path=socket_path
            )
            async with server:
                await server.serve_forever()

        async def handle_client(reader, writer):
            """Handle mock client connection."""
            data = await reader.read(1024 * 1024)
            request = json.loads(data)

            # Simulate successful response
            response = {
                "success": True,
                "results": {
                    "element": {
                        "bbox": [10, 10, 100, 30],
                        "text": "Export",
                        "confidence": 0.95
                    }
                },
                "latency_ms": 45
            }
            writer.write(json.dumps(response).encode())
            await writer.drain()
            writer.close()
            await writer.wait_closed()

        # Start mock server in background
        server_task = asyncio.create_task(mock_server())

        try:
            # Wait for server to start
            await asyncio.sleep(0.1)

            client = VisionClient(socket_path=socket_path, timeout=5.0)
            result = await client.query({
                "image": sample_image,
                "steps": [{"op": "ground", "text": "Export", "assign_to": "element"}]
            })

            assert result["success"]
            assert "element" in result["results"]
            assert result["results"]["element"]["text"] == "Export"

        finally:
            # Cleanup
            server_task.cancel()
            try:
                await server_task
            except asyncio.CancelledError:
                pass
            if os.path.exists(socket_path):
                os.unlink(socket_path)


class TestSyncVisionClient:
    """Tests for the synchronous client wrapper."""

    def test_init(self, mock_socket_path):
        """Test SyncVisionClient initialization."""
        client = SyncVisionClient(socket_path=mock_socket_path)
        assert client._client.socket_path == mock_socket_path

    def test_click_point_sync(self):
        """Test synchronous click_point."""
        client = SyncVisionClient()
        element = {"bbox": [10, 10, 100, 30], "text": "Export"}
        coords = client.click_point(element)
        assert coords == (60, 25)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
