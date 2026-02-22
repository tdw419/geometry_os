# tests/system/test_coordinator_agent.py
import pytest
import asyncio
from systems.visual_shell.swarm.coordinator_agent import CoordinatorAgent

class TestCoordinatorAgent:
    """Tests for the swarm coordinator."""

    @pytest.mark.asyncio
    async def test_coordinator_initialization(self):
        """Coordinator initializes with task and agent registries."""
        coord = CoordinatorAgent(a2a_url="ws://localhost:8766")

        assert coord.pending_tasks == []
        assert coord.active_agents == {}
        assert coord.task_history == []

    @pytest.mark.asyncio
    async def test_coordinator_assigns_task_to_available_agent(self):
        """Coordinator can assign tasks to available agents."""
        coord = CoordinatorAgent(a2a_url="ws://localhost:8766")

        # Register a task
        task_id = await coord.submit_task(
            task_type="scan_region",
            params={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        assert task_id is not None
        assert len(coord.pending_tasks) == 1

    @pytest.mark.asyncio
    async def test_coordinator_complete_task(self):
        """Coordinator marks tasks complete and tracks history."""
        coord = CoordinatorAgent(a2a_url="ws://localhost:8766")

        task_id = await coord.submit_task("scan", {"x": 0})
        await coord.register_agent("agent-001", {"type": "scanner"})
        await coord.assign_task(task_id, "agent-001")

        await coord.complete_task(task_id, "agent-001", result={"count": 5})

        assert len(coord.task_history) == 1
        assert coord.task_history[0].status == "completed"

    @pytest.mark.asyncio
    async def test_coordinator_fail_task_retries(self):
        """Failed tasks are retried up to max_retries."""
        coord = CoordinatorAgent(a2a_url="ws://localhost:8766")

        task_id = await coord.submit_task("scan", {"x": 0})
        await coord.register_agent("agent-001", {})
        await coord.assign_task(task_id, "agent-001")

        # First failure - should retry
        await coord.fail_task(task_id, "agent-001", error="timeout")

        assert len(coord.pending_tasks) == 1

    @pytest.mark.asyncio
    async def test_coordinator_reassigns_on_disconnect(self):
        """Tasks are reassigned when agents disconnect."""
        coord = CoordinatorAgent(a2a_url="ws://localhost:8766")

        task_id = await coord.submit_task("scan", {"x": 0})
        await coord.register_agent("agent-001", {})
        await coord.assign_task(task_id, "agent-001")

        await coord.unregister_agent("agent-001")

        assert len(coord.pending_tasks) == 1
