"""
Phase 63: Intent Prediction

Predict user/operator intent to proactively prepare actions.

Provides intent inference from observed patterns,
proactive resource preparation, and confidence-based action suggestions.
"""

import re
import uuid
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Any


class IntentType(Enum):
    """Type of predicted intent."""
    SCALE_UP = "scale_up"
    SCALE_DOWN = "scale_down"
    MIGRATION = "migration"
    FAILOVER = "failover"
    RECOVERY = "recovery"
    OPTIMIZATION = "optimization"
    DEBUGGING = "debugging"
    MAINTENANCE = "maintenance"
    CAPACITY_PLANNING = "capacity_planning"
    COST_REDUCTION = "cost_reduction"
    SECURITY_SCAN = "security_scan"
    BACKUP = "backup"
    DEPLOYMENT = "deployment"
    ROLLBACK = "rollback"
    INSPECTION = "inspection"
    LOG_VIEW = "log_view"
    METRICS_CHECK = "metrics_check"
    HEALTH_CHECK = "health_check"
    CUSTOM = "custom"


class IntentConfidence(Enum):
    """Confidence level of intent prediction."""
    VERY_LOW = "very_low"
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    VERY_HIGH = "very_high"
    CERTAIN = "certain"


class IntentStatus(Enum):
    """Status of a predicted intent."""
    PREDICTED = "predicted"
    CONFIRMED = "confirmed"
    EXECUTING = "executing"
    COMPLETED = "completed"
    CANCELLED = "cancelled"
    EXPIRED = "expired"


class ActionType(Enum):
    """Type of proactive action."""
    PREALLOCATE = "preallocate"
    PREPARE = "prepare"
    WARM_UP = "warm_up"
    CLEANUP = "cleanup"
    NOTIFY = "notify"
    LOG = "log"
    SCALE = "scale"
    MIGRATE = "migrate"
    BACKUP = "backup"
    ALERT = "alert"
    CUSTOM = "custom"


@dataclass
class IntentPattern:
    """A pattern for recognizing intent."""
    id: str
    name: str
    intent_type: IntentType
    trigger_patterns: list[str] = field(default_factory=list)
    required_actions: list[str] = field(default_factory=list)
    context_keys: list[str] = field(default_factory=list)
    confidence_base: float = 0.5
    created_at: datetime = field(default_factory=datetime.now)
    usage_count: int = 0
    success_count: int = 0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class UserAction:
    """An action observed from a user."""
    id: str
    action_type: str
    timestamp: datetime
    target: str = ""
    parameters: dict[str, Any] = field(default_factory=dict)
    outcome: str = ""
    duration_ms: float = 0.0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class IntentContext:
    """Context for intent inference."""
    id: str
    cluster_id: str
    peer_id: str
    recent_actions: list[UserAction] = field(default_factory=list)
    current_metrics: dict[str, Any] = field(default_factory=dict)
    time_of_day: int = 0
    day_of_week: int = 0
    recent_alerts: int = 0
    active_migrations: int = 0
    container_count: int = 0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class PredictedIntent:
    """A predicted intent with confidence score."""
    id: str
    intent_type: IntentType
    confidence: IntentConfidence
    context: IntentContext
    suggested_actions: list[str] = field(default_factory=list)
    reasoning: str = ""
    created_at: datetime = field(default_factory=datetime.now)
    expires_at: datetime | None = None
    status: IntentStatus = IntentStatus.PREDICTED
    confirmed_at: datetime | None = None
    executed_at: datetime | None = None
    metadata: dict[str, Any] = field(default_factory=dict)

    def is_expired(self) -> bool:
        """Check if intent prediction has expired."""
        if self.expires_at is None:
            return False
        return datetime.now() > self.expires_at

    def confirm(self) -> None:
        """Confirm the predicted intent."""
        self.status = IntentStatus.CONFIRMED
        self.confirmed_at = datetime.now()

    def execute(self) -> None:
        """Mark intent as executing."""
        self.status = IntentStatus.EXECUTING
        self.executed_at = datetime.now()

    def complete(self) -> None:
        """Mark intent as completed."""
        self.status = IntentStatus.COMPLETED

    def cancel(self) -> None:
        """Cancel the intent."""
        self.status = IntentStatus.CANCELLED


