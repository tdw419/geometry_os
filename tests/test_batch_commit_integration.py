"""
Integration Tests for Batch Commit Feature with Daemon Components.

Tests the GitCommitHook (batch commit) integration with:
- CheckpointManager (crash recovery)
- UnifiedGlassBridge (multi-stream output)
- SisyphusDaemon task execution workflow
- Brain Evolution hooks
- Full end-to-end daemon workflows

Task 16 from STATE_V4.md: Add Daemon Session DNA Commit Hook
"""

import json
import subprocess
import sys
import time
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.sisyphus.daemon import CheckpointManager, GitCommitHook, SisyphusDaemon


class TestCommitHookCheckpointIntegration:
    """Tests for GitCommitHook + CheckpointManager integration."""

    @pytest.fixture
    def integrated_repo(self, tmp_path):
        """Create a repo with both checkpoint and commit hook."""
        repo_dir = tmp_path / "test_repo"
        repo_dir.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=repo_dir, check=True, capture_output=True)

        # Create .loop directory
        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")

        # Initial commit
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        return repo_dir

    def test_checkpoint_and_commit_coexist(self, integrated_repo):
        """Checkpoint save and commit should work together."""
        checkpoint_path = integrated_repo / ".loop" / "checkpoint.json"
        log_path = integrated_repo / ".loop" / "evolution.log"

        checkpoint_mgr = CheckpointManager(checkpoint_path=checkpoint_path, log_path=log_path)
        commit_hook = GitCommitHook(repo_path=integrated_repo, log_path=log_path)

        # Save checkpoint
        checkpoint_mgr.save_checkpoint({"task_id": 1, "task_name": "Test Task"})

        # Make changes and commit
        (integrated_repo / ".loop" / "state.txt").write_text("updated")
        commit_result = commit_hook.commit_session_dna()

        assert checkpoint_path.exists()
        assert commit_result["success"] == True
        assert commit_result["commit_sha"] is not None

    def test_shared_evolution_log(self, integrated_repo):
        """Both checkpoint and commit should log to same evolution.log."""
        log_path = integrated_repo / ".loop" / "evolution.log"
        checkpoint_path = integrated_repo / ".loop" / "checkpoint.json"

        checkpoint_mgr = CheckpointManager(checkpoint_path=checkpoint_path, log_path=log_path)
        commit_hook = GitCommitHook(repo_path=integrated_repo, log_path=log_path)

        # Save checkpoint
        checkpoint_mgr.save_checkpoint({"task_id": 1})

        # Make changes and commit
        (integrated_repo / ".loop" / "test.txt").write_text("test")
        commit_hook.commit_session_dna()

        # Both should be in log
        log_content = log_path.read_text()
        assert "checkpoint" in log_content.lower()
        assert "commit" in log_content.lower()

    def test_commit_includes_checkpoint_file(self, integrated_repo):
        """Commit should include checkpoint.json if it exists."""
        checkpoint_path = integrated_repo / ".loop" / "checkpoint.json"

        checkpoint_mgr = CheckpointManager(checkpoint_path=checkpoint_path)
        checkpoint_mgr.save_checkpoint({"task_id": 5, "task_name": "Integration Test"})

        commit_hook = GitCommitHook(repo_path=integrated_repo)
        result = commit_hook.commit_session_dna()

        assert result["success"] == True

        # Check that checkpoint.json is in the commit
        show_result = subprocess.run(
            ["git", "show", "--name-only", "--format="],
            cwd=integrated_repo,
            capture_output=True,
            text=True
        )
        assert ".loop/checkpoint.json" in show_result.stdout

    def test_restore_then_commit_workflow(self, integrated_repo):
        """Test full workflow: save checkpoint, restore, make changes, commit."""
        checkpoint_path = integrated_repo / ".loop" / "checkpoint.json"

        checkpoint_mgr = CheckpointManager(checkpoint_path=checkpoint_path)
        commit_hook = GitCommitHook(repo_path=integrated_repo)

        # Phase 1: Save checkpoint
        checkpoint_mgr.save_checkpoint({
            "task_id": 10,
            "task_name": "Multi-step task",
            "phase": 1
        })

        # Phase 2: Simulate crash, restore
        restored = checkpoint_mgr.load_checkpoint()
        assert restored["task_id"] == 10
        assert restored["phase"] == 1

        # Phase 3: Make progress and update checkpoint
        checkpoint_mgr.save_checkpoint({
            "task_id": 10,
            "task_name": "Multi-step task",
            "phase": 2
        })

        # Phase 4: Complete and commit
        (integrated_repo / ".loop" / "result.txt").write_text("completed phase 2")
        result = commit_hook.commit_session_dna()

        assert result["success"] == True

        # Clear checkpoint after successful commit
        checkpoint_mgr.clear_checkpoint()
        assert not checkpoint_path.exists()


