"""
Tests for Federated State (Phase 46)

Tests unified state view across clusters with conflict resolution.
"""

import time

import pytest

from systems.visual_shell.federated_state import (
    ConflictInfo,
    ConflictResolution,
    ConflictResolver,
    ConsistencyLevel,
    CRDTGCounter,
    CRDTLWWRegister,
    FederatedRecord,
    FederatedStateStore,
    GlobalQueryEngine,
    SyncStats,
    SyncStatus,
    VectorClock,
    create_federated_state_store,
)


class TestConsistencyLevel:
    """Tests for ConsistencyLevel enum."""

    def test_consistency_levels(self):
        assert ConsistencyLevel.EVENTUAL.value == "eventual"
        assert ConsistencyLevel.STRONG.value == "strong"
        assert ConsistencyLevel.LINEARIZABLE.value == "linearizable"


class TestConflictResolution:
    """Tests for ConflictResolution enum."""

    def test_resolution_strategies(self):
        assert ConflictResolution.LAST_WRITE_WINS.value == "last_write_wins"
        assert ConflictResolution.FIRST_WRITE_WINS.value == "first_write_wins"
        assert ConflictResolution.VECTOR_CLOCK.value == "vector_clock"


class TestSyncStatus:
    """Tests for SyncStatus enum."""

    def test_sync_statuses(self):
        assert SyncStatus.SYNCED.value == "synced"
        assert SyncStatus.SYNCING.value == "syncing"
        assert SyncStatus.DIVERGED.value == "diverged"
        assert SyncStatus.CONFLICT.value == "conflict"


class TestVectorClock:
    """Tests for VectorClock."""

    def test_increment(self):
        vc = VectorClock()
        vc = vc.increment("node-1")
        assert vc.clocks["node-1"] == 1

        vc = vc.increment("node-1")
        assert vc.clocks["node-1"] == 2

    def test_merge(self):
        vc1 = VectorClock(clocks={"node-1": 2, "node-2": 1})
        vc2 = VectorClock(clocks={"node-1": 1, "node-2": 3})

        merged = vc1.merge(vc2)
        assert merged.clocks["node-1"] == 2
        assert merged.clocks["node-2"] == 3

    def test_compare_equal(self):
        vc1 = VectorClock(clocks={"node-1": 1})
        vc2 = VectorClock(clocks={"node-1": 1})
        assert vc1.compare(vc2) == 0

    def test_compare_greater(self):
        vc1 = VectorClock(clocks={"node-1": 2})
        vc2 = VectorClock(clocks={"node-1": 1})
        assert vc1.compare(vc2) == 1

    def test_compare_less(self):
        vc1 = VectorClock(clocks={"node-1": 1})
        vc2 = VectorClock(clocks={"node-1": 2})
        assert vc1.compare(vc2) == -1

    def test_compare_concurrent(self):
        vc1 = VectorClock(clocks={"node-1": 2, "node-2": 1})
        vc2 = VectorClock(clocks={"node-1": 1, "node-2": 2})
        assert vc1.compare(vc2) == 0  # Concurrent

    def test_to_dict(self):
        vc = VectorClock(clocks={"node-1": 1, "node-2": 2})
        d = vc.to_dict()
        assert d == {"node-1": 1, "node-2": 2}


class TestFederatedRecord:
    """Tests for FederatedRecord."""

    def test_record_creation(self):
        record = FederatedRecord(
            key="test-key",
            value={"data": "test"},
            source_cluster="cluster-1",
        )
        assert record.key == "test-key"
        assert record.version == 1

    def test_record_expiration(self):
        record = FederatedRecord(
            key="test-key",
            value="test",
            ttl=0.1,  # 100ms
        )
        assert record.is_expired() is False

        time.sleep(0.15)
        assert record.is_expired() is True


class TestConflictInfo:
    """Tests for ConflictInfo."""

    def test_conflict_creation(self):
        conflict = ConflictInfo(
            key="test-key",
            local_value="local",
            remote_value="remote",
            local_version=1,
            remote_version=2,
            local_timestamp=time.time(),
            remote_timestamp=time.time(),
        )
        assert conflict.key == "test-key"


class TestSyncStats:
    """Tests for SyncStats."""

    def test_stats_defaults(self):
        stats = SyncStats()
        assert stats.total_records == 0
        assert stats.synced_records == 0


