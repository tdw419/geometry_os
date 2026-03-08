"""
Tests for ExtractionBridge.

Tests the bridge between LiveTile screenshots and the Visual Extraction Pipeline.
"""

import pytest
from unittest.mock import MagicMock, AsyncMock, patch


class TestExtractionBridge:
    """Tests for ExtractionBridge class."""

    @pytest.fixture
    def bridge_no_pipeline(self):
        """Create a bridge without pipeline."""
        with patch('systems.evolution_daemon.extraction_bridge.ExtractionPipeline', None):
            from systems.evolution_daemon.extraction_bridge import ExtractionBridge
            bridge = ExtractionBridge()
            yield bridge

    @pytest.fixture
    def bridge_with_mock_pipeline(self):
        """Create a bridge with mocked pipeline."""
        mock_pipeline = MagicMock()
        mock_result = MagicMock()
        mock_result.to_dict.return_value = {
            "widgets": [{"type": "button", "text": "Click Me"}],
            "metadata": {"clickable_count": 1},
            "ascii_view": "[BUTTON: Click Me]"
        }
        mock_pipeline.extract.return_value = mock_result

        with patch('systems.evolution_daemon.extraction_bridge.ExtractionPipeline', return_value=mock_pipeline):
            from systems.evolution_daemon.extraction_bridge import ExtractionBridge
            bridge = ExtractionBridge()
            bridge.pipeline = mock_pipeline
            yield bridge

    def test_init_without_webmcp(self, bridge_no_pipeline):
        """Test initialization without webmcp."""
        assert bridge_no_pipeline.webmcp is None
        assert bridge_no_pipeline._is_busy is False

    def test_init_with_webmcp(self):
        """Test initialization with webmcp."""
        mock_webmcp = MagicMock()
        with patch('systems.evolution_daemon.extraction_bridge.ExtractionPipeline', None):
            from systems.evolution_daemon.extraction_bridge import ExtractionBridge
            bridge = ExtractionBridge(webmcp=mock_webmcp)
            assert bridge.webmcp is mock_webmcp

    def test_set_webmcp(self, bridge_no_pipeline):
        """Test setting webmcp after initialization."""
        mock_webmcp = MagicMock()
        bridge_no_pipeline.set_webmcp(mock_webmcp)
        assert bridge_no_pipeline.webmcp is mock_webmcp

    @pytest.mark.asyncio
    async def test_extract_without_pipeline(self, bridge_no_pipeline):
        """Test extraction returns None when no pipeline."""
        result = await bridge_no_pipeline.extract_tile_semantics("tile-1", "/path/to/image.png")
        assert result is None

    @pytest.mark.asyncio
    async def test_extract_when_busy(self, bridge_with_mock_pipeline):
        """Test extraction skipped when already busy."""
        bridge_with_mock_pipeline._is_busy = True

        result = await bridge_with_mock_pipeline.extract_tile_semantics("tile-1", "/path/to/image.png")

        assert result is None
        # Pipeline should not have been called
        bridge_with_mock_pipeline.pipeline.extract.assert_not_called()

    @pytest.mark.asyncio
    async def test_extract_success(self, bridge_with_mock_pipeline):
        """Test successful extraction."""
        result = await bridge_with_mock_pipeline.extract_tile_semantics("tile-1", "/path/to/image.png")

        assert result is not None
        assert "widgets" in result
        assert result["widgets"][0]["type"] == "button"

        # Pipeline should have been called
        bridge_with_mock_pipeline.pipeline.extract.assert_called_once()

    @pytest.mark.asyncio
    async def test_extract_with_webmcp_broadcast(self, bridge_with_mock_pipeline):
        """Test extraction broadcasts result via webmcp."""
        mock_webmcp = AsyncMock()
        bridge_with_mock_pipeline.webmcp = mock_webmcp

        await bridge_with_mock_pipeline.extract_tile_semantics("tile-1", "/path/to/image.png")

        # Should have broadcast the result
        mock_webmcp.broadcast_event.assert_called_once()
        call_args = mock_webmcp.broadcast_event.call_args
        assert call_args[0][0] == "tile_extraction_result"
        assert call_args[0][1]["tile_id"] == "tile-1"

    @pytest.mark.asyncio
    async def test_extract_resets_busy_flag(self, bridge_with_mock_pipeline):
        """Test that busy flag is reset after extraction."""
        assert bridge_with_mock_pipeline._is_busy is False

        await bridge_with_mock_pipeline.extract_tile_semantics("tile-1", "/path/to/image.png")

        assert bridge_with_mock_pipeline._is_busy is False

    @pytest.mark.asyncio
    async def test_extract_resets_busy_flag_on_error(self, bridge_with_mock_pipeline):
        """Test that busy flag is reset even on error."""
        bridge_with_mock_pipeline.pipeline.extract.side_effect = Exception("Extraction failed")

        await bridge_with_mock_pipeline.extract_tile_semantics("tile-1", "/path/to/image.png")

        assert bridge_with_mock_pipeline._is_busy is False

    @pytest.mark.asyncio
    async def test_extract_returns_none_on_error(self, bridge_with_mock_pipeline):
        """Test extraction returns None on error."""
        bridge_with_mock_pipeline.pipeline.extract.side_effect = Exception("Extraction failed")

        result = await bridge_with_mock_pipeline.extract_tile_semantics("tile-1", "/path/to/image.png")

        assert result is None


class TestGetExtractionBridge:
    """Tests for get_extraction_bridge singleton."""

    def test_get_bridge_returns_instance(self):
        """Test that get_extraction_bridge returns an instance."""
        import systems.evolution_daemon.extraction_bridge as module
        module._bridge = None  # Reset singleton

        from systems.evolution_daemon.extraction_bridge import get_extraction_bridge, ExtractionBridge
        bridge = get_extraction_bridge()

        assert isinstance(bridge, ExtractionBridge)

    def test_get_bridge_singleton(self):
        """Test that get_extraction_bridge returns singleton."""
        import systems.evolution_daemon.extraction_bridge as module
        module._bridge = None  # Reset singleton

        from systems.evolution_daemon.extraction_bridge import get_extraction_bridge
        b1 = get_extraction_bridge()
        b2 = get_extraction_bridge()

        assert b1 is b2

    def test_get_bridge_with_webmcp_updates_existing(self):
        """Test that passing webmcp updates existing singleton."""
        import systems.evolution_daemon.extraction_bridge as module
        module._bridge = None  # Reset singleton

        from systems.evolution_daemon.extraction_bridge import get_extraction_bridge
        mock_webmcp = MagicMock()

        # First call without webmcp
        bridge = get_extraction_bridge()
        assert bridge.webmcp is None

        # Second call with webmcp should update
        bridge2 = get_extraction_bridge(webmcp=mock_webmcp)
        assert bridge2 is bridge  # Same instance
        assert bridge.webmcp is mock_webmcp
