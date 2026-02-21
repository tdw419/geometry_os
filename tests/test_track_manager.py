#!/usr/bin/env python3
"""
Unit tests for TrackManager - WordPress Track Board coordination client.

Tests cover:
- claim() success and conflict scenarios
- check_conflicts() overlapping and non-overlapping detection
- release() success scenario
- Graceful degradation when WordPress unavailable

Uses unittest.mock for HTTP response mocking.
"""

import json
import socket
import sys
import unittest
from io import BytesIO
from unittest.mock import MagicMock, patch
from urllib.error import HTTPError, URLError

# Add project root to path for imports
from pathlib import Path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))

from wordpress_zone.track_manager import (
    TrackManager,
    TrackManagerError,
    WordPressUnavailableError,
    TrackConflictError,
)


class MockResponse:
    """Mock HTTP response object."""

    def __init__(self, data: dict, status_code: int = 200):
        self._data = json.dumps(data).encode('utf-8')
        self.status_code = status_code

    def read(self) -> bytes:
        return self._data

    def __enter__(self):
        return self

    def __exit__(self, *args):
        pass


class MockHTTPError(HTTPError):
    """Mock HTTPError with JSON body support."""

    def __init__(self, code: int, msg: str, body: dict = None):
        self._body = body or {}
        super().__init__(
            url="http://test/ai-publisher.php",
            code=code,
            msg=msg,
            hdrs=None,
            fp=BytesIO(json.dumps(self._body).encode('utf-8'))
        )

    def read(self) -> bytes:
        return json.dumps(self._body).encode('utf-8')


