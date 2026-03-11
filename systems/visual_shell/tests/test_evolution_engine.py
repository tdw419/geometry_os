"""
Tests for Phase 59: Evolution Engine

Comprehensive tests for self-improvement through feedback loops
and experimentation.
"""

from datetime import datetime
from unittest.mock import AsyncMock, patch

import pytest

from systems.visual_shell.evolution_engine import (
    ABTest,
    ABTestConfig,
    ABTestManager,
    ABTestResult,
    ABTestVariant,
    EvolutionMetrics,
    Experiment,
    ExperimentConfig,
    ExperimentResult,
    # Classes
    ExperimentRunner,
    # Enums
    ExperimentStatus,
    ExperimentType,
    MetricComparison,
    MetricSample,
    # Dataclasses
    MetricThreshold,
    RegressionAlert,
    RegressionDetector,
    RegressionType,
    RollbackReason,
    create_ab_test_config,
    create_evolution_engine,
    create_experiment_config,
    # Factory functions
    create_metric_threshold,
    create_regression_detector,
)


class TestEnums:
    """Test enum definitions."""

    def test_experiment_status_values(self):
        assert ExperimentStatus.PROPOSED.value == "proposed"
        assert ExperimentStatus.RUNNING.value == "running"
        assert ExperimentStatus.COMPLETED.value == "completed"
        assert ExperimentStatus.ROLLED_BACK.value == "rolled_back"
        assert ExperimentStatus.FAILED.value == "failed"

    def test_experiment_type_values(self):
        assert ExperimentType.CONFIGURATION.value == "configuration"
        assert ExperimentType.PLACEMENT.value == "placement"
        assert ExperimentType.SCALING.value == "scaling"
        assert ExperimentType.MIGRATION.value == "migration"
        assert ExperimentType.SCHEDULING.value == "scheduling"

    def test_rollback_reason_values(self):
        assert RollbackReason.PERFORMANCE_DEGRADATION.value == "performance_degradation"
        assert RollbackReason.ERROR_RATE_INCREASE.value == "error_rate_increase"
        assert RollbackReason.COST_OVERRUN.value == "cost_overrun"
        assert RollbackReason.MANUAL_TRIGGER.value == "manual_trigger"
        assert RollbackReason.TIMEOUT.value == "timeout"
        assert RollbackReason.SAFETY_VIOLATION.value == "safety_violation"

    def test_metric_comparison_values(self):
        assert MetricComparison.LOWER_IS_BETTER.value == "lower_is_better"
        assert MetricComparison.HIGHER_IS_BETTER.value == "higher_is_better"
        assert MetricComparison.TARGET_VALUE.value == "target_value"

    def test_regression_type_values(self):
        assert RegressionType.LATENCY_INCREASE.value == "latency_increase"
        assert RegressionType.THROUGHPUT_DECREASE.value == "throughput_decrease"
        assert RegressionType.ERROR_RATE_INCREASE.value == "error_rate_increase"
        assert RegressionType.RESOURCE_USAGE_INCREASE.value == "resource_usage_increase"
        assert RegressionType.AVAILABILITY_DECREASE.value == "availability_decrease"


class TestMetricThreshold:
    """Test MetricThreshold dataclass."""

    def test_create_metric_threshold(self):
        threshold = MetricThreshold(
            metric_name="latency_p99",
            comparison=MetricComparison.LOWER_IS_BETTER,
            baseline_value=100.0,
            degradation_threshold=20.0,
            improvement_threshold=5.0
        )
        assert threshold.metric_name == "latency_p99"
        assert threshold.comparison == MetricComparison.LOWER_IS_BETTER
        assert threshold.baseline_value == 100.0
        assert threshold.degradation_threshold == 20.0
        assert threshold.improvement_threshold == 5.0

    def test_create_metric_threshold_factory(self):
        threshold = create_metric_threshold(
            metric_name="throughput",
            comparison=MetricComparison.HIGHER_IS_BETTER,
            baseline_value=1000.0
        )
        assert threshold.metric_name == "throughput"
        assert threshold.comparison == MetricComparison.HIGHER_IS_BETTER
        assert threshold.baseline_value == 1000.0
        assert threshold.degradation_threshold == 20.0  # default


