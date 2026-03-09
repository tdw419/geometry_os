"""
Hot-Swap Manager for Self-Rewriting Kernel

Safely applies kernel rewrites with automatic backup and rollback capability.
This is critical infrastructure for self-modifying code.
"""

from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import List, Optional, Any
import re
import shutil
import time

from systems.sisyphus.kernel_rewriter import RewriteProposal


@dataclass
class AppliedRewrite:
    """Tracks an applied rewrite for potential rollback."""
    proposal: RewriteProposal
    backup_path: str
    applied_at: datetime
    rolled_back: bool = False


class HotSwapManager:
    """
    Manages safe application of kernel rewrites with backup and rollback.

    Features:
    - Creates timestamped backups before applying rewrites
    - Tracks all applied rewrites
    - Supports rollback to any previous state
    """

    def __init__(self, backup_dir: str = ".loop/hot_swap_backups", visual_bridge: Optional[Any] = None):
        """
        Initialize the manager.

        Args:
            backup_dir: Directory to store file backups
            visual_bridge: Optional VisualBridge for real-time feedback
        """
        self.backup_dir = Path(backup_dir)
        self.backup_dir.mkdir(parents=True, exist_ok=True)
        self.history: List[AppliedRewrite] = []
        self.visual_bridge = visual_bridge


    def create_backup(self, file_path: str) -> str:
        """
        Create a timestamped backup of a file.

        Args:
            file_path: Path to the file to backup

        Returns:
            Path to the created backup file
        """
        source = Path(file_path)
        if not source.exists():
            raise FileNotFoundError(f"Cannot backup non-existent file: {file_path}")

        # Create timestamped backup filename
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S_%f")
        backup_name = f"{source.stem}_{timestamp}{source.suffix}"
        backup_path = self.backup_dir / backup_name

        # Copy the file
        shutil.copy2(source, backup_path)

        return str(backup_path)

    def apply_rewrite(self, proposal: RewriteProposal) -> bool:
        """
        Apply a rewrite proposal to its source file.

        Creates a backup first, then replaces the function in the source file.

        Args:
            proposal: The rewrite proposal to apply

        Returns:
            True if rewrite was applied successfully, False otherwise
        """
        if not proposal.source_file:
            return False

        source_path = Path(proposal.source_file)
        if not source_path.exists():
            return False

        try:
            # Create backup
            backup_path = self.create_backup(str(source_path))

            # Read current content
            content = source_path.read_text()

            # Find and replace the function
            new_content = self._replace_function(
                content,
                proposal.original_function,
                proposal.optimized_code
            )

            if new_content is None:
                return False

            # Write new content
            source_path.write_text(new_content)

            # Track the applied rewrite
            applied = AppliedRewrite(
                proposal=proposal,
                backup_path=backup_path,
                applied_at=datetime.now(),
                rolled_back=False
            )
            self.history.append(applied)
            
            # Emit visual feedback
            if self.visual_bridge:
                self.visual_bridge.emit_kernel_rewrite(
                    proposal.original_function,
                    proposal.expected_speedup
                )

            return True

        except Exception:
            return False

    def _replace_function(
        self,
        content: str,
        func_name: str,
        new_code: str
    ) -> Optional[str]:
        """
        Replace a function definition in source code.

        Args:
            content: The original source code
            func_name: Name of the function to replace
            new_code: The new function code

        Returns:
            Modified source code, or None if function not found
        """
        # Pattern to match the function definition
        # Handles various Rust function signatures:
        # - fn name() {}
        # - fn name(params) {}
        # - fn name() -> Type {}
        # - pub fn name() {}
        pattern = rf'(pub\s+)?fn\s+{re.escape(func_name)}\s*\([^)]*\)\s*(->\s*[^{{]+)?\s*\{{'

        match = re.search(pattern, content)
        if not match:
            return None

        # Find the start of the function
        start = match.start()

        # Find the matching closing brace
        brace_count = 0
        pos = match.end() - 1  # Position at the opening brace

        while pos < len(content):
            if content[pos] == '{':
                brace_count += 1
            elif content[pos] == '}':
                brace_count -= 1
                if brace_count == 0:
                    # Found the matching closing brace
                    end = pos + 1
                    # Replace the entire function
                    return content[:start] + new_code + content[end:]
            pos += 1

        return None

    def rollback(self, file_path: str, backup_path: str) -> bool:
        """
        Rollback a file to a previous backup version.

        Args:
            file_path: Path to the file to restore
            backup_path: Path to the backup file to restore from

        Returns:
            True if rollback was successful, False otherwise
        """
        backup = Path(backup_path)
        target = Path(file_path)

        if not backup.exists():
            return False

        try:
            # Restore from backup
            shutil.copy2(backup, target)

            # Mark any affected rewrites as rolled back
            for applied in self.history:
                if applied.backup_path == backup_path and not applied.rolled_back:
                    applied.rolled_back = True

            return True

        except Exception:
            return False

    def get_active_rewrites(self) -> List[AppliedRewrite]:
        """
        Get list of rewrites that have not been rolled back.

        Returns:
            List of AppliedRewrite objects that are still active
        """
        return [r for r in self.history if not r.rolled_back]

    def get_all_rewrites(self) -> List[AppliedRewrite]:
        """
        Get list of all rewrites, including rolled back ones.

        Returns:
            List of all AppliedRewrite objects
        """
        return self.history.copy()

    def clear_history(self) -> None:
        """Clear the rewrite history (does not delete backup files)."""
        self.history.clear()
