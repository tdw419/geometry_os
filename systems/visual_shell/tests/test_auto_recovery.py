"""
Tests for Auto Recovery (Phase 42)

Tests automatic container restart, peer reconnection, and state rebuild.
"""


import pytest

from systems.visual_shell.auto_recovery import (
    BackoffConfig,
    BackoffStrategy,
    ContainerRestarter,
    PeerReconnector,
    RecoveryAction,
    RecoveryEngine,
    RecoveryMetrics,
    RecoveryStatus,
    RecoveryType,
    create_recovery_engine,
)
from systems.visual_shell.health_monitor import (
    AlertSeverity,
    ComponentType,
    HealthAlert,
)


class TestRecoveryStatus:
    """Tests for RecoveryStatus enum."""

    def test_recovery_statuses(self):
        assert RecoveryStatus.PENDING.value == "pending"
        assert RecoveryStatus.IN_PROGRESS.value == "in_progress"
        assert RecoveryStatus.SUCCESS.value == "success"
        assert RecoveryStatus.FAILED.value == "failed"
        assert RecoveryStatus.ABANDONED.value == "abandoned"


class TestRecoveryType:
    """Tests for RecoveryType enum."""

    def test_recovery_types(self):
        assert RecoveryType.CONTAINER_RESTART.value == "container_restart"
        assert RecoveryType.PEER_RECONNECT.value == "peer_reconnect"
        assert RecoveryType.STATE_REBUILD.value == "state_rebuild"
        assert RecoveryType.MIGRATION.value == "migration"
        assert RecoveryType.FAILOVER.value == "failover"


class TestRecoveryAction:
    """Tests for RecoveryAction dataclass."""

    def test_action_creation(self):
        action = RecoveryAction(
            action_id="action-1",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="container-1",
        )
        assert action.action_id == "action-1"
        assert action.status == RecoveryStatus.PENDING
        assert action.attempts == 0

    def test_action_with_metadata(self):
        action = RecoveryAction(
            action_id="action-1",
            recovery_type=RecoveryType.PEER_RECONNECT,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            metadata={"reason": "connection_lost"},
        )
        assert action.metadata["reason"] == "connection_lost"


class TestBackoffConfig:
    """Tests for BackoffConfig dataclass."""

    def test_defaults(self):
        config = BackoffConfig()
        assert config.initial_delay == 1.0
        assert config.max_delay == 60.0
        assert config.multiplier == 2.0

    def test_custom(self):
        config = BackoffConfig(initial_delay=5.0, max_delay=120.0)
        assert config.initial_delay == 5.0
        assert config.max_delay == 120.0


class TestRecoveryMetrics:
    """Tests for RecoveryMetrics dataclass."""

    def test_defaults(self):
        metrics = RecoveryMetrics()
        assert metrics.total_recoveries == 0
        assert metrics.successful_recoveries == 0
        assert metrics.recovery_success_rate == 0.0


class TestBackoffStrategy:
    """Tests for BackoffStrategy."""

    @pytest.fixture
    def backoff(self):
        return BackoffStrategy(BackoffConfig(
            initial_delay=1.0,
            max_delay=10.0,
            multiplier=2.0,
            jitter=0.0,
        ))

    def test_initial_delay(self, backoff):
        delay = backoff.get_delay("action-1")
        assert delay == 1.0

    def test_exponential_backoff(self, backoff):
        backoff.record_attempt("action-1")
        delay = backoff.get_delay("action-1")
        assert delay == 2.0

        backoff.record_attempt("action-1")
        delay = backoff.get_delay("action-1")
        assert delay == 4.0

    def test_max_delay(self, backoff):
        for _ in range(10):
            backoff.record_attempt("action-1")
        delay = backoff.get_delay("action-1")
        assert delay <= 10.0

    def test_reset(self, backoff):
        backoff.record_attempt("action-1")
        backoff.reset("action-1")
        delay = backoff.get_delay("action-1")
        assert delay == 1.0


class TestContainerRestarter:
    """Tests for ContainerRestarter."""

    @pytest.fixture
    def restarter(self):
        return ContainerRestarter()

    @pytest.mark.asyncio
    async def test_restart_creation(self, restarter):
        action = await restarter.restart("container-1")
        assert action.component_id == "container-1"
        assert action.recovery_type == RecoveryType.CONTAINER_RESTART

    def test_should_retry(self, restarter):
        action = RecoveryAction(
            action_id="test",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c1",
            attempts=0,
            max_attempts=3,
        )
        assert restarter.should_retry(action) is True

        action.attempts = 3
        assert restarter.should_retry(action) is False

    def test_record_result_success(self, restarter):
        action = RecoveryAction(
            action_id="test",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c1",
        )
        restarter._restarts["test"] = action

        restarter.record_result("test", success=True)

        assert action.status == RecoveryStatus.SUCCESS
        assert action.completed_at is not None

    def test_record_result_failure(self, restarter):
        action = RecoveryAction(
            action_id="test",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c1",
            max_attempts=3,
        )
        restarter._restarts["test"] = action

        restarter.record_result("test", success=False, error="Failed")

        assert action.status == RecoveryStatus.PENDING
        assert action.last_error == "Failed"
        assert action.attempts == 1

    def test_record_result_abandoned(self, restarter):
        action = RecoveryAction(
            action_id="test",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c1",
            max_attempts=2,
            attempts=1,
        )
        restarter._restarts["test"] = action

        restarter.record_result("test", success=False)

        assert action.status == RecoveryStatus.ABANDONED

    def test_get_restart(self, restarter):
        action = RecoveryAction(
            action_id="test",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c1",
        )
        restarter._restarts["test"] = action

        result = restarter.get_restart("test")
        assert result == action

    def test_get_active_restarts(self, restarter):
        pending = RecoveryAction(
            action_id="pending",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c1",
            status=RecoveryStatus.PENDING,
        )
        completed = RecoveryAction(
            action_id="completed",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c2",
            status=RecoveryStatus.SUCCESS,
        )
        restarter._restarts["pending"] = pending
        restarter._restarts["completed"] = completed

        active = restarter.get_active_restarts()
        assert len(active) == 1
        assert active[0].action_id == "pending"


