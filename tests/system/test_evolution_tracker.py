"""
Tests for EvolutionTracker - Track evolution events for recursive evolution.

TDD Tests:
1. Test EvolutionTracker initializes empty
2. Test log_event(ATTEMPT) adds to events
3. Test log_event(SUCCESS) increments total_improvements
4. Test log_event(REJECTION) increments total_rejections
5. Test calculate_velocity() returns improvements per hour
6. Test average_improvement_delta calculated correctly
7. Test log_event(ROLLBACK) increments total_rollbacks
8. Test generate_report() returns summary dict
"""

import pytest
import time
from dataclasses import dataclass, field
from typing import Dict, Any, Optional, List
from enum import Enum
from datetime import datetime, timedelta

# Import will fail initially - that's expected in TDD
from systems.visual_shell.swarm.evolution.evolution_tracker import (
    EventType,
    EvolutionEvent,
    EvolutionTracker,
)


class TestEvolutionTrackerInit:
    """Test EvolutionTracker initialization."""

    def test_initializes_empty(self):
        """Test EvolutionTracker initializes with empty state."""
        tracker = EvolutionTracker()

        assert tracker.total_improvements == 0
        assert tracker.total_rejections == 0
        assert tracker.total_rollbacks == 0
        assert tracker.total_improvement_delta == 0.0
        assert len(tracker.events) == 0


class TestLogEventAttempt:
    """Test log_event with ATTEMPT type."""

    def test_log_attempt_adds_to_events(self):
        """Test log_event(ATTEMPT) adds to events list."""
        tracker = EvolutionTracker()

        event = EvolutionEvent(
            type=EventType.ATTEMPT,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.5,
            value_score_after=None,
            reason="Initial attempt",
        )

        tracker.log_event(event)

        assert len(tracker.events) == 1
        assert tracker.events[0] == event

    def test_log_multiple_attempts(self):
        """Test logging multiple ATTEMPT events."""
        tracker = EvolutionTracker()

        for i in range(3):
            event = EvolutionEvent(
                type=EventType.ATTEMPT,
                target_file=f"file{i}.py",
                timestamp=datetime.now(),
                value_score_before=0.5,
                value_score_after=None,
                reason=f"Attempt {i}",
            )
            tracker.log_event(event)

        assert len(tracker.events) == 3


class TestLogEventSuccess:
    """Test log_event with SUCCESS type."""

    def test_success_increments_total_improvements(self):
        """Test log_event(SUCCESS) increments total_improvements."""
        tracker = EvolutionTracker()

        event = EvolutionEvent(
            type=EventType.SUCCESS,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.4,
            value_score_after=0.6,
            reason="Improved score",
        )

        tracker.log_event(event)

        assert tracker.total_improvements == 1

    def test_success_updates_improvement_delta(self):
        """Test SUCCESS events update total_improvement_delta."""
        tracker = EvolutionTracker()

        event = EvolutionEvent(
            type=EventType.SUCCESS,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.4,
            value_score_after=0.6,
            reason="Improved score",
        )

        tracker.log_event(event)

        # Delta should be 0.2 (0.6 - 0.4)
        assert abs(tracker.total_improvement_delta - 0.2) < 0.001

    def test_multiple_successes_accumulate(self):
        """Test multiple SUCCESS events accumulate counts and deltas."""
        tracker = EvolutionTracker()

        events = [
            EvolutionEvent(
                type=EventType.SUCCESS,
                target_file="file1.py",
                timestamp=datetime.now(),
                value_score_before=0.3,
                value_score_after=0.5,
                reason="First improvement",
            ),
            EvolutionEvent(
                type=EventType.SUCCESS,
                target_file="file2.py",
                timestamp=datetime.now(),
                value_score_before=0.4,
                value_score_after=0.7,
                reason="Second improvement",
            ),
        ]

        for event in events:
            tracker.log_event(event)

        assert tracker.total_improvements == 2
        # Total delta: (0.5-0.3) + (0.7-0.4) = 0.2 + 0.3 = 0.5
        assert abs(tracker.total_improvement_delta - 0.5) < 0.001


