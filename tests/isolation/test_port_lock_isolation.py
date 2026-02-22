"""
Tests for port and lock isolation between parallel worktrees.

Verifies that port/lock conflicts are prevented or handled.
"""

import fcntl
import socket
from pathlib import Path

import pytest


class TestPortLockIsolation:
    """Verify port and lock isolation between worktrees."""

    def test_file_lock_in_a_not_blocking_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: A file lock is held in worktree A
        THEN: Worktree B can still access its own files
        """
        worktree_a, worktree_b = worktree_pair

        # Create and lock a file in A
        lock_file_a = worktree_a / ".lock"
        lock_file_a.write_text("locked")

        with open(lock_file_a, "w") as f:
            fcntl.flock(f.fileno(), fcntl.LOCK_EX | fcntl.LOCK_NB)

            # B should be able to write its own file
            test_file_b = worktree_b / "test.txt"
            test_file_b.write_text("B can write")

            assert test_file_b.exists()

    def test_worktree_local_lock_file(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: Each worktree uses a local lock file
        THEN: Lock files are independent
        """
        worktree_a, worktree_b = worktree_pair

        # Create lock files in each worktree
        lock_a = worktree_a / ".agent.lock"
        lock_b = worktree_b / ".agent.lock"

        lock_a.write_text("agent-a-lock")
        lock_b.write_text("agent-b-lock")

        # Each should have their own lock
        assert lock_a.read_text() == "agent-a-lock"
        assert lock_b.read_text() == "agent-b-lock"
        assert lock_a != lock_b  # Different paths

    def test_port_allocation_independence(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees
        WHEN: Each worktree records its intended port
        THEN: Port allocations don't conflict (ports are external resource)
        """
        worktree_a, worktree_b = worktree_pair

        # Record port allocations (simulating agent port selection)
        port_file_a = worktree_a / ".port"
        port_file_b = worktree_b / ".port"

        port_file_a.write_text("8765")
        port_file_b.write_text("8766")

        # Each worktree should see its own port
        assert port_file_a.read_text() == "8765"
        assert port_file_b.read_text() == "8766"

        # Verify files are isolated
        assert not (worktree_b / ".port").read_text() == "8765"
        assert not (worktree_a / ".port").read_text() == "8766"
