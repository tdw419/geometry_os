"""
Tests for Phase 62: Global Awareness

Comprehensive tests for global mesh awareness, state aggregation,
and event correlation.
"""

from datetime import datetime, timedelta
from unittest.mock import MagicMock

from systems.visual_shell.global_awareness import (
    ClusterHealth,
    ClusterIdentity,
    ContainerHealth,
    ContainerState,
    EventCorrelation,
    EventCorrelator,
    EventSeverity,
    EventType,
    GlobalAwareness,
    GlobalDashboard,
    GlobalEvent,
    GlobalState,
    PeerHealth,
    PeerState,
    StateAggregator,
    create_cluster_identity,
    create_global_awareness,
)


class TestEventType:
    """Tests for EventType enum."""

    def test_event_types_exist(self):
        """Test all event types are defined."""
        assert EventType.CLUSTER_JOIN.value == "cluster_join"
        assert EventType.CLUSTER_LEAVE.value == "cluster_leave"
        assert EventType.PEER_JOIN.value == "peer_join"
        assert EventType.PEER_LEAVE.value == "peer_leave"
        assert EventType.CONTAINER_CREATED.value == "container_created"
        assert EventType.CONTAINER_DESTROYED.value == "container_destroyed"
        assert EventType.MIGRATION_STARTED.value == "migration_started"
        assert EventType.MIGRATION_COMPLETED.value == "migration_completed"
        assert EventType.ALERT_TRIGGERED.value == "alert_triggered"
        assert EventType.STATE_CHANGE.value == "state_change"
        assert EventType.METRIC_THRESHOLD.value == "metric_threshold"
        assert EventType.POLICY_VIOLATION.value == "policy_violation"
        assert EventType.GOVERNANCE_DECISION.value == "governance_decision"
        assert EventType.EVOLUTION_EVENT.value == "evolution_event"
        assert EventType.LEARNING_UPDATE.value == "learning_update"
        assert EventType.COMPLIANCE_EVENT.value == "compliance_event"
        assert EventType.BUDGET_EVENT.value == "budget_event"
        assert EventType.CUSTOM.value == "custom"


class TestEventSeverity:
    """Tests for EventSeverity enum."""

    def test_severity_levels(self):
        """Test all severity levels are defined."""
        assert EventSeverity.INFO.value == "info"
        assert EventSeverity.WARNING.value == "warning"
        assert EventSeverity.ERROR.value == "error"
        assert EventSeverity.CRITICAL.value == "critical"
        assert EventSeverity.EMERGENCY.value == "emergency"


class TestClusterHealth:
    """Tests for ClusterHealth enum."""

    def test_cluster_health_states(self):
        """Test all cluster health states."""
        assert ClusterHealth.HEALTHY.value == "healthy"
        assert ClusterHealth.DEGRADED.value == "degraded"
        assert ClusterHealth.CRITICAL.value == "critical"
        assert ClusterHealth.OFFLINE.value == "offline"
        assert ClusterHealth.UNKNOWN.value == "unknown"


class TestPeerHealth:
    """Tests for PeerHealth enum."""

    def test_peer_health_states(self):
        """Test all peer health states."""
        assert PeerHealth.HEALTHY.value == "healthy"
        assert PeerHealth.DEGRADED.value == "degraded"
        assert PeerHealth.CRITICAL.value == "critical"
        assert PeerHealth.OFFLINE.value == "offline"
        assert PeerHealth.UNKNOWN.value == "unknown"


class TestContainerHealth:
    """Tests for ContainerHealth enum."""

    def test_container_health_states(self):
        """Test all container health states."""
        assert ContainerHealth.RUNNING.value == "running"
        assert ContainerHealth.STARTING.value == "starting"
        assert ContainerHealth.STOPPING.value == "stopping"
        assert ContainerHealth.CRASHED.value == "crashed"
        assert ContainerHealth.UNKNOWN.value == "unknown"


