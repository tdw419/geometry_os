#!/usr/bin/env python3
"""
Unit tests for gos-term CLI argparse.

Run with: python -m pytest systems/visual_shell/api/tests/test_gos_term_cli.py::TestParseArgs -v

Tests verify:
- Argument parsing with various inputs
- Default values for optional arguments
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
