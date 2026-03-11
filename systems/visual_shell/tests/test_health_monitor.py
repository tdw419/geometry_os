"""
Tests for Health Monitor (Phase 41)

Tests continuous health checks and failure detection.
"""

import time

import pytest

from systems.visual_shell.health_monitor import (
    AlertSeverity,
    ComponentType,
    FailureDetector,
    HealthAlert,
    HealthCheck,
    HealthMetrics,
    HealthMonitor,
    HealthStatus,
    Heartbeat,
    create_health_monitor,
)


class TestHealthStatus:
    """Tests for HealthStatus enum."""

    def test_health_statuses(self):
        assert HealthStatus.HEALTHY.value == "healthy"
        assert HealthStatus.DEGRADED.value == "degraded"
        assert HealthStatus.UNHEALTHY.value == "unhealthy"
        assert HealthStatus.UNKNOWN.value == "unknown"


class TestAlertSeverity:
    """Tests for AlertSeverity enum."""

    def test_alert_severities(self):
        assert AlertSeverity.INFO.value == "info"
        assert AlertSeverity.WARNING.value == "warning"
        assert AlertSeverity.CRITICAL.value == "critical"
        assert AlertSeverity.RECOVERY.value == "recovery"


class TestComponentType:
    """Tests for ComponentType enum."""

    def test_component_types(self):
        assert ComponentType.PEER.value == "peer"
        assert ComponentType.CONTAINER.value == "container"
        assert ComponentType.SERVICE.value == "service"


class TestHealthCheck:
    """Tests for HealthCheck dataclass."""

    def test_check_creation(self):
        check = HealthCheck(
            check_id="check-1",
            component_type=ComponentType.PEER,
            component_id="peer-1",
            status=HealthStatus.HEALTHY,
            message="All good",
        )
        assert check.check_id == "check-1"
        assert check.component_type == ComponentType.PEER
        assert check.status == HealthStatus.HEALTHY


class TestHealthAlert:
    """Tests for HealthAlert dataclass."""

    def test_alert_creation(self):
        alert = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.CRITICAL,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            message="Peer unreachable",
        )
        assert alert.alert_id == "alert-1"
        assert alert.severity == AlertSeverity.CRITICAL
        assert alert.resolved is False


class TestHeartbeat:
    """Tests for Heartbeat dataclass."""

    def test_heartbeat_creation(self):
        hb = Heartbeat(
            component_id="peer-1",
            component_type=ComponentType.PEER,
            last_seen=time.time(),
        )
        assert hb.component_id == "peer-1"
        assert hb.sequence == 0


class TestHealthMetrics:
    """Tests for HealthMetrics dataclass."""

    def test_metrics_defaults(self):
        metrics = HealthMetrics()
        assert metrics.total_components == 0
        assert metrics.uptime_percentage == 100.0


class TestFailureDetector:
    """Tests for FailureDetector."""

    @pytest.fixture
    def detector(self):
        return FailureDetector(
            heartbeat_timeout=1.0,
            failure_threshold=2,
            recovery_threshold=1,
        )

    def test_detector_creation(self, detector):
        assert detector.heartbeat_timeout == 1.0

    def test_record_heartbeat(self, detector):
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        assert "peer-1" in detector.get_heartbeats()

    def test_heartbeat_sequence(self, detector):
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        hb = detector.get_heartbeats()["peer-1"]
        assert hb.sequence == 1

    def test_get_status_healthy(self, detector):
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        status = detector.get_status("peer-1")
        assert status == HealthStatus.HEALTHY

    def test_get_status_unknown(self, detector):
        status = detector.get_status("unknown-peer")
        assert status == HealthStatus.UNKNOWN

    def test_get_status_degraded(self, detector):
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        # Simulate time passing
        heartbeats = detector._heartbeats
        heartbeats["peer-1"].last_seen = time.time() - 2.0
        status = detector.get_status("peer-1")
        assert status == HealthStatus.DEGRADED

    def test_check_failures_no_failures(self, detector):
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        alerts = detector.check_failures()
        assert len(alerts) == 0

    def test_check_failures_with_failure(self, detector):
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        # Simulate old heartbeat
        detector._heartbeats["peer-1"].last_seen = time.time() - 5.0

        # First check - increments failure count
        alerts = detector.check_failures()
        assert len(alerts) == 0  # Not yet at threshold

        # Second check - triggers failure
        alerts = detector.check_failures()
        assert len(alerts) == 1
        assert alerts[0].severity == AlertSeverity.CRITICAL

    def test_recovery(self, detector):
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        detector._heartbeats["peer-1"].last_seen = time.time() - 5.0

        # Trigger failure
        detector.check_failures()
        detector.check_failures()
        assert "peer-1" in detector.get_suspected()

        # Send heartbeat to recover
        detector.record_heartbeat("peer-1", ComponentType.PEER)
        assert "peer-1" not in detector.get_suspected()


