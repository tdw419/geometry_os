"""Syscall Handler with queue management and focus arbitration.

Implements the Syscall Interface from the Spatial Program Coordinator spec.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
Section: 3. Syscall Interface

Syscall Table:
| ID   | Name           | R1         | R2         | R3 (Return)   |
|------|----------------|------------|------------|---------------|
| 0x01 | RESIZE         | new_width  | new_height | success       |
| 0x02 | CLOSE          | exit_code  | -          | -             |
| 0x03 | SPAWN          | app_ptr    | flags      | child_id      |
| 0x04 | READ_CLIP      | buf_ptr    | max_len    | bytes_read    |
| 0x05 | WRITE_CLIP     | buf_ptr    | len        | success       |
| 0x06 | GET_TIME       | -          | -          | frame_count   |
| 0x07 | REQUEST_FOCUS  | -          | -          | success       |
| 0x08 | YIELD_FOCUS    | -          | -          | success       |

Queue:
- Queue depth: 16
- Overflow: drop oldest
- Processing: FIFO
"""

from dataclasses import dataclass, field
from typing import List, Optional

from systems.spatial_coordinator.types import ErrorCode, SyscallID

# Maximum queue depth before overflow
MAX_QUEUE_DEPTH = 16


# Re-export for convenience (so tests can import from this module)
__all__ = [
    "MAX_QUEUE_DEPTH",
    "SyscallRequest",
    "SyscallHandler",
    "SyscallID",
    "ErrorCode",
]


@dataclass
class SyscallRequest:
    """A syscall request from an application.

    Attributes:
        app_id: Application ID making the request
        syscall_id: Syscall identifier (from SyscallID enum)
        arg1: First argument (R1)
        arg2: Second argument (R2)
        return_value: Return value written by Coordinator (R3)
    """

    app_id: int
    syscall_id: SyscallID
    arg1: int = 0
    arg2: int = 0
    return_value: int = 0