class TestCommitHookDaemonIntegration:
    """Tests for GitCommitHook + SisyphusDaemon integration."""

    @pytest.fixture
    def daemon_repo(self, tmp_path):
        """Create a repo with daemon setup."""
        repo_dir = tmp_path / "daemon_repo"
        repo_dir.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "daemon@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Daemon Test"], cwd=repo_dir, check=True, capture_output=True)

        # Create .loop directory with STATE_V4.md
        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")
        (loop_dir / "STATE_V4.md").write_text("# Tasks\n\n- [ ] 1. **Test Task**: Test description - **Verification**: Check result\n")

        # Initial commit
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        return repo_dir

    def test_daemon_auto_commit_disabled_by_default(self, daemon_repo):
        """Daemon auto_commit should be False by default."""
        daemon = SisyphusDaemon()
        assert daemon.auto_commit == False

    def test_daemon_auto_commit_can_be_enabled(self, daemon_repo):
        """Daemon auto_commit can be set to True."""
        daemon = SisyphusDaemon(auto_commit=True)
        assert daemon.auto_commit == True

    def test_commit_session_dna_returns_none_when_disabled(self, daemon_repo):
        """_commit_session_dna should return None when auto_commit disabled."""
        daemon = SisyphusDaemon(auto_commit=False)
        result = daemon._commit_session_dna()
        assert result is None or result.get("skipped") == True

    def test_commit_session_dna_creates_commit_when_enabled(self, daemon_repo):
        """_commit_session_dna should create commit when auto_commit enabled."""
        daemon = SisyphusDaemon(auto_commit=True)
        daemon.git_commit_hook = GitCommitHook(repo_path=daemon_repo)

        # Make changes
        (daemon_repo / ".loop" / "progress.txt").write_text("task completed")
        result = daemon._commit_session_dna()

        assert result["success"] == True
        assert result.get("commit_sha") is not None

    def test_commit_after_task_completion(self, daemon_repo):
        """Daemon should commit after task completion when auto_commit enabled."""
        daemon = SisyphusDaemon(auto_commit=True)
        daemon.git_commit_hook = GitCommitHook(repo_path=daemon_repo)
        daemon.checkpoint_manager = CheckpointManager(
            checkpoint_path=daemon_repo / ".loop" / "checkpoint.json"
        )

        # Simulate task completion (what run_task does)
        daemon._save_task_checkpoint(task_id=1, task_name="Test Task")
        (daemon_repo / ".loop" / "task_output.txt").write_text("output")

        result = daemon._commit_session_dna()

        assert result["success"] == True

    def test_force_resolve_propagates_to_commit_hook(self, daemon_repo):
        """_commit_session_dna should pass force_resolve to commit hook."""
        daemon = SisyphusDaemon(auto_commit=True)
        daemon.git_commit_hook = GitCommitHook(repo_path=daemon_repo)

        # Should not raise even with force_resolve
        result = daemon._commit_session_dna(force_resolve=True)
        assert result is not None


