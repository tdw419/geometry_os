"""
Filesystem sense for controlled file access.
"""

from pathlib import Path
from typing import List, Optional

from systems.swarm.senses.base import SenseResult


class FilesystemSense:
    """
    Sandboxed filesystem access with allowed_paths whitelist.

    Security: All paths are validated against the whitelist before operations.
    """

    def __init__(self, allowed_paths: List[str]):
        """
        Initialize with list of allowed directory paths.

        Args:
            allowed_paths: List of directory paths that can be accessed
        """
        self._allowed_paths = [Path(p).resolve() for p in allowed_paths]

    def _validate_path(self, path: str) -> SenseResult:
        """
        Validate that path is within allowed directories.

        Returns SenseResult with resolved path on success, or error on failure.
        """
        try:
            target = Path(path).resolve()
        except Exception as e:
            return SenseResult(success=False, error=f"Invalid path: {e}")

        for allowed in self._allowed_paths:
            try:
                # Check if target is within allowed path
                target.relative_to(allowed)
                return SenseResult(success=True, data=target)
            except ValueError:
                continue

        return SenseResult(
            success=False,
            error=f"Path '{path}' is not within allowed directories"
        )

    def read_file(self, path: str) -> SenseResult:
        """
        Read file contents from allowed path.

        Args:
            path: File path to read

        Returns:
            SenseResult with file contents as string on success
        """
        validation = self._validate_path(path)
        if not validation.success:
            return validation

        target = validation.data

        if not target.exists():
            return SenseResult(success=False, error=f"File not found: {path}")

        if not target.is_file():
            return SenseResult(success=False, error=f"Not a file: {path}")

        try:
            content = target.read_text(encoding="utf-8")
            return SenseResult(success=True, data=content)
        except Exception as e:
            return SenseResult(success=False, error=f"Failed to read file: {e}")

    def write_file(self, path: str, content: str) -> SenseResult:
        """
        Write content to file in allowed path.

        Args:
            path: File path to write
            content: Content to write

        Returns:
            SenseResult with bytes written count on success
        """
        validation = self._validate_path(path)
        if not validation.success:
            return validation

        target = validation.data

        # Create parent directories if needed
        try:
            target.parent.mkdir(parents=True, exist_ok=True)
        except Exception as e:
            return SenseResult(success=False, error=f"Failed to create directories: {e}")

        try:
            bytes_written = target.write_text(content, encoding="utf-8")
            return SenseResult(success=True, data=bytes_written)
        except Exception as e:
            return SenseResult(success=False, error=f"Failed to write file: {e}")
