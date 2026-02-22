"""
Unit tests for SessionManager - Session lifecycle management.
Tests creation, retrieval, destruction, stale cleanup, and max session limits.
"""

import pytest
import asyncio
import time
import sys
import os
from unittest.mock import AsyncMock, MagicMock

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from systems.desktop_agent.session_manager import SessionManager, DesktopSession


class MockBackend:
    """Mock backend for testing without real X11/display."""

    def __init__(self):
        self.disconnected = False
        self.disconnect_called_count = 0

    async def disconnect(self) -> bool:
        """Mock disconnect method."""
        self.disconnected = True
        self.disconnect_called_count += 1
        return True


class TestSessionManagerInit:
    """Test SessionManager initialization."""

    def test_init_creates_manager(self):
        """SessionManager can be instantiated."""
        manager = SessionManager()
        assert manager is not None

    def test_init_empty_sessions(self):
        """SessionManager starts with empty sessions dict."""
        manager = SessionManager()
        assert manager.sessions == {}

    def test_max_sessions_constant(self):
        """MAX_SESSIONS is defined as 5."""
        assert SessionManager.MAX_SESSIONS == 5

    def test_stale_timeout_constant(self):
        """STALE_TIMEOUT is 600 seconds (10 minutes)."""
        assert SessionManager.STALE_TIMEOUT == 600


class TestSessionCreation:
    """Test session creation functionality."""

    @pytest.fixture
    def manager(self):
        return SessionManager()

    @pytest.fixture
    def mock_backend(self):
        return MockBackend()

    def test_create_single_session(self, manager, mock_backend):
        """Can create a single session."""
        session = manager.create("local", mock_backend)

        assert session is not None
        assert session.id in manager.sessions
        assert session.backend_type == "local"
        assert session.backend == mock_backend
        assert session.track_claimed is False

    def test_create_session_with_track_claimed(self, manager, mock_backend):
        """Can create session with track_claimed=True."""
        session = manager.create("local", mock_backend, track_claimed=True)

        assert session.track_claimed is True

    def test_create_session_generates_unique_ids(self, manager, mock_backend):
        """Each session gets a unique ID."""
        session1 = manager.create("local", mock_backend)
        session2 = manager.create("local", mock_backend)

        assert session1.id != session2.id

    def test_create_session_sets_timestamps(self, manager, mock_backend):
        """Session has created_at and last_activity timestamps."""
        before = time.time()
        session = manager.create("local", mock_backend)
        after = time.time()

        assert before <= session.created_at <= after
        assert before <= session.last_activity <= after

    def test_create_session_different_backend_types(self, manager, mock_backend):
        """Can create sessions with different backend types."""
        local_session = manager.create("local", mock_backend)
        vnc_session = manager.create("vnc", mock_backend)

        assert local_session.backend_type == "local"
        assert vnc_session.backend_type == "vnc"

    def test_create_max_sessions_allowed(self, manager, mock_backend):
        """Can create exactly MAX_SESSIONS sessions."""
        sessions = []
        for i in range(SessionManager.MAX_SESSIONS):
            session = manager.create("local", mock_backend)
            sessions.append(session)

        assert len(manager.sessions) == SessionManager.MAX_SESSIONS

    def test_create_exceeds_max_raises_error(self, manager, mock_backend):
        """Creating more than MAX_SESSIONS raises RuntimeError."""
        # Create max sessions
        for i in range(SessionManager.MAX_SESSIONS):
            manager.create("local", mock_backend)

        # Attempt to create one more should raise
        with pytest.raises(RuntimeError) as exc_info:
            manager.create("local", mock_backend)

        assert "Max sessions limit reached" in str(exc_info.value)
        assert str(SessionManager.MAX_SESSIONS) in str(exc_info.value)


class TestSessionRetrieval:
    """Test session retrieval functionality."""

    @pytest.fixture
    def manager(self):
        return SessionManager()

    @pytest.fixture
    def mock_backend(self):
        return MockBackend()

    def test_get_existing_session(self, manager, mock_backend):
        """Can retrieve an existing session by ID."""
        created = manager.create("local", mock_backend)
        retrieved = manager.get(created.id)

        assert retrieved is not None
        assert retrieved.id == created.id

    def test_get_nonexistent_session_returns_none(self, manager):
        """Getting a non-existent session returns None."""
        result = manager.get("nonexistent-id")

        assert result is None

    def test_get_updates_last_activity(self, manager, mock_backend):
        """Getting a session updates its last_activity timestamp."""
        session = manager.create("local", mock_backend)
        original_activity = session.last_activity

        # Small delay to ensure time difference
        time.sleep(0.01)

        manager.get(session.id)

        assert session.last_activity > original_activity


class TestSessionListing:
    """Test session listing functionality."""

    @pytest.fixture
    def manager(self):
        return SessionManager()

    @pytest.fixture
    def mock_backend(self):
        return MockBackend()

    def test_list_empty_sessions(self, manager):
        """List returns empty list when no sessions."""
        result = manager.list()

        assert result == []

    def test_list_single_session(self, manager, mock_backend):
        """List returns single session."""
        session = manager.create("local", mock_backend)
        result = manager.list()

        assert len(result) == 1
        assert result[0].id == session.id

    def test_list_multiple_sessions(self, manager, mock_backend):
        """List returns all sessions."""
        session1 = manager.create("local", mock_backend)
        session2 = manager.create("vnc", mock_backend)

        result = manager.list()

        assert len(result) == 2
        ids = [s.id for s in result]
        assert session1.id in ids
        assert session2.id in ids