class TestExperimentConfig:
    """Test ExperimentConfig dataclass."""

    def test_create_experiment_config(self):
        config = ExperimentConfig(
            experiment_type=ExperimentType.CONFIGURATION,
            target_component="cache",
            change_description="Increase cache size",
            baseline_config={"size": 100},
            experiment_config={"size": 200}
        )
        assert config.experiment_type == ExperimentType.CONFIGURATION
        assert config.target_component == "cache"
        assert config.duration_seconds == 300  # default
        assert config.rollback_on_degradation is True

    def test_create_experiment_config_factory(self):
        config = create_experiment_config(
            experiment_type=ExperimentType.SCALING,
            target_component="web-service",
            change_description="Scale to 3 replicas",
            baseline_config={"replicas": 2},
            experiment_config={"replicas": 3},
            duration_seconds=600
        )
        assert config.experiment_type == ExperimentType.SCALING
        assert config.target_component == "web-service"
        assert config.duration_seconds == 600


class TestMetricSample:
    """Test MetricSample dataclass."""

    def test_create_metric_sample(self):
        sample = MetricSample(
            timestamp=datetime.now(),
            metric_name="latency_p99",
            value=50.0,
            source="baseline"
        )
        assert sample.metric_name == "latency_p99"
        assert sample.value == 50.0
        assert sample.source == "baseline"


class TestExperimentResult:
    """Test ExperimentResult dataclass."""

    def test_create_experiment_result(self):
        result = ExperimentResult(
            experiment_id="exp-123",
            status=ExperimentStatus.COMPLETED,
            started_at=datetime.now(),
            ended_at=datetime.now(),
            baseline_samples=[],
            experiment_samples=[],
            statistical_significance=0.95,
            improvement_percentage=10.0,
            recommendation="Good improvement"
        )
        assert result.experiment_id == "exp-123"
        assert result.status == ExperimentStatus.COMPLETED
        assert result.improvement_percentage == 10.0
        assert result.rollback_reason is None


class TestExperiment:
    """Test Experiment dataclass."""

    def test_create_experiment(self):
        config = create_experiment_config(
            experiment_type=ExperimentType.CONFIGURATION,
            target_component="db",
            change_description="Connection pool tuning",
            baseline_config={"pool_size": 10},
            experiment_config={"pool_size": 20}
        )
        experiment = Experiment(
            id="exp-001",
            config=config,
            status=ExperimentStatus.PROPOSED,
            created_at=datetime.now()
        )
        assert experiment.id == "exp-001"
        assert experiment.status == ExperimentStatus.PROPOSED
        assert experiment.started_at is None
        assert experiment.baseline_samples == []


class TestABTestConfig:
    """Test ABTestConfig dataclass."""

    def test_create_ab_test_config(self):
        config = ABTestConfig(
            name="cache-algorithm-test",
            variant_a_config={"algorithm": "lru"},
            variant_b_config={"algorithm": "lfu"},
            traffic_split=0.5
        )
        assert config.name == "cache-algorithm-test"
        assert config.traffic_split == 0.5
        assert config.minimum_sample_size == 100  # default

    def test_create_ab_test_config_factory(self):
        config = create_ab_test_config(
            name="routing-test",
            variant_a_config={"strategy": "round_robin"},
            variant_b_config={"strategy": "least_connections"},
            success_metric="response_time",
            traffic_split=0.3
        )
        assert config.name == "routing-test"
        assert config.success_metric == "response_time"
        assert config.traffic_split == 0.3


