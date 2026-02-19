# systems/visual_shell/swarm/health_dashboard.py
"""
Health Dashboard - Real-time monitoring for the swarm.

Provides visibility into agent health, task progress, and system alerts.
"""

import time
import logging
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any
from enum import Enum

logger = logging.getLogger(__name__)


class HealthStatus(Enum):
    HEALTHY = "healthy"
    STALE = "stale"
    UNHEALTHY = "unhealthy"
    OFFLINE = "offline"


@dataclass
class AgentHealth:
    """Health status of a single agent."""
    agent_id: str
    agent_type: str
    status: HealthStatus = HealthStatus.HEALTHY
    last_heartbeat: float = field(default_factory=time.time)
    metadata: Dict[str, Any] = field(default_factory=dict)
    region: Optional[Dict[str, int]] = None
    tasks_completed: int = 0
    tasks_failed: int = 0
    current_task: Optional[str] = None


@dataclass
class Alert:
    """System alert."""
    alert_id: str
    severity: str  # info, warning, critical
    message: str
    agent_id: Optional[str]
    timestamp: float = field(default_factory=time.time)
    acknowledged: bool = False


class HealthDashboard:
    """
    Centralized health monitoring for the swarm.

    Features:
    - Agent registration and heartbeat tracking
    - Stale agent detection
    - Alert generation and management
    - Status reporting
    """

    def __init__(self, stale_threshold_seconds: float = 30.0):
        self.stale_threshold = stale_threshold_seconds
        self.agents: Dict[str, AgentHealth] = {}
        self.alerts: List[Alert] = []

    def register_agent(self, agent_id: str, metadata: Dict[str, Any]) -> None:
        """Register a new agent for monitoring."""
        health = AgentHealth(
            agent_id=agent_id,
            agent_type=metadata.get("type", "unknown"),
            metadata=metadata,
            region=metadata.get("region")
        )

        self.agents[agent_id] = health
        logger.info(f"Agent registered with dashboard: {agent_id}")

    def update_heartbeat(self, agent_id: str, current_task: Optional[str] = None) -> None:
        """Update agent heartbeat timestamp."""
        if agent_id in self.agents:
            self.agents[agent_id].last_heartbeat = time.time()
            self.agents[agent_id].current_task = current_task

    def update_task_stats(
        self,
        agent_id: str,
        completed: int = None,
        failed: int = None
    ) -> None:
        """Update agent task statistics."""
        if agent_id in self.agents:
            if completed is not None:
                self.agents[agent_id].tasks_completed = completed
            if failed is not None:
                self.agents[agent_id].tasks_failed = failed

    def get_stale_agents(self) -> List[AgentHealth]:
        """Get agents that haven't sent heartbeat recently."""
        now = time.time()
        stale = []

        for health in self.agents.values():
            if health.status == HealthStatus.OFFLINE:
                continue

            age = now - health.last_heartbeat
            if age > self.stale_threshold:
                health.status = HealthStatus.STALE
                stale.append(health)

        if stale:
            self._generate_alert(
                severity="warning",
                message=f"{len(stale)} agent(s) are stale (no heartbeat)",
                agent_id=None
            )

        return stale

    def mark_offline(self, agent_id: str) -> None:
        """Mark an agent as offline."""
        if agent_id in self.agents:
            self.agents[agent_id].status = HealthStatus.OFFLINE
            self._generate_alert(
                severity="critical",
                message=f"Agent {agent_id} went offline",
                agent_id=agent_id
            )

    def _generate_alert(self, severity: str, message: str, agent_id: Optional[str]) -> None:
        """Generate a new alert."""
        alert = Alert(
            alert_id=f"alert-{int(time.time() * 1000)}",
            severity=severity,
            message=message,
            agent_id=agent_id
        )
        self.alerts.append(alert)
        logger.warning(f"Alert [{severity}]: {message}")

    def acknowledge_alert(self, alert_id: str) -> bool:
        """Acknowledge an alert."""
        for alert in self.alerts:
            if alert.alert_id == alert_id:
                alert.acknowledged = True
                return True
        return False

    def generate_report(self) -> str:
        """Generate a human-readable status report."""
        lines = ["=" * 50, "SWARM HEALTH REPORT", "=" * 50]

        # Summary
        healthy = sum(1 for a in self.agents.values() if a.status == HealthStatus.HEALTHY)
        stale = sum(1 for a in self.agents.values() if a.status == HealthStatus.STALE)
        offline = sum(1 for a in self.agents.values() if a.status == HealthStatus.OFFLINE)

        lines.append(f"\nSummary: healthy: {healthy}, stale: {stale}, offline: {offline}")
        lines.append("-" * 50)

        # Agent details
        for agent_id, health in self.agents.items():
            status_icon = {"healthy": "[OK]", "stale": "[WARN]", "unhealthy": "[ERR]", "offline": "[OFF]"}.get(
                health.status.value, "[?]"
            )
            lines.append(f"{status_icon} {agent_id} ({health.agent_type})")
            if health.current_task:
                lines.append(f"   Task: {health.current_task}")
            lines.append(f"   Completed: {health.tasks_completed}, Failed: {health.tasks_failed}")

        # Alerts
        unacked = [a for a in self.alerts if not a.acknowledged]
        if unacked:
            lines.append(f"\n{len(unacked)} Unacknowledged Alerts:")
            for alert in unacked[-5:]:  # Last 5
                lines.append(f"  [{alert.severity}] {alert.message}")

        return "\n".join(lines)

    def to_dict(self) -> Dict[str, Any]:
        """Export dashboard state as dictionary."""
        return {
            "agents": {
                aid: {
                    "status": h.status.value,
                    "type": h.agent_type,
                    "last_heartbeat": h.last_heartbeat,
                    "tasks_completed": h.tasks_completed,
                    "tasks_failed": h.tasks_failed,
                    "current_task": h.current_task
                }
                for aid, h in self.agents.items()
            },
            "alerts_count": len(self.alerts),
            "unacknowledged_alerts": len([a for a in self.alerts if not a.acknowledged])
        }
