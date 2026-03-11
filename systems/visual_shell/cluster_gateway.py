"""
Cluster Gateway - Phase 44

Inter-cluster communication, discovery, and authentication for multi-cluster federation.
"""

import asyncio
import secrets
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class ClusterStatus(Enum):
    """Status of a remote cluster."""
    UNKNOWN = "unknown"
    CONNECTING = "connecting"
    ONLINE = "online"
    DEGRADED = "degraded"
    OFFLINE = "offline"


class MessageType(Enum):
    """Types of inter-cluster messages."""
    PING = "ping"
    PONG = "pong"
    STATE_SYNC = "state_sync"
    MIGRATION_REQUEST = "migration_request"
    MIGRATION_RESPONSE = "migration_response"
    QUERY = "query"
    QUERY_RESPONSE = "query_response"
    BROADCAST = "broadcast"


@dataclass
class ClusterIdentity:
    """Identity and credentials for a cluster."""
    cluster_id: str
    cluster_name: str
    region: str
    public_key: str
    api_endpoint: str
    created_at: float = field(default_factory=time.time)
    metadata: dict[str, Any] = field(default_factory=dict)

    @classmethod
    def generate(cls, name: str, region: str, endpoint: str) -> "ClusterIdentity":
        """Generate a new cluster identity."""
        return cls(
            cluster_id=str(uuid.uuid4()),
            cluster_name=name,
            region=region,
            public_key=secrets.token_hex(32),
            api_endpoint=endpoint,
        )

    def to_dict(self) -> dict[str, Any]:
        """Convert to dictionary."""
        return {
            "cluster_id": self.cluster_id,
            "cluster_name": self.cluster_name,
            "region": self.region,
            "public_key": self.public_key,
            "api_endpoint": self.api_endpoint,
            "created_at": self.created_at,
            "metadata": self.metadata,
        }


@dataclass
class RemoteCluster:
    """Information about a remote cluster."""
    identity: ClusterIdentity
    status: ClusterStatus = ClusterStatus.UNKNOWN
    last_seen: float = 0.0
    latency_ms: float = 0.0
    connection_count: int = 0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class InterClusterMessage:
    """Message sent between clusters."""
    message_id: str
    message_type: MessageType
    source_cluster: str
    target_cluster: str
    payload: dict[str, Any]
    timestamp: float = field(default_factory=time.time)
    ttl: int = 64
    hops: int = 0


@dataclass
class GatewayConfig:
    """Configuration for cluster gateway."""
    discovery_interval: float = 30.0
    ping_interval: float = 10.0
    ping_timeout: float = 5.0
    max_hops: int = 10
    auth_timeout: float = 10.0


class ClusterDiscovery:
    """Discovers and authenticates peer clusters."""

    def __init__(self, local_identity: ClusterIdentity):
        self._local_identity = local_identity
        self._known_clusters: dict[str, RemoteCluster] = {}
        self._discovery_endpoints: set[str] = set()
        self._auth_tokens: dict[str, str] = {}

    def add_discovery_endpoint(self, endpoint: str) -> None:
        """Add an endpoint for cluster discovery."""
        self._discovery_endpoints.add(endpoint)

    def remove_discovery_endpoint(self, endpoint: str) -> None:
        """Remove a discovery endpoint."""
        self._discovery_endpoints.discard(endpoint)

    def register_cluster(self, identity: ClusterIdentity) -> RemoteCluster:
        """Register a remote cluster."""
        cluster = RemoteCluster(
            identity=identity,
            status=ClusterStatus.UNKNOWN,
            last_seen=time.time(),
        )
        self._known_clusters[identity.cluster_id] = cluster
        return cluster

    def unregister_cluster(self, cluster_id: str) -> None:
        """Unregister a remote cluster."""
        self._known_clusters.pop(cluster_id, None)
        self._auth_tokens.pop(cluster_id, None)

    def generate_auth_token(self, cluster_id: str) -> str:
        """Generate an authentication token for a cluster."""
        token = secrets.token_hex(32)
        self._auth_tokens[cluster_id] = token
        return token

    def verify_auth_token(self, cluster_id: str, token: str) -> bool:
        """Verify an authentication token."""
        expected = self._auth_tokens.get(cluster_id)
        return expected is not None and secrets.compare_digest(expected, token)

    def get_cluster(self, cluster_id: str) -> RemoteCluster | None:
        """Get a remote cluster by ID."""
        return self._known_clusters.get(cluster_id)

    def get_clusters_by_region(self, region: str) -> list[RemoteCluster]:
        """Get all clusters in a region."""
        return [
            c for c in self._known_clusters.values()
            if c.identity.region == region
        ]

    def get_all_clusters(self) -> list[RemoteCluster]:
        """Get all known clusters."""
        return list(self._known_clusters.values())

    def get_online_clusters(self) -> list[RemoteCluster]:
        """Get all online clusters."""
        return [
            c for c in self._known_clusters.values()
            if c.status == ClusterStatus.ONLINE
        ]

    def update_cluster_status(
        self,
        cluster_id: str,
        status: ClusterStatus,
        latency_ms: float | None = None,
    ) -> None:
        """Update cluster status."""
        cluster = self._known_clusters.get(cluster_id)
        if cluster:
            cluster.status = status
            cluster.last_seen = time.time()
            if latency_ms is not None:
                cluster.latency_ms = latency_ms

    def get_local_identity(self) -> ClusterIdentity:
        """Get local cluster identity."""
        return self._local_identity


