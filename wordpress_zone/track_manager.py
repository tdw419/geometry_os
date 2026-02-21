#!/usr/bin/env python3
"""
TrackManager - Python client for WordPress Track Board coordination.

Provides multi-agent file locking via WordPress track_claim CPT.
Used by agents to claim/release tracks and by git pre-commit hooks
to detect conflicts.

Usage (agent):
    from wordpress_zone.track_manager import TrackManager
    tm = TrackManager()
    result = tm.claim('my-track', ['src/module/'], 'agent-1')
    tm.release('my-track', 'agent-1')

Usage (CLI):
    python3 track_manager.py check --files "src/module/file.py src/other.py"
    # Exit codes: 0=no conflict, 1=conflict, 2=WordPress unavailable
"""

import json
import os
import socket
import sys
from typing import List, Dict, Optional, Any
from urllib.request import Request, urlopen
from urllib.error import URLError, HTTPError


class TrackManagerError(Exception):
    """Base exception for TrackManager errors."""
    pass


class WordPressUnavailableError(TrackManagerError):
    """Raised when WordPress API is unreachable."""
    pass


class TrackConflictError(TrackManagerError):
    """Raised when a track claim conflicts with existing claims."""
    pass


class TrackManager:
    """
    Python client for WordPress Track Board coordination API.

    Communicates with ai-publisher.php handlers:
    - claimTrack: Claim a track for exclusive file access
    - releaseTrack: Release a track claim
    - listTracks: List active track claims
    - heartbeatTrack: Update claim heartbeat timestamp
    """

    DEFAULT_WP_URL = "http://localhost:8080/ai-publisher.php"
    DEFAULT_TIMEOUT = 5.0  # 5 seconds for pre-commit hook responsiveness

    def __init__(self, wp_url: str = None, timeout: float = None):
        """
        Initialize TrackManager.

        Args:
            wp_url: WordPress ai-publisher.php URL (default: localhost:8080)
            timeout: HTTP request timeout in seconds (default: 5.0)
        """
        self.wp_url = wp_url or os.environ.get(
            'WORDPRESS_TRACK_URL',
            self.DEFAULT_WP_URL
        )
        self.timeout = timeout if timeout is not None else self.DEFAULT_TIMEOUT

    def _post(self, action: str, data: Dict[str, Any]) -> Dict[str, Any]:
        """
        Send POST request to WordPress API.

        Args:
            action: API action name (e.g., 'claimTrack')
            data: Request payload

        Returns:
            Response dict with 'success' key

        Raises:
            WordPressUnavailableError: If WordPress is unreachable
            TrackManagerError: For other errors
        """
        payload = {'action': action, **data}
        body = json.dumps(payload).encode('utf-8')

        request = Request(
            self.wp_url,
            data=body,
            headers={'Content-Type': 'application/json'}
        )

        try:
            with urlopen(request, timeout=self.timeout) as response:
                result = json.loads(response.read().decode('utf-8'))
                return result
        except socket.timeout as e:
            raise WordPressUnavailableError(
                f"WordPress request timed out after {self.timeout}s: {e}"
            )
        except URLError as e:
            raise WordPressUnavailableError(
                f"WordPress unavailable at {self.wp_url}: {e}"
            )
        except HTTPError as e:
            # Try to read error response body for structured error info
            try:
                error_body = e.read().decode('utf-8')
                error_data = json.loads(error_body)
                # Ensure structured error format
                if 'success' not in error_data:
                    error_data['success'] = False
                if 'error' not in error_data:
                    error_data['error'] = f"HTTP {e.code}: {e.reason}"
                return error_data
            except (json.JSONDecodeError, Exception):
                # Return structured error for HTTP errors without JSON body
                return {
                    'success': False,
                    'error': f"HTTP error {e.code}: {e.reason}"
                }
        except json.JSONDecodeError as e:
            raise TrackManagerError(f"Invalid JSON response: {e}")
        except Exception as e:
            # Catch-all for unexpected errors, wrap in TrackManagerError
            raise TrackManagerError(f"Unexpected error during request: {e}")

    def claim(
        self,
        track_id: str,
        files: List[str],
        agent_id: str
    ) -> Dict[str, Any]:
        """
        Claim a track for exclusive file access.

        Args:
            track_id: Unique track identifier
            files: List of file paths to claim
            agent_id: Agent identifier claiming the track

        Returns:
            Response dict with keys:
            - success: bool
            - claim_id: int (on success)
            - error: str (on failure)
            - conflicts: list (on conflict)

        Raises:
            WordPressUnavailableError: If WordPress is unreachable
        """
        return self._post('claimTrack', {
            'track_id': track_id,
            'files': files,
            'agent_id': agent_id
        })

    def release(self, track_id: str, agent_id: str) -> Dict[str, Any]:
        """
        Release a track claim.

        Args:
            track_id: Track identifier to release
            agent_id: Agent identifier (must match claim owner)

        Returns:
            Response dict with keys:
            - success: bool
            - claim_id: int (on success)
            - error: str (on failure)
        """
        return self._post('releaseTrack', {
            'track_id': track_id,
            'agent_id': agent_id
        })

    def check_conflicts(self, files: List[str]) -> List[Dict[str, Any]]:
        """
        Check if any files conflict with existing claims.

        Args:
            files: List of file paths to check

        Returns:
            List of conflict dicts, each with:
            - track_id: str
            - agent_id: str
            - conflicting_file: str
            - requested_file: str

        Raises:
            WordPressUnavailableError: If WordPress is unreachable.
                CLI uses exit code 2 to allow commit with warning.
        """
        result = self._post('listTracks', {'include_expired': False})

        if not result.get('success'):
            return []

        conflicts = []
        active_tracks = result.get('tracks', [])

        for track in active_tracks:
            track_files = track.get('files', [])
            if not isinstance(track_files, list):
                track_files = [track_files]

            for requested_file in files:
                for track_file in track_files:
                    # Check if either path is a prefix of the other
                    if (requested_file.startswith(track_file) or
                            track_file.startswith(requested_file)):
                        conflicts.append({
                            'track_id': track.get('track_id'),
                            'agent_id': track.get('agent_id'),
                            'conflicting_file': track_file,
                            'requested_file': requested_file
                        })

        return conflicts

    def heartbeat(self, track_id: str, agent_id: str) -> Dict[str, Any]:
        """
        Update heartbeat timestamp for a track claim.

        Should be called periodically to keep claim alive.
        Claims expire if heartbeat not updated for 10 minutes.

        Args:
            track_id: Track identifier
            agent_id: Agent identifier (must match claim owner)

        Returns:
            Response dict with keys:
            - success: bool
            - heartbeat: str (ISO datetime on success)
            - error: str (on failure)
        """
        return self._post('heartbeatTrack', {
            'track_id': track_id,
            'agent_id': agent_id
        })

    def list_active(self, agent_id: str = None) -> Dict[str, Any]:
        """
        List active track claims.

        Args:
            agent_id: Optional filter by agent

        Returns:
            Response dict with keys:
            - success: bool
            - count: int
            - tracks: list of track dicts
        """
        params = {}
        if agent_id:
            params['agent_id'] = agent_id
        return self._post('listTracks', params)