class TestGlobalEvent:
    """Tests for GlobalEvent dataclass."""

    def test_create_global_event(self):
        """Test creating a global event."""
        event = GlobalEvent(
            id="evt123",
            event_type=EventType.CLUSTER_JOIN,
            timestamp=datetime.now(),
            cluster_id="cluster1"
        )
        assert event.id == "evt123"
        assert event.event_type == EventType.CLUSTER_JOIN
        assert event.cluster_id == "cluster1"
        assert event.severity == EventSeverity.INFO
        assert event.source == ""
        assert event.target is None
        assert event.description == ""
        assert event.payload == {}

    def test_global_event_with_all_fields(self):
        """Test global event with all fields."""
        event = GlobalEvent(
            id="evt456",
            event_type=EventType.MIGRATION_STARTED,
            timestamp=datetime.now(),
            cluster_id="cluster1",
            source="peer1",
            target="cluster2",
            severity=EventSeverity.WARNING,
            description="Migration started",
            payload={"container_id": "cont1"},
            correlation_id="corr123"
        )
        assert event.source == "peer1"
        assert event.target == "cluster2"
        assert event.severity == EventSeverity.WARNING
        assert event.correlation_id == "corr123"


class TestClusterIdentity:
    """Tests for ClusterIdentity dataclass."""

    def test_create_cluster_identity(self):
        """Test creating cluster identity."""
        identity = ClusterIdentity(
            id="cluster1",
            name="US-East",
            region="us-east-1",
            endpoint="https://cluster1.example.com"
        )
        assert identity.id == "cluster1"
        assert identity.name == "US-East"
        assert identity.region == "us-east-1"
        assert identity.version == "1.0.0"
        assert identity.health == ClusterHealth.UNKNOWN

    def test_cluster_identity_with_metadata(self):
        """Test cluster identity with metadata."""
        identity = ClusterIdentity(
            id="cluster2",
            name="EU-West",
            region="eu-west-1",
            endpoint="https://cluster2.example.com",
            version="2.0.0",
            metadata={"provider": "aws"}
        )
        assert identity.version == "2.0.0"
        assert identity.metadata["provider"] == "aws"


class TestPeerState:
    """Tests for PeerState dataclass."""

    def test_create_peer_state(self):
        """Test creating peer state."""
        state = PeerState(
            id="peer1",
            cluster_id="cluster1",
            name="peer-01",
            endpoint="https://peer1.example.com"
        )
        assert state.id == "peer1"
        assert state.cluster_id == "cluster1"
        assert state.health == PeerHealth.UNKNOWN
        assert state.cpu_utilization == 0.0
        assert state.memory_utilization == 0.0
        assert state.container_count == 0

    def test_peer_state_with_metrics(self):
        """Test peer state with resource metrics."""
        state = PeerState(
            id="peer2",
            cluster_id="cluster1",
            name="peer-02",
            endpoint="https://peer2.example.com",
            health=PeerHealth.HEALTHY,
            cpu_utilization=45.5,
            memory_utilization=62.3,
            container_count=10
        )
        assert state.health == PeerHealth.HEALTHY
        assert state.cpu_utilization == 45.5
        assert state.memory_utilization == 62.3
        assert state.container_count == 10


class TestContainerState:
    """Tests for ContainerState dataclass."""

    def test_create_container_state(self):
        """Test creating container state."""
        state = ContainerState(
            id="cont1",
            cluster_id="cluster1",
            peer_id="peer1",
            name="web-server",
            image="nginx:latest"
        )
        assert state.id == "cont1"
        assert state.cluster_id == "cluster1"
        assert state.peer_id == "peer1"
        assert state.name == "web-server"
        assert state.image == "nginx:latest"
        assert state.health == ContainerHealth.UNKNOWN
        assert state.status == "running"

    def test_container_state_crashed(self):
        """Test container state with crashed status."""
        state = ContainerState(
            id="cont2",
            cluster_id="cluster1",
            peer_id="peer1",
            name="api-server",
            image="api:latest",
            health=ContainerHealth.CRASHED,
            status="crashed"
        )
        assert state.health == ContainerHealth.CRASHED
        assert state.status == "crashed"


class TestGlobalState:
    """Tests for GlobalState dataclass."""

    def test_create_global_state(self):
        """Test creating global state."""
        state = GlobalState(timestamp=datetime.now())
        assert state.total_clusters == 0
        assert state.total_peers == 0
        assert state.total_containers == 0
        assert state.healthy_clusters == 0
        assert state.degraded_clusters == 0
        assert state.offline_clusters == 0

    def test_global_state_with_values(self):
        """Test global state with values."""
        state = GlobalState(
            timestamp=datetime.now(),
            total_clusters=5,
            total_peers=20,
            total_containers=100,
            healthy_clusters=4,
            degraded_clusters=1,
            offline_clusters=0,
            total_cpu_utilization=45.5,
            total_memory_utilization=60.0,
            active_migrations=2,
            active_alerts=3,
            events_last_hour=150,
            events_last_day=2500
        )
        assert state.total_clusters == 5
        assert state.total_peers == 20
        assert state.total_containers == 100
        assert state.active_migrations == 2
        assert state.events_last_hour == 150


