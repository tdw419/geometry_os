"""
Phase 60: Adaptive Learning

Learn from operational patterns to improve decisions.

Provides workload pattern recognition, seasonal behavior learning,
cost optimization learning, and failure pattern memory.
"""

import math
import uuid
from collections import defaultdict
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Any


class PatternType(Enum):
    """Type of operational pattern."""
    WORKLOAD = "workload"
    SEASONAL = "seasonal"
    COST = "cost"
    FAILURE = "failure"
    PERFORMANCE = "performance"


class SeasonalityType(Enum):
    """Type of seasonal pattern."""
    HOURLY = "hourly"
    DAILY = "daily"
    WEEKLY = "weekly"
    MONTHLY = "monthly"


class PatternConfidence(Enum):
    """Confidence level for detected patterns."""
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    VERY_HIGH = "very_high"


class LearningStatus(Enum):
    """Status of learning process."""
    COLLECTING = "collecting"
    ANALYZING = "analyzing"
    LEARNED = "learned"
    INVALIDATED = "invalidated"


class FailureCategory(Enum):
    """Category of failure pattern."""
    RESOURCE_EXHAUSTION = "resource_exhaustion"
    NETWORK_ISSUE = "network_issue"
    DEPENDENCY_FAILURE = "dependency_failure"
    CONFIGURATION_ERROR = "configuration_error"
    TIMEOUT = "timeout"
    OVERLOAD = "overload"


@dataclass
class TimeWindow:
    """A time window for pattern analysis."""
    start: datetime
    end: datetime

    @property
    def duration_seconds(self) -> float:
        return (self.end - self.start).total_seconds()

    def contains(self, timestamp: datetime) -> bool:
        return self.start <= timestamp <= self.end


@dataclass
class DataPoint:
    """A single data point for pattern analysis."""
    timestamp: datetime
    value: float
    labels: dict[str, str] = field(default_factory=dict)


@dataclass
class PatternSignature:
    """Unique signature identifying a pattern."""
    pattern_type: PatternType
    key_features: dict[str, Any]
    hash_value: str = ""

    def __post_init__(self):
        if not self.hash_value:
            feature_str = str(sorted(self.key_features.items()))
            self.hash_value = f"{self.pattern_type.value}:{hash(feature_str)}"


@dataclass
class DetectedPattern:
    """A detected operational pattern."""
    id: str
    signature: PatternSignature
    pattern_type: PatternType
    confidence: PatternConfidence
    first_seen: datetime
    last_seen: datetime
    occurrence_count: int = 1
    sample_values: list[float] = field(default_factory=list)
    metadata: dict[str, Any] = field(default_factory=dict)

    @property
    def average_value(self) -> float:
        if not self.sample_values:
            return 0.0
        return sum(self.sample_values) / len(self.sample_values)

    @property
    def std_deviation(self) -> float:
        if len(self.sample_values) < 2:
            return 0.0
        mean = self.average_value
        variance = sum((x - mean) ** 2 for x in self.sample_values) / len(self.sample_values)
        return math.sqrt(variance)


@dataclass
class WorkloadPattern(DetectedPattern):
    """Pattern related to workload behavior."""
    peak_hours: list[int] = field(default_factory=list)
    low_hours: list[int] = field(default_factory=list)
    average_load: float = 0.0
    load_variance: float = 0.0
    typical_containers: int = 0
    resource_profile: dict[str, float] = field(default_factory=dict)


@dataclass
class SeasonalPattern(DetectedPattern):
    """Pattern with seasonal recurrence."""
    seasonality_type: SeasonalityType = SeasonalityType.DAILY
    period_seconds: float = 86400.0  # Default: 1 day
    peak_times: list[datetime] = field(default_factory=list)
    trough_times: list[datetime] = field(default_factory=list)
    amplitude: float = 0.0
    phase_offset: float = 0.0


@dataclass
class CostPattern(DetectedPattern):
    """Pattern related to cost behavior."""
    average_cost: float = 0.0
    peak_cost: float = 0.0
    cost_drivers: dict[str, float] = field(default_factory=dict)  # driver -> cost
    optimization_potential: float = 0.0
    recommended_actions: list[str] = field(default_factory=list)