class InterClusterBus:
    """Message bus for inter-cluster communication."""

    def __init__(self, config: GatewayConfig | None = None):
        self.config = config or GatewayConfig()
        self._handlers: dict[MessageType, list[Callable]] = {}
        self._pending_responses: dict[str, asyncio.Future] = {}
        self._message_history: list[InterClusterMessage] = []
        self._max_history = 1000

    def subscribe(
        self,
        message_type: MessageType,
        handler: Callable[[InterClusterMessage], None],
    ) -> None:
        """Subscribe to a message type."""
        if message_type not in self._handlers:
            self._handlers[message_type] = []
        self._handlers[message_type].append(handler)

    def unsubscribe(
        self,
        message_type: MessageType,
        handler: Callable,
    ) -> None:
        """Unsubscribe from a message type."""
        if message_type in self._handlers:
            if handler in self._handlers[message_type]:
                self._handlers[message_type].remove(handler)

    async def publish(self, message: InterClusterMessage) -> None:
        """Publish a message to subscribers."""
        self._message_history.append(message)
        if len(self._message_history) > self._max_history:
            self._message_history = self._message_history[-self._max_history:]

        handlers = self._handlers.get(message.message_type, [])
        for handler in handlers:
            try:
                result = handler(message)
                if asyncio.iscoroutine(result):
                    await result
            except Exception:
                pass

        # Check for pending response
        if message.message_type in (MessageType.PONG, MessageType.QUERY_RESPONSE):
            correlation_id = message.payload.get("correlation_id")
            if correlation_id and correlation_id in self._pending_responses:
                future = self._pending_responses.pop(correlation_id)
                if not future.done():
                    future.set_result(message)

    async def send_and_wait(
        self,
        message: InterClusterMessage,
        timeout: float = 10.0,
    ) -> InterClusterMessage | None:
        """Send message and wait for response."""
        correlation_id = str(uuid.uuid4())
        message.payload["correlation_id"] = correlation_id

        future: asyncio.Future = asyncio.get_event_loop().create_future()
        self._pending_responses[correlation_id] = future

        await self.publish(message)

        try:
            return await asyncio.wait_for(future, timeout=timeout)
        except TimeoutError:
            self._pending_responses.pop(correlation_id, None)
            return None

    def create_message(
        self,
        message_type: MessageType,
        source_cluster: str,
        target_cluster: str,
        payload: dict[str, Any],
    ) -> InterClusterMessage:
        """Create a new inter-cluster message."""
        return InterClusterMessage(
            message_id=str(uuid.uuid4()),
            message_type=message_type,
            source_cluster=source_cluster,
            target_cluster=target_cluster,
            payload=payload,
        )

    def get_history(self, limit: int = 100) -> list[InterClusterMessage]:
        """Get recent message history."""
        return self._message_history[-limit:]


