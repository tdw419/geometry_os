#!/usr/bin/env python3
"""
Memory Palace FUSE Driver

Mounts the memory palace as a Linux filesystem.

The filesystem layout mirrors the spatial palace structure:

    /mnt/memory_palace/
    ├── inner_ring/          → Tier: critical
    │   ├── fact_045_critical_insight.md
    │   └── fact_120_bug_fix.py
    ├── middle_ring/         → Tier: important
    │   ├── fact_030_note.txt
    │   └── fact_270_reference.md
    └── outer_ring/          → Tier: reference
        ├── fact_015_doc.md
        └── fact_180_data.json

Files are named by their spatial position: fact_<ANGLE>_<SUBJECT>.ext

Usage:
    mkdir -p /mnt/memory_palace
    python3 palace_fuse.py /mnt/memory_palace
    cd /mnt/memory_palace
    ls inner_ring/
    echo "new content" > middle_ring/fact_090_new_note.txt
    vim inner_ring/fact_045_critical_insight.md
    fusermount -u /mnt/memory_palace  # Unmount
"""

import errno
import json
import logging
import os
import time
from pathlib import Path
from typing import Dict, Optional, Tuple

try:
    from fuse import FUSE, FuseOSError, Operations
except ImportError:
    print("✗ FUSE not installed. Install with:")
    print("  pip3 install fusepy")
    import sys
    sys.exit(1)


# Configuration
FACTS_FILE = Path.home() / "projects/zion/projects/geometry_os/geometry_os/memory_palace_facts.json"
RING_NAMES = ["inner_ring", "middle_ring", "outer_ring"]
TIER_NAMES = ["critical", "important", "reference"]

# Ring → Tier mapping
RING_TO_TIER = {
    "inner_ring": "critical",
    "middle_ring": "important",
    "outer_ring": "reference"
}

TIER_TO_RING = {v: k for k, v in RING_TO_TIER.items()}