class TestEventCorrelation:
    """Tests for EventCorrelation dataclass."""

    def test_create_event_correlation(self):
        """Test creating event correlation."""
        corr = EventCorrelation(event_id="evt1")
        assert corr.event_id == "evt1"
        assert corr.correlated_events == []
        assert corr.correlation_strength == 0.0
        assert corr.pattern_type == ""

    def test_event_correlation_with_data(self):
        """Test event correlation with data."""
        corr = EventCorrelation(
            event_id="evt1",
            correlated_events=["evt2", "evt3"],
            correlation_strength=0.85,
            pattern_type="temporal"
        )
        assert len(corr.correlated_events) == 2
        assert corr.correlation_strength == 0.85


class TestStateAggregator:
    """Tests for StateAggregator class."""

    def test_create_state_aggregator(self):
        """Test creating state aggregator."""
        aggregator = StateAggregator()
        assert len(aggregator.cluster_states) == 0
        assert len(aggregator.peer_states) == 0
        assert len(aggregator.container_states) == 0

    def test_register_cluster(self):
        """Test registering a cluster."""
        aggregator = StateAggregator()
        identity = ClusterIdentity(
            id="cluster1",
            name="US-East",
            region="us-east-1",
            endpoint="https://cluster1.example.com"
        )
        aggregator.register_cluster(identity)
        assert "cluster1" in aggregator.cluster_states
        assert aggregator.cluster_states["cluster1"] == ClusterHealth.UNKNOWN

    def test_unregister_cluster(self):
        """Test unregistering a cluster."""
        aggregator = StateAggregator()
        identity = ClusterIdentity(
            id="cluster1",
            name="US-East",
            region="us-east-1",
            endpoint="https://cluster1.example.com"
        )
        aggregator.register_cluster(identity)
        aggregator.unregister_cluster("cluster1")
        assert "cluster1" not in aggregator.cluster_states

    def test_update_cluster_health(self):
        """Test updating cluster health."""
        aggregator = StateAggregator()
        aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        assert aggregator.cluster_states["cluster1"] == ClusterHealth.HEALTHY

    def test_update_peer(self):
        """Test updating peer state."""
        aggregator = StateAggregator()
        aggregator.update_peer(
            peer_id="peer1",
            cluster_id="cluster1",
            name="peer-01",
            endpoint="https://peer1.example.com",
            health=PeerHealth.HEALTHY
        )
        assert "peer1" in aggregator.peer_states
        assert aggregator.peer_states["peer1"].health == PeerHealth.HEALTHY

    def test_unregister_peer(self):
        """Test unregistering a peer."""
        aggregator = StateAggregator()
        aggregator.update_peer(
            peer_id="peer1",
            cluster_id="cluster1",
            name="peer-01",
            endpoint="https://peer1.example.com"
        )
        aggregator.unregister_peer("peer1")
        assert "peer1" not in aggregator.peer_states

    def test_update_container(self):
        """Test updating container state."""
        aggregator = StateAggregator()
        aggregator.update_container(
            container_id="cont1",
            cluster_id="cluster1",
            peer_id="peer1",
            name="web-server",
            image="nginx:latest",
            health=ContainerHealth.RUNNING
        )
        assert "cont1" in aggregator.container_states
        assert aggregator.container_states["cont1"].health == ContainerHealth.RUNNING

    def test_unregister_container(self):
        """Test unregistering a container."""
        aggregator = StateAggregator()
        aggregator.update_container(
            container_id="cont1",
            cluster_id="cluster1",
            peer_id="peer1",
            name="web-server",
            image="nginx:latest"
        )
        aggregator.unregister_container("cont1")
        assert "cont1" not in aggregator.container_states

    def test_record_event(self):
        """Test recording events."""
        aggregator = StateAggregator()
        event = GlobalEvent(
            id="evt1",
            event_type=EventType.ALERT_TRIGGERED,
            timestamp=datetime.now(),
            cluster_id="cluster1"
        )
        aggregator.record_event(event)
        assert len(aggregator.event_buffer) == 1

    def test_aggregate(self):
        """Test state aggregation."""
        aggregator = StateAggregator()
        aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        aggregator.update_cluster_health("cluster2", ClusterHealth.DEGRADED)
        aggregator.update_cluster_health("cluster3", ClusterHealth.OFFLINE)
        aggregator.update_peer("peer1", "cluster1", "peer-01", "ep1")
        aggregator.update_peer("peer2", "cluster1", "peer-02", "ep2")
        aggregator.update_container("cont1", "cluster1", "peer1", "web", "nginx")

        state = aggregator.aggregate()
        assert state.total_clusters == 3
        assert state.total_peers == 2
        assert state.total_containers == 1
        assert state.healthy_clusters == 1
        assert state.degraded_clusters == 1
        assert state.offline_clusters == 1

    def test_get_current_state(self):
        """Test getting current state."""
        aggregator = StateAggregator()
        aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        state = aggregator.get_current_state()
        assert state.total_clusters == 1
        assert state.healthy_clusters == 1

    def test_get_state_history(self):
        """Test getting state history."""
        aggregator = StateAggregator()
        aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        aggregator.aggregate()
        aggregator.update_cluster_health("cluster2", ClusterHealth.HEALTHY)
        aggregator.aggregate()

        history = aggregator.get_state_history(limit=2)
        assert len(history) == 2

    def test_get_cluster_state(self):
        """Test getting specific cluster state."""
        aggregator = StateAggregator()
        aggregator.update_cluster_health("cluster1", ClusterHealth.CRITICAL)
        health = aggregator.get_cluster_state("cluster1")
        assert health == ClusterHealth.CRITICAL

    def test_get_peer_state(self):
        """Test getting specific peer state."""
        aggregator = StateAggregator()
        aggregator.update_peer(
            peer_id="peer1",
            cluster_id="cluster1",
            name="peer-01",
            endpoint="https://peer1.example.com",
            health=PeerHealth.DEGRADED
        )
        state = aggregator.get_peer_state("peer1")
        assert state is not None
        assert state.health == PeerHealth.DEGRADED

    def test_get_container_state(self):
        """Test getting specific container state."""
        aggregator = StateAggregator()
        aggregator.update_container(
            container_id="cont1",
            cluster_id="cluster1",
            peer_id="peer1",
            name="web-server",
            image="nginx:latest",
            health=ContainerHealth.RUNNING
        )
        state = aggregator.get_container_state("cont1")
        assert state is not None
        assert state.health == ContainerHealth.RUNNING

    def test_event_buffer_max_size(self):
        """Test event buffer respects max size."""
        aggregator = StateAggregator()
        aggregator.max_buffer_size = 5
        for i in range(10):
            event = GlobalEvent(
                id=f"evt{i}",
                event_type=EventType.STATE_CHANGE,
                timestamp=datetime.now(),
                cluster_id="cluster1"
            )
            aggregator.record_event(event)
        assert len(aggregator.event_buffer) == 5


