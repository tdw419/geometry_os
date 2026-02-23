"""
RecursiveGrowth - Self-improvement through task observation.

Subscribes to task events and tracks metrics for growth analysis.
"""

from typing import Dict, Any, Optional, TYPE_CHECKING
from dataclasses import dataclass, field

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


@dataclass
class GrowthMetrics:
    """Metrics for tracking agent growth."""
    total_tasks: int = 0
    successes: int = 0
    failures: int = 0
    partials: int = 0

    @property
    def success_rate(self) -> float:
        """Calculate success rate."""
        if self.total_tasks == 0:
            return 0.0
        return self.successes / self.total_tasks

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "total_tasks": self.total_tasks,
            "successes": self.successes,
            "failures": self.failures,
            "partials": self.partials,
            "success_rate": self.success_rate
        }


class RecursiveGrowth:
    """
    Observes task events and tracks metrics for self-improvement.

    Subscribes to task.** events and maintains running statistics
    on outcomes per agent and task type.

    Usage:
        from systems.swarm import NEBBus
        bus = NEBBus("coordinator")
        growth = RecursiveGrowth(bus)
        # Now tracks all task events automatically
    """

    def __init__(self, event_bus: 'NEBBus', agent_id: Optional[str] = None):
        """
        Initialize RecursiveGrowth.

        Args:
            event_bus: NEBBus instance to subscribe to events
            agent_id: Optional agent ID to filter events (None = all agents)
        """
        self.event_bus = event_bus
        self.agent_id = agent_id
        self._metrics = GrowthMetrics()
        self._metrics_by_agent: Dict[str, GrowthMetrics] = {}
        self._metrics_by_type: Dict[str, GrowthMetrics] = {}
        self._subscription_id: Optional[str] = None

        # Subscribe to task events
        self._subscribe_to_events()

    def _subscribe_to_events(self) -> None:
        """Subscribe to task.** events on the bus."""
        self._subscription_id = self.event_bus.subscribe(
            "task.**",
            self._handle_task_event
        )

    def _handle_task_event(self, signal) -> None:
        """Handle incoming task events."""
        payload = signal.payload if hasattr(signal, 'payload') else signal

        # Extract relevant fields
        outcome = payload.get("outcome", "unknown")
        agent_id = payload.get("agent_id", payload.get("claimed_by", "unknown"))
        task_type = payload.get("task_type", "unknown")

        # Filter by agent if specified
        if self.agent_id and agent_id != self.agent_id:
            return

        # Update overall metrics
        self._update_metrics(self._metrics, outcome)

        # Update per-agent metrics
        if agent_id not in self._metrics_by_agent:
            self._metrics_by_agent[agent_id] = GrowthMetrics()
        self._update_metrics(self._metrics_by_agent[agent_id], outcome)

        # Update per-type metrics
        if task_type not in self._metrics_by_type:
            self._metrics_by_type[task_type] = GrowthMetrics()
        self._update_metrics(self._metrics_by_type[task_type], outcome)

    def _update_metrics(self, metrics: GrowthMetrics, outcome: str) -> None:
        """Update metrics based on outcome."""
        metrics.total_tasks += 1
        if outcome == "success":
            metrics.successes += 1
        elif outcome == "failure":
            metrics.failures += 1
        elif outcome == "partial":
            metrics.partials += 1

    def get_metrics(self) -> GrowthMetrics:
        """Get overall metrics."""
        return self._metrics

    def get_agent_metrics(self, agent_id: str) -> Optional[GrowthMetrics]:
        """Get metrics for a specific agent."""
        return self._metrics_by_agent.get(agent_id)

    def get_type_metrics(self, task_type: str) -> Optional[GrowthMetrics]:
        """Get metrics for a specific task type."""
        return self._metrics_by_type.get(task_type)

    def get_all_agent_metrics(self) -> Dict[str, GrowthMetrics]:
        """Get metrics for all agents."""
        return self._metrics_by_agent.copy()

    def get_all_type_metrics(self) -> Dict[str, GrowthMetrics]:
        """Get metrics for all task types."""
        return self._metrics_by_type.copy()

    def shutdown(self) -> None:
        """Unsubscribe from events."""
        if self._subscription_id:
            self.event_bus.unsubscribe(self._subscription_id)
            self._subscription_id = None

    def __enter__(self):
        """Context manager entry."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit."""
        self.shutdown()
        return False
