"""
Tests for Event Streaming (Phase 33)

Tests mesh event bus, event subscribers, and filters.
"""

import asyncio

import pytest

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
    MigrationStatus,
)
from systems.visual_shell.event_streaming import (
    EventFilter,
    EventSubscriber,
    MeshEvent,
    MeshEventBus,
    MeshEventConnector,
    MeshEventType,
    create_mesh_event_bus,
    create_mesh_event_connector,
)


class TestMeshEventType:
    """Tests for MeshEventType enum."""

    def test_event_types(self):
        assert MeshEventType.PEER_JOINED.value == "peer_joined"
        assert MeshEventType.PEER_LEFT.value == "peer_left"
        assert MeshEventType.PEER_METRICS_UPDATED.value == "peer_metrics_updated"
        assert MeshEventType.MIGRATION_STARTED.value == "migration_started"
        assert MeshEventType.MIGRATION_PROGRESS.value == "migration_progress"
        assert MeshEventType.MIGRATION_COMPLETED.value == "migration_completed"
        assert MeshEventType.MIGRATION_FAILED.value == "migration_failed"
        assert MeshEventType.CONTAINER_ADDED.value == "container_added"
        assert MeshEventType.CONTAINER_REMOVED.value == "container_removed"
        assert MeshEventType.ALERT_TRIGGERED.value == "alert_triggered"
        assert MeshEventType.HEALTH_CHECK.value == "health_check"
        assert MeshEventType.USER_ACTION.value == "user_action"
        assert MeshEventType.NETWORK_DISCONNECT.value == "network_disconnect"
        assert MeshEventType.CUSTOM_EVENT.value == "custom_event"


class TestMeshEvent:
    """Tests for MeshEvent dataclass."""

    def test_event_creation(self):
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={"peer_id": "peer-1"},
        )
        assert event.event_type == MeshEventType.PEER_JOINED
        assert event.data == {"peer_id": "peer-1"}
        assert event.event_id is not None
        assert event.timestamp is not None
        assert event.source_peer_id is None
        assert event.correlation_id is None

    def test_event_with_source(self):
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={"peer_id": "peer-1"},
            source_peer_id="local-peer",
        )
        assert event.source_peer_id == "local-peer"

    def test_event_with_correlation(self):
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={"peer_id": "peer-1"},
            correlation_id="corr-123",
        )
        assert event.correlation_id == "corr-123"


class TestEventFilter:
    """Tests for EventFilter dataclass."""

    def test_filter_creation(self):
        filter = EventFilter(
            event_types=[MeshEventType.PEER_JOINED, MeshEventType.PEER_LEFT],
            source_peer_id="peer-1",
            min_severity="warning",
        )
        assert filter.event_types == [MeshEventType.PEER_JOINED, MeshEventType.PEER_LEFT]
        assert filter.source_peer_id == "peer-1"
        assert filter.min_severity == "warning"

    def test_filter_all_types(self):
        filter = EventFilter()
        assert filter.matches(MeshEventType.PEER_JOINED) is True
        assert filter.matches(MeshEventType.PEER_LEFT) is True
        assert filter.matches(MeshEventType.ALERT_TRIGGERED) is True

    def test_filter_by_type(self):
        filter = EventFilter(
            event_types=[MeshEventType.PEER_JOINED],
        )
        assert filter.matches(MeshEventType.PEER_JOINED) is True
        assert filter.matches(MeshEventType.PEER_LEFT) is False

    def test_filter_by_source_peer(self):
        filter = EventFilter(
            source_peer_id="peer-1",
        )
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={},
            source_peer_id="peer-1",
        )
        assert filter.matches(event) is True
        event2 = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={},
            source_peer_id="peer-2",
        )
        assert filter.matches(event2) is False

    def test_filter_by_severity(self):
        filter = EventFilter(
            min_severity="critical",
        )
        # Filter should check severity in event data
        event = MeshEvent(
            event_type=MeshEventType.ALERT_TRIGGERED,
            data={"severity": "info"},
        )
        assert filter.matches(event) is False
        event = MeshEvent(
            event_type=MeshEventType.ALERT_TRIGGERED,
            data={"severity": "critical"},
        )
        assert filter.matches(event) is True

    def test_filter_no_types(self):
        filter = EventFilter()
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={},
        )
        assert filter.matches(event) is True  # No types filter matches all

    def test_filter_container_events(self):
        filter = EventFilter(
            event_types=[MeshEventType.CONTAINER_ADDED, MeshEventType.CONTAINER_REMOVED],
        )
        event = MeshEvent(
            event_type=MeshEventType.CONTAINER_ADDED,
            data={"container_id": "container-1"},
        )
        assert filter.matches(event) is True
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={},
        )
        assert filter.matches(event) is False

    def test_filter_alert_events(self):
        filter = EventFilter(
            event_types=[MeshEventType.ALERT_TRIGGERED],
        )
        event = MeshEvent(
            event_type=MeshEventType.ALERT_TRIGGERED,
            data={"peer_id": "peer-1"},
        )
        assert filter.matches(event) is True

    def test_filter_threshold_events(self):
        """Test that source_peer filter only matches events from that peer."""
        filter = EventFilter(
            source_peer_id="peer-1",
        )
        # Events from peer-1 match
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={"peer_id": "peer-1"},
            source_peer_id="peer-1",
        )
        assert filter.matches(event) is True
        # Events from peer-2 don't match
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={"peer_id": "peer-2"},
            source_peer_id="peer-2",
        )
        assert filter.matches(event) is False
        # Events from peer-1 about another peer still match (source is peer-1)
        event = MeshEvent(
            event_type=MeshEventType.PEER_JOINED,
            data={"peer_id": "peer-3"},
            source_peer_id="peer-1",
        )
        assert filter.matches(event) is True

    def test_filter_custom_event_type(self):
        filter = EventFilter(
            event_types=[MeshEventType.CUSTOM_EVENT],
        )
        event = MeshEvent(
            event_type=MeshEventType.CUSTOM_EVENT,
            data={"custom": "data"},
        )
        assert filter.matches(event) is True