class TestEventCorrelator:
    """Tests for EventCorrelator class."""

    def test_create_event_correlator(self):
        """Test creating event correlator."""
        correlator = EventCorrelator()
        assert correlator.correlation_window_seconds == 300

    def test_correlate_events_time_proximity(self):
        """Test correlating events by time proximity."""
        correlator = EventCorrelator(correlation_window_seconds=60)
        now = datetime.now()
        events = [
            GlobalEvent(
                id="evt1",
                event_type=EventType.ALERT_TRIGGERED,
                timestamp=now,
                cluster_id="cluster1"
            ),
            GlobalEvent(
                id="evt2",
                event_type=EventType.ALERT_TRIGGERED,
                timestamp=now + timedelta(seconds=10),
                cluster_id="cluster1"
            ),
            GlobalEvent(
                id="evt3",
                event_type=EventType.ALERT_TRIGGERED,
                timestamp=now + timedelta(seconds=120),  # Outside window
                cluster_id="cluster1"
            ),
        ]
        correlations = correlator.correlate_events(events)
        # evt1 and evt2 should correlate, evt3 is outside window
        assert len(correlations) == 1
        assert correlations[0][2] > 0  # correlation score

    def test_correlate_events_same_cluster(self):
        """Test correlation bonus for same cluster."""
        correlator = EventCorrelator()
        now = datetime.now()
        events = [
            GlobalEvent(
                id="evt1",
                event_type=EventType.STATE_CHANGE,
                timestamp=now,
                cluster_id="cluster1"
            ),
            GlobalEvent(
                id="evt2",
                event_type=EventType.STATE_CHANGE,
                timestamp=now + timedelta(seconds=10),
                cluster_id="cluster1"  # Same cluster
            ),
        ]
        correlations = correlator.correlate_events(events)
        # Should have cluster bonus (+0.3)
        assert correlations[0][2] >= 1.3

    def test_correlate_events_same_type(self):
        """Test correlation bonus for same event type."""
        correlator = EventCorrelator()
        now = datetime.now()
        events = [
            GlobalEvent(
                id="evt1",
                event_type=EventType.ALERT_TRIGGERED,
                timestamp=now,
                cluster_id="cluster1"
            ),
            GlobalEvent(
                id="evt2",
                event_type=EventType.ALERT_TRIGGERED,  # Same type
                timestamp=now + timedelta(seconds=10),
                cluster_id="cluster2"
            ),
        ]
        correlations = correlator.correlate_events(events)
        # Should have type bonus (+0.2)
        assert correlations[0][2] >= 1.2

    def test_find_patterns_periodic(self):
        """Test finding periodic patterns."""
        correlator = EventCorrelator()
        base_time = datetime.now()
        events = []
        # Create periodic events every 60 seconds
        for i in range(5):
            events.append(GlobalEvent(
                id=f"evt{i}",
                event_type=EventType.METRIC_THRESHOLD,
                timestamp=base_time + timedelta(seconds=i * 60),
                cluster_id="cluster1"
            ))
        patterns = correlator.find_patterns(events)
        assert len(patterns) == 1
        assert patterns[0]["type"] == "periodic"
        assert patterns[0]["event_type"] == "metric_threshold"

    def test_find_patterns_no_pattern(self):
        """Test no pattern found for irregular events."""
        correlator = EventCorrelator()
        base_time = datetime.now()
        events = []
        # Create irregular events
        for i, offset in enumerate([0, 10, 100, 5, 200]):
            events.append(GlobalEvent(
                id=f"evt{i}",
                event_type=EventType.ALERT_TRIGGERED,
                timestamp=base_time + timedelta(seconds=offset),
                cluster_id="cluster1"
            ))
        patterns = correlator.find_patterns(events)
        # No periodic pattern should be detected
        periodic = [p for p in patterns if p["type"] == "periodic"]
        assert len(periodic) == 0


