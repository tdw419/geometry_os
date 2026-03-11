"""
Tests for Action History (Phase 39)

Tests the visual trail of autonomous actions.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.action_history import (
    ActionHistory,
    ActionReplay,
    ActionTrail,
    HistoryEntry,
    ReplayFrame,
    TrailStep,
    TrailStepType,
    create_action_history,
)


class TestTrailStepType:
    """Tests for TrailStepType enum."""

    def test_step_types(self):
        assert TrailStepType.START.value == "start"
        assert TrailStepType.ACTION.value == "action"
        assert TrailStepType.TRANSITION.value == "transition"
        assert TrailStepType.END.value == "end"


class TestHistoryEntry:
    """Tests for HistoryEntry dataclass."""

    def test_entry_creation(self):
        entry = HistoryEntry(
            entry_id="entry-1",
            action_id="action-1",
            action_type="migrate_container",
            peer_id="peer-1",
            container_id="container-1",
            target_peer_id="peer-2",
            reason="CPU overload",
            confidence=0.85,
            success=True,
            created_at=time.time(),
            executed_at=time.time() + 0.1,
        )
        assert entry.entry_id == "entry-1"
        assert entry.action_type == "migrate_container"
        assert entry.peer_id == "peer-1"
        assert entry.success is True

    def test_entry_defaults(self):
        entry = HistoryEntry(
            entry_id="entry-2",
            action_id="action-2",
            action_type="alert",
            peer_id="peer-1",
            container_id=None,
            target_peer_id=None,
            reason="Test",
            confidence=0.5,
            success=False,
            created_at=time.time(),
            executed_at=None,
        )
        assert entry.duration_ms is None
        assert entry.error_message is None
        assert entry.metadata == {}


class TestTrailStep:
    """Tests for TrailStep dataclass."""

    def test_step_creation(self):
        step = TrailStep(
            step_id="step-1",
            step_type=TrailStepType.ACTION,
            entry=None,
            timestamp=time.time(),
            message="Test action",
            peer_from="peer-1",
            peer_to="peer-2",
        )
        assert step.step_type == TrailStepType.ACTION
        assert step.peer_from == "peer-1"
        assert step.peer_to == "peer-2"


class TestReplayFrame:
    """Tests for ReplayFrame dataclass."""

    def test_frame_creation(self):
        frame = ReplayFrame(
            frame_id="frame-1",
            frame_number=0,
            timestamp=time.time(),
            entries=[],
            state_snapshot={"total_actions": 0},
            message="Frame 0",
        )
        assert frame.frame_number == 0
        assert frame.entries == []


class TestActionHistory:
    """Tests for ActionHistory."""

    @pytest.fixture
    def history(self):
        return ActionHistory(max_entries=100)

    def test_history_creation(self, history):
        assert len(history._entries) == 0

    def test_record_action(self, history):
        action = Mock()
        action.action_id = "action-1"
        action.action_type = "migrate_container"
        action.peer_id = "peer-1"
        action.container_id = "container-1"
        action.target_peer_id = "peer-2"
        action.reason = "CPU overload"
        action.confidence = 0.85
        action.success = True
        action.created_at = time.time()
        action.executed_at = time.time() + 0.1
        action.error_message = None

        entry = history.record(action)

        assert len(history._entries) == 1
        assert entry.action_id == "action-1"
        assert entry.success is True

    def test_get_entries(self, history):
        for i in range(5):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate_container"
            action.peer_id = f"peer-{i % 2}"
            action.container_id = None
            action.target_peer_id = None
            action.reason = "Test"
            action.confidence = 0.8
            action.success = i % 2 == 0
            action.created_at = time.time()
            action.executed_at = None
            action.error_message = None
            history.record(action)

        entries = history.get_entries()
        assert len(entries) == 5

    def test_get_entries_by_peer(self, history):
        for i in range(4):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate"
            action.peer_id = "peer-1" if i < 2 else "peer-2"
            action.container_id = None
            action.target_peer_id = None
            action.reason = "Test"
            action.confidence = 0.8
            action.success = True
            action.created_at = time.time()
            action.executed_at = None
            action.error_message = None
            history.record(action)

        peer1_entries = history.get_entries(peer_id="peer-1")
        assert len(peer1_entries) == 2

    def test_get_entries_success_only(self, history):
        for i in range(4):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate"
            action.peer_id = "peer-1"
            action.container_id = None
            action.target_peer_id = None
            action.reason = "Test"
            action.confidence = 0.8
            action.success = i % 2 == 0
            action.created_at = time.time()
            action.executed_at = None
            action.error_message = None
            history.record(action)

        successful = history.get_entries(success_only=True)
        assert len(successful) == 2

    def test_get_entries_failed_only(self, history):
        for i in range(4):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate"
            action.peer_id = "peer-1"
            action.container_id = None
            action.target_peer_id = None
            action.reason = "Test"
            action.confidence = 0.8
            action.success = i % 2 == 0
            action.created_at = time.time()
            action.executed_at = None
            action.error_message = None
            history.record(action)

        failed = history.get_entries(failed_only=True)
        assert len(failed) == 2

    def test_get_stats(self, history):
        for i in range(5):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate"
            action.peer_id = "peer-1"
            action.container_id = None
            action.target_peer_id = None
            action.reason = "Test"
            action.confidence = 0.8
            action.success = i < 3
            action.created_at = time.time()
            action.executed_at = None
            action.error_message = None
            history.record(action)

        stats = history.get_stats()
        assert stats["total_entries"] == 5
        assert stats["successful"] == 3
        assert stats["failed"] == 2
        assert stats["success_rate"] == 0.6

    def test_clear(self, history):
        action = Mock()
        action.action_id = "action-1"
        action.action_type = "migrate"
        action.peer_id = "peer-1"
        action.container_id = None
        action.target_peer_id = None
        action.reason = "Test"
        action.confidence = 0.8
        action.success = True
        action.created_at = time.time()
        action.executed_at = None
        action.error_message = None
        history.record(action)

        assert len(history._entries) == 1
        history.clear()
        assert len(history._entries) == 0

    def test_max_entries(self):
        history = ActionHistory(max_entries=5)

        for i in range(10):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate"
            action.peer_id = "peer-1"
            action.container_id = None
            action.target_peer_id = None
            action.reason = "Test"
            action.confidence = 0.8
            action.success = True
            action.created_at = time.time()
            action.executed_at = None
            action.error_message = None
            history.record(action)

        assert len(history._entries) == 5

    def test_on_record_callback(self, history):
        callback = Mock()
        history.on_record(callback)

        action = Mock()
        action.action_id = "action-1"
        action.action_type = "migrate"
        action.peer_id = "peer-1"
        action.container_id = None
        action.target_peer_id = None
        action.reason = "Test"
        action.confidence = 0.8
        action.success = True
        action.created_at = time.time()
        action.executed_at = None
        action.error_message = None
        history.record(action)

        callback.assert_called_once()


class TestActionTrail:
    """Tests for ActionTrail."""

    @pytest.fixture
    def history(self):
        h = ActionHistory()
        for i in range(3):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate_container"
            action.peer_id = f"peer-{i}"
            action.container_id = f"container-{i}"
            action.target_peer_id = f"peer-{i + 1}"
            action.reason = "Test"
            action.confidence = 0.8
            action.success = True
            action.created_at = time.time() + i
            action.executed_at = None
            action.error_message = None
            h.record(action)
        return h

    @pytest.fixture
    def trail(self, history):
        return ActionTrail(history)

    def test_get_trail(self, trail):
        steps = trail.get_trail()
        assert len(steps) >= 2  # At least start and end
        assert steps[0].step_type == TrailStepType.START
        assert steps[-1].step_type == TrailStepType.END

    def test_get_peer_timeline(self, trail):
        timeline = trail.get_peer_timeline("peer-0")
        assert len(timeline) == 1
        assert timeline[0].step_type == TrailStepType.ACTION


class TestActionReplay:
    """Tests for ActionReplay."""

    @pytest.fixture
    def history(self):
        h = ActionHistory()
        for i in range(5):
            action = Mock()
            action.action_id = f"action-{i}"
            action.action_type = "migrate"
            action.peer_id = f"peer-{i % 2}"
            action.container_id = None
            action.target_peer_id = None
            action.reason = "Test"
            action.confidence = 0.8
            action.success = True
            action.created_at = time.time() + i
            action.executed_at = None
            action.error_message = None
            h.record(action)
        return h

    @pytest.fixture
    def replay(self, history):
        return ActionReplay(history)

    def test_prepare(self, replay):
        frame_count = replay.prepare()
        assert frame_count >= 1

    def test_current(self, replay):
        replay.prepare()
        frame = replay.current()
        assert frame is not None
        assert frame.frame_number == 0

    def test_next(self, replay):
        replay.prepare()
        first = replay.current()
        second = replay.next()

        if second and second.frame_number != first.frame_number:
            assert second.frame_number > first.frame_number

    def test_previous(self, replay):
        replay.prepare()
        replay.seek(1)
        frame = replay.previous()
        assert frame.frame_number == 0

    def test_seek(self, replay):
        replay.prepare()
        frame = replay.seek(2)
        assert frame.frame_number == 2

    def test_get_progress(self, replay):
        replay.prepare()
        progress = replay.get_progress()

        assert "current_frame" in progress
        assert "total_frames" in progress
        assert "progress" in progress


class TestCreateActionHistory:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        history = create_action_history()
        assert isinstance(history, ActionHistory)

    def test_create_with_max_entries(self):
        history = create_action_history(max_entries=500)
        assert history.max_entries == 500


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
