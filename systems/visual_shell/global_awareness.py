"""
Phase 62: Global Awareness

Unified view across all clusters with cross-cluster state correlation
and global event aggregation.

Provides mesh-wide dashboards and global state aggregation,
and unified awareness of the entire distributed system.
"""

import uuid
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Any


class EventType(Enum):
    """Type of global event."""
    CLUSTER_JOIN = "cluster_join"
    CLUSTER_LEAVE = "cluster_leave"
    PEER_JOIN = "peer_join"
    PEER_LEAVE = "peer_leave"
    CONTAINER_CREATED = "container_created"
    CONTAINER_DESTROYED = "container_destroyed"
    MIGRATION_STARTED = "migration_started"
    MIGRATION_COMPLETED = "migration_completed"
    ALERT_TRIGGERED = "alert_triggered"
    STATE_CHANGE = "state_change"
    METRIC_THRESHOLD = "metric_threshold"
    POLICY_VIOLATION = "policy_violation"
    GOVERNANCE_DECISION = "governance_decision"
    EVOLUTION_EVENT = "evolution_event"
    LEARNING_UPDATE = "learning_update"
    COMPLIANCE_EVENT = "compliance_event"
    BUDGET_EVENT = "budget_event"
    CUSTOM = "custom"


class EventSeverity(Enum):
    """Severity of global event."""
    INFO = "info"
    WARNING = "warning"
    ERROR = "error"
    CRITICAL = "critical"
    EMERGENCY = "emergency"


class ClusterHealth(Enum):
    """Health status of a cluster."""
    HEALTHY = "healthy"
    DEGRADED = "degraded"
    CRITICAL = "critical"
    OFFLINE = "offline"
    UNKNOWN = "unknown"


class PeerHealth(Enum):
    """Health status of a peer."""
    HEALTHY = "healthy"
    DEGRADED = "degraded"
    CRITICAL = "critical"
    OFFLINE = "offline"
    UNKNOWN = "unknown"


class ContainerHealth(Enum):
    """Health status of a container."""
    RUNNING = "running"
    STARTING = "starting"
    STOPPING = "stopping"
    CRASHED = "crashed"
    UNKNOWN = "unknown"


@dataclass
class GlobalEvent:
    """A global event in the mesh."""
    id: str
    event_type: EventType
    timestamp: datetime
    cluster_id: str
    source: str = ""
    target: str | None = None
    severity: EventSeverity = EventSeverity.INFO
    description: str = ""
    payload: dict[str, Any] = field(default_factory=dict)
    correlation_id: str = ""


@dataclass
class ClusterIdentity:
    """Identity of a cluster in the mesh."""
    id: str
    name: str
    region: str
    endpoint: str
    version: str = "1.0.0"
    created_at: datetime = field(default_factory=datetime.now)
    last_seen: datetime = field(default_factory=datetime.now)
    health: ClusterHealth = ClusterHealth.UNKNOWN
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class PeerState:
    """State of a peer in global view."""
    id: str
    cluster_id: str
    name: str
    endpoint: str
    health: PeerHealth = PeerHealth.UNKNOWN
    cpu_utilization: float = 0.0
    memory_utilization: float = 0.0
    container_count: int = 0
    last_seen: datetime = field(default_factory=datetime.now)
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class ContainerState:
    """State of a container in global view."""
    id: str
    cluster_id: str
    peer_id: str
    name: str
    image: str
    health: ContainerHealth = ContainerHealth.UNKNOWN
    status: str = "running"
    cpu_usage: float = 0.0
    memory_usage: float = 0.0
    created_at: datetime = field(default_factory=datetime.now)
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class GlobalState:
    """Aggregated global state."""
    timestamp: datetime
    total_clusters: int = 0
    total_peers: int = 0
    total_containers: int = 0
    healthy_clusters: int = 0
    degraded_clusters: int = 0
    offline_clusters: int = 0
    total_cpu_utilization: float = 0.0
    total_memory_utilization: float = 0.0
    active_migrations: int = 0
    active_alerts: int = 0
    events_last_hour: int = 0
    events_last_day: int = 0


@dataclass
class EventCorrelation:
    """Correlates events across clusters."""
    event_id: str
    correlated_events: list[str] = field(default_factory=list)
    correlation_strength: float = 0.0
    pattern_type: str = ""
    timestamp: datetime = field(default_factory=datetime.now)


