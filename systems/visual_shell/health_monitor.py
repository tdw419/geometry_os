"""
Health Monitor - Phase 41

Continuous health checks and failure detection for self-healing mesh.
"""

import asyncio
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class HealthStatus(Enum):
    """Health status levels."""
    HEALTHY = "healthy"
    DEGRADED = "degraded"
    UNHEALTHY = "unhealthy"
    UNKNOWN = "unknown"


class AlertSeverity(Enum):
    """Health alert severity levels."""
    INFO = "info"
    WARNING = "warning"
    CRITICAL = "critical"
    RECOVERY = "recovery"


class ComponentType(Enum):
    """Types of components being monitored."""
    PEER = "peer"
    CONTAINER = "container"
    SERVICE = "service"


@dataclass
class HealthCheck:
    """A single health check result."""
    check_id: str
    component_type: ComponentType
    component_id: str
    status: HealthStatus
    message: str = ""
    timestamp: float = field(default_factory=time.time)
    latency_ms: float = 0.0
    details: dict[str, Any] = field(default_factory=dict)


@dataclass
class HealthAlert:
    """Alert generated from health monitoring."""
    alert_id: str
    severity: AlertSeverity
    component_type: ComponentType
    component_id: str
    message: str
    timestamp: float = field(default_factory=time.time)
    resolved: bool = False
    resolved_at: float | None = None


@dataclass
class Heartbeat:
    """Heartbeat record for a component."""
    component_id: str
    component_type: ComponentType
    last_seen: float
    sequence: int = 0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class HealthMetrics:
    """Aggregate health metrics."""
    total_components: int = 0
    healthy_count: int = 0
    degraded_count: int = 0
    unhealthy_count: int = 0
    unknown_count: int = 0
    last_check: float = 0.0
    uptime_percentage: float = 100.0


class FailureDetector:
    """Detects failures using heartbeat tracking and configurable thresholds."""

    def __init__(
        self,
        heartbeat_timeout: float = 30.0,
        failure_threshold: int = 3,
        recovery_threshold: int = 2,
    ):
        self.heartbeat_timeout = heartbeat_timeout
        self.failure_threshold = failure_threshold
        self.recovery_threshold = recovery_threshold
        self._heartbeats: dict[str, Heartbeat] = {}
        self._failure_counts: dict[str, int] = {}
        self._recovery_counts: dict[str, int] = {}
        self._suspected: set[str] = set()

    def record_heartbeat(
        self,
        component_id: str,
        component_type: ComponentType,
        metadata: dict[str, Any] | None = None,
    ) -> None:
        """Record a heartbeat from a component."""
        now = time.time()
        existing = self._heartbeats.get(component_id)

        sequence = (existing.sequence + 1) if existing else 0

        self._heartbeats[component_id] = Heartbeat(
            component_id=component_id,
            component_type=component_type,
            last_seen=now,
            sequence=sequence,
            metadata=metadata or {},
        )

        # Track recovery for suspected components
        if component_id in self._suspected:
            self._recovery_counts[component_id] = self._recovery_counts.get(component_id, 0) + 1
            if self._recovery_counts[component_id] >= self.recovery_threshold:
                self._suspected.discard(component_id)
                self._failure_counts[component_id] = 0
                self._recovery_counts[component_id] = 0

    def check_failures(self) -> list[HealthAlert]:
        """Check for failed components and generate alerts."""
        alerts = []
        now = time.time()

        for component_id, heartbeat in self._heartbeats.items():
            elapsed = now - heartbeat.last_seen

            if elapsed > self.heartbeat_timeout:
                self._failure_counts[component_id] = self._failure_counts.get(component_id, 0) + 1

                if self._failure_counts[component_id] >= self.failure_threshold:
                    if component_id not in self._suspected:
                        self._suspected.add(component_id)
                        alerts.append(HealthAlert(
                            alert_id=str(uuid.uuid4()),
                            severity=AlertSeverity.CRITICAL,
                            component_type=heartbeat.component_type,
                            component_id=component_id,
                            message=f"Component {component_id} failed (no heartbeat for {elapsed:.1f}s)",
                        ))

        return alerts

    def get_status(self, component_id: str) -> HealthStatus:
        """Get health status for a component."""
        if component_id in self._suspected:
            return HealthStatus.UNHEALTHY

        heartbeat = self._heartbeats.get(component_id)
        if not heartbeat:
            return HealthStatus.UNKNOWN

        elapsed = time.time() - heartbeat.last_seen
        if elapsed > self.heartbeat_timeout:
            return HealthStatus.DEGRADED

        return HealthStatus.HEALTHY

    def get_suspected(self) -> set[str]:
        """Get set of suspected failed components."""
        return self._suspected.copy()

    def get_heartbeats(self) -> dict[str, Heartbeat]:
        """Get all heartbeat records."""
        return self._heartbeats.copy()


