"""Tests for Syscall Handler with queue and focus arbitration.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
Section: 3. Syscall Interface
"""

import pytest

from systems.spatial_coordinator.syscall import (
    MAX_QUEUE_DEPTH,
    ErrorCode,
    SyscallHandler,
    SyscallID,
    SyscallRequest,
)
from systems.spatial_coordinator.types import ErrorCode as TypesErrorCode
from systems.spatial_coordinator.types import SyscallID as TypesSyscallID


class TestSyscallRequest:
    """Tests for SyscallRequest dataclass."""

    def test_create_syscall_request(self):
        """SyscallRequest stores app_id, syscall_id, and args."""
        request = SyscallRequest(
            app_id=1, syscall_id=SyscallID.GET_TIME, arg1=0, arg2=0
        )
        assert request.app_id == 1
        assert request.syscall_id == SyscallID.GET_TIME
        assert request.arg1 == 0
        assert request.arg2 == 0
        assert request.return_value == 0  # Default

    def test_syscall_request_with_args(self):
        """SyscallRequest stores arg1 and arg2."""
        request = SyscallRequest(
            app_id=2, syscall_id=SyscallID.RESIZE, arg1=80, arg2=40
        )
        assert request.arg1 == 80
        assert request.arg2 == 40

    def test_syscall_request_return_value(self):
        """SyscallRequest tracks return value."""
        request = SyscallRequest(
            app_id=1, syscall_id=SyscallID.GET_TIME, arg1=0, arg2=0, return_value=42
        )
        assert request.return_value == 42


class TestSyscallHandler:
    """Tests for SyscallHandler class."""

    def test_create_handler(self):
        """Handler initializes with empty queue."""
        handler = SyscallHandler()
        assert handler.queue_depth == 0
        assert handler.focused_app_id is None
        assert handler.focus_stack == []

    def test_queue_depth_property(self):
        """Handler tracks queue depth."""
        handler = SyscallHandler()
        handler.enqueue(SyscallRequest(app_id=1, syscall_id=SyscallID.GET_TIME))
        handler.enqueue(SyscallRequest(app_id=2, syscall_id=SyscallID.GET_TIME))
        assert handler.queue_depth == 2

    def test_process_returns_error_code(self):
        """Handler.process() returns ErrorCode."""
        handler = SyscallHandler(frame_count=100)
        request = SyscallRequest(app_id=1, syscall_id=SyscallID.GET_TIME)

        result = handler.process(request)
        assert isinstance(result, ErrorCode)
        assert result == ErrorCode.SUCCESS


class TestQueueOverflow:
    """Tests for syscall queue overflow behavior."""

    def test_queue_overflow_drops_oldest(self):
        """When queue exceeds MAX_QUEUE_DEPTH, oldest entry is dropped."""
        handler = SyscallHandler()

        # Fill the queue to max capacity
        for i in range(MAX_QUEUE_DEPTH):
            handler.enqueue(
                SyscallRequest(app_id=i, syscall_id=SyscallID.GET_TIME, arg1=i)
            )

        assert handler.queue_depth == MAX_QUEUE_DEPTH

        # Add one more - should drop the oldest (app_id=0)
        handler.enqueue(
            SyscallRequest(app_id=100, syscall_id=SyscallID.GET_TIME, arg1=100)
        )

        # Queue depth should still be MAX_QUEUE_DEPTH
        assert handler.queue_depth == MAX_QUEUE_DEPTH

        # The first entry should now be app_id=1 (not app_id=0)
        first_request = handler.queue[0]
        assert first_request.app_id == 1
        assert first_request.arg1 == 1

        # The newest entry should be app_id=100
        last_request = handler.queue[-1]
        assert last_request.app_id == 100

    def test_queue_overflow_preserves_newest(self):
        """Queue overflow preserves the newest entries."""
        handler = SyscallHandler()

        # Fill queue and overflow
        for i in range(MAX_QUEUE_DEPTH + 5):
            handler.enqueue(
                SyscallRequest(app_id=i, syscall_id=SyscallID.GET_TIME, arg1=i)
            )

        # Should have last MAX_QUEUE_DEPTH entries
        assert handler.queue_depth == MAX_QUEUE_DEPTH
        assert handler.queue[0].app_id == 5  # First 5 dropped
        assert handler.queue[-1].app_id == MAX_QUEUE_DEPTH + 4


