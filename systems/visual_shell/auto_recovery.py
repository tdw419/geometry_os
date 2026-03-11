"""
Auto Recovery - Phase 42

Automatic container restart, peer reconnection, and state rebuild for self-healing mesh.
"""

import asyncio
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

from systems.visual_shell.health_monitor import (
    AlertSeverity,
    ComponentType,
    HealthAlert,
)


class RecoveryStatus(Enum):
    """Status of recovery operations."""
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    SUCCESS = "success"
    FAILED = "failed"
    ABANDONED = "abandoned"


class RecoveryType(Enum):
    """Types of recovery operations."""
    CONTAINER_RESTART = "container_restart"
    PEER_RECONNECT = "peer_reconnect"
    STATE_REBUILD = "state_rebuild"
    MIGRATION = "migration"
    FAILOVER = "failover"


@dataclass
class RecoveryAction:
    """A single recovery action."""
    action_id: str
    recovery_type: RecoveryType
    component_type: ComponentType
    component_id: str
    status: RecoveryStatus = RecoveryStatus.PENDING
    attempts: int = 0
    max_attempts: int = 3
    last_attempt: float | None = None
    last_error: str | None = None
    created_at: float = field(default_factory=time.time)
    completed_at: float | None = None
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class BackoffConfig:
    """Exponential backoff configuration."""
    initial_delay: float = 1.0
    max_delay: float = 60.0
    multiplier: float = 2.0
    jitter: float = 0.1


@dataclass
class RecoveryMetrics:
    """Aggregate recovery metrics."""
    total_recoveries: int = 0
    successful_recoveries: int = 0
    failed_recoveries: int = 0
    abandoned_recoveries: int = 0
    avg_recovery_time: float = 0.0
    recovery_success_rate: float = 0.0


class BackoffStrategy:
    """Exponential backoff with jitter for recovery attempts."""

    def __init__(self, config: BackoffConfig | None = None):
        self.config = config or BackoffConfig()
        self._attempts: dict[str, int] = {}

    def get_delay(self, action_id: str) -> float:
        """Get delay for next attempt with exponential backoff."""
        attempts = self._attempts.get(action_id, 0)
        delay = self.config.initial_delay * (self.config.multiplier ** attempts)
        delay = min(delay, self.config.max_delay)

        # Add jitter
        import random
        jitter = delay * self.config.jitter * random.random()
        return delay + jitter

    def record_attempt(self, action_id: str) -> None:
        """Record an attempt for backoff tracking."""
        self._attempts[action_id] = self._attempts.get(action_id, 0) + 1

    def reset(self, action_id: str) -> None:
        """Reset backoff for an action."""
        self._attempts.pop(action_id, None)


class ContainerRestarter:
    """Handles container restart operations with backoff."""

    def __init__(self, backoff: BackoffStrategy | None = None):
        self._backoff = backoff or BackoffStrategy()
        self._restarts: dict[str, RecoveryAction] = {}

    async def restart(
        self,
        container_id: str,
        metadata: dict[str, Any] | None = None,
    ) -> RecoveryAction:
        """Attempt to restart a container."""
        action_id = f"restart-{container_id}-{uuid.uuid4().hex[:8]}"

        action = RecoveryAction(
            action_id=action_id,
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id=container_id,
            metadata=metadata or {},
        )

        self._restarts[action_id] = action
        return action

    def should_retry(self, action: RecoveryAction) -> bool:
        """Check if restart should be retried."""
        return action.attempts < action.max_attempts

    def get_delay(self, action: RecoveryAction) -> float:
        """Get backoff delay for next attempt."""
        return self._backoff.get_delay(action.action_id)

    def record_result(self, action_id: str, success: bool, error: str | None = None) -> None:
        """Record result of restart attempt."""
        if action_id in self._restarts:
            action = self._restarts[action_id]
            action.attempts += 1
            action.last_attempt = time.time()

            if success:
                action.status = RecoveryStatus.SUCCESS
                action.completed_at = time.time()
                self._backoff.reset(action_id)
            else:
                action.last_error = error
                if action.attempts >= action.max_attempts:
                    action.status = RecoveryStatus.ABANDONED
                    action.completed_at = time.time()
                else:
                    self._backoff.record_attempt(action_id)

    def get_restart(self, action_id: str) -> RecoveryAction | None:
        """Get restart action by ID."""
        return self._restarts.get(action_id)

    def get_active_restarts(self) -> list[RecoveryAction]:
        """Get all active restart operations."""
        return [
            a for a in self._restarts.values()
            if a.status in (RecoveryStatus.PENDING, RecoveryStatus.IN_PROGRESS)
        ]


