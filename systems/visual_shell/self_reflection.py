"""
Phase 64: Self-Reflection

Mesh analyzes its own behavior and suggests improvements.

Provides behavior analysis, anomaly detection in decisions,
self-improvement recommendations, and reflection journal.
"""

import uuid
from collections import defaultdict
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Any


class ReflectionType(Enum):
    """Type of reflection."""
    BEHAVIOR_ANALYSIS = "behavior_analysis"
    DECISION_QUALITY = "decision_quality"
    PERFORMANCE_REVIEW = "performance_review"
    ANOMALY_DETECTION = "anomaly_detection"
    IMPROVEMENT_SUGGESTION = "improvement_suggestion"
    LEARNING_INSIGHT = "learning_insight"
    PATTERN_DISCOVERY = "pattern_discovery"
    ERROR_ANALYSIS = "error_analysis"
    SUCCESS_ANALYSIS = "success_analysis"
    TREND_ANALYSIS = "trend_analysis"


class ReflectionSeverity(Enum):
    """Severity level of reflection findings."""
    INFO = "info"
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"


class DecisionQuality(Enum):
    """Quality rating for decisions."""
    EXCELLENT = "excellent"
    GOOD = "good"
    ADEQUATE = "adequate"
    POOR = "poor"
    CRITICAL = "critical"
    UNKNOWN = "unknown"


class ImprovementCategory(Enum):
    """Category of improvement suggestion."""
    PERFORMANCE = "performance"
    RELIABILITY = "reliability"
    COST = "cost"
    SECURITY = "security"
    SCALABILITY = "scalability"
    MAINTAINABILITY = "maintainability"
    USER_EXPERIENCE = "user_experience"
    RESOURCE_USAGE = "resource_usage"
    AUTOMATION = "automation"
    MONITORING = "monitoring"


class ReflectionStatus(Enum):
    """Status of a reflection entry."""
    DRAFT = "draft"
    PUBLISHED = "published"
    ACKNOWLEDGED = "acknowledged"
    ACTIONED = "actioned"
    DISMISSED = "dismissed"
    ARCHIVED = "archived"


@dataclass
class BehaviorMetric:
    """A metric tracking mesh behavior."""
    id: str
    name: str
    value: float
    timestamp: datetime
    threshold_low: float = 0.0
    threshold_high: float = 100.0
    unit: str = ""
    category: str = ""
    metadata: dict[str, Any] = field(default_factory=dict)

    def is_within_bounds(self) -> bool:
        """Check if metric is within acceptable bounds."""
        return self.threshold_low <= self.value <= self.threshold_high

    def get_deviation(self) -> float:
        """Get deviation from midpoint."""
        midpoint = (self.threshold_low + self.threshold_high) / 2
        return abs(self.value - midpoint)


@dataclass
class DecisionRecord:
    """A record of an autonomous decision."""
    id: str
    decision_type: str
    timestamp: datetime
    actor: str
    reasoning: str
    outcome: str = ""
    success: bool = True
    confidence: float = 1.0
    execution_time_ms: float = 0.0
    resources_used: dict[str, float] = field(default_factory=dict)
    side_effects: list[str] = field(default_factory=list)
    rollback_performed: bool = False
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class AnomalyRecord:
    """A detected anomaly in mesh behavior."""
    id: str
    anomaly_type: str
    detected_at: datetime
    severity: ReflectionSeverity
    description: str
    affected_components: list[str] = field(default_factory=list)
    metrics: dict[str, float] = field(default_factory=dict)
    root_cause: str = ""
    resolution: str = ""
    resolved_at: datetime | None = None
    metadata: dict[str, Any] = field(default_factory=dict)

    def is_resolved(self) -> bool:
        """Check if anomaly is resolved."""
        return self.resolved_at is not None


@dataclass
class ImprovementSuggestion:
    """A suggestion for self-improvement."""
    id: str
    category: ImprovementCategory
    title: str
    description: str
    priority: int = 50
    impact_estimate: str = ""
    effort_estimate: str = ""
    created_at: datetime = field(default_factory=datetime.now)
    status: ReflectionStatus = ReflectionStatus.DRAFT
    acknowledged_at: datetime | None = None
    actioned_at: datetime | None = None
    related_anomalies: list[str] = field(default_factory=list)
    metadata: dict[str, Any] = field(default_factory=dict)

    def acknowledge(self) -> None:
        """Acknowledge the suggestion."""
        self.status = ReflectionStatus.ACKNOWLEDGED
        self.acknowledged_at = datetime.now()

    def action(self) -> None:
        """Mark suggestion as actioned."""
        self.status = ReflectionStatus.ACTIONED
        self.actioned_at = datetime.now()

    def dismiss(self) -> None:
        """Dismiss the suggestion."""
        self.status = ReflectionStatus.DISMISSED


