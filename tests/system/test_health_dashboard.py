# tests/system/test_health_dashboard.py
import pytest
import asyncio
import time
from systems.visual_shell.swarm.health_dashboard import HealthDashboard, AgentHealth, HealthStatus

class TestHealthDashboard:
    """Tests for swarm health monitoring."""

    def test_dashboard_initialization(self):
        """Dashboard initializes empty."""
        dashboard = HealthDashboard()

        assert dashboard.agents == {}
        assert dashboard.alerts == []

    def test_register_agent_health(self):
        """Can register and track agent health."""
        dashboard = HealthDashboard()

        dashboard.register_agent("agent-001", {"type": "worker", "region": {"x": 0, "y": 0}})

        assert "agent-001" in dashboard.agents
        assert dashboard.agents["agent-001"].status == HealthStatus.HEALTHY

    def test_detect_stale_agent(self):
        """Detects agents that haven't sent heartbeat."""
        dashboard = HealthDashboard(stale_threshold_seconds=5)

        dashboard.register_agent("agent-001", {})
        # Simulate old heartbeat
        dashboard.agents["agent-001"].last_heartbeat = time.time() - 10

        stale = dashboard.get_stale_agents()

        assert len(stale) == 1
        assert stale[0].agent_id == "agent-001"

    def test_generate_status_report(self):
        """Generates human-readable status report."""
        dashboard = HealthDashboard()

        dashboard.register_agent("agent-001", {"type": "worker"})
        dashboard.register_agent("agent-002", {"type": "healer"})

        report = dashboard.generate_report()

        assert "agent-001" in report
        assert "agent-002" in report

    def test_mark_agent_offline(self):
        """Can mark agent as offline and generate alert."""
        dashboard = HealthDashboard()

        dashboard.register_agent("agent-001", {"type": "worker"})
        dashboard.mark_offline("agent-001")

        assert dashboard.agents["agent-001"].status == HealthStatus.OFFLINE
        assert len(dashboard.alerts) == 1

    def test_acknowledge_alert(self):
        """Alerts can be acknowledged."""
        dashboard = HealthDashboard()
        dashboard.register_agent("agent-001", {})
        dashboard.mark_offline("agent-001")

        alert_id = dashboard.alerts[0].alert_id
        result = dashboard.acknowledge_alert(alert_id)

        assert result is True
        assert dashboard.alerts[0].acknowledged is True
