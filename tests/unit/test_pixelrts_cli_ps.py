"""
Tests for CLI ps command with ephemeral indicator support.

Tests the EPHEM column showing [E] for ephemeral containers
and the is_ephemeral field in JSON output.
"""

import json
import tempfile
from io import StringIO
from pathlib import Path
from unittest.mock import MagicMock, patch


class TestPsEphemeralIndicator:
    """Tests for ps command ephemeral indicator in table output."""

    def test_ps_shows_ephemeral_indicator(self):
        """Table output includes [E] for ephemeral containers."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        # Create temp state file with ephemeral container
        state_data = [
            {'name': 'regular', 'path': '/tmp/regular.rts.png', 'state': 'running', 'vnc_port': 5900, 'pid': 12345, 'is_ephemeral': False},
            {'name': 'ephemeral-test', 'path': '/tmp/eph.rts.png', 'state': 'running', 'vnc_port': 5901, 'pid': 12346, 'is_ephemeral': True}
        ]

        with tempfile.TemporaryDirectory() as tmpdir:
            state_file = Path(tmpdir) / 'containers.json'
            state_file.write_text(json.dumps(state_data))

            args = MagicMock(
                state_file=str(state_file),
                json=False
            )

            captured_output = StringIO()
            with patch('sys.stdout', captured_output):
                cmd_ps(args)

            output = captured_output.getvalue()

            # Should contain [E] indicator
            assert '[E]' in output, f"[E] not found in output:\n{output}"
            # EPHEM column header should exist
            assert 'EPHEM' in output, f"EPHEM column header not found in output:\n{output}"

    def test_ps_no_indicator_for_regular(self):
        """Regular containers have no [E] indicator."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        # Create temp state file with only regular containers
        state_data = [
            {'name': 'regular1', 'path': '/tmp/regular1.rts.png', 'state': 'running', 'vnc_port': 5900, 'pid': 12345, 'is_ephemeral': False},
            {'name': 'regular2', 'path': '/tmp/regular2.rts.png', 'state': 'running', 'vnc_port': 5901, 'pid': 12346, 'is_ephemeral': False}
        ]

        with tempfile.TemporaryDirectory() as tmpdir:
            state_file = Path(tmpdir) / 'containers.json'
            state_file.write_text(json.dumps(state_data))

            args = MagicMock(
                state_file=str(state_file),
                json=False
            )

            captured_output = StringIO()
            with patch('sys.stdout', captured_output):
                cmd_ps(args)

            output = captured_output.getvalue()

            # Should NOT contain [E] indicator for regular containers
            assert '[E]' not in output, f"[E] should not appear for regular containers:\n{output}"

    def test_ps_json_includes_is_ephemeral(self):
        """JSON output has is_ephemeral field."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        # Create temp state file with both types
        state_data = [
            {'name': 'regular', 'path': '/tmp/regular.rts.png', 'state': 'running', 'is_ephemeral': False},
            {'name': 'ephemeral', 'path': '/tmp/eph.rts.png', 'state': 'running', 'is_ephemeral': True}
        ]

        with tempfile.TemporaryDirectory() as tmpdir:
            state_file = Path(tmpdir) / 'containers.json'
            state_file.write_text(json.dumps(state_data))

            args = MagicMock(
                state_file=str(state_file),
                json=True
            )

            captured_output = StringIO()
            with patch('sys.stdout', captured_output):
                cmd_ps(args)

            output = captured_output.getvalue()
            data = json.loads(output)

            # Verify is_ephemeral field is present in all containers
            for container in data:
                assert 'is_ephemeral' in container, f"is_ephemeral not in {container}"

            # Verify values are correct
            assert data[0]['is_ephemeral'] is False
            assert data[1]['is_ephemeral'] is True

    def test_ps_handles_missing_is_ephemeral_field(self):
        """ps handles containers without is_ephemeral field (defaults to False)."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        # Create temp state file without is_ephemeral field
        state_data = [
            {'name': 'legacy', 'path': '/tmp/legacy.rts.png', 'state': 'running', 'vnc_port': 5900, 'pid': 12345}
        ]

        with tempfile.TemporaryDirectory() as tmpdir:
            state_file = Path(tmpdir) / 'containers.json'
            state_file.write_text(json.dumps(state_data))

            args = MagicMock(
                state_file=str(state_file),
                json=False
            )

            captured_output = StringIO()
            with patch('sys.stdout', captured_output):
                result = cmd_ps(args)

            output = captured_output.getvalue()

            # Should succeed and not show [E] for containers without is_ephemeral
            assert result == 0
            assert '[E]' not in output


