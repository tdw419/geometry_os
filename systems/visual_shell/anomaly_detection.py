"""
Anomaly Detection - Phase 53

Intelligent anomaly detection using statistical and ML-based approaches.
"""

import math
import time
from collections import deque
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class AnomalyType(Enum):
    """Types of anomalies."""
    SPIKE = "spike"                    # Sudden increase
    DROP = "drop"                      # Sudden decrease
    TREND_CHANGE = "trend_change"      # Direction change
    LEVEL_SHIFT = "level_shift"        # Baseline change
    SEASONALITY_BREAK = "seasonality"  # Pattern violation
    OUTLIER = "outlier"                # Statistical outlier
    CORRELATION_BREAK = "correlation"  # Expected correlation lost


class AnomalySeverity(Enum):
    """Severity levels for anomalies."""
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"


class DetectionMethod(Enum):
    """Anomaly detection methods."""
    Z_SCORE = "z_score"
    IQR = "iqr"
    MOVING_AVERAGE = "moving_average"
    EXPONENTIAL_SMOOTHING = "exponential_smoothing"
    SEASONAL_DECOMPOSITION = "seasonal"
    ISOLATION_FOREST = "isolation_forest"
    AUTOENCODER = "autoencoder"


@dataclass
class DataPoint:
    """A single data point for anomaly detection."""
    timestamp: float
    value: float
    labels: dict[str, str] = field(default_factory=dict)

    def __lt__(self, other: "DataPoint") -> bool:
        return self.timestamp < other.timestamp


@dataclass
class Anomaly:
    """Detected anomaly."""
    anomaly_id: str
    timestamp: float
    anomaly_type: AnomalyType
    severity: AnomalySeverity
    metric_name: str
    actual_value: float
    expected_value: float
    deviation: float
    confidence: float
    context: dict[str, Any] = field(default_factory=dict)
    detection_method: DetectionMethod = DetectionMethod.Z_SCORE
    resolved: bool = False
    resolved_at: float | None = None


@dataclass
class DetectionConfig:
    """Configuration for anomaly detection."""
    window_size: int = 100
    min_samples: int = 10
    z_score_threshold: float = 3.0
    iqr_multiplier: float = 1.5
    smoothing_alpha: float = 0.3
    seasonal_period: int = 24
    enable_auto_threshold: bool = True
    sensitivity: float = 0.8  # 0.0 to 1.0


class StatisticalDetector:
    """Statistical methods for anomaly detection."""

    def __init__(self, config: DetectionConfig):
        self._config = config
        self._data: deque = deque(maxlen=config.window_size)

    def add_point(self, point: DataPoint) -> None:
        """Add a data point."""
        self._data.append(point)

    def detect_z_score(self, value: float) -> tuple[bool, float, float]:
        """Detect anomaly using Z-score method."""
        if len(self._data) < self._config.min_samples:
            return False, 0.0, 0.0

        values = [p.value for p in self._data]
        mean = sum(values) / len(values)
        variance = sum((v - mean) ** 2 for v in values) / len(values)
        std_dev = math.sqrt(variance) if variance > 0 else 1e-10

        z_score = (value - mean) / std_dev
        is_anomaly = abs(z_score) > self._config.z_score_threshold

        return is_anomaly, z_score, mean

    def detect_iqr(self, value: float) -> tuple[bool, float, float]:
        """Detect anomaly using IQR method."""
        if len(self._data) < self._config.min_samples:
            return False, 0.0, 0.0

        values = sorted([p.value for p in self._data])
        n = len(values)
        q1_idx = n // 4
        q3_idx = (3 * n) // 4

        q1 = values[q1_idx]
        q3 = values[q3_idx]
        iqr = q3 - q1

        lower_bound = q1 - self._config.iqr_multiplier * iqr
        upper_bound = q3 + self._config.iqr_multiplier * iqr

        expected = (q1 + q3) / 2

        if value < lower_bound:
            if iqr > 0:
                deviation = (lower_bound - value) / iqr
            else:
                # When IQR is 0, use distance from expected as deviation proxy
                deviation = abs(expected - value) / max(abs(expected), 1.0) * 10
            return True, deviation, expected
        elif value > upper_bound:
            if iqr > 0:
                deviation = (value - upper_bound) / iqr
            else:
                # When IQR is 0, use distance from expected as deviation proxy
                deviation = abs(value - expected) / max(abs(expected), 1.0) * 10
            return True, deviation, expected

        return False, 0.0, expected

    def get_statistics(self) -> dict[str, float]:
        """Get current statistics."""
        if len(self._data) < 2:
            return {"count": len(self._data)}

        values = [p.value for p in self._data]
        mean = sum(values) / len(values)
        variance = sum((v - mean) ** 2 for v in values) / len(values)
        std_dev = math.sqrt(variance)

        return {
            "count": len(values),
            "mean": mean,
            "std_dev": std_dev,
            "min": min(values),
            "max": max(values),
        }


