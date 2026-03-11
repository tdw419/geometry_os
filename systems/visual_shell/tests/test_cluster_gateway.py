"""
Tests for Cluster Gateway (Phase 44)

Tests inter-cluster communication, discovery, and authentication.
"""


import pytest

from systems.visual_shell.cluster_gateway import (
    ClusterDiscovery,
    ClusterGateway,
    ClusterIdentity,
    ClusterStatus,
    GatewayConfig,
    InterClusterBus,
    InterClusterMessage,
    MessageType,
    RemoteCluster,
    create_cluster_gateway,
)


class TestClusterStatus:
    """Tests for ClusterStatus enum."""

    def test_cluster_statuses(self):
        assert ClusterStatus.UNKNOWN.value == "unknown"
        assert ClusterStatus.CONNECTING.value == "connecting"
        assert ClusterStatus.ONLINE.value == "online"
        assert ClusterStatus.DEGRADED.value == "degraded"
        assert ClusterStatus.OFFLINE.value == "offline"


class TestMessageType:
    """Tests for MessageType enum."""

    def test_message_types(self):
        assert MessageType.PING.value == "ping"
        assert MessageType.PONG.value == "pong"
        assert MessageType.STATE_SYNC.value == "state_sync"
        assert MessageType.MIGRATION_REQUEST.value == "migration_request"
        assert MessageType.QUERY.value == "query"


class TestClusterIdentity:
    """Tests for ClusterIdentity."""

    def test_identity_creation(self):
        identity = ClusterIdentity(
            cluster_id="cluster-1",
            cluster_name="test-cluster",
            region="us-west",
            public_key="abc123",
            api_endpoint="https://cluster.example.com",
        )
        assert identity.cluster_id == "cluster-1"
        assert identity.cluster_name == "test-cluster"
        assert identity.region == "us-west"

    def test_generate(self):
        identity = ClusterIdentity.generate("test", "us-east", "https://test.com")
        assert identity.cluster_name == "test"
        assert identity.region == "us-east"
        assert len(identity.public_key) == 64

    def test_to_dict(self):
        identity = ClusterIdentity(
            cluster_id="cluster-1",
            cluster_name="test",
            region="us-west",
            public_key="abc",
            api_endpoint="https://test.com",
        )
        d = identity.to_dict()
        assert d["cluster_id"] == "cluster-1"
        assert d["cluster_name"] == "test"


class TestRemoteCluster:
    """Tests for RemoteCluster."""

    def test_remote_cluster_creation(self):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        cluster = RemoteCluster(identity=identity)
        assert cluster.status == ClusterStatus.UNKNOWN
        assert cluster.latency_ms == 0.0


class TestInterClusterMessage:
    """Tests for InterClusterMessage."""

    def test_message_creation(self):
        msg = InterClusterMessage(
            message_id="msg-1",
            message_type=MessageType.PING,
            source_cluster="cluster-1",
            target_cluster="cluster-2",
            payload={"test": "data"},
        )
        assert msg.message_id == "msg-1"
        assert msg.ttl == 64
        assert msg.hops == 0


class TestGatewayConfig:
    """Tests for GatewayConfig."""

    def test_defaults(self):
        config = GatewayConfig()
        assert config.discovery_interval == 30.0
        assert config.ping_interval == 10.0


class TestClusterDiscovery:
    """Tests for ClusterDiscovery."""

    @pytest.fixture
    def discovery(self):
        identity = ClusterIdentity.generate("local", "us-west", "https://local.com")
        return ClusterDiscovery(identity)

    def test_discovery_creation(self, discovery):
        assert discovery.get_local_identity() is not None

    def test_add_discovery_endpoint(self, discovery):
        discovery.add_discovery_endpoint("https://discovery.example.com")
        assert "https://discovery.example.com" in discovery._discovery_endpoints

    def test_remove_discovery_endpoint(self, discovery):
        discovery.add_discovery_endpoint("https://discovery.example.com")
        discovery.remove_discovery_endpoint("https://discovery.example.com")
        assert "https://discovery.example.com" not in discovery._discovery_endpoints

    def test_register_cluster(self, discovery):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        cluster = discovery.register_cluster(identity)
        assert cluster.status == ClusterStatus.UNKNOWN

    def test_unregister_cluster(self, discovery):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        discovery.register_cluster(identity)
        discovery.unregister_cluster(identity.cluster_id)
        assert discovery.get_cluster(identity.cluster_id) is None

    def test_generate_auth_token(self, discovery):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        discovery.register_cluster(identity)
        token = discovery.generate_auth_token(identity.cluster_id)
        assert len(token) == 64

    def test_verify_auth_token(self, discovery):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        discovery.register_cluster(identity)
        token = discovery.generate_auth_token(identity.cluster_id)
        assert discovery.verify_auth_token(identity.cluster_id, token) is True
        assert discovery.verify_auth_token(identity.cluster_id, "wrong") is False

    def test_get_cluster(self, discovery):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        discovery.register_cluster(identity)
        cluster = discovery.get_cluster(identity.cluster_id)
        assert cluster is not None

    def test_get_clusters_by_region(self, discovery):
        identity1 = ClusterIdentity.generate("remote1", "eu-west", "https://r1.com")
        identity2 = ClusterIdentity.generate("remote2", "eu-west", "https://r2.com")
        identity3 = ClusterIdentity.generate("remote3", "us-east", "https://r3.com")

        discovery.register_cluster(identity1)
        discovery.register_cluster(identity2)
        discovery.register_cluster(identity3)

        eu_clusters = discovery.get_clusters_by_region("eu-west")
        assert len(eu_clusters) == 2

    def test_get_all_clusters(self, discovery):
        identity1 = ClusterIdentity.generate("remote1", "eu-west", "https://r1.com")
        identity2 = ClusterIdentity.generate("remote2", "us-east", "https://r2.com")

        discovery.register_cluster(identity1)
        discovery.register_cluster(identity2)

        clusters = discovery.get_all_clusters()
        assert len(clusters) == 2

    def test_update_cluster_status(self, discovery):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        discovery.register_cluster(identity)
        discovery.update_cluster_status(identity.cluster_id, ClusterStatus.ONLINE, 50.0)

        cluster = discovery.get_cluster(identity.cluster_id)
        assert cluster.status == ClusterStatus.ONLINE
        assert cluster.latency_ms == 50.0