class TestTrackManagerClaim(unittest.TestCase):
    """Tests for TrackManager.claim() method."""

    def setUp(self):
        self.tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_claim_returns_success_dict_on_200_response(self, mock_urlopen):
        """Test claim() returns success dict on 200 response."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'claim_id': 123,
            'track_id': 'test-track'
        })

        result = self.tm.claim('test-track', ['src/module/'], 'agent-1')

        self.assertTrue(result['success'])
        self.assertEqual(result['claim_id'], 123)
        self.assertEqual(result['track_id'], 'test-track')

    @patch('wordpress_zone.track_manager.urlopen')
    def test_claim_returns_conflict_dict_on_409_response(self, mock_urlopen):
        """Test claim() returns conflict dict on 409 response."""
        mock_urlopen.side_effect = MockHTTPError(
            code=409,
            msg="Conflict",
            body={
                'success': False,
                'error': 'Track already claimed',
                'conflicts': [
                    {'track_id': 'existing-track', 'agent_id': 'other-agent'}
                ]
            }
        )

        result = self.tm.claim('test-track', ['src/module/'], 'agent-1')

        self.assertFalse(result['success'])
        self.assertIn('Track already claimed', result['error'])
        self.assertEqual(len(result['conflicts']), 1)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_claim_returns_error_dict_on_400_response(self, mock_urlopen):
        """Test claim() returns error dict on 400 response."""
        mock_urlopen.side_effect = MockHTTPError(
            code=400,
            msg="Bad Request",
            body={
                'success': False,
                'error': 'Missing required field: track_id'
            }
        )

        result = self.tm.claim('', [], 'agent-1')

        self.assertFalse(result['success'])
        self.assertIn('Missing required field', result['error'])


class TestTrackManagerCheckConflicts(unittest.TestCase):
    """Tests for TrackManager.check_conflicts() method."""

    def setUp(self):
        self.tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_check_conflicts_detects_overlapping_paths(self, mock_urlopen):
        """Test check_conflicts() detects overlapping paths."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'tracks': [
                {
                    'track_id': 'existing-track',
                    'agent_id': 'other-agent',
                    'files': ['src/shared/']
                }
            ]
        })

        conflicts = self.tm.check_conflicts(['src/shared/module.py'])

        self.assertEqual(len(conflicts), 1)
        self.assertEqual(conflicts[0]['track_id'], 'existing-track')
        self.assertEqual(conflicts[0]['requested_file'], 'src/shared/module.py')
        self.assertEqual(conflicts[0]['conflicting_file'], 'src/shared/')

    @patch('wordpress_zone.track_manager.urlopen')
    def test_check_conflicts_returns_empty_for_non_overlapping(self, mock_urlopen):
        """Test check_conflicts() returns empty for non-overlapping paths."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'tracks': [
                {
                    'track_id': 'existing-track',
                    'agent_id': 'other-agent',
                    'files': ['src/other_module/']
                }
            ]
        })

        conflicts = self.tm.check_conflicts(['src/my_module/file.py'])

        self.assertEqual(len(conflicts), 0)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_check_conflicts_detects_parent_path_overlap(self, mock_urlopen):
        """Test check_conflicts() detects when claimed file is parent of requested."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'tracks': [
                {
                    'track_id': 'parent-track',
                    'agent_id': 'other-agent',
                    'files': ['src/']
                }
            ]
        })

        # Requesting src/sub/file.py conflicts with src/ claim
        conflicts = self.tm.check_conflicts(['src/sub/file.py'])

        self.assertEqual(len(conflicts), 1)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_check_conflicts_detects_child_path_overlap(self, mock_urlopen):
        """Test check_conflicts() detects when requested file is parent of claimed."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'tracks': [
                {
                    'track_id': 'child-track',
                    'agent_id': 'other-agent',
                    'files': ['src/sub/file.py']
                }
            ]
        })

        # Requesting src/ conflicts with src/sub/file.py claim
        conflicts = self.tm.check_conflicts(['src/'])

        self.assertEqual(len(conflicts), 1)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_check_conflicts_returns_empty_on_api_failure(self, mock_urlopen):
        """Test check_conflicts() returns empty when API returns failure."""
        mock_urlopen.return_value = MockResponse({
            'success': False,
            'error': 'Database error'
        })

        conflicts = self.tm.check_conflicts(['src/file.py'])

        self.assertEqual(len(conflicts), 0)


class TestTrackManagerRelease(unittest.TestCase):
    """Tests for TrackManager.release() method."""

    def setUp(self):
        self.tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_release_returns_success_on_200(self, mock_urlopen):
        """Test release() returns success on 200 response."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'claim_id': 123,
            'message': 'Track released'
        })

        result = self.tm.release('test-track', 'agent-1')

        self.assertTrue(result['success'])
        self.assertEqual(result['claim_id'], 123)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_release_returns_success_on_idempotent_release(self, mock_urlopen):
        """Test release() returns success when track already released."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'message': 'Track already released or not found'
        })

        result = self.tm.release('nonexistent-track', 'agent-1')

        self.assertTrue(result['success'])

    @patch('wordpress_zone.track_manager.urlopen')
    def test_release_returns_error_on_agent_mismatch(self, mock_urlopen):
        """Test release() returns error when agent_id doesn't match."""
        mock_urlopen.side_effect = MockHTTPError(
            code=403,
            msg="Forbidden",
            body={
                'success': False,
                'error': 'Agent ID mismatch: claim owned by other-agent'
            }
        )

        result = self.tm.release('test-track', 'wrong-agent')

        self.assertFalse(result['success'])
        self.assertIn('Agent ID mismatch', result['error'])