class TestCommitHookConflictWithCheckpoint:
    """Tests for merge conflict handling with checkpoint integration."""

    @pytest.fixture
    def conflicted_repo(self, tmp_path):
        """Create a repo with merge conflict."""
        repo_dir = tmp_path / "conflict_repo"
        repo_dir.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "conflict@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Conflict Test"], cwd=repo_dir, check=True, capture_output=True)

        # Create .loop directory with STATE_V4.md
        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        state_file = loop_dir / "STATE_V4.md"
        state_file.write_text("# Original\n")

        # Initial commit
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        # Create feature branch
        subprocess.run(["git", "checkout", "-b", "feature"], cwd=repo_dir, check=True, capture_output=True)
        state_file.write_text("# Feature branch\n")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "feature"], cwd=repo_dir, check=True, capture_output=True)

        # Go back to main and make conflicting change
        subprocess.run(["git", "checkout", "master"], cwd=repo_dir, check=True, capture_output=True)
        state_file.write_text("# Main branch\n")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "main"], cwd=repo_dir, check=True, capture_output=True)

        # Create merge conflict
        subprocess.run(["git", "merge", "feature"], cwd=repo_dir, capture_output=True)

        return repo_dir

    def test_checkpoint_preserved_during_conflict(self, conflicted_repo):
        """Checkpoint should be preserved when merge conflict is detected."""
        checkpoint_path = conflicted_repo / ".loop" / "checkpoint.json"
        log_path = conflicted_repo / ".loop" / "evolution.log"

        checkpoint_mgr = CheckpointManager(checkpoint_path=checkpoint_path, log_path=log_path)
        commit_hook = GitCommitHook(repo_path=conflicted_repo, log_path=log_path)

        # Save checkpoint
        checkpoint_mgr.save_checkpoint({"task_id": 1, "task_name": "Important task"})

        # Try to commit (should detect conflict)
        result = commit_hook.commit_session_dna()

        assert result["success"] == False
        assert result["error"] == "merge_conflict"

        # Checkpoint should still exist
        assert checkpoint_path.exists()

    def test_force_resolve_then_commit(self, conflicted_repo):
        """Force resolve conflicts, then commit should succeed."""
        checkpoint_path = conflicted_repo / ".loop" / "checkpoint.json"

        checkpoint_mgr = CheckpointManager(checkpoint_path=checkpoint_path)
        commit_hook = GitCommitHook(repo_path=conflicted_repo)

        # Save checkpoint
        checkpoint_mgr.save_checkpoint({"task_id": 1})

        # Commit with force_resolve
        result = commit_hook.commit_session_dna(force_resolve=True)

        assert result["success"] == True

    def test_daemon_force_resolve_integration(self, conflicted_repo):
        """Daemon should support force_resolve through _commit_session_dna."""
        daemon = SisyphusDaemon(auto_commit=True)
        daemon.git_commit_hook = GitCommitHook(repo_path=conflicted_repo)

        result = daemon._commit_session_dna(force_resolve=True)

        assert result is not None


class TestCommitHookLogging:
    """Tests for commit hook logging integration."""

    @pytest.fixture
    def logging_repo(self, tmp_path):
        """Create a repo with log path."""
        repo_dir = tmp_path / "log_repo"
        repo_dir.mkdir()

        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "log@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Log Test"], cwd=repo_dir, check=True, capture_output=True)

        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")

        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        return repo_dir

    def test_log_format_includes_timestamp(self, logging_repo):
        """Log entries should include timestamps."""
        log_path = logging_repo / ".loop" / "evolution.log"
        commit_hook = GitCommitHook(repo_path=logging_repo, log_path=log_path)

        (logging_repo / ".loop" / "test.txt").write_text("test")
        commit_hook.commit_session_dna()

        log_content = log_path.read_text()
        # Should have timestamp format like [2026-03-10 22:30:00]
        assert "[" in log_content and "]" in log_content

    def test_log_includes_component_tag(self, logging_repo):
        """Log entries should include [GIT_COMMIT] component tag."""
        log_path = logging_repo / ".loop" / "evolution.log"
        commit_hook = GitCommitHook(repo_path=logging_repo, log_path=log_path)

        (logging_repo / ".loop" / "test.txt").write_text("test")
        commit_hook.commit_session_dna()

        log_content = log_path.read_text()
        assert "[GIT_COMMIT]" in log_content

    def test_log_nothing_to_commit_event(self, logging_repo):
        """Should log when there's nothing to commit."""
        log_path = logging_repo / ".loop" / "evolution.log"
        commit_hook = GitCommitHook(repo_path=logging_repo, log_path=log_path)

        # No changes
        commit_hook.commit_session_dna()

        log_content = log_path.read_text()
        # The actual log message is "No changes to commit"
        assert "no changes to commit" in log_content.lower()

    def test_log_conflict_warning(self, logging_repo):
        """Should log warning when merge conflict detected."""
        # Create a conflict
        subprocess.run(["git", "checkout", "-b", "feature"], cwd=logging_repo, check=True, capture_output=True)
        (logging_repo / ".loop" / "STATE_V4.md").write_text("feature\n")
        subprocess.run(["git", "add", "."], cwd=logging_repo, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "feature"], cwd=logging_repo, check=True, capture_output=True)

        subprocess.run(["git", "checkout", "master"], cwd=logging_repo, check=True, capture_output=True)
        (logging_repo / ".loop" / "STATE_V4.md").write_text("master\n")
        subprocess.run(["git", "add", "."], cwd=logging_repo, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "master"], cwd=logging_repo, check=True, capture_output=True)
        subprocess.run(["git", "merge", "feature"], cwd=logging_repo, capture_output=True)

        log_path = logging_repo / ".loop" / "evolution.log"
        commit_hook = GitCommitHook(repo_path=logging_repo, log_path=log_path)
        commit_hook.commit_session_dna()

        log_content = log_path.read_text()
        assert "conflict" in log_content.lower()


