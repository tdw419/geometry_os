"""
Tests for Daemon Session DNA Commit Hook.

Task 16 from STATE_V4.md: Add Daemon Session DNA Commit Hook

Tests:
(a) commit_session_dna() function runs git add .loop/ && git commit
(b) Call this function at end of each task completion
(c) Add --auto-commit flag to enable/disable
(d) Handle "nothing to commit" gracefully without error
(e) Log commit SHA to .loop/evolution.log
(f) Detect merge conflicts and skip commit
(g) --force-resolve option to auto-resolve conflicts
"""

import subprocess
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.sisyphus.daemon import GitCommitHook, SisyphusDaemon


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

    def test_git_commit_hook_has_conflict_detection(self):
        """GitCommitHook should have detect_merge_conflicts method."""
        hook = GitCommitHook()
        assert hasattr(hook, 'detect_merge_conflicts')

    def test_git_commit_hook_has_force_resolve(self):
        """GitCommitHook should have force_resolve_conflicts method."""
        hook = GitCommitHook()
        assert hasattr(hook, 'force_resolve_conflicts')


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


class TestMergeConflictDetection:
    """Tests for merge conflict detection."""

    @pytest.fixture
    def git_repo_with_conflict(self, tmp_path):
        """Create a git repo with a simulated merge conflict."""
        repo_dir = tmp_path / "test_repo"
        repo_dir.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=repo_dir, check=True, capture_output=True)

        # Create .loop directory with STATE_V4.md
        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        state_file = loop_dir / "STATE_V4.md"
        state_file.write_text("# Original content\n")

        # Initial commit on main
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        # Create branch and modify file
        subprocess.run(["git", "checkout", "-b", "feature"], cwd=repo_dir, check=True, capture_output=True)
        state_file.write_text("# Feature branch content\n")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "feature change"], cwd=repo_dir, check=True, capture_output=True)

        # Go back to main and make conflicting change
        subprocess.run(["git", "checkout", "master"], cwd=repo_dir, check=True, capture_output=True)
        state_file.write_text("# Main branch content\n")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "main change"], cwd=repo_dir, check=True, capture_output=True)

        # Try to merge (will conflict)
        merge_result = subprocess.run(
            ["git", "merge", "feature"],
            cwd=repo_dir,
            capture_output=True,
            text=True
        )
        # Expect conflict
        assert merge_result.returncode != 0 or "CONFLICT" in merge_result.stdout

        return repo_dir

    def test_detect_merge_conflicts_returns_list(self, git_repo_with_conflict):
        """detect_merge_conflicts should return list of conflicted files."""
        hook = GitCommitHook(repo_path=git_repo_with_conflict)

        conflicts = hook.detect_merge_conflicts()

        assert isinstance(conflicts, list)
        assert len(conflicts) > 0

    def test_detect_merge_conflicts_finds_conflicted_file(self, git_repo_with_conflict):
        """detect_merge_conflicts should find the STATE_V4.md conflict."""
        hook = GitCommitHook(repo_path=git_repo_with_conflict)

        conflicts = hook.detect_merge_conflicts()

        # Should find .loop/STATE_V4.md in conflicts
        found = any("STATE_V4.md" in c for c in conflicts)
        assert found

    def test_commit_skips_on_merge_conflict(self, git_repo_with_conflict):
        """commit_session_dna should skip commit when conflict exists."""
        hook = GitCommitHook(repo_path=git_repo_with_conflict)

        result = hook.commit_session_dna()

        assert result["success"] == False
        assert result["error"] == "merge_conflict"
        assert "conflicted_files" in result

    def test_commit_logs_conflict_warning(self, git_repo_with_conflict):
        """commit_session_dna should log conflict warning to evolution.log."""
        log_path = git_repo_with_conflict / ".loop" / "evolution.log"
        hook = GitCommitHook(repo_path=git_repo_with_conflict, log_path=log_path)

        hook.commit_session_dna()

        assert log_path.exists()
        content = log_path.read_text()
        assert "merge conflict" in content.lower() or "WARNING" in content

    def test_no_conflict_returns_empty_list(self, tmp_path):
        """detect_merge_conflicts should return empty list when no conflicts."""
        repo_dir = tmp_path / "test_repo"
        repo_dir.mkdir()

        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=repo_dir, check=True, capture_output=True)

        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")

        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        hook = GitCommitHook(repo_path=repo_dir)
        conflicts = hook.detect_merge_conflicts()

        assert conflicts == []