class TestABTestVariant:
    """Test ABTestVariant dataclass."""

    def test_create_variant(self):
        variant = ABTestVariant(
            name="A",
            config={"strategy": "round_robin"}
        )
        assert variant.name == "A"
        assert variant.sample_count == 0
        assert variant.mean == 0.0

    def test_variant_statistics(self):
        variant = ABTestVariant(name="A", config={})
        variant.sample_count = 3
        variant.metric_sum = 30.0
        variant.metric_squared_sum = 350.0

        assert variant.mean == 10.0
        assert variant.variance == 25.0

    def test_variant_mean_empty(self):
        variant = ABTestVariant(name="A", config={})
        assert variant.mean == 0.0

    def test_variant_variance_single_sample(self):
        variant = ABTestVariant(name="A", config={})
        variant.sample_count = 1
        assert variant.variance == 0.0


class TestABTestResult:
    """Test ABTestResult dataclass."""

    def test_create_ab_test_result(self):
        variant_a = ABTestVariant(name="A", config={})
        variant_b = ABTestVariant(name="B", config={})
        result = ABTestResult(
            test_id="test-123",
            variant_a=variant_a,
            variant_b=variant_b,
            winner="B",
            confidence=0.95,
            improvement=15.0,
            is_significant=True
        )
        assert result.test_id == "test-123"
        assert result.winner == "B"
        assert result.is_significant is True


class TestABTest:
    """Test ABTest dataclass."""

    def test_create_ab_test(self):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = ABTest(
            id="ab-001",
            config=config,
            variant_a=ABTestVariant(name="A", config={}),
            variant_b=ABTestVariant(name="B", config={}),
            created_at=datetime.now()
        )
        assert test.id == "ab-001"
        assert test.active is True
        assert test.result is None


class TestRegressionAlert:
    """Test RegressionAlert dataclass."""

    def test_create_regression_alert(self):
        alert = RegressionAlert(
            id="alert-001",
            regression_type=RegressionType.LATENCY_INCREASE,
            metric_name="latency_p99",
            baseline_value=100.0,
            current_value=150.0,
            change_percentage=50.0,
            detected_at=datetime.now(),
            severity="high",
            affected_components=["web-service"],
            suggested_action="Scale up"
        )
        assert alert.id == "alert-001"
        assert alert.regression_type == RegressionType.LATENCY_INCREASE
        assert alert.change_percentage == 50.0


class TestRegressionDetector:
    """Test RegressionDetector class."""

    def test_create_detector(self):
        detector = RegressionDetector(
            name="main",
            metrics_to_monitor=["latency", "errors"]
        )
        assert detector.name == "main"
        assert len(detector.metrics_to_monitor) == 2
        assert detector.detection_threshold == 20.0

    def test_create_detector_factory(self):
        detector = create_regression_detector(
            name="custom",
            metrics_to_monitor=["cpu", "memory"],
            detection_threshold=15.0
        )
        assert detector.name == "custom"
        assert detector.detection_threshold == 15.0

    def test_detect_latency_regression(self):
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["latency_p99"]
        )
        alert = detector.check_for_regression(
            metric_name="latency_p99",
            baseline_value=100.0,
            current_value=160.0,  # 60% increase
            component="api"
        )
        assert alert is not None
        assert alert.regression_type == RegressionType.LATENCY_INCREASE
        assert alert.severity == "high"

    def test_no_latency_regression(self):
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["latency_p99"]
        )
        alert = detector.check_for_regression(
            metric_name="latency_p99",
            baseline_value=100.0,
            current_value=110.0,  # 10% increase, below threshold
            component="api"
        )
        assert alert is None

    def test_detect_throughput_regression(self):
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["throughput"]
        )
        alert = detector.check_for_regression(
            metric_name="throughput",
            baseline_value=1000.0,
            current_value=700.0,  # 30% decrease
            component="api"
        )
        assert alert is not None
        assert alert.regression_type == RegressionType.THROUGHPUT_DECREASE

    def test_detect_error_rate_regression(self):
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["error_rate"]
        )
        alert = detector.check_for_regression(
            metric_name="error_rate",
            baseline_value=1.0,
            current_value=3.0,  # 200% increase
            component="api"
        )
        assert alert is not None
        assert alert.regression_type == RegressionType.ERROR_RATE_INCREASE
        assert alert.severity == "critical"

    def test_detect_resource_regression(self):
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["cpu_usage"],
            detection_threshold=20.0
        )
        alert = detector.check_for_regression(
            metric_name="cpu_usage",
            baseline_value=50.0,
            current_value=80.0,  # 60% increase, above 1.5x threshold
            component="worker"
        )
        assert alert is not None
        assert alert.regression_type == RegressionType.RESOURCE_USAGE_INCREASE

    def test_detect_availability_regression(self):
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["availability"]
        )
        alert = detector.check_for_regression(
            metric_name="availability",
            baseline_value=99.9,
            current_value=97.0,  # ~3% decrease, triggers sensitive threshold
            component="service"
        )
        assert alert is not None
        assert alert.regression_type == RegressionType.AVAILABILITY_DECREASE

    def test_no_regression_zero_baseline(self):
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["new_metric"]
        )
        alert = detector.check_for_regression(
            metric_name="new_metric",
            baseline_value=0.0,
            current_value=100.0,
            component="api"
        )
        assert alert is None

    def test_suggest_action_critical(self):
        detector = RegressionDetector(name="test", metrics_to_monitor=[])
        action = detector._suggest_action(
            RegressionType.LATENCY_INCREASE,
            "critical"
        )
        assert "URGENT" in action

    def test_alerts_accumulate(self):
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["latency"]
        )
        detector.check_for_regression("latency", 100.0, 150.0, "api")
        detector.check_for_regression("latency", 100.0, 160.0, "api")
        assert len(detector.alerts) == 2