class PeerReconnector:
    """Handles peer reconnection operations."""

    def __init__(self, backoff: BackoffStrategy | None = None):
        self._backoff = backoff or BackoffStrategy()
        self._reconnects: dict[str, RecoveryAction] = {}

    async def reconnect(
        self,
        peer_id: str,
        metadata: dict[str, Any] | None = None,
    ) -> RecoveryAction:
        """Attempt to reconnect to a peer."""
        action_id = f"reconnect-{peer_id}-{uuid.uuid4().hex[:8]}"

        action = RecoveryAction(
            action_id=action_id,
            recovery_type=RecoveryType.PEER_RECONNECT,
            component_type=ComponentType.PEER,
            component_id=peer_id,
            metadata=metadata or {},
        )

        self._reconnects[action_id] = action
        return action

    def should_retry(self, action: RecoveryAction) -> bool:
        """Check if reconnection should be retried."""
        return action.attempts < action.max_attempts

    def get_delay(self, action: RecoveryAction) -> float:
        """Get backoff delay for next attempt."""
        return self._backoff.get_delay(action.action_id)

    def record_result(self, action_id: str, success: bool, error: str | None = None) -> None:
        """Record result of reconnection attempt."""
        if action_id in self._reconnects:
            action = self._reconnects[action_id]
            action.attempts += 1
            action.last_attempt = time.time()

            if success:
                action.status = RecoveryStatus.SUCCESS
                action.completed_at = time.time()
                self._backoff.reset(action_id)
            else:
                action.last_error = error
                if action.attempts >= action.max_attempts:
                    action.status = RecoveryStatus.ABANDONED
                    action.completed_at = time.time()
                else:
                    self._backoff.record_attempt(action_id)

    def get_reconnect(self, action_id: str) -> RecoveryAction | None:
        """Get reconnection action by ID."""
        return self._reconnects.get(action_id)

    def get_active_reconnects(self) -> list[RecoveryAction]:
        """Get all active reconnection operations."""
        return [
            a for a in self._reconnects.values()
            if a.status in (RecoveryStatus.PENDING, RecoveryStatus.IN_PROGRESS)
        ]