# ─────────────────────────────────────────────────────────────
# CLI Interface (for git pre-commit hook)
# ─────────────────────────────────────────────────────────────

def cli_check(files: List[str]) -> int:
    """
    Check for conflicts with active track claims.

    Exit codes:
        0: No conflicts (safe to commit)
        1: Conflicts detected (block commit)
        2: WordPress unavailable (allow commit with warning)

    Args:
        files: List of file paths to check

    Returns:
        Exit code
    """
    tm = TrackManager()

    try:
        conflicts = tm.check_conflicts(files)
    except WordPressUnavailableError as e:
        print(
            f"Warning: WordPress unavailable, skipping track check: {e}",
            file=sys.stderr
        )
        return 2
    except TrackManagerError as e:
        print(f"Warning: Track check error: {e}", file=sys.stderr)
        return 2

    if conflicts:
        print("ERROR: File conflicts with active track claims:", file=sys.stderr)
        for c in conflicts:
            print(
                f"  - {c['requested_file']} conflicts with "
                f"{c['conflicting_file']} "
                f"(track: {c['track_id']}, agent: {c['agent_id']})",
                file=sys.stderr
            )
        print(
            "\nTo bypass: SKIP_TRACK_CHECK=true git commit ...",
            file=sys.stderr
        )
        return 1

    return 0


def main():
    """CLI entry point."""
    import argparse

    parser = argparse.ArgumentParser(
        description='TrackManager CLI - Check for track conflicts'
    )
    subparsers = parser.add_subparsers(dest='command', help='Commands')

    # check subcommand
    check_parser = subparsers.add_parser(
        'check',
        help='Check files for track conflicts'
    )
    check_parser.add_argument(
        '--files',
        required=True,
        help='Space-separated list of files to check'
    )

    # list subcommand
    list_parser = subparsers.add_parser(
        'list',
        help='List active track claims'
    )
    list_parser.add_argument(
        '--agent',
        help='Filter by agent ID'
    )

    args = parser.parse_args()

    if args.command == 'check':
        files = args.files.split()
        if not files:
            print("Error: No files provided", file=sys.stderr)
            sys.exit(1)

        # Check for bypass
        if os.environ.get('SKIP_TRACK_CHECK', '').lower() in ('true', '1', 'yes'):
            print("SKIP_TRACK_CHECK set, skipping track check", file=sys.stderr)
            sys.exit(0)

        exit_code = cli_check(files)
        sys.exit(exit_code)

    elif args.command == 'list':
        tm = TrackManager()
        try:
            result = tm.list_active(agent_id=args.agent)
            if result.get('success'):
                tracks = result.get('tracks', [])
                print(f"Active tracks ({len(tracks)}):")
                for t in tracks:
                    files_str = ', '.join(t.get('files', []))
                    expired = ' (EXPIRED)' if t.get('expired') else ''
                    print(
                        f"  - {t['track_id']}: agent={t['agent_id']}, "
                        f"files=[{files_str}]{expired}"
                    )
            else:
                print(f"Error: {result.get('error')}", file=sys.stderr)
                sys.exit(1)
        except WordPressUnavailableError as e:
            print(f"Error: WordPress unavailable: {e}", file=sys.stderr)
            sys.exit(2)

    else:
        parser.print_help()
        sys.exit(1)


if __name__ == "__main__":
    main()