class TestEvolutionMetrics:
    """Test EvolutionMetrics class."""

    def test_create_metrics(self):
        metrics = EvolutionMetrics()
        assert metrics.total_experiments == 0
        assert metrics.successful_experiments == 0
        assert metrics.average_improvement == 0.0

    def test_record_successful_experiment(self):
        metrics = EvolutionMetrics()
        result = ExperimentResult(
            experiment_id="exp-1",
            status=ExperimentStatus.COMPLETED,
            started_at=datetime.now(),
            ended_at=datetime.now(),
            baseline_samples=[],
            experiment_samples=[],
            statistical_significance=0.95,
            improvement_percentage=10.0
        )
        metrics.record_experiment(result)
        assert metrics.total_experiments == 1
        assert metrics.successful_experiments == 1
        assert metrics.average_improvement == 10.0

    def test_record_rolled_back_experiment(self):
        metrics = EvolutionMetrics()
        result = ExperimentResult(
            experiment_id="exp-1",
            status=ExperimentStatus.ROLLED_BACK,
            started_at=datetime.now(),
            ended_at=datetime.now(),
            baseline_samples=[],
            experiment_samples=[],
            statistical_significance=0.8,
            improvement_percentage=-15.0,
            rollback_reason=RollbackReason.PERFORMANCE_DEGRADATION
        )
        metrics.record_experiment(result)
        assert metrics.rolled_back_experiments == 1
        assert metrics.regressions_prevented == 1

    def test_record_failed_experiment(self):
        metrics = EvolutionMetrics()
        result = ExperimentResult(
            experiment_id="exp-1",
            status=ExperimentStatus.FAILED,
            started_at=datetime.now(),
            ended_at=datetime.now(),
            baseline_samples=[],
            experiment_samples=[],
            statistical_significance=0.0,
            improvement_percentage=0.0
        )
        metrics.record_experiment(result)
        assert metrics.failed_experiments == 1

    def test_record_ab_test(self):
        metrics = EvolutionMetrics()
        result = ABTestResult(
            test_id="test-1",
            variant_a=ABTestVariant(name="A", config={}),
            variant_b=ABTestVariant(name="B", config={}),
            is_significant=True
        )
        metrics.record_ab_test(result)
        assert metrics.total_ab_tests == 1
        assert metrics.significant_ab_tests == 1

    def test_record_regression(self):
        metrics = EvolutionMetrics()
        alert = RegressionAlert(
            id="alert-1",
            regression_type=RegressionType.LATENCY_INCREASE,
            metric_name="latency",
            baseline_value=100.0,
            current_value=150.0,
            change_percentage=50.0,
            detected_at=datetime.now(),
            severity="high",
            affected_components=["api"],
            suggested_action="Scale"
        )
        metrics.record_regression(alert)
        assert metrics.regressions_detected == 1

    def test_success_rate(self):
        metrics = EvolutionMetrics()
        metrics.total_experiments = 10
        metrics.successful_experiments = 8
        assert metrics.success_rate == 0.8

    def test_success_rate_zero(self):
        metrics = EvolutionMetrics()
        assert metrics.success_rate == 0.0

    def test_rollback_rate(self):
        metrics = EvolutionMetrics()
        metrics.total_experiments = 10
        metrics.rolled_back_experiments = 2
        assert metrics.rollback_rate == 0.2

    def test_average_improvement_multiple(self):
        metrics = EvolutionMetrics()

        # Record multiple experiments
        for imp in [10.0, 20.0, 15.0]:
            result = ExperimentResult(
                experiment_id=f"exp-{imp}",
                status=ExperimentStatus.COMPLETED,
                started_at=datetime.now(),
                ended_at=datetime.now(),
                baseline_samples=[],
                experiment_samples=[],
                statistical_significance=0.9,
                improvement_percentage=imp
            )
            metrics.record_experiment(result)

        assert metrics.average_improvement == 15.0