@dataclass
class ProactiveAction:
    """A proactive action to take."""
    id: str
    action_type: ActionType
    target: str
    parameters: dict[str, Any] = field(default_factory=dict)
    priority: int = 50
    estimated_impact: str = ""
    created_at: datetime = field(default_factory=datetime.now)
    executed_at: datetime | None = None
    result: str | None = None
    metadata: dict[str, Any] = field(default_factory=dict)

    def is_ready(self) -> bool:
        """Check if action is ready to execute."""
        return self.executed_at is None

    def execute(self, result: str) -> None:
        """Execute the action with result."""
        self.executed_at = datetime.now()
        self.result = result


@dataclass
class IntentHistory:
    """History of intent predictions."""
    predictions: list[PredictedIntent] = field(default_factory=list)
    confirmed_count: int = 0
    cancelled_count: int = 0
    accuracy_rate: float = 0.0
    max_history: int = 1000

    def record_prediction(self, prediction: PredictedIntent) -> None:
        """Record a prediction."""
        self.predictions.append(prediction)
        if len(self.predictions) > self.max_history:
            self.predictions = self.predictions[-self.max_history:]

    def update_accuracy(self, prediction: PredictedIntent, was_correct: bool) -> None:
        """Update accuracy metrics."""
        if prediction.status == IntentStatus.CONFIRMED:
            self.confirmed_count += 1
        elif prediction.status == IntentStatus.CANCELLED:
            self.cancelled_count += 1

        total = self.confirmed_count + self.cancelled_count
        if total > 0:
            self.accuracy_rate = self.confirmed_count / total

    def get_recent_predictions(self, limit: int = 10) -> list[PredictedIntent]:
        """Get recent predictions."""
        return self.predictions[-limit:]

    def get_predictions_by_type(self, intent_type: IntentType) -> list[PredictedIntent]:
        """Get predictions by type."""
        return [p for p in self.predictions if p.intent_type == intent_type]


class PatternRecognizer:
    """Recognizes patterns from user actions."""

    def __init__(self):
        self.patterns: dict[str, IntentPattern] = {}
        self.action_history: list[UserAction] = []
        self.max_history: int = 10000

    def record_action(self, action: UserAction) -> None:
        """Record a user action for pattern analysis."""
        self.action_history.append(action)
        if len(self.action_history) > self.max_history:
            self.action_history = self.action_history[-self.max_history:]

    def analyze_patterns(self) -> list[IntentPattern]:
        """Analyze action history for patterns."""
        patterns = []

        # Group actions by type
        by_type: dict[str, list[UserAction]] = defaultdict(list)
        for action in self.action_history:
            by_type[action.action_type].append(action)

        # Analyze each action type for patterns
        for action_type, actions in by_type.items():
            if len(actions) >= 3:
                # Check for frequency pattern
                frequency = len(actions)
                if frequency >= 3:
                    # Check for time-based patterns
                    hour_counts = [0] * 24
                    for action in actions:
                        hour_counts[action.timestamp.hour] += 1

                    peak_hour = hour_counts.index(max(hour_counts)) if hour_counts else 0
                    if peak_hour >= 1:
                        patterns.append(IntentPattern(
                            id=f"freq_{action_type}",
                            name=f"Frequent {action_type}",
                            intent_type=self._map_action_to_intent(action_type),
                            trigger_patterns=[f"frequency>{frequency}"],
                            required_actions=[],
                            context_keys=["time", "frequency"],
                            confidence_base=min(0.3, frequency / 100)
                        ))
        return patterns

    def _map_action_to_intent(self, action_type: str) -> IntentType:
        """Map action type to intent type."""
        mapping = {
            "scale_up": IntentType.SCALE_UP,
            "scale_down": IntentType.SCALE_DOWN,
            "migrate": IntentType.MIGRATION,
            "failover": IntentType.FAILOVER,
            "restart": IntentType.RECOVERY,
            "debug": IntentType.DEBUGGING,
            "backup": IntentType.BACKUP,
            "deploy": IntentType.DEPLOYMENT,
            "rollback": IntentType.ROLLBACK,
            "check": IntentType.HEALTH_CHECK,
            "view": IntentType.INSPECTION,
        }
        return mapping.get(action_type, IntentType.MAINTENANCE)
    def get_pattern(self, pattern_id: str) -> IntentPattern | None:
        """Get a pattern by ID."""
        return self.patterns.get(pattern_id)
    def register_pattern(self, pattern: IntentPattern) -> None:
        """Register a new pattern."""
        self.patterns[pattern.id] = pattern