class TestPeerReconnector:
    """Tests for PeerReconnector."""

    @pytest.fixture
    def reconnector(self):
        return PeerReconnector()

    @pytest.mark.asyncio
    async def test_reconnect_creation(self, reconnector):
        action = await reconnector.reconnect("peer-1")
        assert action.component_id == "peer-1"
        assert action.recovery_type == RecoveryType.PEER_RECONNECT

    def test_record_result_success(self, reconnector):
        action = RecoveryAction(
            action_id="test",
            recovery_type=RecoveryType.PEER_RECONNECT,
            component_type=ComponentType.PEER,
            component_id="p1",
        )
        reconnector._reconnects["test"] = action

        reconnector.record_result("test", success=True)

        assert action.status == RecoveryStatus.SUCCESS

    def test_get_active_reconnects(self, reconnector):
        pending = RecoveryAction(
            action_id="pending",
            recovery_type=RecoveryType.PEER_RECONNECT,
            component_type=ComponentType.PEER,
            component_id="p1",
            status=RecoveryStatus.PENDING,
        )
        reconnector._reconnects["pending"] = pending

        active = reconnector.get_active_reconnects()
        assert len(active) == 1


class TestRecoveryEngine:
    """Tests for RecoveryEngine."""

    @pytest.fixture
    def engine(self):
        return RecoveryEngine()

    def test_engine_creation(self, engine):
        assert engine.max_concurrent == 5

    def test_register_handler(self, engine):
        def handler(action):
            return True

        engine.register_handler(RecoveryType.CONTAINER_RESTART, handler)
        assert RecoveryType.CONTAINER_RESTART in engine._recovery_handlers

    def test_unregister_handler(self, engine):
        def handler(action):
            return True

        engine.register_handler(RecoveryType.CONTAINER_RESTART, handler)
        engine.unregister_handler(RecoveryType.CONTAINER_RESTART)
        assert RecoveryType.CONTAINER_RESTART not in engine._recovery_handlers

    @pytest.mark.asyncio
    async def test_handle_container_alert(self, engine):
        alert = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.CRITICAL,
            component_type=ComponentType.CONTAINER,
            component_id="container-1",
            message="Container failed",
        )

        action = await engine.handle_alert(alert)
        assert action is not None
        assert action.recovery_type == RecoveryType.CONTAINER_RESTART
        assert len(engine.get_pending()) == 1

    @pytest.mark.asyncio
    async def test_handle_peer_alert(self, engine):
        alert = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.CRITICAL,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            message="Peer unreachable",
        )

        action = await engine.handle_alert(alert)
        assert action is not None
        assert action.recovery_type == RecoveryType.PEER_RECONNECT

    @pytest.mark.asyncio
    async def test_ignore_non_critical_alert(self, engine):
        alert = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.WARNING,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            message="Peer degraded",
        )

        action = await engine.handle_alert(alert)
        assert action is None

    @pytest.mark.asyncio
    async def test_start_stop(self, engine):
        await engine.start()
        assert engine._running is True

        await engine.stop()
        assert engine._running is False

    def test_get_metrics(self, engine):
        metrics = engine.get_metrics()
        assert isinstance(metrics, RecoveryMetrics)

    def test_get_pending(self, engine):
        action = RecoveryAction(
            action_id="test",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c1",
        )
        engine._pending_actions.append(action)

        pending = engine.get_pending()
        assert len(pending) == 1

    def test_get_completed(self, engine):
        action = RecoveryAction(
            action_id="test",
            recovery_type=RecoveryType.CONTAINER_RESTART,
            component_type=ComponentType.CONTAINER,
            component_id="c1",
            status=RecoveryStatus.SUCCESS,
        )
        engine._completed_actions.append(action)

        completed = engine.get_completed()
        assert len(completed) == 1

    def test_get_stats(self, engine):
        stats = engine.get_stats()
        assert "running" in stats
        assert "total_recoveries" in stats

    def test_get_container_restarter(self, engine):
        restarter = engine.get_container_restarter()
        assert isinstance(restarter, ContainerRestarter)

    def test_get_peer_reconnector(self, engine):
        reconnector = engine.get_peer_reconnector()
        assert isinstance(reconnector, PeerReconnector)


class TestCreateRecoveryEngine:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        engine = create_recovery_engine()
        assert isinstance(engine, RecoveryEngine)

    def test_create_with_custom(self):
        engine = create_recovery_engine(max_concurrent=10)
        assert engine.max_concurrent == 10


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
