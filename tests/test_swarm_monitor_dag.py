# tests/test_swarm_monitor_dag.py
"""Tests for SwarmMonitor task DAG aggregation."""

import pytest
import asyncio
import json
from unittest.mock import AsyncMock, MagicMock
from collections import deque

from systems.visual_shell.swarm.swarm_monitor import SwarmMonitor


@pytest.fixture
def monitor():
    """Create a SwarmMonitor with mocked connections."""
    mon = SwarmMonitor()
    mon.bridge_ws = AsyncMock()
    mon.a2a_ws = AsyncMock()
    return mon


def test_task_dag_initialization(monitor):
    """Test that task DAG is initialized."""
    assert hasattr(monitor, 'task_dag')
    assert hasattr(monitor, 'task_history')
    assert isinstance(monitor.task_dag, dict)
    assert isinstance(monitor.task_history, deque)


def test_process_task_update_adds_task(monitor):
    """Test that task updates are added to DAG."""
    update = {
        "task_id": "task-001",
        "task_type": "render_pixel",
        "status": "pending",
        "previous_status": None,
        "timestamp": 1708300000.0
    }

    monitor._process_task_update(update)

    assert "task-001" in monitor.task_dag
    assert monitor.task_dag["task-001"]["status"] == "pending"
    assert len(monitor.task_history) == 1


def test_process_task_update_tracks_transitions(monitor):
    """Test that status transitions are tracked."""
    # First update
    monitor._process_task_update({
        "task_id": "task-001",
        "task_type": "render_pixel",
        "status": "pending",
        "previous_status": None,
        "timestamp": 1708300000.0
    })

    # Second update
    monitor._process_task_update({
        "task_id": "task-001",
        "task_type": "render_pixel",
        "status": "assigned",
        "previous_status": "pending",
        "assigned_to": "worker-001",
        "timestamp": 1708300001.0
    })

    task = monitor.task_dag["task-001"]
    assert task["status"] == "assigned"
    assert task["assigned_to"] == "worker-001"
    assert len(task["transitions"]) == 2


def test_get_task_dag_summary(monitor):
    """Test DAG summary generation."""
    monitor._process_task_update({
        "task_id": "task-001",
        "task_type": "render_pixel",
        "status": "completed",
        "previous_status": "assigned",
        "assigned_to": "worker-001",
        "duration": 2.5
    })
    monitor._process_task_update({
        "task_id": "task-002",
        "task_type": "render_pixel",
        "status": "pending",
        "previous_status": None
    })
    monitor._process_task_update({
        "task_id": "task-003",
        "task_type": "render_pixel",
        "status": "assigned",
        "previous_status": "pending",
        "assigned_to": "worker-002"
    })

    summary = monitor._get_task_dag_summary()

    assert summary["total_tasks"] == 3
    assert summary["completed"] == 1
    assert summary["pending"] == 1
    assert summary["assigned"] == 1
    # Active tasks are pending + assigned (not completed/failed)
    assert len(summary["active_tasks"]) == 2