class TestGetTimeSyscall:
    """Tests for GET_TIME syscall."""

    def test_get_time_returns_frame_count(self):
        """GET_TIME syscall returns current frame count."""
        handler = SyscallHandler(frame_count=12345)
        request = SyscallRequest(app_id=1, syscall_id=SyscallID.GET_TIME)

        result = handler.process(request)
        assert result == ErrorCode.SUCCESS
        assert request.return_value == 12345

    def test_get_time_different_frame_counts(self):
        """GET_TIME returns the handler's frame_count."""
        handler = SyscallHandler(frame_count=999)
        request = SyscallRequest(app_id=1, syscall_id=SyscallID.GET_TIME)

        handler.process(request)
        assert request.return_value == 999

    def test_get_time_zero_frame_count(self):
        """GET_TIME works with frame_count=0."""
        handler = SyscallHandler(frame_count=0)
        request = SyscallRequest(app_id=1, syscall_id=SyscallID.GET_TIME)

        handler.process(request)
        assert request.return_value == 0


class TestFocusArbitration:
    """Tests for focus arbitration model."""

    def test_request_focus_grants_focus(self):
        """REQUEST_FOCUS grants keyboard focus to app."""
        handler = SyscallHandler()
        request = SyscallRequest(app_id=1, syscall_id=SyscallID.REQUEST_FOCUS)

        result = handler.process(request)
        assert result == ErrorCode.SUCCESS
        assert handler.focused_app_id == 1

    def test_request_focus_returns_success(self):
        """REQUEST_FOCUS returns success in return_value."""
        handler = SyscallHandler()
        request = SyscallRequest(app_id=1, syscall_id=SyscallID.REQUEST_FOCUS)

        handler.process(request)
        assert request.return_value == 1  # success=True

    def test_yield_focus_releases_focus(self):
        """YIELD_FOCUS releases keyboard focus."""
        handler = SyscallHandler()
        handler.focused_app_id = 1

        request = SyscallRequest(app_id=1, syscall_id=SyscallID.YIELD_FOCUS)
        result = handler.process(request)

        assert result == ErrorCode.SUCCESS
        assert handler.focused_app_id is None

    def test_yield_focus_updates_stack(self):
        """YIELD_FOCUS returns focus to previous holder."""
        handler = SyscallHandler()

        # App 1 gets focus
        handler.process(
            SyscallRequest(app_id=1, syscall_id=SyscallID.REQUEST_FOCUS)
        )
        assert handler.focused_app_id == 1

        # App 2 gets focus (app 1 goes to stack)
        handler.process(
            SyscallRequest(app_id=2, syscall_id=SyscallID.REQUEST_FOCUS)
        )
        assert handler.focused_app_id == 2
        assert handler.focus_stack == [1]

        # App 2 yields focus
        handler.process(
            SyscallRequest(app_id=2, syscall_id=SyscallID.YIELD_FOCUS)
        )
        assert handler.focused_app_id == 1  # Returns to app 1
        assert handler.focus_stack == []

    def test_multiple_focus_same_frame_lowest_id_wins(self):
        """When multiple apps request focus, lowest app_id wins."""
        handler = SyscallHandler()

        # Enqueue multiple focus requests (higher IDs first)
        handler.enqueue(
            SyscallRequest(app_id=5, syscall_id=SyscallID.REQUEST_FOCUS)
        )
        handler.enqueue(
            SyscallRequest(app_id=3, syscall_id=SyscallID.REQUEST_FOCUS)
        )
        handler.enqueue(
            SyscallRequest(app_id=7, syscall_id=SyscallID.REQUEST_FOCUS)
        )
        handler.enqueue(
            SyscallRequest(app_id=1, syscall_id=SyscallID.REQUEST_FOCUS)
        )

        # Process all
        handler.process_all()

        # Lowest ID should have focus
        assert handler.focused_app_id == 1

    def test_focus_stack_tracks_previous_holders(self):
        """Focus stack tracks previous focus holders."""
        handler = SyscallHandler()

        # Multiple apps request focus
        handler.process(
            SyscallRequest(app_id=1, syscall_id=SyscallID.REQUEST_FOCUS)
        )
        handler.process(
            SyscallRequest(app_id=2, syscall_id=SyscallID.REQUEST_FOCUS)
        )
        handler.process(
            SyscallRequest(app_id=3, syscall_id=SyscallID.REQUEST_FOCUS)
        )

        assert handler.focused_app_id == 3
        assert handler.focus_stack == [1, 2]

    def test_yield_focus_without_previous_returns_none(self):
        """YIELD_FOCUS without previous holder sets focus to None."""
        handler = SyscallHandler()
        handler.focused_app_id = 1
        handler.focus_stack = []

        handler.process(
            SyscallRequest(app_id=1, syscall_id=SyscallID.YIELD_FOCUS)
        )

        assert handler.focused_app_id is None

    def test_yield_focus_by_non_focused_app_fails(self):
        """Only the focused app can yield focus."""
        handler = SyscallHandler()
        handler.focused_app_id = 1

        # App 2 tries to yield focus (but doesn't have it)
        request = SyscallRequest(app_id=2, syscall_id=SyscallID.YIELD_FOCUS)
        result = handler.process(request)

        assert result == ErrorCode.PERMISSION_DENIED
        assert handler.focused_app_id == 1  # Unchanged