class StateAggregator:
    """Aggregates state across all clusters."""

    def __init__(self, aggregation_window_seconds: int = 60):
        self.aggregation_window_seconds = aggregation_window_seconds
        self.global_states: list[GlobalState] = []
        self.cluster_states: dict[str, ClusterHealth] = {}
        self.peer_states: dict[str, PeerState] = {}
        self.container_states: dict[str, ContainerState] = {}
        self.event_buffer: list[GlobalEvent] = []
        self.max_buffer_size: int = 10000
        self._last_aggregation: datetime = datetime.now()

    def update_cluster_health(
        self,
        cluster_id: str,
        health: ClusterHealth
    ) -> None:
        """Update cluster health status."""
        self.cluster_states[cluster_id] = health

    def register_cluster(self, identity: ClusterIdentity) -> None:
        """Register a cluster."""
        self.cluster_states[identity.id] = ClusterHealth.UNKNOWN

    def unregister_cluster(self, cluster_id: str) -> None:
        """Unregister a cluster."""
        if cluster_id in self.cluster_states:
            del self.cluster_states[cluster_id]

    def update_peer(
        self,
        peer_id: str,
        cluster_id: str,
        name: str,
        endpoint: str,
        health: PeerHealth = PeerHealth.UNKNOWN
    ) -> None:
        """Update peer state."""
        state = PeerState(
            id=peer_id,
            cluster_id=cluster_id,
            name=name,
            endpoint=endpoint,
            health=health
        )
        self.peer_states[peer_id] = state

    def unregister_peer(self, peer_id: str) -> None:
        """Unregister a peer."""
        if peer_id in self.peer_states:
            del self.peer_states[peer_id]

    def update_container(
        self,
        container_id: str,
        cluster_id: str,
        peer_id: str,
        name: str,
        image: str,
        health: ContainerHealth = ContainerHealth.UNKNOWN
    ) -> None:
        """Update container state."""
        state = ContainerState(
            id=container_id,
            cluster_id=cluster_id,
            peer_id=peer_id,
            name=name,
            image=image,
            health=health
        )
        self.container_states[container_id] = state

    def unregister_container(self, container_id: str) -> None:
        """Unregister a container."""
        if container_id in self.container_states:
            del self.container_states[container_id]

    def record_event(self, event: GlobalEvent) -> None:
        """Record a global event."""
        self.event_buffer.append(event)
        if len(self.event_buffer) > self.max_buffer_size:
            self.event_buffer = self.event_buffer[-self.max_buffer_size:]

    def aggregate(self) -> GlobalState:
        """Aggregate current state into global state."""
        now = datetime.now()
        total_clusters = len(self.cluster_states)
        total_peers = len(self.peer_states)
        total_containers = len(self.container_states)
        healthy_clusters = sum(
            1 for h in self.cluster_states.values()
            if h == ClusterHealth.HEALTHY
        )
        degraded_clusters = sum(
            1 for h in self.cluster_states.values()
            if h == ClusterHealth.DEGRADED
        )
        offline_clusters = sum(
            1 for h in self.cluster_states.values()
            if h == ClusterHealth.OFFLINE
        )

        # Calculate average utilization
        total_cpu = 0.0
        total_memory = 0.0
        peer_count = len(self.peer_states)
        if peer_count > 0:
            for peer in self.peer_states.values():
                total_cpu += peer.cpu_utilization
                total_memory += peer.memory_utilization
            total_cpu /= peer_count
            total_memory /= peer_count

        # Count recent events
        one_hour_ago = now - timedelta(hours=1)
        events_last_hour = sum(
            1 for e in self.event_buffer
            if e.timestamp > one_hour_ago
        )
        one_day_ago = now - timedelta(days=1)
        events_last_day = sum(
            1 for e in self.event_buffer
            if e.timestamp > one_day_ago
        )

        state = GlobalState(
            timestamp=now,
            total_clusters=total_clusters,
            total_peers=total_peers,
            total_containers=total_containers,
            healthy_clusters=healthy_clusters,
            degraded_clusters=degraded_clusters,
            offline_clusters=offline_clusters,
            total_cpu_utilization=total_cpu,
            total_memory_utilization=total_memory,
            active_migrations=0,
            active_alerts=sum(
                1 for e in self.event_buffer
                if e.event_type == EventType.ALERT_TRIGGERED
                and e.timestamp > one_hour_ago
            ),
            events_last_hour=events_last_hour,
            events_last_day=events_last_day
        )
        self.global_states.append(state)
        self._last_aggregation = now

        return state

    def get_current_state(self) -> GlobalState:
        """Get current aggregated state."""
        return self.aggregate()

    def get_state_history(self, limit: int = 10) -> list[GlobalState]:
        """Get historical global states."""
        return self.global_states[-limit:]

    def get_cluster_state(self, cluster_id: str) -> ClusterHealth | None:
        """Get state for a specific cluster."""
        return self.cluster_states.get(cluster_id)

    def get_peer_state(self, peer_id: str) -> PeerState | None:
        """Get state for a specific peer."""
        return self.peer_states.get(peer_id)

    def get_container_state(self, container_id: str) -> ContainerState | None:
        """Get state for a specific container."""
        return self.container_states.get(container_id)


