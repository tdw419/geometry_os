#!/usr/bin/env python3
"""
Visual File Browser - FileInfo Dataclass and Color Coding

This module provides the FileInfo dataclass for representing files in the visual
file browser, along with color coding based on file types and extensions.

Usage Examples:
    >>> from file_browser import FileInfo
    >>> # Create a file info for a Python script
    >>> info = FileInfo(
    ...     name="example.py",
    ...     path="/home/user/example.py",
    ...     file_type="code",
    ...     size=1024,
    ...     permissions="rw-r--r--",
    ...     modified=1704067200.0,
    ...     x=100,
    ...     y=200
    ... )
    >>> print(info.color)
    >>> 0x1ABC9C
    >>> # Create a file info for a directory
    >>> dir_info = FileInfo.directory("docs", "/home/user/docs", x=50, y=100)
    >>> print(dir_info.color)
    >>> 0x4A90D9

    >>> # Create FileInfo from a path (auto-detect type)
    >>> info = FileInfo.from_path("/home/user/config.json", x=0, y=0)
    >>> print(info.file_type, info.color)
    >>> config 0xE67E22
"""

import argparse
import asyncio
import json
import math
import re
import time
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple, Any

from vm_linux_bridge import VMLinuxBridge, HostBridge, QEMUBridge, WGPUBridge


# File type to color mapping
FILE_COLORS: Dict[str, int] = {
    "directory": 0x4A90D9,   # Blue
    "executable": 0x2ECC71,  # Green
    "code": 0x1ABC9C,        # Teal
    "data": 0xF1C40F,        # Yellow
    "media": 0x9B59B6,       # Purple
    "config": 0xE67E22,      # Orange
    "document": 0xECF0F1,    # White
    "other": 0x95A5A6,       # Gray
}