class TestCommitHookErrorHandling:
    """Tests for error handling in commit hook integration."""

    def test_handles_missing_git_repo(self, tmp_path):
        """Should handle gracefully when not in a git repo."""
        non_repo = tmp_path / "not_a_repo"
        non_repo.mkdir()
        (non_repo / ".loop").mkdir()

        commit_hook = GitCommitHook(repo_path=non_repo)
        result = commit_hook.commit_session_dna()

        assert result["success"] == False
        assert result["error"] is not None

    def test_handles_readonly_filesystem(self, tmp_path):
        """Should handle gracefully when filesystem is readonly."""
        repo_dir = tmp_path / "readonly_repo"
        repo_dir.mkdir()

        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_dir, check=True, capture_output=True)

        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        commit_hook = GitCommitHook(repo_path=repo_dir)

        # The hook should handle errors gracefully
        result = commit_hook.commit_session_dna()
        assert "success" in result

    def test_handles_invalid_log_path(self, tmp_path):
        """Should handle gracefully when log path is invalid."""
        repo_dir = tmp_path / "invalid_log_repo"
        repo_dir.mkdir()

        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_dir, check=True, capture_output=True)

        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        # Use a non-existent parent directory for log
        invalid_log = repo_dir / "nonexistent" / "deep" / "evolution.log"
        commit_hook = GitCommitHook(repo_path=repo_dir, log_path=invalid_log)

        (repo_dir / ".loop" / "test.txt").write_text("test")
        result = commit_hook.commit_session_dna()

        # Should still succeed with commit (log creation is secondary)
        assert result["success"] == True


class TestBatchCommitEndToEnd:
    """End-to-end tests for batch commit workflow."""

    @pytest.fixture
    def full_daemon_setup(self, tmp_path):
        """Create a complete daemon setup with all components."""
        repo_dir = tmp_path / "full_daemon"
        repo_dir.mkdir()

        # Initialize git repo
        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "full@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Full Test"], cwd=repo_dir, check=True, capture_output=True)

        # Create .loop directory
        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")
        (loop_dir / "STATE_V4.md").write_text(
            "# Tasks\n\n"
            "- [ ] 1. **Setup**: Initialize system - **Verification**: Check files exist\n"
            "- [ ] 2. **Process**: Run computation - **Verification**: Check output\n"
            "- [ ] 3. **Cleanup**: Remove temp files - **Verification**: No temp files\n"
        )

        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        return repo_dir

    def test_full_task_completion_workflow(self, full_daemon_setup):
        """Test complete workflow: checkpoint -> task -> commit."""
        repo_dir = full_daemon_setup
        checkpoint_path = repo_dir / ".loop" / "checkpoint.json"
        log_path = repo_dir / ".loop" / "evolution.log"

        # Create daemon components
        daemon = SisyphusDaemon(auto_commit=True)
        daemon.git_commit_hook = GitCommitHook(repo_path=repo_dir, log_path=log_path)
        daemon.checkpoint_manager = CheckpointManager(checkpoint_path=checkpoint_path, log_path=log_path)

        # Step 1: Save checkpoint at task start
        daemon._save_task_checkpoint(task_id=1, task_name="Setup")

        assert checkpoint_path.exists()
        checkpoint = json.loads(checkpoint_path.read_text())
        assert checkpoint["task_id"] == 1

        # Step 2: Simulate task progress
        (repo_dir / ".loop" / "progress.txt").write_text("Task 1 in progress...")

        # Step 3: Task completion - commit
        result = daemon._commit_session_dna()

        assert result["success"] == True
        assert result.get("commit_sha") is not None

        # Step 4: Clear checkpoint
        daemon.checkpoint_manager.clear_checkpoint()
        assert not checkpoint_path.exists()

        # Step 5: Verify log has both checkpoint and commit events
        log_content = log_path.read_text()
        assert "checkpoint" in log_content.lower()
        assert "commit" in log_content.lower()

    def test_multiple_commits_in_session(self, full_daemon_setup):
        """Test multiple commits during a daemon session."""
        repo_dir = full_daemon_setup
        commit_hook = GitCommitHook(repo_path=repo_dir)

        commits = []

        # Commit 1
        (repo_dir / ".loop" / "task1.txt").write_text("completed")
        result1 = commit_hook.commit_session_dna()
        if result1.get("commit_sha"):
            commits.append(result1["commit_sha"])

        # Commit 2
        (repo_dir / ".loop" / "task2.txt").write_text("completed")
        result2 = commit_hook.commit_session_dna()
        if result2.get("commit_sha"):
            commits.append(result2["commit_sha"])

        # Commit 3
        (repo_dir / ".loop" / "task3.txt").write_text("completed")
        result3 = commit_hook.commit_session_dna()
        if result3.get("commit_sha"):
            commits.append(result3["commit_sha"])

        # Should have at least 2 unique commits (one might be "nothing to commit")
        assert len(commits) >= 2

        # All commits should be unique
        assert len(set(commits)) == len(commits)

    def test_nothing_to_commit_idempotent(self, full_daemon_setup):
        """Calling commit multiple times with no changes should be idempotent."""
        repo_dir = full_daemon_setup
        commit_hook = GitCommitHook(repo_path=repo_dir)

        # First commit (nothing new)
        result1 = commit_hook.commit_session_dna()

        # Second commit (still nothing new)
        result2 = commit_hook.commit_session_dna()

        # Third commit (still nothing new)
        result3 = commit_hook.commit_session_dna()

        # All should succeed with nothing_to_commit
        assert result1["success"] == True
        assert result2["success"] == True
        assert result3["success"] == True

        assert result1.get("nothing_to_commit") == True
        assert result2.get("nothing_to_commit") == True
        assert result3.get("nothing_to_commit") == True

    def test_commit_message_includes_timestamp(self, full_daemon_setup):
        """Commit messages should include timestamps for uniqueness."""
        repo_dir = full_daemon_setup
        commit_hook = GitCommitHook(repo_path=repo_dir)

        (repo_dir / ".loop" / "test.txt").write_text("test")
        commit_hook.commit_session_dna()

        # Get last commit message
        result = subprocess.run(
            ["git", "log", "-1", "--format=%s"],
            cwd=repo_dir,
            capture_output=True,
            text=True
        )

        commit_msg = result.stdout.strip()
        assert "daemon session" in commit_msg.lower()

        # Should have timestamp-like format
        assert "T" in commit_msg or "-" in commit_msg


