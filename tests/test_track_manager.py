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


if __name__ == '__main__':
    unittest.main()
