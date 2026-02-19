"""End-to-end test for Task DAG visualization pipeline.

These tests validate the complete flow from CoordinatorAgent task lifecycle
events through SwarmMonitor DAG aggregation to ensure the Task DAG
visualization pipeline works correctly.

Test coverage:
- Task lifecycle visibility in aggregated DAG
- Task assignment creates flow animation data
- DAG summary includes all status counts
"""

import pytest
import asyncio
import json
from unittest.mock import AsyncMock, patch

from systems.visual_shell.swarm.coordinator_agent import CoordinatorAgent
from systems.visual_shell.swarm.swarm_monitor import SwarmMonitor


@pytest.fixture
def coordinator():
    """Create a CoordinatorAgent with mocked WebSocket."""
    coord = CoordinatorAgent(a2a_url="ws://localhost:18766")
    coord.ws = AsyncMock()
    return coord


@pytest.fixture
def monitor():
    """Create a SwarmMonitor instance."""
    return SwarmMonitor(
        a2a_url="ws://localhost:18766",
        bridge_url="ws://localhost:18768"
    )


class TestTaskLifecycleVisibleInDag:
    """Tests for task lifecycle visibility in aggregated DAG."""

    @pytest.mark.asyncio
    async def test_task_lifecycle_visible_in_dag(self, coordinator, monitor):
        """Test that task lifecycle is visible in the aggregated DAG."""
        # Submit task
        task_id = await coordinator.submit_task("render_pixel", {"x": 100, "y": 200})

        # Get telemetry and process through monitor
        sent = json.loads(coordinator.ws.send.call_args[0][0])
        assert sent["type"] == "task_update"
        monitor._process_task_update(sent["data"])

        # Verify DAG updated
        assert task_id in monitor.task_dag
        assert monitor.task_dag[task_id]["status"] == "pending"


class TestTaskAssignmentCreatesFlowData:
    """Tests for task assignment creating flow animation data."""

    @pytest.mark.asyncio
    async def test_task_assignment_creates_flow_data(self, coordinator, monitor):
        """Test that task assignment creates flow animation data."""
        # Submit and process
        task_id = await coordinator.submit_task("render_pixel", {"x": 100})
        submit_call = coordinator.ws.send.call_args
        monitor._process_task_update(json.loads(submit_call[0][0])["data"])

        # Assign and process
        coordinator.ws.reset_mock()
        await coordinator.assign_task(task_id, "worker-001")
        assign_call = coordinator.ws.send.call_args
        monitor._process_task_update(json.loads(assign_call[0][0])["data"])

        # Verify transition recorded
        task = monitor.task_dag[task_id]
        assert len(task["transitions"]) == 2

    @pytest.mark.asyncio
    async def test_task_transition_tracks_from_to_status(self, coordinator, monitor):
        """Test that transitions properly track from/to status changes."""
        # Submit task
        task_id = await coordinator.submit_task("render_pixel", {"x": 100})
        submit_call = coordinator.ws.send.call_args
        monitor._process_task_update(json.loads(submit_call[0][0])["data"])

        # Assign task
        coordinator.ws.reset_mock()
        await coordinator.assign_task(task_id, "worker-001")
        assign_call = coordinator.ws.send.call_args
        monitor._process_task_update(json.loads(assign_call[0][0])["data"])

        # Verify transition has from/to
        task = monitor.task_dag[task_id]
        assert task["transitions"][1]["from"] == "pending"
        assert task["transitions"][1]["to"] == "assigned"


class TestDagSummaryIncludesAllStatuses:
    """Tests for DAG summary status counts."""

    @pytest.mark.asyncio
    async def test_dag_summary_includes_all_statuses(self, monitor):
        """Test that DAG summary includes correct status counts."""
        # Add tasks in different states
        for i in range(3):
            monitor._process_task_update({
                "task_id": f"task-{i}",
                "task_type": "render",
                "status": "pending" if i == 0 else "assigned" if i == 1 else "completed",
                "timestamp": 1708300000.0 + i
            })

        summary = monitor._get_task_dag_summary()

        assert summary["total_tasks"] == 3
        assert summary["pending"] == 1
        assert summary["assigned"] == 1
        assert summary["completed"] == 1

    @pytest.mark.asyncio
    async def test_dag_summary_counts_failed_tasks(self, monitor):
        """Test that DAG summary correctly counts failed tasks."""
        # Add tasks with failed status
        monitor._process_task_update({
            "task_id": "task-failed-1",
            "task_type": "render",
            "status": "failed",
            "timestamp": 1708300000.0
        })
        monitor._process_task_update({
            "task_id": "task-failed-2",
            "task_type": "compile",
            "status": "failed",
            "timestamp": 1708300001.0
        })

        summary = monitor._get_task_dag_summary()

        assert summary["total_tasks"] == 2
        assert summary["failed"] == 2

    @pytest.mark.asyncio
    async def test_dag_summary_active_tasks_list(self, monitor):
        """Test that DAG summary includes active tasks list."""
        # Add pending and assigned tasks
        monitor._process_task_update({
            "task_id": "task-active-1",
            "task_type": "render",
            "status": "pending",
            "timestamp": 1708300000.0
        })
        monitor._process_task_update({
            "task_id": "task-active-2",
            "task_type": "compile",
            "status": "assigned",
            "assigned_to": "worker-001",
            "timestamp": 1708300001.0
        })
        # Add completed task (should not be in active list)
        monitor._process_task_update({
            "task_id": "task-done-1",
            "task_type": "test",
            "status": "completed",
            "timestamp": 1708300002.0
        })

        summary = monitor._get_task_dag_summary()

        # Active tasks should only include pending/assigned
        assert len(summary["active_tasks"]) == 2
        active_ids = [t["task_id"] for t in summary["active_tasks"]]
        assert "task-active-1" in active_ids
        assert "task-active-2" in active_ids
        assert "task-done-1" not in active_ids


