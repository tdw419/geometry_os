"""
Federated State - Phase 46

Unified state view across clusters with conflict resolution.
"""

import asyncio
import builtins
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any, Generic, TypeVar

T = TypeVar('T')


class ConsistencyLevel(Enum):
    """Consistency levels for federated operations."""
    EVENTUAL = "eventual"
    BOUNDED_STALENESS = "bounded_staleness"
    STRONG = "strong"
    LINEARIZABLE = "linearizable"


class ConflictResolution(Enum):
    """Conflict resolution strategies."""
    LAST_WRITE_WINS = "last_write_wins"
    FIRST_WRITE_WINS = "first_write_wins"
    VECTOR_CLOCK = "vector_clock"
    CRDT = "crdt"
    CUSTOM = "custom"


class SyncStatus(Enum):
    """Status of state synchronization."""
    SYNCED = "synced"
    SYNCING = "syncing"
    DIVERGED = "diverged"
    CONFLICT = "conflict"


@dataclass
class VectorClock:
    """Vector clock for ordering events."""
    clocks: dict[str, int] = field(default_factory=dict)

    def increment(self, node_id: str) -> "VectorClock":
        """Increment clock for a node."""
        new_clocks = self.clocks.copy()
        new_clocks[node_id] = new_clocks.get(node_id, 0) + 1
        return VectorClock(clocks=new_clocks)

    def merge(self, other: "VectorClock") -> "VectorClock":
        """Merge with another vector clock."""
        merged = self.clocks.copy()
        for node, clock in other.clocks.items():
            merged[node] = max(merged.get(node, 0), clock)
        return VectorClock(clocks=merged)

    def compare(self, other: "VectorClock") -> int:
        """Compare two vector clocks. Returns -1, 0, or 1."""
        all_nodes = set(self.clocks.keys()) | set(other.clocks.keys())

        self_greater = False
        other_greater = False

        for node in all_nodes:
            self_val = self.clocks.get(node, 0)
            other_val = other.clocks.get(node, 0)

            if self_val > other_val:
                self_greater = True
            elif other_val > self_val:
                other_greater = True

        if self_greater and not other_greater:
            return 1
        elif other_greater and not self_greater:
            return -1
        else:
            return 0  # Concurrent or equal

    def to_dict(self) -> dict[str, int]:
        """Convert to dictionary."""
        return self.clocks.copy()


@dataclass
class FederatedRecord(Generic[T]):
    """A record in the federated state store."""
    key: str
    value: T
    version: int = 1
    vector_clock: VectorClock = field(default_factory=VectorClock)
    source_cluster: str = ""
    timestamp: float = field(default_factory=time.time)
    ttl: float | None = None
    metadata: dict[str, Any] = field(default_factory=dict)

    def is_expired(self) -> bool:
        """Check if record has expired."""
        if self.ttl is None:
            return False
        return time.time() > self.timestamp + self.ttl


@dataclass
class ConflictInfo:
    """Information about a detected conflict."""
    key: str
    local_value: Any
    remote_value: Any
    local_version: int
    remote_version: int
    local_timestamp: float
    remote_timestamp: float
    detected_at: float = field(default_factory=time.time)


@dataclass
class SyncStats:
    """Statistics for state synchronization."""
    total_records: int = 0
    synced_records: int = 0
    conflicted_records: int = 0
    pending_syncs: int = 0
    last_sync: float = 0.0


class ConflictResolver:
    """Resolves conflicts in federated state."""

    def __init__(self, strategy: ConflictResolution = ConflictResolution.LAST_WRITE_WINS):
        self.strategy = strategy
        self._custom_resolver: Callable | None = None
        self._conflicts: list[ConflictInfo] = []

    def set_custom_resolver(self, resolver: Callable) -> None:
        """Set a custom conflict resolver."""
        self._custom_resolver = resolver

    def resolve(self, local: FederatedRecord, remote: FederatedRecord) -> FederatedRecord:
        """Resolve conflict between two records."""
        conflict = ConflictInfo(
            key=local.key,
            local_value=local.value,
            remote_value=remote.value,
            local_version=local.version,
            remote_version=remote.version,
            local_timestamp=local.timestamp,
            remote_timestamp=remote.timestamp,
        )
        self._conflicts.append(conflict)

        if self.strategy == ConflictResolution.LAST_WRITE_WINS:
            return self._resolve_lww(local, remote)
        elif self.strategy == ConflictResolution.FIRST_WRITE_WINS:
            return self._resolve_fww(local, remote)
        elif self.strategy == ConflictResolution.VECTOR_CLOCK:
            return self._resolve_vector_clock(local, remote)
        elif self.strategy == ConflictResolution.CUSTOM and self._custom_resolver:
            return self._custom_resolver(local, remote)
        else:
            return self._resolve_lww(local, remote)

    def _resolve_lww(self, local: FederatedRecord, remote: FederatedRecord) -> FederatedRecord:
        """Last write wins resolution."""
        if remote.timestamp > local.timestamp:
            return remote
        return local

    def _resolve_fww(self, local: FederatedRecord, remote: FederatedRecord) -> FederatedRecord:
        """First write wins resolution."""
        if remote.timestamp < local.timestamp:
            return remote
        return local

    def _resolve_vector_clock(self, local: FederatedRecord, remote: FederatedRecord) -> FederatedRecord:
        """Vector clock resolution."""
        comparison = local.vector_clock.compare(remote.vector_clock)

        if comparison > 0:
            return local
        elif comparison < 0:
            return remote
        else:
            # Concurrent - fall back to LWW
            return self._resolve_lww(local, remote)

    def get_conflicts(self, limit: int = 100) -> list[ConflictInfo]:
        """Get detected conflicts."""
        return self._conflicts[-limit:]

    def clear_conflicts(self) -> None:
        """Clear conflict history."""
        self._conflicts.clear()


