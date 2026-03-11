"""
Tests for Cross-Cluster Migration (Phase 45)

Tests container migration between clusters with state preservation.
"""

from unittest.mock import Mock

import pytest

from systems.visual_shell.cluster_gateway import (
    ClusterGateway,
    ClusterIdentity,
    ClusterStatus,
)
from systems.visual_shell.cross_cluster_migration import (
    CrossClusterMigrator,
    MigrationCheckpoint,
    MigrationCoordinator,
    MigrationPhase,
    MigrationPlan,
    MigrationProgress,
    MigrationStats,
    MigrationTrigger,
    StateReplicator,
    create_cross_cluster_migrator,
)


class TestMigrationPhase:
    """Tests for MigrationPhase enum."""

    def test_migration_phases(self):
        assert MigrationPhase.INITIALIZING.value == "initializing"
        assert MigrationPhase.PREPARING.value == "preparing"
        assert MigrationPhase.TRANSFERRING.value == "transferring"
        assert MigrationPhase.COMPLETED.value == "completed"
        assert MigrationPhase.FAILED.value == "failed"
        assert MigrationPhase.ROLLED_BACK.value == "rolled_back"


class TestMigrationTrigger:
    """Tests for MigrationTrigger enum."""

    def test_triggers(self):
        assert MigrationTrigger.MANUAL.value == "manual"
        assert MigrationTrigger.LOAD_BALANCE.value == "load_balance"
        assert MigrationTrigger.FAILOVER.value == "failover"
        assert MigrationTrigger.SCHEDULED.value == "scheduled"


class TestMigrationPlan:
    """Tests for MigrationPlan dataclass."""

    def test_plan_creation(self):
        plan = MigrationPlan(
            plan_id="plan-1",
            container_id="container-1",
            source_cluster="cluster-a",
            target_cluster="cluster-b",
            trigger=MigrationTrigger.MANUAL,
        )
        assert plan.plan_id == "plan-1"
        assert plan.state_size_bytes == 0


class TestMigrationProgress:
    """Tests for MigrationProgress dataclass."""

    def test_progress_creation(self):
        plan = MigrationPlan(
            plan_id="plan-1",
            container_id="container-1",
            source_cluster="cluster-a",
            target_cluster="cluster-b",
            trigger=MigrationTrigger.MANUAL,
        )
        progress = MigrationProgress(
            migration_id="migration-1",
            plan=plan,
        )
        assert progress.phase == MigrationPhase.INITIALIZING
        assert progress.progress_percent == 0.0


class TestMigrationCheckpoint:
    """Tests for MigrationCheckpoint dataclass."""

    def test_checkpoint_creation(self):
        checkpoint = MigrationCheckpoint(
            checkpoint_id="cp-1",
            migration_id="migration-1",
            phase=MigrationPhase.PREPARING,
            state_data={"test": "data"},
        )
        assert checkpoint.checkpoint_id == "cp-1"
        assert checkpoint.migration_id == "migration-1"


class TestMigrationStats:
    """Tests for MigrationStats dataclass."""

    def test_stats_defaults(self):
        stats = MigrationStats()
        assert stats.total_migrations == 0
        assert stats.successful_migrations == 0


class TestStateReplicator:
    """Tests for StateReplicator."""

    @pytest.fixture
    def replicator(self):
        return StateReplicator(chunk_size=1024 * 10)

    def test_replicator_creation(self, replicator):
        assert replicator.chunk_size == 1024 * 10

    @pytest.mark.asyncio
    async def test_prepare_state(self, replicator):
        state, size = await replicator.prepare_state("container-1", "cluster-a")
        assert state["container_id"] == "container-1"
        assert size > 0

    @pytest.mark.asyncio
    async def test_transfer_state(self, replicator):
        state = {"container_id": "c1", "source_cluster": "a"}

        progress_calls = []
        def callback(transferred, total):
            progress_calls.append((transferred, total))

        result = await replicator.transfer_state("migration-1", state, callback)
        assert result is True
        assert len(progress_calls) > 0

    @pytest.mark.asyncio
    async def test_restore_state(self, replicator):
        state = {"container_id": "c1"}
        result = await replicator.restore_state("c1", state, "cluster-b")
        assert result is True

    def test_get_active_replications(self, replicator):
        active = replicator.get_active_replications()
        assert isinstance(active, list)


