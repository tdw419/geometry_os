"""
Tests for Metrics Aggregation (Phase 51)

Tests collection and aggregation of metrics from across the mesh.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.metrics_aggregation import (
    AggregationType,
    AlertingRule,
    Counter,
    Gauge,
    Histogram,
    Label,
    Metric,
    MetricsAggregator,
    MetricsCollector,
    MetricsSystem,
    MetricType,
    MetricValue,
    TimeSeries,
    TimeSeriesDB,
    TimeSeriesPoint,
    create_metrics_system,
)


class TestMetricType:
    """Tests for MetricType enum."""

    def test_metric_types(self):
        assert MetricType.COUNTER.value == "counter"
        assert MetricType.GAUGE.value == "gauge"
        assert MetricType.HISTOGRAM.value == "histogram"
        assert MetricType.SUMMARY.value == "summary"


class TestAggregationType:
    """Tests for AggregationType enum."""

    def test_aggregation_types(self):
        assert AggregationType.SUM.value == "sum"
        assert AggregationType.AVG.value == "avg"
        assert AggregationType.MIN.value == "min"
        assert AggregationType.MAX.value == "max"
        assert AggregationType.RATE.value == "rate"


class TestLabel:
    """Tests for Label."""

    def test_label_creation(self):
        label = Label(name="env", value="prod")
        assert label.name == "env"
        assert label.value == "prod"

    def test_label_hash(self):
        label1 = Label(name="env", value="prod")
        label2 = Label(name="env", value="prod")
        assert hash(label1) == hash(label2)


class TestMetricValue:
    """Tests for MetricValue."""

    def test_value_creation(self):
        value = MetricValue(value=42.0)
        assert value.value == 42.0
        assert value.timestamp > 0


class TestMetric:
    """Tests for Metric."""

    def test_metric_creation(self):
        metric = Metric(
            name="test_metric",
            metric_type=MetricType.GAUGE,
        )
        assert metric.name == "test_metric"
        assert len(metric.values) == 0

    def test_add_value(self):
        metric = Metric(
            name="test_metric",
            metric_type=MetricType.GAUGE,
        )
        metric.add_value(42.0)
        assert len(metric.values) == 1

    def test_add_value_with_labels(self):
        metric = Metric(
            name="test_metric",
            metric_type=MetricType.GAUGE,
        )
        metric.add_value(42.0, labels={"env": "prod"})
        assert len(metric.values) == 1

    def test_get_latest(self):
        metric = Metric(
            name="test_metric",
            metric_type=MetricType.GAUGE,
        )
        metric.add_value(1.0)
        metric.add_value(2.0)
        metric.add_value(3.0)

        latest = metric.get_latest()
        assert latest.value == 3.0

    def test_get_latest_empty(self):
        metric = Metric(
            name="test_metric",
            metric_type=MetricType.GAUGE,
        )
        latest = metric.get_latest()
        assert latest is None

    def test_get_values_in_range(self):
        metric = Metric(
            name="test_metric",
            metric_type=MetricType.GAUGE,
        )

        now = time.time()
        metric.add_value(1.0, timestamp=now - 10)
        metric.add_value(2.0, timestamp=now - 5)
        metric.add_value(3.0, timestamp=now)

        values = metric.get_values_in_range(now - 6, now)
        assert len(values) == 2


class TestTimeSeriesPoint:
    """Tests for TimeSeriesPoint."""

    def test_point_creation(self):
        point = TimeSeriesPoint(timestamp=time.time(), value=42.0)
        assert point.value == 42.0


class TestTimeSeries:
    """Tests for TimeSeries."""

    def test_series_creation(self):
        series = TimeSeries(name="test_series")
        assert series.name == "test_series"
        assert len(series.points) == 0

    def test_add_point(self):
        series = TimeSeries(name="test_series")
        series.add_point(42.0)
        assert len(series.points) == 1

    def test_get_range(self):
        series = TimeSeries(name="test_series")

        now = time.time()
        series.add_point(1.0, timestamp=now - 10)
        series.add_point(2.0, timestamp=now - 5)
        series.add_point(3.0, timestamp=now)

        points = series.get_range(now - 6, now)
        assert len(points) == 2

    def test_get_latest(self):
        series = TimeSeries(name="test_series")
        series.add_point(1.0)
        series.add_point(2.0)

        latest = series.get_latest()
        assert latest.value == 2.0

    def test_get_latest_empty(self):
        series = TimeSeries(name="test_series")
        latest = series.get_latest()
        assert latest is None


class TestCounter:
    """Tests for Counter."""

    def test_counter_creation(self):
        counter = Counter(name="requests_total")
        assert counter.name == "requests_total"
        assert counter.get() == 0.0

    def test_inc(self):
        counter = Counter(name="requests_total")
        counter.inc()
        assert counter.get() == 1.0

    def test_inc_by_amount(self):
        counter = Counter(name="requests_total")
        counter.inc(5.0)
        assert counter.get() == 5.0

    def test_inc_negative_error(self):
        counter = Counter(name="requests_total")
        with pytest.raises(ValueError):
            counter.inc(-1.0)

    def test_get_values(self):
        counter = Counter(name="requests_total")
        counter.inc()
        counter.inc(2.0)

        values = counter.get_values()
        assert len(values) == 2


class TestGauge:
    """Tests for Gauge."""

    def test_gauge_creation(self):
        gauge = Gauge(name="temperature")
        assert gauge.name == "temperature"
        assert gauge.get() == 0.0

    def test_set(self):
        gauge = Gauge(name="temperature")
        gauge.set(42.0)
        assert gauge.get() == 42.0

    def test_inc(self):
        gauge = Gauge(name="temperature")
        gauge.set(10.0)
        gauge.inc(5.0)
        assert gauge.get() == 15.0

    def test_dec(self):
        gauge = Gauge(name="temperature")
        gauge.set(10.0)
        gauge.dec(3.0)
        assert gauge.get() == 7.0

    def test_get_values(self):
        gauge = Gauge(name="temperature")
        gauge.set(10.0)
        gauge.set(20.0)

        values = gauge.get_values()
        assert len(values) == 2


class TestHistogram:
    """Tests for Histogram."""

    def test_histogram_creation(self):
        histogram = Histogram(name="latency")
        assert histogram.name == "latency"
        assert histogram.get_count() == 0

    def test_observe(self):
        histogram = Histogram(name="latency")
        histogram.observe(1.5)
        assert histogram.get_count() == 1
        assert histogram.get_sum() == 1.5

    def test_bucket_counts(self):
        histogram = Histogram(name="latency", buckets=[1.0, 5.0, 10.0])
        histogram.observe(0.5)
        histogram.observe(2.0)
        histogram.observe(7.0)

        buckets = histogram.get_bucket_counts()
        assert buckets[1.0] == 1
        assert buckets[5.0] == 2
        assert buckets[10.0] == 3

    def test_get_average(self):
        histogram = Histogram(name="latency")
        histogram.observe(1.0)
        histogram.observe(2.0)
        histogram.observe(3.0)

        assert histogram.get_average() == 2.0

    def test_get_average_empty(self):
        histogram = Histogram(name="latency")
        assert histogram.get_average() == 0.0

    def test_get_percentile(self):
        histogram = Histogram(name="latency")
        for i in range(100):
            histogram.observe(float(i))

        p50 = histogram.get_percentile(50)
        assert 49 <= p50 <= 51


class TestMetricsCollector:
    """Tests for MetricsCollector."""

    @pytest.fixture
    def collector(self):
        return MetricsCollector(namespace="test")

    def test_collector_creation(self, collector):
        assert collector._namespace == "test"

    def test_create_counter(self, collector):
        counter = collector.create_counter("requests", "Request count")
        assert counter is not None
        assert "test_requests" in collector._counters

    def test_create_gauge(self, collector):
        gauge = collector.create_gauge("temperature", "Current temp")
        assert gauge is not None
        assert "test_temperature" in collector._gauges

    def test_create_histogram(self, collector):
        histogram = collector.create_histogram("latency", "Request latency")
        assert histogram is not None
        assert "test_latency" in collector._histograms

    def test_register_collector(self, collector):
        def my_collector():
            return {"metric": 42}

        collector.register_collector(my_collector)
        assert my_collector in collector._collectors

    def test_unregister_collector(self, collector):
        def my_collector():
            return {"metric": 42}

        collector.register_collector(my_collector)
        collector.unregister_collector(my_collector)
        assert my_collector not in collector._collectors

    def test_collect_all(self, collector):
        counter = collector.create_counter("requests")
        counter.inc(5)

        gauge = collector.create_gauge("temperature")
        gauge.set(23.5)

        metrics = collector.collect_all()
        assert "test_requests" in metrics
        assert "test_temperature" in metrics

    def test_get_counter(self, collector):
        collector.create_counter("requests")
        counter = collector.get_counter("requests")
        assert counter is not None

    def test_get_counter_not_found(self, collector):
        counter = collector.get_counter("nonexistent")
        assert counter is None

    def test_get_gauge(self, collector):
        collector.create_gauge("temperature")
        gauge = collector.get_gauge("temperature")
        assert gauge is not None

    def test_get_histogram(self, collector):
        collector.create_histogram("latency")
        histogram = collector.get_histogram("latency")
        assert histogram is not None

    @pytest.mark.asyncio
    async def test_start_stop(self, collector):
        await collector.start()
        assert collector._running is True

        await collector.stop()
        assert collector._running is False


class TestMetricsAggregator:
    """Tests for MetricsAggregator."""

    @pytest.fixture
    def aggregator(self):
        return MetricsAggregator()

    def test_aggregator_creation(self, aggregator):
        assert len(aggregator._time_series) == 0

    def test_add_value(self, aggregator):
        aggregator.add_value("metric1", 42.0)
        assert "metric1" in aggregator._time_series

    def test_aggregate_sum(self, aggregator):
        aggregator.add_value("metric1", 1.0)
        aggregator.add_value("metric1", 2.0)
        aggregator.add_value("metric1", 3.0)

        now = time.time()
        agg = aggregator.aggregate("metric1", AggregationType.SUM, 0, now)
        assert agg.value == 6.0

    def test_aggregate_avg(self, aggregator):
        aggregator.add_value("metric1", 10.0)
        aggregator.add_value("metric1", 20.0)

        now = time.time()
        agg = aggregator.aggregate("metric1", AggregationType.AVG, 0, now)
        assert agg.value == 15.0

    def test_aggregate_min_max(self, aggregator):
        aggregator.add_value("metric1", 5.0)
        aggregator.add_value("metric1", 10.0)
        aggregator.add_value("metric1", 15.0)

        now = time.time()
        min_agg = aggregator.aggregate("metric1", AggregationType.MIN, 0, now)
        max_agg = aggregator.aggregate("metric1", AggregationType.MAX, 0, now)

        assert min_agg.value == 5.0
        assert max_agg.value == 15.0

    def test_aggregate_count(self, aggregator):
        aggregator.add_value("metric1", 1.0)
        aggregator.add_value("metric1", 2.0)
        aggregator.add_value("metric1", 3.0)

        now = time.time()
        agg = aggregator.aggregate("metric1", AggregationType.COUNT, 0, now)
        assert agg.value == 3

    def test_aggregate_percentile(self, aggregator):
        for i in range(100):
            aggregator.add_value("metric1", float(i))

        now = time.time()
        agg = aggregator.aggregate("metric1", AggregationType.PERCENTILE, 0, now, percentile=50)
        assert 49 <= agg.value <= 51

    def test_aggregate_not_found(self, aggregator):
        now = time.time()
        agg = aggregator.aggregate("nonexistent", AggregationType.SUM, 0, now)
        assert agg is None

    def test_compute_rollups(self, aggregator):
        aggregator.add_value("metric1", 10.0)
        aggregator.add_value("metric1", 20.0)

        rollups = aggregator.compute_rollups()
        assert "metric1" in rollups

    def test_get_time_series(self, aggregator):
        aggregator.add_value("metric1", 42.0)
        series = aggregator.get_time_series("metric1")
        assert series is not None

    def test_get_all_time_series(self, aggregator):
        aggregator.add_value("metric1", 1.0)
        aggregator.add_value("metric2", 2.0)

        all_series = aggregator.get_all_time_series()
        assert len(all_series) == 2


class TestTimeSeriesDB:
    """Tests for TimeSeriesDB."""

    @pytest.fixture
    def db(self):
        return TimeSeriesDB(max_points=100, retention_seconds=60)

    def test_db_creation(self, db):
        assert db._max_points == 100

    def test_insert(self, db):
        db.insert("metric1", 42.0)
        points = db.query("metric1")
        assert len(points) == 1

    def test_insert_with_labels(self, db):
        db.insert("metric1", 42.0, labels={"env": "prod"})
        points = db.query("metric1")
        assert points[0].labels["env"] == "prod"

    def test_query_with_range(self, db):
        now = time.time()
        db.insert("metric1", 1.0, timestamp=now - 10)
        db.insert("metric1", 2.0, timestamp=now - 5)
        db.insert("metric1", 3.0, timestamp=now)

        points = db.query("metric1", start=now - 6, end=now)
        assert len(points) == 2

    def test_query_with_limit(self, db):
        for i in range(100):
            db.insert("metric1", float(i))

        points = db.query("metric1", limit=10)
        assert len(points) == 10

    def test_query_multi(self, db):
        db.insert("metric1", 1.0)
        db.insert("metric2", 2.0)

        results = db.query_multi(["metric1", "metric2"])
        assert len(results) == 2

    def test_delete(self, db):
        db.insert("metric1", 42.0)
        count = db.delete("metric1")
        assert count == 1
        assert len(db.query("metric1")) == 0

    def test_get_series_names(self, db):
        db.insert("metric1", 1.0)
        db.insert("metric2", 2.0)

        names = db.get_series_names()
        assert "metric1" in names
        assert "metric2" in names

    def test_get_stats(self, db):
        db.insert("metric1", 1.0)
        db.insert("metric1", 2.0)

        stats = db.get_stats()
        assert stats["series_count"] == 1
        assert stats["total_points"] == 2


class TestAlertingRule:
    """Tests for AlertingRule."""

    def test_rule_creation(self):
        rule = AlertingRule(
            name="high_latency",
            metric_name="latency",
            threshold=100.0,
            comparison="gt",
        )
        assert rule.name == "high_latency"
        assert rule.threshold == 100.0

    def test_evaluate_gt(self):
        rule = AlertingRule(
            name="high_latency",
            metric_name="latency",
            threshold=100.0,
            comparison="gt",
            duration=0.0,
        )

        breached = rule.evaluate(150.0)
        assert breached is True

        breached = rule.evaluate(50.0)
        assert breached is False

    def test_evaluate_lt(self):
        rule = AlertingRule(
            name="low_memory",
            metric_name="memory",
            threshold=10.0,
            comparison="lt",
            duration=0.0,
        )

        breached = rule.evaluate(5.0)
        assert breached is True

    def test_evaluate_with_duration(self):
        rule = AlertingRule(
            name="sustained_high",
            metric_name="cpu",
            threshold=80.0,
            comparison="gte",
            duration=1.0,  # 1 second
        )

        # First evaluation - starts timer
        breached = rule.evaluate(90.0)
        assert breached is False

        # Immediate second evaluation - duration not met
        breached = rule.evaluate(90.0)
        assert breached is False

    def test_add_handler(self, rule):
        handler = Mock()
        rule.add_handler(handler)
        assert handler in rule._handlers

    def test_remove_handler(self, rule):
        handler = Mock()
        rule.add_handler(handler)
        rule.remove_handler(handler)
        assert handler not in rule._handlers


class TestMetricsSystem:
    """Tests for MetricsSystem."""

    @pytest.fixture
    def system(self):
        return MetricsSystem(namespace="test")

    def test_system_creation(self, system):
        assert system._collector is not None
        assert system._aggregator is not None
        assert system._db is not None

    def test_create_counter(self, system):
        counter = system.create_counter("requests")
        assert counter is not None

    def test_create_gauge(self, system):
        gauge = system.create_gauge("temperature")
        assert gauge is not None

    def test_create_histogram(self, system):
        histogram = system.create_histogram("latency")
        assert histogram is not None

    def test_record(self, system):
        system.record("custom_metric", 42.0)
        points = system.query("custom_metric")
        assert len(points) == 1

    def test_add_alerting_rule(self, system):
        rule = AlertingRule(
            name="high_cpu",
            metric_name="cpu",
            threshold=80.0,
        )
        system.add_alerting_rule(rule)
        assert "cpu" in system._alerting_rules

    def test_remove_alerting_rule(self, system):
        rule = AlertingRule(
            name="high_cpu",
            metric_name="cpu",
            threshold=80.0,
        )
        system.add_alerting_rule(rule)
        system.remove_alerting_rule("cpu")
        assert "cpu" not in system._alerting_rules

    def test_query(self, system):
        system.record("metric1", 10.0)
        system.record("metric1", 20.0)

        points = system.query("metric1")
        assert len(points) == 2

    def test_aggregate(self, system):
        system.record("metric1", 10.0)
        system.record("metric1", 20.0)
        system.record("metric1", 30.0)

        now = time.time()
        agg = system.aggregate("metric1", AggregationType.AVG, 0, now)
        assert agg.value == 20.0

    def test_get_collector(self, system):
        collector = system.get_collector()
        assert isinstance(collector, MetricsCollector)

    def test_get_aggregator(self, system):
        aggregator = system.get_aggregator()
        assert isinstance(aggregator, MetricsAggregator)

    def test_get_db(self, system):
        db = system.get_db()
        assert isinstance(db, TimeSeriesDB)

    def test_get_stats(self, system):
        stats = system.get_stats()
        assert "collector" in stats
        assert "aggregator" in stats
        assert "db" in stats

    @pytest.mark.asyncio
    async def test_start_stop(self, system):
        await system.start()
        assert system._running is True

        await system.stop()
        assert system._running is False


class TestCreateMetricsSystem:
    """Tests for factory function."""

    def test_create_with_defaults(self):
        system = create_metrics_system()
        assert isinstance(system, MetricsSystem)

    def test_create_with_namespace(self):
        system = create_metrics_system(namespace="custom")
        assert system._collector._namespace == "custom"


@pytest.fixture
def rule():
    return AlertingRule(
        name="test_rule",
        metric_name="test_metric",
        threshold=100.0,
        comparison="gt",
        duration=0.0,
    )


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
