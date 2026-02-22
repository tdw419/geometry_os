"""
Fixtures for isolation testing.

Provides temporary git repositories and worktree pairs for testing
isolation between parallel agent sessions.
"""

import os
import subprocess
import tempfile
from pathlib import Path
from typing import Generator, Tuple

import pytest


@pytest.fixture
def temp_git_repo() -> Generator[Path, None, None]:
    """Create a temporary git repository for testing."""
    with tempfile.TemporaryDirectory() as tmpdir:
        repo_path = Path(tmpdir) / "test_repo"
        repo_path.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(
            ["git", "config", "user.email", "test@test.com"],
            cwd=repo_path,
            check=True,
            capture_output=True,
        )
        subprocess.run(
            ["git", "config", "user.name", "Test User"],
            cwd=repo_path,
            check=True,
            capture_output=True,
        )

        # Create initial commit
        (repo_path / "README.md").write_text("# Test Repository\n")
        subprocess.run(["git", "add", "README.md"], cwd=repo_path, check=True, capture_output=True)
        subprocess.run(
            ["git", "commit", "-m", "Initial commit"],
            cwd=repo_path,
            check=True,
            capture_output=True,
        )

        yield repo_path


@pytest.fixture
def worktree_pair(temp_git_repo: Path) -> Generator[Tuple[Path, Path], None, None]:
    """
    Create two worktrees from the same repository.

    Returns:
        Tuple of (worktree_a_path, worktree_b_path)
    """
    worktrees_dir = temp_git_repo / ".worktrees"
    worktrees_dir.mkdir()

    worktree_a = worktrees_dir / "agent-a"
    worktree_b = worktrees_dir / "agent-b"

    # Create worktrees on new branches
    subprocess.run(
        ["git", "worktree", "add", str(worktree_a), "-b", "agent/a"],
        cwd=temp_git_repo,
        check=True,
        capture_output=True,
    )
    subprocess.run(
        ["git", "worktree", "add", str(worktree_b), "-b", "agent/b"],
        cwd=temp_git_repo,
        check=True,
        capture_output=True,
    )

    yield (worktree_a, worktree_b)

    # Cleanup worktrees
    subprocess.run(
        ["git", "worktree", "remove", "--force", str(worktree_a)],
        cwd=temp_git_repo,
        capture_output=True,
    )
    subprocess.run(
        ["git", "worktree", "remove", "--force", str(worktree_b)],
        cwd=temp_git_repo,
        capture_output=True,
    )


@pytest.fixture
def isolated_file_content() -> str:
    """Sample content for file isolation tests."""
    return "This is test content that should not leak between worktrees.\n"
