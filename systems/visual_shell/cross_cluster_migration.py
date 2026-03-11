"""
Cross-Cluster Migration - Phase 45

Migrate containers between clusters with state preservation.
"""

import asyncio
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

from systems.visual_shell.cluster_gateway import (
    ClusterGateway,
    InterClusterMessage,
    MessageType,
)


class MigrationPhase(Enum):
    """Phases of cross-cluster migration."""
    INITIALIZING = "initializing"
    PREPARING = "preparing"
    TRANSFERRING = "transferring"
    RESTORING = "restoring"
    COMPLETED = "completed"
    FAILED = "failed"
    ROLLED_BACK = "rolled_back"


class MigrationTrigger(Enum):
    """What triggered the migration."""
    MANUAL = "manual"
    LOAD_BALANCE = "load_balance"
    FAILOVER = "failover"
    SCHEDULED = "scheduled"
    COST_OPTIMIZATION = "cost_optimization"


@dataclass
class MigrationPlan:
    """Plan for a cross-cluster migration."""
    plan_id: str
    container_id: str
    source_cluster: str
    target_cluster: str
    trigger: MigrationTrigger
    state_size_bytes: int = 0
    estimated_duration: float = 0.0
    created_at: float = field(default_factory=time.time)
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class MigrationProgress:
    """Progress of an ongoing migration."""
    migration_id: str
    plan: MigrationPlan
    phase: MigrationPhase = MigrationPhase.INITIALIZING
    progress_percent: float = 0.0
    bytes_transferred: int = 0
    started_at: float | None = None
    completed_at: float | None = None
    error_message: str | None = None
    rollback_available: bool = True
    checkpoints: list[dict[str, Any]] = field(default_factory=list)


@dataclass
class MigrationCheckpoint:
    """Checkpoint for rollback support."""
    checkpoint_id: str
    migration_id: str
    phase: MigrationPhase
    state_data: dict[str, Any]
    timestamp: float = field(default_factory=time.time)


@dataclass
class MigrationStats:
    """Statistics for migrations."""
    total_migrations: int = 0
    successful_migrations: int = 0
    failed_migrations: int = 0
    rolled_back_migrations: int = 0
    total_bytes_transferred: int = 0
    avg_duration: float = 0.0


class StateReplicator:
    """Replicates container state across clusters."""

    def __init__(self, chunk_size: int = 1024 * 1024):
        self.chunk_size = chunk_size
        self._active_replications: dict[str, MigrationProgress] = {}

    async def prepare_state(
        self,
        container_id: str,
        source_cluster: str,
    ) -> tuple[dict[str, Any], int]:
        """Prepare container state for transfer."""
        # Simulate state capture
        state = {
            "container_id": container_id,
            "source_cluster": source_cluster,
            "checkpoint_time": time.time(),
            "memory_pages": [],
            "disk_blocks": [],
        }
        state_size = 1024 * 1024 * 100  # Simulated 100MB
        return state, state_size

    async def transfer_state(
        self,
        migration_id: str,
        state: dict[str, Any],
        progress_callback: Callable[[int, int], None] | None = None,
    ) -> bool:
        """Transfer state to target cluster."""
        self._active_replications[migration_id] = MigrationProgress(
            migration_id=migration_id,
            plan=MigrationPlan(
                plan_id=migration_id,
                container_id=state.get("container_id", ""),
                source_cluster=state.get("source_cluster", ""),
                target_cluster="",
                trigger=MigrationTrigger.MANUAL,
            ),
        )

        total_size = 1024 * 1024 * 100  # 100MB simulated
        transferred = 0

        while transferred < total_size:
            chunk = min(self.chunk_size, total_size - transferred)
            transferred += chunk

            if progress_callback:
                progress_callback(transferred, total_size)

            await asyncio.sleep(0.01)  # Simulate transfer time

        return True

    async def restore_state(
        self,
        container_id: str,
        state: dict[str, Any],
        target_cluster: str,
    ) -> bool:
        """Restore container state on target cluster."""
        # Simulate state restoration
        await asyncio.sleep(0.1)
        return True

    def get_active_replications(self) -> list[str]:
        """Get IDs of active replications."""
        return list(self._active_replications.keys())