class HealthMonitor:
    """Continuous health monitoring with configurable probes."""

    def __init__(
        self,
        check_interval: float = 10.0,
        heartbeat_timeout: float = 30.0,
    ):
        self.check_interval = check_interval
        self._running = False
        self._failure_detector = FailureDetector(heartbeat_timeout=heartbeat_timeout)
        self._checks: list[HealthCheck] = []
        self._alerts: list[HealthAlert] = []
        self._probes: dict[str, Callable[[], HealthCheck]] = {}
        self._metrics = HealthMetrics()
        self._subscribers: list[Callable[[HealthAlert], None]] = []

    def register_probe(self, name: str, probe: Callable[[], HealthCheck]) -> None:
        """Register a health probe function."""
        self._probes[name] = probe

    def unregister_probe(self, name: str) -> None:
        """Unregister a health probe."""
        self._probes.pop(name, None)

    def record_heartbeat(
        self,
        component_id: str,
        component_type: ComponentType,
        metadata: dict[str, Any] | None = None,
    ) -> None:
        """Record a heartbeat from a component."""
        self._failure_detector.record_heartbeat(component_id, component_type, metadata)

    async def start(self) -> None:
        """Start the health monitor."""
        self._running = True
        asyncio.create_task(self._monitor_loop())

    async def stop(self) -> None:
        """Stop the health monitor."""
        self._running = False

    async def _monitor_loop(self) -> None:
        """Main monitoring loop."""
        while self._running:
            await self._run_checks()
            await asyncio.sleep(self.check_interval)

    async def _run_checks(self) -> None:
        """Run all health checks."""
        checks = []

        # Run registered probes
        for name, probe in self._probes.items():
            try:
                check = probe()
                checks.append(check)
            except Exception as e:
                check = HealthCheck(
                    check_id=str(uuid.uuid4()),
                    component_type=ComponentType.SERVICE,
                    component_id=name,
                    status=HealthStatus.UNHEALTHY,
                    message=f"Probe failed: {e}",
                )
                checks.append(check)

        # Check for failures via heartbeat
        alerts = self._failure_detector.check_failures()
        for alert in alerts:
            self._emit_alert(alert)

        self._checks = checks
        self._update_metrics()

    def _emit_alert(self, alert: HealthAlert) -> None:
        """Emit a health alert to subscribers."""
        self._alerts.append(alert)
        for subscriber in self._subscribers:
            try:
                subscriber(alert)
            except Exception:
                pass

    def subscribe(self, callback: Callable[[HealthAlert], None]) -> None:
        """Subscribe to health alerts."""
        self._subscribers.append(callback)

    def unsubscribe(self, callback: Callable[[HealthAlert], None]) -> None:
        """Unsubscribe from health alerts."""
        if callback in self._subscribers:
            self._subscribers.remove(callback)

    def _update_metrics(self) -> None:
        """Update aggregate metrics."""
        heartbeats = self._failure_detector.get_heartbeats()

        self._metrics.total_components = len(heartbeats)
        self._metrics.healthy_count = 0
        self._metrics.degraded_count = 0
        self._metrics.unhealthy_count = 0
        self._metrics.unknown_count = 0

        for component_id in heartbeats:
            status = self._failure_detector.get_status(component_id)
            if status == HealthStatus.HEALTHY:
                self._metrics.healthy_count += 1
            elif status == HealthStatus.DEGRADED:
                self._metrics.degraded_count += 1
            elif status == HealthStatus.UNHEALTHY:
                self._metrics.unhealthy_count += 1
            else:
                self._metrics.unknown_count += 1

        self._metrics.last_check = time.time()

        if self._metrics.total_components > 0:
            self._metrics.uptime_percentage = (
                self._metrics.healthy_count / self._metrics.total_components * 100
            )

    def get_metrics(self) -> HealthMetrics:
        """Get current health metrics."""
        return self._metrics

    def get_checks(self) -> list[HealthCheck]:
        """Get recent health checks."""
        return self._checks.copy()

    def get_alerts(self, unresolved_only: bool = False) -> list[HealthAlert]:
        """Get health alerts."""
        if unresolved_only:
            return [a for a in self._alerts if not a.resolved]
        return self._alerts.copy()

    def resolve_alert(self, alert_id: str) -> HealthAlert | None:
        """Mark an alert as resolved."""
        for alert in self._alerts:
            if alert.alert_id == alert_id:
                alert.resolved = True
                alert.resolved_at = time.time()
                return alert
        return None

    def get_status(self, component_id: str) -> HealthStatus:
        """Get health status for a specific component."""
        return self._failure_detector.get_status(component_id)

    def get_failure_detector(self) -> FailureDetector:
        """Get the failure detector instance."""
        return self._failure_detector

    def get_stats(self) -> dict[str, Any]:
        """Get monitor statistics."""
        return {
            "running": self._running,
            "check_interval": self.check_interval,
            "total_components": self._metrics.total_components,
            "healthy": self._metrics.healthy_count,
            "degraded": self._metrics.degraded_count,
            "unhealthy": self._metrics.unhealthy_count,
            "uptime_percentage": self._metrics.uptime_percentage,
            "suspected_failures": len(self._failure_detector.get_suspected()),
            "alert_count": len(self._alerts),
        }


def create_health_monitor(
    check_interval: float = 10.0,
    heartbeat_timeout: float = 30.0,
) -> HealthMonitor:
    """Factory function to create a health monitor."""
    return HealthMonitor(
        check_interval=check_interval,
        heartbeat_timeout=heartbeat_timeout,
    )
