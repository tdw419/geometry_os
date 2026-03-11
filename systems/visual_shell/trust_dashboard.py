"""
Trust Dashboard - Phase 40

Confidence metrics, success rates, and override controls for autonomous operation.
"""

import time
import uuid
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

from systems.visual_shell.action_history import ActionHistory


class OverrideType(Enum):
    """Types of override actions."""
    APPROVE = "approve"
    REJECT = "reject"
    PAUSE = "pause"
    RESUME = "resume"
    MANUAL = "manual"


class TrustLevel(Enum):
    """Trust levels for autonomous operation."""
    FULL_AUTO = "full_auto"
    SUPERVISED = "supervised"
    APPROVAL_REQUIRED = "approval_required"
    MANUAL_ONLY = "manual_only"


@dataclass
class OverrideEvent:
    """Record of an override action."""
    event_id: str
    override_type: OverrideType
    action_id: str | None = None
    reason: str = ""
    operator: str = ""
    timestamp: float = 0.0
    previous_state: str | None = None
    new_state: str | None = None


@dataclass
class ConfidenceBucket:
    """Histogram bucket for confidence ranges."""
    min_confidence: float
    max_confidence: float
    count: int = 0
    success_count: int = 0
    failure_count: int = 0


@dataclass
class TrustMetrics:
    """Current trust metrics for the autonomous system."""
    total_actions: int = 0
    success_count: int = 0
    failure_count: int = 0
    success_rate: float = 0.0
    trust_level: str = field(default_factory=lambda: TrustLevel.SUPERVISED.value)
    last_updated: float = field(default_factory=time.time)


class ConfidenceHistogram:
    """Histogram of confidence values and their accuracy."""

    def __init__(self, bucket_count: int = 10):
        self.bucket_count = bucket_count
        self._buckets: list[ConfidenceBucket] = []

        # Initialize buckets
        step = 1.0 / bucket_count
        for i in range(bucket_count):
            self._buckets.append(ConfidenceBucket(
                min_confidence=i * step,
                max_confidence=(i + 1) * step
            ))

    def update(self, actions: list[Any]) -> None:
        """Update histogram with action history."""
        for action in actions:
            confidence = getattr(action, 'confidence', 0.5)
            success = getattr(action, 'success', False)

            bucket = self.get_bucket(confidence)
            if bucket:
                bucket.count += 1
                if success:
                    bucket.success_count += 1
                else:
                    bucket.failure_count += 1

    def get_bucket(self, confidence: float) -> ConfidenceBucket | None:
        """Get bucket for a confidence value."""
        for bucket in self._buckets:
            if bucket.min_confidence <= confidence < bucket.max_confidence:
                return bucket
            # Handle edge case for max confidence
            if confidence == 1.0 and bucket.max_confidence == 1.0:
                return bucket
        return None

    def get_buckets(self) -> list[ConfidenceBucket]:
        """Get all buckets."""
        return self._buckets

    def get_accuracy_by_confidence(self) -> dict[float, float]:
        """Get accuracy rate for each confidence bucket."""
        accuracy = {}
        for bucket in self._buckets:
            if bucket.count > 0:
                accuracy[bucket.min_confidence] = bucket.success_count / bucket.count
            else:
                accuracy[bucket.min_confidence] = 0.0
        return accuracy


