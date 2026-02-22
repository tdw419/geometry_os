"""
EvolutionTracker - Track evolution events for recursive evolution.

Tracks and analyzes evolution events including:
- Attempts: AI improvement attempts
- Successes: Successful improvements
- Rejections: Failed safety/quality checks
- Rollbacks: Reverted changes
- Consensus: Multi-agent agreed changes

Provides metrics for evolution velocity and improvement tracking.
"""

from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Dict, Any, Optional, List


class EventType(Enum):
    """Types of evolution events."""
    ATTEMPT = "attempt"
    SUCCESS = "success"
    REJECTION = "rejection"
    ROLLBACK = "rollback"
    CONSENSUS = "consensus"


@dataclass
class EvolutionEvent:
    """
    Represents a single evolution event.

    Attributes:
        type: The type of event (ATTEMPT, SUCCESS, etc.)
        target_file: Path to the file being modified
        timestamp: When the event occurred
        value_score_before: Value score before the change
        value_score_after: Value score after the change (None for attempts)
        reason: Explanation for the event
        metadata: Optional additional information
    """
    type: EventType
    target_file: str
    timestamp: datetime
    value_score_before: float
    value_score_after: Optional[float]
    reason: str
    metadata: Dict[str, Any] = field(default_factory=dict)


class EvolutionTracker:
    """
    Tracks and analyzes evolution events for the recursive evolution system.

    Maintains a log of all evolution events and provides metrics for
    monitoring evolution progress, including:
    - Total counts of improvements, rejections, rollbacks
    - Improvement delta tracking
    - Evolution velocity (improvements per hour)
    - Comprehensive reports

    Example:
        >>> tracker = EvolutionTracker()
        >>> event = EvolutionEvent(
        ...     type=EventType.SUCCESS,
        ...     target_file="core.py",
        ...     timestamp=datetime.now(),
        ...     value_score_before=0.4,
        ...     value_score_after=0.6,
        ...     reason="Refactored for clarity"
        ... )
        >>> tracker.log_event(event)
        >>> print(f"Total improvements: {tracker.total_improvements}")
        >>> print(f"Velocity: {tracker.calculate_velocity():.2f}/hour")
    """

    def __init__(self):
        """Initialize the EvolutionTracker with empty state."""
        self._events: List[EvolutionEvent] = []
        self._total_improvements: int = 0
        self._total_rejections: int = 0
        self._total_rollbacks: int = 0
        self._total_improvement_delta: float = 0.0

    @property
    def events(self) -> List[EvolutionEvent]:
        """Get the list of all logged events."""
        return self._events

    @property
    def total_improvements(self) -> int:
        """Get the total count of successful improvements."""
        return self._total_improvements

    @property
    def total_rejections(self) -> int:
        """Get the total count of rejections."""
        return self._total_rejections

    @property
    def total_rollbacks(self) -> int:
        """Get the total count of rollbacks."""
        return self._total_rollbacks

    @property
    def total_improvement_delta(self) -> float:
        """Get the total cumulative improvement delta."""
        return self._total_improvement_delta

    @property
    def average_improvement_delta(self) -> float:
        """
        Calculate the average improvement delta per successful improvement.

        Returns:
            Average delta, or 0.0 if no improvements have been made.
        """
        if self._total_improvements == 0:
            return 0.0
        return self._total_improvement_delta / self._total_improvements

    def log_event(self, event: EvolutionEvent) -> None:
        """
        Log an evolution event and update metrics.

        Args:
            event: The evolution event to log
        """
        self._events.append(event)

        # Update counters based on event type
        if event.type == EventType.SUCCESS:
            self._total_improvements += 1
            if event.value_score_after is not None:
                delta = event.value_score_after - event.value_score_before
                self._total_improvement_delta += delta

        elif event.type == EventType.CONSENSUS:
            # Consensus also counts as an improvement
            self._total_improvements += 1
            if event.value_score_after is not None:
                delta = event.value_score_after - event.value_score_before
                self._total_improvement_delta += delta

        elif event.type == EventType.REJECTION:
            self._total_rejections += 1

        elif event.type == EventType.ROLLBACK:
            self._total_rollbacks += 1

        # ATTEMPT events don't update any counters, just logged

    def calculate_velocity(self, hours: float = 1.0) -> float:
        """
        Calculate the evolution velocity (improvements per hour).

        Only counts SUCCESS and CONSENSUS events within the specified
        time window.

        Args:
            hours: Time window in hours (default 1.0)

        Returns:
            Number of improvements per hour within the time window
        """
        if hours <= 0 or self._total_improvements == 0:
            return 0.0

        now = datetime.now()
        cutoff = now - timedelta(hours=hours)

        # Count improvement events within the time window
        recent_improvements = sum(
            1 for event in self._events
            if event.type in (EventType.SUCCESS, EventType.CONSENSUS)
            and event.timestamp >= cutoff
        )

        return recent_improvements / hours

    def generate_report(self) -> Dict[str, Any]:
        """
        Generate a comprehensive report of evolution metrics.

        Returns:
            Dictionary containing all evolution metrics:
            - total_improvements: Count of successful improvements
            - total_rejections: Count of rejected changes
            - total_rollbacks: Count of rolled back changes
            - total_improvement_delta: Cumulative score improvement
            - average_improvement_delta: Average improvement per success
            - velocity: Current evolution velocity (per hour)
            - total_events: Total number of all events logged
        """
        return {
            "total_improvements": self._total_improvements,
            "total_rejections": self._total_rejections,
            "total_rollbacks": self._total_rollbacks,
            "total_improvement_delta": self._total_improvement_delta,
            "average_improvement_delta": self.average_improvement_delta,
            "velocity": self.calculate_velocity(hours=1.0),
            "total_events": len(self._events),
        }