class TestTrackManagerGracefulDegradation(unittest.TestCase):
    """Tests for graceful degradation when WordPress unavailable."""

    @patch('wordpress_zone.track_manager.urlopen')
    def test_claim_raises_wordpress_unavailable_on_timeout(self, mock_urlopen):
        """Test claim() raises WordPressUnavailableError on timeout."""
        mock_urlopen.side_effect = socket.timeout("Connection timed out")

        tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

        with self.assertRaises(WordPressUnavailableError) as context:
            tm.claim('test-track', ['src/'], 'agent-1')

        self.assertIn('timed out', str(context.exception).lower())

    @patch('wordpress_zone.track_manager.urlopen')
    def test_claim_raises_wordpress_unavailable_on_url_error(self, mock_urlopen):
        """Test claim() raises WordPressUnavailableError on URLError."""
        mock_urlopen.side_effect = URLError("Connection refused")

        tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

        with self.assertRaises(WordPressUnavailableError) as context:
            tm.claim('test-track', ['src/'], 'agent-1')

        self.assertIn('unavailable', str(context.exception).lower())

    @patch('wordpress_zone.track_manager.urlopen')
    def test_check_conflicts_raises_wordpress_unavailable_on_url_error(self, mock_urlopen):
        """Test check_conflicts() raises WordPressUnavailableError on URLError."""
        mock_urlopen.side_effect = URLError("Connection refused")

        tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

        with self.assertRaises(WordPressUnavailableError):
            tm.check_conflicts(['src/file.py'])

    @patch('wordpress_zone.track_manager.urlopen')
    def test_list_active_raises_wordpress_unavailable_on_url_error(self, mock_urlopen):
        """Test list_active() raises WordPressUnavailableError on URLError."""
        mock_urlopen.side_effect = URLError("Connection refused")

        tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

        with self.assertRaises(WordPressUnavailableError):
            tm.list_active()

    @patch('wordpress_zone.track_manager.urlopen')
    def test_invalid_json_response_raises_track_manager_error(self, mock_urlopen):
        """Test invalid JSON response raises TrackManagerError."""
        # Create a mock response that returns invalid JSON
        mock_response = MagicMock()
        mock_response.read.return_value = b'not valid json'
        mock_response.__enter__ = MagicMock(return_value=mock_response)
        mock_response.__exit__ = MagicMock(return_value=False)
        mock_urlopen.return_value = mock_response

        tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

        with self.assertRaises(TrackManagerError) as context:
            tm.claim('test-track', ['src/'], 'agent-1')

        self.assertIn('Invalid JSON', str(context.exception))


class TestTrackManagerHeartbeat(unittest.TestCase):
    """Tests for TrackManager.heartbeat() method."""

    def setUp(self):
        self.tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_heartbeat_returns_success_on_200(self, mock_urlopen):
        """Test heartbeat() returns success on 200 response."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'heartbeat': '2026-02-21T12:00:00Z'
        })

        result = self.tm.heartbeat('test-track', 'agent-1')

        self.assertTrue(result['success'])
        self.assertIn('heartbeat', result)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_heartbeat_returns_error_on_expired_claim(self, mock_urlopen):
        """Test heartbeat() returns error on expired claim (410 Gone)."""
        mock_urlopen.side_effect = MockHTTPError(
            code=410,
            msg="Gone",
            body={
                'success': False,
                'error': 'Claim expired',
                'last_heartbeat': '2026-02-21T11:00:00Z'
            }
        )

        result = self.tm.heartbeat('expired-track', 'agent-1')

        self.assertFalse(result['success'])
        self.assertIn('expired', result['error'].lower())


class TestTrackManagerListActive(unittest.TestCase):
    """Tests for TrackManager.list_active() method."""

    def setUp(self):
        self.tm = TrackManager(wp_url="http://test/ai-publisher.php", timeout=1.0)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_list_active_returns_tracks(self, mock_urlopen):
        """Test list_active() returns list of active tracks."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'count': 2,
            'tracks': [
                {
                    'track_id': 'track-1',
                    'agent_id': 'agent-1',
                    'files': ['src/a/']
                },
                {
                    'track_id': 'track-2',
                    'agent_id': 'agent-2',
                    'files': ['src/b/']
                }
            ]
        })

        result = self.tm.list_active()

        self.assertTrue(result['success'])
        self.assertEqual(result['count'], 2)
        self.assertEqual(len(result['tracks']), 2)

    @patch('wordpress_zone.track_manager.urlopen')
    def test_list_active_filters_by_agent(self, mock_urlopen):
        """Test list_active() filters by agent_id."""
        mock_urlopen.return_value = MockResponse({
            'success': True,
            'count': 1,
            'tracks': [
                {
                    'track_id': 'track-1',
                    'agent_id': 'agent-1',
                    'files': ['src/a/']
                }
            ]
        })

        result = self.tm.list_active(agent_id='agent-1')

        self.assertTrue(result['success'])
        self.assertEqual(len(result['tracks']), 1)
        self.assertEqual(result['tracks'][0]['agent_id'], 'agent-1')


# ─────────────────────────────────────────────────────────────
# Integration Tests (require live WordPress)
# ─────────────────────────────────────────────────────────────