class TestExperimentRunner:
    """Test ExperimentRunner class."""

    @pytest.fixture
    def runner(self):
        detector = RegressionDetector(name="test", metrics_to_monitor=[])
        return ExperimentRunner(detector)

    def test_create_runner(self, runner):
        assert runner.experiments == {}
        assert runner.metric_thresholds == []

    def test_register_metric_collector(self, runner):
        runner.register_metric_collector("latency", lambda: 50.0)
        assert "latency" in runner._metric_collectors

    def test_add_threshold(self, runner):
        threshold = create_metric_threshold(
            "latency",
            MetricComparison.LOWER_IS_BETTER,
            100.0
        )
        runner.add_threshold(threshold)
        assert len(runner.metric_thresholds) == 1

    @pytest.mark.asyncio
    async def test_propose_experiment(self, runner):
        config = create_experiment_config(
            experiment_type=ExperimentType.CONFIGURATION,
            target_component="cache",
            change_description="Test config",
            baseline_config={"size": 100},
            experiment_config={"size": 200}
        )
        experiment = await runner.propose_experiment(config)
        assert experiment.status == ExperimentStatus.PROPOSED
        assert experiment.id in runner.experiments

    @pytest.mark.asyncio
    async def test_run_experiment_not_found(self, runner):
        with pytest.raises(ValueError, match="not found"):
            await runner.run_experiment(
                "nonexistent",
                lambda x: None,
                lambda x: None
            )

    @pytest.mark.asyncio
    async def test_run_experiment_wrong_status(self, runner):
        config = create_experiment_config(
            experiment_type=ExperimentType.CONFIGURATION,
            target_component="cache",
            change_description="Test",
            baseline_config={},
            experiment_config={}
        )
        experiment = Experiment(
            id="exp-001",
            config=config,
            status=ExperimentStatus.RUNNING,  # Wrong status
            created_at=datetime.now()
        )
        runner.experiments["exp-001"] = experiment

        with pytest.raises(ValueError, match="not in PROPOSED state"):
            await runner.run_experiment(
                "exp-001",
                lambda x: None,
                lambda x: None
            )