class ClusterGateway:
    """Gateway for inter-cluster communication."""

    def __init__(
        self,
        local_identity: ClusterIdentity,
        config: GatewayConfig | None = None,
    ):
        self._local_identity = local_identity
        self._config = config or GatewayConfig()
        self._discovery = ClusterDiscovery(local_identity)
        self._bus = InterClusterBus(self._config)
        self._running = False
        self._connections: dict[str, Any] = {}

        # Set up ping handler
        self._bus.subscribe(MessageType.PING, self._handle_ping)

    async def start(self) -> None:
        """Start the cluster gateway."""
        self._running = True
        asyncio.create_task(self._ping_loop())

    async def stop(self) -> None:
        """Stop the cluster gateway."""
        self._running = False

    async def _ping_loop(self) -> None:
        """Periodically ping known clusters."""
        while self._running:
            clusters = self._discovery.get_all_clusters()
            for cluster in clusters:
                if cluster.status != ClusterStatus.OFFLINE:
                    await self._ping_cluster(cluster)
            await asyncio.sleep(self._config.ping_interval)

    async def _ping_cluster(self, cluster: RemoteCluster) -> None:
        """Ping a remote cluster."""
        start = time.time()

        message = self._bus.create_message(
            message_type=MessageType.PING,
            source_cluster=self._local_identity.cluster_id,
            target_cluster=cluster.identity.cluster_id,
            payload={"timestamp": start},
        )

        response = await self._bus.send_and_wait(
            message,
            timeout=self._config.ping_timeout,
        )

        latency = (time.time() - start) * 1000

        if response:
            self._discovery.update_cluster_status(
                cluster.identity.cluster_id,
                ClusterStatus.ONLINE,
                latency_ms=latency,
            )
        else:
            self._discovery.update_cluster_status(
                cluster.identity.cluster_id,
                ClusterStatus.OFFLINE,
            )

    def _handle_ping(self, message: InterClusterMessage) -> None:
        """Handle incoming ping."""
        pong = self._bus.create_message(
            message_type=MessageType.PONG,
            source_cluster=self._local_identity.cluster_id,
            target_cluster=message.source_cluster,
            payload={
                "correlation_id": message.payload.get("correlation_id"),
                "timestamp": time.time(),
            },
        )
        asyncio.create_task(self._bus.publish(pong))

    def add_cluster(self, identity: ClusterIdentity) -> RemoteCluster:
        """Add a remote cluster."""
        return self._discovery.register_cluster(identity)

    def remove_cluster(self, cluster_id: str) -> None:
        """Remove a remote cluster."""
        self._discovery.unregister_cluster(cluster_id)

    def get_cluster(self, cluster_id: str) -> RemoteCluster | None:
        """Get a remote cluster."""
        return self._discovery.get_cluster(cluster_id)

    def get_all_clusters(self) -> list[RemoteCluster]:
        """Get all known clusters."""
        return self._discovery.get_all_clusters()

    def get_online_clusters(self) -> list[RemoteCluster]:
        """Get online clusters."""
        return self._discovery.get_online_clusters()

    async def broadcast(
        self,
        payload: dict[str, Any],
        exclude: set[str] | None = None,
    ) -> None:
        """Broadcast to all online clusters."""
        exclude = exclude or set()
        exclude.add(self._local_identity.cluster_id)

        for cluster in self.get_online_clusters():
            if cluster.identity.cluster_id not in exclude:
                message = self._bus.create_message(
                    message_type=MessageType.BROADCAST,
                    source_cluster=self._local_identity.cluster_id,
                    target_cluster=cluster.identity.cluster_id,
                    payload=payload,
                )
                await self._bus.publish(message)

    async def query_cluster(
        self,
        cluster_id: str,
        query: dict[str, Any],
        timeout: float = 10.0,
    ) -> dict[str, Any] | None:
        """Query a specific cluster."""
        message = self._bus.create_message(
            message_type=MessageType.QUERY,
            source_cluster=self._local_identity.cluster_id,
            target_cluster=cluster_id,
            payload=query,
        )

        response = await self._bus.send_and_wait(message, timeout=timeout)
        if response:
            return response.payload
        return None

    def subscribe(
        self,
        message_type: MessageType,
        handler: Callable[[InterClusterMessage], None],
    ) -> None:
        """Subscribe to inter-cluster messages."""
        self._bus.subscribe(message_type, handler)

    def unsubscribe(
        self,
        message_type: MessageType,
        handler: Callable,
    ) -> None:
        """Unsubscribe from inter-cluster messages."""
        self._bus.unsubscribe(message_type, handler)

    def get_local_identity(self) -> ClusterIdentity:
        """Get local cluster identity."""
        return self._local_identity

    def get_discovery(self) -> ClusterDiscovery:
        """Get discovery service."""
        return self._discovery

    def get_bus(self) -> InterClusterBus:
        """Get message bus."""
        return self._bus

    def get_stats(self) -> dict[str, Any]:
        """Get gateway statistics."""
        clusters = self.get_all_clusters()
        return {
            "local_cluster": self._local_identity.cluster_name,
            "total_clusters": len(clusters),
            "online_clusters": len([c for c in clusters if c.status == ClusterStatus.ONLINE]),
            "offline_clusters": len([c for c in clusters if c.status == ClusterStatus.OFFLINE]),
            "message_history_size": len(self._bus._message_history),
        }


def create_cluster_gateway(
    name: str,
    region: str,
    endpoint: str,
    config: GatewayConfig | None = None,
) -> ClusterGateway:
    """Factory function to create a cluster gateway."""
    identity = ClusterIdentity.generate(name, region, endpoint)
    return ClusterGateway(identity, config)