class EventCorrelator:
    """Correlates events across clusters."""

    def __init__(self, correlation_window_seconds: int = 300):
        self.correlation_window_seconds = correlation_window_seconds
        self.correlations: dict[str, EventCorrelation] = {}

    def correlate_events(
        self,
        events: list[GlobalEvent]
    ) -> list[tuple[GlobalEvent, GlobalEvent, float]]:
        """Find correlated event pairs."""
        correlations = []
        for i, event1 in enumerate(events):
            for event2 in events[i + 1:]:
                correlation = self._calculate_correlation(event1, event2)
                if correlation > 0:
                    correlations.append((event1, event2, correlation))
        return correlations

    def _calculate_correlation(
        self,
        event1: GlobalEvent,
        event2: GlobalEvent
    ) -> float:
        """Calculate correlation strength between two events."""
        # Time proximity
        time_diff = abs((event1.timestamp - event2.timestamp).total_seconds())
        if time_diff > self.correlation_window_seconds:
            return 0.0

        score = 1.0

        # Same cluster bonus
        if event1.cluster_id == event2.cluster_id:
            score += 0.3

        # Same event type
        if event1.event_type == event2.event_type:
            score += 0.2

        # Similar severity
        if event1.severity == event2.severity:
            score += 0.1

        # Causal relationship (event1 happened before event2)
        if event1.timestamp < event2.timestamp:
            score += 0.1

        return score

    def find_patterns(self, events: list[GlobalEvent]) -> list[dict]:
        """Find patterns in event sequences."""
        patterns = []

        # Group by event type
        by_type: dict[EventType, list[GlobalEvent]] = defaultdict(list)
        for event in events:
            by_type[event.event_type].append(event)

        # Find temporal patterns
        for event_type, type_events in by_type.items():
            if len(type_events) >= 3:
                # Check for periodic occurrence
                intervals = []
                for i in range(len(type_events) - 1):
                    interval = (
                        type_events[i + 1].timestamp - type_events[i].timestamp
                    ).total_seconds()
                    intervals.append(interval)

                if intervals:
                    avg_interval = sum(intervals) / len(intervals)
                    variance = sum((i - avg_interval) ** 2 for i in intervals)
                    std_dev = (variance / len(intervals)) ** 0.5

                    if avg_interval > 0 and std_dev < avg_interval * 0.1:
                        patterns.append({
                            "type": "periodic",
                            "event_type": event_type.value,
                            "average_interval_seconds": avg_interval,
                            "confidence": 1 - (std_dev / avg_interval)
                        })

        return patterns


class GlobalDashboard:
    """Dashboard for global mesh awareness."""

    def __init__(self):
        self.state_aggregator = StateAggregator()
        self.event_correlator = EventCorrelator()
        self.panels: dict[str, dict[str, Any]] = {}
        self.refresh_interval_seconds: int = 10
        self._last_refresh: datetime = datetime.now()
        self._alerts: list[dict[str, Any]] = []

    def register_panel(
        self,
        name: str,
        panel_config: dict[str, Any]
    ) -> None:
        """Register a dashboard panel."""
        self.panels[name] = panel_config

    def update_panel(
        self,
        name: str,
        data: dict[str, Any]
    ) -> None:
        """Update a dashboard panel."""
        if name in self.panels:
            self.panels[name].update(data)

    def get_panel(self, name: str) -> dict[str, Any] | None:
        """Get a specific panel."""
        return self.panels.get(name)

    def refresh(self) -> GlobalState:
        """Refresh all panels with current state."""
        state = self.state_aggregator.aggregate()
        for panel in self.panels.values():
            panel.update({"global_state": state})
        self._last_refresh = datetime.now()
        return state

    def add_alert(
        self,
        severity: str,
        title: str,
        message: str,
        cluster_id: str | None = None
    ) -> None:
        """Add an alert to the dashboard."""
        alert = {
            "severity": severity,
            "title": title,
            "message": message,
            "cluster_id": cluster_id,
            "timestamp": datetime.now().isoformat()
        }
        self._alerts.append(alert)
        # Keep only last 100 alerts
        if len(self._alerts) > 100:
            self._alerts = self._alerts[-100:]

    def get_alerts(self, limit: int = 10) -> list[dict]:
        """Get recent alerts."""
        return self._alerts[-limit:]

    def get_summary(self) -> dict:
        """Get dashboard summary."""
        state = self.state_aggregator.get_current_state()
        return {
            "timestamp": datetime.now().isoformat(),
            "total_clusters": state.total_clusters,
            "healthy_clusters": state.healthy_clusters,
            "degraded_clusters": state.degraded_clusters,
            "offline_clusters": state.offline_clusters,
            "total_peers": state.total_peers,
            "total_containers": state.total_containers,
            "events_last_hour": state.events_last_hour,
            "active_alerts": len(self._alerts)
        }