class TrendDetector:
    """Detect trend changes in time series."""

    def __init__(self, config: DetectionConfig):
        self._config = config
        self._data: deque = deque(maxlen=config.window_size)
        self._ema: float | None = None
        self._trend: float = 0.0

    def add_point(self, point: DataPoint) -> None:
        """Add a data point and update EMA."""
        self._data.append(point)

        if self._ema is None:
            self._ema = point.value
        else:
            old_ema = self._ema
            self._ema = (self._config.smoothing_alpha * point.value +
                        (1 - self._config.smoothing_alpha) * self._ema)
            self._trend = self._ema - old_ema

    def detect_trend_change(self, value: float) -> tuple[bool, float, str]:
        """Detect if trend has changed direction."""
        if len(self._data) < self._config.min_samples:
            return False, 0.0, "insufficient_data"

        if self._ema is None:
            return False, 0.0, "no_baseline"

        # Calculate recent trend
        recent = list(self._data)[-10:]
        if len(recent) < 5:
            return False, 0.0, "insufficient_recent"

        recent_trend = (recent[-1].value - recent[0].value) / len(recent)

        # Check for trend reversal
        if abs(self._trend) > 0.01:  # Had a trend
            if self._trend > 0 and recent_trend < -0.01:
                return True, abs(self._trend - recent_trend), "reversal_down"
            elif self._trend < 0 and recent_trend > 0.01:
                return True, abs(self._trend - recent_trend), "reversal_up"

        return False, 0.0, "stable"

    def detect_level_shift(self, value: float) -> tuple[bool, float, float]:
        """Detect if baseline has shifted."""
        if len(self._data) < self._config.min_samples * 2:
            return False, 0.0, 0.0

        data = list(self._data)
        mid = len(data) // 2

        first_half = [p.value for p in data[:mid]]
        second_half = [p.value for p in data[mid:]]

        mean1 = sum(first_half) / len(first_half)
        mean2 = sum(second_half) / len(second_half)

        # Calculate pooled standard deviation
        var1 = sum((v - mean1) ** 2 for v in first_half) / len(first_half)
        var2 = sum((v - mean2) ** 2 for v in second_half) / len(second_half)
        pooled_std = math.sqrt((var1 + var2) / 2)

        if pooled_std < 1e-10:
            return False, 0.0, mean1

        # T-test like statistic
        shift = abs(mean2 - mean1) / pooled_std

        if shift > 2.0:  # Significant shift
            return True, shift, mean1

        return False, 0.0, mean1

    def get_trend(self) -> float:
        """Get current trend direction."""
        return self._trend