class TestGlobalDashboard:
    """Tests for GlobalDashboard class."""

    def test_create_dashboard(self):
        """Test creating dashboard."""
        dashboard = GlobalDashboard()
        assert len(dashboard.panels) == 0
        assert len(dashboard._alerts) == 0

    def test_register_panel(self):
        """Test registering a panel."""
        dashboard = GlobalDashboard()
        dashboard.register_panel("metrics", {"title": "Metrics"})
        assert "metrics" in dashboard.panels

    def test_update_panel(self):
        """Test updating a panel."""
        dashboard = GlobalDashboard()
        dashboard.register_panel("metrics", {"title": "Metrics"})
        dashboard.update_panel("metrics", {"data": [1, 2, 3]})
        assert dashboard.panels["metrics"]["data"] == [1, 2, 3]

    def test_get_panel(self):
        """Test getting a panel."""
        dashboard = GlobalDashboard()
        dashboard.register_panel("metrics", {"title": "Metrics"})
        panel = dashboard.get_panel("metrics")
        assert panel["title"] == "Metrics"

    def test_get_panel_not_found(self):
        """Test getting non-existent panel."""
        dashboard = GlobalDashboard()
        panel = dashboard.get_panel("nonexistent")
        assert panel is None

    def test_refresh(self):
        """Test refreshing dashboard."""
        dashboard = GlobalDashboard()
        dashboard.register_panel("overview", {"title": "Overview"})
        state = dashboard.refresh()
        assert isinstance(state, GlobalState)
        assert "global_state" in dashboard.panels["overview"]

    def test_add_alert(self):
        """Test adding an alert."""
        dashboard = GlobalDashboard()
        dashboard.add_alert(
            severity="critical",
            title="High CPU",
            message="CPU usage above 90%",
            cluster_id="cluster1"
        )
        assert len(dashboard._alerts) == 1
        assert dashboard._alerts[0]["severity"] == "critical"

    def test_add_alert_max_size(self):
        """Test alert list respects max size."""
        dashboard = GlobalDashboard()
        for i in range(150):
            dashboard.add_alert(
                severity="info",
                title=f"Alert {i}",
                message="Test"
            )
        assert len(dashboard._alerts) == 100

    def test_get_alerts(self):
        """Test getting alerts."""
        dashboard = GlobalDashboard()
        dashboard.add_alert("info", "A1", "M1")
        dashboard.add_alert("info", "A2", "M2")
        alerts = dashboard.get_alerts(limit=1)
        assert len(alerts) == 1

    def test_get_summary(self):
        """Test getting dashboard summary."""
        dashboard = GlobalDashboard()
        dashboard.state_aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        summary = dashboard.get_summary()
        assert summary["total_clusters"] == 1
        assert summary["healthy_clusters"] == 1


