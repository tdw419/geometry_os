"""
AxionCore - The focal point at (0,0) for self-improvement targeting.

The AxionCore is the central coordination point for the recursive self-improvement
swarm. It maintains a priority queue of improvement candidates and manages the
selection and completion of targets.

Task 3 of Recursive Self-Improvement Swarm specification.
"""

from __future__ import annotations

import dataclasses
import heapq
import time
from dataclasses import dataclass, field
from typing import Any, Callable, Dict, List, Optional


@dataclass
class AxionTarget:
    """
    A candidate target for self-improvement.

    Attributes:
        file_path: Path to the file to improve
        value_score: Priority score (higher = more valuable to improve)
        protected: Whether this file is protected from normal selection
        metadata: Additional context about this target

    For priority queue ordering, we use negated value_score so that
    higher values come first (Python's heapq is a min-heap).
    """

    # Sort key (negated value for max-heap behavior)
    sort_key: float = field(init=False, repr=False)

    file_path: str
    value_score: float = 0.0
    protected: bool = False
    metadata: Dict[str, Any] = field(default_factory=dict)

    def __post_init__(self):
        # Negate value_score so higher values sort first
        self.sort_key = -self.value_score

    def __lt__(self, other: AxionTarget) -> bool:
        if not isinstance(other, AxionTarget):
            return NotImplemented
        return self.sort_key < other.sort_key

    def __le__(self, other: AxionTarget) -> bool:
        if not isinstance(other, AxionTarget):
            return NotImplemented
        return self.sort_key <= other.sort_key

    def __gt__(self, other: AxionTarget) -> bool:
        if not isinstance(other, AxionTarget):
            return NotImplemented
        return self.sort_key > other.sort_key

    def __ge__(self, other: AxionTarget) -> bool:
        if not isinstance(other, AxionTarget):
            return NotImplemented
        return self.sort_key >= other.sort_key

    def __eq__(self, other: object) -> bool:
        if not isinstance(other, AxionTarget):
            return False
        return (
            self.file_path == other.file_path
            and self.value_score == other.value_score
        )

    def __hash__(self) -> int:
        return hash(self.file_path)