class TestForceResolve:
    """Tests for --force-resolve option."""

    @pytest.fixture
    def git_repo_with_conflict(self, tmp_path):
        """Create a git repo with a simulated merge conflict."""
        repo_dir = tmp_path / "test_repo"
        repo_dir.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=repo_dir, check=True, capture_output=True)

        # Create .loop directory with STATE_V4.md
        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        state_file = loop_dir / "STATE_V4.md"
        state_file.write_text("# Original content\n")

        # Initial commit on main
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        # Create branch and modify file
        subprocess.run(["git", "checkout", "-b", "feature"], cwd=repo_dir, check=True, capture_output=True)
        state_file.write_text("# Feature branch content\n")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "feature change"], cwd=repo_dir, check=True, capture_output=True)

        # Go back to main and make conflicting change
        subprocess.run(["git", "checkout", "master"], cwd=repo_dir, check=True, capture_output=True)
        state_file.write_text("# Main branch content\n")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "main change"], cwd=repo_dir, check=True, capture_output=True)

        # Try to merge (will conflict)
        subprocess.run(
            ["git", "merge", "feature"],
            cwd=repo_dir,
            capture_output=True
        )

        return repo_dir

    @pytest.fixture
    def git_repo(self, tmp_path):
        """Create a temporary git repo for testing."""
        repo_dir = tmp_path / "test_repo"
        repo_dir.mkdir()

        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=repo_dir, check=True, capture_output=True)

        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")

        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        return repo_dir

    def test_force_resolve_resolves_conflict(self, git_repo_with_conflict):
        """force_resolve_conflicts should resolve conflicts."""
        hook = GitCommitHook(repo_path=git_repo_with_conflict)

        conflicts_before = hook.detect_merge_conflicts()
        assert len(conflicts_before) > 0

        result = hook.force_resolve_conflicts(conflicts_before)

        assert result["success"] == True
        assert len(result["resolved_paths"]) > 0

    def test_force_resolve_uses_ours_strategy(self, git_repo_with_conflict):
        """force_resolve_conflicts should use --ours strategy."""
        hook = GitCommitHook(repo_path=git_repo_with_conflict)

        conflicts = hook.detect_merge_conflicts()
        hook.force_resolve_conflicts(conflicts)

        # Check that the file now has main branch content
        state_file = git_repo_with_conflict / ".loop" / "STATE_V4.md"
        content = state_file.read_text()

        # Main branch content should be preserved (--ours)
        assert "Main branch content" in content

    def test_commit_with_force_resolve_succeeds(self, git_repo_with_conflict):
        """commit_session_dna with force_resolve=True should succeed."""
        hook = GitCommitHook(repo_path=git_repo_with_conflict)

        result = hook.commit_session_dna(force_resolve=True)

        assert result["success"] == True

    def test_force_resolve_logs_to_evolution_log(self, git_repo_with_conflict):
        """force_resolve_conflicts should log to evolution.log."""
        log_path = git_repo_with_conflict / ".loop" / "evolution.log"
        hook = GitCommitHook(repo_path=git_repo_with_conflict, log_path=log_path)

        conflicts = hook.detect_merge_conflicts()
        hook.force_resolve_conflicts(conflicts)

        assert log_path.exists()
        content = log_path.read_text()
        assert "force-resolved" in content.lower() or "--ours" in content.lower()


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

    def test_daemon_commit_supports_force_resolve(self, tmp_path):
        """Daemon _commit_session_dna should support force_resolve parameter."""
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

        # Should accept force_resolve parameter
        (repo_dir / ".loop" / "test.txt").write_text("test")
        result = daemon._commit_session_dna(force_resolve=True)

        assert result is not None


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