@dataclass
class ReflectionEntry:
    """An entry in the reflection journal."""
    id: str
    reflection_type: ReflectionType
    timestamp: datetime
    title: str
    content: str
    severity: ReflectionSeverity = ReflectionSeverity.INFO
    quality_score: float = 0.0
    status: ReflectionStatus = ReflectionStatus.DRAFT
    related_decisions: list[str] = field(default_factory=list)
    related_anomalies: list[str] = field(default_factory=list)
    related_suggestions: list[str] = field(default_factory=list)
    tags: list[str] = field(default_factory=list)
    created_at: datetime = field(default_factory=datetime.now)
    updated_at: datetime = field(default_factory=datetime.now)
    metadata: dict[str, Any] = field(default_factory=dict)

    def publish(self) -> None:
        """Publish the reflection."""
        self.status = ReflectionStatus.PUBLISHED
        self.updated_at = datetime.now()

    def archive(self) -> None:
        """Archive the reflection."""
        self.status = ReflectionStatus.ARCHIVED
        self.updated_at = datetime.now()


@dataclass
class ReflectionJournal:
    """Journal for recording mesh self-reflections."""
    entries: list[ReflectionEntry] = field(default_factory=list)
    max_entries: int = 10000

    def add_entry(self, entry: ReflectionEntry) -> None:
        """Add an entry to the journal."""
        self.entries.append(entry)
        if len(self.entries) > self.max_entries:
            self.entries = self.entries[-self.max_entries:]

    def get_entries_by_type(self, reflection_type: ReflectionType) -> list[ReflectionEntry]:
        """Get entries by type."""
        return [e for e in self.entries if e.reflection_type == reflection_type]

    def get_entries_by_severity(self, severity: ReflectionSeverity) -> list[ReflectionEntry]:
        """Get entries by severity."""
        return [e for e in self.entries if e.severity == severity]

    def get_recent_entries(self, limit: int = 10) -> list[ReflectionEntry]:
        """Get recent entries."""
        return self.entries[-limit:]

    def search(self, query: str) -> list[ReflectionEntry]:
        """Search entries by content."""
        query_lower = query.lower()
        return [
            e for e in self.entries
            if query_lower in e.title.lower() or query_lower in e.content.lower()
        ]