class TestLogEventRejection:
    """Test log_event with REJECTION type."""

    def test_rejection_increments_total_rejections(self):
        """Test log_event(REJECTION) increments total_rejections."""
        tracker = EvolutionTracker()

        event = EvolutionEvent(
            type=EventType.REJECTION,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.5,
            value_score_after=0.5,
            reason="Failed safety check",
        )

        tracker.log_event(event)

        assert tracker.total_rejections == 1

    def test_multiple_rejections_accumulate(self):
        """Test multiple REJECTION events accumulate."""
        tracker = EvolutionTracker()

        for i in range(5):
            event = EvolutionEvent(
                type=EventType.REJECTION,
                target_file=f"file{i}.py",
                timestamp=datetime.now(),
                value_score_before=0.5,
                value_score_after=0.5,
                reason="Safety rejection",
            )
            tracker.log_event(event)

        assert tracker.total_rejections == 5


class TestLogEventRollback:
    """Test log_event with ROLLBACK type."""

    def test_rollback_increments_total_rollbacks(self):
        """Test log_event(ROLLBACK) increments total_rollbacks."""
        tracker = EvolutionTracker()

        event = EvolutionEvent(
            type=EventType.ROLLBACK,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.6,
            value_score_after=0.4,
            reason="Reverted due to regression",
        )

        tracker.log_event(event)

        assert tracker.total_rollbacks == 1

    def test_multiple_rollbacks_accumulate(self):
        """Test multiple ROLLBACK events accumulate."""
        tracker = EvolutionTracker()

        for i in range(3):
            event = EvolutionEvent(
                type=EventType.ROLLBACK,
                target_file=f"file{i}.py",
                timestamp=datetime.now(),
                value_score_before=0.6,
                value_score_after=0.4,
                reason="Regression detected",
            )
            tracker.log_event(event)

        assert tracker.total_rollbacks == 3


class TestCalculateVelocity:
    """Test calculate_velocity method."""

    def test_velocity_zero_with_no_improvements(self):
        """Test calculate_velocity returns 0 with no improvements."""
        tracker = EvolutionTracker()

        velocity = tracker.calculate_velocity(hours=1.0)

        assert velocity == 0.0

    def test_velocity_returns_improvements_per_hour(self):
        """Test calculate_velocity returns improvements per hour."""
        tracker = EvolutionTracker()
        now = datetime.now()

        # Add 3 success events over the last 30 minutes
        for i in range(3):
            event = EvolutionEvent(
                type=EventType.SUCCESS,
                target_file=f"file{i}.py",
                timestamp=now - timedelta(minutes=30 - i * 10),
                value_score_before=0.4,
                value_score_after=0.6,
                reason="Improvement",
            )
            tracker.log_event(event)

        # Velocity over 1 hour should be 3.0 improvements/hour
        velocity = tracker.calculate_velocity(hours=1.0)
        assert abs(velocity - 3.0) < 0.001

    def test_velocity_with_different_time_windows(self):
        """Test calculate_velocity with different time windows."""
        tracker = EvolutionTracker()
        now = datetime.now()

        # Add 2 success events
        for i in range(2):
            event = EvolutionEvent(
                type=EventType.SUCCESS,
                target_file=f"file{i}.py",
                timestamp=now - timedelta(minutes=15),
                value_score_before=0.4,
                value_score_after=0.6,
                reason="Improvement",
            )
            tracker.log_event(event)

        # Over 0.5 hours, velocity should be 4.0 (2 / 0.5)
        velocity = tracker.calculate_velocity(hours=0.5)
        assert abs(velocity - 4.0) < 0.001

    def test_velocity_respects_time_window(self):
        """Test velocity only counts events within time window."""
        tracker = EvolutionTracker()
        now = datetime.now()

        # Recent event
        recent_event = EvolutionEvent(
            type=EventType.SUCCESS,
            target_file="recent.py",
            timestamp=now - timedelta(minutes=30),
            value_score_before=0.4,
            value_score_after=0.6,
            reason="Recent",
        )
        tracker.log_event(recent_event)

        # Old event (outside 1 hour window)
        old_event = EvolutionEvent(
            type=EventType.SUCCESS,
            target_file="old.py",
            timestamp=now - timedelta(hours=2),
            value_score_before=0.4,
            value_score_after=0.6,
            reason="Old",
        )
        tracker.log_event(old_event)

        # Velocity should only count the recent event
        velocity = tracker.calculate_velocity(hours=1.0)
        assert abs(velocity - 1.0) < 0.001