# Extension to file category mapping
EXTENSION_MAP: Dict[str, str] = {
    # Code files
    ".py": "code",
    ".js": "code",
    ".ts": "code",
    ".cpp": "code",
    ".c": "code",
    ".h": "code",
    ".hpp": "code",
    ".rs": "code",
    ".go": "code",
    ".java": "code",
    ".kt": "code",
    ".swift": "code",
    ".sh": "code",
    ".bash": "code",
    ".zsh": "code",
    ".fish": "code",
    ".ps1": "code",
    ".lua": "code",
    ".rb": "code",
    ".php": "code",
    ".pl": "code",
    ".tcl": "code",
    ".sql": "code",
    ".r": "code",
    ".m": "code",
    ".nim": "code",
    ".zig": "code",
    ".odin": "code",
    ".v": "code",
    ".sv": "code",
    ".wgsl": "code",
    ".glsl": "code",
    ".hlsl": "code",
    ".vert": "code",
    ".frag": "code",
    ".fs": "code",
    ".vs": "code",
    ".s": "code",
    ".asm": "code",

    # Config files
    ".json": "config",
    ".yaml": "config",
    ".yml": "config",
    ".toml": "config",
    ".ini": "config",
    ".cfg": "config",
    ".conf": "config",
    ".xml": "config",
    ".properties": "config",
    ".env": "config",
    ".dockerfile": "config",
    "dockerfile": "config",
    "docker-compose.yml": "config",
    "docker-compose.yaml": "config",
    ".gitignore": "config",
    ".gitattributes": "config",
    ".gitmodules": "config",
    ".gitconfig": "config",
    ".editorconfig": "config",
    ".eslintrc": "config",
    ".prettierrc": "config",
    ".babelrc": "config",
    ".tsconfig.json": "config",
    "package.json": "config",
    "package-lock.json": "config",
    "yarn.lock": "config",
    "cargo.toml": "config",
    "cargo.lock": "config",
    "go.mod": "config",
    "go.sum": "config",
    "requirements.txt": "config",
    "pipfile": "config",
    "pipfile.lock": "config",
    "poetry.lock": "config",
    "pyproject.toml": "config",
    "setup.py": "config",
    "setup.cfg": "config",
    "makefile": "config",
    "cmakelists.txt": "config",
    "meson.build": "config",
    "bazel.build": "config",
    "build.gradle": "config",
    "pom.xml": "config",
    ".htaccess": "config",
    ".procmailrc": "config",
    ".procmail": "config",
    ".exrc": "config",
    ".vimrc": "config",
    ".gvimrc": "config",
    ".bashrc": "config",
    ".zshrc": "config",
    ".profile": "config",
    ".bash_profile": "config",
    ".zprofile": "config",
    ".zlogin": "config",
    ".zlogout": "config",
    ".inputrc": "config",
    ".netrc": "config",
    ".curlrc": "config",
    ".wgetrc": "config",
    ".ssh/config": "config",

    # Data files
    ".csv": "data",
    ".tsv": "data",
    ".parquet": "data",
    ".arrow": "data",
    ".feather": "data",
    ".hdf5": "data",
    ".h5": "data",
    ".nc": "data",
    ".cdf": "data",
    ".mat": "data",
    ".pkl": "data",
    ".pickle": "data",
    ".db": "data",
    ".sqlite": "data",
    ".sqlite3": "data",
    ".mdb": "data",
    ".accdb": "data",
    ".db3": "data",
    ".dbf": "data",
    ".gdb": "data",
    ".bin": "data",
    ".dat": "data",
    ".data": "data",
    ".log": "data",
    ".out": "data",
    ".trace": "data",

    # Document files
    ".txt": "document",
    ".md": "document",
    ".markdown": "document",
    ".rst": "document",
    ".adoc": "document",
    ".tex": "document",
    ".pdf": "document",
    ".doc": "document",
    ".docx": "document",
    ".odt": "document",
    ".rtf": "document",
    ".epub": "document",
    ".mobi": "document",
    ".pages": "document",
    ".man": "document",
    ".readme": "document",
    ".license": "document",

    # Media files - Images
    ".png": "media",
    ".jpg": "media",
    ".jpeg": "media",
    ".gif": "media",
    ".bmp": "media",
    ".tiff": "media",
    ".tif": "media",
    ".webp": "media",
    ".svg": "media",
    ".ico": "media",
    ".avif": "media",
    ".heic": "media",
    ".heif": "media",
    ".jxl": "media",
    ".psd": "media",
    ".xcf": "media",
    ".raw": "media",
    ".cr2": "media",
    ".nef": "media",
    ".arw": "media",
    ".dng": "media",
    ".ktx": "media",
    ".dds": "media",
    ".exr": "media",
    ".hdr": "media",
    ".pfm": "media",

    # Media files - Audio
    ".mp3": "media",
    ".wav": "media",
    ".flac": "media",
    ".ogg": "media",
    ".m4a": "media",
    ".aac": "media",
    ".wma": "media",
    ".opus": "media",
    ".aiff": "media",
    ".aif": "media",
    ".au": "media",
    ".ra": "media",
    ".mid": "media",
    ".midi": "media",
    ".amr": "media",
    ".ac3": "media",
    ".dts": "media",

    # Media files - Video
    ".mp4": "media",
    ".avi": "media",
    ".mkv": "media",
    ".mov": "media",
    ".wmv": "media",
    ".flv": "media",
    ".webm": "media",
    ".m4v": "media",
    ".3gp": "media",
    ".ogv": "media",
    ".f4v": "media",
    ".mxf": "media",
    ".ts": "media",
    ".mts": "media",
    ".vob": "media",
    ".rm": "media",
    ".rmvb": "media",
    ".asf": "media",

    # Media files - 3D/Models
    ".obj": "media",
    ".fbx": "media",
    ".gltf": "media",
    ".glb": "media",
    ".dae": "media",
    ".blend": "media",
    ".3ds": "media",
    ".stl": "media",
    ".ply": "media",
    ".usd": "media",
    ".usda": "media",
    ".usdc": "media",
    ".abc": "media",

    # Executable files (no extension or common executable extensions)
    ".exe": "executable",
    ".dll": "executable",
    ".so": "executable",
    ".dylib": "executable",
    ".app": "executable",
    ".elf": "executable",
    ".bin": "executable",
    ".run": "executable",
    ".out": "executable",
    ".appimage": "executable",
    ".flatpak": "executable",
    ".snap": "executable",
    ".deb": "executable",
    ".rpm": "executable",
    ".apk": "executable",
    ".ipa": "executable",
}