class SeasonalDetector:
    """Detect seasonality pattern breaks."""

    def __init__(self, config: DetectionConfig):
        self._config = config
        self._data: deque = deque(maxlen=config.window_size)
        self._seasonal_pattern: dict[int, list[float]] = {}
        self._period = config.seasonal_period

    def add_point(self, point: DataPoint) -> None:
        """Add a data point."""
        self._data.append(point)

        # Build seasonal pattern
        position = len(self._data) % self._period
        if position not in self._seasonal_pattern:
            self._seasonal_pattern[position] = []
        self._seasonal_pattern[position].append(point.value)

    def detect_seasonal_break(self, value: float) -> tuple[bool, float, float]:
        """Detect if value breaks seasonal pattern."""
        if len(self._data) < self._period * 2:
            return False, 0.0, 0.0

        position = len(self._data) % self._period

        if position not in self._seasonal_pattern:
            return False, 0.0, 0.0

        historical = self._seasonal_pattern[position]
        if len(historical) < 2:
            return False, 0.0, 0.0

        mean = sum(historical) / len(historical)
        variance = sum((v - mean) ** 2 for v in historical) / len(historical)
        std_dev = math.sqrt(variance) if variance > 0 else 1e-10

        deviation = abs(value - mean) / std_dev

        if deviation > self._config.z_score_threshold:
            return True, deviation, mean

        return False, 0.0, mean

    def get_seasonal_stats(self) -> dict[int, dict[str, float]]:
        """Get statistics for each seasonal position."""
        stats = {}
        for pos, values in self._seasonal_pattern.items():
            if values:
                mean = sum(values) / len(values)
                stats[pos] = {
                    "mean": mean,
                    "count": len(values),
                }
        return stats


class AnomalyScoreEngine:
    """Combines multiple detection methods for final score."""

    def __init__(self, config: DetectionConfig):
        self._config = config
        self._statistical = StatisticalDetector(config)
        self._trend = TrendDetector(config)
        self._seasonal = SeasonalDetector(config)

        # Weights for combining scores (keys match score dict keys)
        self._weights = {
            "z_score": 0.35,
            "iqr": 0.35,
            "trend": 0.15,
            "seasonal": 0.15,
        }

    def add_point(self, point: DataPoint) -> None:
        """Add point to all detectors."""
        self._statistical.add_point(point)
        self._trend.add_point(point)
        self._seasonal.add_point(point)

    def compute_score(self, value: float) -> tuple[float, dict[str, Any]]:
        """Compute combined anomaly score."""
        scores = {}
        details = {}

        # Z-score detection
        is_anomaly_z, z_score, expected_z = self._statistical.detect_z_score(value)
        # Normalize z-score to 0-1 range
        z_score_normalized = min(1.0, abs(z_score) / (self._config.z_score_threshold * 2))
        scores["z_score"] = z_score_normalized if is_anomaly_z else z_score_normalized * 0.5
        details["z_score"] = {"anomaly": is_anomaly_z, "score": z_score, "expected": expected_z}

        # IQR detection
        is_anomaly_iqr, iqr_dev, expected_iqr = self._statistical.detect_iqr(value)
        # Normalize IQR deviation to 0-1 range
        iqr_normalized = min(1.0, iqr_dev / (self._config.iqr_multiplier * 2))
        scores["iqr"] = iqr_normalized if is_anomaly_iqr else iqr_normalized * 0.3
        details["iqr"] = {"anomaly": is_anomaly_iqr, "deviation": iqr_dev, "expected": expected_iqr}

        # Trend change
        is_trend_change, trend_dev, trend_type = self._trend.detect_trend_change(value)
        scores["trend"] = min(1.0, trend_dev) if is_trend_change else 0.0
        details["trend"] = {"anomaly": is_trend_change, "type": trend_type}

        # Seasonal break
        is_seasonal, seasonal_dev, expected_seasonal = self._seasonal.detect_seasonal_break(value)
        # Normalize seasonal deviation
        seasonal_normalized = min(1.0, seasonal_dev / (self._config.z_score_threshold * 2))
        scores["seasonal"] = seasonal_normalized if is_seasonal else seasonal_normalized * 0.3
        details["seasonal"] = {"anomaly": is_seasonal, "deviation": seasonal_dev, "expected": expected_seasonal}

        # Combined weighted score
        total_score = sum(
            scores.get(key, 0) * weight
            for key, weight in self._weights.items()
        )

        # Apply sensitivity
        adjusted_score = total_score * self._config.sensitivity

        return adjusted_score, details


