"""
Tests for AxionCore - the focal point at (0,0) for self-improvement targeting.

Task 3 of Recursive Self-Improvement Swarm specification.
"""

import pytest
from dataclasses import dataclass, field
from typing import Any, Optional
from queue import PriorityQueue
import time


# Import the module under test (will fail initially, that's TDD)
from systems.visual_shell.swarm.evolution.axion_core import (
    AxionTarget,
    AxionCore,
)


class TestAxionCoreInitialization:
    """Test 1: AxionCore initializes with no target and empty priority queue"""

    def test_initializes_with_no_target(self):
        """AxionCore should start with no active target."""
        core = AxionCore()
        assert core.current_target is None

    def test_initializes_with_empty_priority_queue(self):
        """AxionCore should start with an empty candidate queue."""
        core = AxionCore()
        assert core.candidate_count() == 0

    def test_initializes_with_empty_protected_files(self):
        """AxionCore should start with no protected files unless specified."""
        core = AxionCore()
        assert len(core.protected_files) == 0


class TestAxionCoreProtectedFiles:
    """Test 2: AxionCore accepts protected_files list"""

    def test_accepts_protected_files_list(self):
        """AxionCore should accept a list of protected files on init."""
        protected = [
            "/critical/system.py",
            "/critical/safety.py",
        ]
        core = AxionCore(protected_files=protected)
        assert len(core.protected_files) == 2
        assert "/critical/system.py" in core.protected_files

    def test_protected_files_can_be_added_later(self):
        """Protected files should be addable after initialization."""
        core = AxionCore()
        core.add_protected_file("/critical/new.py")
        assert "/critical/new.py" in core.protected_files

    def test_protected_files_can_be_removed(self):
        """Protected files should be removable."""
        core = AxionCore(protected_files=["/critical/file.py"])
        core.remove_protected_file("/critical/file.py")
        assert "/critical/file.py" not in core.protected_files


class TestAxionCoreSelectTarget:
    """Tests 3-5: select_target() behavior"""

    def test_select_target_returns_highest_value_file(self):
        """Test 3: select_target() returns highest-value file."""
        core = AxionCore()

        # Add candidates with different value scores
        core.add_candidate("/low_value.py", value_score=10)
        core.add_candidate("/high_value.py", value_score=100)
        core.add_candidate("/medium_value.py", value_score=50)

        target = core.select_target()
        assert target is not None
        assert target.file_path == "/high_value.py"
        assert target.value_score == 100

    def test_select_target_skips_protected_files(self):
        """Test 4: select_target() skips protected files."""
        core = AxionCore(protected_files=["/protected_high.py"])

        core.add_candidate("/protected_high.py", value_score=100)
        core.add_candidate("/normal.py", value_score=50)
        core.add_candidate("/low.py", value_score=10)

        target = core.select_target()
        assert target is not None
        assert target.file_path == "/normal.py"
        assert target.value_score == 50

    def test_select_target_returns_none_when_no_candidates(self):
        """Test 5: select_target() returns None when no candidates."""
        core = AxionCore()
        target = core.select_target()
        assert target is None

    def test_select_target_returns_none_when_only_protected_candidates(self):
        """select_target() returns None if only protected files are candidates."""
        core = AxionCore(protected_files=["/protected.py"])
        core.add_candidate("/protected.py", value_score=100)

        target = core.select_target()
        assert target is None

    def test_select_target_sets_current_target(self):
        """select_target() should set the current_target attribute."""
        core = AxionCore()
        core.add_candidate("/target.py", value_score=50)

        target = core.select_target()
        assert core.current_target == target

    def test_select_target_uses_priority_queue_ordering(self):
        """select_target() should use priority queue (highest value first)."""
        core = AxionCore()

        # Add in random order
        core.add_candidate("/file_a.py", value_score=30)
        core.add_candidate("/file_b.py", value_score=90)
        core.add_candidate("/file_c.py", value_score=60)
        core.add_candidate("/file_d.py", value_score=15)

        # Should always get highest value first
        target = core.select_target()
        assert target.value_score == 90

    def test_select_target_with_metadata(self):
        """Candidates can include metadata that's preserved in target."""
        core = AxionCore()
        core.add_candidate(
            "/file.py",
            value_score=75,
            reason="high_complexity",
            suggestions=["refactor", "optimize"],
        )

        target = core.select_target()
        assert target is not None
        assert target.metadata.get("reason") == "high_complexity"
        assert "refactor" in target.metadata.get("suggestions", [])