class RecoveryEngine:
    """Orchestrates recovery operations based on health alerts."""

    def __init__(
        self,
        max_concurrent: int = 5,
        restart_backoff: BackoffStrategy | None = None,
        reconnect_backoff: BackoffStrategy | None = None,
    ):
        self.max_concurrent = max_concurrent
        self._running = False
        self._container_restarter = ContainerRestarter(restart_backoff)
        self._peer_reconnector = PeerReconnector(reconnect_backoff)
        self._pending_actions: list[RecoveryAction] = []
        self._completed_actions: list[RecoveryAction] = []
        self._metrics = RecoveryMetrics()
        self._alert_handler: Callable[[HealthAlert], None] | None = None
        self._recovery_handlers: dict[RecoveryType, Callable] = {}

    def register_handler(
        self,
        recovery_type: RecoveryType,
        handler: Callable[[RecoveryAction], bool],
    ) -> None:
        """Register a handler for a recovery type."""
        self._recovery_handlers[recovery_type] = handler

    def unregister_handler(self, recovery_type: RecoveryType) -> None:
        """Unregister a recovery handler."""
        self._recovery_handlers.pop(recovery_type, None)

    def set_alert_handler(self, handler: Callable[[HealthAlert], None]) -> None:
        """Set handler to receive recovery-related alerts."""
        self._alert_handler = handler

    async def handle_alert(self, alert: HealthAlert) -> RecoveryAction | None:
        """Handle a health alert and create recovery action if needed."""
        if alert.severity != AlertSeverity.CRITICAL:
            return None

        action = None

        if alert.component_type == ComponentType.CONTAINER:
            action = await self._container_restarter.restart(
                alert.component_id,
                metadata={"alert_id": alert.alert_id},
            )
        elif alert.component_type == ComponentType.PEER:
            action = await self._peer_reconnector.reconnect(
                alert.component_id,
                metadata={"alert_id": alert.alert_id},
            )

        if action:
            self._pending_actions.append(action)
            self._metrics.total_recoveries += 1

        return action

    async def start(self) -> None:
        """Start the recovery engine."""
        self._running = True
        asyncio.create_task(self._recovery_loop())

    async def stop(self) -> None:
        """Stop the recovery engine."""
        self._running = False

    async def _recovery_loop(self) -> None:
        """Main recovery processing loop."""
        while self._running:
            await self._process_pending()
            await asyncio.sleep(1.0)

    async def _process_pending(self) -> None:
        """Process pending recovery actions."""
        active = self._get_active_count()

        for action in self._pending_actions[:]:
            if active >= self.max_concurrent:
                break

            if action.status == RecoveryStatus.PENDING:
                action.status = RecoveryStatus.IN_PROGRESS
                asyncio.create_task(self._execute_recovery(action))
                active += 1

    def _get_active_count(self) -> int:
        """Get count of active recovery operations."""
        return len(self._container_restarter.get_active_restarts()) + \
               len(self._peer_reconnector.get_active_reconnects())

    async def _execute_recovery(self, action: RecoveryAction) -> None:
        """Execute a recovery action."""
        handler = self._recovery_handlers.get(action.recovery_type)

        if not handler:
            action.status = RecoveryStatus.FAILED
            action.last_error = f"No handler for {action.recovery_type.value}"
            action.completed_at = time.time()
            self._move_to_completed(action)
            return

        try:
            success = await self._call_handler(handler, action)

            if action.recovery_type == RecoveryType.CONTAINER_RESTART:
                self._container_restarter.record_result(
                    action.action_id,
                    success,
                    action.last_error,
                )
            elif action.recovery_type == RecoveryType.PEER_RECONNECT:
                self._peer_reconnector.record_result(
                    action.action_id,
                    success,
                    action.last_error,
                )

            if success:
                self._metrics.successful_recoveries += 1
            else:
                self._metrics.failed_recoveries += 1

            self._update_metrics()

        except Exception as e:
            action.status = RecoveryStatus.FAILED
            action.last_error = str(e)
            action.completed_at = time.time()
            self._metrics.failed_recoveries += 1
            self._move_to_completed(action)

    async def _call_handler(
        self,
        handler: Callable,
        action: RecoveryAction,
    ) -> bool:
        """Call handler, handling both sync and async."""
        result = handler(action)

        if asyncio.iscoroutine(result):
            return await result
        return bool(result)

    def _move_to_completed(self, action: RecoveryAction) -> None:
        """Move action to completed list."""
        if action in self._pending_actions:
            self._pending_actions.remove(action)
        self._completed_actions.append(action)

    def _update_metrics(self) -> None:
        """Update aggregate metrics."""
        if self._metrics.total_recoveries > 0:
            self._metrics.recovery_success_rate = (
                self._metrics.successful_recoveries / self._metrics.total_recoveries * 100
            )

        # Calculate average recovery time
        completed_times = [
            a.completed_at - a.created_at
            for a in self._completed_actions
            if a.completed_at and a.created_at
        ]
        if completed_times:
            self._metrics.avg_recovery_time = sum(completed_times) / len(completed_times)

    def get_metrics(self) -> RecoveryMetrics:
        """Get recovery metrics."""
        return self._metrics

    def get_pending(self) -> list[RecoveryAction]:
        """Get pending recovery actions."""
        return self._pending_actions.copy()

    def get_completed(self, limit: int = 100) -> list[RecoveryAction]:
        """Get completed recovery actions."""
        return self._completed_actions[-limit:]

    def get_container_restarter(self) -> ContainerRestarter:
        """Get container restarter instance."""
        return self._container_restarter

    def get_peer_reconnector(self) -> PeerReconnector:
        """Get peer reconnector instance."""
        return self._peer_reconnector

    def get_stats(self) -> dict[str, Any]:
        """Get engine statistics."""
        return {
            "running": self._running,
            "total_recoveries": self._metrics.total_recoveries,
            "successful": self._metrics.successful_recoveries,
            "failed": self._metrics.failed_recoveries,
            "success_rate": self._metrics.recovery_success_rate,
            "pending_count": len(self._pending_actions),
            "active_restarts": len(self._container_restarter.get_active_restarts()),
            "active_reconnects": len(self._peer_reconnector.get_active_reconnects()),
        }


def create_recovery_engine(
    max_concurrent: int = 5,
) -> RecoveryEngine:
    """Factory function to create a recovery engine."""
    return RecoveryEngine(max_concurrent=max_concurrent)
