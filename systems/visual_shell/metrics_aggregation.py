"""
Metrics Aggregation - Phase 51

Collect and aggregate metrics from across the mesh.
"""

import asyncio
import time
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class MetricType(Enum):
    """Types of metrics."""
    COUNTER = "counter"
    GAUGE = "gauge"
    HISTOGRAM = "histogram"
    SUMMARY = "summary"
    UNTYPED = "untyped"


class AggregationType(Enum):
    """Types of aggregation."""
    SUM = "sum"
    AVG = "avg"
    MIN = "min"
    MAX = "max"
    COUNT = "count"
    RATE = "rate"
    DELTA = "delta"
    PERCENTILE = "percentile"


@dataclass
class Label:
    """A metric label."""
    name: str
    value: str

    def __hash__(self):
        return hash((self.name, self.value))


@dataclass
class MetricValue:
    """A single metric value."""
    value: float
    timestamp: float = field(default_factory=time.time)
    labels: tuple[Label, ...] = field(default_factory=tuple)


@dataclass
class Metric:
    """A named metric with values."""
    name: str
    metric_type: MetricType
    description: str = ""
    unit: str = ""
    values: list[MetricValue] = field(default_factory=list)
    labels: dict[str, str] = field(default_factory=dict)

    def add_value(
        self,
        value: float,
        labels: dict[str, str] | None = None,
        timestamp: float | None = None,
    ) -> None:
        """Add a value to the metric."""
        label_tuple = tuple(
            Label(k, v) for k, v in (labels or {}).items()
        )
        self.values.append(MetricValue(
            value=value,
            timestamp=timestamp or time.time(),
            labels=label_tuple,
        ))

    def get_latest(self) -> MetricValue | None:
        """Get the most recent value."""
        if not self.values:
            return None
        return max(self.values, key=lambda v: v.timestamp)

    def get_values_in_range(
        self,
        start: float,
        end: float,
    ) -> list[MetricValue]:
        """Get values in time range."""
        return [
            v for v in self.values
            if start <= v.timestamp <= end
        ]


@dataclass
class AggregatedMetric:
    """An aggregated metric result."""
    name: str
    aggregation: AggregationType
    value: float
    start_time: float
    end_time: float
    sample_count: int = 0
    labels: dict[str, str] = field(default_factory=dict)


@dataclass
class TimeSeriesPoint:
    """A point in a time series."""
    timestamp: float
    value: float
    labels: dict[str, str] = field(default_factory=dict)


@dataclass
class TimeSeries:
    """A time series of metric values."""
    name: str
    points: list[TimeSeriesPoint] = field(default_factory=list)
    labels: dict[str, str] = field(default_factory=dict)

    def add_point(self, value: float, timestamp: float | None = None) -> None:
        """Add a point to the series."""
        self.points.append(TimeSeriesPoint(
            timestamp=timestamp or time.time(),
            value=value,
            labels=self.labels.copy(),
        ))

    def get_range(
        self,
        start: float,
        end: float,
    ) -> list[TimeSeriesPoint]:
        """Get points in time range."""
        return [
            p for p in self.points
            if start <= p.timestamp <= end
        ]

    def get_latest(self) -> TimeSeriesPoint | None:
        """Get latest point."""
        if not self.points:
            return None
        return max(self.points, key=lambda p: p.timestamp)


class Counter:
    """A counter metric that only increases."""

    def __init__(self, name: str, description: str = "", labels: dict[str, str] | None = None):
        self.name = name
        self.description = description
        self._value = 0.0
        self._labels = labels or {}
        self._values: list[MetricValue] = []

    def inc(self, amount: float = 1.0) -> None:
        """Increment counter."""
        if amount < 0:
            raise ValueError("Counter can only increase")
        self._value += amount
        self._values.append(MetricValue(
            value=self._value,
            timestamp=time.time(),
            labels=tuple(Label(k, v) for k, v in self._labels.items()),
        ))

    def get(self) -> float:
        """Get current value."""
        return self._value

    def get_values(self) -> list[MetricValue]:
        """Get all recorded values."""
        return self._values.copy()


