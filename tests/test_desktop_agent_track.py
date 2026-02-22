"""
Unit tests for TrackBoardClient - async wrapper for WordPress Track Board coordination.

Tests cover:
- Initialization with default/custom track ID
- Track claiming (success, conflict, WordPress unavailable fallback)
- Track release
- Heartbeat functionality
- Background heartbeat loop (start/stop)
"""

import asyncio
import pytest
from unittest.mock import AsyncMock, MagicMock, patch, PropertyMock

from systems.desktop_agent.safety.track_client import TrackBoardClient
from wordpress_zone.track_manager import (
    TrackManager,
    WordPressUnavailableError,
    TrackManagerError
)


# ─────────────────────────────────────────────────────────────
# Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def mock_track_manager():
    """Create a mock TrackManager instance."""
    tm = MagicMock(spec=TrackManager)
    tm.claim = MagicMock()
    tm.release = MagicMock()
    tm.heartbeat = MagicMock()
    return tm


@pytest.fixture
def track_client(mock_track_manager):
    """Create a TrackBoardClient with mocked TrackManager."""
    with patch('systems.desktop_agent.safety.track_client.TrackManager', return_value=mock_track_manager):
        client = TrackBoardClient()
        client.tm = mock_track_manager
        return client


@pytest.fixture
def track_client_custom(mock_track_manager):
    """Create a TrackBoardClient with custom track ID and WP URL."""
    with patch('systems.desktop_agent.safety.track_client.TrackManager', return_value=mock_track_manager):
        client = TrackBoardClient(track_id="custom-track", wp_url="http://custom:9000/api")
        client.tm = mock_track_manager
        return client


# ─────────────────────────────────────────────────────────────
# Initialization Tests
# ─────────────────────────────────────────────────────────────

class TestTrackBoardClientInit:
    """Tests for TrackBoardClient initialization."""

    def test_init_default_track_id(self, mock_track_manager):
        """Test initialization with default track ID."""
        with patch('systems.desktop_agent.safety.track_client.TrackManager', return_value=mock_track_manager):
            client = TrackBoardClient()

        assert client.track_id == "desktop-control"

    def test_init_custom_track_id(self, mock_track_manager):
        """Test initialization with custom track ID."""
        with patch('systems.desktop_agent.safety.track_client.TrackManager', return_value=mock_track_manager):
            client = TrackBoardClient(track_id="my-custom-track")

        assert client.track_id == "my-custom-track"

    def test_init_custom_wp_url(self, mock_track_manager):
        """Test that custom WP URL is passed to TrackManager."""
        with patch('systems.desktop_agent.safety.track_client.TrackManager', return_value=mock_track_manager) as MockTM:
            TrackBoardClient(wp_url="http://custom:9000/api")
            MockTM.assert_called_once_with(wp_url="http://custom:9000/api")

    def test_init_agent_id_contains_hostname(self, mock_track_manager):
        """Test that agent_id includes hostname."""
        with patch('systems.desktop_agent.safety.track_client.TrackManager', return_value=mock_track_manager):
            client = TrackBoardClient()

        assert "desktop-agent-" in client.agent_id
        import socket
        assert socket.gethostname() in client.agent_id

    def test_init_is_claimed_false(self, track_client):
        """Test that is_claimed is False on initialization."""
        assert track_client.is_claimed is False

    def test_init_heartbeat_task_none(self, track_client):
        """Test that heartbeat task is None on initialization."""
        assert track_client._heartbeat_task is None


# ─────────────────────────────────────────────────────────────
# Track Claiming Tests
# ─────────────────────────────────────────────────────────────

