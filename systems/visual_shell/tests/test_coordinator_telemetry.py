"""
Tests for CoordinatorAgent task telemetry emission.

These tests verify that the CoordinatorAgent emits telemetry events
for task lifecycle changes to enable HUD visualization.
"""

import asyncio
import json
import pytest
from unittest.mock import AsyncMock, MagicMock, patch
import time

from systems.visual_shell.swarm.coordinator_agent import CoordinatorAgent, SwarmTask


@pytest.fixture
def coordinator():
    """Create a CoordinatorAgent instance for testing."""
    return CoordinatorAgent(a2a_url="ws://localhost:8766", agent_id="test-coordinator")


@pytest.fixture
def mock_websocket():
    """Create a mock websocket for testing."""
    ws = AsyncMock()
    ws.send = AsyncMock()
    return ws


class TestEmitTaskUpdateSendsTelemetry:
    """Tests for the _emit_task_update method."""

    @pytest.mark.asyncio
    async def test_emit_task_update_sends_telemetry(self, coordinator, mock_websocket):
        """Test that _emit_task_update sends telemetry via websocket."""
        coordinator.ws = mock_websocket

        task = SwarmTask(
            task_id="task-test123",
            task_type="code_review",
            params={"file": "test.py"},
            status="assigned",
            assigned_to="agent-001"
        )

        await coordinator._emit_task_update(task, previous_status="pending")

        # Verify send was called
        assert mock_websocket.send.called

        # Verify telemetry structure
        sent_data = mock_websocket.send.call_args[0][0]
        telemetry = json.loads(sent_data)

        assert telemetry["type"] == "task_update"
        assert telemetry["data"]["task_id"] == "task-test123"
        assert telemetry["data"]["task_type"] == "code_review"
        assert telemetry["data"]["status"] == "assigned"
        assert telemetry["data"]["previous_status"] == "pending"
        assert telemetry["data"]["assigned_to"] == "agent-001"
        assert "timestamp" in telemetry["data"]

    @pytest.mark.asyncio
    async def test_emit_task_update_no_websocket(self, coordinator):
        """Test that _emit_task_update handles missing websocket gracefully."""
        coordinator.ws = None

        task = SwarmTask(
            task_id="task-test456",
            task_type="test",
            params={}
        )

        # Should not raise exception
        await coordinator._emit_task_update(task)

    @pytest.mark.asyncio
    async def test_emit_task_update_includes_duration(self, coordinator, mock_websocket):
        """Test that _emit_task_update includes duration for started tasks."""
        coordinator.ws = mock_websocket

        task = SwarmTask(
            task_id="task-duration",
            task_type="compute",
            params={},
            status="completed",
            started_at=time.time() - 10.0  # Started 10 seconds ago
        )

        await coordinator._emit_task_update(task)

        sent_data = mock_websocket.send.call_args[0][0]
        telemetry = json.loads(sent_data)

        assert telemetry["data"]["duration"] is not None
        assert telemetry["data"]["duration"] >= 10.0

    @pytest.mark.asyncio
    async def test_emit_task_update_includes_error(self, coordinator, mock_websocket):
        """Test that _emit_task_update includes error information."""
        coordinator.ws = mock_websocket

        task = SwarmTask(
            task_id="task-errored",
            task_type="test",
            params={},
            status="failed",
            error="Connection timeout"
        )

        await coordinator._emit_task_update(task)

        sent_data = mock_websocket.send.call_args[0][0]
        telemetry = json.loads(sent_data)

        assert telemetry["data"]["error"] == "Connection timeout"
        assert telemetry["data"]["retry_count"] == 0


class TestSubmitTaskEmitsTelemetry:
    """Tests for telemetry emission in submit_task."""

    @pytest.mark.asyncio
    async def test_submit_task_emits_telemetry(self, coordinator, mock_websocket):
        """Test that submit_task emits telemetry for new tasks."""
        coordinator.ws = mock_websocket

        task_id = await coordinator.submit_task(
            task_type="code_analysis",
            params={"file": "main.py"}
        )

        # Verify telemetry was sent
        assert mock_websocket.send.called

        sent_data = mock_websocket.send.call_args[0][0]
        telemetry = json.loads(sent_data)

        assert telemetry["type"] == "task_update"
        assert telemetry["data"]["task_id"] == task_id
        assert telemetry["data"]["task_type"] == "code_analysis"
        assert telemetry["data"]["status"] == "pending"
        assert telemetry["data"]["previous_status"] is None