@dataclass
class FileInfo:
    """
    Represents a file or directory in the visual file browser.

    Attributes:
        name: The base name of the file
        path: The full path to the file
        file_type: The category of file (directory, executable, code, data, media, config, document, other)
        size: Size in bytes
        permissions: Unix permission string (e.g., "rw-r--r--")
        modified: Unix timestamp of last modification
        x: X coordinate for visual positioning
        y: Y coordinate for visual positioning
        color: Hex color code for the file type
    """
    name: str
    path: str
    file_type: str
    size: int = 0
    permissions: str = ""
    modified: float = 0.0
    x: int = 0
    y: int = 0
    color: int = field(init=False)

    def __post_init__(self):
        """Set the color based on file_type after initialization."""
        self.color = self.get_color()

    def get_color(self) -> int:
        """
        Get the color code for this file based on its type.

        Returns:
            Hex color code (e.g., 0x4A90D9 for blue)
        """
        return FILE_COLORS.get(self.file_type, FILE_COLORS["other"])

    @classmethod
    def directory(cls, name: str, path: str, x: int = 0, y: int = 0) -> "FileInfo":
        """
        Create a FileInfo for a directory.

        Args:
            name: The directory name
            path: The full path to the directory
            x: X coordinate for visual positioning
            y: Y coordinate for visual positioning

        Returns:
            A FileInfo instance with type "directory"
        """
        return cls(
            name=name,
            path=path,
            file_type="directory",
            x=x,
            y=y,
        )

    @classmethod
    def executable(cls, name: str, path: str, size: int = 0,
                   permissions: str = "", modified: float = 0.0,
                   x: int = 0, y: int = 0) -> "FileInfo":
        """
        Create a FileInfo for an executable file.

        Args:
            name: The file name
            path: The full path to the file
            size: Size in bytes
            permissions: Unix permission string
            modified: Unix timestamp of last modification
            x: X coordinate for visual positioning
            y: Y coordinate for visual positioning

        Returns:
            A FileInfo instance with type "executable"
        """
        return cls(
            name=name,
            path=path,
            file_type="executable",
            size=size,
            permissions=permissions,
            modified=modified,
            x=x,
            y=y,
        )

    @classmethod
    def from_path(cls, path: str, size: int = 0, permissions: str = "",
                  modified: float = 0.0, x: int = 0, y: int = 0) -> "FileInfo":
        """
        Create a FileInfo by auto-detecting the file type from the path.

        Args:
            path: The full path to the file
            size: Size in bytes
            permissions: Unix permission string
            modified: Unix timestamp of last modification
            x: X coordinate for visual positioning
            y: Y coordinate for visual positioning

        Returns:
            A FileInfo instance with auto-detected file type
        """
        import os

        name = os.path.basename(path)
        file_type = cls._detect_file_type(path, name)

        return cls(
            name=name,
            path=path,
            file_type=file_type,
            size=size,
            permissions=permissions,
            modified=modified,
            x=x,
            y=y,
        )

    @staticmethod
    def _detect_file_type(path: str, name: str) -> str:
        """
        Detect the file type based on the path and name.

        Args:
            path: The full path to the file
            name: The base name of the file

        Returns:
            The detected file type category
        """
        import os

        # Check if it's a directory
        if os.path.isdir(path) if os.path.exists(path) else path.endswith("/"):
            return "directory"

        # Check for executable permissions if path exists
        if os.path.exists(path):
            if os.access(path, os.X_OK):
                # But make sure it's not a code file with executable bit
                _, ext = os.path.splitext(name.lower())
                if ext not in EXTENSION_MAP or EXTENSION_MAP[ext] != "code":
                    return "executable"

        # Check by extension
        name_lower = name.lower()
        for ext, category in EXTENSION_MAP.items():
            if ext.startswith("."):
                if name_lower.endswith(ext):
                    return category
            else:
                # For entries like "dockerfile" or "makefile"
                if name_lower == ext or name_lower.endswith("/" + ext):
                    return category

        # Check for common executable names without extension
        executable_names = {
            "make", "cmake", "ninja", "gcc", "g++", "clang", "clang++",
            "python", "python3", "node", "npm", "cargo", "rustc",
            "bash", "sh", "zsh", "fish", "dash",
            "docker", "podman", "flatpak", "snap",
            "git", "svn", "hg",
            "vi", "vim", "nvim", "emacs", "nano",
            "less", "more", "cat", "head", "tail",
            "grep", "sed", "awk", "find", "locate",
            "ls", "cd", "pwd", "mkdir", "rm", "cp", "mv", "ln",
            "chmod", "chown", "chgrp",
            "tar", "gzip", "gunzip", "zip", "unzip",
            "ssh", "scp", "rsync", "curl", "wget",
            "ping", "traceroute", "nslookup", "dig",
            "mount", "umount", "df", "du", "free", "top", "htop",
            "systemctl", "service", "journalctl",
            "qemu", "qemu-system-x86_64", "virsh",
        }
        if name_lower in executable_names or name_lower.split("/")[-1] in executable_names:
            return "executable"

        # Default to other
        return "other"

    def to_dict(self) -> Dict[str, Any]:
        """
        Convert FileInfo to a dictionary for JSON serialization.

        Returns:
            Dictionary representation of the FileInfo
        """
        return {
            "name": self.name,
            "path": self.path,
            "file_type": self.file_type,
            "size": self.size,
            "permissions": self.permissions,
            "modified": self.modified,
            "x": self.x,
            "y": self.y,
            "color": self.color,
        }

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "FileInfo":
        """
        Create a FileInfo from a dictionary.

        Args:
            data: Dictionary containing file info fields

        Returns:
            A FileInfo instance
        """
        return cls(
            name=data.get("name", ""),
            path=data.get("path", ""),
            file_type=data.get("file_type", "other"),
            size=data.get("size", 0),
            permissions=data.get("permissions", ""),
            modified=data.get("modified", 0.0),
            x=data.get("x", 0),
            y=data.get("y", 0),
        )

    def format_size(self) -> str:
        """
        Format the file size in human-readable format.

        Returns:
            Formatted size string (e.g., "1.5 MB")
        """
        for unit in ["B", "KB", "MB", "GB", "TB"]:
            if self.size < 1024.0:
                return f"{self.size:.1f} {unit}" if unit == "B" else f"{self.size:.1f} {unit}"
            self.size /= 1024.0
        return f"{self.size:.1f} PB"

    def format_modified(self) -> str:
        """
        Format the modification timestamp as a human-readable string.

        Returns:
            Formatted date string
        """
        from datetime import datetime
        dt = datetime.fromtimestamp(self.modified)
        return dt.strftime("%Y-%m-%d %H:%M")

    def is_directory(self) -> bool:
        """Check if this FileInfo represents a directory."""
        return self.file_type == "directory"

    def is_executable(self) -> bool:
        """Check if this FileInfo represents an executable file."""
        return self.file_type == "executable"

    def is_code(self) -> bool:
        """Check if this FileInfo represents a code file."""
        return self.file_type == "code"

    def is_media(self) -> bool:
        """Check if this FileInfo represents a media file."""
        return self.file_type == "media"