class IntentInference:
    """Infers intent from context and patterns."""

    def __init__(self):
        self.pattern_recognizer = PatternRecognizer()
        self.intent_history = IntentHistory()
        self.min_confidence_threshold: float = 0.6
        self.expiry_minutes: int = 30

    def infer_intent(self, context: IntentContext) -> PredictedIntent | None:
        """Infer intent from context and patterns."""
        # Analyze context for patterns
        patterns = self.pattern_recognizer.analyze_patterns()
        # Score each potential intent
        scores: dict[IntentType, float] = {}
        for pattern in patterns:
            # Check context match
            match_score = self._calculate_context_match(context, pattern)
            if match_score > 0:
                for trigger in pattern.trigger_patterns:
                    if re.search(trigger, context.metadata):
                        match_score += 0.6
                scores[pattern.intent_type] = scores.get(pattern.intent_type, 0) + match_score * pattern.confidence_base
        # Get best intent
        if not scores:
            return None
        best_intent = max(scores, key=scores.get)
        confidence = self._get_confidence_level(best_score)
        # Create predicted intent
        prediction = PredictedIntent(
            id=str(uuid.uuid4())[:8],
            intent_type=best_intent,
            confidence=confidence,
            context=context,
            suggested_actions=self._get_suggested_actions(best_intent),
            reasoning=f"Based on {len(patterns)} patterns"
        )
        # Record in history
        self.intent_history.record_prediction(prediction)
        return prediction
    def _calculate_context_match(self, context: IntentContext, pattern: IntentPattern) -> float:
        """Calculate how well context matches pattern."""
        score = 0.0
        # Check time context
        if pattern.context_keys:
            if "time" in pattern.context_keys:
                current_hour = context.metadata.get("hour", datetime.now().hour)
                if current_hour in pattern.context_keys:
                    score += 0.2
            if "day_of_week" in pattern.context_keys:
                current_dow = datetime.now().weekday()
                score += 0.1
        # Check metric context
        if "metrics" in pattern.context_keys:
            for key in pattern.context_keys:
                if key in context.current_metrics:
                    score += 0.2
        # Check action context
        if "recent_actions" in pattern.context_keys:
            recent_types = [a.action_type for a in context.recent_actions]
            for trigger in pattern.trigger_patterns:
                if trigger in recent_types:
                    score += 0.3
        return score
    def _get_confidence_level(self, score: float) -> IntentConfidence:
        """Convert score to confidence level."""
        if score >= 0.9:
            return IntentConfidence.VERY_HIGH
        elif score >= 0.7:
            return IntentConfidence.HIGH
        elif score >= 0.5:
            return IntentConfidence.MEDIUM
        elif score >= 0.3:
            return IntentConfidence.LOW
        return IntentConfidence.VERY_LOW
    def _get_suggested_actions(self, intent_type: IntentType) -> list[str]:
        """Get suggested actions for intent type."""
        suggestions = {
            IntentType.SCALE_UP: [
                "Check resource availability",
                "Prepare scaling configuration",
                "Monitor resource usage",
            ],
            IntentType.SCALE_DOWN: [
                "Identify resources to release",
                "Prepare termination procedures",
                "Update monitoring thresholds",
            ],
            IntentType.MIGRATION: [
                "Prepare target peer",
                "Checkpoint container state",
                "Configure network routes",
            ],
            IntentType.FAILOVER: [
                "Prepare failover procedures",
                "Activate backup systems",
                "Notify administrators",
            ],
            IntentType.RECOVERY: [
                "Identify recovery point",
                "Prepare recovery environment",
                "Start recovery process",
            ],
            IntentType.DEBUGGING: [
                "Enable verbose logging",
                "Prepare diagnostic tools",
                "Collect debug information",
            ],
            IntentType.MAINTENANCE: [
                "Schedule maintenance window",
                "Prepare backup resources",
                "Notify users",
            ],
            IntentType.CAPACITY_PLANNING: [
                "Analyze capacity trends",
                "Prepare resource forecasts",
                "Generate scaling recommendations",
            ],
            IntentType.COST_REDUCTION: [
                "Identify cost sources",
                "Analyze usage patterns",
                "Generate cost report",
            ],
            IntentType.SECURITY_SCAN: [
                "Prepare security tools",
                "Scan for vulnerabilities",
                "Generate security report",
            ],
            IntentType.BACKUP: [
                "Verify backup integrity",
                "Prepare restore procedures",
                "Test backup restoration",
            ],
            IntentType.DEPLOYMENT: [
                "Validate deployment configuration",
                "Prepare rollback plan",
                "Execute staged deployment",
            ],
            IntentType.ROLLBACK: [
                "Verify rollback safety",
                "Prepare clean state",
                "Execute rollback procedures",
            ],
            IntentType.INSPECTION: [
                "Prepare inspection tools",
                "Collect inspection data",
                "Generate inspection report",
            ],
            IntentType.HEALTH_CHECK: [
                "Prepare health check tools",
                "Schedule health checks",
                "Prepare health report",
            ],
        }
        return suggestions.get(intent_type, [
            "Monitor for patterns",
            "Prepare proactive measures",
        ])
    def clear_expired_intents(self) -> list[PredictedIntent]:
        """Clear expired predictions."""
        expired = []
        now = datetime.now()
        for prediction in list(self.intent_history.predictions):
            if prediction.is_expired():
                prediction.status = IntentStatus.EXPIRED
                expired.append(prediction)
        return expired