class TestConflictResolver:
    """Tests for ConflictResolver."""

    @pytest.fixture
    def resolver(self):
        return ConflictResolver()

    def test_resolver_creation(self, resolver):
        assert resolver.strategy == ConflictResolution.LAST_WRITE_WINS

    def test_resolve_lww_local_wins(self, resolver):
        now = time.time()
        local = FederatedRecord(
            key="test",
            value="local",
            version=2,
            timestamp=now + 1,
        )
        remote = FederatedRecord(
            key="test",
            value="remote",
            version=1,
            timestamp=now,
        )

        resolved = resolver.resolve(local, remote)
        assert resolved.value == "local"

    def test_resolve_lww_remote_wins(self, resolver):
        now = time.time()
        local = FederatedRecord(
            key="test",
            value="local",
            version=1,
            timestamp=now,
        )
        remote = FederatedRecord(
            key="test",
            value="remote",
            version=2,
            timestamp=now + 1,
        )

        resolved = resolver.resolve(local, remote)
        assert resolved.value == "remote"

    def test_resolve_fww(self):
        resolver = ConflictResolver(strategy=ConflictResolution.FIRST_WRITE_WINS)
        now = time.time()
        local = FederatedRecord(
            key="test",
            value="local",
            version=2,
            timestamp=now + 1,
        )
        remote = FederatedRecord(
            key="test",
            value="remote",
            version=1,
            timestamp=now,
        )

        resolved = resolver.resolve(local, remote)
        assert resolved.value == "remote"  # First write wins

    def test_get_conflicts(self, resolver):
        local = FederatedRecord(key="test", value="local", version=1, timestamp=time.time())
        remote = FederatedRecord(key="test", value="remote", version=1, timestamp=time.time())

        resolver.resolve(local, remote)
        conflicts = resolver.get_conflicts()
        assert len(conflicts) == 1

    def test_clear_conflicts(self, resolver):
        local = FederatedRecord(key="test", value="local", version=1, timestamp=time.time())
        remote = FederatedRecord(key="test", value="remote", version=1, timestamp=time.time())

        resolver.resolve(local, remote)
        resolver.clear_conflicts()
        assert len(resolver.get_conflicts()) == 0

    def test_custom_resolver(self):
        def custom(local, remote):
            return FederatedRecord(
                key=local.key,
                value="merged",
                version=max(local.version, remote.version) + 1,
            )

        resolver = ConflictResolver(strategy=ConflictResolution.CUSTOM)
        resolver.set_custom_resolver(custom)

        local = FederatedRecord(key="test", value="local", version=1, timestamp=time.time())
        remote = FederatedRecord(key="test", value="remote", version=1, timestamp=time.time())

        resolved = resolver.resolve(local, remote)
        assert resolved.value == "merged"


class TestCRDTGCounter:
    """Tests for CRDT G-Counter."""

    def test_increment(self):
        counter = CRDTGCounter()
        counter.increment("node-1")
        assert counter.value() == 1

        counter.increment("node-1", 5)
        assert counter.value() == 6

    def test_merge(self):
        counter1 = CRDTGCounter()
        counter1.increment("node-1", 5)

        counter2 = CRDTGCounter()
        counter2.increment("node-2", 3)

        merged = counter1.merge(counter2)
        assert merged.value() == 8

    def test_to_dict(self):
        counter = CRDTGCounter()
        counter.increment("node-1", 5)
        d = counter.to_dict()
        assert d == {"node-1": 5}


class TestCRDTLWWRegister:
    """Tests for CRDT LWW-Register."""

    def test_set_and_get(self):
        register = CRDTLWWRegister()
        register.set("value1", time.time())
        assert register.get() == "value1"

    def test_set_newer(self):
        register = CRDTLWWRegister()
        now = time.time()

        register.set("old", now)
        register.set("new", now + 1)
        assert register.get() == "new"

    def test_set_older_ignored(self):
        register = CRDTLWWRegister()
        now = time.time()

        register.set("new", now + 1)
        register.set("old", now)
        assert register.get() == "new"

    def test_merge(self):
        now = time.time()
        reg1 = CRDTLWWRegister("value1", now)
        reg2 = CRDTLWWRegister("value2", now + 1)

        merged = reg1.merge(reg2)
        assert merged.get() == "value2"