class TestAxionCoreCompleteTarget:
    """Tests 6-7: complete_target() behavior"""

    def test_complete_target_removes_from_queue(self):
        """Test 6: complete_target() removes from queue."""
        core = AxionCore()
        core.add_candidate("/done.py", value_score=50)
        core.add_candidate("/next.py", value_score=30)

        # Select and complete
        core.select_target()
        core.complete_target("/done.py", improvement_delta=0.25)

        # Verify removed
        assert core.candidate_count() == 1
        target = core.select_target()
        assert target.file_path == "/next.py"

    def test_complete_target_emits_event(self):
        """Test 7: complete_target() emits event with type='target_completed'."""
        core = AxionCore()
        core.add_candidate("/done.py", value_score=50)
        core.select_target()

        # Track events
        events = []
        core.on_event = lambda e: events.append(e)

        core.complete_target("/done.py", improvement_delta=0.25)

        assert len(events) == 1
        event = events[0]
        assert event["type"] == "target_completed"
        assert event["file_path"] == "/done.py"
        assert event["improvement_delta"] == 0.25

    def test_complete_target_clears_current_target(self):
        """complete_target() should clear the current_target."""
        core = AxionCore()
        core.add_candidate("/done.py", value_score=50)

        core.select_target()
        assert core.current_target is not None

        core.complete_target("/done.py", improvement_delta=0.1)
        assert core.current_target is None

    def test_complete_target_records_improvement(self):
        """complete_target() should record the improvement delta."""
        core = AxionCore()
        core.add_candidate("/file.py", value_score=50)
        core.select_target()

        core.complete_target("/file.py", improvement_delta=0.5)

        # Check improvement history
        assert len(core.improvement_history) == 1
        record = core.improvement_history[0]
        assert record["file_path"] == "/file.py"
        assert record["delta"] == 0.5


class TestAxionTargetDataclass:
    """Tests for AxionTarget dataclass"""

    def test_axion_target_creation(self):
        """AxionTarget should store all required fields."""
        target = AxionTarget(
            file_path="/test.py",
            value_score=75,
            protected=False,
            metadata={"reason": "test"},
        )
        assert target.file_path == "/test.py"
        assert target.value_score == 75
        assert target.protected is False
        assert target.metadata["reason"] == "test"

    def test_axion_target_default_values(self):
        """AxionTarget should have sensible defaults."""
        target = AxionTarget(file_path="/test.py", value_score=50)
        assert target.protected is False
        assert target.metadata == {}

    def test_axion_target_comparison(self):
        """AxionTarget should be comparable by value_score for priority queue."""
        high = AxionTarget(file_path="/high.py", value_score=100)
        low = AxionTarget(file_path="/low.py", value_score=10)

        # Higher value should be "less than" for max-heap behavior
        # (Python's PriorityQueue is a min-heap, so we negate)
        assert high < low  # In terms of priority, high comes first


class TestAxionCoreRemoveCandidate:
    """Test remove_candidate functionality"""

    def test_remove_candidate_removes_from_queue(self):
        """remove_candidate() should remove a candidate from the queue."""
        core = AxionCore()
        core.add_candidate("/remove_me.py", value_score=50)
        core.add_candidate("/keep_me.py", value_score=30)

        core.remove_candidate("/remove_me.py")

        assert core.candidate_count() == 1
        target = core.select_target()
        assert target.file_path == "/keep_me.py"

    def test_remove_candidate_on_nonexistent_does_not_error(self):
        """remove_candidate() on non-existent file should not error."""
        core = AxionCore()
        # Should not raise
        core.remove_candidate("/nonexistent.py")
        assert core.candidate_count() == 0


class TestAxionCoreIntegration:
    """Integration tests for AxionCore workflow"""

    def test_full_targeting_workflow(self):
        """Test a complete workflow: add -> select -> complete."""
        core = AxionCore(protected_files=["/protected.py"])

        # Add candidates
        core.add_candidate("/protected.py", value_score=100, reason="protected")
        core.add_candidate("/normal1.py", value_score=60, reason="good candidate")
        core.add_candidate("/normal2.py", value_score=40, reason="ok candidate")

        # Select - should skip protected
        target1 = core.select_target()
        assert target1.file_path == "/normal1.py"

        # Complete first target
        events = []
        core.on_event = lambda e: events.append(e)
        core.complete_target("/normal1.py", improvement_delta=0.3)

        # Verify event
        assert events[0]["type"] == "target_completed"

        # Select next - should get the remaining one
        target2 = core.select_target()
        assert target2.file_path == "/normal2.py"

    def test_multiple_candidates_same_value(self):
        """Test handling of candidates with equal value scores."""
        core = AxionCore()

        core.add_candidate("/file_a.py", value_score=50)
        core.add_candidate("/file_b.py", value_score=50)
        core.add_candidate("/file_c.py", value_score=50)

        # Should get one of them (deterministic by file_path as tiebreaker)
        target = core.select_target()
        assert target.value_score == 50
        assert target.file_path in ["/file_a.py", "/file_b.py", "/file_c.py"]
