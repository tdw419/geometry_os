#!/usr/bin/env python3
"""
Unit and integration tests for gos-term CLI.

Run unit tests: python -m pytest systems/visual_shell/api/tests/test_gos_term_cli.py::TestParseArgs -v
Run integration tests: python -m pytest systems/visual_shell/api/tests/test_gos_term_cli.py::TestRunCommand -v

Tests verify:
- Argument parsing with various inputs
- Default values for optional arguments
- Command execution via WebSocket bridge
- Timeout handling
"""

import pytest
import sys
from unittest.mock import patch


class TestParseArgs:
    """Tests for parse_args() function."""

    def test_default_values(self):
        """Test that default values are set correctly."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term']):
            args = parse_args()

            assert args.command == []
            assert args.interactive is False
            assert args.port == 8769
            assert args.neb is False
            assert args.timeout == 10.0

    def test_command_args(self):
        """Test parsing command arguments."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', 'echo', 'hello', 'world']):
            args = parse_args()

            assert args.command == ['echo', 'hello', 'world']
            assert args.interactive is False

    def test_single_command(self):
        """Test parsing a single command."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', 'ls']):
            args = parse_args()

            assert args.command == ['ls']

    def test_interactive_flag_short(self):
        """Test -i flag for interactive mode."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '-i']):
            args = parse_args()

            assert args.interactive is True

    def test_interactive_flag_long(self):
        """Test --interactive flag for interactive mode."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '--interactive']):
            args = parse_args()

            assert args.interactive is True

    def test_port_flag_short(self):
        """Test -p flag for custom port."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '-p', '9000', 'echo', 'test']):
            args = parse_args()

            assert args.port == 9000
            assert args.command == ['echo', 'test']

    def test_port_flag_long(self):
        """Test --port flag for custom port."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '--port', '9999', 'echo', 'test']):
            args = parse_args()

            assert args.port == 9999

    def test_neb_flag(self):
        """Test --neb flag for NEB event publishing."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '--neb', 'echo', 'test']):
            args = parse_args()

            assert args.neb is True

    def test_timeout_flag(self):
        """Test --timeout flag for custom timeout."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '--timeout', '30', 'echo', 'test']):
            args = parse_args()

            assert args.timeout == 30.0

    def test_timeout_flag_float(self):
        """Test --timeout flag with float value."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '--timeout', '5.5', 'echo', 'test']):
            args = parse_args()

            assert args.timeout == 5.5

    def test_all_flags_combined(self):
        """Test all flags combined with command."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', [
            'gos-term',
            '-i',
            '-p', '9000',
            '--neb',
            '--timeout', '20.5',
            'echo', 'hello', 'world'
        ]):
            args = parse_args()

            assert args.interactive is True
            assert args.port == 9000
            assert args.neb is True
            assert args.timeout == 20.5
            assert args.command == ['echo', 'hello', 'world']

    def test_flags_before_command(self):
        """Test that flags can come before command."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '--port', '8080', 'echo', 'hello']):
            args = parse_args()

            assert args.port == 8080
            assert args.command == ['echo', 'hello']

    def test_flags_after_command(self):
        """Test that flags can come after command (argparse handles this)."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', 'echo', 'hello', '--port', '8080']):
            args = parse_args()

            # argparse recognizes flags even after positional args
            assert args.command == ['echo', 'hello']
            assert args.port == 8080

    def test_empty_command(self):
        """Test with no command arguments."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term']):
            args = parse_args()

            assert args.command == []
            assert args.interactive is False

    def test_interactive_with_port(self):
        """Test interactive mode with custom port."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '-i', '-p', '9999']):
            args = parse_args()

            assert args.interactive is True
            assert args.port == 9999

    def test_help_flag(self):
        """Test --help flag raises SystemExit."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '--help']):
            with pytest.raises(SystemExit) as exc_info:
                parse_args()
            # --help exits with 0
            assert exc_info.value.code == 0

    def test_invalid_port_type(self):
        """Test that invalid port type raises SystemExit."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '-p', 'not_a_number', 'echo', 'test']):
            with pytest.raises(SystemExit) as exc_info:
                parse_args()
            # Invalid argument exits with 2
            assert exc_info.value.code == 2

    def test_invalid_timeout_type(self):
        """Test that invalid timeout type raises SystemExit."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', '--timeout', 'not_a_number', 'echo', 'test']):
            with pytest.raises(SystemExit) as exc_info:
                parse_args()
            # Invalid argument exits with 2
            assert exc_info.value.code == 2

    def test_command_with_special_characters(self):
        """Test command with special characters."""
        from systems.visual_shell.api.gos_term_cli import parse_args

        with patch.object(sys, 'argv', ['gos-term', 'echo', 'hello-world', 'test_file.txt']):
            args = parse_args()

            assert args.command == ['echo', 'hello-world', 'test_file.txt']


