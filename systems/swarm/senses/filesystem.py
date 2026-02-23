"""
Filesystem sense for controlled file access.
"""

import asyncio
from pathlib import Path
from typing import List, Optional

from systems.swarm.senses.base import SenseResult


class FilesystemSense:
    """
    Sandboxed filesystem access with allowed_paths whitelist.

    Security: All paths are validated against the whitelist before operations.
    """

    def __init__(self, allowed_paths: List[str], timeout: float = 30.0):
        """
        Initialize with list of allowed directory paths.

        Args:
            allowed_paths: List of directory paths that can be accessed
            timeout: Timeout for async operations in seconds
        """
        self._allowed_paths = [Path(p).resolve() for p in allowed_paths]
        self._timeout = timeout

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

    async def read_file_async(self, path: str) -> SenseResult:
        """
        Async read file contents from allowed path with timeout.

        Args:
            path: File path to read

        Returns:
            SenseResult with file contents as string on success
        """
        try:
            async with asyncio.timeout(self._timeout):
                # Run sync operation in thread pool
                return await asyncio.get_event_loop().run_in_executor(
                    None, self.read_file, path
                )
        except asyncio.TimeoutError:
            return SenseResult(
                success=False,
                error=f"Read operation timed out after {self._timeout}s"
            )

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

    async def write_file_async(self, path: str, content: str) -> SenseResult:
        """
        Async write content to file in allowed path with timeout.

        Args:
            path: File path to write
            content: Content to write

        Returns:
            SenseResult with bytes written count on success
        """
        try:
            async with asyncio.timeout(self._timeout):
                return await asyncio.get_event_loop().run_in_executor(
                    None, self.write_file, path, content
                )
        except asyncio.TimeoutError:
            return SenseResult(
                success=False,
                error=f"Write operation timed out after {self._timeout}s"
            )

    def list_dir(self, path: str) -> SenseResult:
        """
        List directory contents from allowed path.

        Args:
            path: Directory path to list

        Returns:
            SenseResult with list of filenames on success
        """
        validation = self._validate_path(path)
        if not validation.success:
            return validation

        target = validation.data

        if not target.exists():
            return SenseResult(success=False, error=f"Directory not found: {path}")

        if not target.is_dir():
            return SenseResult(success=False, error=f"Not a directory: {path}")

        try:
            entries = []
            for entry in target.iterdir():
                entries.append({
                    "name": entry.name,
                    "is_file": entry.is_file(),
                    "is_dir": entry.is_dir(),
                })
            return SenseResult(success=True, data=entries)
        except Exception as e:
            return SenseResult(success=False, error=f"Failed to list directory: {e}")

    async def list_dir_async(self, path: str) -> SenseResult:
        """
        Async list directory contents from allowed path with timeout.

        Args:
            path: Directory path to list

        Returns:
            SenseResult with list of filenames on success
        """
        try:
            async with asyncio.timeout(self._timeout):
                return await asyncio.get_event_loop().run_in_executor(
                    None, self.list_dir, path
                )
        except asyncio.TimeoutError:
            return SenseResult(
                success=False,
                error=f"List operation timed out after {self._timeout}s"
            )