class MigrationCoordinator:
    """Coordinates multi-hop migrations."""

    def __init__(self, gateway: ClusterGateway):
        self._gateway = gateway
        self._migration_paths: dict[str, list[str]] = {}
        self._active_routes: dict[str, list[str]] = {}

    def register_path(self, source: str, target: str, path: list[str]) -> None:
        """Register a migration path between clusters."""
        key = f"{source}:{target}"
        self._migration_paths[key] = path

    def get_path(self, source: str, target: str) -> list[str] | None:
        """Get migration path between clusters."""
        key = f"{source}:{target}"
        return self._migration_paths.get(key)

    def find_route(self, source: str, target: str) -> list[str]:
        """Find optimal route for migration."""
        # Direct path
        direct = self.get_path(source, target)
        if direct:
            return direct

        # Try to find route through intermediate clusters
        online_clusters = self._gateway.get_online_clusters()

        for intermediate in online_clusters:
            if intermediate.identity.cluster_id == source:
                continue
            if intermediate.identity.cluster_id == target:
                continue

            path1 = self.get_path(source, intermediate.identity.cluster_id)
            path2 = self.get_path(intermediate.identity.cluster_id, target)

            if path1 and path2:
                return path1 + path2[1:]

        # No route found, return direct anyway
        return [source, target]

    async def coordinate_migration(
        self,
        plan: MigrationPlan,
        state_replicator: StateReplicator,
    ) -> MigrationProgress:
        """Coordinate a migration along its route."""
        migration_id = str(uuid.uuid4())
        route = self.find_route(plan.source_cluster, plan.target_cluster)

        progress = MigrationProgress(
            migration_id=migration_id,
            plan=plan,
            phase=MigrationPhase.PREPARING,
            started_at=time.time(),
        )

        self._active_routes[migration_id] = route

        # Execute migration along route
        current_cluster = plan.source_cluster
        state = None

        for next_cluster in route[1:]:
            # Prepare state on current cluster
            state, state_size = await state_replicator.prepare_state(
                plan.container_id,
                current_cluster,
            )
            plan.state_size_bytes = state_size

            # Transfer to next cluster
            progress.phase = MigrationPhase.TRANSFERRING

            def update_progress(transferred, total):
                progress.bytes_transferred = transferred
                progress.progress_percent = (transferred / total) * 100

            success = await state_replicator.transfer_state(
                migration_id,
                state,
                progress_callback=update_progress,
            )

            if not success:
                progress.phase = MigrationPhase.FAILED
                progress.error_message = f"Transfer failed to {next_cluster}"
                return progress

            # Restore on next cluster
            progress.phase = MigrationPhase.RESTORING
            success = await state_replicator.restore_state(
                plan.container_id,
                state,
                next_cluster,
            )

            if not success:
                progress.phase = MigrationPhase.FAILED
                progress.error_message = f"Restore failed on {next_cluster}"
                return progress

            current_cluster = next_cluster

        progress.phase = MigrationPhase.COMPLETED
        progress.completed_at = time.time()
        progress.progress_percent = 100.0

        return progress

    def get_active_routes(self) -> dict[str, list[str]]:
        """Get all active migration routes."""
        return self._active_routes.copy()