class Gauge:
    """A gauge metric that can increase or decrease."""

    def __init__(self, name: str, description: str = "", labels: dict[str, str] | None = None):
        self.name = name
        self.description = description
        self._value = 0.0
        self._labels = labels or {}
        self._values: list[MetricValue] = []

    def set(self, value: float) -> None:
        """Set gauge value."""
        self._value = value
        self._values.append(MetricValue(
            value=value,
            timestamp=time.time(),
            labels=tuple(Label(k, v) for k, v in self._labels.items()),
        ))

    def inc(self, amount: float = 1.0) -> None:
        """Increment gauge."""
        self._value += amount
        self._values.append(MetricValue(
            value=self._value,
            timestamp=time.time(),
            labels=tuple(Label(k, v) for k, v in self._labels.items()),
        ))

    def dec(self, amount: float = 1.0) -> None:
        """Decrement gauge."""
        self._value -= amount
        self._values.append(MetricValue(
            value=self._value,
            timestamp=time.time(),
            labels=tuple(Label(k, v) for k, v in self._labels.items()),
        ))

    def get(self) -> float:
        """Get current value."""
        return self._value

    def get_values(self) -> list[MetricValue]:
        """Get all recorded values."""
        return self._values.copy()


class Histogram:
    """A histogram metric with bucketed observations."""

    def __init__(
        self,
        name: str,
        description: str = "",
        buckets: list[float] | None = None,
        labels: dict[str, str] | None = None,
    ):
        self.name = name
        self.description = description
        self._buckets = sorted(set(buckets or [0.1, 0.5, 1.0, 5.0, 10.0, float("inf")]))
        self._bucket_counts: dict[float, int] = dict.fromkeys(self._buckets, 0)
        self._sum = 0.0
        self._count = 0
        self._labels = labels or {}
        self._observations: list[tuple[float, float]] = []  # (value, timestamp)

    def observe(self, value: float) -> None:
        """Record an observation."""
        self._sum += value
        self._count += 1

        for bucket in self._buckets:
            if value <= bucket:
                self._bucket_counts[bucket] += 1

        self._observations.append((value, time.time()))

    def get_bucket_counts(self) -> dict[float, int]:
        """Get bucket counts."""
        return self._bucket_counts.copy()

    def get_sum(self) -> float:
        """Get sum of observations."""
        return self._sum

    def get_count(self) -> int:
        """Get count of observations."""
        return self._count

    def get_average(self) -> float:
        """Get average of observations."""
        if self._count == 0:
            return 0.0
        return self._sum / self._count

    def get_percentile(self, p: float) -> float:
        """Get percentile value."""
        if not self._observations:
            return 0.0

        sorted_values = sorted(v for v, _ in self._observations)
        index = int(len(sorted_values) * p / 100)
        return sorted_values[min(index, len(sorted_values) - 1)]