class TestEventSubscriber:
    """Tests for EventSubscriber."""

    @pytest.fixture
    def subscriber(self):
        return EventSubscriber("test-sub")

    def test_subscriber_creation(self, subscriber):
        assert subscriber.subscriber_id == "test-sub"
        assert subscriber._active is False
        assert subscriber.event_bus is None
        assert subscriber.event_filter is None
        assert subscriber._queue.qsize() == 0

    def test_subscriber_activation(self, subscriber):
        subscriber.activate()
        assert subscriber._active is True

    def test_subscriber_deactivation(self, subscriber):
        subscriber.activate()
        subscriber.deactivate()
        assert subscriber._active is False

    @pytest.mark.asyncio
    async def test_push_events(self, subscriber):
        subscriber.activate()
        for i in range(5):
            event = MeshEvent(
                event_type=MeshEventType.PEER_JOINED,
                data={"index": i},
            )
            await subscriber.push(event)
        # Check queue has 5 events
        assert subscriber._queue.qsize() == 5

    @pytest.mark.asyncio
    async def test_push_with_filter(self):
        bus = MeshEventBus(local_peer_id="test-local")
        subscriber = bus.subscribe(
            "filter-sub",
            EventFilter(
                event_types=[MeshEventType.PEER_JOINED],
            ),
        )
        subscriber.activate()
        # Publish non-matching events
        for i in range(3):
            await bus.publish(
                MeshEventType.PEER_LEFT,
                {"peer_id": f"peer-{i}"},
            )
        # Process events
        await asyncio.sleep(0.1)
        # Should have 0 events (filter blocks peer_left)
        assert subscriber._queue.qsize() == 0

    @pytest.mark.asyncio
    async def test_push_events_and_retrieve(self, subscriber):
        subscriber.activate()
        for i in range(5):
            event = MeshEvent(
                event_type=MeshEventType.PEER_JOINED,
                data={"index": i},
            )
            await subscriber.push(event)
        # Retrieve events
        events = []
        for _ in range(5):
            event = await subscriber.get_event(timeout=0.1)
            if event:
                events.append(event)
        assert len(events) == 5


