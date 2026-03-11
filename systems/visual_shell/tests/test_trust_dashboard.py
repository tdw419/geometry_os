"""
Tests for Trust Dashboard (Phase 40)

Tests confidence metrics, success rates, and override controls.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.action_history import ActionHistory
from systems.visual_shell.trust_dashboard import (
    ConfidenceBucket,
    ConfidenceHistogram,
    OverrideEvent,
    OverridePanel,
    OverrideType,
    TrustDashboard,
    TrustLevel,
    TrustMetrics,
    create_trust_dashboard,
)


class TestOverrideType:
    """Tests for OverrideType enum."""

    def test_override_types(self):
        assert OverrideType.APPROVE.value == "approve"
        assert OverrideType.REJECT.value == "reject"
        assert OverrideType.PAUSE.value == "pause"
        assert OverrideType.RESUME.value == "resume"
        assert OverrideType.MANUAL.value == "manual"


class TestTrustLevel:
    """Tests for TrustLevel enum."""

    def test_trust_levels(self):
        assert TrustLevel.FULL_AUTO.value == "full_auto"
        assert TrustLevel.SUPERVISED.value == "supervised"
        assert TrustLevel.APPROVAL_REQUIRED.value == "approval_required"
        assert TrustLevel.MANUAL_ONLY.value == "manual_only"


class TestOverrideEvent:
    """Tests for OverrideEvent dataclass."""

    def test_event_creation(self):
        event = OverrideEvent(
            event_id="event-1",
            override_type=OverrideType.APPROVE,
            action_id="action-1",
            reason="Manual approval",
            operator="admin",
            timestamp=time.time(),
        )
        assert event.event_id == "event-1"
        assert event.override_type == OverrideType.APPROVE
        assert event.action_id == "action-1"


class TestTrustMetrics:
    """Tests for TrustMetrics dataclass."""

    def test_metrics_defaults(self):
        metrics = TrustMetrics()
        assert metrics.total_actions == 0
        assert metrics.success_rate == 0.0
        assert metrics.trust_level == TrustLevel.SUPERVISED.value


class TestConfidenceBucket:
    """Tests for ConfidenceBucket dataclass."""

    def test_bucket_creation(self):
        bucket = ConfidenceBucket(
            min_confidence=0.5,
            max_confidence=0.6,
            count=10,
            success_count=8,
            failure_count=2,
        )
        assert bucket.min_confidence == 0.5
        assert bucket.max_confidence == 0.6
        assert bucket.count == 10


class TestConfidenceHistogram:
    """Tests for ConfidenceHistogram."""

    @pytest.fixture
    def histogram(self):
        return ConfidenceHistogram(bucket_count=10)

    def test_histogram_creation(self, histogram):
        assert histogram.bucket_count == 10

    def test_update(self, histogram):
        actions = []
        for i in range(20):
            action = Mock()
            action.confidence = (i % 10) / 10.0 + 0.05
            action.success = i % 3 != 0
            actions.append(action)

        histogram.update(actions)

        buckets = histogram.get_buckets()
        assert len(buckets) == 10

    def test_get_bucket(self, histogram):
        actions = [Mock(confidence=0.75, success=True)]
        histogram.update(actions)

        bucket = histogram.get_bucket(0.75)
        assert bucket is not None
        assert bucket.count >= 1

    def test_get_accuracy_by_confidence(self, histogram):
        actions = []
        for i in range(10):
            action = Mock()
            action.confidence = i / 10.0 + 0.05
            action.success = i >= 5
            actions.append(action)

        histogram.update(actions)
        accuracy = histogram.get_accuracy_by_confidence()

        assert len(accuracy) == 10


class TestOverridePanel:
    """Tests for OverridePanel."""

    @pytest.fixture
    def panel(self):
        return OverridePanel()

    def test_panel_creation(self, panel):
        assert len(panel.get_pending()) == 0

    def test_add_pending(self, panel):
        action = Mock(action_id="action-1")
        action_id = panel.add_pending(action)

        assert action_id == "action-1"
        assert len(panel.get_pending()) == 1

    def test_approve(self, panel):
        action = Mock(action_id="action-1")
        panel.add_pending(action)

        event = panel.approve("action-1", operator="admin")

        assert event.override_type == OverrideType.APPROVE
        assert len(panel.get_pending()) == 0

    def test_reject(self, panel):
        action = Mock(action_id="action-1")
        panel.add_pending(action)

        event = panel.reject("action-1", reason="Risk too high", operator="admin")

        assert event.override_type == OverrideType.REJECT
        assert event.reason == "Risk too high"

    def test_pause_loop(self, panel):
        event = panel.pause_loop("Maintenance window", operator="admin")

        assert event.override_type == OverrideType.PAUSE
        assert event.previous_state == "running"
        assert event.new_state == "paused"

    def test_resume_loop(self, panel):
        event = panel.resume_loop("Maintenance complete", operator="admin")

        assert event.override_type == OverrideType.RESUME
        assert event.new_state == "running"

    def test_manual_action(self, panel):
        event = panel.manual_action("migrate", {"peer": "peer-1"}, operator="admin")

        assert event.override_type == OverrideType.MANUAL
        assert "migrate" in event.reason

    def test_get_overrides(self, panel):
        panel.approve("action-1")
        panel.reject("action-2", "Test")

        overrides = panel.get_overrides()
        assert len(overrides) == 2


class TestTrustDashboard:
    """Tests for TrustDashboard."""

    @pytest.fixture
    def history(self):
        h = ActionHistory()
        for i in range(10):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate"
            action.peer_id = "peer-1"
            action.container_id = None
            action.target_peer_id = None
            action.reason = "Test"
            action.confidence = 0.5 + (i * 0.05)
            action.success = i % 2 == 0
            action.created_at = time.time()
            action.executed_at = None
            action.error_message = None
            h.record(action)
        return h

    @pytest.fixture
    def dashboard(self, history):
        return TrustDashboard(history=history)

    def test_dashboard_creation(self, dashboard):
        assert dashboard._trust_level == TrustLevel.SUPERVISED

    @pytest.mark.asyncio
    async def test_start_stop(self, dashboard):
        await dashboard.start()
        assert dashboard._running is True

        await dashboard.stop()
        assert dashboard._running is False

    def test_update_metrics(self, dashboard):
        dashboard.update_metrics()

        metrics = dashboard.get_trust_metrics()
        assert metrics.total_actions == 10

        assert 0.4 <= metrics.success_rate <= 0.6

    def test_get_histogram(self, dashboard):
        histogram = dashboard.get_histogram()
        assert isinstance(histogram, ConfidenceHistogram)

    def test_get_override_panel(self, dashboard):
        panel = dashboard.get_override_panel()
        assert isinstance(panel, OverridePanel)

    def test_set_trust_level(self, dashboard):
        dashboard.set_trust_level(TrustLevel.FULL_AUTO)
        assert dashboard.get_trust_level() == TrustLevel.FULL_AUTO

    def test_get_stats(self, dashboard):
        stats = dashboard.get_stats()

        assert "running" in stats
        assert "trust_level" in stats
        assert "metrics" in stats

    def test_should_auto_approve_full_auto(self, dashboard):
        dashboard.set_trust_level(TrustLevel.FULL_AUTO)

        assert dashboard.should_auto_approve(0.1) is True
        assert dashboard.should_auto_approve(0.9) is True

    def test_should_auto_approve_manual_only(self, dashboard):
        dashboard.set_trust_level(TrustLevel.MANUAL_ONLY)
        assert dashboard.should_auto_approve(0.1) is False
        assert dashboard.should_auto_approve(0.9) is False

    def test_should_auto_approve_supervised(self, dashboard):
        dashboard.set_trust_level(TrustLevel.SUPERVISED)
        # High confidence auto-approves
        assert dashboard.should_auto_approve(0.9) is True
        # Low confidence flags for review
        assert dashboard.should_auto_approve(0.3) is False

    def test_should_auto_approve_approval_required(self, dashboard):
        dashboard.set_trust_level(TrustLevel.APPROVAL_REQUIRED)
        assert dashboard.should_auto_approve(0.9) is False
        assert dashboard.should_auto_approve(0.1) is False


class TestCreateTrustDashboard:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        dashboard = create_trust_dashboard()
        assert isinstance(dashboard, TrustDashboard)

    def test_create_with_history(self):
        history = ActionHistory()
        dashboard = create_trust_dashboard(history=history)
        assert dashboard.history == history


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