class BehaviorAnalyzer:
    """Analyzes mesh behavior patterns."""

    def __init__(self):
        self.metrics: dict[str, list[BehaviorMetric]] = defaultdict(list)
        self.decisions: list[DecisionRecord] = []
        self.max_history: int = 10000
        self._baselines: dict[str, tuple[float, float]] = {}

    def record_metric(self, metric: BehaviorMetric) -> None:
        """Record a behavior metric."""
        self.metrics[metric.name].append(metric)
        if len(self.metrics[metric.name]) > self.max_history:
            self.metrics[metric.name] = self.metrics[metric.name][-self.max_history:]

    def record_decision(self, decision: DecisionRecord) -> None:
        """Record a decision."""
        self.decisions.append(decision)
        if len(self.decisions) > self.max_history:
            self.decisions = self.decisions[-self.max_history:]

    def analyze_behavior(self) -> list[dict]:
        """Analyze recorded behavior for patterns."""
        analyses = []

        # Analyze metric trends
        for metric_name, metric_history in self.metrics.items():
            if len(metric_history) >= 5:
                values = [m.value for m in metric_history[-10:]]
                avg = sum(values) / len(values)
                variance = sum((v - avg) ** 2 for v in values) / len(values)
                std_dev = variance ** 0.5 if variance > 0 else 0

                # Detect trends
                if len(values) >= 3:
                    recent_avg = sum(values[-3:]) / 3
                    older_avg = sum(values[:-3]) / (len(values) - 3) if len(values) > 3 else values[0]
                    trend = "increasing" if recent_avg > older_avg else "decreasing" if recent_avg < older_avg else "stable"

                    analyses.append({
                        "type": "metric_trend",
                        "metric": metric_name,
                        "average": avg,
                        "std_dev": std_dev,
                        "trend": trend,
                        "sample_count": len(values)
                    })

        return analyses

    def detect_anomalies(self) -> list[AnomalyRecord]:
        """Detect anomalies in behavior."""
        anomalies = []

        # Check for metric anomalies
        for metric_name, metric_history in self.metrics.items():
                if metric_history:
                    latest = metric_history[-1]
                    if not latest.is_within_bounds():
                        anomaly = AnomalyRecord(
                            id=str(uuid.uuid4())[:8],
                            anomaly_type="metric_out_of_bounds",
                            detected_at=datetime.now(),
                            severity=ReflectionSeverity.HIGH,
                            description=f"Metric {metric_name} out of bounds: {latest.value}",
                            affected_components=[metric_name],
                            metrics={metric_name: latest.value}
                        )
                        anomalies.append(anomaly)

        # Check for decision anomalies
        if self.decisions:
            recent_decisions = self.decisions[-20:]
            failure_rate = sum(1 for d in recent_decisions if not d.success) / len(recent_decisions)
            if failure_rate > 0.3:
                anomaly = AnomalyRecord(
                    id=str(uuid.uuid4())[:8],
                    anomaly_type="high_failure_rate",
                    detected_at=datetime.now(),
                    severity=ReflectionSeverity.CRITICAL,
                    description=f"High decision failure rate: {failure_rate:.1%}",
                    affected_components=["decision_engine"],
                    metrics={"failure_rate": failure_rate}
                )
                anomalies.append(anomaly)

        return anomalies

    def get_decision_quality(self, decision_id: str) -> DecisionQuality:
        """Assess quality of a decision."""
        decision = next((d for d in self.decisions if d.id == decision_id), None)
        if not decision:
            return DecisionQuality.UNKNOWN

        # Score based on multiple factors
        score = 0.0

        # Success contributes to score
        if decision.success:
            score += 0.4

        # High confidence contributes
        score += decision.confidence * 0.2

        # Fast execution contributes
        if decision.execution_time_ms < 1000:
            score += 0.2
        elif decision.execution_time_ms < 5000:
            score += 0.1

        # No side effects contributes
        if not decision.side_effects:
            score += 0.1

        # No rollback contributes
        if not decision.rollback_performed:
            score += 0.1

        # Map score to quality
        if score >= 0.9:
            return DecisionQuality.EXCELLENT
        elif score >= 0.7:
            return DecisionQuality.GOOD
        elif score >= 0.5:
            return DecisionQuality.ADEQUATE
        elif score >= 0.3:
            return DecisionQuality.POOR
        return DecisionQuality.CRITICAL

    def get_overall_quality(self) -> float:
        """Get overall decision quality score."""
        if not self.decisions:
            return 1.0

        scores = []
        for decision in self.decisions[-100:]:
            quality = self.get_decision_quality(decision.id)
            quality_scores = {
                DecisionQuality.EXCELLENT: 1.0,
                DecisionQuality.GOOD: 0.8,
                DecisionQuality.ADEQUATE: 0.6,
                DecisionQuality.POOR: 0.3,
                DecisionQuality.CRITICAL: 0.1,
                DecisionQuality.UNKNOWN: 0.5
            }
            scores.append(quality_scores.get(quality, 0.5))

        return sum(scores) / len(scores) if scores else 1.0

    def set_baseline(self, metric_name: str, low: float, high: float) -> None:
        """Set baseline thresholds for a metric."""
        self._baselines[metric_name] = (low, high)


