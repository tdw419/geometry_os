"""
Action History - Phase 39

Visual trail of all autonomous actions taken by the system.

Usage:
    from systems.visual_shell.action_history import (
        ActionHistory,
        ActionTrail,
        ActionReplay,
        create_action_history,
    )

    history = ActionHistory()
    history.record(action)

    # Get trail visualization
    trail = history.get_trail()
    for step in trail:
        print(f"{step.timestamp}: {step.action_type} on {step.peer_id}")
"""

import logging
import time
import uuid
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

logger = logging.getLogger("ActionHistory")


class TrailStepType(Enum):
    """Types of trail visualization steps."""
    START = "start"
    ACTION = "action"
    TRANSITION = "transition"
    END = "end"


@dataclass
class HistoryEntry:
    """A recorded action in history."""
    entry_id: str
    action_id: str
    action_type: str
    peer_id: str | None
    container_id: str | None
    target_peer_id: str | None
    reason: str
    confidence: float
    success: bool
    created_at: float
    executed_at: float | None
    duration_ms: float | None = None
    error_message: str | None = None
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class TrailStep:
    """A step in the action trail visualization."""
    step_id: str
    step_type: TrailStepType
    entry: HistoryEntry | None
    timestamp: float
    message: str
    peer_from: str | None = None
    peer_to: str | None = None
    highlight_peers: list[str] = field(default_factory=list)


@dataclass
class ReplayFrame:
    """A frame in the action replay."""
    frame_id: str
    frame_number: int
    timestamp: float
    entries: list[HistoryEntry]
    state_snapshot: dict[str, Any]
    message: str


class ActionHistory:
    """
    Stores and manages history of autonomous actions.

    Provides:
    - Chronological storage of all actions
    - Filtering by peer, type, success, time range
    - Trail visualization for the mesh
    - Replay capability for debugging
    """

    def __init__(self, max_entries: int = 10000):
        self.max_entries = max_entries
        self._entries: list[HistoryEntry] = []
        self._by_peer: dict[str, list[str]] = defaultdict(list)
        self._by_type: dict[str, list[str]] = defaultdict(list)
        self._callbacks: dict[str, list[Callable]] = defaultdict(list)

    def record(self, action) -> HistoryEntry:
        """Record an action in history."""
        # Extract action_type, handling enum values
        action_type_raw = getattr(action, "action_type", "unknown")
        if hasattr(action_type_raw, "value"):
            action_type = action_type_raw.value
        else:
            action_type = str(action_type_raw)

        entry = HistoryEntry(
            entry_id=str(uuid.uuid4()),
            action_id=getattr(action, "action_id", str(uuid.uuid4())),
            action_type=action_type,
            peer_id=getattr(action, "peer_id", None),
            container_id=getattr(action, "container_id", None),
            target_peer_id=getattr(action, "target_peer_id", None),
            reason=getattr(action, "reason", ""),
            confidence=getattr(action, "confidence", 0.0),
            success=getattr(action, "success", False) or False,
            created_at=getattr(action, "created_at", time.time()),
            executed_at=getattr(action, "executed_at", None),
            error_message=getattr(action, "error_message", None),
        )

        # Calculate duration
        if entry.executed_at and entry.created_at:
            entry.duration_ms = (entry.executed_at - entry.created_at) * 1000

        self._entries.append(entry)

        # Index by peer and type
        if entry.peer_id:
            self._by_peer[entry.peer_id].append(entry.entry_id)
        self._by_type[entry.action_type].append(entry.entry_id)

        # Trim if needed
        while len(self._entries) > self.max_entries:
            removed = self._entries.pop(0)
            if removed.peer_id and removed.entry_id in self._by_peer.get(removed.peer_id, []):
                self._by_peer[removed.peer_id].remove(removed.entry_id)
            if removed.entry_id in self._by_type.get(removed.action_type, []):
                self._by_type[removed.action_type].remove(removed.entry_id)

        # Notify callbacks
        for callback in self._callbacks.get("record", []):
            try:
                callback(entry)
            except Exception as e:
                logger.warning(f"Callback error: {e}")

        return entry

    def get_entries(
        self,
        peer_id: str | None = None,
        action_type: str | None = None,
        success_only: bool = False,
        failed_only: bool = False,
        since: float | None = None,
        until: float | None = None,
        limit: int = 100,
    ) -> list[HistoryEntry]:
        """Get entries with optional filtering."""
        entries = self._entries

        if peer_id:
            entry_ids = set(self._by_peer.get(peer_id, []))
            entries = [e for e in entries if e.entry_id in entry_ids]

        if action_type:
            entry_ids = set(self._by_type.get(action_type, []))
            entries = [e for e in entries if e.entry_id in entry_ids]

        if success_only:
            entries = [e for e in entries if e.success]

        if failed_only:
            entries = [e for e in entries if not e.success]

        if since is not None:
            entries = [e for e in entries if e.created_at >= since]

        if until is not None:
            entries = [e for e in entries if e.created_at <= until]

        return entries[-limit:]

    def get_entry(self, entry_id: str) -> HistoryEntry | None:
        """Get a specific entry by ID."""
        for entry in self._entries:
            if entry.entry_id == entry_id:
                return entry
        return None

    def get_stats(self) -> dict[str, Any]:
        """Get history statistics."""
        total = len(self._entries)
        successful = sum(1 for e in self._entries if e.success)
        failed = total - successful

        by_type: dict[str, int] = defaultdict(int)
        for entry in self._entries:
            by_type[entry.action_type] += 1

        avg_confidence = (
            sum(e.confidence for e in self._entries) / total
            if total > 0 else 0.0
        )

        return {
            "total_entries": total,
            "successful": successful,
            "failed": failed,
            "success_rate": successful / total if total > 0 else 0.0,
            "by_type": dict(by_type),
            "average_confidence": avg_confidence,
            "oldest_entry": self._entries[0].created_at if self._entries else None,
            "newest_entry": self._entries[-1].created_at if self._entries else None,
        }

    def clear(self):
        """Clear all history."""
        self._entries.clear()
        self._by_peer.clear()
        self._by_type.clear()

    def on_record(self, callback: Callable):
        """Register callback for record events."""
        self._callbacks["record"].append(callback)


