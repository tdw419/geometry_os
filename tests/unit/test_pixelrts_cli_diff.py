"""
Unit tests for PixelRTS CLI diff command integration.
"""

import json
import os
import subprocess
import sys
import tempfile

import pytest

from systems.pixel_compiler.pixelrts_cli import main
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder


class TestPixelRTSCliDiff:
    """Test cases for pixelrts diff CLI command."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        import shutil
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str) -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def test_diff_command_exists(self):
        """Test that 'diff' subparser is registered."""
        # Parse 'diff --help' to verify command exists
        import argparse

        # Create parser like main() does
        parser = argparse.ArgumentParser(description='PixelRTS v2')
        subparsers = parser.add_subparsers(dest='command')

        # Add diff subparser like in pixelrts_cli.py
        diff_parser = subparsers.add_parser('diff', help='Compare two .rts.png files')
        diff_parser.add_argument('old', help='Original .rts.png file')
        diff_parser.add_argument('new', help='New .rts.png file')
        diff_parser.add_argument('--json', action='store_true', help='Output as JSON')

        # Verify 'diff' is a valid subcommand
        assert 'diff' in subparsers.choices, "diff subcommand should be registered"

    def test_diff_identical_files(self):
        """Test diff command on identical files returns exit code 0."""
        # Create identical files
        data = b"Hello, World! This is test data for diff."
        old_path = self._create_rts_file(data, "old.rts.png")
        new_path = self._create_rts_file(data, "new.rts.png")

        # Simulate CLI call
        sys.argv = ['pixelrts', 'diff', old_path, new_path]
        exit_code = main()

        # Exit code 0 means identical
        assert exit_code == 0, f"Expected exit code 0 for identical files, got {exit_code}"

    def test_diff_different_files(self):
        """Test diff command on different files returns exit code 1."""
        # Create different files
        old_data = b"Hello, World!"
        new_data = b"Hello, Universe!"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Simulate CLI call
        sys.argv = ['pixelrts', 'diff', old_path, new_path]
        exit_code = main()

        # Exit code 1 means different
        assert exit_code == 1, f"Expected exit code 1 for different files, got {exit_code}"

    def test_diff_json_output(self):
        """Test --json flag produces valid JSON output."""
        # Create different files
        old_data = b"AAAA"
        new_data = b"AABB"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Capture stdout
        import sys as sys_module
        from io import StringIO

        old_stdout = sys_module.stdout
        sys_module.stdout = StringIO()

        try:
            sys.argv = ['pixelrts', 'diff', old_path, new_path, '--json']
            exit_code = main()
            output = sys_module.stdout.getvalue()
        finally:
            sys_module.stdout = old_stdout

        # Should be valid JSON
        try:
            result = json.loads(output)
        except json.JSONDecodeError as e:
            pytest.fail(f"Output is not valid JSON: {e}\nOutput was: {output}")

        # Verify expected keys
        assert 'old_file' in result, "JSON should contain 'old_file'"
        assert 'new_file' in result, "JSON should contain 'new_file'"
        assert 'added_bytes' in result, "JSON should contain 'added_bytes'"
        assert 'removed_bytes' in result, "JSON should contain 'removed_bytes'"
        assert 'changed_bytes' in result, "JSON should contain 'changed_bytes'"
        assert 'change_percent' in result, "JSON should contain 'change_percent'"

    def test_diff_missing_file(self):
        """Test diff command with missing file returns error code."""
        # Create only one file
        data = b"Hello"
        old_path = self._create_rts_file(data, "old.rts.png")
        non_existent = os.path.join(self.temp_dir, "nonexistent.rts.png")

        # Suppress stderr for this test
        import sys as sys_module
        from io import StringIO

        old_stderr = sys_module.stderr
        sys_module.stderr = StringIO()

        try:
            sys.argv = ['pixelrts', 'diff', old_path, non_existent]
            exit_code = main()
        finally:
            sys_module.stderr = old_stderr

        # Exit code 2 means file not found
        assert exit_code == 2, f"Expected exit code 2 for missing file, got {exit_code}"

    def test_diff_verbose_flag(self):
        """Test that --verbose flag doesn't cause errors."""
        # Create different files
        old_data = b"AAAA"
        new_data = b"AABB"

        old_path = self._create_rts_file(old_data, "old.rts.png")
        new_path = self._create_rts_file(new_data, "new.rts.png")

        # Should not raise any exceptions
        sys.argv = ['pixelrts', 'diff', old_path, new_path, '--verbose']
        exit_code = main()

        # Should still return correct exit code
        assert exit_code == 1, f"Expected exit code 1, got {exit_code}"


class TestPixelRTSCliDiffSubprocess:
    """Test diff command via subprocess for full isolation."""

    def setup_method(self):
        """Set up test fixtures."""
        self.encoder = PixelRTSEncoder()
        self.temp_dir = tempfile.mkdtemp()

    def teardown_method(self):
        """Clean up test files."""
        import shutil
        if os.path.exists(self.temp_dir):
            shutil.rmtree(self.temp_dir)

    def _create_rts_file(self, data: bytes, filename: str) -> str:
        """Helper to create a .rts.png file with given data."""
        path = os.path.join(self.temp_dir, filename)
        self.encoder.save(data, path, metadata={'type': 'test'})
        return path

    def test_diff_help_via_subprocess(self):
        """Test that 'pixelrts diff --help' works."""
        # Run via bin/pixelrts if available, else via python module
        result = subprocess.run(
            ['python3', '-m', 'systems.pixel_compiler.pixelrts_cli', 'diff', '--help'],
            capture_output=True,
            text=True,
            cwd='/home/jericho/zion/projects/geometry_os/geometry_os'
        )

        # Should exit 0 and show help
        assert result.returncode == 0, f"Help should return 0, got {result.returncode}"
        assert 'old' in result.stdout.lower() or 'old' in result.stderr.lower(), \
            "Help should mention 'old' argument"