class GlobalAwareness:
    """
    Main class for global mesh awareness.
    Combines state aggregation, event correlation,
    and dashboard visualization.
    """

    def __init__(self):
        self.state_aggregator = StateAggregator()
        self.event_correlator = EventCorrelator()
        self.dashboard = GlobalDashboard()
        self.clusters: dict[str, ClusterIdentity] = {}
        self._event_history: list[GlobalEvent] = []
        self.max_history: int = 10000
        self._subscribers: list[Callable[[GlobalEvent], None]] = []

    def register_cluster(self, identity: ClusterIdentity) -> None:
        """Register a cluster in global awareness."""
        self.clusters[identity.id] = identity
        self.state_aggregator.register_cluster(identity)
        self._record_event(GlobalEvent(
            id=str(uuid.uuid4())[:8],
            event_type=EventType.CLUSTER_JOIN,
            timestamp=datetime.now(),
            cluster_id=identity.id,
            source="global_awareness",
            severity=EventSeverity.INFO,
            description=f"Cluster {identity.name} joined global mesh"
        ))

    def unregister_cluster(self, cluster_id: str) -> None:
        """Unregister a cluster from global awareness."""
        if cluster_id in self.clusters:
            name = self.clusters[cluster_id].name
            del self.clusters[cluster_id]
            self.state_aggregator.unregister_cluster(cluster_id)
            self._record_event(GlobalEvent(
                id=str(uuid.uuid4())[:8],
                event_type=EventType.CLUSTER_LEAVE,
                timestamp=datetime.now(),
                cluster_id=cluster_id,
                source="global_awareness",
                severity=EventSeverity.WARNING,
                description=f"Cluster {name} left global mesh"
            ))

    def update_cluster_health(
        self,
        cluster_id: str,
        health: ClusterHealth
    ) -> None:
        """Update cluster health status."""
        self.state_aggregator.update_cluster_health(cluster_id, health)
        if health in (ClusterHealth.CRITICAL, ClusterHealth.OFFLINE):
            self.dashboard.add_alert(
                severity=health.value,
                title=f"Cluster {cluster_id} health degraded",
                message=f"Cluster is in {health.value} state",
                cluster_id=cluster_id
            )
        self._record_event(GlobalEvent(
            id=str(uuid.uuid4())[:8],
            event_type=EventType.STATE_CHANGE,
            timestamp=datetime.now(),
            cluster_id=cluster_id,
            source="global_awareness",
            severity=EventSeverity.INFO if health == ClusterHealth.HEALTHY else EventSeverity.WARNING,
            description=f"Cluster health changed to {health.value}"
        ))

    def update_peer(
        self,
        peer_id: str,
        cluster_id: str,
        name: str,
        endpoint: str,
        health: PeerHealth,
        cpu_utilization: float = 0.0,
        memory_utilization: float = 0.0
    ) -> None:
        """Update peer state."""
        self.state_aggregator.update_peer(
            peer_id, cluster_id, name, endpoint, health
        )
        if health in (PeerHealth.CRITICAL, PeerHealth.OFFLINE):
            self._record_event(GlobalEvent(
                id=str(uuid.uuid4())[:8],
                event_type=EventType.PEER_LEAVE,
                timestamp=datetime.now(),
                cluster_id=cluster_id,
                source=peer_id,
                severity=EventSeverity.WARNING,
                description=f"Peer {name} is {health.value}"
            ))
        else:
            self._record_event(GlobalEvent(
                id=str(uuid.uuid4())[:8],
                event_type=EventType.PEER_JOIN,
                timestamp=datetime.now(),
                cluster_id=cluster_id,
                source=peer_id,
                severity=EventSeverity.INFO,
                description=f"Peer {name} joined cluster"
            ))

    def update_container(
        self,
        container_id: str,
        cluster_id: str,
        peer_id: str,
        name: str,
        image: str,
        health: ContainerHealth
    ) -> None:
        """Update container state."""
        self.state_aggregator.update_container(
            container_id, cluster_id, peer_id, name, image, health
        )
        if health == ContainerHealth.CRASHED:
            self._record_event(GlobalEvent(
                id=str(uuid.uuid4())[:8],
                event_type=EventType.CONTAINER_DESTROYED,
                timestamp=datetime.now(),
                cluster_id=cluster_id,
                source=peer_id,
                severity=EventSeverity.ERROR,
                description=f"Container {name} crashed"
            ))
        else:
            self._record_event(GlobalEvent(
                id=str(uuid.uuid4())[:8],
                event_type=EventType.CONTAINER_CREATED,
                timestamp=datetime.now(),
                cluster_id=cluster_id,
                source=peer_id,
                severity=EventSeverity.INFO,
                description=f"Container {name} created"
            ))

    def record_migration(
        self,
        migration_id: str,
        source_cluster: str,
        target_cluster: str,
        container_id: str
    ) -> None:
        """Record a migration event."""
        self._record_event(GlobalEvent(
            id=str(uuid.uuid4())[:8],
            event_type=EventType.MIGRATION_STARTED,
            timestamp=datetime.now(),
            cluster_id=source_cluster,
            source=source_cluster,
            target=target_cluster,
            severity=EventSeverity.INFO,
            description=f"Migration started for container {container_id}"
        ))

    def record_alert(
        self,
        alert_type: str,
        severity: str,
        message: str,
        cluster_id: str | None = None
    ) -> None:
        """Record an alert event."""
        severity_enum = EventSeverity.INFO
        if severity == "warning":
            severity_enum = EventSeverity.WARNING
        elif severity == "error":
            severity_enum = EventSeverity.ERROR
        elif severity == "critical":
            severity_enum = EventSeverity.CRITICAL
        elif severity == "emergency":
            severity_enum = EventSeverity.EMERGENCY

        self._record_event(GlobalEvent(
            id=str(uuid.uuid4())[:8],
            event_type=EventType.ALERT_TRIGGERED,
            timestamp=datetime.now(),
            cluster_id=cluster_id or "global",
            severity=severity_enum,
            description=f"{alert_type}: {message}"
        ))
        self.dashboard.add_alert(
            severity=severity,
            title=alert_type,
            message=message,
            cluster_id=cluster_id
        )

    def subscribe(self, callback: Callable[[GlobalEvent], None]) -> None:
        """Subscribe to global events."""
        self._subscribers.append(callback)

    def get_global_state(self) -> GlobalState:
        """Get current global state."""
        return self.state_aggregator.get_current_state()

    def get_state_history(self, limit: int = 10) -> list[GlobalState]:
        """Get historical global states."""
        return self.state_aggregator.get_state_history(limit)

    def get_cluster_health(self, cluster_id: str) -> ClusterHealth | None:
        """Get health status for a cluster."""
        return self.state_aggregator.get_cluster_state(cluster_id)

    def get_dashboard_summary(self) -> dict:
        """Get dashboard summary."""
        return self.dashboard.get_summary()

    def get_recent_events(self, limit: int = 100) -> list[GlobalEvent]:
        """Get recent events."""
        return self._event_history[-limit:]

    def find_correlated_events(self, event: GlobalEvent) -> list[tuple[GlobalEvent, GlobalEvent, float]]:
        """Find events correlated with a given event."""
        return self.event_correlator.correlate_events(self._event_history)

    def find_patterns(self) -> list[dict]:
        """Find patterns in recent events."""
        return self.event_correlator.find_patterns(self._event_history)

    def _record_event(self, event: GlobalEvent) -> None:
        """Record a global event."""
        self._event_history.append(event)
        if len(self._event_history) > self.max_history:
            self._event_history = self._event_history[-self.max_history:]

        # Record in state aggregator
        self.state_aggregator.record_event(event)

        # Notify subscribers
        for callback in self._subscribers:
            callback(event)


# Factory functions

def create_cluster_identity(
    name: str,
    region: str,
    endpoint: str,
    version: str = "1.0.0"
) -> ClusterIdentity:
    """Create a cluster identity."""
    return ClusterIdentity(
        id=str(uuid.uuid4())[:8],
        name=name,
        region=region,
        endpoint=endpoint,
        version=version
    )


def create_global_awareness() -> GlobalAwareness:
    """Create a global awareness instance."""
    return GlobalAwareness()