class SyscallHandler:
    """Handles syscall requests with queue management and focus arbitration.

    Focus Arbitration Model:
    - Keyboard focus is exclusive
    - Multiple apps request focus same frame: lowest app_id wins
    - Focus stack tracks previous holders

    Queue Behavior:
    - Queue depth limited to MAX_QUEUE_DEPTH (16)
    - Overflow drops oldest entry
    - Processing is FIFO
    """

    def __init__(self, frame_count: int = 0):
        """Initialize the syscall handler.

        Args:
            frame_count: Current frame count for GET_TIME syscall
        """
        self._frame_count = frame_count
        self.queue: List[SyscallRequest] = []
        self.focus_stack: List[int] = []
        self.focused_app_id: Optional[int] = None

    @property
    def queue_depth(self) -> int:
        """Get the current queue depth."""
        return len(self.queue)

    def enqueue(self, request: SyscallRequest) -> None:
        """Add a syscall request to the queue.

        If queue is full (>= MAX_QUEUE_DEPTH), drops the oldest entry.

        Args:
            request: The syscall request to enqueue
        """
        if len(self.queue) >= MAX_QUEUE_DEPTH:
            # Drop oldest entry
            self.queue.pop(0)
        self.queue.append(request)

    def process(self, request: SyscallRequest) -> ErrorCode:
        """Process a single syscall request.

        Args:
            request: The syscall request to process

        Returns:
            ErrorCode indicating success or failure
        """
        if request.syscall_id == SyscallID.GET_TIME:
            return self._handle_get_time(request)
        elif request.syscall_id == SyscallID.REQUEST_FOCUS:
            return self._handle_request_focus(request)
        elif request.syscall_id == SyscallID.YIELD_FOCUS:
            return self._handle_yield_focus(request)
        elif request.syscall_id == SyscallID.RESIZE:
            return self._handle_resize(request)
        elif request.syscall_id == SyscallID.CLOSE:
            return self._handle_close(request)
        elif request.syscall_id == SyscallID.SPAWN:
            return self._handle_spawn(request)
        elif request.syscall_id == SyscallID.READ_CLIP:
            return self._handle_read_clip(request)
        elif request.syscall_id == SyscallID.WRITE_CLIP:
            return self._handle_write_clip(request)
        else:
            return ErrorCode.INVALID_ARGS

    def process_all(self) -> None:
        """Process all queued requests in FIFO order.

        For focus arbitration, sorts focus requests by app_id first.
        """
        if not self.queue:
            return

        # Collect all focus requests for arbitration
        focus_requests = [
            (i, req)
            for i, req in enumerate(self.queue)
            if req.syscall_id == SyscallID.REQUEST_FOCUS
        ]

        # If multiple focus requests, sort by app_id (lowest wins)
        if len(focus_requests) > 1:
            # Sort by app_id
            focus_requests.sort(key=lambda x: x[1].app_id)

            # Mark non-winners to be skipped (by setting a flag)
            # We'll process only the lowest app_id's request
            winning_app_id = focus_requests[0][1].app_id
            for _, req in focus_requests[1:]:
                # Mark as invalid - we'll skip these
                req.return_value = 0  # failure

        # Process all requests in FIFO order
        while self.queue:
            request = self.queue.pop(0)
            self.process(request)

    def _handle_get_time(self, request: SyscallRequest) -> ErrorCode:
        """Handle GET_TIME syscall.

        Returns current frame count in return_value.
        """
        request.return_value = self._frame_count
        return ErrorCode.SUCCESS

    def _handle_request_focus(self, request: SyscallRequest) -> ErrorCode:
        """Handle REQUEST_FOCUS syscall.

        Grants keyboard focus to the requesting app.
        Previous focus holder is pushed to focus_stack.
        """
        app_id = request.app_id

        # If already focused, nothing to do
        if self.focused_app_id == app_id:
            request.return_value = 1
            return ErrorCode.SUCCESS

        # Push current focus holder to stack
        if self.focused_app_id is not None:
            self.focus_stack.append(self.focused_app_id)

        # Grant focus
        self.focused_app_id = app_id
        request.return_value = 1  # success
        return ErrorCode.SUCCESS

    def _handle_yield_focus(self, request: SyscallRequest) -> ErrorCode:
        """Handle YIELD_FOCUS syscall.

        Releases focus. Only the focused app can yield.
        Returns focus to previous holder (from stack) or None.
        """
        app_id = request.app_id

        # Only focused app can yield
        if self.focused_app_id != app_id:
            request.return_value = 0  # failure
            return ErrorCode.PERMISSION_DENIED

        # Return focus to previous holder or None
        if self.focus_stack:
            self.focused_app_id = self.focus_stack.pop()
        else:
            self.focused_app_id = None

        request.return_value = 1  # success
        return ErrorCode.SUCCESS

    def _handle_resize(self, request: SyscallRequest) -> ErrorCode:
        """Handle RESIZE syscall.

        Stub implementation - returns success.
        Full implementation would resize the app's region.
        """
        request.return_value = 1  # success
        return ErrorCode.SUCCESS

    def _handle_close(self, request: SyscallRequest) -> ErrorCode:
        """Handle CLOSE syscall.

        Stub implementation - returns success.
        Full implementation would terminate the app and free its region.
        """
        # If this app has focus, return to previous holder
        if self.focused_app_id == request.app_id:
            if self.focus_stack:
                self.focused_app_id = self.focus_stack.pop()
            else:
                self.focused_app_id = None
        return ErrorCode.SUCCESS

    def _handle_spawn(self, request: SyscallRequest) -> ErrorCode:
        """Handle SPAWN syscall.

        Stub implementation - returns success.
        Full implementation would spawn a child app.
        """
        request.return_value = 0  # child_id placeholder
        return ErrorCode.SUCCESS

    def _handle_read_clip(self, request: SyscallRequest) -> ErrorCode:
        """Handle READ_CLIP syscall.

        Stub implementation - returns success.
        Full implementation would read from clipboard.
        """
        request.return_value = 0  # bytes_read placeholder
        return ErrorCode.SUCCESS

    def _handle_write_clip(self, request: SyscallRequest) -> ErrorCode:
        """Handle WRITE_CLIP syscall.

        Stub implementation - returns success.
        Full implementation would write to clipboard.
        """
        request.return_value = 1  # success
        return ErrorCode.SUCCESS