class TestFederatedStateStore:
    """Tests for FederatedStateStore."""

    @pytest.fixture
    def store(self):
        return FederatedStateStore("cluster-1")

    def test_store_creation(self, store):
        assert store._local_cluster == "cluster-1"

    def test_set_and_get(self, store):
        record = store.set("key-1", {"data": "value"})
        assert record.key == "key-1"

        retrieved = store.get("key-1")
        assert retrieved is not None
        assert retrieved.value == {"data": "value"}

    def test_delete(self, store):
        store.set("key-1", "value")
        result = store.delete("key-1")
        assert result is True
        assert store.get("key-1") is None

    def test_delete_nonexistent(self, store):
        result = store.delete("nonexistent")
        assert result is False

    def test_version_increment(self, store):
        store.set("key-1", "v1")
        store.set("key-1", "v2")
        store.set("key-1", "v3")

        record = store.get("key-1")
        assert record.version == 3

    def test_get_all(self, store):
        store.set("key-1", "value1")
        store.set("key-2", "value2")

        all_records = store.get_all()
        assert len(all_records) == 2

    def test_get_keys(self, store):
        store.set("key-1", "value1")
        store.set("key-2", "value2")

        keys = store.get_keys()
        assert keys == {"key-1", "key-2"}

    def test_get_by_prefix(self, store):
        store.set("prefix/key-1", "value1")
        store.set("prefix/key-2", "value2")
        store.set("other/key-3", "value3")

        prefixed = store.get_by_prefix("prefix/")
        assert len(prefixed) == 2

    def test_merge_remote(self, store):
        remote_records = [
            FederatedRecord(
                key="remote-1",
                value="from-remote",
                version=1,
                source_cluster="cluster-2",
            ),
        ]

        count = store.merge_remote(remote_records, "cluster-2")
        assert count == 1
        assert store.get("remote-1") is not None

    def test_subscribe(self, store):
        changes = []

        def callback(key, value):
            changes.append((key, value))

        store.subscribe(callback)
        store.set("key-1", "value1")

        assert len(changes) == 1
        assert changes[0] == ("key-1", "value1")

    def test_unsubscribe(self, store):
        changes = []

        def callback(key, value):
            changes.append((key, value))

        store.subscribe(callback)
        store.unsubscribe(callback)
        store.set("key-1", "value1")

        assert len(changes) == 0

    def test_get_stats(self, store):
        store.set("key-1", "value1")
        stats = store.get_stats()
        assert stats.total_records == 1

    @pytest.mark.asyncio
    async def test_start_stop(self, store):
        await store.start()
        assert store._running is True

        await store.stop()
        assert store._running is False


class TestGlobalQueryEngine:
    """Tests for GlobalQueryEngine."""

    @pytest.fixture
    def engine(self):
        store = FederatedStateStore("cluster-1")
        store.set("key-1", {"type": "a", "count": 1})
        store.set("key-2", {"type": "b", "count": 2})
        store.set("key-3", {"type": "a", "count": 3})
        return GlobalQueryEngine(store)

    def test_query_all(self, engine):
        results = engine.query()
        assert len(results) == 3

    def test_query_with_filter(self, engine):
        results = engine.query(lambda r: r.value.get("type") == "a")
        assert len(results) == 2

    def test_query_by_cluster(self, engine):
        results = engine.query_by_cluster("cluster-1")
        assert len(results) == 3

    def test_query_by_timestamp(self, engine):
        now = time.time()
        results = engine.query_by_timestamp(now - 10)
        assert len(results) == 3

    def test_query_count(self, engine):
        count = engine.query_count(lambda r: r.value.get("type") == "a")
        assert count == 2

    def test_query_aggregate_sum(self, engine):
        total = engine.query_aggregate("count", "sum")
        assert total == 6

    def test_query_aggregate_avg(self, engine):
        avg = engine.query_aggregate("count", "avg")
        assert avg == 2.0

    def test_query_aggregate_min_max(self, engine):
        min_val = engine.query_aggregate("count", "min")
        max_val = engine.query_aggregate("count", "max")
        assert min_val == 1
        assert max_val == 3


class TestCreateFederatedStateStore:
    """Tests for factory function."""

    def test_create(self):
        store = create_federated_state_store("cluster-1")
        assert isinstance(store, FederatedStateStore)

    def test_create_with_strategy(self):
        store = create_federated_state_store(
            "cluster-1",
            ConflictResolution.FIRST_WRITE_WINS,
        )
        assert store._resolver.strategy == ConflictResolution.FIRST_WRITE_WINS


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
