"""
Tests for the User Feedback Collection System

Tests cover:
- FeedbackCollector
- InteractionTracker
- InsightAnalyzer
- UsabilityMetrics
- FeedbackBridge
- Integration
"""

import pytest
import time
from datetime import datetime, timedelta

from systems.feedback.collector import (
    FeedbackCollector,
    FeedbackType,
    FeedbackSeverity,
    FeedbackContext,
)
from systems.feedback.tracker import (
    InteractionTracker,
    InteractionEvent,
    EventType,
)
from systems.feedback.analyzer import (
    InsightAnalyzer,
)
from systems.feedback.metrics import UsabilityMetrics
from systems.feedback.bridge import FeedbackBridge, FeedbackHook
from systems.feedback.integration import FeedbackSystem, FeedbackSystemConfig


# --- Collector Tests ---

class TestFeedbackCollector:
    """Tests for FeedbackCollector."""

    @pytest.fixture
    def collector(self, tmp_path):
        return FeedbackCollector(storage_path=tmp_path / "feedback", auto_persist=True)

    def test_submit_rating(self, collector):
        """Test submitting a rating."""
        entry = collector.submit_rating(rating=4, component="test_component")

        assert entry.feedback_type == FeedbackType.RATING
        assert entry.content["rating"] == 4
        assert "4-star" in entry.tags
        assert entry.context.component == "test_component"

    def test_submit_rating_invalid(self, collector):
        """Test submitting an invalid rating."""
        with pytest.raises(ValueError):
            collector.submit_rating(rating=6)

        with pytest.raises(ValueError):
            collector.submit_rating(rating=0)

    def test_submit_nps(self, collector):
        """Test submitting NPS score."""
        # Promoter
        entry = collector.submit_nps(score=9, reason="Great product")
        assert entry.feedback_type == FeedbackType.NPS
        assert "promoter" in entry.tags

        # Passive
        entry = collector.submit_nps(score=7)
        assert "passive" in entry.tags

        # Detractor
        entry = collector.submit_nps(score=3)
        assert "detractor" in entry.tags

    def test_submit_comment(self, collector):
        """Test submitting a comment."""
        entry = collector.submit_comment(
            text="This is a test comment",
            component="ui",
            tags=["test"],
        )

        assert entry.feedback_type == FeedbackType.COMMENT
        assert entry.content["text"] == "This is a test comment"
        assert "test" in entry.tags

    def test_submit_bug_report(self, collector):
        """Test submitting a bug report."""
        entry = collector.submit_bug_report(
            description="App crashes on startup",
            steps_to_reproduce=["Open app", "Click button"],
            expected_behavior="App opens",
            actual_behavior="App crashes",
            severity=FeedbackSeverity.HIGH,
        )

        assert entry.feedback_type == FeedbackType.BUG_REPORT
        assert entry.severity == FeedbackSeverity.HIGH
        assert len(entry.content["steps_to_reproduce"]) == 2

    def test_submit_feature_request(self, collector):
        """Test submitting a feature request."""
        entry = collector.submit_feature_request(
            title="Dark mode",
            description="Add dark mode support",
            priority="high",
        )

        assert entry.feedback_type == FeedbackType.FEATURE_REQUEST
        assert entry.content["title"] == "Dark mode"

    def test_submit_quick_reaction(self, collector):
        """Test submitting quick reactions."""
        # Positive
        entry = collector.submit_quick_reaction("thumbs_up", component="test")
        assert entry.content["sentiment"] == "positive"

        # Negative
        entry = collector.submit_quick_reaction("thumbs_down")
        assert entry.content["sentiment"] == "negative"

    def test_get_entries(self, collector):
        """Test querying entries."""
        # Add some entries
        collector.submit_rating(5, component="a")
        collector.submit_rating(3, component="b")
        collector.submit_comment("test", component="c")

        # Get all
        entries = collector.get_entries()
        assert len(entries) == 3

        # Filter by type
        ratings = collector.get_entries(feedback_type=FeedbackType.RATING)
        assert len(ratings) == 2

        # Filter by component
        a_entries = [e for e in ratings if e.context.component == "a"]
        assert len(a_entries) == 1

    def test_resolve_feedback(self, collector):
        """Test resolving feedback."""
        entry = collector.submit_bug_report("Test bug")
        assert not entry.resolved

        resolved = collector.resolve_feedback(entry.id, "Fixed in v2")
        assert resolved.resolved
        assert resolved.resolution_notes == "Fixed in v2"

    def test_get_stats(self, collector):
        """Test getting statistics."""
        collector.submit_rating(5)
        collector.submit_rating(4)
        collector.submit_comment("test")

        stats = collector.get_stats()
        assert stats["total"] == 3
        assert stats["by_type"]["rating"] == 2
        assert stats["by_type"]["comment"] == 1
        assert stats["average_rating"] == 4.5

    def test_persistence(self, tmp_path):
        """Test that feedback is persisted to disk."""
        collector1 = FeedbackCollector(storage_path=tmp_path / "fb", auto_persist=True)
        collector1.submit_rating(5)
        collector1.submit_comment("test")

        # Create new collector - should load from disk
        collector2 = FeedbackCollector(storage_path=tmp_path / "fb", auto_persist=False)
        entries = collector2.get_entries()
        assert len(entries) >= 2


