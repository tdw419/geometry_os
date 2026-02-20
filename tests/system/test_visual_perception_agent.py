"""
Tests for VisualPerceptionAgent - Render Monitoring.
"""

import pytest
import asyncio
import os
import sys
from unittest.mock import Mock, patch, AsyncMock, MagicMock

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))

from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent

class TestVisualPerceptionAgent:
    """Tests for the Visual Perception Agent."""

    @pytest.fixture
    def agent(self):
        return VisualPerceptionAgent("visual-perception-1")

    @pytest.mark.asyncio
    async def test_agent_initialization(self, agent):
        """Agent initializes with correct capabilities."""
        assert "visual_perception" in agent.capabilities
        assert "extraction" in agent.capabilities

    @pytest.mark.asyncio
    async def test_message_handler_registration(self, agent):
        """Agent handles PERCEIVE_REGION messages."""
        msg = {
            "type": "PERCEIVE_REGION",
            "from_agent": "requester-1",
            "payload": {
                "region": {"x": 0, "y": 0, "w": 512, "h": 512}
            }
        }
        
        # Mock extraction for this test
        agent._extract_region = lambda r, i: {"widgets": [], "metadata": {}}
        
        response = await agent.handle_message(msg)
        assert response["type"] == "PERCEPTION_RESULT"
        assert "scene_graph" in response["payload"]

    @pytest.mark.asyncio
    async def test_change_aware_broadcasting(self, agent):
        """Agent detects changes in visual state."""
        state1 = {"widgets": [{"id": 1}]}
        state2 = {"widgets": [{"id": 1}]} # Same state
        state3 = {"widgets": [{"id": 1}, {"id": 2}]} # Changed state
        
        assert agent._detect_change(state1, state2) is False
        assert agent._detect_change(state2, state3) is True


class TestRenderMonitorHandler:
    """Test MONITOR_RENDER message handling."""

    @pytest.fixture
    def agent(self):
        return VisualPerceptionAgent(agent_id="test-perception-001")

    def test_handle_monitor_render_message_type(self, agent):
        """Test that MONITOR_RENDER is a recognized message type."""
        # The handler should exist
        assert hasattr(agent, '_handle_monitor_render')

    @pytest.mark.asyncio
    async def test_monitor_render_starts_monitoring(self, agent):
        """Test that MONITOR_RENDER starts a monitoring task."""
        msg = {
            "type": "MONITOR_RENDER",
            "payload": {
                "vm_id": "test-vm-001",
                "poll_interval": 1
            }
        }

        # Will fail until _handle_monitor_render is implemented to route to _start_render_monitor
        with patch.object(agent, '_start_render_monitor', new_callable=AsyncMock, create=True) as mock_start:
            mock_start.return_value = {"monitor_id": "monitor-001", "status": "active"}

            result = await agent.handle_message(msg)

        assert result is not None
        assert result.get("type") == "MONITORING_STARTED"
        mock_start.assert_called_once_with(msg["payload"])

    @pytest.mark.asyncio
    async def test_stop_monitor_stops_monitoring(self, agent):
        """Test that STOP_MONITOR stops a monitoring task."""
        msg = {
            "type": "STOP_MONITOR",
            "payload": {
                "monitor_id": "monitor-001"
            }
        }

        # Will fail until _handle_stop_monitor is implemented to route to _stop_render_monitor
        with patch.object(agent, '_stop_render_monitor', new_callable=AsyncMock, create=True) as mock_stop:
            mock_stop.return_value = {"status": "stopped"}

            result = await agent.handle_message(msg)

        assert result is not None
        mock_stop.assert_called_once_with("monitor-001")


class TestRenderMonitorLifecycle:
    """Test render monitoring lifecycle."""

    @pytest.fixture
    def agent(self):
        from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent
        agent = VisualPerceptionAgent(agent_id="test-perception-002")
        # Mock the event bus
        agent.send_event = AsyncMock()
        return agent

    @pytest.mark.asyncio
    async def test_monitor_generates_unique_id(self, agent):
        """Test that each monitor gets a unique ID."""
        msg1 = {"type": "MONITOR_RENDER", "payload": {"vm_id": "vm-001"}}
        msg2 = {"type": "MONITOR_RENDER", "payload": {"vm_id": "vm-002"}}

        with patch.object(agent, '_run_monitor_loop', new_callable=AsyncMock):
            result1 = await agent._start_render_monitor(msg1["payload"])
            result2 = await agent._start_render_monitor(msg2["payload"])

        assert result1["monitor_id"] != result2["monitor_id"]

    @pytest.mark.asyncio
    async def test_active_monitors_tracking(self, agent):
        """Test that active monitors are tracked."""
        msg = {"type": "MONITOR_RENDER", "payload": {"vm_id": "vm-001"}}

        with patch.object(agent, '_run_monitor_loop', new_callable=AsyncMock):
            result = await agent._start_render_monitor(msg["payload"])

        monitor_id = result["monitor_id"]
        assert monitor_id in agent._active_monitors

    @pytest.mark.asyncio
    async def test_stop_removes_from_active(self, agent):
        """Test that STOP_MONITOR removes from active monitors."""
        msg = {"type": "MONITOR_RENDER", "payload": {"vm_id": "vm-001"}}

        with patch.object(agent, '_run_monitor_loop', new_callable=AsyncMock):
            result = await agent._start_render_monitor(msg["payload"])

        monitor_id = result["monitor_id"]
        await agent._stop_render_monitor(monitor_id)

        assert monitor_id not in agent._active_monitors
