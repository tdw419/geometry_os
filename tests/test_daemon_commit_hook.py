"""
Tests for Daemon Session DNA Commit Hook.

Task 16 from STATE_V4.md: Add Daemon Session DNA Commit Hook

Tests:
(a) commit_session_dna() function runs git add .loop/ && git commit
(b) Call this function at end of each task completion
(c) Add --auto-commit flag to enable/disable
(d) Handle "nothing to commit" gracefully without error
(e) Log commit SHA to .loop/evolution.log
"""

import pytest
import subprocess
import tempfile
import os
from pathlib import Path
from datetime import datetime
import sys

sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.sisyphus.daemon import SisyphusDaemon, GitCommitHook


class TestGitCommitHookBasic:
    """Tests for basic GitCommitHook functionality."""

    def test_git_commit_hook_import(self):
        """GitCommitHook should be importable."""
        from systems.sisyphus.daemon import GitCommitHook
        assert GitCommitHook is not None

    def test_git_commit_hook_instantiation(self):
        """GitCommitHook should instantiate."""
        hook = GitCommitHook()
        assert hook is not None

    def test_git_commit_hook_has_commit_method(self):
        """GitCommitHook should have commit_session_dna method."""
        hook = GitCommitHook()
        assert hasattr(hook, 'commit_session_dna')


class TestCommitSessionDNA:
    """Tests for commit_session_dna functionality."""

    @pytest.fixture
    def git_repo(self, tmp_path):
        """Create a temporary git repo for testing."""
        repo_dir = tmp_path / "test_repo"
        repo_dir.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=repo_dir, check=True, capture_output=True)

        # Create .loop directory with initial file
        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")

        # Initial commit
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        return repo_dir

    def test_commit_creates_commit(self, git_repo):
        """commit_session_dna should create a git commit."""
        hook = GitCommitHook(repo_path=git_repo)

        # Create a file to commit
        loop_dir = git_repo / ".loop"
        test_file = loop_dir / "test.txt"
        test_file.write_text("test content")

        result = hook.commit_session_dna()

        assert result["success"] == True
        assert result["commit_sha"] is not None

    def test_commit_message_format(self, git_repo):
        """commit_session_dna should use correct message format."""
        hook = GitCommitHook(repo_path=git_repo)

        loop_dir = git_repo / ".loop"
        test_file = loop_dir / "test.txt"
        test_file.write_text("test content")

        result = hook.commit_session_dna()

        # Check the commit message
        log_result = subprocess.run(
            ["git", "log", "-1", "--format=%s"],
            cwd=git_repo, check=True, capture_output=True, text=True
        )
        commit_msg = log_result.stdout.strip()

        assert "daemon session" in commit_msg.lower()

    def test_handles_nothing_to_commit(self, git_repo):
        """commit_session_dna should handle 'nothing to commit' gracefully."""
        hook = GitCommitHook(repo_path=git_repo)

        # No changes to commit
        result = hook.commit_session_dna()

        # Should succeed without error
        assert result["success"] == True
        assert result["nothing_to_commit"] == True or result["commit_sha"] is None

    def test_returns_commit_sha(self, git_repo):
        """commit_session_dna should return commit SHA."""
        hook = GitCommitHook(repo_path=git_repo)

        loop_dir = git_repo / ".loop"
        test_file = loop_dir / "test.txt"
        test_file.write_text("test content")

        result = hook.commit_session_dna()

        assert result["commit_sha"] is not None
        assert len(result["commit_sha"]) >= 7  # Short SHA

    def test_logs_to_evolution_log(self, git_repo):
        """commit_session_dna should log to evolution.log."""
        log_path = git_repo / ".loop" / "evolution.log"
        hook = GitCommitHook(repo_path=git_repo, log_path=log_path)

        loop_dir = git_repo / ".loop"
        test_file = loop_dir / "test.txt"
        test_file.write_text("test content")

        result = hook.commit_session_dna()

        if result["commit_sha"]:
            assert log_path.exists()
            content = log_path.read_text()
            assert result["commit_sha"] in content


class TestDaemonAutoCommit:
    """Tests for daemon --auto-commit flag integration."""

    def test_daemon_has_auto_commit_flag(self):
        """SisyphusDaemon should accept auto_commit parameter."""
        daemon = SisyphusDaemon(auto_commit=True)
        assert daemon.auto_commit == True

    def test_daemon_auto_commit_default_false(self):
        """SisyphusDaemon auto_commit should default to False."""
        daemon = SisyphusDaemon()
        assert daemon.auto_commit == False

    def test_daemon_has_git_commit_hook(self):
        """SisyphusDaemon should have git_commit_hook attribute."""
        daemon = SisyphusDaemon()
        assert hasattr(daemon, 'git_commit_hook')

    def test_commit_on_task_complete(self, tmp_path):
        """Daemon should commit after task completion when auto_commit enabled."""
        # Create a mock git repo
        repo_dir = tmp_path / "test_repo"
        repo_dir.mkdir()
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=repo_dir, check=True, capture_output=True)
        (repo_dir / ".loop").mkdir()
        (repo_dir / ".loop" / ".gitkeep").write_text("")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        daemon = SisyphusDaemon(auto_commit=True)
        daemon.git_commit_hook = GitCommitHook(repo_path=repo_dir)

        # Simulate task completion
        (repo_dir / ".loop" / "test.txt").write_text("test")
        result = daemon._commit_session_dna()

        assert result["success"] == True


class TestCommitHookDisabled:
    """Tests for when auto_commit is disabled."""

    def test_no_commit_when_disabled(self, tmp_path):
        """No commit should be made when auto_commit is False."""
        repo_dir = tmp_path / "test_repo"
        repo_dir.mkdir()
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=repo_dir, check=True, capture_output=True)
        (repo_dir / ".loop").mkdir()
        (repo_dir / ".loop" / ".gitkeep").write_text("")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        daemon = SisyphusDaemon(auto_commit=False)

        # Create a file
        (repo_dir / ".loop" / "test.txt").write_text("test")

        # _commit_session_dna should return None or skip
        result = daemon._commit_session_dna()

        # Should be None or indicate skipped
        assert result is None or result.get("skipped") == True


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