# Helper to check if bridge is running
def _is_bridge_running(port: int = 8769) -> bool:
    """Check if terminal websocket bridge is accessible."""
    import socket
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        result = sock.connect_ex(('localhost', port))
        sock.close()
        return result == 0
    except Exception:
        return False


# Skip decorator for integration tests requiring bridge
requires_bridge = pytest.mark.skipif(
    not _is_bridge_running(),
    reason="Terminal bridge not running. Start with: python3 systems/visual_shell/api/terminal_websocket_bridge.py"
)


@requires_bridge
class TestRunCommand:
    """Integration tests for run_command() function - requires running bridge."""

    def test_simple_echo_command(self):
        """Test executing a simple echo command."""
        from systems.visual_shell.api.gos_term_cli import run_command

        output = run_command(['echo', 'INTEGRATION_TEST_123'])
        assert 'INTEGRATION_TEST_123' in output

    def test_echo_with_multiple_args(self):
        """Test echo with multiple arguments."""
        from systems.visual_shell.api.gos_term_cli import run_command

        output = run_command(['echo', 'hello', 'world', 'test'])
        assert 'hello' in output
        assert 'world' in output
        assert 'test' in output

    def test_custom_port_parameter(self):
        """Test that custom port is accepted (connection may fail if wrong port)."""
        from systems.visual_shell.api.gos_term_cli import run_command
        import asyncio

        # Using default port should work
        output = run_command(['echo', 'PORT_TEST'], port=8769)
        assert 'PORT_TEST' in output

    def test_command_with_pipe(self):
        """Test command with pipe."""
        from systems.visual_shell.api.gos_term_cli import run_command

        # Note: pipe needs shell interpretation
        output = run_command(['sh', '-c', 'echo PIPED_OUTPUT | cat'])
        assert 'PIPED_OUTPUT' in output

    def test_command_exit_code_success(self):
        """Test command that exits successfully."""
        from systems.visual_shell.api.gos_term_cli import run_command

        # true command always exits with 0
        output = run_command(['true'])
        # Should not raise an exception
        assert isinstance(output, str)

    def test_command_with_stderr(self):
        """Test command that writes to stderr."""
        from systems.visual_shell.api.gos_term_cli import run_command

        # Write to stderr, should still capture output
        output = run_command(['sh', '-c', 'echo STDERR_TEST >&2'])
        # PTY combines stdout and stderr
        assert 'STDERR_TEST' in output

    def test_long_output(self):
        """Test command with longer output."""
        from systems.visual_shell.api.gos_term_cli import run_command

        # Use printf for multi-line output instead of for loop
        output = run_command(['printf', 'LINE_1\nLINE_2\nLINE_3\nLINE_4\nLINE_5'])
        assert 'LINE_1' in output
        assert 'LINE_5' in output

    def test_neb_flag_no_crash(self):
        """Test that NEB flag doesn't crash even if NEB not available."""
        from systems.visual_shell.api.gos_term_cli import run_command

        # NEB flag should work gracefully even if NEBBus not available
        output = run_command(['echo', 'NEB_TEST'], neb=True)
        assert 'NEB_TEST' in output

    def test_timeout_short_command(self):
        """Test timeout with command that completes quickly."""
        from systems.visual_shell.api.gos_term_cli import run_command

        # Short command should complete within timeout
        output = run_command(['echo', 'QUICK'], timeout=5.0)
        assert 'QUICK' in output

    def test_timeout_exceeded(self):
        """Test that timeout is handled for long-running commands."""
        from systems.visual_shell.api.gos_term_cli import run_command
        import subprocess
        import sys

        # Use very short timeout with sleep command
        # The command should timeout and return partial output
        output = run_command(['sleep', '10'], timeout=1.0)
        # Output should be a string (possibly empty or partial)
        assert isinstance(output, str)

    def test_empty_command_output(self):
        """Test command that produces no output."""
        from systems.visual_shell.api.gos_term_cli import run_command

        # true produces no output
        output = run_command(['true'])
        # May contain prompt or control chars, but shouldn't crash
        assert isinstance(output, str)

    def test_special_characters_in_command(self):
        """Test command with special characters."""
        from systems.visual_shell.api.gos_term_cli import run_command

        output = run_command(['echo', 'test-with-dashes_and_underscores'])
        assert 'test-with-dashes_and_underscores' in output
