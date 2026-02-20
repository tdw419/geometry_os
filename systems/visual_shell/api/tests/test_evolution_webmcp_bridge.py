#!/usr/bin/env python3
"""
Tests for Evolution WebMCP Bridge

Run with: python -m pytest tests/test_evolution_webmcp_bridge.py -v
"""

import pytest
import sys
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock

# Add parent directory to path
sys.path.insert(0, str(Path(__file__).parent.parent))


class TestWebMCPTool:
    """Tests for WebMCPTool dataclass."""

    def test_tool_creation(self):
        """Test creating a WebMCP tool."""
        from evolution_webmcp_bridge import WebMCPTool

        tool = WebMCPTool(
            name="testTool",
            description="A test tool",
            parameters={"type": "object", "properties": {}}
        )

        assert tool.name == "testTool"
        assert tool.description == "A test tool"
        assert tool.returns == "object"


class TestToolInvocation:
    """Tests for ToolInvocation dataclass."""

    def test_invocation_creation(self):
        """Test creating a tool invocation."""
        from evolution_webmcp_bridge import ToolInvocation

        invocation = ToolInvocation(
            tool="createPost",
            arguments={"title": "Test", "content": "Content"}
        )

        assert invocation.tool == "createPost"
        assert invocation.arguments["title"] == "Test"
        assert invocation.timestamp is not None


class TestWordPressTools:
    """Tests for WordPress tool definitions."""

    def test_all_tools_defined(self):
        """Test all tools are defined."""
        from evolution_webmcp_bridge import WordPressTools

        tools = WordPressTools.ALL_TOOLS
        tool_names = [t.name for t in tools]

        assert "createPost" in tool_names
        assert "editPage" in tool_names
        assert "updateArchitecture" in tool_names
        assert "logEvolution" in tool_names
        assert "createWidget" in tool_names

    def test_create_post_parameters(self):
        """Test createPost tool parameters."""
        from evolution_webmcp_bridge import WordPressTools

        tool = WordPressTools.CREATE_POST
        props = tool.parameters["properties"]

        assert "title" in props
        assert "content" in props
        assert tool.parameters["required"] == ["title", "content"]


class TestEvolutionWebMCPBridge:
    """Tests for EvolutionWebMCPBridge class."""

    @pytest.fixture
    def bridge(self):
        """Create a bridge instance with WordPress disabled."""
        from evolution_webmcp_bridge import EvolutionWebMCPBridge
        return EvolutionWebMCPBridge(enabled=False)

    @pytest.fixture
    def mock_bridge(self):
        """Create a bridge with mocked requests."""
        from evolution_webmcp_bridge import EvolutionWebMCPBridge

        with patch('evolution_webmcp_bridge.requests') as mock_requests:
            mock_requests.get.return_value.status_code = 200
            mock_requests.post.return_value.status_code = 200
            mock_requests.post.return_value.json.return_value = {"post_id": 1}

            bridge = EvolutionWebMCPBridge(enabled=True)
            bridge._available = True  # Force available
            yield bridge, mock_requests

    def test_bridge_initialization(self, bridge):
        """Test bridge initializes correctly."""
        assert bridge is not None
        assert bridge.enabled is False

    def test_create_post_disabled(self, bridge):
        """Test create_post when disabled."""
        result = bridge.create_post("Title", "Content")
        assert result["success"] is False
        assert "error" in result

    def test_create_post_mock(self, mock_bridge):
        """Test create_post with mocked requests."""
        bridge, mock_requests = mock_bridge

        result = bridge.create_post(
            title="Test Post",
            content="<p>Test content</p>",
            category="evolution"
        )

        assert result["success"] is True
        mock_requests.post.assert_called()

    def test_edit_page_mock(self, mock_bridge):
        """Test edit_page with mocked requests."""
        bridge, mock_requests = mock_bridge

        result = bridge.edit_page(
            slug="neural-substrate",
            content="<p>Updated content</p>"
        )

        assert result["success"] is True

    def test_log_evolution_mock(self, mock_bridge):
        """Test log_evolution with mocked requests."""
        bridge, mock_requests = mock_bridge

        result = bridge.log_evolution(
            cycle=50,
            target="test.py",
            improvement="Test improvement",
            delta=0.15
        )

        assert result["success"] is True

    def test_get_available_tools(self, bridge):
        """Test getting available tools."""
        tools = bridge.get_available_tools()
        assert len(tools) == 5

    def test_stats_tracking(self, bridge):
        """Test stats are tracked."""
        stats = bridge.get_stats()

        assert "total_invocations" in stats
        assert "successful" in stats
        assert "failed" in stats
        assert "enabled" in stats


class TestEvolutionWebMCPHook:
    """Tests for EvolutionWebMCPHook class."""

    @pytest.fixture
    def hook(self):
        """Create a hook instance."""
        from evolution_webmcp_bridge import EvolutionWebMCPHook, EvolutionWebMCPBridge

        bridge = EvolutionWebMCPBridge(enabled=False)
        return EvolutionWebMCPHook(bridge=bridge)

    def test_hook_initialization(self, hook):
        """Test hook initializes correctly."""
        assert hook is not None
        assert hook.min_delta_threshold == 0.05

    def test_on_improvement_small_delta(self, hook):
        """Test on_improvement with small delta."""
        result = hook.on_improvement(
            cycle=50,
            target="test.py",
            improvement="Tiny improvement",
            delta=0.01  # Below threshold
        )
        assert result is False

    def test_on_improvement_valid_delta(self, hook):
        """Test on_improvement with valid delta."""
        result = hook.on_improvement(
            cycle=50,
            target="test.py",
            improvement="Significant improvement",
            delta=0.15  # Above threshold
        )
        # Bridge is disabled, so will return False
        assert result is False


class TestConvenienceFunctions:
    """Tests for convenience functions."""

    def test_create_evolution_wordpress_hook(self):
        """Test create_evolution_wordpress_hook function."""
        from evolution_webmcp_bridge import create_evolution_wordpress_hook

        hook = create_evolution_wordpress_hook("http://localhost:8080")
        assert hook is not None
        assert hook.bridge is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