class TestMeshEventBus:
    """Tests for MeshEventBus."""

    @pytest.fixture
    def bus(self):
        return MeshEventBus(local_peer_id="test-local")

    def test_bus_creation(self, bus):
        assert bus.local_peer_id == "test-local"
        assert bus._running is False
        assert len(bus._subscribers) == 0
        assert len(bus._history) == 0

    def test_bus_stats(self, bus):
        stats = bus.get_stats()
        assert stats["running"] is False
        assert stats["subscriber_count"] == 0
        assert stats["history_size"] == 0
        assert stats["events_published"] == 0

    @pytest.mark.asyncio
    async def test_bus_start_stop(self, bus):
        await bus.start()
        assert bus._running is True
        await bus.stop()
        assert bus._running is False

    @pytest.mark.asyncio
    async def test_bus_publish_subscribe(self, bus):
        await bus.start()
        events_received = []

        async def handler(event):
            events_received.append(event)

        subscriber = bus.subscribe(
            "handler-sub",
            EventFilter(
                event_types=[MeshEventType.PEER_JOINED],
            ),
            handler=handler,
        )
        subscriber.activate()

        # Publish some events
        for i in range(3):
            await bus.publish(
                MeshEventType.PEER_JOINED,
                {"peer_id": f"peer-{i}"},
            )
        await asyncio.sleep(0.2)
        assert len(events_received) == 3
        await bus.stop()

    @pytest.mark.asyncio
    async def test_bus_publish_with_source(self, bus):
        await bus.start()
        events_received = []

        async def handler(event):
            events_received.append(event)

        subscriber = bus.subscribe(
            "handler-with-source",
            EventFilter(
                source_peer_id="local",
            ),
            handler=handler,
        )
        subscriber.activate()

        await bus.publish(
            MeshEventType.PEER_JOINED,
            {"peer_id": "peer-1"},
            source_peer_id="local",
        )
        await asyncio.sleep(0.2)
        assert len(events_received) == 1
        assert events_received[0].source_peer_id == "local"
        await bus.stop()

    @pytest.mark.asyncio
    async def test_bus_publish_with_correlation(self, bus):
        await bus.start()
        events_received = []

        async def handler(event):
            events_received.append(event)

        subscriber = bus.subscribe(
            "handler-with-corr",
            EventFilter(
                correlation_id="test-correlation",
            ),
            handler=handler,
        )
        subscriber.activate()

        await bus.publish(
            MeshEventType.PEER_JOINED,
            {"peer_id": "peer-1"},
            correlation_id="test-correlation",
        )
        await asyncio.sleep(0.2)
        assert len(events_received) == 1
        assert events_received[0].correlation_id == "test-correlation"
        await bus.stop()

    @pytest.mark.asyncio
    async def test_bus_history(self, bus):
        await bus.start()
        # Publish some events
        for i in range(5):
            await bus.publish(
                MeshEventType.PEER_JOINED,
                {"peer_id": f"peer-{i}"},
            )
        await asyncio.sleep(0.2)
        history = bus.get_history()
        assert len(history) == 5
        # Get history by type
        joined_events = bus.get_history(MeshEventType.PEER_JOINED)
        assert len(joined_events) == 5
        # Get stats
        await bus.stop()
        stats = bus.get_stats()
        assert stats["events_published"] == 5
        assert stats["events_by_type"]["peer_joined"] == 5

    @pytest.mark.asyncio
    async def test_bus_unsubscribe(self, bus):
        await bus.start()
        events_received = []

        async def handler(event):
            events_received.append(event)

        subscriber = bus.subscribe(
            "test-sub",
            EventFilter(
                event_types=[MeshEventType.PEER_JOINED],
            ),
            handler=handler,
        )
        subscriber.activate()

        await bus.publish(
            MeshEventType.PEER_JOINED,
            {"peer_id": "peer-1"},
        )
        await asyncio.sleep(0.2)
        assert len(events_received) == 1

        bus.unsubscribe("test-sub")
        await bus.publish(
            MeshEventType.PEER_JOINED,
            {"peer_id": "peer-2"},
        )
        await asyncio.sleep(0.2)
        # Should not have received second event
        assert len(events_received) == 1
        await bus.stop()