import pytest
import time
import uuid


def wordpress_available():
    """Check if WordPress API is available for integration tests."""
    try:
        tm = TrackManager(timeout=2.0)
        tm.list_active()
        return True
    except (WordPressUnavailableError, Exception):
        return False


# Skip all integration tests if WordPress unavailable
pytestmark = pytest.mark.skipif(
    not wordpress_available(),
    reason="WordPress not available at localhost:8080"
)


@pytest.mark.integration
class TestIntegrationClaimReleaseCycle:
    """Integration tests for full claim -> check -> commit -> release cycle."""

    def _unique_track_id(self):
        """Generate unique track ID for test isolation."""
        return f"test-track-{uuid.uuid4().hex[:8]}"

    def test_full_claim_check_release_cycle(self):
        """Test complete claim -> check -> release cycle."""
        tm = TrackManager(timeout=5.0)
        track_id = self._unique_track_id()
        agent_id = "test-agent-integration"
        files = ["tests/integration/module/"]

        try:
            # Step 1: Claim track
            claim_result = tm.claim(track_id, files, agent_id)
            assert claim_result['success'], f"Claim failed: {claim_result.get('error')}"
            assert 'claim_id' in claim_result

            # Step 2: Check conflicts - should find our own claim
            conflicts = tm.check_conflicts(files)
            # Note: We may or may not see our own claim depending on API behavior
            # This tests that the conflict check works

            # Step 3: Heartbeat to keep claim alive
            heartbeat_result = tm.heartbeat(track_id, agent_id)
            assert heartbeat_result['success'], f"Heartbeat failed: {heartbeat_result.get('error')}"

            # Step 4: List active tracks - should include ours
            list_result = tm.list_active(agent_id=agent_id)
            assert list_result['success']
            track_ids = [t['track_id'] for t in list_result.get('tracks', [])]
            assert track_id in track_ids, f"Our track {track_id} not found in {track_ids}"

        finally:
            # Step 5: Release track (cleanup)
            release_result = tm.release(track_id, agent_id)
            assert release_result['success'], f"Release failed: {release_result.get('error')}"

    def test_conflict_detection_between_two_agents(self):
        """Test that two agents cannot claim overlapping files."""
        tm = TrackManager(timeout=5.0)
        track_id_1 = self._unique_track_id()
        track_id_2 = self._unique_track_id()
        agent_1 = "test-agent-conflict-1"
        agent_2 = "test-agent-conflict-2"
        shared_path = ["tests/integration/shared/"]

        try:
            # Agent 1 claims the shared path
            claim1 = tm.claim(track_id_1, shared_path, agent_1)
            assert claim1['success'], f"Agent 1 claim failed: {claim1.get('error')}"

            # Agent 2 tries to claim overlapping path - should fail
            claim2 = tm.claim(track_id_2, ["tests/integration/shared/file.py"], agent_2)
            assert not claim2['success'], "Agent 2 should not be able to claim overlapping path"
            assert 'conflict' in claim2.get('error', '').lower() or claim2.get('conflicts'), \
                f"Expected conflict error, got: {claim2}"

        finally:
            # Cleanup
            tm.release(track_id_1, agent_1)
            # Agent 2's claim should not exist, but try release anyway (idempotent)
            tm.release(track_id_2, agent_2)

    def test_conflict_check_detects_existing_claim(self):
        """Test that check_conflicts() finds existing claims."""
        tm = TrackManager(timeout=5.0)
        track_id = self._unique_track_id()
        agent_id = "test-agent-conflict-check"
        files = ["tests/integration/conflicted/"]

        try:
            # Claim a track
            claim = tm.claim(track_id, files, agent_id)
            assert claim['success']

            # Check conflicts for overlapping path
            conflicts = tm.check_conflicts(["tests/integration/conflicted/file.py"])
            assert len(conflicts) > 0, "Should detect conflict with existing claim"
            assert any(c['track_id'] == track_id for c in conflicts), \
                f"Should find our track {track_id} in conflicts"

        finally:
            tm.release(track_id, agent_id)


