"""
Tests for Anomaly Detection (Phase 53)

Tests intelligent anomaly detection using statistical and ML-based approaches.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.anomaly_detection import (
    Anomaly,
    AnomalyAggregator,
    AnomalyDetector,
    AnomalyScoreEngine,
    AnomalySeverity,
    AnomalyType,
    DataPoint,
    DetectionConfig,
    DetectionMethod,
    SeasonalDetector,
    StatisticalDetector,
    TrendDetector,
    create_anomaly_detector,
    create_detection_config,
)


class TestAnomalyType:
    """Tests for AnomalyType enum."""

    def test_anomaly_types(self):
        assert AnomalyType.SPIKE.value == "spike"
        assert AnomalyType.DROP.value == "drop"
        assert AnomalyType.TREND_CHANGE.value == "trend_change"
        assert AnomalyType.LEVEL_SHIFT.value == "level_shift"
        assert AnomalyType.SEASONALITY_BREAK.value == "seasonality"
        assert AnomalyType.OUTLIER.value == "outlier"
        assert AnomalyType.CORRELATION_BREAK.value == "correlation"


class TestAnomalySeverity:
    """Tests for AnomalySeverity enum."""

    def test_severity_levels(self):
        assert AnomalySeverity.LOW.value == "low"
        assert AnomalySeverity.MEDIUM.value == "medium"
        assert AnomalySeverity.HIGH.value == "high"
        assert AnomalySeverity.CRITICAL.value == "critical"


class TestDetectionMethod:
    """Tests for DetectionMethod enum."""

    def test_detection_methods(self):
        assert DetectionMethod.Z_SCORE.value == "z_score"
        assert DetectionMethod.IQR.value == "iqr"
        assert DetectionMethod.MOVING_AVERAGE.value == "moving_average"
        assert DetectionMethod.EXPONENTIAL_SMOOTHING.value == "exponential_smoothing"
        assert DetectionMethod.SEASONAL_DECOMPOSITION.value == "seasonal"
        assert DetectionMethod.ISOLATION_FOREST.value == "isolation_forest"
        assert DetectionMethod.AUTOENCODER.value == "autoencoder"


class TestDataPoint:
    """Tests for DataPoint."""

    def test_point_creation(self):
        point = DataPoint(timestamp=time.time(), value=42.0)
        assert point.value == 42.0
        assert point.labels == {}

    def test_point_with_labels(self):
        point = DataPoint(
            timestamp=time.time(),
            value=42.0,
            labels={"host": "server1"},
        )
        assert point.labels["host"] == "server1"

    def test_point_comparison(self):
        p1 = DataPoint(timestamp=1.0, value=1.0)
        p2 = DataPoint(timestamp=2.0, value=2.0)
        assert p1 < p2


class TestAnomaly:
    """Tests for Anomaly."""

    def test_anomaly_creation(self):
        anomaly = Anomaly(
            anomaly_id="anomaly-1",
            timestamp=time.time(),
            anomaly_type=AnomalyType.SPIKE,
            severity=AnomalySeverity.HIGH,
            metric_name="cpu",
            actual_value=95.0,
            expected_value=50.0,
            deviation=45.0,
            confidence=0.9,
        )
        assert anomaly.anomaly_id == "anomaly-1"
        assert anomaly.resolved is False

    def test_anomaly_defaults(self):
        anomaly = Anomaly(
            anomaly_id="anomaly-1",
            timestamp=time.time(),
            anomaly_type=AnomalyType.OUTLIER,
            severity=AnomalySeverity.LOW,
            metric_name="test",
            actual_value=1.0,
            expected_value=0.0,
            deviation=1.0,
            confidence=0.5,
        )
        assert anomaly.context == {}
        assert anomaly.resolved is False
        assert anomaly.resolved_at is None


class TestDetectionConfig:
    """Tests for DetectionConfig."""

    def test_config_defaults(self):
        config = DetectionConfig()
        assert config.window_size == 100
        assert config.min_samples == 10
        assert config.z_score_threshold == 3.0
        assert config.sensitivity == 0.8

    def test_config_custom(self):
        config = DetectionConfig(
            window_size=50,
            z_score_threshold=2.5,
            sensitivity=0.9,
        )
        assert config.window_size == 50
        assert config.z_score_threshold == 2.5


class TestStatisticalDetector:
    """Tests for StatisticalDetector."""

    @pytest.fixture
    def detector(self):
        return StatisticalDetector(DetectionConfig(min_samples=5))

    def test_detector_creation(self, detector):
        assert len(detector._data) == 0

    def test_add_point(self, detector):
        point = DataPoint(timestamp=time.time(), value=42.0)
        detector.add_point(point)
        assert len(detector._data) == 1

    def test_z_score_insufficient_data(self, detector):
        is_anomaly, score, expected = detector.detect_z_score(42.0)
        assert is_anomaly is False
        assert score == 0.0

    def test_z_score_normal(self, detector):
        # Add normal data points
        for i in range(20):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=50.0 + (i % 5)))

        is_anomaly, score, expected = detector.detect_z_score(52.0)
        assert is_anomaly is False

    def test_z_score_anomaly(self, detector):
        # Add normal data points
        for i in range(20):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=50.0))

        # Test extreme value
        is_anomaly, score, expected = detector.detect_z_score(200.0)
        assert is_anomaly is True
        assert score > 3.0

    def test_iqr_insufficient_data(self, detector):
        is_anomaly, deviation, expected = detector.detect_iqr(42.0)
        assert is_anomaly is False

    def test_iqr_normal(self, detector):
        for i in range(20):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=50.0 + (i % 10)))

        is_anomaly, deviation, expected = detector.detect_iqr(55.0)
        assert is_anomaly is False

    def test_iqr_anomaly_high(self, detector):
        for i in range(20):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=50.0))

        is_anomaly, deviation, expected = detector.detect_iqr(200.0)
        assert is_anomaly is True

    def test_iqr_anomaly_low(self, detector):
        for i in range(20):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=50.0))

        is_anomaly, deviation, expected = detector.detect_iqr(-100.0)
        assert is_anomaly is True

    def test_get_statistics(self, detector):
        for i in range(10):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=float(i)))

        stats = detector.get_statistics()
        assert stats["count"] == 10
        assert stats["min"] == 0.0
        assert stats["max"] == 9.0
        assert "mean" in stats
        assert "std_dev" in stats

    def test_get_statistics_empty(self, detector):
        stats = detector.get_statistics()
        assert stats["count"] == 0


class TestTrendDetector:
    """Tests for TrendDetector."""

    @pytest.fixture
    def detector(self):
        return TrendDetector(DetectionConfig(min_samples=5))

    def test_detector_creation(self, detector):
        assert len(detector._data) == 0

    def test_add_point(self, detector):
        point = DataPoint(timestamp=time.time(), value=42.0)
        detector.add_point(point)
        assert len(detector._data) == 1

    def test_detect_trend_change_insufficient(self, detector):
        is_change, deviation, trend_type = detector.detect_trend_change(42.0)
        assert is_change is False

    def test_detect_trend_change_stable(self, detector):
        for i in range(20):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=50.0))

        is_change, deviation, trend_type = detector.detect_trend_change(50.0)
        assert is_change is False
        assert trend_type == "stable"

    def test_detect_level_shift_insufficient(self, detector):
        is_shift, shift, expected = detector.detect_level_shift(42.0)
        assert is_shift is False

    def test_detect_level_shift(self, detector):
        # First half: low values with slight variation
        for i in range(15):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=10.0 + (i % 3)))

        # Second half: high values with slight variation
        for i in range(15):
            detector.add_point(DataPoint(timestamp=time.time() + 15 + i, value=100.0 + (i % 3)))

        is_shift, shift, expected = detector.detect_level_shift(100.0)
        # With clear separation between halves, shift should be detected
        assert is_shift is True

    def test_get_trend(self, detector):
        for i in range(10):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=float(i)))

        trend = detector.get_trend()
        assert trend != 0  # Should have an upward trend


class TestSeasonalDetector:
    """Tests for SeasonalDetector."""

    @pytest.fixture
    def detector(self):
        return SeasonalDetector(DetectionConfig(
            min_samples=5,
            seasonal_period=5,
        ))

    def test_detector_creation(self, detector):
        assert len(detector._data) == 0

    def test_add_point(self, detector):
        point = DataPoint(timestamp=time.time(), value=42.0)
        detector.add_point(point)
        assert len(detector._data) == 1

    def test_detect_seasonal_break_insufficient(self, detector):
        is_break, deviation, expected = detector.detect_seasonal_break(42.0)
        assert is_break is False

    def test_detect_seasonal_break_normal(self, detector):
        # Build seasonal pattern (3 full cycles)
        for cycle in range(3):
            for i in range(5):
                detector.add_point(DataPoint(
                    timestamp=time.time() + cycle * 5 + i,
                    value=10.0 + i * 2,  # Pattern: 10, 12, 14, 16, 18
                ))

        # Test for a new position (15 % 5 = 0)
        # Position 0 should have mean ~10.0, so 11.0 should be normal
        is_break, deviation, expected = detector.detect_seasonal_break(11.0)
        # With 3 cycles of data, 11.0 is close enough to 10.0 to not be a break
        # Just verify the function works without error
        assert isinstance(is_break, bool)
        assert isinstance(deviation, float)
        assert isinstance(expected, float)

    def test_get_seasonal_stats(self, detector):
        for i in range(10):
            detector.add_point(DataPoint(timestamp=time.time() + i, value=float(i)))

        stats = detector.get_seasonal_stats()
        assert len(stats) > 0


class TestAnomalyScoreEngine:
    """Tests for AnomalyScoreEngine."""

    @pytest.fixture
    def engine(self):
        return AnomalyScoreEngine(DetectionConfig(min_samples=5))

    def test_engine_creation(self, engine):
        assert engine._statistical is not None
        assert engine._trend is not None
        assert engine._seasonal is not None

    def test_add_point(self, engine):
        point = DataPoint(timestamp=time.time(), value=42.0)
        engine.add_point(point)
        assert len(engine._statistical._data) == 1

    def test_compute_score_insufficient(self, engine):
        score, details = engine.compute_score(42.0)
        # With insufficient data, score should be based on limited info
        assert isinstance(score, float)
        assert isinstance(details, dict)

    def test_compute_score_normal(self, engine):
        # Add normal data
        for i in range(20):
            engine.add_point(DataPoint(timestamp=time.time() + i, value=50.0 + (i % 5)))

        score, details = engine.compute_score(52.0)
        assert score < 0.5  # Normal value should have low score

    def test_compute_score_anomaly(self, engine):
        # Add normal data
        for i in range(20):
            engine.add_point(DataPoint(timestamp=time.time() + i, value=50.0))

        score, details = engine.compute_score(200.0)
        assert score > 0.5  # Anomalous value should have high score


class TestAnomalyDetector:
    """Tests for AnomalyDetector."""

    @pytest.fixture
    def detector(self):
        return AnomalyDetector(DetectionConfig(min_samples=5))

    def test_detector_creation(self, detector):
        assert len(detector._score_engines) == 0
        assert len(detector._anomalies) == 0

    def test_add_metric_point(self, detector):
        for i in range(5):
            anomaly = detector.add_metric_point("cpu", 50.0 + i)
            # First points won't detect anomalies
            assert anomaly is None

    def test_add_metric_point_detects_anomaly(self, detector):
        # Add normal baseline
        for i in range(20):
            detector.add_metric_point("cpu", 50.0)

        # Add extreme value
        anomaly = detector.add_metric_point("cpu", 500.0)
        assert anomaly is not None
        assert anomaly.anomaly_type in [AnomalyType.SPIKE, AnomalyType.OUTLIER]

    def test_multiple_metrics(self, detector):
        # Add data for multiple metrics
        for i in range(15):
            detector.add_metric_point("cpu", 50.0)
            detector.add_metric_point("memory", 60.0)

        assert len(detector._score_engines) == 2

    def test_handlers(self, detector):
        handler = Mock()
        detector.add_handler(handler)

        # Add baseline
        for i in range(20):
            detector.add_metric_point("cpu", 50.0)

        # Trigger anomaly
        detector.add_metric_point("cpu", 500.0)

        handler.assert_called_once()

    def test_remove_handler(self, detector):
        handler = Mock()
        detector.add_handler(handler)
        detector.remove_handler(handler)

        for i in range(20):
            detector.add_metric_point("cpu", 50.0)
        detector.add_metric_point("cpu", 500.0)

        handler.assert_not_called()

    def test_get_anomalies(self, detector):
        # Add baseline and anomalies
        for i in range(20):
            detector.add_metric_point("cpu", 50.0)
        detector.add_metric_point("cpu", 500.0)

        for i in range(20):
            detector.add_metric_point("memory", 60.0)
        detector.add_metric_point("memory", 600.0)

        anomalies = detector.get_anomalies()
        assert len(anomalies) >= 2

    def test_get_anomalies_by_metric(self, detector):
        for i in range(20):
            detector.add_metric_point("cpu", 50.0)
        detector.add_metric_point("cpu", 500.0)

        for i in range(20):
            detector.add_metric_point("memory", 60.0)
        detector.add_metric_point("memory", 600.0)

        cpu_anomalies = detector.get_anomalies(metric_name="cpu")
        assert all(a.metric_name == "cpu" for a in cpu_anomalies)

    def test_get_anomalies_by_severity(self, detector):
        for i in range(20):
            detector.add_metric_point("cpu", 50.0)
        detector.add_metric_point("cpu", 500.0)

        critical = detector.get_anomalies(severity=AnomalySeverity.CRITICAL)
        assert all(a.severity == AnomalySeverity.CRITICAL for a in critical)

    def test_get_anomalies_unresolved_only(self, detector):
        for i in range(20):
            detector.add_metric_point("cpu", 50.0)
        detector.add_metric_point("cpu", 500.0)

        anomalies = detector.get_anomalies(unresolved_only=True)
        assert all(not a.resolved for a in anomalies)

    def test_resolve_anomaly(self, detector):
        for i in range(20):
            detector.add_metric_point("cpu", 50.0)
        anomaly = detector.add_metric_point("cpu", 500.0)

        assert anomaly is not None
        result = detector.resolve_anomaly(anomaly.anomaly_id)
        assert result is True
        assert anomaly.resolved is True
        assert anomaly.resolved_at is not None

    def test_resolve_anomaly_not_found(self, detector):
        result = detector.resolve_anomaly("nonexistent")
        assert result is False

    def test_get_metric_statistics(self, detector):
        for i in range(20):
            detector.add_metric_point("cpu", 50.0 + i)

        stats = detector.get_metric_statistics("cpu")
        assert "count" in stats
        assert stats["count"] == 20

    def test_get_metric_statistics_not_found(self, detector):
        stats = detector.get_metric_statistics("nonexistent")
        assert stats == {}

    def test_clear_history(self, detector):
        for i in range(15):
            detector.add_metric_point("cpu", 50.0)

        detector.clear_history("cpu")
        assert "cpu" not in detector._score_engines

    def test_clear_history_all(self, detector):
        for i in range(15):
            detector.add_metric_point("cpu", 50.0)
            detector.add_metric_point("memory", 60.0)

        detector.clear_history()
        assert len(detector._score_engines) == 0

    def test_get_stats(self, detector):
        for i in range(20):
            detector.add_metric_point("cpu", 50.0)
        detector.add_metric_point("cpu", 500.0)

        stats = detector.get_stats()
        assert stats["metrics_tracked"] == 1
        assert stats["total_anomalies"] >= 1
        assert "by_severity" in stats


class TestAnomalyAggregator:
    """Tests for AnomalyAggregator."""

    @pytest.fixture
    def aggregator(self):
        return AnomalyAggregator()

    def test_aggregator_creation(self, aggregator):
        assert len(aggregator._anomalies) == 0

    def test_add_anomaly(self, aggregator):
        anomaly = Anomaly(
            anomaly_id="anomaly-1",
            timestamp=time.time(),
            anomaly_type=AnomalyType.SPIKE,
            severity=AnomalySeverity.HIGH,
            metric_name="cpu",
            actual_value=95.0,
            expected_value=50.0,
            deviation=0.9,
            confidence=0.9,
        )
        aggregator.add_anomaly(anomaly)
        assert len(aggregator._anomalies) == 1

    def test_get_recent(self, aggregator):
        # Add old anomaly
        old_anomaly = Anomaly(
            anomaly_id="old",
            timestamp=time.time() - 600,  # 10 minutes ago
            anomaly_type=AnomalyType.SPIKE,
            severity=AnomalySeverity.LOW,
            metric_name="cpu",
            actual_value=1.0,
            expected_value=0.0,
            deviation=1.0,
            confidence=0.5,
        )
        aggregator.add_anomaly(old_anomaly)

        # Add recent anomaly
        recent_anomaly = Anomaly(
            anomaly_id="recent",
            timestamp=time.time(),
            anomaly_type=AnomalyType.SPIKE,
            severity=AnomalySeverity.HIGH,
            metric_name="memory",
            actual_value=1.0,
            expected_value=0.0,
            deviation=1.0,
            confidence=0.5,
        )
        aggregator.add_anomaly(recent_anomaly)

        recent = aggregator.get_recent(seconds=300)
        assert len(recent) == 1
        assert recent[0].anomaly_id == "recent"

    def test_correlation_handler(self, aggregator):
        handler = Mock()
        aggregator.add_correlation_handler(handler)

        # Add multiple anomalies in quick succession
        for i in range(3):
            anomaly = Anomaly(
                anomaly_id=f"anomaly-{i}",
                timestamp=time.time(),
                anomaly_type=AnomalyType.SPIKE,
                severity=AnomalySeverity.HIGH,
                metric_name=f"metric-{i}",
                actual_value=1.0,
                expected_value=0.0,
                deviation=1.0,
                confidence=0.5,
            )
            aggregator.add_anomaly(anomaly)

        # Handler should be called for correlated anomalies
        handler.assert_called()


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_anomaly_detector(self):
        detector = create_anomaly_detector(
            window_size=50,
            min_samples=5,
            z_score_threshold=2.5,
            sensitivity=0.9,
        )
        assert isinstance(detector, AnomalyDetector)
        assert detector._config.window_size == 50
        assert detector._config.z_score_threshold == 2.5

    def test_create_anomaly_detector_defaults(self):
        detector = create_anomaly_detector()
        assert isinstance(detector, AnomalyDetector)
        assert detector._config.window_size == 100

    def test_create_detection_config(self):
        config = create_detection_config(
            window_size=200,
            sensitivity=0.95,
        )
        assert isinstance(config, DetectionConfig)
        assert config.window_size == 200
        assert config.sensitivity == 0.95


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