class TestGlobalAwareness:
    """Tests for GlobalAwareness class."""

    def test_create_global_awareness(self):
        """Test creating global awareness."""
        awareness = GlobalAwareness()
        assert len(awareness.clusters) == 0
        assert len(awareness._event_history) == 0

    def test_register_cluster(self):
        """Test registering a cluster."""
        awareness = GlobalAwareness()
        identity = ClusterIdentity(
            id="cluster1",
            name="US-East",
            region="us-east-1",
            endpoint="https://cluster1.example.com"
        )
        awareness.register_cluster(identity)
        assert "cluster1" in awareness.clusters
        assert len(awareness._event_history) == 1
        assert awareness._event_history[0].event_type == EventType.CLUSTER_JOIN

    def test_unregister_cluster(self):
        """Test unregistering a cluster."""
        awareness = GlobalAwareness()
        identity = ClusterIdentity(
            id="cluster1",
            name="US-East",
            region="us-east-1",
            endpoint="https://cluster1.example.com"
        )
        awareness.register_cluster(identity)
        awareness.unregister_cluster("cluster1")
        assert "cluster1" not in awareness.clusters
        # Two events: join and leave
        assert len(awareness._event_history) == 2

    def test_update_cluster_health(self):
        """Test updating cluster health."""
        awareness = GlobalAwareness()
        awareness.state_aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        awareness.update_cluster_health("cluster1", ClusterHealth.CRITICAL)
        health = awareness.get_cluster_health("cluster1")
        assert health == ClusterHealth.CRITICAL

    def test_update_cluster_health_creates_alert(self):
        """Test critical health creates dashboard alert."""
        awareness = GlobalAwareness()
        awareness.state_aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        awareness.update_cluster_health("cluster1", ClusterHealth.CRITICAL)
        alerts = awareness.dashboard.get_alerts()
        assert len(alerts) == 1
        assert alerts[0]["severity"] == "critical"

    def test_update_peer(self):
        """Test updating peer state."""
        awareness = GlobalAwareness()
        awareness.update_peer(
            peer_id="peer1",
            cluster_id="cluster1",
            name="peer-01",
            endpoint="https://peer1.example.com",
            health=PeerHealth.HEALTHY
        )
        state = awareness.state_aggregator.get_peer_state("peer1")
        assert state is not None
        assert state.health == PeerHealth.HEALTHY

    def test_update_peer_critical_creates_event(self):
        """Test critical peer creates warning event."""
        awareness = GlobalAwareness()
        awareness.update_peer(
            peer_id="peer1",
            cluster_id="cluster1",
            name="peer-01",
            endpoint="https://peer1.example.com",
            health=PeerHealth.CRITICAL
        )
        assert len(awareness._event_history) == 1
        assert awareness._event_history[0].event_type == EventType.PEER_LEAVE

    def test_update_container(self):
        """Test updating container state."""
        awareness = GlobalAwareness()
        awareness.update_container(
            container_id="cont1",
            cluster_id="cluster1",
            peer_id="peer1",
            name="web-server",
            image="nginx:latest",
            health=ContainerHealth.RUNNING
        )
        state = awareness.state_aggregator.get_container_state("cont1")
        assert state is not None
        assert state.health == ContainerHealth.RUNNING

    def test_update_container_crashed_creates_event(self):
        """Test crashed container creates error event."""
        awareness = GlobalAwareness()
        awareness.update_container(
            container_id="cont1",
            cluster_id="cluster1",
            peer_id="peer1",
            name="web-server",
            image="nginx:latest",
            health=ContainerHealth.CRASHED
        )
        assert len(awareness._event_history) == 1
        assert awareness._event_history[0].severity == EventSeverity.ERROR

    def test_record_migration(self):
        """Test recording migration event."""
        awareness = GlobalAwareness()
        awareness.record_migration(
            migration_id="mig1",
            source_cluster="cluster1",
            target_cluster="cluster2",
            container_id="cont1"
        )
        assert len(awareness._event_history) == 1
        assert awareness._event_history[0].event_type == EventType.MIGRATION_STARTED
        assert awareness._event_history[0].target == "cluster2"

    def test_record_alert(self):
        """Test recording alert event."""
        awareness = GlobalAwareness()
        awareness.record_alert(
            alert_type="CPU Alert",
            severity="critical",
            message="CPU above 90%",
            cluster_id="cluster1"
        )
        assert len(awareness._event_history) == 1
        assert awareness._event_history[0].event_type == EventType.ALERT_TRIGGERED
        alerts = awareness.dashboard.get_alerts()
        assert len(alerts) == 1

    def test_subscribe(self):
        """Test subscribing to events."""
        awareness = GlobalAwareness()
        callback = MagicMock()
        awareness.subscribe(callback)
        identity = ClusterIdentity(
            id="cluster1",
            name="US-East",
            region="us-east-1",
            endpoint="https://cluster1.example.com"
        )
        awareness.register_cluster(identity)
        callback.assert_called_once()

    def test_get_global_state(self):
        """Test getting global state."""
        awareness = GlobalAwareness()
        awareness.state_aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        state = awareness.get_global_state()
        assert state.total_clusters == 1

    def test_get_state_history(self):
        """Test getting state history."""
        awareness = GlobalAwareness()
        awareness.state_aggregator.update_cluster_health("cluster1", ClusterHealth.HEALTHY)
        awareness.state_aggregator.aggregate()
        history = awareness.get_state_history()
        assert len(history) == 1

    def test_get_dashboard_summary(self):
        """Test getting dashboard summary."""
        awareness = GlobalAwareness()
        summary = awareness.get_dashboard_summary()
        assert "total_clusters" in summary
        assert "timestamp" in summary

    def test_get_recent_events(self):
        """Test getting recent events."""
        awareness = GlobalAwareness()
        identity = ClusterIdentity(
            id="cluster1",
            name="US-East",
            region="us-east-1",
            endpoint="https://cluster1.example.com"
        )
        awareness.register_cluster(identity)
        events = awareness.get_recent_events()
        assert len(events) == 1

    def test_find_correlated_events(self):
        """Test finding correlated events."""
        awareness = GlobalAwareness()
        # Add some events
        now = datetime.now()
        for i in range(3):
            event = GlobalEvent(
                id=f"evt{i}",
                event_type=EventType.ALERT_TRIGGERED,
                timestamp=now + timedelta(seconds=i * 5),
                cluster_id="cluster1"
            )
            awareness._record_event(event)
        correlations = awareness.find_correlated_events(event)
        assert len(correlations) > 0

    def test_find_patterns(self):
        """Test finding patterns."""
        awareness = GlobalAwareness()
        base_time = datetime.now()
        # Create periodic events
        for i in range(5):
            event = GlobalEvent(
                id=f"evt{i}",
                event_type=EventType.METRIC_THRESHOLD,
                timestamp=base_time + timedelta(seconds=i * 60),
                cluster_id="cluster1"
            )
            awareness._record_event(event)
        patterns = awareness.find_patterns()
        assert len(patterns) > 0

    def test_event_history_max_size(self):
        """Test event history respects max size."""
        awareness = GlobalAwareness()
        awareness.max_history = 5
        for i in range(10):
            event = GlobalEvent(
                id=f"evt{i}",
                event_type=EventType.STATE_CHANGE,
                timestamp=datetime.now(),
                cluster_id="cluster1"
            )
            awareness._record_event(event)
        assert len(awareness._event_history) == 5


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_cluster_identity(self):
        """Test create_cluster_identity factory."""
        identity = create_cluster_identity(
            name="US-East",
            region="us-east-1",
            endpoint="https://cluster1.example.com"
        )
        assert identity.name == "US-East"
        assert identity.region == "us-east-1"
        assert len(identity.id) == 8

    def test_create_cluster_identity_with_version(self):
        """Test create_cluster_identity with version."""
        identity = create_cluster_identity(
            name="EU-West",
            region="eu-west-1",
            endpoint="https://cluster2.example.com",
            version="2.0.0"
        )
        assert identity.version == "2.0.0"

    def test_create_global_awareness(self):
        """Test create_global_awareness factory."""
        awareness = create_global_awareness()
        assert isinstance(awareness, GlobalAwareness)