class TestAverageImprovementDelta:
    """Test average_improvement_delta property."""

    def test_average_delta_zero_with_no_improvements(self):
        """Test average_improvement_delta is 0 with no improvements."""
        tracker = EvolutionTracker()

        assert tracker.average_improvement_delta == 0.0

    def test_average_delta_calculated_correctly(self):
        """Test average_improvement_delta calculated correctly."""
        tracker = EvolutionTracker()

        # Add success events with different deltas
        events = [
            EvolutionEvent(
                type=EventType.SUCCESS,
                target_file="file1.py",
                timestamp=datetime.now(),
                value_score_before=0.3,
                value_score_after=0.5,
                reason="Delta 0.2",
            ),
            EvolutionEvent(
                type=EventType.SUCCESS,
                target_file="file2.py",
                timestamp=datetime.now(),
                value_score_before=0.4,
                value_score_after=0.6,
                reason="Delta 0.2",
            ),
            EvolutionEvent(
                type=EventType.SUCCESS,
                target_file="file3.py",
                timestamp=datetime.now(),
                value_score_before=0.5,
                value_score_after=0.8,
                reason="Delta 0.3",
            ),
        ]

        for event in events:
            tracker.log_event(event)

        # Average delta: (0.2 + 0.2 + 0.3) / 3 = 0.233...
        expected = (0.2 + 0.2 + 0.3) / 3
        assert abs(tracker.average_improvement_delta - expected) < 0.001

    def test_average_delta_with_negative_improvement(self):
        """Test average_improvement_delta handles negative improvements."""
        tracker = EvolutionTracker()

        # Add success event where score actually decreased (shouldn't happen but test)
        event = EvolutionEvent(
            type=EventType.SUCCESS,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.6,
            value_score_after=0.4,
            reason="Negative delta",
        )
        tracker.log_event(event)

        # Average delta should be -0.2
        assert abs(tracker.average_improvement_delta - (-0.2)) < 0.001


class TestGenerateReport:
    """Test generate_report method."""

    def test_generate_report_returns_dict(self):
        """Test generate_report returns a dictionary."""
        tracker = EvolutionTracker()

        report = tracker.generate_report()

        assert isinstance(report, dict)

    def test_generate_report_contains_all_metrics(self):
        """Test generate_report contains all expected metrics."""
        tracker = EvolutionTracker()

        # Add various events
        events = [
            EvolutionEvent(
                type=EventType.ATTEMPT,
                target_file="attempt.py",
                timestamp=datetime.now(),
                value_score_before=0.5,
                value_score_after=None,
                reason="Attempt",
            ),
            EvolutionEvent(
                type=EventType.SUCCESS,
                target_file="success.py",
                timestamp=datetime.now(),
                value_score_before=0.4,
                value_score_after=0.6,
                reason="Success",
            ),
            EvolutionEvent(
                type=EventType.REJECTION,
                target_file="reject.py",
                timestamp=datetime.now(),
                value_score_before=0.5,
                value_score_after=0.5,
                reason="Rejected",
            ),
            EvolutionEvent(
                type=EventType.ROLLBACK,
                target_file="rollback.py",
                timestamp=datetime.now(),
                value_score_before=0.6,
                value_score_after=0.4,
                reason="Rolled back",
            ),
        ]

        for event in events:
            tracker.log_event(event)

        report = tracker.generate_report()

        assert "total_improvements" in report
        assert "total_rejections" in report
        assert "total_rollbacks" in report
        assert "total_improvement_delta" in report
        assert "average_improvement_delta" in report
        assert "velocity" in report
        assert "total_events" in report

    def test_generate_report_values_correct(self):
        """Test generate_report returns correct values."""
        tracker = EvolutionTracker()

        # Add success events
        for i in range(3):
            event = EvolutionEvent(
                type=EventType.SUCCESS,
                target_file=f"file{i}.py",
                timestamp=datetime.now(),
                value_score_before=0.4,
                value_score_after=0.6,
                reason="Success",
            )
            tracker.log_event(event)

        # Add rejection
        reject_event = EvolutionEvent(
            type=EventType.REJECTION,
            target_file="reject.py",
            timestamp=datetime.now(),
            value_score_before=0.5,
            value_score_after=0.5,
            reason="Rejected",
        )
        tracker.log_event(reject_event)

        report = tracker.generate_report()

        assert report["total_improvements"] == 3
        assert report["total_rejections"] == 1
        assert report["total_rollbacks"] == 0
        assert abs(report["total_improvement_delta"] - 0.6) < 0.001  # 3 * 0.2
        assert abs(report["average_improvement_delta"] - 0.2) < 0.001
        assert report["total_events"] == 4