class ActionTrail:
    """
    Visualizes the action sequence on the mesh.

    Converts history entries into a visual trail showing
    the flow of actions across peers.
    """

    def __init__(self, history: ActionHistory):
        self.history = history

    def get_trail(
        self,
        since: float | None = None,
        until: float | None = None,
        limit: int = 50,
    ) -> list[TrailStep]:
        """Get the action trail as visualization steps."""
        entries = self.history.get_entries(
            since=since,
            until=until,
            limit=limit,
        )

        steps: list[TrailStep] = []

        if not entries:
            return steps

        # Start marker
        steps.append(TrailStep(
            step_id=str(uuid.uuid4()),
            step_type=TrailStepType.START,
            entry=None,
            timestamp=entries[0].created_at,
            message="Action trail start",
        ))

        for i, entry in enumerate(entries):
            # Action step
            step_msg = self._format_step_message(entry)
            highlight = []
            if entry.peer_id:
                highlight.append(entry.peer_id)
            if entry.target_peer_id:
                highlight.append(entry.target_peer_id)

            steps.append(TrailStep(
                step_id=str(uuid.uuid4()),
                step_type=TrailStepType.ACTION,
                entry=entry,
                timestamp=entry.created_at,
                message=step_msg,
                peer_from=entry.peer_id,
                peer_to=entry.target_peer_id,
                highlight_peers=highlight,
            ))

            # Transition to next if exists
            if i < len(entries) - 1:
                next_entry = entries[i + 1]
                if entry.target_peer_id == next_entry.peer_id:
                    steps.append(TrailStep(
                        step_id=str(uuid.uuid4()),
                        step_type=TrailStepType.TRANSITION,
                        entry=None,
                        timestamp=next_entry.created_at,
                        message=f"Chain: {entry.target_peer_id} → {next_entry.action_type}",
                        peer_from=entry.target_peer_id,
                        peer_to=next_entry.peer_id,
                    ))

        # End marker
        steps.append(TrailStep(
            step_id=str(uuid.uuid4()),
            step_type=TrailStepType.END,
            entry=None,
            timestamp=entries[-1].created_at,
            message="Action trail end",
        ))

        return steps

    def _format_step_message(self, entry: HistoryEntry) -> str:
        """Format a step message for display."""
        status = "✓" if entry.success else "✗"
        action = entry.action_type.replace("_", " ").title()

        parts = [f"{status} {action}"]

        if entry.peer_id:
            parts.append(f"peer={entry.peer_id}")
        if entry.container_id:
            parts.append(f"container={entry.container_id[:8]}")
        if entry.target_peer_id:
            parts.append(f"→ {entry.target_peer_id}")

        return " ".join(parts)

    def get_peer_timeline(self, peer_id: str) -> list[TrailStep]:
        """Get timeline of actions for a specific peer."""
        entries = self.history.get_entries(peer_id=peer_id, limit=100)
        steps: list[TrailStep] = []

        for entry in entries:
            steps.append(TrailStep(
                step_id=str(uuid.uuid4()),
                step_type=TrailStepType.ACTION,
                entry=entry,
                timestamp=entry.created_at,
                message=self._format_step_message(entry),
                highlight_peers=[peer_id],
            ))

        return steps


