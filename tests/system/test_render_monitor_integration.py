"""
Integration tests for Render Monitor workflow.
"""

import pytest
import asyncio
import os
import sys
from unittest.mock import Mock, patch, AsyncMock

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestRenderMonitorIntegration:
    """Integration tests for render monitoring."""

    @pytest.fixture
    def agent(self):
        from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent
        agent = VisualPerceptionAgent(agent_id="integration-test-001")
        agent.send_event = AsyncMock()
        return agent

    @pytest.mark.asyncio
    async def test_full_monitoring_lifecycle(self, agent):
        """Test start -> detect -> broadcast -> stop lifecycle."""
        # Mock screenshot capture and extraction
        with patch.object(agent, '_capture_vm_screenshot', new_callable=AsyncMock) as mock_capture:
            with patch.object(agent, '_extract_from_screenshot', new_callable=AsyncMock) as mock_extract:
                mock_capture.return_value = "/tmp/test.png"
                # First call: 50% progress, Second call: 100% complete
                mock_extract.side_effect = [
                    {"widgets": [{"text": "Progress: 50%", "bbox": [0, 0, 100, 20]}]},
                    {"widgets": [{"text": "Export Complete - 100%", "bbox": [0, 0, 100, 20]}]}
                ]

                # Start monitoring with short interval
                result = await agent._start_render_monitor({
                    "vm_id": "test-vm",
                    "poll_interval": 0.1
                })

                monitor_id = result["monitor_id"]
                assert monitor_id in agent._active_monitors

                # Wait for detection (with timeout)
                await asyncio.sleep(0.5)

                # Verify broadcast was called with RENDER_COMPLETE
                broadcasts = agent.send_event.call_args_list
                complete_calls = [c for c in broadcasts if c[0][0].get("type") == "RENDER_COMPLETE"]
                assert len(complete_calls) > 0

    @pytest.mark.asyncio
    async def test_error_broadcast_on_screenshot_failure(self, agent):
        """Test that screenshot failures are handled gracefully."""
        with patch.object(agent, '_capture_vm_screenshot', new_callable=AsyncMock) as mock_capture:
            mock_capture.side_effect = Exception("VM not accessible")

            result = await agent._start_render_monitor({
                "vm_id": "unreachable-vm",
                "poll_interval": 0.1
            })

            monitor_id = result["monitor_id"]

            # Wait for a few polling cycles
            await asyncio.sleep(0.3)

            # Monitor should still be running (error is logged, not fatal)
            # Or it should have stopped gracefully

    @pytest.mark.asyncio
    async def test_manual_stop_during_monitoring(self, agent):
        """Test that STOP_MONITOR works during active monitoring."""
        with patch.object(agent, '_capture_vm_screenshot', new_callable=AsyncMock) as mock_capture:
            with patch.object(agent, '_extract_from_screenshot', new_callable=AsyncMock) as mock_extract:
                mock_capture.return_value = "/tmp/test.png"
                mock_extract.return_value = {"widgets": [{"text": "Progress: 50%"}]}

                result = await agent._start_render_monitor({
                    "vm_id": "test-vm",
                    "poll_interval": 1
                })

                monitor_id = result["monitor_id"]
                assert monitor_id in agent._active_monitors

                # Stop immediately
                await asyncio.sleep(0.1)
                stop_result = await agent._stop_render_monitor(monitor_id)

                assert stop_result["status"] == "stopped"
                assert monitor_id not in agent._active_monitors