# --- Tracker Tests ---

class TestInteractionTracker:
    """Tests for InteractionTracker."""

    @pytest.fixture
    def tracker(self, tmp_path):
        return InteractionTracker(
            storage_path=tmp_path / "interactions",
            auto_persist=True,
        )

    def test_track_click(self, tracker):
        """Test tracking click events."""
        event = tracker.track_click(component="button", view="home", button="left")
        assert event.event_type == EventType.CLICK
        assert event.component == "button"

    def test_track_hover(self, tracker):
        """Test tracking hover events."""
        tracker.start_hover_timer("card")
        time.sleep(0.1)
        event = tracker.end_hover_timer("card")

        assert event.event_type == EventType.HOVER_END
        assert event.duration_ms >= 100

    def test_track_navigation(self, tracker):
        """Test tracking navigation."""
        event = tracker.track_navigation(from_view="home", to_view="settings")
        assert event.event_type == EventType.NAVIGATION
        assert event.data["from"] == "home"
        assert event.data["to"] == "settings"

    def test_track_feature_use(self, tracker):
        """Test tracking feature usage."""
        event = tracker.track_feature_use(
            feature_name="export",
            parameters={"format": "json"},
        )
        assert event.event_type == EventType.FEATURE_USE
        assert event.data["feature"] == "export"

    def test_track_error(self, tracker):
        """Test tracking errors."""
        event = tracker.track_error(
            error_type="ValueError",
            message="Invalid input",
            component="form",
        )
        assert event.event_type == EventType.ERROR_ENCOUNTER
        assert event.data["error_type"] == "ValueError"

    def test_task_tracking(self, tracker):
        """Test task start/end tracking."""
        task_id = tracker.start_task("user_registration")
        time.sleep(0.1)
        event = tracker.end_task(task_id, success=True)

        assert event.event_type == EventType.TASK_END
        assert event.data["success"] is True
        assert event.duration_ms >= 100

    def test_idle_detection(self, tracker):
        """Test idle state tracking."""
        tracker._idle_timeout = 0.05  # 50ms for testing
        tracker._update_activity()

        time.sleep(0.1)
        is_idle = tracker.check_idle()
        assert is_idle is True

        tracker._update_activity()
        assert tracker._is_idle is False

    def test_get_event_counts(self, tracker):
        """Test getting event counts."""
        tracker.track_click("a")
        tracker.track_click("b")
        tracker.track_error("err", "msg")

        counts = tracker.get_event_counts()
        assert counts.get("click", 0) == 2
        assert counts.get("error_encounter", 0) == 1

    def test_get_component_usage(self, tracker):
        """Test getting component usage."""
        tracker.track_click("button_a")
        tracker.track_click("button_a")
        tracker.track_click("button_b")

        usage = tracker.get_component_usage()
        assert usage["button_a"] == 2
        assert usage["button_b"] == 1


# --- Analyzer Tests ---