class ActionReplay:
    """
    Allows stepping through past actions for debugging.

    Provides frame-by-frame replay of action history
    with state snapshots.
    """

    def __init__(self, history: ActionHistory):
        self.history = history
        self._current_frame = 0
        self._frames: list[ReplayFrame] = []

    def prepare(self, since: float | None = None, until: float | None = None):
        """Prepare replay frames from history."""
        entries = self.history.get_entries(
            since=since,
            until=until,
            limit=1000,
        )

        self._frames = []
        self._current_frame = 0

        # Group entries by time windows (1 second each)
        windows: dict[int, list[HistoryEntry]] = defaultdict(list)

        for entry in entries:
            window = int(entry.created_at)
            windows[window].append(entry)

        for i, (timestamp, window_entries) in enumerate(sorted(windows.items())):
            self._frames.append(ReplayFrame(
                frame_id=str(uuid.uuid4()),
                frame_number=i,
                timestamp=timestamp,
                entries=window_entries,
                state_snapshot=self._create_snapshot(window_entries),
                message=f"Frame {i}: {len(window_entries)} action(s)",
            ))

        return len(self._frames)

    def _create_snapshot(self, entries: list[HistoryEntry]) -> dict[str, Any]:
        """Create a state snapshot for a frame."""
        peer_states: dict[str, dict[str, Any]] = {}

        for entry in entries:
            if entry.peer_id:
                if entry.peer_id not in peer_states:
                    peer_states[entry.peer_id] = {
                        "actions": 0,
                        "migrations_in": 0,
                        "migrations_out": 0,
                    }
                peer_states[entry.peer_id]["actions"] += 1

            if entry.target_peer_id:
                if entry.target_peer_id not in peer_states:
                    peer_states[entry.target_peer_id] = {
                        "actions": 0,
                        "migrations_in": 0,
                        "migrations_out": 0,
                    }
                peer_states[entry.target_peer_id]["migrations_in"] += 1

        return {
            "peer_states": peer_states,
            "total_actions": len(entries),
        }

    def get_frame(self, frame_number: int) -> ReplayFrame | None:
        """Get a specific frame."""
        if 0 <= frame_number < len(self._frames):
            return self._frames[frame_number]
        return None

    def current(self) -> ReplayFrame | None:
        """Get current frame."""
        return self.get_frame(self._current_frame)

    def next(self) -> ReplayFrame | None:
        """Advance to next frame."""
        if self._current_frame < len(self._frames) - 1:
            self._current_frame += 1
        return self.current()

    def previous(self) -> ReplayFrame | None:
        """Go to previous frame."""
        if self._current_frame > 0:
            self._current_frame -= 1
        return self.current()

    def seek(self, frame_number: int) -> ReplayFrame | None:
        """Seek to a specific frame."""
        if 0 <= frame_number < len(self._frames):
            self._current_frame = frame_number
        return self.current()

    def get_progress(self) -> dict[str, Any]:
        """Get replay progress."""
        total = len(self._frames)
        return {
            "current_frame": self._current_frame,
            "total_frames": total,
            "progress": self._current_frame / total if total > 0 else 0.0,
            "has_next": self._current_frame < total - 1,
            "has_previous": self._current_frame > 0,
        }


def create_action_history(max_entries: int = 10000) -> ActionHistory:
    """Factory function to create an ActionHistory."""
    return ActionHistory(max_entries=max_entries)