class TestTrackBoardClientClaim:
    """Tests for track claiming functionality."""

    @pytest.mark.asyncio
    async def test_claim_success(self, track_client, mock_track_manager):
        """Test successful track claim."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 123}

        result = await track_client.claim()

        assert result is True
        assert track_client.is_claimed is True
        mock_track_manager.claim.assert_called_once()

    @pytest.mark.asyncio
    async def test_claim_with_custom_files(self, track_client, mock_track_manager):
        """Test claim with custom file list."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 124}

        result = await track_client.claim(files=["/custom/path/file.py"])

        assert result is True
        call_args = mock_track_manager.claim.call_args
        assert "/custom/path/file.py" in call_args[0][1]

    @pytest.mark.asyncio
    async def test_claim_default_files(self, track_client, mock_track_manager):
        """Test claim uses default files when none provided."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 125}

        await track_client.claim()

        call_args = mock_track_manager.claim.call_args
        assert "desktop://local" in call_args[0][1]

    @pytest.mark.asyncio
    async def test_claim_conflict_returns_false(self, track_client, mock_track_manager):
        """Test claim returns False on conflict."""
        mock_track_manager.claim.return_value = {
            "success": False,
            "error": "Conflict detected",
            "conflicts": [{"track_id": "other-track", "agent_id": "other-agent"}]
        }

        result = await track_client.claim()

        assert result is False
        assert track_client.is_claimed is False

    @pytest.mark.asyncio
    async def test_claim_wordpress_unavailable_fallback(self, track_client, mock_track_manager):
        """Test claim succeeds when WordPress is unavailable (fallback mode)."""
        mock_track_manager.claim.side_effect = WordPressUnavailableError("Connection refused")

        result = await track_client.claim()

        # Fallback should succeed
        assert result is True
        assert track_client.is_claimed is True

    @pytest.mark.asyncio
    async def test_claim_track_manager_error_returns_false(self, track_client, mock_track_manager):
        """Test claim returns False on generic TrackManagerError."""
        mock_track_manager.claim.side_effect = TrackManagerError("Generic error")

        result = await track_client.claim()

        assert result is False
        assert track_client.is_claimed is False

    @pytest.mark.asyncio
    async def test_claim_starts_heartbeat_loop(self, track_client, mock_track_manager):
        """Test that successful claim starts heartbeat loop."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 126}

        await track_client.claim()

        assert track_client._heartbeat_task is not None
        assert not track_client._heartbeat_task.done()

        # Cleanup
        track_client.stop_heartbeat_loop()


# ─────────────────────────────────────────────────────────────
# Track Release Tests
# ─────────────────────────────────────────────────────────────

class TestTrackBoardClientRelease:
    """Tests for track release functionality."""

    @pytest.mark.asyncio
    async def test_release_success(self, track_client, mock_track_manager):
        """Test successful track release."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 127}
        mock_track_manager.release.return_value = {"success": True}

        # First claim
        await track_client.claim()
        assert track_client.is_claimed is True

        # Then release
        result = await track_client.release()

        assert result is True
        assert track_client.is_claimed is False
        mock_track_manager.release.assert_called_once()

    @pytest.mark.asyncio
    async def test_release_when_not_claimed(self, track_client, mock_track_manager):
        """Test release returns True when track was not claimed."""
        result = await track_client.release()

        assert result is True
        # release should not be called if not claimed
        mock_track_manager.release.assert_not_called()

    @pytest.mark.asyncio
    async def test_release_error_returns_false(self, track_client, mock_track_manager):
        """Test release returns False on error."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 128}
        mock_track_manager.release.side_effect = Exception("Release error")

        await track_client.claim()
        result = await track_client.release()

        assert result is False

    @pytest.mark.asyncio
    async def test_release_stops_heartbeat_loop(self, track_client, mock_track_manager):
        """Test that release stops the heartbeat loop."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 129}
        mock_track_manager.release.return_value = {"success": True}

        await track_client.claim()
        assert track_client._heartbeat_task is not None

        await track_client.release()

        assert track_client._heartbeat_task is None


# ─────────────────────────────────────────────────────────────
# Heartbeat Tests
# ─────────────────────────────────────────────────────────────

class TestTrackBoardClientHeartbeat:
    """Tests for heartbeat functionality."""

    @pytest.mark.asyncio
    async def test_heartbeat_success(self, track_client, mock_track_manager):
        """Test successful heartbeat."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 130}
        mock_track_manager.heartbeat.return_value = {"success": True, "heartbeat": "2026-02-22T12:00:00Z"}

        await track_client.claim()
        result = await track_client.heartbeat()

        assert result is True
        mock_track_manager.heartbeat.assert_called_once()

        # Cleanup
        track_client.stop_heartbeat_loop()

    @pytest.mark.asyncio
    async def test_heartbeat_when_not_claimed(self, track_client, mock_track_manager):
        """Test heartbeat returns False when track not claimed."""
        result = await track_client.heartbeat()

        assert result is False
        mock_track_manager.heartbeat.assert_not_called()

    @pytest.mark.asyncio
    async def test_heartbeat_error_returns_false(self, track_client, mock_track_manager):
        """Test heartbeat returns False on error."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 131}
        mock_track_manager.heartbeat.side_effect = Exception("Heartbeat error")

        await track_client.claim()
        result = await track_client.heartbeat()

        assert result is False

        # Cleanup
        track_client.stop_heartbeat_loop()

    @pytest.mark.asyncio
    async def test_heartbeat_failed_response_returns_false(self, track_client, mock_track_manager):
        """Test heartbeat returns False when response indicates failure."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 132}
        mock_track_manager.heartbeat.return_value = {"success": False, "error": "Track expired"}

        await track_client.claim()
        result = await track_client.heartbeat()

        assert result is False

        # Cleanup
        track_client.stop_heartbeat_loop()