# File encoding
ENCODING = "utf-8"

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class PalaceFS(Operations):
    """FUSE filesystem backed by Memory Palace facts."""

    def __init__(self):
        logger.info("Initializing PalaceFS...")
        self.facts = self._load_facts()
        self.open_files: Dict[int, Tuple[int, str]] = {}  # fh → (fact_index, mode)

    def _load_facts(self) -> list:
        """Load facts from JSON."""
        if FACTS_FILE.exists():
            with open(FACTS_FILE) as f:
                data = json.load(f)
            return data.get("facts", [])
        return []

    def _save_facts(self):
        """Save facts to JSON."""
        data = {
            "version": 1,
            "last_updated": time.strftime("%Y-%m-%dT%H:%M:%S"),
            "facts": self.facts
        }

        # Pretty print with newline at end
        with open(FACTS_FILE, "w") as f:
            json.dump(data, f, indent=2)
            f.write("\n")

        logger.info(f"Saved {len(self.facts)} facts to {FACTS_FILE}")

    def _parse_filename(self, filename: str) -> Optional[Tuple[int, str]]:
        """
        Parse palace filename.

        Format: fact_<ANGLE>_<SUBJECT>.ext
        Returns: (angle, subject_with_ext) or None
        """
        if not filename.startswith("fact_"):
            return None

        parts = filename[len("fact_"):].split("_", 1)
        if len(parts) != 2:
            return None

        try:
            angle = int(parts[0])
            subject_with_ext = parts[1]

            # Keep extension in returned value
            return angle, subject_with_ext
        except ValueError:
            return None

    def _find_fact_by_position(self, ring: str, angle: int) -> Optional[int]:
        """Find fact index by ring and angle."""
        ring_num = RING_NAMES.index(ring)

        for i, fact in enumerate(self.facts):
            if fact.get("ring") == ring_num and fact.get("angle") == angle:
                return i

        return None

    def _find_fact_by_subject(self, ring: str, subject: str) -> Optional[int]:
        """Find fact index by ring and subject."""
        ring_num = RING_NAMES.index(ring)

        for i, fact in enumerate(self.facts):
            if fact.get("ring") == ring_num and fact.get("subject") == subject:
                return i

        return None

    def _get_file_stats(self, ring: str, fact: dict, filename: str = "") -> dict:
        """Get file stats for a fact."""
        content = fact.get("content", "")

        # Determine file extension from filename or subject
        ext = ".md"
        if filename:
            if filename.endswith((".py", ".asm", ".js", ".ts", ".txt", ".json", ".c", ".cpp", ".rs", ".go", ".sh")):
                ext = filename[filename.rfind("."):]
        else:
            subject = fact.get("subject", "").lower()
            if subject.endswith((".py", ".asm", ".js", ".ts")):
                ext = subject[subject.rfind("."):]
            elif ".txt" in subject:
                ext = ".txt"

        st = {
            "st_mode": 0o100644,  # Regular file, rw-r--r--
            "st_nlink": 1,
            "st_size": len(content.encode(ENCODING)),
            "st_atime": time.time(),
            "st_mtime": time.time(),
            "st_ctime": time.time(),
            "st_uid": os.getuid(),
            "st_gid": os.getgid(),
        }

        return st

    # FUSE Operations

    def getattr(self, path: str, fh=None):
        """Get file attributes."""
        if path == "/":
            return {
                "st_mode": 0o40755,  # Directory, rwxr-xr-x
                "st_nlink": 2,
                "st_size": 4096,
                "st_atime": time.time(),
                "st_mtime": time.time(),
                "st_ctime": time.time(),
                "st_uid": os.getuid(),
                "st_gid": os.getgid(),
            }

        # Check if it's a ring directory
        parts = [p for p in path.split("/") if p]
        if len(parts) == 1 and parts[0] in RING_NAMES:
            return {
                "st_mode": 0o40755,
                "st_nlink": 2,
                "st_size": 4096,
                "st_atime": time.time(),
                "st_mtime": time.time(),
                "st_ctime": time.time(),
                "st_uid": os.getuid(),
                "st_gid": os.getgid(),
            }

        # Check if it's a file in a ring
        if len(parts) == 2 and parts[0] in RING_NAMES:
            ring = parts[0]
            filename = parts[1]

            parsed = self._parse_filename(filename)
            if parsed:
                angle, subject_with_ext = parsed

                # Extract bare subject for fact lookup (compat with existing facts)
                if "." in subject_with_ext:
                    subject = subject_with_ext.rsplit(".", 1)[0]
                else:
                    subject = subject_with_ext

                # Try to find by angle first
                fact_idx = self._find_fact_by_position(ring, angle)

                # If not found by angle, try by subject
                if fact_idx is None:
                    fact_idx = self._find_fact_by_subject(ring, subject)

                if fact_idx is not None:
                    return self._get_file_stats(ring, self.facts[fact_idx], filename)

        # Not found
        raise FuseOSError(errno.ENOENT)

    def readdir(self, path: str, fh):
        """List directory contents."""
        entries = [".", ".."]

        if path == "/":
            return entries + RING_NAMES

        parts = [p for p in path.split("/") if p]

        if len(parts) == 1 and parts[0] in RING_NAMES:
            ring = parts[0]
            ring_num = RING_NAMES.index(ring)

            # Get all facts in this ring
            for fact in self.facts:
                if fact.get("ring") == ring_num:
                    angle = fact.get("angle", 0)
                    subject_with_ext = fact.get("subject", "fact")

                    # If no extension, add .md for compatibility
                    if "." not in subject_with_ext:
                        subject_with_ext += ".md"

                    filename = f"fact_{angle:03d}_{subject_with_ext}"
                    entries.append(filename)

            return entries

        return entries

    def open(self, path: str, flags):
        """Open a file."""
        parts = [p for p in path.split("/") if p]

        if len(parts) != 2 or parts[0] not in RING_NAMES:
            raise FuseOSError(errno.ENOENT)

        ring = parts[0]
        filename = parts[1]

        parsed = self._parse_filename(filename)
        if not parsed:
            raise FuseOSError(errno.ENOENT)

        angle, subject_with_ext = parsed

        # Extract bare subject (without extension) for fact lookups
        if "." in subject_with_ext:
            subject = subject_with_ext.rsplit(".", 1)[0]
        else:
            subject = subject_with_ext

        # Find existing fact or create new one
        fact_idx = self._find_fact_by_position(ring, angle)
        if fact_idx is None:
            fact_idx = self._find_fact_by_subject(ring, subject)

        # Create new fact if it doesn't exist
        if fact_idx is None:
            ring_num = RING_NAMES.index(ring)
            max_id = max([f.get("id", 0) for f in self.facts], default=0)

            # Store subject WITH extension for proper file type tracking
            new_fact = {
                "id": max_id + 1,
                "tier": RING_TO_TIER[ring],
                "subject": subject_with_ext,  # Include extension
                "content": "",
                "ring": ring_num,
                "angle": angle
            }

            self.facts.append(new_fact)
            fact_idx = len(self.facts) - 1
            logger.info(f"Created new fact: {ring}/fact_{angle:03d}_{subject_with_ext}")

        # Generate file handle
        fh = len(self.open_files) + 1
        self.open_files[fh] = (fact_idx, "w" if (flags & os.O_WRONLY) else "r")

        return fh

    def read(self, path: str, size: int, offset: int, fh):
        """Read from a file."""
        if fh not in self.open_files:
            raise FuseOSError(errno.EBADF)

        fact_idx, mode = self.open_files[fh]
        content = self.facts[fact_idx].get("content", "")
        data = content.encode(ENCODING)

        return data[offset:offset + size]

    def write(self, path: str, data: bytes, offset: int, fh):
        """Write to a file."""
        if fh not in self.open_files:
            raise FuseOSError(errno.EBADF)

        fact_idx, mode = self.open_files[fh]

        # Read existing content
        content = self.facts[fact_idx].get("content", "")
        encoded = content.encode(ENCODING)

        # Write new data at offset
        new_encoded = encoded[:offset] + data + encoded[offset + len(data):]
        self.facts[fact_idx]["content"] = new_encoded.decode(ENCODING)

        self._save_facts()

        return len(data)

    def release(self, path: str, fh):
        """Close a file."""
        if fh in self.open_files:
            del self.open_files[fh]

    def create(self, path: str, mode):
        """Create a new file."""
        return self.open(path, os.O_WRONLY | os.O_CREAT)

    def truncate(self, path: str, length: int, fh=None):
        """Truncate a file."""
        parts = [p for p in path.split("/") if p]

        if len(parts) != 2 or parts[0] not in RING_NAMES:
            raise FuseOSError(errno.ENOENT)

        ring = parts[0]
        filename = parts[1]

        parsed = self._parse_filename(filename)
        if not parsed:
            raise FuseOSError(errno.ENOENT)

        angle, subject = parsed

        fact_idx = self._find_fact_by_position(ring, angle)
        if fact_idx is None:
            fact_idx = self._find_fact_by_subject(ring, subject)

        if fact_idx is not None:
            content = self.facts[fact_idx].get("content", "")
            self.facts[fact_idx]["content"] = content[:length]
            self._save_facts()

    def unlink(self, path: str):
        """Delete a file."""
        parts = [p for p in path.split("/") if p]

        if len(parts) != 2 or parts[0] not in RING_NAMES:
            raise FuseOSError(errno.ENOENT)

        ring = parts[0]
        filename = parts[1]

        parsed = self._parse_filename(filename)
        if not parsed:
            raise FuseOSError(errno.ENOENT)

        angle, subject = parsed

        fact_idx = self._find_fact_by_position(ring, angle)
        if fact_idx is None:
            fact_idx = self._find_fact_by_subject(ring, subject)

        if fact_idx is not None:
            deleted = self.facts.pop(fact_idx)
            logger.info(f"Deleted fact: {deleted.get('subject')}")
            self._save_facts()
        else:
            raise FuseOSError(errno.ENOENT)

    def mkdir(self, path: str, mode):
        """Create a directory (not supported, rings are fixed)."""
        # Only allow creating mount point root
        if path == "/":
            return
        raise FuseOSError(errno.EROFS)

    def rmdir(self, path: str):
        """Remove a directory (not supported, rings are fixed)."""
        raise FuseOSError(errno.EROFS)