class TestEventTypeEnum:
    """Test EventType enum."""

    def test_event_types_exist(self):
        """Test all expected event types exist."""
        assert hasattr(EventType, 'ATTEMPT')
        assert hasattr(EventType, 'SUCCESS')
        assert hasattr(EventType, 'REJECTION')
        assert hasattr(EventType, 'ROLLBACK')
        assert hasattr(EventType, 'CONSENSUS')

    def test_event_type_values(self):
        """Test EventType values are strings."""
        assert EventType.ATTEMPT.value == "attempt"
        assert EventType.SUCCESS.value == "success"
        assert EventType.REJECTION.value == "rejection"
        assert EventType.ROLLBACK.value == "rollback"
        assert EventType.CONSENSUS.value == "consensus"


class TestEvolutionEventDataclass:
    """Test EvolutionEvent dataclass."""

    def test_evolution_event_creation(self):
        """Test EvolutionEvent can be created with all fields."""
        event = EvolutionEvent(
            type=EventType.SUCCESS,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.4,
            value_score_after=0.6,
            reason="Improved score",
            metadata={"author": "test"},
        )

        assert event.type == EventType.SUCCESS
        assert event.target_file == "test.py"
        assert event.value_score_before == 0.4
        assert event.value_score_after == 0.6
        assert event.reason == "Improved score"
        assert event.metadata == {"author": "test"}

    def test_evolution_event_optional_fields(self):
        """Test EvolutionEvent optional fields have defaults."""
        event = EvolutionEvent(
            type=EventType.ATTEMPT,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.5,
            value_score_after=None,
            reason="Initial",
        )

        assert event.value_score_after is None
        assert event.metadata == {}


class TestLogEventConsensus:
    """Test log_event with CONSENSUS type."""

    def test_consensus_event_logged(self):
        """Test CONSENSUS events are logged correctly."""
        tracker = EvolutionTracker()

        event = EvolutionEvent(
            type=EventType.CONSENSUS,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.5,
            value_score_after=0.7,
            reason="Multi-agent consensus reached",
            metadata={"agents": ["agent1", "agent2"]},
        )

        tracker.log_event(event)

        assert len(tracker.events) == 1
        # Consensus should also count as an improvement
        assert tracker.total_improvements == 1

    def test_consensus_contributes_to_delta(self):
        """Test CONSENSUS events contribute to improvement delta."""
        tracker = EvolutionTracker()

        event = EvolutionEvent(
            type=EventType.CONSENSUS,
            target_file="test.py",
            timestamp=datetime.now(),
            value_score_before=0.5,
            value_score_after=0.7,
            reason="Consensus",
        )

        tracker.log_event(event)

        assert abs(tracker.total_improvement_delta - 0.2) < 0.001