class CrossClusterMigrator:
    """Main interface for cross-cluster migrations."""

    def __init__(self, gateway: ClusterGateway):
        self._gateway = gateway
        self._state_replicator = StateReplicator()
        self._coordinator = MigrationCoordinator(gateway)
        self._migrations: dict[str, MigrationProgress] = {}
        self._checkpoints: dict[str, MigrationCheckpoint] = {}
        self._stats = MigrationStats()
        self._handlers: list[Callable[[MigrationProgress], None]] = []

        # Subscribe to migration messages
        gateway.subscribe(MessageType.MIGRATION_REQUEST, self._handle_request)
        gateway.subscribe(MessageType.MIGRATION_RESPONSE, self._handle_response)

    async def initiate_migration(
        self,
        container_id: str,
        target_cluster: str,
        trigger: MigrationTrigger = MigrationTrigger.MANUAL,
        metadata: dict[str, Any] | None = None,
    ) -> MigrationProgress:
        """Initiate a cross-cluster migration."""
        plan = MigrationPlan(
            plan_id=str(uuid.uuid4()),
            container_id=container_id,
            source_cluster=self._gateway.get_local_identity().cluster_id,
            target_cluster=target_cluster,
            trigger=trigger,
            metadata=metadata or {},
        )

        # Check target cluster is available
        target = self._gateway.get_cluster(target_cluster)
        if not target or target.status.value not in ("online", "degraded"):
            return MigrationProgress(
                migration_id=str(uuid.uuid4()),
                plan=plan,
                phase=MigrationPhase.FAILED,
                error_message=f"Target cluster {target_cluster} not available",
            )

        self._stats.total_migrations += 1

        # Coordinate the migration
        progress = await self._coordinator.coordinate_migration(
            plan,
            self._state_replicator,
        )

        self._migrations[progress.migration_id] = progress

        if progress.phase == MigrationPhase.COMPLETED:
            self._stats.successful_migrations += 1
            self._stats.total_bytes_transferred += plan.state_size_bytes
        else:
            self._stats.failed_migrations += 1

        self._update_avg_duration(progress)
        self._notify_handlers(progress)

        return progress

    def _update_avg_duration(self, progress: MigrationProgress) -> None:
        """Update average migration duration."""
        if progress.started_at and progress.completed_at:
            duration = progress.completed_at - progress.started_at
            total = self._stats.successful_migrations
            if total > 0:
                self._stats.avg_duration = (
                    (self._stats.avg_duration * (total - 1) + duration) / total
                )

    def _notify_handlers(self, progress: MigrationProgress) -> None:
        """Notify registered handlers of migration progress."""
        for handler in self._handlers:
            try:
                handler(progress)
            except Exception:
                pass

    def _handle_request(self, message: InterClusterMessage) -> None:
        """Handle incoming migration request."""
        # Create checkpoint for rollback
        migration_id = message.payload.get("migration_id")
        if migration_id:
            checkpoint = MigrationCheckpoint(
                checkpoint_id=str(uuid.uuid4()),
                migration_id=migration_id,
                phase=MigrationPhase.PREPARING,
                state_data=message.payload,
            )
            self._checkpoints[checkpoint.checkpoint_id] = checkpoint

    def _handle_response(self, message: InterClusterMessage) -> None:
        """Handle migration response."""
        pass  # Response handling

    async def rollback(self, migration_id: str) -> bool:
        """Rollback a migration using checkpoints."""
        progress = self._migrations.get(migration_id)
        if not progress or not progress.rollback_available:
            return False

        # Find checkpoint
        checkpoint = None
        for cp in self._checkpoints.values():
            if cp.migration_id == migration_id:
                checkpoint = cp
                break

        if not checkpoint:
            return False

        # Perform rollback
        progress.phase = MigrationPhase.ROLLED_BACK
        self._stats.rolled_back_migrations += 1
        self._stats.successful_migrations -= 1

        return True

    def create_checkpoint(
        self,
        migration_id: str,
        phase: MigrationPhase,
        state: dict[str, Any],
    ) -> MigrationCheckpoint:
        """Create a checkpoint for rollback support."""
        checkpoint = MigrationCheckpoint(
            checkpoint_id=str(uuid.uuid4()),
            migration_id=migration_id,
            phase=phase,
            state_data=state,
        )
        self._checkpoints[checkpoint.checkpoint_id] = checkpoint
        return checkpoint

    def get_migration(self, migration_id: str) -> MigrationProgress | None:
        """Get migration by ID."""
        return self._migrations.get(migration_id)

    def get_active_migrations(self) -> list[MigrationProgress]:
        """Get all active migrations."""
        return [
            m for m in self._migrations.values()
            if m.phase not in (MigrationPhase.COMPLETED, MigrationPhase.FAILED, MigrationPhase.ROLLED_BACK)
        ]

    def get_migration_history(self, limit: int = 100) -> list[MigrationProgress]:
        """Get migration history."""
        return list(self._migrations.values())[-limit:]

    def get_stats(self) -> MigrationStats:
        """Get migration statistics."""
        return self._stats

    def register_handler(
        self,
        handler: Callable[[MigrationProgress], None],
    ) -> None:
        """Register a migration progress handler."""
        self._handlers.append(handler)

    def unregister_handler(
        self,
        handler: Callable[[MigrationProgress], None],
    ) -> None:
        """Unregister a handler."""
        if handler in self._handlers:
            self._handlers.remove(handler)

    def get_coordinator(self) -> MigrationCoordinator:
        """Get migration coordinator."""
        return self._coordinator

    def get_state_replicator(self) -> StateReplicator:
        """Get state replicator."""
        return self._state_replicator


def create_cross_cluster_migrator(gateway: ClusterGateway) -> CrossClusterMigrator:
    """Factory function to create a cross-cluster migrator."""
    return CrossClusterMigrator(gateway)