def main(mountpoint: str):
    """Mount the palace filesystem."""

    if not Path(mountpoint).exists():
        Path(mountpoint).mkdir(parents=True, exist_ok=True)
        logger.info(f"Created mount point: {mountpoint}")

    logger.info(f"Mounting Memory Palace at: {mountpoint}")
    logger.info(f"Ring structure:")
    logger.info(f"  {mountpoint}/inner_ring/    ← Critical files")
    logger.info(f"  {mountpoint}/middle_ring/   ← Important files")
    logger.info(f"  {mountpoint}/outer_ring/    ← Reference files")
    logger.info(f"\nFile naming: fact_<ANGLE>_<SUBJECT>.ext")
    logger.info(f"\nUnmount with: fusermount -u {mountpoint}")

    FUSE(PalaceFS(), mountpoint, nothreads=True, foreground=True)


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 2:
        print("Usage: palace_fuse.py <mountpoint>")
        print("\nExample:")
        print("  mkdir -p /mnt/memory_palace")
        print("  python3 palace_fuse.py /mnt/memory_palace")
        print("  cd /mnt/memory_palace")
        print("  ls")
        print("  echo 'critical insight' > inner_ring/fact_045_insight.md")
        print("  vim middle_ring/fact_090_note.txt")
        print("  fusermount -u /mnt/memory_palace")
        sys.exit(1)

    try:
        main(sys.argv[1])
    except KeyboardInterrupt:
        print("\n\nUnmounting...")
        os.system(f"fusermount -uz {sys.argv[1]} 2>/dev/null")
        print("Done.")