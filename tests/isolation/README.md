# Parallel Agent Isolation Tests

Tests that verify multiple Claude sessions running in parallel git worktrees cannot interfere with each other.

## Overview

This test suite validates that parallel agent sessions using git worktrees maintain proper isolation across four critical dimensions:

1. **File System Isolation** - File operations in one worktree don't leak to another
2. **Git State Isolation** - Commits, branches, and stashes remain independent
3. **Resource Isolation** - Process and memory usage don't interfere
4. **Port/Lock Isolation** - Lock files and port allocations are independent

## Test Categories

| File | Tests | Purpose |
|------|-------|---------|
| `test_filesystem_isolation.py` | 4 | File create/modify/delete isolation |
| `test_git_isolation.py` | 4 | Branch/commit/stash isolation |
| `test_resource_isolation.py` | 3 | Process/memory/cwd isolation |
| `test_port_lock_isolation.py` | 3 | Port/lock conflict prevention |
| `test_full_isolation.py` | 2 | End-to-end parallel scenarios |
| **Total** | **16** | |

## Running Tests

### Quick Run

```bash
# Run all isolation tests with the helper script
./tests/isolation/run_tests.sh
```

### Individual Categories

```bash
# File system isolation
pytest tests/isolation/test_filesystem_isolation.py -v

# Git state isolation
pytest tests/isolation/test_git_isolation.py -v

# Resource isolation
pytest tests/isolation/test_resource_isolation.py -v

# Port/lock isolation
pytest tests/isolation/test_port_lock_isolation.py -v

# Full integration tests
pytest tests/isolation/test_full_isolation.py -v
```

### With Coverage

```bash
pytest tests/isolation/ -v --cov=.
```

### With Detailed Output

```bash
pytest tests/isolation/ -v -s
```

## Test Fixtures

### `temp_git_repo`
Creates a temporary git repository with:
- Initialized git repo
- Configured user (test@test.com / Test User)
- Initial commit with README.md

### `worktree_pair`
Creates two git worktrees for A/B testing:
- `agent-a` worktree on branch `agent/a`
- `agent-b` worktree on branch `agent/b`
- Automatic cleanup after test

### `isolated_file_content`
Sample content for file isolation tests:
```
This is test content that should not leak between worktrees.
```

## Interference Modes Tested

### 1. File System Leaks
- File creation in A doesn't appear in B
- File modifications in A don't affect B
- Directory creation in A doesn't appear in B
- File deletion in A doesn't delete in B

### 2. Git State Pollution
- Commits in A don't appear on B's branch
- Each worktree maintains its own branch
- Stash operations in A don't affect B
- Merge conflicts remain isolated

### 3. Resource Contention
- Processes spawned in A don't block B
- Memory operations in A don't affect B
- Working directory independence

### 4. Port/Lock Conflicts
- File locks in A don't block B's file access
- Local lock files are independent
- Port allocations remain separate

## Test Structure

Each test follows the Given/When/Then pattern:

```python
def test_file_created_in_a_not_visible_in_b(
    self, worktree_pair: tuple[Path, Path], isolated_file_content: str
):
    """
    GIVEN: Two worktrees from the same repository
    WHEN: A file is created in worktree A
    THEN: The file is NOT visible in worktree B
    """
    worktree_a, worktree_b = worktree_pair

    # Create file in worktree A
    new_file = worktree_a / "new_feature.py"
    new_file.write_text(isolated_file_content)

    # Assert file exists in A
    assert new_file.exists(), "File should exist in worktree A"

    # Assert file does NOT exist in B
    b_file = worktree_b / "new_feature.py"
    assert not b_file.exists(), "File should NOT leak to worktree B"
```

## Integration Tests

The `test_full_isolation.py` file contains end-to-end scenarios:

### `test_parallel_agents_full_workflow`
Simulates two agents working in parallel:
- Agent A: Creates feature_alpha.py, commits, uses lock file
- Agent B: Creates feature_beta.py, commits, uses lock file
- Verifies complete isolation of all operations

### `test_three_way_parallel_isolation`
Tests isolation with three concurrent agents:
- Creates three worktrees (agent-x, agent-y, agent-z)
- Each creates independent files
- Verifies no cross-contamination

## Expected Output

When running the full suite:

```bash
$ ./tests/isolation/run_tests.sh
=== Running Parallel Agent Isolation Tests ===

tests/isolation/test_filesystem_isolation.py::TestFileCreationIsolation::test_file_created_in_a_not_visible_in_b PASSED
tests/isolation/test_filesystem_isolation.py::TestFileCreationIsolation::test_file_modified_in_a_not_affected_in_b PASSED
tests/isolation/test_filesystem_isolation.py::TestFileCreationIsolation::test_directory_created_in_a_not_visible_in_b PASSED
tests/isolation/test_filesystem_isolation.py::TestFileCreationIsolation::test_file_deleted_in_a_still_exists_in_b PASSED
tests/isolation/test_git_isolation.py::TestGitBranchIsolation::test_commit_in_a_not_in_b_branch PASSED
tests/isolation/test_git_isolation.py::TestGitBranchIsolation::test_branch_name_isolated PASSED
tests/isolation/test_git_isolation.py::TestGitBranchIsolation::test_stash_in_a_not_affecting_b PASSED
tests/isolation/test_git_isolation.py::TestGitBranchIsolation::test_merge_conflict_isolated PASSED
tests/isolation/test_resource_isolation.py::TestProcessIsolation::test_process_spawned_in_a_not_visible_in_b PASSED
tests/isolation/test_resource_isolation.py::TestProcessIsolation::test_memory_heavy_operation_in_a_not_affecting_b PASSED
tests/isolation/test_resource_isolation.py::TestProcessIsolation::test_cwd_independence PASSED
tests/isolation/test_port_lock_isolation.py::TestPortLockIsolation::test_file_lock_in_a_not_blocking_b PASSED
tests/isolation/test_port_lock_isolation.py::TestPortLockIsolation::test_worktree_local_lock_file PASSED
tests/isolation/test_port_lock_isolation.py::TestPortLockIsolation::test_port_allocation_independence PASSED
tests/isolation/test_full_isolation.py::TestFullParallelAgentIsolation::test_parallel_agents_full_workflow PASSED
tests/isolation/test_full_isolation.py::TestFullParallelAgentIsolation::test_three_way_parallel_isolation PASSED

=== All isolation tests passed ===
```

## Requirements

- Python 3.11+
- pytest
- pygit2 (for git operations in tests)
- Git (for worktree creation)

## Contributing

When adding new isolation tests:

1. Follow the Given/When/Then pattern in docstrings
2. Use the provided fixtures (`worktree_pair`, `temp_git_repo`)
3. Add clear assertion messages explaining what should be isolated
4. Update this README with the new test count