@dataclass
class FailurePattern(DetectedPattern):
    """Pattern related to failures."""
    failure_category: FailureCategory = FailureCategory.RESOURCE_EXHAUSTION
    precursors: list[str] = field(default_factory=list)  # Warning signs
    affected_components: list[str] = field(default_factory=list)
    recovery_time_seconds: float = 0.0
    impact_severity: str = "medium"
    mitigation_strategies: list[str] = field(default_factory=list)


@dataclass
class LearningSession:
    """A learning session tracking progress."""
    id: str
    pattern_type: PatternType
    status: LearningStatus
    started_at: datetime
    ended_at: datetime | None = None
    data_points_collected: int = 0
    patterns_discovered: int = 0
    patterns_validated: int = 0
    errors: list[str] = field(default_factory=list)


@dataclass
class PatternRecognizer:
    """Recognizes patterns in operational data."""
    name: str
    pattern_type: PatternType
    min_samples: int = 10
    confidence_threshold: float = 0.7
    patterns: dict[str, DetectedPattern] = field(default_factory=dict)
    data_buffer: list[DataPoint] = field(default_factory=list)
    max_buffer_size: int = 10000

    def add_data_point(self, point: DataPoint) -> None:
        """Add a data point for analysis."""
        self.data_buffer.append(point)
        if len(self.data_buffer) > self.max_buffer_size:
            self.data_buffer = self.data_buffer[-self.max_buffer_size:]

    def detect_patterns(self) -> list[DetectedPattern]:
        """Detect patterns in collected data."""
        if len(self.data_buffer) < self.min_samples:
            return []

        detected = []
        values = [p.value for p in self.data_buffer]
        timestamps = [p.timestamp for p in self.data_buffer]

        # Basic pattern detection
        mean = sum(values) / len(values)
        std = self._std_dev(values)

        # Detect peaks and troughs
        peaks, troughs = self._find_peaks_and_troughs(values)

        # Create pattern signature
        signature = PatternSignature(
            pattern_type=self.pattern_type,
            key_features={
                "mean": round(mean, 2),
                "std": round(std, 2),
                "peak_count": len(peaks),
                "trough_count": len(troughs)
            }
        )

        # Check if pattern already exists
        existing = self.patterns.get(signature.hash_value)

        if existing:
            existing.last_seen = datetime.now()
            existing.occurrence_count += 1
            existing.sample_values.extend(values[-100:])  # Keep recent samples
            detected.append(existing)
        else:
            # Create new pattern
            confidence = self._calculate_confidence(len(values), std, mean)
            pattern = DetectedPattern(
                id=str(uuid.uuid4())[:8],
                signature=signature,
                pattern_type=self.pattern_type,
                confidence=confidence,
                first_seen=min(timestamps),
                last_seen=datetime.now(),
                sample_values=values[-100:],
                metadata={"peaks": peaks[:10], "troughs": troughs[:10]}
            )
            self.patterns[signature.hash_value] = pattern
            detected.append(pattern)

        return detected

    def _std_dev(self, values: list[float]) -> float:
        if len(values) < 2:
            return 0.0
        mean = sum(values) / len(values)
        variance = sum((x - mean) ** 2 for x in values) / len(values)
        return math.sqrt(variance)

    def _find_peaks_and_troughs(self, values: list[float]) -> tuple[list[int], list[int]]:
        """Find local maxima and minima."""
        peaks = []
        troughs = []

        for i in range(1, len(values) - 1):
            if values[i] > values[i-1] and values[i] > values[i+1]:
                peaks.append(i)
            elif values[i] < values[i-1] and values[i] < values[i+1]:
                troughs.append(i)

        return peaks, troughs

    def _calculate_confidence(self, sample_count: int, std: float, mean: float) -> PatternConfidence:
        """Calculate confidence based on sample count and consistency."""
        if mean == 0:
            cv = 0
        else:
            cv = std / abs(mean)  # Coefficient of variation

        # More samples and lower variance = higher confidence
        if sample_count >= 100 and cv < 0.1:
            return PatternConfidence.VERY_HIGH
        elif sample_count >= 50 and cv < 0.2:
            return PatternConfidence.HIGH
        elif sample_count >= 20 and cv < 0.3:
            return PatternConfidence.MEDIUM
        else:
            return PatternConfidence.LOW

    def clear_buffer(self) -> None:
        """Clear the data buffer."""
        self.data_buffer = []