@pytest.mark.integration
class TestIntegrationHeartbeatExpiry:
    """Integration tests for heartbeat expiry behavior."""

    def _unique_track_id(self):
        """Generate unique track ID for test isolation."""
        return f"test-hb-{uuid.uuid4().hex[:8]}"

    def test_heartbeat_updates_timestamp(self):
        """Test that heartbeat updates the claim timestamp."""
        tm = TrackManager(timeout=5.0)
        track_id = self._unique_track_id()
        agent_id = "test-agent-heartbeat"

        try:
            # Claim track
            claim = tm.claim(track_id, ["tests/integration/hb/"], agent_id)
            assert claim['success']

            # Wait a moment
            time.sleep(0.5)

            # Send heartbeat
            hb_result = tm.heartbeat(track_id, agent_id)
            assert hb_result['success'], f"Heartbeat failed: {hb_result.get('error')}"
            assert 'heartbeat' in hb_result

        finally:
            tm.release(track_id, agent_id)

    def test_heartbeat_wrong_agent_fails(self):
        """Test that heartbeat from wrong agent fails."""
        tm = TrackManager(timeout=5.0)
        track_id = self._unique_track_id()
        agent_id = "test-agent-hb-owner"
        wrong_agent = "test-agent-hb-wrong"

        try:
            # Claim track
            claim = tm.claim(track_id, ["tests/integration/hb2/"], agent_id)
            assert claim['success']

            # Try heartbeat with wrong agent
            hb_result = tm.heartbeat(track_id, wrong_agent)
            assert not hb_result['success'], "Heartbeat from wrong agent should fail"

        finally:
            tm.release(track_id, agent_id)


@pytest.mark.integration
class TestIntegrationIdempotentRelease:
    """Integration tests for idempotent release behavior."""

    def _unique_track_id(self):
        """Generate unique track ID for test isolation."""
        return f"test-release-{uuid.uuid4().hex[:8]}"

    def test_release_non_existent_track_is_idempotent(self):
        """Test that releasing a non-existent track returns success."""
        tm = TrackManager(timeout=5.0)
        track_id = f"nonexistent-{uuid.uuid4().hex[:8]}"
        agent_id = "test-agent-release"

        # Release a track that was never claimed
        result = tm.release(track_id, agent_id)

        # Should return success (idempotent behavior)
        assert result['success'], f"Release of non-existent track should succeed: {result}"

    def test_double_release_is_idempotent(self):
        """Test that releasing an already-released track returns success."""
        tm = TrackManager(timeout=5.0)
        track_id = self._unique_track_id()
        agent_id = "test-agent-double-release"

        try:
            # Claim and release
            claim = tm.claim(track_id, ["tests/integration/double/"], agent_id)
            assert claim['success']

            release1 = tm.release(track_id, agent_id)
            assert release1['success']

            # Release again
            release2 = tm.release(track_id, agent_id)
            assert release2['success'], "Second release should also succeed (idempotent)"

        except Exception:
            # Cleanup on failure
            tm.release(track_id, agent_id)
            raise


@pytest.mark.integration
class TestIntegrationAgentIsolation:
    """Integration tests for agent ownership isolation."""

    def _unique_track_id(self):
        """Generate unique track ID for test isolation."""
        return f"test-iso-{uuid.uuid4().hex[:8]}"

    def test_agent_cannot_release_other_agents_claim(self):
        """Test that an agent cannot release another agent's claim."""
        tm = TrackManager(timeout=5.0)
        track_id = self._unique_track_id()
        owner_agent = "test-agent-owner"
        other_agent = "test-agent-other"

        try:
            # Owner claims track
            claim = tm.claim(track_id, ["tests/integration/owner/"], owner_agent)
            assert claim['success']

            # Other agent tries to release
            release = tm.release(track_id, other_agent)
            assert not release['success'], "Other agent should not be able to release"
            # Error message from WordPress: "Agent ID does not match claim owner"
            error_lower = release.get('error', '').lower()
            assert 'match' in error_lower or 'forbidden' in error_lower or 'owner' in error_lower

        finally:
            # Owner releases
            tm.release(track_id, owner_agent)


if __name__ == '__main__':
    unittest.main()