class AnomalyDetector:
    """Main anomaly detection system."""

    def __init__(self, config: DetectionConfig | None = None):
        self._config = config or DetectionConfig()
        self._score_engines: dict[str, AnomalyScoreEngine] = {}
        self._anomalies: list[Anomaly] = []
        self._handlers: list[Callable[[Anomaly], None]] = []
        self._anomaly_counter = 0

    def _get_engine(self, metric_name: str) -> AnomalyScoreEngine:
        """Get or create score engine for metric."""
        if metric_name not in self._score_engines:
            self._score_engines[metric_name] = AnomalyScoreEngine(self._config)
        return self._score_engines[metric_name]

    def add_metric_point(
        self,
        metric_name: str,
        value: float,
        timestamp: float | None = None,
        labels: dict[str, str] | None = None,
    ) -> Anomaly | None:
        """Add a metric data point and detect anomalies."""
        point = DataPoint(
            timestamp=timestamp or time.time(),
            value=value,
            labels=labels or {},
        )

        engine = self._get_engine(metric_name)

        # First, just add the point if we don't have enough data
        if len(engine._statistical._data) < self._config.min_samples:
            engine.add_point(point)
            return None

        # Compute anomaly score before adding new point
        score, details = engine.compute_score(value)

        # Add point to history
        engine.add_point(point)

        # Determine if anomaly
        if score >= 0.5:  # Threshold for anomaly
            anomaly = self._create_anomaly(
                metric_name, point, score, details
            )
            self._anomalies.append(anomaly)
            self._notify_handlers(anomaly)
            return anomaly

        return None

    def _create_anomaly(
        self,
        metric_name: str,
        point: DataPoint,
        score: float,
        details: dict[str, Any],
    ) -> Anomaly:
        """Create an anomaly from detection results."""
        self._anomaly_counter += 1

        # Determine type
        anomaly_type = AnomalyType.OUTLIER
        z_details = details.get("z_score", {})
        trend_details = details.get("trend", {})

        if trend_details.get("anomaly"):
            anomaly_type = AnomalyType.TREND_CHANGE
        elif z_details.get("score", 0) > 0:
            if point.value > z_details.get("expected", 0):
                anomaly_type = AnomalyType.SPIKE
            else:
                anomaly_type = AnomalyType.DROP

        # Determine severity
        if score >= 0.9:
            severity = AnomalySeverity.CRITICAL
        elif score >= 0.7:
            severity = AnomalySeverity.HIGH
        elif score >= 0.6:
            severity = AnomalySeverity.MEDIUM
        else:
            severity = AnomalySeverity.LOW

        return Anomaly(
            anomaly_id=f"anomaly-{self._anomaly_counter}",
            timestamp=point.timestamp,
            anomaly_type=anomaly_type,
            severity=severity,
            metric_name=metric_name,
            actual_value=point.value,
            expected_value=details.get("z_score", {}).get("expected", 0),
            deviation=score,
            confidence=min(1.0, score * 1.2),
            context={"labels": point.labels, "details": details},
            detection_method=DetectionMethod.Z_SCORE,
        )

    def _notify_handlers(self, anomaly: Anomaly) -> None:
        """Notify handlers of new anomaly."""
        for handler in self._handlers:
            try:
                handler(anomaly)
            except Exception:
                pass

    def add_handler(self, handler: Callable[[Anomaly], None]) -> None:
        """Add an anomaly handler."""
        self._handlers.append(handler)

    def remove_handler(self, handler: Callable) -> None:
        """Remove a handler."""
        if handler in self._handlers:
            self._handlers.remove(handler)

    def get_anomalies(
        self,
        metric_name: str | None = None,
        severity: AnomalySeverity | None = None,
        unresolved_only: bool = False,
    ) -> list[Anomaly]:
        """Get anomalies with optional filtering."""
        anomalies = self._anomalies

        if metric_name:
            anomalies = [a for a in anomalies if a.metric_name == metric_name]

        if severity:
            anomalies = [a for a in anomalies if a.severity == severity]

        if unresolved_only:
            anomalies = [a for a in anomalies if not a.resolved]

        return anomalies

    def resolve_anomaly(self, anomaly_id: str) -> bool:
        """Mark an anomaly as resolved."""
        for anomaly in self._anomalies:
            if anomaly.anomaly_id == anomaly_id:
                anomaly.resolved = True
                anomaly.resolved_at = time.time()
                return True
        return False

    def get_metric_statistics(self, metric_name: str) -> dict[str, Any]:
        """Get statistics for a metric."""
        engine = self._score_engines.get(metric_name)
        if not engine:
            return {}

        stats = engine._statistical.get_statistics()
        stats["trend"] = engine._trend.get_trend()
        stats["seasonal_positions"] = len(engine._seasonal._seasonal_pattern)

        return stats

    def clear_history(self, metric_name: str | None = None) -> None:
        """Clear detection history."""
        if metric_name:
            if metric_name in self._score_engines:
                del self._score_engines[metric_name]
        else:
            self._score_engines.clear()

    def get_stats(self) -> dict[str, Any]:
        """Get detector statistics."""
        return {
            "metrics_tracked": len(self._score_engines),
            "total_anomalies": len(self._anomalies),
            "unresolved_anomalies": len([a for a in self._anomalies if not a.resolved]),
            "by_severity": {
                s.value: len([a for a in self._anomalies if a.severity == s])
                for s in AnomalySeverity
            },
        }