class MetricsCollector:
    """Collects metrics from various sources."""

    def __init__(self, namespace: str = "geometry_os"):
        self._namespace = namespace
        self._metrics: dict[str, Metric] = {}
        self._counters: dict[str, Counter] = {}
        self._gauges: dict[str, Gauge] = {}
        self._histograms: dict[str, Histogram] = {}
        self._collection_interval: float = 10.0
        self._running = False
        self._collectors: list[Callable[[], dict[str, Any]]] = []

    def create_counter(
        self,
        name: str,
        description: str = "",
        labels: dict[str, str] | None = None,
    ) -> Counter:
        """Create a counter metric."""
        full_name = f"{self._namespace}_{name}"
        counter = Counter(full_name, description, labels)
        self._counters[full_name] = counter
        return counter

    def create_gauge(
        self,
        name: str,
        description: str = "",
        labels: dict[str, str] | None = None,
    ) -> Gauge:
        """Create a gauge metric."""
        full_name = f"{self._namespace}_{name}"
        gauge = Gauge(full_name, description, labels)
        self._gauges[full_name] = gauge
        return gauge

    def create_histogram(
        self,
        name: str,
        description: str = "",
        buckets: list[float] | None = None,
        labels: dict[str, str] | None = None,
    ) -> Histogram:
        """Create a histogram metric."""
        full_name = f"{self._namespace}_{name}"
        histogram = Histogram(full_name, description, buckets, labels)
        self._histograms[full_name] = histogram
        return histogram

    def register_collector(self, collector: Callable[[], dict[str, Any]]) -> None:
        """Register a metric collector function."""
        self._collectors.append(collector)

    def unregister_collector(self, collector: Callable) -> None:
        """Unregister a collector."""
        if collector in self._collectors:
            self._collectors.remove(collector)

    async def start(self) -> None:
        """Start periodic collection."""
        self._running = True
        asyncio.create_task(self._collection_loop())

    async def stop(self) -> None:
        """Stop collection."""
        self._running = False

    async def _collection_loop(self) -> None:
        """Periodic collection loop."""
        while self._running:
            await self._collect_all()
            await asyncio.sleep(self._collection_interval)

    async def _collect_all(self) -> None:
        """Collect from all registered collectors."""
        for collector in self._collectors:
            try:
                metrics = collector()
                if asyncio.iscoroutine(metrics):
                    metrics = await metrics
                self._process_collected(metrics)
            except Exception:
                pass

    def _process_collected(self, metrics: dict[str, Any]) -> None:
        """Process collected metrics."""
        for name, value in metrics.items():
            if isinstance(value, dict):
                if "type" in value and value["type"] == "histogram":
                    if name in self._histograms:
                        self._histograms[name].observe(value.get("value", 0))
            elif isinstance(value, (int, float)):
                if name in self._gauges:
                    self._gauges[name].set(value)

    def collect_all(self) -> dict[str, Any]:
        """Collect all metrics."""
        result = {}

        for name, counter in self._counters.items():
            result[name] = {
                "type": "counter",
                "value": counter.get(),
                "description": counter.description,
            }

        for name, gauge in self._gauges.items():
            result[name] = {
                "type": "gauge",
                "value": gauge.get(),
                "description": gauge.description,
            }

        for name, histogram in self._histograms.items():
            result[name] = {
                "type": "histogram",
                "sum": histogram.get_sum(),
                "count": histogram.get_count(),
                "buckets": histogram.get_bucket_counts(),
                "description": histogram.description,
            }

        return result

    def get_counter(self, name: str) -> Counter | None:
        """Get a counter by name."""
        full_name = f"{self._namespace}_{name}"
        return self._counters.get(full_name)

    def get_gauge(self, name: str) -> Gauge | None:
        """Get a gauge by name."""
        full_name = f"{self._namespace}_{name}"
        return self._gauges.get(full_name)

    def get_histogram(self, name: str) -> Histogram | None:
        """Get a histogram by name."""
        full_name = f"{self._namespace}_{name}"
        return self._histograms.get(full_name)


class MetricsAggregator:
    """Aggregates metrics with rollups and statistics."""

    def __init__(self, rollup_intervals: list[float] | None = None):
        self._rollup_intervals = rollup_intervals or [60.0, 300.0, 3600.0]
        self._time_series: dict[str, TimeSeries] = {}
        self._aggregations: dict[str, list[AggregatedMetric]] = {}

    def add_value(
        self,
        name: str,
        value: float,
        labels: dict[str, str] | None = None,
        timestamp: float | None = None,
    ) -> None:
        """Add a metric value."""
        if name not in self._time_series:
            self._time_series[name] = TimeSeries(name=name, labels=labels or {})

        self._time_series[name].add_point(value, timestamp)

    def aggregate(
        self,
        name: str,
        aggregation: AggregationType,
        start: float,
        end: float,
        percentile: float | None = None,
    ) -> AggregatedMetric | None:
        """Aggregate a metric over a time range."""
        series = self._time_series.get(name)
        if not series:
            return None

        points = series.get_range(start, end)
        if not points:
            return None

        values = [p.value for p in points]

        if aggregation == AggregationType.SUM:
            agg_value = sum(values)
        elif aggregation == AggregationType.AVG:
            agg_value = sum(values) / len(values)
        elif aggregation == AggregationType.MIN:
            agg_value = min(values)
        elif aggregation == AggregationType.MAX:
            agg_value = max(values)
        elif aggregation == AggregationType.COUNT:
            agg_value = len(values)
        elif aggregation == AggregationType.RATE:
            duration = end - start
            agg_value = len(values) / duration if duration > 0 else 0
        elif aggregation == AggregationType.PERCENTILE and percentile is not None:
            sorted_values = sorted(values)
            index = int(len(sorted_values) * percentile / 100)
            agg_value = sorted_values[min(index, len(sorted_values) - 1)]
        else:
            agg_value = sum(values)

        agg = AggregatedMetric(
            name=name,
            aggregation=aggregation,
            value=agg_value,
            start_time=start,
            end_time=end,
            sample_count=len(values),
            labels=series.labels,
        )

        if name not in self._aggregations:
            self._aggregations[name] = []
        self._aggregations[name].append(agg)

        return agg

    def compute_rollups(self) -> dict[str, dict[float, AggregatedMetric]]:
        """Compute rollups for all intervals."""
        now = time.time()
        rollups: dict[str, dict[float, AggregatedMetric]] = {}

        for name, series in self._time_series.items():
            rollups[name] = {}
            for interval in self._rollup_intervals:
                start = now - interval
                agg = self.aggregate(name, AggregationType.AVG, start, now)
                if agg:
                    rollups[name][interval] = agg

        return rollups

    def get_time_series(self, name: str) -> TimeSeries | None:
        """Get time series for a metric."""
        return self._time_series.get(name)

    def get_all_time_series(self) -> dict[str, TimeSeries]:
        """Get all time series."""
        return self._time_series.copy()

    def get_aggregations(self, name: str) -> list[AggregatedMetric]:
        """Get aggregations for a metric."""
        return self._aggregations.get(name, [])