@dataclass
class SeasonalAnalyzer:
    """Analyzes seasonal patterns in time series data."""
    name: str
    seasonality_types: list[SeasonalityType] = field(default_factory=lambda: [
        SeasonalityType.HOURLY,
        SeasonalityType.DAILY,
        SeasonalityType.WEEKLY
    ])
    patterns: dict[str, SeasonalPattern] = field(default_factory=dict)
    data_by_hour: dict[int, list[float]] = field(default_factory=lambda: defaultdict(list))
    data_by_day: dict[int, list[float]] = field(default_factory=lambda: defaultdict(list))
    data_by_weekday: dict[int, list[float]] = field(default_factory=lambda: defaultdict(list))

    def add_observation(self, timestamp: datetime, value: float) -> None:
        """Add an observation for seasonal analysis."""
        self.data_by_hour[timestamp.hour].append(value)
        self.data_by_day[timestamp.day].append(value)
        self.data_by_weekday[timestamp.weekday()].append(value)

    def analyze(self) -> list[SeasonalPattern]:
        """Analyze data for seasonal patterns."""
        patterns = []

        # Analyze hourly patterns
        hourly_pattern = self._analyze_hourly()
        if hourly_pattern:
            patterns.append(hourly_pattern)

        # Analyze weekly patterns
        weekly_pattern = self._analyze_weekly()
        if weekly_pattern:
            patterns.append(weekly_pattern)

        return patterns

    def _analyze_hourly(self) -> SeasonalPattern | None:
        """Analyze hourly patterns."""
        if len(self.data_by_hour) < 12:  # Need at least 12 hours of data
            return None

        hourly_means = {h: sum(v) / len(v) for h, v in self.data_by_hour.items() if v}

        if not hourly_means:
            return None

        # Find peak and trough hours
        sorted_hours = sorted(hourly_means.items(), key=lambda x: x[1])
        trough_hours = [h for h, _ in sorted_hours[:3]]
        peak_hours = [h for h, _ in sorted_hours[-3:]]

        overall_mean = sum(hourly_means.values()) / len(hourly_means)
        amplitude = max(hourly_means.values()) - min(hourly_means.values())

        if amplitude < overall_mean * 0.1:  # Less than 10% variation
            return None

        signature = PatternSignature(
            pattern_type=PatternType.SEASONAL,
            key_features={"type": "hourly", "peak_hours": peak_hours}
        )

        pattern = SeasonalPattern(
            id=str(uuid.uuid4())[:8],
            signature=signature,
            pattern_type=PatternType.SEASONAL,
            confidence=PatternConfidence.HIGH if amplitude > overall_mean * 0.3 else PatternConfidence.MEDIUM,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            seasonality_type=SeasonalityType.HOURLY,
            period_seconds=3600,
            amplitude=amplitude,
            metadata={"peak_hours": peak_hours, "trough_hours": trough_hours}
        )

        self.patterns[pattern.id] = pattern
        return pattern

    def _analyze_weekly(self) -> SeasonalPattern | None:
        """Analyze weekly patterns."""
        if len(self.data_by_weekday) < 5:  # Need at least 5 days of data
            return None

        weekday_means = {d: sum(v) / len(v) for d, v in self.data_by_weekday.items() if v}

        if not weekday_means:
            return None

        # Check for weekday vs weekend pattern
        weekday_avg = sum(weekday_means.get(d, 0) for d in range(5)) / 5
        weekend_avg = sum(weekday_means.get(d, 0) for d in range(5, 7)) / 2

        if weekday_avg == 0:
            return None

        diff_pct = abs(weekend_avg - weekday_avg) / weekday_avg

        if diff_pct < 0.15:  # Less than 15% difference
            return None

        signature = PatternSignature(
            pattern_type=PatternType.SEASONAL,
            key_features={"type": "weekly", "weekday_avg": round(weekday_avg, 2)}
        )

        pattern = SeasonalPattern(
            id=str(uuid.uuid4())[:8],
            signature=signature,
            pattern_type=PatternType.SEASONAL,
            confidence=PatternConfidence.HIGH if diff_pct > 0.3 else PatternConfidence.MEDIUM,
            first_seen=datetime.now(),
            last_seen=datetime.now(),
            seasonality_type=SeasonalityType.WEEKLY,
            period_seconds=604800,  # 7 days
            amplitude=abs(weekend_avg - weekday_avg),
            metadata={
                "weekday_avg": weekday_avg,
                "weekend_avg": weekend_avg,
                "is_weekend_heavier": weekend_avg > weekday_avg
            }
        )

        self.patterns[pattern.id] = pattern
        return pattern


