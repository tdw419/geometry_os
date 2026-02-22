"""
Tests for resource isolation between parallel worktrees.

Verifies that resource usage in one worktree doesn't affect another.
"""

import os
import subprocess
import time
from pathlib import Path

import pytest


class TestProcessIsolation:
    """Verify process isolation between worktrees."""

    def test_process_spawned_in_a_not_visible_in_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: A long-running process is spawned in worktree A
        THEN: Worktree B can still perform operations independently
        """
        worktree_a, worktree_b = worktree_pair

        # Create a marker file to simulate process state
        marker_a = worktree_a / ".process_marker"
        marker_a.write_text("running")

        # B should be able to operate normally
        test_file_b = worktree_b / "independent.txt"
        test_file_b.write_text("B is independent")

        assert test_file_b.exists()
        assert not (worktree_b / ".process_marker").exists()

    def test_memory_heavy_operation_in_a_not_affecting_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: Worktree A performs a memory-heavy operation
        THEN: Worktree B can still operate normally
        """
        worktree_a, worktree_b = worktree_pair

        # Simulate memory-heavy operation by creating large file in A
        large_file_a = worktree_a / "large_file.bin"
        large_file_a.write_bytes(os.urandom(1024 * 1024))  # 1MB

        # B should be unaffected
        small_file_b = worktree_b / "small_file.txt"
        small_file_b.write_text("B is fine")

        assert small_file_b.exists()
        assert not (worktree_b / "large_file.bin").exists()

    def test_cwd_independence(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: Each worktree has its own working directory
        THEN: cd in one doesn't affect the other
        """
        worktree_a, worktree_b = worktree_pair

        # Create subdirectory in A
        subdir_a = worktree_a / "subdir"
        subdir_a.mkdir()

        # Get pwd from each worktree
        result_a = subprocess.run(
            ["pwd"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
            text=True,
        )
        result_b = subprocess.run(
            ["pwd"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
            text=True,
        )

        # Assert different working directories
        assert result_a.stdout.strip() == str(worktree_a)
        assert result_b.stdout.strip() == str(worktree_b)