class ProactivePreparer:
    """Prepares resources proactively based on predicted intents."""

    def __init__(self):
        self.pending_actions: dict[str, ProactiveAction] = {}
        self.completed_actions: list[ProactiveAction] = []
        self.max_actions: int = 100

        self.intent_history = IntentHistory()

    def prepare_for_intent(self, intent: PredictedIntent) -> list[ProactiveAction]:
        """Prepare proactive actions for predicted intent."""
        actions = []
        suggestions = self._get_suggested_actions(intent.intent_type)
        for suggestion in suggestions:
            action = ProactiveAction(
                id=str(uuid.uuid4())[:8],
                action_type=ActionType.PREPARE,
                target=intent.context.cluster_id,
                parameters={"intent": intent.id}
            )
            actions.append(action)
            self.pending_actions[action.id] = action
        return actions
    def _get_suggested_actions(self, intent_type: IntentType) -> list[str]:
        """Get suggested actions for intent type."""
        return [
            "Prepare resources",
            "Configure monitoring",
            "Validate readiness",
        ]
    def execute_action(self, action_id: str) -> bool:
        """Execute a pending action."""
        action = self.pending_actions.get(action_id)
        if not action:
            return False
        try:
            # Mark as executing
            action.executed_at = datetime.now()
            # Execute the action (simulated)
            result = f"Executed {action.action_type.value}"
            action.result = result
            # Move to completed
            del self.pending_actions[action_id]
            self.completed_actions.append(action)
            return True
        except Exception as e:
            action.result = str(e)
            return False
    def get_pending_actions(self) -> list[ProactiveAction]:
        """Get all pending actions."""
        return list(self.pending_actions.values())
    def get_completed_actions(self) -> list[ProactiveAction]:
        """Get all completed actions."""
        return list(self.completed_actions)
    def clear_completed_actions(self) -> None:
        """Clear completed actions."""
        self.completed_actions = []
    def clear_expired_intents(self) -> int:
        """Clear all expired intents."""
        now = datetime.now()
        expired = []
        for prediction in list(self.intent_history.predictions):
            if prediction.is_expired():
                prediction.status = IntentStatus.EXPIRED
                expired.append(prediction)
        for prediction in expired:
            self.intent_history.predictions.remove(prediction)
        return len(expired)