class TimeSeriesDB:
    """Simple time series database."""

    def __init__(self, max_points: int = 100000, retention_seconds: float = 86400):
        self._max_points = max_points
        self._retention = retention_seconds
        self._series: dict[str, list[TimeSeriesPoint]] = defaultdict(list)

    def insert(
        self,
        name: str,
        value: float,
        timestamp: float | None = None,
        labels: dict[str, str] | None = None,
    ) -> None:
        """Insert a point."""
        point = TimeSeriesPoint(
            timestamp=timestamp or time.time(),
            value=value,
            labels=labels or {},
        )
        self._series[name].append(point)

        # Enforce limits
        if len(self._series[name]) > self._max_points:
            self._series[name] = self._series[name][-self._max_points:]

    def query(
        self,
        name: str,
        start: float | None = None,
        end: float | None = None,
        limit: int = 1000,
    ) -> list[TimeSeriesPoint]:
        """Query points in range."""
        points = self._series.get(name, [])

        if start is not None:
            points = [p for p in points if p.timestamp >= start]
        if end is not None:
            points = [p for p in points if p.timestamp <= end]

        return points[-limit:]

    def query_multi(
        self,
        names: list[str],
        start: float | None = None,
        end: float | None = None,
    ) -> dict[str, list[TimeSeriesPoint]]:
        """Query multiple series."""
        return {
            name: self.query(name, start, end)
            for name in names
        }

    def delete(self, name: str) -> int:
        """Delete a series."""
        count = len(self._series.get(name, []))
        del self._series[name]
        return count

    def cleanup_expired(self) -> int:
        """Remove expired points."""
        cutoff = time.time() - self._retention
        total_removed = 0

        for name in self._series:
            original = len(self._series[name])
            self._series[name] = [
                p for p in self._series[name]
                if p.timestamp >= cutoff
            ]
            total_removed += original - len(self._series[name])

        return total_removed

    def get_series_names(self) -> list[str]:
        """Get all series names."""
        return list(self._series.keys())

    def get_stats(self) -> dict[str, Any]:
        """Get database statistics."""
        total_points = sum(len(points) for points in self._series.values())
        return {
            "series_count": len(self._series),
            "total_points": total_points,
            "max_points": self._max_points,
            "retention_seconds": self._retention,
        }