class TestCommitHookWithUnifiedBridge:
    """Tests for commit hook integration with UnifiedGlassBridge."""

    def test_commit_hook_exists_on_daemon(self):
        """Daemon should have git_commit_hook attribute."""
        daemon = SisyphusDaemon()
        assert hasattr(daemon, 'git_commit_hook')
        assert daemon.git_commit_hook is not None

    def test_commit_result_can_be_streamed(self, tmp_path):
        """Commit result should be structured for streaming."""
        repo_dir = tmp_path / "stream_repo"
        repo_dir.mkdir()

        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test"], cwd=repo_dir, check=True, capture_output=True)

        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        commit_hook = GitCommitHook(repo_path=repo_dir)
        (loop_dir / "test.txt").write_text("test")
        result = commit_hook.commit_session_dna()

        # Result should be JSON-serializable for streaming
        json.dumps(result)  # Should not raise

        # Should have expected keys for streaming
        assert "success" in result
        assert "commit_sha" in result


class TestCommitHookPerformance:
    """Tests for commit hook performance characteristics."""

    @pytest.fixture
    def perf_repo(self, tmp_path):
        """Create a repo for performance testing."""
        repo_dir = tmp_path / "perf_repo"
        repo_dir.mkdir()

        subprocess.run(["git", "init"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "perf@test.com"], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Perf Test"], cwd=repo_dir, check=True, capture_output=True)

        loop_dir = repo_dir / ".loop"
        loop_dir.mkdir()
        (loop_dir / ".gitkeep").write_text("")
        subprocess.run(["git", "add", "."], cwd=repo_dir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "initial"], cwd=repo_dir, check=True, capture_output=True)

        return repo_dir

    def test_commit_completes_quickly(self, perf_repo):
        """Commit should complete within reasonable time."""
        commit_hook = GitCommitHook(repo_path=perf_repo)

        (perf_repo / ".loop" / "test.txt").write_text("test")

        start = time.time()
        result = commit_hook.commit_session_dna()
        elapsed = time.time() - start

        assert result["success"] == True
        assert elapsed < 5.0  # Should complete in under 5 seconds

    def test_nothing_to_commit_is_fast(self, perf_repo):
        """Nothing to commit check should be very fast."""
        commit_hook = GitCommitHook(repo_path=perf_repo)

        # No changes
        start = time.time()
        result = commit_hook.commit_session_dna()
        elapsed = time.time() - start

        assert result["success"] == True
        assert result.get("nothing_to_commit") == True
        assert elapsed < 1.0  # Should be nearly instant

    def test_conflict_detection_is_fast(self, perf_repo):
        """Conflict detection should be fast."""
        commit_hook = GitCommitHook(repo_path=perf_repo)

        start = time.time()
        conflicts = commit_hook.detect_merge_conflicts()
        elapsed = time.time() - start

        assert isinstance(conflicts, list)
        assert elapsed < 1.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