@dataclass
class CostOptimizer:
    """Learns cost optimization patterns."""
    name: str
    cost_history: list[tuple[datetime, float, dict[str, float]]] = field(default_factory=list)
    patterns: dict[str, CostPattern] = field(default_factory=dict)
    optimization_rules: list[dict[str, Any]] = field(default_factory=list)

    def record_cost(
        self,
        timestamp: datetime,
        total_cost: float,
        cost_breakdown: dict[str, float]
    ) -> None:
        """Record a cost observation."""
        self.cost_history.append((timestamp, total_cost, cost_breakdown))

        # Keep last 90 days
        cutoff = datetime.now() - timedelta(days=90)
        self.cost_history = [
            (t, c, b) for t, c, b in self.cost_history
            if t > cutoff
        ]

    def analyze(self) -> list[CostPattern]:
        """Analyze cost patterns and find optimization opportunities."""
        if len(self.cost_history) < 10:
            return []

        patterns = []

        # Calculate average and peak costs
        costs = [c for _, c, _ in self.cost_history]
        avg_cost = sum(costs) / len(costs)
        peak_cost = max(costs)

        # Find cost drivers
        cost_drivers: dict[str, list[float]] = defaultdict(list)
        for _, _, breakdown in self.cost_history:
            for driver, cost in breakdown.items():
                cost_drivers[driver].append(cost)

        driver_averages = {
            d: sum(v) / len(v)
            for d, v in cost_drivers.items()
        }

        # Sort by cost
        sorted_drivers = sorted(
            driver_averages.items(),
            key=lambda x: x[1],
            reverse=True
        )

        # Generate optimization recommendations
        recommendations = []
        potential_savings = 0.0

        for driver, avg in sorted_drivers[:3]:
            if "compute" in driver.lower() and avg > avg_cost * 0.3:
                recommendations.append(f"Consider reserved instances for {driver}")
                potential_savings += avg * 0.3
            elif "storage" in driver.lower() and avg > avg_cost * 0.2:
                recommendations.append(f"Review storage tiering for {driver}")
                potential_savings += avg * 0.2
            elif "network" in driver.lower() and avg > avg_cost * 0.15:
                recommendations.append(f"Optimize data transfer for {driver}")
                potential_savings += avg * 0.15

        signature = PatternSignature(
            pattern_type=PatternType.COST,
            key_features={
                "avg_cost": round(avg_cost, 2),
                "top_driver": sorted_drivers[0][0] if sorted_drivers else "unknown"
            }
        )

        pattern = CostPattern(
            id=str(uuid.uuid4())[:8],
            signature=signature,
            pattern_type=PatternType.COST,
            confidence=PatternConfidence.HIGH if len(self.cost_history) > 30 else PatternConfidence.MEDIUM,
            first_seen=self.cost_history[0][0],
            last_seen=datetime.now(),
            average_cost=avg_cost,
            peak_cost=peak_cost,
            cost_drivers=driver_averages,
            optimization_potential=potential_savings,
            recommended_actions=recommendations
        )

        self.patterns[pattern.id] = pattern
        patterns.append(pattern)

        return patterns

    def get_optimization_rules(self) -> list[dict[str, Any]]:
        """Get learned optimization rules."""
        rules = []

        for pattern in self.patterns.values():
            if pattern.optimization_potential > pattern.average_cost * 0.1:
                rules.append({
                    "pattern_id": pattern.id,
                    "potential_savings": pattern.optimization_potential,
                    "actions": pattern.recommended_actions,
                    "confidence": pattern.confidence.value
                })

        return rules


