"""
Full integration test for parallel agent isolation.

Simulates a realistic parallel agent scenario with all interference modes.
"""

import subprocess
from pathlib import Path

import pytest


class TestFullParallelAgentIsolation:
    """
    Integration test simulating two agents working in parallel.

    Agent A: Creates feature files, commits, uses resources
    Agent B: Creates different files, commits, uses resources

    Both should complete independently without interference.
    """

    def test_parallel_agents_full_workflow(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees representing parallel agent sessions
        WHEN: Both agents perform full workflows simultaneously
        THEN: All operations remain isolated
        """
        worktree_a, worktree_b = worktree_pair

        # === Agent A Workflow ===
        # Create feature file
        feature_a = worktree_a / "feature_alpha.py"
        feature_a.write_text('def alpha(): return "alpha"\n')

        # Create lock
        lock_a = worktree_a / ".agent.lock"
        lock_a.write_text("agent-a-pid-12345")

        # Commit
        subprocess.run(["git", "add", "."], cwd=worktree_a, check=True, capture_output=True)
        subprocess.run(
            ["git", "commit", "-m", "Agent A: Add alpha feature"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
        )

        # === Agent B Workflow ===
        # Create feature file
        feature_b = worktree_b / "feature_beta.py"
        feature_b.write_text('def beta(): return "beta"\n')

        # Create lock
        lock_b = worktree_b / ".agent.lock"
        lock_b.write_text("agent-b-pid-67890")

        # Commit
        subprocess.run(["git", "add", "."], cwd=worktree_b, check=True, capture_output=True)
        subprocess.run(
            ["git", "commit", "-m", "Agent B: Add beta feature"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
        )

        # === Assertions ===

        # File isolation
        assert feature_a.exists()
        assert feature_b.exists()
        assert not (worktree_b / "feature_alpha.py").exists()
        assert not (worktree_a / "feature_beta.py").exists()

        # Lock isolation
        assert lock_a.read_text() == "agent-a-pid-12345"
        assert lock_b.read_text() == "agent-b-pid-67890"

        # Git isolation (different commits)
        result_a = subprocess.run(
            ["git", "log", "--oneline", "-1"],
            cwd=worktree_a,
            check=True,
            capture_output=True,
            text=True,
        )
        result_b = subprocess.run(
            ["git", "log", "--oneline", "-1"],
            cwd=worktree_b,
            check=True,
            capture_output=True,
            text=True,
        )

        assert "Agent A" in result_a.stdout
        assert "Agent B" in result_b.stdout
        assert "Agent A" not in result_b.stdout
        assert "Agent B" not in result_a.stdout

    def test_three_way_parallel_isolation(
        self, temp_git_repo: Path
    ):
        """
        GIVEN: Three worktrees from the same repository
        WHEN: All three agents work in parallel
        THEN: All remain isolated
        """
        worktrees_dir = temp_git_repo / ".worktrees"
        worktrees_dir.mkdir()

        worktrees = []
        for i, name in enumerate(["agent-x", "agent-y", "agent-z"]):
            wt_path = worktrees_dir / name
            branch = f"agent/{name}"
            subprocess.run(
                ["git", "worktree", "add", str(wt_path), "-b", branch],
                cwd=temp_git_repo,
                check=True,
                capture_output=True,
            )
            worktrees.append(wt_path)

        # Each agent creates its own file
        for i, wt in enumerate(worktrees):
            test_file = wt / f"agent_{i}_file.txt"
            test_file.write_text(f"Agent {i} was here\n")

        # Verify isolation
        for i, wt in enumerate(worktrees):
            expected_file = f"agent_{i}_file.txt"
            assert (wt / expected_file).exists()

            # Check others don't exist
            for j, other_wt in enumerate(worktrees):
                if i != j:
                    other_file = f"agent_{j}_file.txt"
                    assert not (wt / other_file).exists(), \
                        f"File leak: {other_file} found in worktree {i}"

        # Cleanup
        for wt in worktrees:
            subprocess.run(
                ["git", "worktree", "remove", "--force", str(wt)],
                cwd=temp_git_repo,
                capture_output=True,
            )