class AxionCore:
    """
    The focal point at (0,0) for self-improvement targeting.

    AxionCore manages a priority queue of improvement candidates and coordinates
    the selection of targets for the recursive self-improvement swarm.

    Key responsibilities:
    1. Maintain candidate queue ordered by value_score
    2. Respect protected files (skip in normal selection)
    3. Track current target and completion history
    4. Emit events for swarm coordination

    Example:
        core = AxionCore(protected_files=["/critical/safety.py"])
        core.add_candidate("/module.py", value_score=75, reason="high_complexity")

        target = core.select_target()
        if target:
            # ... perform improvement ...
            core.complete_target(target.file_path, improvement_delta=0.25)
    """

    def __init__(self, protected_files: Optional[List[str]] = None):
        """
        Initialize the AxionCore.

        Args:
            protected_files: List of file paths that are protected from
                            normal selection. These files require higher
                            consensus to be targeted.
        """
        # Priority queue: list of (sort_key, counter, AxionTarget)
        # counter ensures stable ordering for equal priorities
        self._counter = 0
        self._candidates: List[tuple] = []  # heap

        # Quick lookup by file_path
        self._candidate_map: Dict[str, AxionTarget] = {}

        # Protected files set for fast lookup
        self._protected_files: set = set(protected_files or [])

        # Current active target
        self._current_target: Optional[AxionTarget] = None

        # Completion history
        self._improvement_history: List[Dict[str, Any]] = []

        # Event callback (can be overridden)
        self.on_event: Optional[Callable[[Dict[str, Any]], None]] = None

    @property
    def current_target(self) -> Optional[AxionTarget]:
        """Get the currently selected target, if any."""
        return self._current_target

    @property
    def protected_files(self) -> set:
        """Get the set of protected files."""
        return self._protected_files

    @property
    def improvement_history(self) -> List[Dict[str, Any]]:
        """Get the history of completed improvements."""
        return self._improvement_history

    def candidate_count(self) -> int:
        """Return the number of candidates in the queue."""
        return len(self._candidate_map)

    def add_candidate(
        self,
        file_path: str,
        value_score: float,
        **metadata: Any,
    ) -> None:
        """
        Add a candidate file for improvement targeting.

        Args:
            file_path: Path to the candidate file
            value_score: Priority score (higher = more valuable)
            **metadata: Additional context (reason, suggestions, etc.)
        """
        # Check if file is in protected list
        protected = file_path in self._protected_files

        # Create target
        target = AxionTarget(
            file_path=file_path,
            value_score=value_score,
            protected=protected,
            metadata=metadata,
        )

        # Remove existing entry if present
        if file_path in self._candidate_map:
            self.remove_candidate(file_path)

        # Add to heap and map
        self._counter += 1
        heapq.heappush(self._candidates, (target.sort_key, self._counter, target))
        self._candidate_map[file_path] = target

    def remove_candidate(self, file_path: str) -> None:
        """
        Remove a candidate from the queue.

        Args:
            file_path: Path to the file to remove

        Note:
            This marks the candidate for removal. The actual heap entry
            is lazily removed during select_target().
        """
        if file_path in self._candidate_map:
            del self._candidate_map[file_path]

    def add_protected_file(self, file_path: str) -> None:
        """
        Add a file to the protected list.

        Protected files require higher consensus to be targeted
        and are skipped in normal selection.

        Args:
            file_path: Path to the file to protect
        """
        self._protected_files.add(file_path)

        # Update existing candidate if present
        if file_path in self._candidate_map:
            target = self._candidate_map[file_path]
            target.protected = True

    def remove_protected_file(self, file_path: str) -> None:
        """
        Remove a file from the protected list.

        Args:
            file_path: Path to the file to unprotect
        """
        self._protected_files.discard(file_path)

        # Update existing candidate if present
        if file_path in self._candidate_map:
            target = self._candidate_map[file_path]
            target.protected = False

    def select_target(self) -> Optional[AxionTarget]:
        """
        Select the highest-priority non-protected target.

        Returns:
            The highest-value target that is not protected,
            or None if no suitable candidates exist.
        """
        # Clean up heap - remove entries not in map
        while self._candidates:
            _, _, target = self._candidates[0]
            if target.file_path in self._candidate_map:
                break
            heapq.heappop(self._candidates)

        # Find highest-priority non-protected target
        # We need to search through candidates since protected ones
        # are interspersed
        candidates_copy = list(self._candidates)
        heapq.heapify(candidates_copy)

        while candidates_copy:
            _, _, target = heapq.heappop(candidates_copy)

            # Skip if removed
            if target.file_path not in self._candidate_map:
                continue

            # Skip protected files
            if target.protected:
                continue

            # Found a valid target
            self._current_target = target
            return target

        # No valid candidates
        self._current_target = None
        return None

    def complete_target(
        self,
        file_path: str,
        improvement_delta: float,
    ) -> None:
        """
        Mark a target as completed and record the improvement.

        Args:
            file_path: Path to the completed file
            improvement_delta: Measured improvement (e.g., 0.25 = 25% better)

        Emits:
            event with type="target_completed"
        """
        # Remove from candidates
        self.remove_candidate(file_path)

        # Record in history
        record = {
            "file_path": file_path,
            "delta": improvement_delta,
            "timestamp": time.time(),
            "previous_target": self._current_target.file_path
            if self._current_target
            else None,
        }
        self._improvement_history.append(record)

        # Emit event
        if self.on_event:
            event = {
                "type": "target_completed",
                "file_path": file_path,
                "improvement_delta": improvement_delta,
                "timestamp": record["timestamp"],
            }
            self.on_event(event)

        # Clear current target if it matches
        if self._current_target and self._current_target.file_path == file_path:
            self._current_target = None

    def get_all_candidates(self) -> List[AxionTarget]:
        """
        Get all current candidates sorted by value (highest first).

        Returns:
            List of all non-removed candidates.
        """
        return sorted(
            [t for t in self._candidate_map.values()],
            key=lambda t: t.value_score,
            reverse=True,
        )

    def get_protected_candidates(self) -> List[AxionTarget]:
        """
        Get all protected candidates.

        Returns:
            List of protected candidates.
        """
        return [t for t in self._candidate_map.values() if t.protected]

    def clear(self) -> None:
        """Clear all candidates and reset state."""
        self._candidates = []
        self._candidate_map = {}
        self._counter = 0
        self._current_target = None

    def __repr__(self) -> str:
        return (
            f"AxionCore("
            f"candidates={self.candidate_count()}, "
            f"protected={len(self._protected_files)}, "
            f"current={self._current_target.file_path if self._current_target else None})"
        )