class CRDTGCounter:
    """Grow-only counter CRDT."""

    def __init__(self):
        self._counts: dict[str, int] = {}

    def increment(self, node_id: str, delta: int = 1) -> None:
        """Increment counter for a node."""
        self._counts[node_id] = self._counts.get(node_id, 0) + delta

    def value(self) -> int:
        """Get total count."""
        return sum(self._counts.values())

    def merge(self, other: "CRDTGCounter") -> "CRDTGCounter":
        """Merge with another counter."""
        result = CRDTGCounter()
        for node, count in self._counts.items():
            result._counts[node] = count
        for node, count in other._counts.items():
            result._counts[node] = max(result._counts.get(node, 0), count)
        return result

    def to_dict(self) -> dict[str, int]:
        return self._counts.copy()


class CRDTLWWRegister(Generic[T]):
    """Last-writer-wins register CRDT."""

    def __init__(self, value: T | None = None, timestamp: float = 0.0):
        self._value = value
        self._timestamp = timestamp

    def set(self, value: T, timestamp: float) -> None:
        """Set value if timestamp is newer."""
        if timestamp >= self._timestamp:
            self._value = value
            self._timestamp = timestamp

    def get(self) -> T | None:
        """Get current value."""
        return self._value

    def merge(self, other: "CRDTLWWRegister") -> "CRDTLWWRegister":
        """Merge with another register."""
        if other._timestamp > self._timestamp:
            return CRDTLWWRegister(other._value, other._timestamp)
        return CRDTLWWRegister(self._value, self._timestamp)