@dataclass
class FailurePatternMemory:
    """Remembers failure patterns for prediction and prevention."""
    name: str
    failure_history: list[tuple[datetime, FailureCategory, dict[str, Any]]] = field(default_factory=list)
    patterns: dict[str, FailurePattern] = field(default_factory=dict)
    precursor_signals: dict[FailureCategory, list[str]] = field(default_factory=lambda: defaultdict(list))

    def record_failure(
        self,
        timestamp: datetime,
        category: FailureCategory,
        details: dict[str, Any]
    ) -> None:
        """Record a failure event."""
        self.failure_history.append((timestamp, category, details))

        # Keep last 180 days
        cutoff = datetime.now() - timedelta(days=180)
        self.failure_history = [
            (t, c, d) for t, c, d in self.failure_history
            if t > cutoff
        ]

        # Extract precursor signals
        if "precursors" in details:
            for precursor in details["precursors"]:
                if precursor not in self.precursor_signals[category]:
                    self.precursor_signals[category].append(precursor)

    def analyze(self) -> list[FailurePattern]:
        """Analyze failure patterns."""
        if len(self.failure_history) < 5:
            return []

        patterns = []

        # Group failures by category
        by_category: dict[FailureCategory, list[tuple[datetime, dict[str, Any]]]] = defaultdict(list)
        for timestamp, category, details in self.failure_history:
            by_category[category].append((timestamp, details))

        for category, failures in by_category.items():
            if len(failures) < 3:
                continue

            # Calculate statistics
            recovery_times = [
                d.get("recovery_time_seconds", 0)
                for _, d in failures
                if d.get("recovery_time_seconds")
            ]
            avg_recovery = sum(recovery_times) / len(recovery_times) if recovery_times else 0

            # Find common affected components
            all_components: list[str] = []
            for _, d in failures:
                all_components.extend(d.get("affected_components", []))

            component_counts: dict[str, int] = defaultdict(int)
            for comp in all_components:
                component_counts[comp] += 1

            common_components = [
                c for c, count in component_counts.items()
                if count >= len(failures) * 0.5
            ]

            # Get known precursors
            precursors = self.precursor_signals.get(category, [])

            # Determine severity
            severity = "low"
            if len(failures) > 10 or avg_recovery > 300:
                severity = "high"
            elif len(failures) > 5 or avg_recovery > 60:
                severity = "medium"

            # Generate mitigation strategies
            mitigations = self._generate_mitigations(category, failures)

            signature = PatternSignature(
                pattern_type=PatternType.FAILURE,
                key_features={
                    "category": category.value,
                    "count": len(failures)
                }
            )

            pattern = FailurePattern(
                id=str(uuid.uuid4())[:8],
                signature=signature,
                pattern_type=PatternType.FAILURE,
                confidence=PatternConfidence.HIGH if len(failures) > 10 else PatternConfidence.MEDIUM,
                first_seen=failures[0][0],
                last_seen=datetime.now(),
                occurrence_count=len(failures),
                failure_category=category,
                precursors=precursors,
                affected_components=common_components,
                recovery_time_seconds=avg_recovery,
                impact_severity=severity,
                mitigation_strategies=mitigations
            )

            self.patterns[pattern.id] = pattern
            patterns.append(pattern)

        return patterns

    def _generate_mitigations(
        self,
        category: FailureCategory,
        failures: list[tuple[datetime, dict[str, Any]]]
    ) -> list[str]:
        """Generate mitigation strategies based on failure patterns."""
        mitigations = []

        if category == FailureCategory.RESOURCE_EXHAUSTION:
            mitigations = [
                "Implement proactive scaling based on resource trends",
                "Set up resource quotas and alerts at 80% utilization",
                "Consider horizontal scaling for stateless services"
            ]
        elif category == FailureCategory.NETWORK_ISSUE:
            mitigations = [
                "Implement circuit breakers for external calls",
                "Add retry logic with exponential backoff",
                "Use connection pooling with health checks"
            ]
        elif category == FailureCategory.DEPENDENCY_FAILURE:
            mitigations = [
                "Add fallback mechanisms for critical dependencies",
                "Implement timeout and retry policies",
                "Consider caching for frequently accessed data"
            ]
        elif category == FailureCategory.TIMEOUT:
            mitigations = [
                "Review and adjust timeout thresholds",
                "Implement async processing for long operations",
                "Add progress tracking for long-running requests"
            ]
        elif category == FailureCategory.OVERLOAD:
            mitigations = [
                "Implement request throttling and rate limiting",
                "Add load shedding for non-critical requests",
                "Use queue-based processing for burst handling"
            ]
        else:
            mitigations = [
                "Monitor for early warning signs",
                "Implement graceful degradation",
                "Review and update runbooks"
            ]

        return mitigations

    def check_precursors(self, current_metrics: dict[str, float]) -> list[FailureCategory]:
        """Check if current metrics match known failure precursors."""
        warnings = []

        for category, precursors in self.precursor_signals.items():
            for precursor in precursors:
                # Simple matching - could be enhanced with ML
                if precursor in current_metrics:
                    value = current_metrics[precursor]
                    # Check if value is concerning
                    if "cpu" in precursor and value > 80 or "memory" in precursor and value > 85 or "latency" in precursor and value > 1000 or "error" in precursor and value > 5:
                        warnings.append(category)

        return list(set(warnings))  # Deduplicate