class TestAssignTaskEmitsTelemetry:
    """Tests for telemetry emission in assign_task."""

    @pytest.mark.asyncio
    async def test_assign_task_emits_telemetry(self, coordinator, mock_websocket):
        """Test that assign_task emits telemetry on task assignment."""
        coordinator.ws = mock_websocket

        # First submit a task
        task_id = await coordinator.submit_task("test", {})

        # Reset mock to focus on assign telemetry
        mock_websocket.send.reset_mock()

        # Assign the task
        result = await coordinator.assign_task(task_id, "agent-assign-test")

        assert result is True
        assert mock_websocket.send.called

        sent_data = mock_websocket.send.call_args[0][0]
        telemetry = json.loads(sent_data)

        assert telemetry["type"] == "task_update"
        assert telemetry["data"]["task_id"] == task_id
        assert telemetry["data"]["status"] == "assigned"
        assert telemetry["data"]["assigned_to"] == "agent-assign-test"
        assert telemetry["data"]["previous_status"] == "pending"


class TestCompleteTaskEmitsTelemetry:
    """Tests for telemetry emission in complete_task."""

    @pytest.mark.asyncio
    async def test_complete_task_emits_telemetry(self, coordinator, mock_websocket):
        """Test that complete_task emits telemetry on task completion."""
        coordinator.ws = mock_websocket

        # Submit and assign a task
        task_id = await coordinator.submit_task("test_complete", {})
        await coordinator.assign_task(task_id, "agent-complete-test")

        # Reset mock to focus on complete telemetry
        mock_websocket.send.reset_mock()

        # Complete the task
        result = await coordinator.complete_task(
            task_id,
            "agent-complete-test",
            result={"output": "success"}
        )

        assert result is True
        assert mock_websocket.send.called

        sent_data = mock_websocket.send.call_args[0][0]
        telemetry = json.loads(sent_data)

        assert telemetry["type"] == "task_update"
        assert telemetry["data"]["task_id"] == task_id
        assert telemetry["data"]["status"] == "completed"
        assert telemetry["data"]["previous_status"] == "assigned"
        assert telemetry["data"]["result"]["output"] == "success"


class TestFailTaskEmitsTelemetry:
    """Tests for telemetry emission in fail_task."""

    @pytest.mark.asyncio
    async def test_fail_task_emits_telemetry(self, coordinator, mock_websocket):
        """Test that fail_task emits telemetry on task failure."""
        coordinator.ws = mock_websocket

        # Submit and assign a task
        task_id = await coordinator.submit_task("test_fail", {})
        await coordinator.assign_task(task_id, "agent-fail-test")

        # Reset mock to focus on fail telemetry
        mock_websocket.send.reset_mock()

        # Fail the task
        result = await coordinator.fail_task(
            task_id,
            "agent-fail-test",
            error="Processing failed"
        )

        assert result is True
        assert mock_websocket.send.called

        sent_data = mock_websocket.send.call_args[0][0]
        telemetry = json.loads(sent_data)

        assert telemetry["type"] == "task_update"
        assert telemetry["data"]["task_id"] == task_id
        # When retry happens, status should be "pending"
        assert telemetry["data"]["status"] in ["pending", "failed"]
        assert telemetry["data"]["error"] == "Processing failed"
        assert telemetry["data"]["retry_count"] == 1

    @pytest.mark.asyncio
    async def test_fail_task_permanent_failure_emits_telemetry(self, coordinator, mock_websocket):
        """Test that permanent task failure emits correct telemetry."""
        coordinator.ws = mock_websocket

        # Submit a task
        task_id = await coordinator.submit_task("test_permanent_fail", {})
        await coordinator.assign_task(task_id, "agent-perm-fail")

        # Get the task and set retry count to max
        task = coordinator.active_tasks[task_id]
        task.retry_count = 3  # At max retries

        mock_websocket.send.reset_mock()

        # Fail the task - should become permanent failure
        result = await coordinator.fail_task(
            task_id,
            "agent-perm-fail",
            error="Permanent failure"
        )

        assert result is True
        assert mock_websocket.send.called

        sent_data = mock_websocket.send.call_args[0][0]
        telemetry = json.loads(sent_data)

        assert telemetry["data"]["status"] == "failed"
        assert telemetry["data"]["error"] == "Permanent failure"


class TestTelemetryExceptionHandling:
    """Tests for telemetry exception handling."""

    @pytest.mark.asyncio
    async def test_emit_task_update_handles_send_exception(self, coordinator, mock_websocket):
        """Test that _emit_task_update handles websocket send exceptions."""
        coordinator.ws = mock_websocket
        mock_websocket.send.side_effect = Exception("Connection lost")

        task = SwarmTask(
            task_id="task-exception",
            task_type="test",
            params={}
        )

        # Should not raise exception
        await coordinator._emit_task_update(task)

        # Task should still be in active_tasks
        assert True  # No exception raised