class FederatedStateStore:
    """Aggregates state from all clusters."""

    def __init__(
        self,
        local_cluster: str,
        resolver: ConflictResolver | None = None,
        sync_interval: float = 10.0,
    ):
        self._local_cluster = local_cluster
        self._resolver = resolver or ConflictResolver()
        self._sync_interval = sync_interval
        self._store: dict[str, FederatedRecord] = {}
        self._cluster_states: dict[str, dict[str, FederatedRecord]] = {}
        self._sync_status: dict[str, SyncStatus] = {}
        self._stats = SyncStats()
        self._running = False
        self._subscribers: list[Callable[[str, Any], None]] = []

    async def start(self) -> None:
        """Start the state store."""
        self._running = True
        asyncio.create_task(self._sync_loop())

    async def stop(self) -> None:
        """Stop the state store."""
        self._running = False

    async def _sync_loop(self) -> None:
        """Periodic synchronization loop."""
        while self._running:
            await asyncio.sleep(self._sync_interval)

    def get(self, key: str) -> FederatedRecord | None:
        """Get a record by key."""
        return self._store.get(key)

    def set(
        self,
        key: str,
        value: Any,
        ttl: float | None = None,
        consistency: ConsistencyLevel = ConsistencyLevel.EVENTUAL,
    ) -> FederatedRecord:
        """Set a record."""
        existing = self._store.get(key)

        if existing:
            version = existing.version + 1
            vector_clock = existing.vector_clock.increment(self._local_cluster)
        else:
            version = 1
            vector_clock = VectorClock().increment(self._local_cluster)

        record = FederatedRecord(
            key=key,
            value=value,
            version=version,
            vector_clock=vector_clock,
            source_cluster=self._local_cluster,
            timestamp=time.time(),
            ttl=ttl,
        )

        self._store[key] = record
        self._notify_subscribers(key, value)

        return record

    def delete(self, key: str) -> bool:
        """Delete a record."""
        if key in self._store:
            del self._store[key]
            self._notify_subscribers(key, None)
            return True
        return False

    def merge_remote(self, records: list[FederatedRecord], source_cluster: str) -> int:
        """Merge records from a remote cluster."""
        merged_count = 0

        for remote in records:
            local = self._store.get(remote.key)

            if local is None:
                self._store[remote.key] = remote
                merged_count += 1
            elif local.vector_clock.compare(remote.vector_clock) != 0:
                # Conflict detected
                resolved = self._resolver.resolve(local, remote)
                self._store[remote.key] = resolved
                merged_count += 1
            # else: already in sync

        self._stats.synced_records = len(self._store)
        self._stats.last_sync = time.time()

        return merged_count

    def get_all(self) -> dict[str, FederatedRecord]:
        """Get all records."""
        return self._store.copy()

    def get_keys(self) -> builtins.set[str]:
        """Get all keys."""
        return set(self._store.keys())

    def get_by_prefix(self, prefix: str) -> dict[str, FederatedRecord]:
        """Get records by key prefix."""
        return {
            k: v for k, v in self._store.items()
            if k.startswith(prefix)
        }

    def get_cluster_state(self, cluster_id: str) -> dict[str, FederatedRecord]:
        """Get state for a specific cluster."""
        return self._cluster_states.get(cluster_id, {})

    def update_cluster_state(
        self,
        cluster_id: str,
        records: dict[str, FederatedRecord],
    ) -> None:
        """Update state from a cluster."""
        self._cluster_states[cluster_id] = records
        self._sync_status[cluster_id] = SyncStatus.SYNCED

    def get_sync_status(self, cluster_id: str) -> SyncStatus:
        """Get sync status for a cluster."""
        return self._sync_status.get(cluster_id, SyncStatus.SYNCING)

    def subscribe(self, callback: Callable[[str, Any], None]) -> None:
        """Subscribe to state changes."""
        self._subscribers.append(callback)

    def unsubscribe(self, callback: Callable[[str, Any], None]) -> None:
        """Unsubscribe from state changes."""
        if callback in self._subscribers:
            self._subscribers.remove(callback)

    def _notify_subscribers(self, key: str, value: Any) -> None:
        """Notify subscribers of state change."""
        for callback in self._subscribers:
            try:
                callback(key, value)
            except Exception:
                pass

    def get_stats(self) -> SyncStats:
        """Get sync statistics."""
        self._stats.total_records = len(self._store)
        self._stats.conflicted_records = len(self._resolver.get_conflicts())
        return self._stats


class GlobalQueryEngine:
    """Queries across all clusters."""

    def __init__(self, state_store: FederatedStateStore):
        self._store = state_store

    def query(
        self,
        filter_func: Callable[[FederatedRecord], bool] | None = None,
        consistency: ConsistencyLevel = ConsistencyLevel.EVENTUAL,
    ) -> list[FederatedRecord]:
        """Query records with optional filter."""
        records = list(self._store.get_all().values())

        if filter_func:
            records = [r for r in records if filter_func(r)]

        return records

    def query_by_cluster(self, cluster_id: str) -> list[FederatedRecord]:
        """Query records from a specific cluster."""
        return [
            r for r in self._store.get_all().values()
            if r.source_cluster == cluster_id
        ]

    def query_by_timestamp(
        self,
        since: float,
        until: float | None = None,
    ) -> list[FederatedRecord]:
        """Query records within time range."""
        records = []
        for r in self._store.get_all().values():
            if r.timestamp >= since:
                if until is None or r.timestamp <= until:
                    records.append(r)
        return records

    def query_count(self, filter_func: Callable | None = None) -> int:
        """Count records matching filter."""
        return len(self.query(filter_func))

    def query_aggregate(
        self,
        field: str,
        operation: str = "sum",
        filter_func: Callable | None = None,
    ) -> Any:
        """Aggregate a field across records."""
        records = self.query(filter_func)

        if not records:
            return None

        values = []
        for r in records:
            if isinstance(r.value, dict) and field in r.value:
                values.append(r.value[field])

        if not values:
            return None

        if operation == "sum":
            return sum(values)
        elif operation == "avg":
            return sum(values) / len(values)
        elif operation == "min":
            return min(values)
        elif operation == "max":
            return max(values)
        elif operation == "count":
            return len(values)

        return None


def create_federated_state_store(
    local_cluster: str,
    strategy: ConflictResolution = ConflictResolution.LAST_WRITE_WINS,
) -> FederatedStateStore:
    """Factory function to create a federated state store."""
    resolver = ConflictResolver(strategy)
    return FederatedStateStore(local_cluster, resolver)
