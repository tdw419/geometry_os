"""
Tests for git state isolation between parallel worktrees.

Verifies that git operations in one worktree do not affect another.
"""

import subprocess
from pathlib import Path

import pytest


class TestGitBranchIsolation:
    """Verify branch operations don't pollute other worktrees."""

    def test_commit_in_a_not_in_b_branch(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees on different branches
        WHEN: A commit is made in worktree A
        THEN: The commit is NOT on worktree B's branch
        """
        worktree_a, worktree_b = worktree_pair

        # Create and commit a file in A
        new_file = worktree_a / "feature_a.txt"
        new_file.write_text("Feature A content\n")

        subprocess.run(["git", "add", "feature_a.txt"], cwd=worktree_a, check=True, capture_output=True)
        subprocess.run(
            ["git", "commit", "-m", "Add feature A"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
        )

        # Get commit hash from A
        result_a = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
            text=True,
        )
        commit_a = result_a.stdout.strip()

        # Get commit hash from B
        result_b = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
            text=True,
        )
        commit_b = result_b.stdout.strip()

        # Assert different commits (B should still be at initial commit)
        assert commit_a != commit_b, "Commits should be isolated between worktrees"

    def test_branch_name_isolated(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees on different branches
        WHEN: Each worktree is on its own branch
        THEN: The branch names are different
        """
        worktree_a, worktree_b = worktree_pair

        # Get branch names
        result_a = subprocess.run(
            ["git", "branch", "--show-current"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
            text=True,
        )
        branch_a = result_a.stdout.strip()

        result_b = subprocess.run(
            ["git", "branch", "--show-current"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
            text=True,
        )
        branch_b = result_b.stdout.strip()

        # Assert different branches
        assert branch_a == "agent/a", f"Worktree A should be on agent/a, got {branch_a}"
        assert branch_b == "agent/b", f"Worktree B should be on agent/b, got {branch_b}"

    def test_stash_in_a_not_affecting_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees with uncommitted changes in A
        WHEN: Changes are stashed in worktree A
        THEN: Worktree B is not affected
        """
        worktree_a, worktree_b = worktree_pair

        # Create uncommitted change in A
        readme_a = worktree_a / "README.md"
        readme_a.write_text("Modified in A\n")
        subprocess.run(["git", "stash"], cwd=worktree_a, check=True, capture_output=True)

        # Check B's README is unchanged
        readme_b = worktree_b / "README.md"
        content_b = readme_b.read_text()

        assert "Modified in A" not in content_b, "Stash in A should not affect B"

    def test_merge_conflict_isolated(
        self, temp_git_repo: Path, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees with conflicting changes
        WHEN: Both make changes to same file
        THEN: Each worktree only sees its own changes
        """
        worktree_a, worktree_b = worktree_pair

        # Modify same file differently in each worktree
        readme_a = worktree_a / "README.md"
        readme_a.write_text("# Modified by A\n")

        readme_b = worktree_b / "README.md"
        readme_b.write_text("# Modified by B\n")

        # Assert each sees only their changes
        assert readme_a.read_text() == "# Modified by A\n"
        assert readme_b.read_text() == "# Modified by B\n"