class ImprovementSuggester:
    """Suggests improvements based on analysis."""

    def __init__(self):
        self.suggestions: list[ImprovementSuggestion] = []
        self.max_suggestions: int = 1000

    def generate_suggestions(self, anomalies: list[AnomalyRecord], behavior_analysis: list[dict]) -> list[ImprovementSuggestion]:
        """Generate improvement suggestions from analysis."""
        suggestions = []

        # Generate suggestions from anomalies
        for anomaly in anomalies:
            if anomaly.anomaly_type == "metric_out_of_bounds":
                suggestion = ImprovementSuggestion(
                    id=str(uuid.uuid4())[:8],
                    category=ImprovementCategory.PERFORMANCE,
                    title=f"Address {anomaly.description}",
                    description=f"Anomaly detected: {anomaly.description}. Consider adjusting thresholds or investigating root cause.",
                    priority=80 if anomaly.severity in (ReflectionSeverity.HIGH, ReflectionSeverity.CRITICAL) else 50,
                    impact_estimate="Improved system stability",
                    effort_estimate="Medium",
                    related_anomalies=[anomaly.id]
                )
                suggestions.append(suggestion)

            elif anomaly.anomaly_type == "high_failure_rate":
                suggestion = ImprovementSuggestion(
                    id=str(uuid.uuid4())[:8],
                    category=ImprovementCategory.RELIABILITY,
                    title="Reduce decision failure rate",
                    description="High decision failure rate detected. Review decision logic and add additional safeguards.",
                    priority=90,
                    impact_estimate="Improved decision success rate",
                    effort_estimate="High",
                    related_anomalies=[anomaly.id]
                )
                suggestions.append(suggestion)

        # Generate suggestions from behavior analysis
        for analysis in behavior_analysis:
            if analysis.get("trend") == "increasing":
                # Check if increase is concerning
                if analysis.get("std_dev", 0) > analysis.get("average", 0) * 0.5:
                    suggestion = ImprovementSuggestion(
                        id=str(uuid.uuid4())[:8],
                        category=ImprovementCategory.MONITORING,
                        title=f"Monitor {analysis['metric']} volatility",
                        description=f"High volatility detected in {analysis['metric']}. Consider enhanced monitoring.",
                        priority=40,
                        impact_estimate="Better visibility into system behavior",
                        effort_estimate="Low"
                    )
                    suggestions.append(suggestion)

        # Store suggestions
        for suggestion in suggestions:
            self.suggestions.append(suggestion)
            if len(self.suggestions) > self.max_suggestions:
                self.suggestions = self.suggestions[-self.max_suggestions:]

        return suggestions

    def get_pending_suggestions(self) -> list[ImprovementSuggestion]:
        """Get pending suggestions."""
        return [
            s for s in self.suggestions
            if s.status in (ReflectionStatus.DRAFT, ReflectionStatus.PUBLISHED)
        ]

    def get_suggestions_by_category(self, category: ImprovementCategory) -> list[ImprovementSuggestion]:
        """Get suggestions by category."""
        return [s for s in self.suggestions if s.category == category]

    def acknowledge_suggestion(self, suggestion_id: str) -> bool:
        """Acknowledge a suggestion."""
        for suggestion in self.suggestions:
            if suggestion.id == suggestion_id:
                suggestion.acknowledge()
                return True
        return False

    def action_suggestion(self, suggestion_id: str) -> bool:
        """Mark suggestion as actioned."""
        for suggestion in self.suggestions:
            if suggestion.id == suggestion_id:
                suggestion.action()
                return True
        return False

    def dismiss_suggestion(self, suggestion_id: str) -> bool:
        """Dismiss a suggestion."""
        for suggestion in self.suggestions:
            if suggestion.id == suggestion_id:
                suggestion.dismiss()
                return True
        return False


class SelfReflection:
    """
    Main class for mesh self-reflection.
    Combines behavior analysis, anomaly detection,
    improvement suggestions, and reflection journal.
    """

    def __init__(self):
        self.behavior_analyzer = BehaviorAnalyzer()
        self.improvement_suggester = ImprovementSuggester()
        self.journal = ReflectionJournal()
        self._last_reflection: datetime = datetime.now()

    def record_metric(self, name: str, value: float, low: float = 0.0, high: float = 100.0) -> None:
        """Record a behavior metric."""
        metric = BehaviorMetric(
            id=str(uuid.uuid4())[:8],
            name=name,
            value=value,
            timestamp=datetime.now(),
            threshold_low=low,
            threshold_high=high
        )
        self.behavior_analyzer.record_metric(metric)

    def record_decision(
        self,
        decision_type: str,
        actor: str,
        reasoning: str,
        success: bool = True,
        confidence: float = 1.0,
        execution_time_ms: float = 0.0
    ) -> DecisionRecord:
        """Record an autonomous decision."""
        decision = DecisionRecord(
            id=str(uuid.uuid4())[:8],
            decision_type=decision_type,
            timestamp=datetime.now(),
            actor=actor,
            reasoning=reasoning,
            success=success,
            confidence=confidence,
            execution_time_ms=execution_time_ms
        )
        self.behavior_analyzer.record_decision(decision)
        return decision

    def reflect(self) -> dict:
        """Perform self-reflection and return reflection results."""
        # Analyze behavior
        behavior_analysis = self.behavior_analyzer.analyze_behavior()

        # Detect anomalies
        anomalies = self.behavior_analyzer.detect_anomalies()

        # Generate suggestions
        suggestions = self.improvement_suggester.generate_suggestions(
            anomalies, behavior_analysis
        )

        # Get overall quality
        quality = self.behavior_analyzer.get_overall_quality()

        # Create reflection entry
        entry = ReflectionEntry(
            id=str(uuid.uuid4())[:8],
            reflection_type=ReflectionType.PERFORMANCE_REVIEW,
            timestamp=datetime.now(),
            title=f"Reflection at {datetime.now().isoformat()}",
            content=f"Analyzed {len(behavior_analysis)} behavior patterns, "
                        f"Detected {len(anomalies)} anomalies. "
                        f"Generated {len(suggestions)} suggestions. "
                        f"Overall quality: {quality:.2f}",
            severity=ReflectionSeverity.INFO if len(anomalies) == 0 else ReflectionSeverity.MEDIUM,
            quality_score=quality
        )
        self.journal.add_entry(entry)

        self._last_reflection = datetime.now()

        return {
            "behavior_analysis": behavior_analysis,
            "anomalies": anomalies,
            "suggestions": suggestions,
            "overall_quality": quality,
            "reflection_id": entry.id
        }

    def get_decision_quality(self, decision_id: str) -> DecisionQuality:
        """Get quality of a specific decision."""
        return self.behavior_analyzer.get_decision_quality(decision_id)

    def get_overall_quality(self) -> float:
        """Get overall system quality score."""
        return self.behavior_analyzer.get_overall_quality()

    def get_recent_anomalies(self, limit: int = 10) -> list[AnomalyRecord]:
        """Get recent anomalies."""
        return self.behavior_analyzer.detect_anomalies()[:limit]

    def get_pending_suggestions(self) -> list[ImprovementSuggestion]:
        """Get pending improvement suggestions."""
        return self.improvement_suggester.get_pending_suggestions()

    def acknowledge_suggestion(self, suggestion_id: str) -> bool:
        """Acknowledge an improvement suggestion."""
        return self.improvement_suggester.acknowledge_suggestion(suggestion_id)

    def action_suggestion(self, suggestion_id: str) -> bool:
        """Mark suggestion as actioned."""
        return self.improvement_suggester.action_suggestion(suggestion_id)

    def dismiss_suggestion(self, suggestion_id: str) -> bool:
        """Dismiss an improvement suggestion."""
        return self.improvement_suggester.dismiss_suggestion(suggestion_id)

    def get_journal_entries(self, limit: int = 10) -> list[ReflectionEntry]:
        """Get recent journal entries."""
        return self.journal.get_recent_entries(limit)

    def search_journal(self, query: str) -> list[ReflectionEntry]:
        """Search journal entries."""
        return self.journal.search(query)

    def add_journal_entry(
        self,
        reflection_type: ReflectionType,
        title: str,
        content: str,
        severity: ReflectionSeverity = ReflectionSeverity.INFO
    ) -> ReflectionEntry:
        """Add a custom journal entry."""
        entry = ReflectionEntry(
            id=str(uuid.uuid4())[:8],
            reflection_type=reflection_type,
            timestamp=datetime.now(),
            title=title,
            content=content,
            severity=severity
        )
        self.journal.add_entry(entry)
        return entry