class TestFullTaskLifecycle:
    """Tests for complete task lifecycle through DAG."""

    @pytest.mark.asyncio
    async def test_full_task_lifecycle_submit_assign_complete(self, coordinator, monitor):
        """Test complete task lifecycle: submit -> assign -> complete."""
        # Submit
        task_id = await coordinator.submit_task("render_pixel", {"x": 100})
        submit_telemetry = json.loads(coordinator.ws.send.call_args[0][0])
        monitor._process_task_update(submit_telemetry["data"])

        assert monitor.task_dag[task_id]["status"] == "pending"

        # Assign
        coordinator.ws.reset_mock()
        await coordinator.assign_task(task_id, "worker-001")
        assign_telemetry = json.loads(coordinator.ws.send.call_args[0][0])
        monitor._process_task_update(assign_telemetry["data"])

        assert monitor.task_dag[task_id]["status"] == "assigned"
        assert monitor.task_dag[task_id]["assigned_to"] == "worker-001"

        # Complete
        coordinator.ws.reset_mock()
        await coordinator.complete_task(task_id, "worker-001", {"output": "success"})
        complete_telemetry = json.loads(coordinator.ws.send.call_args[0][0])
        monitor._process_task_update(complete_telemetry["data"])

        assert monitor.task_dag[task_id]["status"] == "completed"

        # Verify all transitions recorded
        assert len(monitor.task_dag[task_id]["transitions"]) == 3

    @pytest.mark.asyncio
    async def test_full_task_lifecycle_with_failure(self, coordinator, monitor):
        """Test task lifecycle with failure and retry."""
        # Submit
        task_id = await coordinator.submit_task("render_pixel", {"x": 100})
        submit_telemetry = json.loads(coordinator.ws.send.call_args[0][0])
        monitor._process_task_update(submit_telemetry["data"])

        # Assign
        coordinator.ws.reset_mock()
        await coordinator.assign_task(task_id, "worker-001")
        assign_telemetry = json.loads(coordinator.ws.send.call_args[0][0])
        monitor._process_task_update(assign_telemetry["data"])

        # Fail (should requeue as pending for retry)
        coordinator.ws.reset_mock()
        await coordinator.fail_task(task_id, "worker-001", "Connection lost")
        fail_telemetry = json.loads(coordinator.ws.send.call_args[0][0])
        monitor._process_task_update(fail_telemetry["data"])

        # After first failure, task should be pending (requeued for retry)
        assert monitor.task_dag[task_id]["status"] == "pending"

        # Verify telemetry contains retry_count
        assert fail_telemetry["data"]["retry_count"] == 1
        assert fail_telemetry["data"]["error"] == "Connection lost"


class TestTaskHistoryTracking:
    """Tests for task history tracking in monitor."""

    @pytest.mark.asyncio
    async def test_task_history_records_updates(self, coordinator, monitor):
        """Test that task updates are recorded in history."""
        initial_history_len = len(monitor.task_history)

        # Submit task
        task_id = await coordinator.submit_task("render_pixel", {"x": 100})
        submit_telemetry = json.loads(coordinator.ws.send.call_args[0][0])
        monitor._process_task_update(submit_telemetry["data"])

        # History should have new entry
        assert len(monitor.task_history) == initial_history_len + 1

        # Verify history entry structure
        history_entry = monitor.task_history[-1]
        assert history_entry["task_id"] == task_id
        assert history_entry["status"] == "pending"

    @pytest.mark.asyncio
    async def test_task_history_maxlen(self, monitor):
        """Test that task history respects maxlen=100."""
        # Add more than 100 entries
        for i in range(150):
            monitor._process_task_update({
                "task_id": f"task-{i}",
                "task_type": "test",
                "status": "pending",
                "timestamp": 1708300000.0 + i
            })

        # History should be capped at 100
        assert len(monitor.task_history) == 100

        # Most recent entries should be preserved
        last_entry = monitor.task_history[-1]
        assert last_entry["task_id"] == "task-149"