class TestABTestManager:
    """Test ABTestManager class."""

    @pytest.fixture
    def manager(self):
        return ABTestManager()

    def test_create_manager(self, manager):
        assert manager.tests == {}

    def test_create_test(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={"a": 1},
            variant_b_config={"b": 2}
        )
        test = manager.create_test(config)
        assert test.id in manager.tests
        assert test.variant_a.name == "A"
        assert test.variant_b.name == "B"

    def test_start_test(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = manager.create_test(config)
        manager.start_test(test.id)
        assert test.started_at is not None

    def test_assign_variant(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={},
            traffic_split=0.5
        )
        test = manager.create_test(config)
        manager.start_test(test.id)

        # Assign multiple entities
        variants = [manager.assign_variant(test.id, f"user-{i}") for i in range(100)]

        # Should have some of each variant with 50/50 split
        assert "A" in variants
        assert "B" in variants

    def test_assign_variant_consistent(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = manager.create_test(config)
        manager.start_test(test.id)

        # Same entity should get same variant
        v1 = manager.assign_variant(test.id, "user-1")
        v2 = manager.assign_variant(test.id, "user-1")
        assert v1 == v2

    def test_assign_variant_inactive_test(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = manager.create_test(config)
        # Don't start test

        variant = manager.assign_variant(test.id, "user-1")
        assert variant == "A"  # Default to control

    def test_get_variant_config(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={"strategy": "round_robin"},
            variant_b_config={"strategy": "least_connections"}
        )
        test = manager.create_test(config)

        a_config = manager.get_variant_config(test.id, "A")
        assert a_config["strategy"] == "round_robin"

        b_config = manager.get_variant_config(test.id, "B")
        assert b_config["strategy"] == "least_connections"

    def test_record_metric(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = manager.create_test(config)

        manager.record_metric(test.id, "A", 100.0)
        manager.record_metric(test.id, "A", 200.0)
        manager.record_metric(test.id, "B", 150.0)

        assert test.variant_a.sample_count == 2
        assert test.variant_a.metric_sum == 300.0
        assert test.variant_b.sample_count == 1

    def test_record_conversion(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = manager.create_test(config)

        manager.record_metric(test.id, "A", 100.0, is_conversion=True)
        assert test.variant_a.conversions == 1

    def test_analyze_test(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={},
            significance_threshold=0.1
        )
        test = manager.create_test(config)

        # Record metrics with clear difference
        for _ in range(50):
            manager.record_metric(test.id, "A", 100.0)
            manager.record_metric(test.id, "B", 80.0)  # Better (lower latency)

        result = manager.analyze_test(test.id)
        assert result.test_id == test.id
        assert result.improvement < 0  # B is better (lower is better for latency)

    def test_analyze_test_not_found(self, manager):
        with pytest.raises(ValueError, match="not found"):
            manager.analyze_test("nonexistent")

    def test_stop_test(self, manager):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = manager.create_test(config)
        assert test.active is True

        manager.stop_test(test.id)
        assert test.active is False


class TestEvolutionEngine:
    """Test EvolutionEngine class."""

    @pytest.fixture
    def engine(self):
        return create_evolution_engine()

    def test_create_engine(self, engine):
        assert engine.regression_detector is not None
        assert engine.experiment_runner is not None
        assert engine.ab_test_manager is not None
        assert engine.metrics is not None

    def test_register_metric(self, engine):
        engine.register_metric("latency", lambda: 50.0)
        assert "latency" in engine.experiment_runner._metric_collectors
        assert "latency" in engine.regression_detector.metrics_to_monitor

    def test_register_metric_with_threshold(self, engine):
        threshold = create_metric_threshold(
            "latency",
            MetricComparison.LOWER_IS_BETTER,
            100.0
        )
        engine.register_metric("latency", lambda: 50.0, threshold)
        assert len(engine.experiment_runner.metric_thresholds) == 1

    @pytest.mark.asyncio
    async def test_run_experiment(self, engine):
        config = create_experiment_config(
            experiment_type=ExperimentType.CONFIGURATION,
            target_component="cache",
            change_description="Test",
            baseline_config={"size": 100},
            experiment_config={"size": 200},
            duration_seconds=1  # Short for testing
        )

        # Mock fast metric collection
        engine.register_metric("latency", lambda: 50.0)

        # Mock time.sleep to speed up test
        with patch('asyncio.sleep', new_callable=AsyncMock):
            result = await engine.run_experiment(
                config,
                lambda x: None,  # apply
                lambda x: None   # rollback
            )

        assert result.experiment_id is not None
        assert engine.metrics.total_experiments == 1

    def test_create_ab_test(self, engine):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = engine.create_ab_test(config)
        assert test.id in engine.ab_test_manager.tests

    def test_start_ab_test(self, engine):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = engine.create_ab_test(config)
        engine.start_ab_test(test.id)
        assert test.started_at is not None

    def test_assign_ab_variant(self, engine):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = engine.create_ab_test(config)
        engine.start_ab_test(test.id)

        variant = engine.assign_ab_variant(test.id, "user-1")
        assert variant in ["A", "B"]

    def test_record_ab_metric(self, engine):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = engine.create_ab_test(config)

        engine.record_ab_metric(test.id, "A", 100.0)
        assert test.variant_a.sample_count == 1

    def test_analyze_ab_test(self, engine):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = engine.create_ab_test(config)

        # Record some metrics
        for _ in range(10):
            engine.record_ab_metric(test.id, "A", 100.0)
            engine.record_ab_metric(test.id, "B", 90.0)

        result = engine.analyze_ab_test(test.id)
        assert result.test_id == test.id
        assert engine.metrics.total_ab_tests == 1

    def test_check_regression(self, engine):
        alert = engine.check_regression(
            metric_name="latency_p99",
            baseline_value=100.0,
            current_value=150.0,
            component="api"
        )
        assert alert is not None
        assert engine.metrics.regressions_detected == 1

    def test_get_metrics(self, engine):
        metrics = engine.get_metrics()
        assert isinstance(metrics, EvolutionMetrics)

    def test_get_active_experiments(self, engine):
        # Initially empty
        active = engine.get_active_experiments()
        assert active == []

    def test_get_active_ab_tests(self, engine):
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        engine.create_ab_test(config)

        active = engine.get_active_ab_tests()
        assert len(active) == 1

    def test_get_regression_alerts(self, engine):
        # Trigger some regressions
        engine.check_regression("latency", 100.0, 150.0, "api")
        engine.check_regression("errors", 1.0, 3.0, "api")

        alerts = engine.get_regression_alerts()
        assert len(alerts) == 2


class TestIntegration:
    """Integration tests for evolution engine."""

    @pytest.mark.asyncio
    async def test_full_experiment_lifecycle(self):
        """Test complete experiment from proposal to result."""
        engine = create_evolution_engine()

        # Register metrics
        call_count = {"count": 0}
        def latency_collector():
            call_count["count"] += 1
            # Simulate improvement after change
            return 80.0 if call_count["count"] > 5 else 100.0

        engine.register_metric("latency_p99", latency_collector)

        # Create and run experiment
        config = create_experiment_config(
            experiment_type=ExperimentType.CONFIGURATION,
            target_component="cache",
            change_description="Optimize cache algorithm",
            baseline_config={"algorithm": "lru"},
            experiment_config={"algorithm": "lfu"},
            duration_seconds=1
        )

        applied = {"done": False}
        def apply_change(cfg):
            applied["done"] = True

        rolled_back = {"done": False}
        def rollback_change(cfg):
            rolled_back["done"] = True

        with patch('asyncio.sleep', new_callable=AsyncMock):
            result = await engine.run_experiment(config, apply_change, rollback_change)

        assert result is not None
        assert applied["done"] is True

        # Check metrics recorded
        metrics = engine.get_metrics()
        assert metrics.total_experiments == 1

    def test_full_ab_test_lifecycle(self):
        """Test complete A/B test from creation to analysis."""
        engine = create_evolution_engine()

        # Create test
        config = create_ab_test_config(
            name="routing-strategy",
            variant_a_config={"strategy": "round_robin"},
            variant_b_config={"strategy": "least_connections"},
            success_metric="latency_p99"
        )
        test = engine.create_ab_test(config)
        engine.start_ab_test(test.id)

        # Assign users and record metrics
        for i in range(100):
            variant = engine.assign_ab_variant(test.id, f"user-{i}")
            # Simulate B performing better
            if variant == "A":
                engine.record_ab_metric(test.id, "A", 100.0)
            else:
                engine.record_ab_metric(test.id, "B", 80.0)

        # Analyze
        result = engine.analyze_ab_test(test.id)

        assert result is not None
        assert result.variant_a.sample_count > 0
        assert result.variant_b.sample_count > 0

        # Check metrics
        metrics = engine.get_metrics()
        assert metrics.total_ab_tests == 1

    def test_regression_detection_workflow(self):
        """Test regression detection and alerting."""
        engine = create_evolution_engine()

        # Check various metrics
        alert1 = engine.check_regression("latency_p99", 100.0, 150.0, "api")
        alert2 = engine.check_regression("throughput", 1000.0, 700.0, "api")
        alert3 = engine.check_regression("error_rate", 0.5, 2.0, "api")

        assert alert1 is not None
        assert alert2 is not None
        assert alert3 is not None

        # Verify alerts
        alerts = engine.get_regression_alerts()
        assert len(alerts) == 3

        # Check metrics
        metrics = engine.get_metrics()
        assert metrics.regressions_detected == 3


class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_empty_experiment_samples(self):
        """Test experiment with no samples."""
        detector = RegressionDetector(name="test", metrics_to_monitor=[])
        runner = ExperimentRunner(detector)

        result = runner._analyze_experiment(
            Experiment(
                id="test",
                config=ExperimentConfig(
                    experiment_type=ExperimentType.CONFIGURATION,
                    target_component="test",
                    change_description="test",
                    baseline_config={},
                    experiment_config={}
                ),
                status=ExperimentStatus.RUNNING,
                created_at=datetime.now(),
                baseline_samples=[],
                experiment_samples=[]
            )
        )

        assert result.improvement_percentage == 0.0

    def test_ab_test_zero_variance(self):
        """Test A/B test with no variance in results."""
        manager = ABTestManager()
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = manager.create_test(config)

        # All same values
        for _ in range(100):
            manager.record_metric(test.id, "A", 100.0)
            manager.record_metric(test.id, "B", 100.0)

        result = manager.analyze_test(test.id)
        assert result.improvement == 0.0

    def test_ab_test_single_sample(self):
        """Test A/B test with single sample."""
        manager = ABTestManager()
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={}
        )
        test = manager.create_test(config)

        manager.record_metric(test.id, "A", 100.0)
        manager.record_metric(test.id, "B", 80.0)

        result = manager.analyze_test(test.id)
        # Should handle gracefully even with small sample
        assert result is not None

    def test_regression_unknown_metric_type(self):
        """Test regression detection for unknown metric type."""
        detector = RegressionDetector(
            name="test",
            metrics_to_monitor=["unknown_metric"]
        )

        # Unknown metric type should not trigger regression
        alert = detector.check_for_regression(
            "unknown_metric",
            100.0,
            150.0,
            "component"
        )
        assert alert is None

    def test_negative_improvement_excluded_from_average(self):
        """Test that negative improvements are excluded from average."""
        metrics = EvolutionMetrics()

        # Record experiment with negative improvement
        result = ExperimentResult(
            experiment_id="exp-1",
            status=ExperimentStatus.COMPLETED,
            started_at=datetime.now(),
            ended_at=datetime.now(),
            baseline_samples=[],
            experiment_samples=[],
            statistical_significance=0.9,
            improvement_percentage=-10.0  # Negative
        )
        metrics.record_experiment(result)

        # Should not be included in average
        assert metrics.average_improvement == 0.0
        assert len(metrics.improvement_samples) == 0

    def test_variant_assignment_distribution(self):
        """Test that variant assignment follows traffic split."""
        manager = ABTestManager()

        # Test with 30/70 split
        config = create_ab_test_config(
            name="test",
            variant_a_config={},
            variant_b_config={},
            traffic_split=0.7  # 70% to B
        )
        test = manager.create_test(config)
        manager.start_test(test.id)

        # Assign many users
        a_count = 0
        b_count = 0
        for i in range(1000):
            variant = manager.assign_variant(test.id, f"user-{i}")
            if variant == "A":
                a_count += 1
            else:
                b_count += 1

        # B should get approximately 70% (allow some variance)
        b_ratio = b_count / 1000
        assert 0.65 < b_ratio < 0.75