# ─────────────────────────────────────────────────────────────
# Heartbeat Loop Tests
# ─────────────────────────────────────────────────────────────

class TestTrackBoardClientHeartbeatLoop:
    """Tests for background heartbeat loop."""

    @pytest.mark.asyncio
    async def test_start_heartbeat_loop_creates_task(self, track_client):
        """Test start_heartbeat_loop creates async task."""
        track_client._is_claimed = True
        track_client.start_heartbeat_loop()

        assert track_client._heartbeat_task is not None
        assert isinstance(track_client._heartbeat_task, asyncio.Task)

        # Cleanup
        track_client.stop_heartbeat_loop()

    @pytest.mark.asyncio
    async def test_start_heartbeat_loop_skips_if_already_running(self, track_client):
        """Test start_heartbeat_loop skips if task already running."""
        track_client._is_claimed = True
        track_client.start_heartbeat_loop()
        first_task = track_client._heartbeat_task

        # Call again
        track_client.start_heartbeat_loop()

        # Should be same task
        assert track_client._heartbeat_task is first_task

        # Cleanup
        track_client.stop_heartbeat_loop()

    @pytest.mark.asyncio
    async def test_stop_heartbeat_loop_cancels_task(self, track_client):
        """Test stop_heartbeat_loop cancels running task."""
        track_client._is_claimed = True
        track_client.start_heartbeat_loop()
        task = track_client._heartbeat_task

        track_client.stop_heartbeat_loop()

        assert track_client._heartbeat_task is None
        # Task may be in "cancelling" state - need to yield to event loop
        # for the cancellation to complete
        try:
            await asyncio.sleep(0.01)
        except asyncio.CancelledError:
            pass
        # Task should be either cancelled or done after yielding
        assert task.cancelled() or task.done() or task.cancelling()

    def test_stop_heartbeat_loop_handles_none_task(self, track_client):
        """Test stop_heartbeat_loop handles None task gracefully."""
        # Should not raise - this doesn't require event loop since no task exists
        track_client.stop_heartbeat_loop()
        assert track_client._heartbeat_task is None

    @pytest.mark.asyncio
    async def test_heartbeat_loop_sends_periodic_heartbeats(self, track_client, mock_track_manager):
        """Test heartbeat loop sends heartbeats at interval."""
        mock_track_manager.claim.return_value = {"success": True, "claim_id": 133}
        mock_track_manager.heartbeat.return_value = {"success": True}

        # Claim starts the loop
        await track_client.claim()

        # Wait for first heartbeat (using short interval for testing)
        track_client.stop_heartbeat_loop()
        track_client.start_heartbeat_loop(interval_minutes=0.001)  # ~60ms

        # Wait a bit for heartbeat to be sent
        await asyncio.sleep(0.1)

        # Stop and check
        track_client.stop_heartbeat_loop()

        # Heartbeat should have been called at least once
        assert mock_track_manager.heartbeat.call_count >= 1


# ─────────────────────────────────────────────────────────────
# Is Claimed Property Tests
# ─────────────────────────────────────────────────────────────

class TestTrackBoardClientIsClaimed:
    """Tests for is_claimed property."""

    def test_is_claimed_returns_internal_state(self, track_client):
        """Test is_claimed property returns internal _is_claimed state."""
        assert track_client.is_claimed is False

        track_client._is_claimed = True
        assert track_client.is_claimed is True

        track_client._is_claimed = False
        assert track_client.is_claimed is False