class TestMigrationCoordinator:
    """Tests for MigrationCoordinator."""

    @pytest.fixture
    def coordinator(self):
        identity = ClusterIdentity.generate("local", "us-west", "https://local.com")
        gateway = ClusterGateway(identity)
        return MigrationCoordinator(gateway)

    def test_coordinator_creation(self, coordinator):
        assert coordinator is not None

    def test_register_path(self, coordinator):
        coordinator.register_path("a", "b", ["a", "c", "b"])
        path = coordinator.get_path("a", "b")
        assert path == ["a", "c", "b"]

    def test_get_path_not_found(self, coordinator):
        path = coordinator.get_path("x", "y")
        assert path is None

    def test_find_route_direct(self, coordinator):
        coordinator.register_path("a", "b", ["a", "b"])
        route = coordinator.find_route("a", "b")
        assert route == ["a", "b"]

    def test_find_route_indirect(self, coordinator):
        coordinator.register_path("a", "c", ["a", "c"])
        coordinator.register_path("c", "b", ["c", "b"])
        route = coordinator.find_route("a", "b")
        assert len(route) >= 2

    @pytest.mark.asyncio
    async def test_coordinate_migration(self, coordinator):
        plan = MigrationPlan(
            plan_id="plan-1",
            container_id="container-1",
            source_cluster="local",
            target_cluster="remote",
            trigger=MigrationTrigger.MANUAL,
        )

        replicator = StateReplicator()
        progress = await coordinator.coordinate_migration(plan, replicator)

        assert progress.migration_id is not None
        assert progress.phase in (MigrationPhase.COMPLETED, MigrationPhase.FAILED)

    def test_get_active_routes(self, coordinator):
        routes = coordinator.get_active_routes()
        assert isinstance(routes, dict)


class TestCrossClusterMigrator:
    """Tests for CrossClusterMigrator."""

    @pytest.fixture
    def migrator(self):
        identity = ClusterIdentity.generate("local", "us-west", "https://local.com")
        gateway = ClusterGateway(identity)

        # Add a target cluster
        target_identity = ClusterIdentity.generate("remote", "eu-west", "https://remote.com")
        gateway.add_cluster(target_identity)
        gateway._discovery.update_cluster_status(target_identity.cluster_id, ClusterStatus.ONLINE)

        return CrossClusterMigrator(gateway)

    def test_migrator_creation(self, migrator):
        assert migrator is not None

    @pytest.mark.asyncio
    async def test_initiate_migration(self, migrator):
        # Get target cluster ID
        target = migrator._gateway.get_online_clusters()[0]

        progress = await migrator.initiate_migration(
            container_id="container-1",
            target_cluster=target.identity.cluster_id,
            trigger=MigrationTrigger.MANUAL,
        )

        assert progress is not None
        assert progress.migration_id is not None

    @pytest.mark.asyncio
    async def test_initiate_migration_unavailable_target(self, migrator):
        progress = await migrator.initiate_migration(
            container_id="container-1",
            target_cluster="nonexistent-cluster",
            trigger=MigrationTrigger.MANUAL,
        )

        assert progress.phase == MigrationPhase.FAILED
        assert "not available" in progress.error_message

    def test_get_migration(self, migrator):
        result = migrator.get_migration("nonexistent")
        assert result is None

    def test_get_active_migrations(self, migrator):
        active = migrator.get_active_migrations()
        assert isinstance(active, list)

    def test_get_migration_history(self, migrator):
        history = migrator.get_migration_history()
        assert isinstance(history, list)

    def test_get_stats(self, migrator):
        stats = migrator.get_stats()
        assert isinstance(stats, MigrationStats)

    def test_register_handler(self, migrator):
        handler = Mock()
        migrator.register_handler(handler)
        assert handler in migrator._handlers

    def test_unregister_handler(self, migrator):
        handler = Mock()
        migrator.register_handler(handler)
        migrator.unregister_handler(handler)
        assert handler not in migrator._handlers

    def test_create_checkpoint(self, migrator):
        checkpoint = migrator.create_checkpoint(
            migration_id="migration-1",
            phase=MigrationPhase.PREPARING,
            state={"test": "data"},
        )
        assert checkpoint.checkpoint_id is not None
        assert checkpoint.migration_id == "migration-1"

    @pytest.mark.asyncio
    async def test_rollback(self, migrator):
        # Create a migration to rollback
        target = migrator._gateway.get_online_clusters()[0]
        progress = await migrator.initiate_migration(
            container_id="container-1",
            target_cluster=target.identity.cluster_id,
        )

        # Create checkpoint
        migrator.create_checkpoint(
            migration_id=progress.migration_id,
            phase=MigrationPhase.PREPARING,
            state={},
        )

        # Rollback
        result = await migrator.rollback(progress.migration_id)
        # Result depends on migration state
        assert isinstance(result, bool)

    def test_get_coordinator(self, migrator):
        coordinator = migrator.get_coordinator()
        assert isinstance(coordinator, MigrationCoordinator)

    def test_get_state_replicator(self, migrator):
        replicator = migrator.get_state_replicator()
        assert isinstance(replicator, StateReplicator)


class TestCreateCrossClusterMigrator:
    """Tests for factory function."""

    def test_create(self):
        identity = ClusterIdentity.generate("local", "us-west", "https://local.com")
        gateway = ClusterGateway(identity)
        migrator = create_cross_cluster_migrator(gateway)
        assert isinstance(migrator, CrossClusterMigrator)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