class TestSessionDestruction:
    """Test session destruction functionality."""

    @pytest.fixture
    def manager(self):
        return SessionManager()

    @pytest.fixture
    def mock_backend(self):
        return MockBackend()

    @pytest.mark.asyncio
    async def test_destroy_existing_session(self, manager, mock_backend):
        """Can destroy an existing session."""
        session = manager.create("local", mock_backend)

        result = await manager.destroy(session.id)

        assert result is True
        assert session.id not in manager.sessions

    @pytest.mark.asyncio
    async def test_destroy_nonexistent_session(self, manager):
        """Destroying non-existent session returns False."""
        result = await manager.destroy("nonexistent-id")

        assert result is False

    @pytest.mark.asyncio
    async def test_destroy_calls_backend_disconnect(self, manager, mock_backend):
        """Destroy calls backend.disconnect() method."""
        session = manager.create("local", mock_backend)

        await manager.destroy(session.id)

        assert mock_backend.disconnected is True
        assert mock_backend.disconnect_called_count == 1

    @pytest.mark.asyncio
    async def test_destroy_handles_backend_exception(self, manager, mock_backend):
        """Destroy handles exceptions from backend.disconnect gracefully."""
        # Make disconnect raise an exception
        mock_backend.disconnect = AsyncMock(side_effect=Exception("Disconnect failed"))

        session = manager.create("local", mock_backend)

        # Should not raise, session should still be removed
        result = await manager.destroy(session.id)

        assert result is True
        assert session.id not in manager.sessions


class TestStaleSessionCleanup:
    """Test stale session cleanup functionality."""

    @pytest.fixture
    def manager(self):
        return SessionManager()

    @pytest.fixture
    def mock_backend(self):
        return MockBackend()

    def test_cleanup_removes_stale_sessions(self, manager, mock_backend):
        """Cleanup removes sessions inactive > STALE_TIMEOUT."""
        session = manager.create("local", mock_backend)

        # Manually set last_activity to be stale (older than timeout)
        session.last_activity = time.time() - SessionManager.STALE_TIMEOUT - 1

        manager.cleanup_stale()

        assert session.id not in manager.sessions

    def test_cleanup_keeps_active_sessions(self, manager, mock_backend):
        """Cleanup keeps sessions that are still active."""
        session = manager.create("local", mock_backend)

        manager.cleanup_stale()

        assert session.id in manager.sessions

    def test_cleanup_called_on_create(self, manager, mock_backend):
        """cleanup_stale is called when creating new sessions."""
        # Create a stale session
        stale_session = manager.create("local", mock_backend)
        stale_session.last_activity = time.time() - SessionManager.STALE_TIMEOUT - 1

        # Create another session (should trigger cleanup)
        new_session = manager.create("local", mock_backend)

        # Stale session should be removed
        assert stale_session.id not in manager.sessions
        assert new_session.id in manager.sessions

    def test_cleanup_called_on_list(self, manager, mock_backend):
        """cleanup_stale is called when listing sessions."""
        session = manager.create("local", mock_backend)
        session.last_activity = time.time() - SessionManager.STALE_TIMEOUT - 1

        result = manager.list()

        # Stale session should not appear in list
        assert len(result) == 0

    def test_cleanup_partial_stale(self, manager, mock_backend):
        """Cleanup removes only stale sessions, keeps active ones."""
        # Create two sessions
        session1 = manager.create("local", mock_backend)
        session2 = manager.create("local", mock_backend)

        # Make session1 stale
        session1.last_activity = time.time() - SessionManager.STALE_TIMEOUT - 1

        manager.cleanup_stale()

        assert session1.id not in manager.sessions
        assert session2.id in manager.sessions


class TestUpdateActivity:
    """Test update_activity functionality."""

    @pytest.fixture
    def manager(self):
        return SessionManager()

    @pytest.fixture
    def mock_backend(self):
        return MockBackend()

    def test_update_activity_existing_session(self, manager, mock_backend):
        """update_activity updates last_activity for existing session."""
        session = manager.create("local", mock_backend)
        original_activity = session.last_activity

        time.sleep(0.01)
        manager.update_activity(session.id)

        assert session.last_activity > original_activity

    def test_update_activity_nonexistent_session(self, manager):
        """update_activity does nothing for nonexistent session."""
        # Should not raise
        manager.update_activity("nonexistent-id")


class TestDesktopSessionDataclass:
    """Test DesktopSession dataclass."""

    def test_desktop_session_defaults(self):
        """DesktopSession has correct default values."""
        backend = MockBackend()
        session = DesktopSession(
            id="test-id",
            backend_type="local",
            backend=backend
        )

        assert session.id == "test-id"
        assert session.backend_type == "local"
        assert session.backend == backend
        assert session.track_claimed is False
        # created_at and last_activity should be set
        assert session.created_at > 0
        assert session.last_activity > 0


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