class TestInsightAnalyzer:
    """Tests for InsightAnalyzer."""

    @pytest.fixture
    def analyzer(self, tmp_path):
        return InsightAnalyzer(storage_path=tmp_path / "insights")

    def test_analyze_sentiment(self, analyzer):
        """Test sentiment analysis."""
        positive = analyzer.analyze_sentiment("This is great and amazing!")
        assert positive["sentiment"] == "positive"

        negative = analyzer.analyze_sentiment("This is terrible and broken")
        assert negative["sentiment"] == "negative"

        neutral = analyzer.analyze_sentiment("This is a normal statement")
        assert neutral["sentiment"] == "neutral"

    def test_detect_usage_patterns(self, analyzer):
        """Test usage pattern detection."""
        # Create mock events with session data
        events = []
        for i in range(10):
            event = InteractionEvent(
                event_type=EventType.FEATURE_USE,
                session_id=f"session_{i % 3}",
                component=f"comp_{i % 2}",
            )
            events.append(event)

        patterns = analyzer.detect_usage_patterns(events)
        assert isinstance(patterns, list)

    def test_generate_insights(self, analyzer):
        """Test insight generation."""
        # Create mock data
        from unittest.mock import Mock

        feedback_entries = []
        for i in range(10):
            entry = Mock()
            entry.feedback_type = FeedbackType.RATING
            entry.content = {"rating": 3 if i < 5 else 4}  # Declining ratings
            entry.created_at = datetime.utcnow() - timedelta(days=i)
            entry.context = Mock()
            entry.context.component = "test"
            entry.resolved = False
            entry.severity = Mock()
            entry.severity.value = "medium"
            feedback_entries.append(entry)

        interaction_events = []

        insights = analyzer.generate_insights(feedback_entries, interaction_events)
        assert isinstance(insights, list)


# --- Metrics Tests ---

class TestUsabilityMetrics:
    """Tests for UsabilityMetrics."""

    @pytest.fixture
    def metrics(self, tmp_path):
        return UsabilityMetrics(storage_path=tmp_path / "metrics")

    def test_compute_nps(self, metrics):
        """Test NPS computation."""
        from unittest.mock import Mock

        entries = []
        # 5 promoters (9-10), 3 passives (7-8), 2 detractors (0-6)
        for score in [10, 9, 10, 9, 9, 8, 7, 8, 3, 4]:
            entry = Mock()
            entry.feedback_type = Mock()
            entry.feedback_type.value = "nps"
            entry.content = {"score": score}
            entries.append(entry)

        result = metrics.compute_nps(entries)
        assert result["nps"] == 30.0  # (5 - 2) / 10 * 100
        assert result["promoters"] == 5
        assert result["detractors"] == 2

    def test_compute_error_rate(self, metrics):
        """Test error rate computation."""
        from unittest.mock import Mock

        events = []
        for i in range(100):
            event = Mock()
            event.timestamp = time.time() - i * 60
            event.event_type = Mock()
            event.session_id = f"session_{i % 10}"

            if i % 10 == 0:  # 10 errors
                event.event_type.value = "error_encounter"
                event.component = f"comp_{i % 3}"
                event.data = {"error_type": "ValueError"}
            else:
                event.event_type.value = "click"

            events.append(event)

        result = metrics.compute_error_rate(events, time_window_hours=24)
        assert result["total_errors"] == 10
        assert result["error_rate"] == 0.1


# --- Bridge Tests ---