class TestMeshEventConnector:
    """Tests for MeshEventConnector."""

    @pytest.fixture
    def event_bus(self):
        return MeshEventBus(local_peer_id="test-local")

    @pytest.fixture
    def visualizer(self):
        from systems.visual_shell.cluster_visualizer import ClusterVisualizer
        return ClusterVisualizer()

    @pytest.fixture
    def connector(self, event_bus, visualizer):
        return MeshEventConnector(
            event_bus=event_bus,
            visualizer=visualizer,
        )

    def test_connector_creation(self, connector):
        assert connector.event_bus is not None
        assert connector.visualizer is not None
        assert connector._running is False

    @pytest.mark.asyncio
    async def test_connector_start_stop(self, connector):
        await connector.start()
        assert connector._running is True
        await connector.stop()
        assert connector._running is False

    @pytest.mark.asyncio
    async def test_handle_peer_joined(self, connector, visualizer):
        await connector.event_bus.start()
        await connector.start()
        # Publish peer joined event
        await connector.event_bus.publish(
            MeshEventType.PEER_JOINED,
            {
                "peer_id": "peer-1",
                "hostname": "peer1.local",
                "cpu_percent": 50.0,
                "memory_percent": 60.0,
                "container_count": 3,
            },
        )
        await asyncio.sleep(0.2)
        # Check visualizer was updated
        assert "peer-1" in visualizer._peers
        peer = visualizer._peers["peer-1"]
        assert peer.hostname == "peer1.local"
        assert peer.cpu_percent == 50.0
        await connector.stop()
        await connector.event_bus.stop()

    @pytest.mark.asyncio
    async def test_handle_peer_left(self, connector, visualizer):
        await connector.event_bus.start()
        await connector.start()
        # Publish join event first
        await connector.event_bus.publish(
            MeshEventType.PEER_JOINED,
            {"peer_id": "peer-1"},
        )
        await asyncio.sleep(0.2)
        # Publish leave event
        await connector.event_bus.publish(
            MeshEventType.PEER_LEFT,
            {"peer_id": "peer-1"},
        )
        await asyncio.sleep(0.2)
        # Check visualizer was updated
        assert "peer-1" not in visualizer._peers
        await connector.stop()
        await connector.event_bus.stop()

    @pytest.mark.asyncio
    async def test_handle_peer_metrics(self, connector, visualizer):
        await connector.event_bus.start()
        await connector.start()
        # Publish initial metrics
        await connector.event_bus.publish(
            MeshEventType.PEER_METRICS_UPDATED,
            {
                "peer_id": "peer-1",
                "hostname": "peer1.local",
                "cpu_percent": 50.0,
                "memory_percent": 60.0,
                "container_count": 3,
            },
        )
        await asyncio.sleep(0.2)
        # Check visualizer
        peer = visualizer._peers["peer-1"]
        assert peer.cpu_percent == 50.0
        assert peer.memory_percent == 60.0
        await connector.stop()
        await connector.event_bus.stop()

    @pytest.mark.asyncio
    async def test_handle_migration_started(self, connector, visualizer):
        await connector.event_bus.start()
        await connector.start()
        # Add peers first
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        # Publish migration started
        await connector.event_bus.publish(
            MeshEventType.MIGRATION_STARTED,
            {
                "migration_id": "migr-1",
                "source_peer_id": "peer-1",
                "target_peer_id": "peer-2",
                "container_name": "web-server",
            },
        )
        await asyncio.sleep(0.2)
        # Check migration in visualizer
        assert "migr-1" in visualizer._migrations
        migration = visualizer._migrations["migr-1"]
        assert migration.source_peer_id == "peer-1"
        assert migration.target_peer_id == "peer-2"
        await connector.stop()
        await connector.event_bus.stop()

    @pytest.mark.asyncio
    async def test_handle_migration_progress(self, connector, visualizer):
        await connector.event_bus.start()
        await connector.start()
        # Setup migration
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")
        # Publish progress
        await connector.event_bus.publish(
            MeshEventType.MIGRATION_PROGRESS,
            {
                "migration_id": "migr-1",
                "progress": 0.5,
            },
        )
        await asyncio.sleep(0.2)
        # Check progress updated
        assert visualizer._migrations["migr-1"].progress == 0.5
        await connector.stop()
        await connector.event_bus.stop()

    @pytest.mark.asyncio
    async def test_handle_migration_completed(self, connector, visualizer):
        await connector.event_bus.start()
        await connector.start()
        # Setup migration
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")
        # Publish completed
        await connector.event_bus.publish(
            MeshEventType.MIGRATION_COMPLETED,
            {
                "migration_id": "migr-1",
                "success": True,
            },
        )
        await asyncio.sleep(0.2)
        # Check migration completed
        assert visualizer._migrations["migr-1"].status == MigrationStatus.COMPLETED
        await connector.stop()
        await connector.event_bus.stop()

    @pytest.mark.asyncio
    async def test_handle_migration_failed(self, connector, visualizer):
        await connector.event_bus.start()
        await connector.start()
        # Setup migration
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")
        # Publish failed
        await connector.event_bus.publish(
            MeshEventType.MIGRATION_FAILED,
            {
                "migration_id": "migr-1",
                "error": "Connection lost",
            },
        )
        await asyncio.sleep(0.2)
        # Check migration failed
        assert visualizer._migrations["migr-1"].status == MigrationStatus.FAILED
        await connector.stop()
        await connector.event_bus.stop()


class TestCreateMeshEventBus:
    """Tests for create_mesh_event_bus function."""

    def test_create_bus(self):
        bus = create_mesh_event_bus(local_peer_id="test-peer")
        assert isinstance(bus, MeshEventBus)
        assert bus.local_peer_id == "test-peer"
        assert bus.history_size == 100


class TestCreateMeshEventConnector:
    """Tests for create_mesh_event_connector function."""

    def test_create_connector(self):
        bus = MeshEventBus(local_peer_id="test-local")
        visualizer = ClusterVisualizer()
        connector = create_mesh_event_connector(
            event_bus=bus,
            visualizer=visualizer,
        )
        assert connector.event_bus == bus
        assert connector.visualizer == visualizer
        assert connector.load_balancer is None

    def test_create_connector_with_load_balancer(self):
        bus = MeshEventBus(local_peer_id="test-local")
        visualizer = ClusterVisualizer()
        from systems.network_boot.load_balancing import LoadBalancer
        load_balancer = LoadBalancer(local_peer_id="test-local")
        connector = create_mesh_event_connector(
            event_bus=bus,
            visualizer=visualizer,
            load_balancer=load_balancer,
        )
        assert connector.load_balancer == load_balancer


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