# Factory functions

def create_behavior_metric(
    name: str,
    value: float,
    threshold_low: float = 0.0,
    threshold_high: float = 100.0
) -> BehaviorMetric:
    """Create a behavior metric."""
    return BehaviorMetric(
        id=str(uuid.uuid4())[:8],
        name=name,
        value=value,
        timestamp=datetime.now(),
        threshold_low=threshold_low,
        threshold_high=threshold_high
    )


def create_decision_record(
    decision_type: str,
    actor: str,
    reasoning: str,
    success: bool = True,
    confidence: float = 1.0
) -> DecisionRecord:
    """Create a decision record."""
    return DecisionRecord(
        id=str(uuid.uuid4())[:8],
        decision_type=decision_type,
        timestamp=datetime.now(),
        actor=actor,
        reasoning=reasoning,
        success=success,
        confidence=confidence
    )


def create_anomaly_record(
    anomaly_type: str,
    severity: ReflectionSeverity,
    description: str,
    affected_components: list[str] | None = None
) -> AnomalyRecord:
    """Create an anomaly record."""
    return AnomalyRecord(
        id=str(uuid.uuid4())[:8],
        anomaly_type=anomaly_type,
        detected_at=datetime.now(),
        severity=severity,
        description=description,
        affected_components=affected_components or []
    )


def create_improvement_suggestion(
    category: ImprovementCategory,
    title: str,
    description: str,
    priority: int = 50
) -> ImprovementSuggestion:
    """Create an improvement suggestion."""
    return ImprovementSuggestion(
        id=str(uuid.uuid4())[:8],
        category=category,
        title=title,
        description=description,
        priority=priority
    )


def create_reflection_entry(
    reflection_type: ReflectionType,
    title: str,
    content: str,
    severity: ReflectionSeverity = ReflectionSeverity.INFO
) -> ReflectionEntry:
    """Create a reflection entry."""
    return ReflectionEntry(
        id=str(uuid.uuid4())[:8],
        reflection_type=reflection_type,
        timestamp=datetime.now(),
        title=title,
        content=content,
        severity=severity
    )


def create_self_reflection() -> SelfReflection:
    """Create a self-reflection instance."""
    return SelfReflection()