class TestFeedbackBridge:
    """Tests for FeedbackBridge."""

    @pytest.fixture
    def bridge(self, tmp_path):
        bridge = FeedbackBridge(storage_path=tmp_path / "bridge")
        bridge.start()
        yield bridge
        bridge.stop()

    def test_hook_registration(self, bridge):
        """Test hook registration."""
        called = []

        def callback(action):
            called.append(action)

        bridge.register_hook(FeedbackHook.ON_RATING_LOW, callback)

        # Trigger the hook
        from systems.feedback.collector import FeedbackEntry
        entry = FeedbackEntry(
            feedback_type=FeedbackType.RATING,
            content={"rating": 2},
            context=FeedbackContext(session_id="test"),
        )

        bridge.process_feedback_entry(entry)
        time.sleep(0.5)  # Wait for worker

        assert len(called) > 0

    def test_threshold_checking(self, bridge):
        """Test threshold checking."""
        bridge.set_threshold("test_metric", 10.0, 90.0)

        assert bridge.check_threshold("test_metric", 5.0) == "low"
        assert bridge.check_threshold("test_metric", 95.0) == "high"
        assert bridge.check_threshold("test_metric", 50.0) is None

    def test_get_stats(self, bridge):
        """Test getting bridge stats."""
        stats = bridge.get_stats()
        assert "total_actions" in stats
        assert "running" in stats


# --- Integration Tests ---

class TestFeedbackSystem:
    """Tests for the complete feedback system."""

    @pytest.fixture
    def system(self, tmp_path):
        config = FeedbackSystemConfig(storage_path=tmp_path / "feedback")
        system = FeedbackSystem(config=config)
        system.initialize()
        yield system
        system.shutdown()

    def test_submit_feedback(self, system):
        """Test submitting feedback through the system."""
        entry = system.submit_rating(5, component="test")
        assert entry.feedback_type == FeedbackType.RATING

    def test_sprint_tracking(self, system):
        """Test sprint tracking."""
        system.start_sprint("test_sprint")

        # Add some data
        system.submit_rating(4)
        system.submit_rating(5)
        system.track_event(EventType.FEATURE_USE, component="test")

        status = system.get_sprint_status()
        assert status["sprint_active"] is True
        assert status["sprint_name"] == "test_sprint"

        report = system.end_sprint()
        assert "sprint_name" in report
        assert report["sprint_name"] == "test_sprint"

    def test_get_dashboard_data(self, system):
        """Test getting dashboard data."""
        system.submit_rating(4)
        system.submit_rating(5)
        system.submit_comment("Great!")

        data = system.get_dashboard_data()
        assert "overview" in data
        assert data["overview"]["total_feedback"] >= 3

    def test_context_manager(self, tmp_path):
        """Test using the system as a context manager."""
        config = FeedbackSystemConfig(storage_path=tmp_path / "feedback")

        with FeedbackSystem(config=config) as system:
            system.submit_rating(5)
            assert system.collector is not None

        # System should be shut down


# --- Verification Test ---

def test_feedback_system_verification(tmp_path):
    """
    Verification test for sprint monitoring.

    This test simulates a sprint monitoring scenario to verify
    the feedback collection system works end-to-end.
    """
    config = FeedbackSystemConfig(storage_path=tmp_path / "verification")
    alerts_received = []

    def alert_handler(alert):
        alerts_received.append(alert)

    system = FeedbackSystem(
        config=config,
        alert_handlers=[alert_handler],
    )
    system.initialize()

    # Start a sprint
    system.start_sprint("verification_sprint")

    # Simulate user activity
    system.submit_rating(5, component="dashboard")
    system.submit_rating(4, component="dashboard")
    system.submit_rating(2, component="settings")  # Low rating - should trigger alert

    system.submit_comment("Great interface!", component="dashboard")
    system.submit_bug_report(
        description="Button doesn't work",
        component="settings",
        severity="medium",
    )

    system.track_event(EventType.VIEW_ENTER, view="dashboard")
    system.track_event(EventType.CLICK, component="export_button")
    system.track_event(EventType.FEATURE_USE, data={"feature": "export"})

    # Give bridge time to process
    time.sleep(1)

    # End sprint and get report
    report = system.end_sprint()

    # Verify report
    assert report["sprint_name"] == "verification_sprint"
    assert report["feedback_summary"]["total"] >= 5
    assert "metrics" in report

    # Verify dashboard
    dashboard = system.get_dashboard_data()
    assert dashboard["overview"]["total_feedback"] >= 5

    system.shutdown()

    print("✅ Feedback system verification passed!")
    print(f"   - Collected {report['feedback_summary']['total']} feedback entries")
    print(f"   - Generated {len(report['insights'])} insights")
    print(f"   - Alerts received: {len(alerts_received)}")


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