class TestIntegration:
    """Integration tests for Global Awareness."""

    def test_full_workflow(self):
        """Test complete workflow from cluster join to state aggregation."""
        awareness = GlobalAwareness()

        # Register clusters
        cluster1 = create_cluster_identity("US-East", "us-east-1", "https://c1.example.com")
        cluster2 = create_cluster_identity("EU-West", "eu-west-1", "https://c2.example.com")

        awareness.register_cluster(cluster1)
        awareness.register_cluster(cluster2)

        # Update health
        awareness.update_cluster_health(cluster1.id, ClusterHealth.HEALTHY)
        awareness.update_cluster_health(cluster2.id, ClusterHealth.DEGRADED)

        # Add peers
        awareness.update_peer("peer1", cluster1.id, "peer-01", "ep1", PeerHealth.HEALTHY)
        awareness.update_peer("peer2", cluster1.id, "peer-02", "ep2", PeerHealth.HEALTHY)
        awareness.update_peer("peer3", cluster2.id, "peer-03", "ep3", PeerHealth.DEGRADED)

        # Add containers
        awareness.update_container("cont1", cluster1.id, "peer1", "web", "nginx", ContainerHealth.RUNNING)
        awareness.update_container("cont2", cluster1.id, "peer1", "api", "api:latest", ContainerHealth.RUNNING)

        # Record migration
        awareness.record_migration("mig1", cluster1.id, cluster2.id, "cont1")

        # Check global state
        state = awareness.get_global_state()
        assert state.total_clusters == 2
        assert state.healthy_clusters == 1
        assert state.degraded_clusters == 1
        assert state.total_peers == 3
        assert state.total_containers == 2

        # Check events
        events = awareness.get_recent_events()
        assert len(events) >= 6  # 2 joins + 2 health + migration

    def test_alerting_workflow(self):
        """Test alerting workflow."""
        awareness = GlobalAwareness()

        # Register cluster
        cluster = create_cluster_identity("US-East", "us-east-1", "https://c1.example.com")
        awareness.register_cluster(cluster)

        # Trigger critical health
        awareness.update_cluster_health(cluster.id, ClusterHealth.CRITICAL)

        # Check alert was created
        alerts = awareness.dashboard.get_alerts()
        assert len(alerts) == 1
        assert alerts[0]["severity"] == "critical"

        # Check event was recorded
        events = awareness.get_recent_events()
        state_changes = [e for e in events if e.event_type == EventType.STATE_CHANGE]
        assert len(state_changes) == 1

    def test_event_subscription_workflow(self):
        """Test event subscription workflow."""
        received_events = []

        def event_handler(event):
            received_events.append(event)

        awareness = GlobalAwareness()
        awareness.subscribe(event_handler)

        cluster = create_cluster_identity("US-East", "us-east-1", "https://c1.example.com")
        awareness.register_cluster(cluster)

        assert len(received_events) == 1
        assert received_events[0].event_type == EventType.CLUSTER_JOIN