class IntentPredictor:
    """Main class combining intent prediction components."""

    def __init__(self):
        self.intent_inference = IntentInference()
        self.proactive_preparer = ProactivePreparer()
        self.prediction_history: list[PredictedIntent] = []
        self.max_history: int = 1000
        self._subscribers: list[Callable[[PredictedIntent], None]] = []
    def predict(self, context: IntentContext) -> PredictedIntent | None:
        """Predict intent from context and return predicted intent."""
        prediction = self.intent_inference.infer_intent(context)
        if prediction:
            self.prediction_history.append(prediction)
            if len(self.prediction_history) > self.max_history:
                self.prediction_history = self.prediction_history[-self.max_history:]
            # Prepare proactive actions
            self.proactive_preparer.prepare_for_intent(prediction)
            # Notify subscribers
            for callback in self._subscribers:
                callback(prediction)
        return prediction
    def confirm_prediction(self, prediction_id: str) -> bool:
        """Confirm a prediction was correct."""
        for prediction in self.prediction_history:
            if prediction.id == prediction_id:
                prediction.confirm()
                return True
        return False
    def cancel_prediction(self, prediction_id: str, reason: str = "Cancelled") -> bool:
        """Cancel a prediction."""
        for prediction in self.prediction_history:
            if prediction.id == prediction_id:
                prediction.cancel()
                return True
        return False
    def subscribe(self, callback: Callable[[PredictedIntent], None]) -> None:
        """Subscribe to predictions."""
        self._subscribers.append(callback)
    def get_prediction(self, prediction_id: str) -> PredictedIntent | None:
        """Get a prediction by ID."""
        for prediction in self.prediction_history:
            if prediction.id == prediction_id:
                return prediction
        return None
    def get_recent_predictions(self, limit: int = 10) -> list[PredictedIntent]:
        """Get recent predictions."""
        return self.prediction_history[-limit:]
    def get_accuracy_stats(self) -> dict:
        """Get prediction accuracy statistics."""
        confirmed = sum(
            1 for p in self.prediction_history
            if p.status in (IntentStatus.CONFIRMED, IntentStatus.COMPLETED)
        )
        cancelled = sum(
            1 for p in self.prediction_history
            if p.status == IntentStatus.CANCELLED
        )
        total = len(self.prediction_history)
        return {
            "total_predictions": total,
            "confirmed": confirmed,
            "cancelled": cancelled,
            "accuracy_rate": confirmed / total if total > 0 else 0.0,
        }
    def clear_expired_predictions(self) -> int:
        """Clear expired predictions."""
        self.proactive_preparer.clear_expired_intents()
        now = datetime.now()
        expired = []
        for prediction in self.prediction_history:
            if prediction.is_expired():
                prediction.status = IntentStatus.EXPIRED
                expired.append(prediction)
        for prediction in expired:
            self.prediction_history.remove(prediction)
        return len(expired)


# Factory functions

def create_intent_context(
    cluster_id: str,
    peer_id: str,
    recent_actions: list[UserAction] | None = None,
    current_metrics: dict[str, Any] | None = None,
) -> IntentContext:
    """Create an intent context."""
    return IntentContext(
        id=str(uuid.uuid4())[:8],
        cluster_id=cluster_id,
        peer_id=peer_id,
        recent_actions=recent_actions or [],
        current_metrics=current_metrics or {},
    )


def create_user_action(
    action_type: str,
    target: str,
    parameters: dict[str, Any] | None = None,
    outcome: str = ""
) -> UserAction:
    """Create a user action."""
    return UserAction(
        id=str(uuid.uuid4())[:8],
        action_type=action_type,
        timestamp=datetime.now(),
        target=target,
        parameters=parameters or {},
        outcome=outcome,
    )


def create_predicted_intent(
    intent_type: IntentType,
    confidence: IntentConfidence,
    context: IntentContext,
    reasoning: str = ""
) -> PredictedIntent:
    """Create a predicted intent."""
    return PredictedIntent(
        id=str(uuid.uuid4())[:8],
        intent_type=intent_type,
        confidence=confidence,
        context=context,
        reasoning=reasoning,
        expires_at=datetime.now() + timedelta(minutes=30),
    )


def create_proactive_action(
    action_type: ActionType,
    target: str,
    parameters: dict[str, Any] | None = None,
    priority: int = 50,
) -> ProactiveAction:
    """Create a proactive action."""
    return ProactiveAction(
        id=str(uuid.uuid4())[:8],
        action_type=action_type,
        target=target,
        parameters=parameters or {},
        priority=priority,
    )


def create_intent_predictor() -> IntentPredictor:
    """Create an intent predictor instance."""
    return IntentPredictor()
