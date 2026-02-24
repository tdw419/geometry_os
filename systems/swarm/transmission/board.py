"""
TransmissionBoard - Shared session storage and claiming mechanism.

Provides a file-based transmission board for P2P mentoring sessions
that can be accessed by multiple agents across worktrees.
Uses fcntl locking for cross-process safety, following TaskBoard pattern.
"""

import json
import os
import fcntl
from pathlib import Path
from typing import List, Optional, Dict, Any, TYPE_CHECKING

from systems.swarm.transmission.types import (
    TransmissionSession,
    TransmissionStatus,
)

if TYPE_CHECKING:
    from systems.swarm.neb_bus import NEBBus


class TransmissionBoard:
    """
    A shared transmission board for mentoring session coordination.

    Uses file-based storage with locking for cross-process safety.
    Each session is stored as a separate JSON file for atomic operations.

    Pattern: Same fcntl locking strategy as TaskBoard.
    """

    def __init__(self, storage_path: str, event_bus: 'NEBBus' = None):
        """
        Initialize transmission board.

        Args:
            storage_path: Directory path for session storage
            event_bus: Optional NEBBus for event publishing
        """
        self.storage_path = Path(storage_path)
        self.storage_path.mkdir(parents=True, exist_ok=True)
        self._lock_path = self.storage_path / ".board.lock"
        self._event_bus = event_bus

    def _acquire_lock(self):
        """Acquire exclusive lock for board operations."""
        lock_file = open(self._lock_path, 'w')
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_EX)
        return lock_file

    def _release_lock(self, lock_file):
        """Release the board lock."""
        fcntl.flock(lock_file.fileno(), fcntl.LOCK_UN)
        lock_file.close()

    def _session_path(self, session_id: str) -> Path:
        """Get file path for a session."""
        return self.storage_path / f"{session_id}.json"

    def post(self, session: TransmissionSession) -> None:
        """
        Post a new session to the board.

        Publishes 'transmission.available' NEB event if event_bus configured.

        Args:
            session: TransmissionSession to post
        """
        lock = self._acquire_lock()
        try:
            path = self._session_path(session.session_id)
            with open(path, 'w') as f:
                f.write(session.to_json())
            # Publish transmission.available event if event bus is configured
            if self._event_bus:
                self._event_bus.publish("transmission.available", {
                    "session_id": session.session_id,
                    "sprout_id": session.sprout_id,
                    "topic": session.topic,
                    "status": session.status.value,
                })
        finally:
            self._release_lock(lock)

    def get(self, session_id: str) -> Optional[TransmissionSession]:
        """
        Get a session by ID.

        Args:
            session_id: Session identifier

        Returns:
            TransmissionSession if found, None otherwise
        """
        path = self._session_path(session_id)
        if not path.exists():
            return None
        with open(path, 'r') as f:
            return TransmissionSession.from_json(f.read())

    def claim(self, session_id: str, scribe_id: str) -> bool:
        """
        Atomically claim a session for a scribe.

        Publishes 'transmission.claimed' NEB event if event_bus configured.

        Args:
            session_id: Session to claim
            scribe_id: Scribe agent claiming the session

        Returns:
            True if claim successful, False if already claimed or not found
        """
        lock = self._acquire_lock()
        try:
            session = self.get(session_id)
            if session is None:
                return False
            if not session.claim(scribe_id):
                return False
            # Write updated session
            path = self._session_path(session_id)
            with open(path, 'w') as f:
                f.write(session.to_json())
            # Publish transmission.claimed event if event bus is configured
            if self._event_bus:
                self._event_bus.publish("transmission.claimed", {
                    "session_id": session_id,
                    "scribe_id": scribe_id,
                    "sprout_id": session.sprout_id,
                    "topic": session.topic,
                })
            return True
        finally:
            self._release_lock(lock)

    def update(self, session: TransmissionSession) -> bool:
        """
        Update an existing session.

        Args:
            session: TransmissionSession with updated data

        Returns:
            True if successful, False if session not found
        """
        lock = self._acquire_lock()
        try:
            path = self._session_path(session.session_id)
            if not path.exists():
                return False
            with open(path, 'w') as f:
                f.write(session.to_json())
            return True
        finally:
            self._release_lock(lock)

    def start(self, session_id: str) -> bool:
        """
        Mark session as active (after covenant signed).

        Publishes 'transmission.started' NEB event if event_bus configured.

        Args:
            session_id: Session to start

        Returns:
            True if successful, False if session not found or wrong state
        """
        lock = self._acquire_lock()
        try:
            session = self.get(session_id)
            if session is None or not session.start():
                return False
            path = self._session_path(session_id)
            with open(path, 'w') as f:
                f.write(session.to_json())
            # Publish transmission.started event if event bus is configured
            if self._event_bus:
                self._event_bus.publish("transmission.started", {
                    "session_id": session_id,
                    "scribe_id": session.scribe_id,
                    "sprout_id": session.sprout_id,
                })
            return True
        finally:
            self._release_lock(lock)

    def complete(self, session_id: str, metrics: Optional[Dict[str, Any]] = None) -> bool:
        """
        Mark session as completed with optional metrics.

        Publishes 'transmission.completed' NEB event if event_bus configured.

        Args:
            session_id: Session to complete
            metrics: Optional completion metrics

        Returns:
            True if successful
        """
        lock = self._acquire_lock()
        try:
            session = self.get(session_id)
            if session is None:
                return False

            if not session.complete(metrics):
                return False

            path = self._session_path(session_id)
            with open(path, 'w') as f:
                f.write(session.to_json())
            # Publish transmission.completed event if event bus is configured
            if self._event_bus:
                self._event_bus.publish("transmission.completed", {
                    "session_id": session_id,
                    "scribe_id": session.scribe_id,
                    "sprout_id": session.sprout_id,
                    "metrics": metrics or {},
                })
            return True
        finally:
            self._release_lock(lock)

    def cancel(self, session_id: str, reason: str = "") -> bool:
        """
        Cancel a session.

        Args:
            session_id: Session to cancel
            reason: Optional cancellation reason

        Returns:
            True if successful
        """
        lock = self._acquire_lock()
        try:
            session = self.get(session_id)
            if session is None:
                return False
            if not session.cancel(reason):
                return False
            path = self._session_path(session_id)
            with open(path, 'w') as f:
                f.write(session.to_json())
            return True
        finally:
            self._release_lock(lock)

    def get_pending(self) -> List[TransmissionSession]:
        """
        Get all pending (unclaimed) sessions.

        Returns:
            List of sessions with PENDING status, sorted by creation time
        """
        sessions = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            try:
                with open(path, 'r') as f:
                    session = TransmissionSession.from_json(f.read())
                    if session.status == TransmissionStatus.PENDING:
                        sessions.append(session)
            except (json.JSONDecodeError, KeyError, ValueError):
                # Skip corrupted session files
                continue
        return sorted(sessions, key=lambda s: s.created_at)

    def get_active_for_scribe(self, scribe_id: str) -> Optional[TransmissionSession]:
        """
        Get the active session for a scribe.

        A scribe can only have one active session at a time.

        Args:
            scribe_id: Scribe agent ID

        Returns:
            Active TransmissionSession if found, None otherwise
        """
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            try:
                with open(path, 'r') as f:
                    session = TransmissionSession.from_json(f.read())
                    if (session.scribe_id == scribe_id and
                        session.status == TransmissionStatus.ACTIVE):
                        return session
            except (json.JSONDecodeError, KeyError, ValueError):
                # Skip corrupted session files
                continue
        return None

    def get_active_for_sprout(self, sprout_id: str) -> Optional[TransmissionSession]:
        """
        Get the active session for a sprout.

        A sprout can only have one active session at a time.

        Args:
            sprout_id: Sprout agent ID

        Returns:
            Active TransmissionSession if found, None otherwise
        """
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            try:
                with open(path, 'r') as f:
                    session = TransmissionSession.from_json(f.read())
                    if (session.sprout_id == sprout_id and
                        session.status in (TransmissionStatus.ACTIVE,
                                          TransmissionStatus.PAUSED,
                                          TransmissionStatus.PENDING)):
                        return session
            except (json.JSONDecodeError, KeyError, ValueError):
                # Skip corrupted session files
                continue
        return None

    def list_all(self) -> List[TransmissionSession]:
        """
        Get all sessions on the board.

        Returns:
            List of all sessions
        """
        sessions = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            try:
                with open(path, 'r') as f:
                    sessions.append(TransmissionSession.from_json(f.read()))
            except (json.JSONDecodeError, KeyError, ValueError):
                # Skip corrupted session files
                continue
        return sorted(sessions, key=lambda s: s.created_at)

    def get_by_status(self, status: TransmissionStatus) -> List[TransmissionSession]:
        """
        Get all sessions with a specific status.

        Args:
            status: TransmissionStatus to filter by

        Returns:
            List of matching sessions
        """
        sessions = []
        for path in self.storage_path.glob("*.json"):
            if path.name == ".board.lock":
                continue
            try:
                with open(path, 'r') as f:
                    session = TransmissionSession.from_json(f.read())
                    if session.status == status:
                        sessions.append(session)
            except (json.JSONDecodeError, KeyError, ValueError):
                # Skip corrupted session files
                continue
        return sorted(sessions, key=lambda s: s.created_at)
