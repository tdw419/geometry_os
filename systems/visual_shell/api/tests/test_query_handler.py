"""Tests for VisualBridge synaptic_query handler."""
import pytest
import asyncio
from unittest.mock import AsyncMock, MagicMock, patch


class TestSynapticQueryHandler:
    """Tests for the synaptic_query message handler in VisualBridge."""

    @pytest.fixture
    def mock_bridge(self):
        """Create a mock VisualBridge instance."""
        bridge = MagicMock()
        bridge.connected_clients = set()
        bridge.broadcast = AsyncMock()
        return bridge

    @pytest.mark.asyncio
    async def test_handle_synaptic_query_calls_engine(self, mock_bridge):
        """Handler should call SynapticQueryEngine.query()."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query

        with patch('systems.visual_shell.api.visual_bridge.SynapticQueryEngine') as MockEngine:
            mock_engine = MagicMock()
            mock_engine.query.return_value = [
                {'x': 100, 'y': 200, 'similarity': 0.95, 'token': 'test', 'type': 'memory'}
            ]
            MockEngine.return_value = mock_engine

            result = await handle_synaptic_query(mock_bridge, {'query': 'test query'})

            # Engine.query() is called with query_text and limit
            mock_engine.query.assert_called_once()
            call_args = mock_engine.query.call_args
            assert call_args[0][0] == 'test query'
            assert call_args[1].get('limit') == 10

    @pytest.mark.asyncio
    async def test_handle_synaptic_query_returns_response(self, mock_bridge):
        """Handler should return synaptic_query_response."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query

        with patch('systems.visual_shell.api.visual_bridge.SynapticQueryEngine') as MockEngine:
            mock_engine = MagicMock()
            mock_results = [
                {'x': 100, 'y': 200, 'similarity': 0.95, 'token': 'test', 'type': 'memory'}
            ]
            mock_engine.query.return_value = mock_results
            MockEngine.return_value = mock_engine

            result = await handle_synaptic_query(mock_bridge, {'query': 'test query'})

            assert result['type'] == 'synaptic_query_response'
            assert 'results' in result
            assert result['results'] == mock_results

    @pytest.mark.asyncio
    async def test_handle_synaptic_query_includes_navigate_to(self, mock_bridge):
        """Response should include navigate_to for best match."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query

        with patch('systems.visual_shell.api.visual_bridge.SynapticQueryEngine') as MockEngine:
            mock_engine = MagicMock()
            mock_results = [
                {'x': 100, 'y': 200, 'similarity': 0.95, 'token': 'best', 'type': 'memory'},
                {'x': 300, 'y': 400, 'similarity': 0.85, 'token': 'second', 'type': 'code'}
            ]
            mock_engine.query.return_value = mock_results
            MockEngine.return_value = mock_engine

            result = await handle_synaptic_query(mock_bridge, {'query': 'test query'})

            assert 'navigate_to' in result
            assert result['navigate_to']['x'] == 100
            assert result['navigate_to']['y'] == 200

    @pytest.mark.asyncio
    async def test_handle_synaptic_query_empty_results(self, mock_bridge):
        """Handler should handle empty results gracefully."""
        from systems.visual_shell.api.visual_bridge import handle_synaptic_query

        with patch('systems.visual_shell.api.visual_bridge.SynapticQueryEngine') as MockEngine:
            mock_engine = MagicMock()
            mock_engine.query.return_value = []
            MockEngine.return_value = mock_engine

            result = await handle_synaptic_query(mock_bridge, {'query': 'nonexistent'})

            assert result['type'] == 'synaptic_query_response'
            assert result['results'] == []
            assert result.get('navigate_to') is None