def main():
    """CLI entry point for file browser operations."""
    parser = argparse.ArgumentParser(
        description="Visual File Browser - FileInfo operations",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s /path/to/file --json
  %(prog)s /home/user --list
  %(prog)s --test-colors
        """
    )
    parser.add_argument("path", nargs="?", help="Path to analyze")
    parser.add_argument("--json", action="store_true", help="Output as JSON")
    parser.add_argument("--list", "-l", action="store_true", help="List directory contents")
    parser.add_argument("--test-colors", action="store_true", help="Test color coding")
    parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")

    args = parser.parse_args()

    if args.test_colors:
        print("File Type Color Test")
        print("=" * 40)
        for file_type, color in FILE_COLORS.items():
            print(f"{file_type:12} : 0x{color:06X}")
        return

    if args.path:
        if args.list:
            import os
            try:
                files = []
                for entry in os.scandir(args.path):
                    info = FileInfo.from_path(
                        entry.path,
                        size=entry.stat().st_size if entry.is_file() else 0,
                        modified=entry.stat().st_mtime,
                    )
                    files.append(info)

                # Sort: directories first, then by name
                files.sort(key=lambda f: (not f.is_directory(), f.name.lower()))

                if args.json:
                    print(json.dumps([f.to_dict() for f in files], indent=2))
                else:
                    for f in files:
                        prefix = "D" if f.is_directory() else "F"
                        print(f"[{prefix}] {f.name:30} {f.file_type:12} 0x{f.color:06X}")
                        if args.verbose:
                            print(f"     Path: {f.path}")
                            print(f"     Size: {f.format_size():>10}  Modified: {f.format_modified()}")
            except PermissionError:
                print(f"Error: Permission denied: {args.path}")
            except FileNotFoundError:
                print(f"Error: Path not found: {args.path}")
        else:
            info = FileInfo.from_path(args.path)
            if args.json:
                print(json.dumps(info.to_dict(), indent=2))
            else:
                print(f"File: {info.name}")
                print(f"Type: {info.file_type}")
                print(f"Color: 0x{info.color:06X}")
                if args.verbose:
                    print(f"Path: {info.path}")
                    print(f"Size: {info.format_size()}")
                    print(f"Modified: {info.format_modified()}")


if __name__ == "__main__":
    main()
