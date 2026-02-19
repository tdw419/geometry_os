"""Tests for SwarmMonitor district tracking."""

import pytest
from systems.visual_shell.swarm.swarm_monitor import SwarmMonitor


@pytest.fixture
def monitor():
    """Create a SwarmMonitor instance."""
    return SwarmMonitor()


def test_district_tracking_initialized(monitor):
    """Test that district tracking is initialized."""
    assert hasattr(monitor, 'agent_districts')
    assert isinstance(monitor.agent_districts, dict)


def test_update_agent_district(monitor):
    """Test updating agent district."""
    monitor.update_agent_district("worker-001", "cognitive")

    assert monitor.agent_districts["worker-001"] == "cognitive"


def test_get_district_load(monitor):
    """Test district load calculation."""
    monitor.update_agent_district("w1", "cognitive")
    monitor.update_agent_district("w2", "cognitive")
    monitor.update_agent_district("w3", "metabolic")
    monitor.update_agent_district("w4", "substrate")

    load = monitor.get_district_load()

    assert load["cognitive"] == 2
    assert load["metabolic"] == 1
    assert load["substrate"] == 1


def test_district_load_in_health_broadcast(monitor):
    """Test that district load is included in health data."""
    monitor.update_agent_district("w1", "cognitive")

    summary = monitor._get_task_dag_summary()
    assert "district_load" in summary