class AnomalyAggregator:
    """Aggregates anomalies across multiple metrics."""

    def __init__(self):
        self._anomalies: list[Anomaly] = []
        self._correlations: dict[str, set[str]] = {}
        self._handlers: list[Callable[[list[Anomaly]], None]] = []

    def add_anomaly(self, anomaly: Anomaly) -> None:
        """Add an anomaly for correlation."""
        self._anomalies.append(anomaly)
        self._check_correlations()

    def _check_correlations(self) -> None:
        """Check for correlated anomalies."""
        recent = [a for a in self._anomalies
                  if a.timestamp > time.time() - 60]  # Last minute

        if len(recent) < 2:
            return

        # Group by time window
        windows: dict[int, list[Anomaly]] = {}
        for anomaly in recent:
            window = int(anomaly.timestamp / 10)  # 10-second windows
            if window not in windows:
                windows[window] = []
            windows[window].append(anomaly)

        # Find correlated groups
        for window, anomalies in windows.items():
            if len(anomalies) >= 2:
                self._notify_correlation(anomalies)

    def _notify_correlation(self, anomalies: list[Anomaly]) -> None:
        """Notify handlers of correlated anomalies."""
        for handler in self._handlers:
            try:
                handler(anomalies)
            except Exception:
                pass

    def add_correlation_handler(
        self,
        handler: Callable[[list[Anomaly]], None]
    ) -> None:
        """Add handler for correlated anomalies."""
        self._handlers.append(handler)

    def get_recent(self, seconds: float = 300) -> list[Anomaly]:
        """Get recent anomalies."""
        cutoff = time.time() - seconds
        return [a for a in self._anomalies if a.timestamp > cutoff]


# Need Set import


def create_anomaly_detector(
    window_size: int = 100,
    min_samples: int = 10,
    z_score_threshold: float = 3.0,
    sensitivity: float = 0.8,
) -> AnomalyDetector:
    """Factory function to create an anomaly detector."""
    config = DetectionConfig(
        window_size=window_size,
        min_samples=min_samples,
        z_score_threshold=z_score_threshold,
        sensitivity=sensitivity,
    )
    return AnomalyDetector(config)


def create_detection_config(**kwargs) -> DetectionConfig:
    """Factory function to create detection config."""
    return DetectionConfig(**kwargs)