class TestInterClusterBus:
    """Tests for InterClusterBus."""

    @pytest.fixture
    def bus(self):
        return InterClusterBus()

    def test_bus_creation(self, bus):
        assert len(bus._handlers) == 0

    def test_subscribe(self, bus):
        def handler(msg):
            pass

        bus.subscribe(MessageType.PING, handler)
        assert MessageType.PING in bus._handlers
        assert handler in bus._handlers[MessageType.PING]

    def test_unsubscribe(self, bus):
        def handler(msg):
            pass

        bus.subscribe(MessageType.PING, handler)
        bus.unsubscribe(MessageType.PING, handler)
        assert handler not in bus._handlers.get(MessageType.PING, [])

    @pytest.mark.asyncio
    async def test_publish(self, bus):
        received = []

        def handler(msg):
            received.append(msg)

        bus.subscribe(MessageType.PING, handler)

        msg = InterClusterMessage(
            message_id="msg-1",
            message_type=MessageType.PING,
            source_cluster="c1",
            target_cluster="c2",
            payload={},
        )

        await bus.publish(msg)
        assert len(received) == 1

    def test_create_message(self, bus):
        msg = bus.create_message(
            message_type=MessageType.QUERY,
            source_cluster="c1",
            target_cluster="c2",
            payload={"key": "value"},
        )
        assert msg.message_type == MessageType.QUERY
        assert msg.source_cluster == "c1"

    def test_get_history(self, bus):
        # Add messages to history
        for i in range(5):
            msg = InterClusterMessage(
                message_id=f"msg-{i}",
                message_type=MessageType.PING,
                source_cluster="c1",
                target_cluster="c2",
                payload={},
            )
            bus._message_history.append(msg)

        history = bus.get_history(limit=3)
        assert len(history) == 3


class TestClusterGateway:
    """Tests for ClusterGateway."""

    @pytest.fixture
    def gateway(self):
        identity = ClusterIdentity.generate("local", "us-west", "https://local.com")
        config = GatewayConfig(ping_interval=1.0)
        return ClusterGateway(identity, config)

    def test_gateway_creation(self, gateway):
        assert gateway.get_local_identity() is not None

    def test_add_cluster(self, gateway):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        cluster = gateway.add_cluster(identity)
        assert cluster.status == ClusterStatus.UNKNOWN

    def test_remove_cluster(self, gateway):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        gateway.add_cluster(identity)
        gateway.remove_cluster(identity.cluster_id)
        assert gateway.get_cluster(identity.cluster_id) is None

    def test_get_cluster(self, gateway):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        gateway.add_cluster(identity)
        cluster = gateway.get_cluster(identity.cluster_id)
        assert cluster is not None

    def test_get_all_clusters(self, gateway):
        identity1 = ClusterIdentity.generate("remote1", "eu-west", "https://r1.com")
        identity2 = ClusterIdentity.generate("remote2", "us-east", "https://r2.com")

        gateway.add_cluster(identity1)
        gateway.add_cluster(identity2)

        clusters = gateway.get_all_clusters()
        assert len(clusters) == 2

    def test_get_online_clusters(self, gateway):
        identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        gateway.add_cluster(identity)
        gateway._discovery.update_cluster_status(identity.cluster_id, ClusterStatus.ONLINE)

        online = gateway.get_online_clusters()
        assert len(online) == 1

    @pytest.mark.asyncio
    async def test_start_stop(self, gateway):
        await gateway.start()
        assert gateway._running is True

        await gateway.stop()
        assert gateway._running is False

    def test_subscribe(self, gateway):
        def handler(msg):
            pass

        gateway.subscribe(MessageType.STATE_SYNC, handler)
        assert MessageType.STATE_SYNC in gateway._bus._handlers

    def test_unsubscribe(self, gateway):
        def handler(msg):
            pass

        gateway.subscribe(MessageType.STATE_SYNC, handler)
        gateway.unsubscribe(MessageType.STATE_SYNC, handler)
        assert handler not in gateway._bus._handlers.get(MessageType.STATE_SYNC, [])

    def test_get_discovery(self, gateway):
        discovery = gateway.get_discovery()
        assert isinstance(discovery, ClusterDiscovery)

    def test_get_bus(self, gateway):
        bus = gateway.get_bus()
        assert isinstance(bus, InterClusterBus)

    def test_get_stats(self, gateway):
        stats = gateway.get_stats()
        assert "local_cluster" in stats
        assert "total_clusters" in stats


class TestCreateClusterGateway:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        gateway = create_cluster_gateway("test", "us-west", "https://test.com")
        assert isinstance(gateway, ClusterGateway)
        assert gateway.get_local_identity().cluster_name == "test"

    def test_create_with_config(self):
        config = GatewayConfig(ping_interval=5.0)
        gateway = create_cluster_gateway("test", "us-west", "https://test.com", config)
        assert gateway._config.ping_interval == 5.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