class TestEdgeCases:
    """Edge case tests."""

    def test_unregister_nonexistent_cluster(self):
        """Test unregistering non-existent cluster."""
        awareness = GlobalAwareness()
        # Should not raise
        awareness.unregister_cluster("nonexistent")

    def test_get_nonexistent_peer_state(self):
        """Test getting non-existent peer state."""
        aggregator = StateAggregator()
        state = aggregator.get_peer_state("nonexistent")
        assert state is None

    def test_get_nonexistent_container_state(self):
        """Test getting non-existent container state."""
        aggregator = StateAggregator()
        state = aggregator.get_container_state("nonexistent")
        assert state is None

    def test_empty_event_correlation(self):
        """Test correlating empty event list."""
        correlator = EventCorrelator()
        correlations = correlator.correlate_events([])
        assert len(correlations) == 0

    def test_single_event_correlation(self):
        """Test correlating single event."""
        correlator = EventCorrelator()
        event = GlobalEvent(
            id="evt1",
            event_type=EventType.STATE_CHANGE,
            timestamp=datetime.now(),
            cluster_id="cluster1"
        )
        correlations = correlator.correlate_events([event])
        assert len(correlations) == 0

    def test_dashboard_update_nonexistent_panel(self):
        """Test updating non-existent panel."""
        dashboard = GlobalDashboard()
        # Should not raise
        dashboard.update_panel("nonexistent", {"data": 1})

    def test_awareness_with_none_cluster_id(self):
        """Test awareness with None cluster_id."""
        awareness = GlobalAwareness()
        # record_alert handles None cluster_id
        awareness.record_alert("Test", "info", "Message", cluster_id=None)
        assert len(awareness._event_history) == 1
        assert awareness._event_history[0].cluster_id == "global"