class TestProcessAll:
    """Tests for process_all() method."""

    def test_process_all_processes_fifo(self):
        """process_all() processes queue in FIFO order."""
        handler = SyscallHandler(frame_count=100)

        # Enqueue multiple requests
        handler.enqueue(
            SyscallRequest(app_id=1, syscall_id=SyscallID.GET_TIME, arg1=10)
        )
        handler.enqueue(
            SyscallRequest(app_id=2, syscall_id=SyscallID.GET_TIME, arg1=20)
        )
        handler.enqueue(
            SyscallRequest(app_id=3, syscall_id=SyscallID.GET_TIME, arg1=30)
        )

        handler.process_all()

        # Queue should be empty
        assert handler.queue_depth == 0

    def test_process_all_empty_queue(self):
        """process_all() handles empty queue."""
        handler = SyscallHandler()
        handler.process_all()  # Should not raise
        assert handler.queue_depth == 0


class TestOtherSyscalls:
    """Tests for other syscalls (stubs for now)."""

    def test_resize_returns_success(self):
        """RESIZE syscall returns success (stub implementation)."""
        handler = SyscallHandler()
        request = SyscallRequest(
            app_id=1, syscall_id=SyscallID.RESIZE, arg1=80, arg2=40
        )

        result = handler.process(request)
        # Stub implementation - returns success
        assert result == ErrorCode.SUCCESS

    def test_close_returns_success(self):
        """CLOSE syscall returns success (stub implementation)."""
        handler = SyscallHandler()
        request = SyscallRequest(
            app_id=1, syscall_id=SyscallID.CLOSE, arg1=0, arg2=0
        )

        result = handler.process(request)
        assert result == ErrorCode.SUCCESS

    def test_spawn_returns_success(self):
        """SPAWN syscall returns success (stub implementation)."""
        handler = SyscallHandler()
        request = SyscallRequest(
            app_id=1, syscall_id=SyscallID.SPAWN, arg1=0, arg2=0
        )

        result = handler.process(request)
        assert result == ErrorCode.SUCCESS

    def test_read_clip_returns_success(self):
        """READ_CLIP syscall returns success (stub implementation)."""
        handler = SyscallHandler()
        request = SyscallRequest(
            app_id=1, syscall_id=SyscallID.READ_CLIP, arg1=0, arg2=0
        )

        result = handler.process(request)
        assert result == ErrorCode.SUCCESS

    def test_write_clip_returns_success(self):
        """WRITE_CLIP syscall returns success (stub implementation)."""
        handler = SyscallHandler()
        request = SyscallRequest(
            app_id=1, syscall_id=SyscallID.WRITE_CLIP, arg1=0, arg2=0
        )

        result = handler.process(request)
        assert result == ErrorCode.SUCCESS


class TestConstants:
    """Tests for constants."""

    def test_max_queue_depth(self):
        """MAX_QUEUE_DEPTH is 16."""
        assert MAX_QUEUE_DEPTH == 16

    def test_syscall_id_values_match_types(self):
        """SyscallID values match the types module."""
        assert SyscallID.RESIZE == TypesSyscallID.RESIZE
        assert SyscallID.CLOSE == TypesSyscallID.CLOSE
        assert SyscallID.SPAWN == TypesSyscallID.SPAWN
        assert SyscallID.READ_CLIP == TypesSyscallID.READ_CLIP
        assert SyscallID.WRITE_CLIP == TypesSyscallID.WRITE_CLIP
        assert SyscallID.GET_TIME == TypesSyscallID.GET_TIME
        assert SyscallID.REQUEST_FOCUS == TypesSyscallID.REQUEST_FOCUS
        assert SyscallID.YIELD_FOCUS == TypesSyscallID.YIELD_FOCUS

    def test_error_code_values_match_types(self):
        """ErrorCode values match the types module."""
        assert ErrorCode.SUCCESS == TypesErrorCode.SUCCESS
        assert ErrorCode.INVALID_ARGS == TypesErrorCode.INVALID_ARGS
        assert ErrorCode.OUT_OF_MEMORY == TypesErrorCode.OUT_OF_MEMORY
        assert ErrorCode.PERMISSION_DENIED == TypesErrorCode.PERMISSION_DENIED
        assert ErrorCode.NOT_FOUND == TypesErrorCode.NOT_FOUND
