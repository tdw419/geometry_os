"""
Tests for file system isolation between parallel worktrees.

Verifies that file operations in one worktree do not affect another.
"""

from pathlib import Path

import pytest


class TestFileCreationIsolation:
    """Verify file creation in one worktree doesn't leak to another."""

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

    def test_file_modified_in_a_not_affected_in_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees with an existing file (from initial commit)
        WHEN: The file is modified in worktree A
        THEN: The file in worktree B remains unchanged
        """
        worktree_a, worktree_b = worktree_pair

        # Modify README in worktree A
        readme_a = worktree_a / "README.md"
        original_content = readme_a.read_text()
        modified_content = original_content + "\n## Modified by Agent A\n"
        readme_a.write_text(modified_content)

        # Assert modification in A
        assert "Modified by Agent A" in readme_a.read_text()

        # Assert B is unchanged
        readme_b = worktree_b / "README.md"
        assert "Modified by Agent A" not in readme_b.read_text(), \
            "Modification in A should not leak to B"

    def test_directory_created_in_a_not_visible_in_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees from the same repository
        WHEN: A directory is created in worktree A
        THEN: The directory is NOT visible in worktree B
        """
        worktree_a, worktree_b = worktree_pair

        # Create directory in worktree A
        new_dir = worktree_a / "new_module"
        new_dir.mkdir()
        (new_dir / "__init__.py").write_text("# New module\n")

        # Assert directory exists in A
        assert new_dir.exists() and new_dir.is_dir()
        assert (new_dir / "__init__.py").exists()

        # Assert directory does NOT exist in B
        b_dir = worktree_b / "new_module"
        assert not b_dir.exists(), "Directory should NOT leak to worktree B"

    def test_file_deleted_in_a_still_exists_in_b(
        self, worktree_pair: tuple[Path, Path]
    ):
        """
        GIVEN: Two worktrees with an existing file
        WHEN: The file is deleted in worktree A
        THEN: The file still exists in worktree B
        """
        worktree_a, worktree_b = worktree_pair

        # Delete README in worktree A
        readme_a = worktree_a / "README.md"
        readme_a.unlink()

        # Assert deleted in A
        assert not readme_a.exists(), "File should be deleted in A"

        # Assert still exists in B
        readme_b = worktree_b / "README.md"
        assert readme_b.exists(), "File should still exist in B"