class AdaptiveLearner:
    """
    Main adaptive learning system combining all pattern recognizers.
    """

    def __init__(self):
        self.workload_recognizer = PatternRecognizer(
            name="workload",
            pattern_type=PatternType.WORKLOAD
        )
        self.seasonal_analyzer = SeasonalAnalyzer(name="seasonal")
        self.cost_optimizer = CostOptimizer(name="cost")
        self.failure_memory = FailurePatternMemory(name="failures")

        self.sessions: dict[str, LearningSession] = {}
        self.all_patterns: dict[str, DetectedPattern] = {}

    def start_learning_session(self, pattern_type: PatternType) -> LearningSession:
        """Start a new learning session."""
        session = LearningSession(
            id=str(uuid.uuid4())[:8],
            pattern_type=pattern_type,
            status=LearningStatus.COLLECTING,
            started_at=datetime.now()
        )
        self.sessions[session.id] = session
        return session

    def record_workload_observation(
        self,
        timestamp: datetime,
        value: float,
        labels: dict[str, str] | None = None
    ) -> None:
        """Record a workload observation."""
        point = DataPoint(
            timestamp=timestamp,
            value=value,
            labels=labels or {}
        )
        self.workload_recognizer.add_data_point(point)
        self.seasonal_analyzer.add_observation(timestamp, value)

    def record_cost_observation(
        self,
        timestamp: datetime,
        total_cost: float,
        cost_breakdown: dict[str, float]
    ) -> None:
        """Record a cost observation."""
        self.cost_optimizer.record_cost(timestamp, total_cost, cost_breakdown)

    def record_failure(
        self,
        timestamp: datetime,
        category: FailureCategory,
        details: dict[str, Any]
    ) -> None:
        """Record a failure event."""
        self.failure_memory.record_failure(timestamp, category, details)

    def analyze_all(self) -> dict[PatternType, list[DetectedPattern]]:
        """Run all pattern analyzers."""
        results: dict[PatternType, list[DetectedPattern]] = {}

        # Workload patterns
        workload_patterns = self.workload_recognizer.detect_patterns()
        if workload_patterns:
            results[PatternType.WORKLOAD] = workload_patterns
            for p in workload_patterns:
                self.all_patterns[p.id] = p

        # Seasonal patterns
        seasonal_patterns = self.seasonal_analyzer.analyze()
        if seasonal_patterns:
            results[PatternType.SEASONAL] = seasonal_patterns
            for p in seasonal_patterns:
                self.all_patterns[p.id] = p

        # Cost patterns
        cost_patterns = self.cost_optimizer.analyze()
        if cost_patterns:
            results[PatternType.COST] = cost_patterns
            for p in cost_patterns:
                self.all_patterns[p.id] = p

        # Failure patterns
        failure_patterns = self.failure_memory.analyze()
        if failure_patterns:
            results[PatternType.FAILURE] = failure_patterns
            for p in failure_patterns:
                self.all_patterns[p.id] = p

        return results

    def get_pattern(self, pattern_id: str) -> DetectedPattern | None:
        """Get a specific pattern by ID."""
        return self.all_patterns.get(pattern_id)

    def get_patterns_by_type(self, pattern_type: PatternType) -> list[DetectedPattern]:
        """Get all patterns of a specific type."""
        return [p for p in self.all_patterns.values() if p.pattern_type == pattern_type]

    def get_high_confidence_patterns(self) -> list[DetectedPattern]:
        """Get all patterns with high or very high confidence."""
        return [
            p for p in self.all_patterns.values()
            if p.confidence in (PatternConfidence.HIGH, PatternConfidence.VERY_HIGH)
        ]

    def predict_workload(self, at_time: datetime) -> float | None:
        """Predict workload at a specific time based on learned patterns."""
        seasonal = self.seasonal_analyzer.patterns

        if not seasonal:
            return None

        # Find applicable seasonal pattern
        for pattern in seasonal.values():
            if pattern.seasonality_type == SeasonalityType.HOURLY:
                hour = at_time.hour
                hour_data = self.seasonal_analyzer.data_by_hour.get(hour, [])
                if hour_data:
                    return sum(hour_data) / len(hour_data)
            elif pattern.seasonality_type == SeasonalityType.WEEKLY:
                weekday = at_time.weekday()
                weekday_data = self.seasonal_analyzer.data_by_weekday.get(weekday, [])
                if weekday_data:
                    return sum(weekday_data) / len(weekday_data)

        return None

    def check_failure_warnings(
        self,
        current_metrics: dict[str, float]
    ) -> list[tuple[FailureCategory, list[str]]]:
        """Check for potential failures based on learned patterns."""
        warnings = self.failure_memory.check_precursors(current_metrics)
        result = []

        for category in warnings:
            precursors = self.failure_memory.precursor_signals.get(category, [])
            result.append((category, precursors))

        return result

    def get_cost_recommendations(self) -> list[dict[str, Any]]:
        """Get cost optimization recommendations."""
        return self.cost_optimizer.get_optimization_rules()

    def get_failure_mitigations(
        self,
        category: FailureCategory
    ) -> list[str]:
        """Get mitigation strategies for a failure category."""
        for pattern in self.failure_memory.patterns.values():
            if isinstance(pattern, FailurePattern) and pattern.failure_category == category:
                return pattern.mitigation_strategies
        return []

    def end_learning_session(self, session_id: str) -> None:
        """End a learning session."""
        session = self.sessions.get(session_id)
        if session:
            session.status = LearningStatus.LEARNED
            session.ended_at = datetime.now()


# Factory functions

def create_pattern_recognizer(
    name: str,
    pattern_type: PatternType,
    min_samples: int = 10
) -> PatternRecognizer:
    """Create a pattern recognizer."""
    return PatternRecognizer(
        name=name,
        pattern_type=pattern_type,
        min_samples=min_samples
    )


def create_seasonal_analyzer(
    name: str,
    seasonality_types: list[SeasonalityType] | None = None
) -> SeasonalAnalyzer:
    """Create a seasonal analyzer."""
    return SeasonalAnalyzer(
        name=name,
        seasonality_types=seasonality_types or [
            SeasonalityType.HOURLY,
            SeasonalityType.DAILY,
            SeasonalityType.WEEKLY
        ]
    )


def create_cost_optimizer(name: str = "cost") -> CostOptimizer:
    """Create a cost optimizer."""
    return CostOptimizer(name=name)


def create_failure_memory(name: str = "failures") -> FailurePatternMemory:
    """Create a failure pattern memory."""
    return FailurePatternMemory(name=name)


def create_adaptive_learner() -> AdaptiveLearner:
    """Create an adaptive learner instance."""
    return AdaptiveLearner()