class TestHealthMonitor:
    """Tests for HealthMonitor."""

    @pytest.fixture
    def monitor(self):
        return HealthMonitor(check_interval=0.1, heartbeat_timeout=1.0)

    def test_monitor_creation(self, monitor):
        assert monitor.check_interval == 0.1

    def test_register_probe(self, monitor):
        def probe():
            return HealthCheck(
                check_id="check-1",
                component_type=ComponentType.SERVICE,
                component_id="test-service",
                status=HealthStatus.HEALTHY,
            )

        monitor.register_probe("test", probe)
        assert "test" in monitor._probes

    def test_unregister_probe(self, monitor):
        def probe():
            return HealthCheck(
                check_id="check-1",
                component_type=ComponentType.SERVICE,
                component_id="test-service",
                status=HealthStatus.HEALTHY,
            )

        monitor.register_probe("test", probe)
        monitor.unregister_probe("test")
        assert "test" not in monitor._probes

    def test_record_heartbeat(self, monitor):
        monitor.record_heartbeat("peer-1", ComponentType.PEER)
        status = monitor.get_status("peer-1")
        assert status == HealthStatus.HEALTHY

    @pytest.mark.asyncio
    async def test_start_stop(self, monitor):
        await monitor.start()
        assert monitor._running is True

        await monitor.stop()
        assert monitor._running is False

    def test_get_metrics(self, monitor):
        monitor.record_heartbeat("peer-1", ComponentType.PEER)
        monitor.record_heartbeat("peer-2", ComponentType.PEER)
        monitor._update_metrics()

        metrics = monitor.get_metrics()
        assert metrics.total_components == 2
        assert metrics.healthy_count == 2

    def test_get_checks(self, monitor):
        def probe():
            return HealthCheck(
                check_id="check-1",
                component_type=ComponentType.SERVICE,
                component_id="test-service",
                status=HealthStatus.HEALTHY,
            )

        monitor.register_probe("test", probe)
        monitor._checks = [probe()]

        checks = monitor.get_checks()
        assert len(checks) == 1

    def test_subscribe_alerts(self, monitor):
        received = []

        def callback(alert):
            received.append(alert)

        monitor.subscribe(callback)
        alert = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.WARNING,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            message="Test alert",
        )
        monitor._emit_alert(alert)

        assert len(received) == 1
        assert received[0].alert_id == "alert-1"

    def test_unsubscribe_alerts(self, monitor):
        received = []

        def callback(alert):
            received.append(alert)

        monitor.subscribe(callback)
        monitor.unsubscribe(callback)
        alert = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.WARNING,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            message="Test alert",
        )
        monitor._emit_alert(alert)

        assert len(received) == 0

    def test_get_alerts(self, monitor):
        alert = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.WARNING,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            message="Test alert",
        )
        monitor._alerts.append(alert)

        alerts = monitor.get_alerts()
        assert len(alerts) == 1

    def test_get_alerts_unresolved_only(self, monitor):
        alert1 = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.WARNING,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            message="Test alert",
            resolved=False,
        )
        alert2 = HealthAlert(
            alert_id="alert-2",
            severity=AlertSeverity.WARNING,
            component_type=ComponentType.PEER,
            component_id="peer-2",
            message="Resolved alert",
            resolved=True,
        )
        monitor._alerts = [alert1, alert2]

        alerts = monitor.get_alerts(unresolved_only=True)
        assert len(alerts) == 1
        assert alerts[0].alert_id == "alert-1"

    def test_resolve_alert(self, monitor):
        alert = HealthAlert(
            alert_id="alert-1",
            severity=AlertSeverity.WARNING,
            component_type=ComponentType.PEER,
            component_id="peer-1",
            message="Test alert",
        )
        monitor._alerts.append(alert)

        resolved = monitor.resolve_alert("alert-1")
        assert resolved is not None
        assert resolved.resolved is True
        assert resolved.resolved_at is not None

    def test_resolve_alert_not_found(self, monitor):
        resolved = monitor.resolve_alert("nonexistent")
        assert resolved is None

    def test_get_stats(self, monitor):
        monitor.record_heartbeat("peer-1", ComponentType.PEER)
        monitor._update_metrics()

        stats = monitor.get_stats()
        assert "running" in stats
        assert "total_components" in stats
        assert stats["total_components"] == 1

    def test_get_failure_detector(self, monitor):
        detector = monitor.get_failure_detector()
        assert isinstance(detector, FailureDetector)


class TestCreateHealthMonitor:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        monitor = create_health_monitor()
        assert isinstance(monitor, HealthMonitor)

    def test_create_with_custom_settings(self):
        monitor = create_health_monitor(
            check_interval=5.0,
            heartbeat_timeout=60.0,
        )
        assert monitor.check_interval == 5.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