class AlertingRule:
    """An alerting rule for metrics."""

    def __init__(
        self,
        name: str,
        metric_name: str,
        threshold: float,
        comparison: str = "gt",  # gt, lt, gte, lte, eq
        duration: float = 0.0,
        labels: dict[str, str] | None = None,
    ):
        self.name = name
        self.metric_name = metric_name
        self.threshold = threshold
        self.comparison = comparison
        self.duration = duration
        self.labels = labels or {}
        self._breach_start: float | None = None
        self._handlers: list[Callable[[str, float, float], None]] = []

    def evaluate(self, value: float) -> bool:
        """Evaluate if rule is breached."""
        if self.comparison == "gt":
            breached = value > self.threshold
        elif self.comparison == "lt":
            breached = value < self.threshold
        elif self.comparison == "gte":
            breached = value >= self.threshold
        elif self.comparison == "lte":
            breached = value <= self.threshold
        else:
            breached = value == self.threshold

        # Handle duration requirement
        if breached:
            if self._breach_start is None:
                self._breach_start = time.time()

            # If duration is 0, immediately trigger
            if self.duration == 0:
                self._notify_handlers(value)
                return True

            if time.time() - self._breach_start >= self.duration:
                self._notify_handlers(value)
                return True
        else:
            self._breach_start = None

        return False

    def add_handler(self, handler: Callable) -> None:
        """Add alert handler."""
        self._handlers.append(handler)

    def remove_handler(self, handler: Callable) -> None:
        """Remove handler."""
        if handler in self._handlers:
            self._handlers.remove(handler)

    def _notify_handlers(self, value: float) -> None:
        """Notify handlers of alert."""
        for handler in self._handlers:
            try:
                handler(self.name, value, self.threshold)
            except Exception:
                pass


class MetricsSystem:
    """Complete metrics collection and aggregation system."""

    def __init__(self, namespace: str = "geometry_os"):
        self._collector = MetricsCollector(namespace)
        self._aggregator = MetricsAggregator()
        self._db = TimeSeriesDB()
        self._alerting_rules: dict[str, AlertingRule] = {}
        self._running = False

    async def start(self) -> None:
        """Start the metrics system."""
        self._running = True
        await self._collector.start()

    async def stop(self) -> None:
        """Stop the metrics system."""
        self._running = False
        await self._collector.stop()

    def create_counter(self, name: str, description: str = "") -> Counter:
        """Create a counter."""
        return self._collector.create_counter(name, description)

    def create_gauge(self, name: str, description: str = "") -> Gauge:
        """Create a gauge."""
        return self._collector.create_gauge(name, description)

    def create_histogram(self, name: str, description: str = "", buckets: list[float] | None = None) -> Histogram:
        """Create a histogram."""
        return self._collector.create_histogram(name, description, buckets)

    def record(self, name: str, value: float, labels: dict[str, str] | None = None) -> None:
        """Record a metric value."""
        self._aggregator.add_value(name, value, labels)
        self._db.insert(name, value, labels=labels)

        # Check alerting rules
        rule = self._alerting_rules.get(name)
        if rule:
            rule.evaluate(value)

    def add_alerting_rule(self, rule: AlertingRule) -> None:
        """Add an alerting rule."""
        self._alerting_rules[rule.metric_name] = rule

    def remove_alerting_rule(self, metric_name: str) -> None:
        """Remove an alerting rule."""
        self._alerting_rules.pop(metric_name, None)

    def query(self, name: str, start: float | None = None, end: float | None = None) -> list[TimeSeriesPoint]:
        """Query metric data."""
        return self._db.query(name, start, end)

    def aggregate(
        self,
        name: str,
        aggregation: AggregationType,
        start: float,
        end: float,
    ) -> AggregatedMetric | None:
        """Aggregate metric data."""
        return self._aggregator.aggregate(name, aggregation, start, end)

    def get_collector(self) -> MetricsCollector:
        """Get the metrics collector."""
        return self._collector

    def get_aggregator(self) -> MetricsAggregator:
        """Get the metrics aggregator."""
        return self._aggregator

    def get_db(self) -> TimeSeriesDB:
        """Get the time series database."""
        return self._db

    def get_stats(self) -> dict[str, Any]:
        """Get system statistics."""
        return {
            "collector": {
                "counters": len(self._collector._counters),
                "gauges": len(self._collector._gauges),
                "histograms": len(self._collector._histograms),
            },
            "aggregator": {
                "series": len(self._aggregator._time_series),
            },
            "db": self._db.get_stats(),
            "alerting_rules": len(self._alerting_rules),
        }


def create_metrics_system(namespace: str = "geometry_os") -> MetricsSystem:
    """Factory function to create a metrics system."""
    return MetricsSystem(namespace=namespace)
