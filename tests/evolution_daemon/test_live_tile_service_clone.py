#!/usr/bin/env python3
"""
Tests for LiveTileService clone_tile RPC integration.

Task 4 of substrate-cloning spec.
"""

import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock, patch

from systems.evolution_daemon.live_tile_service import LiveTileService, LiveTileInstance


class TestCloneRPC:
    """Test suite for clone_tile RPC in LiveTileService."""

    @pytest.fixture
    def service(self):
        """Create a LiveTileService instance for testing."""
        return LiveTileService()

    @pytest.fixture
    def tile_with_extraction(self):
        """Create a mock tile with extraction data."""
        tile = LiveTileInstance(
            tile_id="test-tile-123",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        # Mock last_extraction from ExtractionBridge
        tile.last_extraction = {
            "widgets": [
                {"type": "button", "bbox": [10, 10, 50, 30], "text": "Click Me"}
            ],
            "metadata": {
                "timestamp": "2026-02-19T12:00:00Z",
                "source": "test"
            }
        }
        return tile

    @pytest.mark.asyncio
    async def test_service_handles_clone_request(self, service, tile_with_extraction):
        """
        Test that LiveTileService.handle_rpc() handles clone_tile method.

        Given: A running tile with extraction data
        When: clone_tile RPC is called
        Then: Returns task_id for tracking the clone operation
        """
        # Arrange: Add tile with extraction to service
        service.tiles[tile_with_extraction.tile_id] = tile_with_extraction

        # Act: Call clone_tile RPC
        result = await service.handle_rpc(
            method="clone_tile",
            params={
                "tile_id": "test-tile-123",
                "target_name": "my_panel"
            }
        )

        # Assert: Result contains task_id
        assert result is not None
        assert "task_id" in result
        assert result["task_id"].startswith("clone-")
        assert "status" in result
        # Clone is executed synchronously, so status should be completed
        assert result["status"] in ["pending", "completed"]
        # If completed, should have output_path
        if result["status"] == "completed":
            assert "output_path" in result

    @pytest.mark.asyncio
    async def test_clone_returns_error_for_missing_tile(self, service):
        """
        Test clone_tile returns error for non-existent tile.
        """
        result = await service.handle_rpc(
            method="clone_tile",
            params={
                "tile_id": "non-existent-tile",
                "target_name": "my_panel"
            }
        )

        assert result is not None
        assert result.get("status") == "error"
        assert "not found" in result.get("error", "").lower()

    @pytest.mark.asyncio
    async def test_clone_returns_error_for_no_extraction(self, service):
        """
        Test clone_tile returns error when tile has no extraction data.
        """
        # Tile without extraction data
        tile = LiveTileInstance(
            tile_id="tile-no-extraction",
            rts_path="/path/to/test.rts.png",
            status="running"
        )
        # No last_extraction attribute
        service.tiles[tile.tile_id] = tile

        result = await service.handle_rpc(
            method="clone_tile",
            params={
                "tile_id": "tile-no-extraction",
                "target_name": "my_panel"
            }
        )

        assert result is not None
        assert result.get("status") == "error"
        assert "extraction" in result.get("error", "").lower()