class TestPsEmptyState:
    """Tests for ps command with empty or missing state."""

    def test_ps_empty_containers(self):
        """ps handles empty container list gracefully."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        with tempfile.TemporaryDirectory() as tmpdir:
            state_file = Path(tmpdir) / 'containers.json'
            state_file.write_text('[]')

            args = MagicMock(
                state_file=str(state_file),
                json=False
            )

            captured_output = StringIO()
            with patch('sys.stdout', captured_output):
                result = cmd_ps(args)

            output = captured_output.getvalue()

            assert result == 0
            assert 'No containers' in output

    def test_ps_json_empty_containers(self):
        """ps --json returns empty array for empty state."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        with tempfile.TemporaryDirectory() as tmpdir:
            state_file = Path(tmpdir) / 'containers.json'
            state_file.write_text('[]')

            args = MagicMock(
                state_file=str(state_file),
                json=True
            )

            captured_output = StringIO()
            with patch('sys.stdout', captured_output):
                result = cmd_ps(args)

            output = captured_output.getvalue()
            data = json.loads(output)

            assert result == 0
            assert data == []

    def test_ps_missing_state_file(self):
        """ps handles missing state file gracefully."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        args = MagicMock(
            state_file='/nonexistent/containers.json',
            json=False
        )

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            result = cmd_ps(args)

        output = captured_output.getvalue()

        assert result == 0
        assert 'No containers' in output

    def test_ps_json_missing_state_file(self):
        """ps --json returns empty array for missing state file."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        args = MagicMock(
            state_file='/nonexistent/containers.json',
            json=True
        )

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            result = cmd_ps(args)

        output = captured_output.getvalue()

        assert result == 0
        assert output.strip() == '[]'


class TestPsMixedContainers:
    """Tests for ps with mixed ephemeral and regular containers."""

    def test_ps_mixed_containers_table_format(self):
        """ps correctly displays mix of ephemeral and regular containers."""
        from systems.pixel_compiler.pixelrts_cli import cmd_ps

        state_data = [
            {'name': 'regular-a', 'path': '/tmp/a.rts.png', 'state': 'running', 'vnc_port': 5900, 'pid': 1001, 'is_ephemeral': False},
            {'name': 'ephemeral-b', 'path': '/tmp/b.rts.png', 'state': 'running', 'vnc_port': 5901, 'pid': 1002, 'is_ephemeral': True},
            {'name': 'regular-c', 'path': '/tmp/c.rts.png', 'state': 'stopped', 'vnc_port': None, 'pid': None, 'is_ephemeral': False},
            {'name': 'ephemeral-d', 'path': '/tmp/d.rts.png', 'state': 'paused', 'vnc_port': 5903, 'pid': 1004, 'is_ephemeral': True}
        ]

        with tempfile.TemporaryDirectory() as tmpdir:
            state_file = Path(tmpdir) / 'containers.json'
            state_file.write_text(json.dumps(state_data))

            args = MagicMock(
                state_file=str(state_file),
                json=False
            )

            captured_output = StringIO()
            with patch('sys.stdout', captured_output):
                cmd_ps(args)

            output = captured_output.getvalue()
            lines = output.strip().split('\n')

            # Should have header, separator, and 4 data rows
            assert len(lines) == 6

            # Check [E] appears exactly twice (for ephemeral containers)
            e_count = output.count('[E]')
            assert e_count == 2, f"Expected 2 [E] indicators, found {e_count}"