class OverridePanel:
    """Panel for manual override controls."""

    def __init__(self):
        self._pending: dict[str, Any] = {}
        self._overrides: list[OverrideEvent] = []
        self._loop_state: str = "running"

    def add_pending(self, action: Any) -> str:
        """Add an action to pending queue."""
        action_id = getattr(action, 'action_id', str(uuid.uuid4()))
        self._pending[action_id] = action
        return action_id

    def get_pending(self) -> list[Any]:
        """Get all pending actions."""
        return list(self._pending.values())

    def approve(self, action_id: str, operator: str = "") -> OverrideEvent:
        """Approve a pending action."""
        event = OverrideEvent(
            event_id=str(uuid.uuid4()),
            override_type=OverrideType.APPROVE,
            action_id=action_id,
            reason="Manual approval",
            operator=operator,
            timestamp=time.time()
        )
        self._overrides.append(event)
        self._pending.pop(action_id, None)
        return event

    def reject(self, action_id: str, reason: str = "", operator: str = "") -> OverrideEvent:
        """Reject a pending action."""
        event = OverrideEvent(
            event_id=str(uuid.uuid4()),
            override_type=OverrideType.REJECT,
            action_id=action_id,
            reason=reason,
            operator=operator,
            timestamp=time.time()
        )
        self._overrides.append(event)
        self._pending.pop(action_id, None)
        return event

    def pause_loop(self, reason: str = "", operator: str = "") -> OverrideEvent:
        """Pause the autonomous loop."""
        previous = self._loop_state
        self._loop_state = "paused"

        event = OverrideEvent(
            event_id=str(uuid.uuid4()),
            override_type=OverrideType.PAUSE,
            reason=reason,
            operator=operator,
            timestamp=time.time(),
            previous_state=previous,
            new_state="paused"
        )
        self._overrides.append(event)
        return event

    def resume_loop(self, reason: str = "", operator: str = "") -> OverrideEvent:
        """Resume the autonomous loop."""
        previous = self._loop_state
        self._loop_state = "running"

        event = OverrideEvent(
            event_id=str(uuid.uuid4()),
            override_type=OverrideType.RESUME,
            reason=reason,
            operator=operator,
            timestamp=time.time(),
            previous_state=previous,
            new_state="running"
        )
        self._overrides.append(event)
        return event

    def manual_action(self, action_type: str, params: dict[str, Any], operator: str = "") -> OverrideEvent:
        """Trigger a manual action."""
        event = OverrideEvent(
            event_id=str(uuid.uuid4()),
            override_type=OverrideType.MANUAL,
            reason=f"Manual action: {action_type} with params {params}",
            operator=operator,
            timestamp=time.time()
        )
        self._overrides.append(event)
        return event

    def get_overrides(self) -> list[OverrideEvent]:
        """Get all override events."""
        return self._overrides.copy()


class TrustDashboard:
    """Dashboard for trust metrics and override controls."""

    def __init__(self, history: ActionHistory | None = None):
        self.history = history
        self._running = False
        self._trust_level = TrustLevel.SUPERVISED
        self._metrics = TrustMetrics()
        self._histogram = ConfidenceHistogram()
        self._override_panel = OverridePanel()

    async def start(self) -> None:
        """Start the dashboard."""
        self._running = True

    async def stop(self) -> None:
        """Stop the dashboard."""
        self._running = False

    def update_metrics(self) -> None:
        """Update trust metrics from history."""
        if not self.history:
            return

        actions = self.history.get_entries(limit=10000)
        self._metrics.total_actions = len(actions)
        self._metrics.success_count = sum(1 for a in actions if getattr(a, 'success', False))
        self._metrics.failure_count = self._metrics.total_actions - self._metrics.success_count

        if self._metrics.total_actions > 0:
            self._metrics.success_rate = self._metrics.success_count / self._metrics.total_actions

        self._metrics.last_updated = time.time()
        self._histogram.update(actions)

    def get_trust_metrics(self) -> TrustMetrics:
        """Get current trust metrics."""
        return self._metrics

    def get_histogram(self) -> ConfidenceHistogram:
        """Get confidence histogram."""
        return self._histogram

    def get_override_panel(self) -> OverridePanel:
        """Get override panel."""
        return self._override_panel

    def set_trust_level(self, level: TrustLevel) -> None:
        """Set trust level."""
        self._trust_level = level
        self._metrics.trust_level = level.value

    def get_trust_level(self) -> TrustLevel:
        """Get current trust level."""
        return self._trust_level

    def should_auto_approve(self, confidence: float) -> bool:
        """Determine if action should be auto-approved based on trust level and confidence."""
        if self._trust_level == TrustLevel.FULL_AUTO:
            return True
        elif self._trust_level == TrustLevel.MANUAL_ONLY or self._trust_level == TrustLevel.APPROVAL_REQUIRED:
            return False
        elif self._trust_level == TrustLevel.SUPERVISED:
            # High confidence auto-approves, low confidence flags for review
            return confidence >= 0.8
        return False

    def get_stats(self) -> dict[str, Any]:
        """Get dashboard statistics."""
        return {
            "running": self._running,
            "trust_level": self._trust_level.value,
            "metrics": {
                "total_actions": self._metrics.total_actions,
                "success_rate": self._metrics.success_rate,
            }
        }


def create_trust_dashboard(history: ActionHistory | None = None) -> TrustDashboard:
    """Factory function to create a trust dashboard."""
    return TrustDashboard(history=history)
