"""
Phase 59: Evolution Engine

Self-improvement through feedback loops and experimentation.

Provides safe experiments with automatic rollback, A/B testing for
configuration changes, performance regression detection, and
evolution metrics tracking.
"""

import asyncio
import random
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Any


class ExperimentStatus(Enum):
    """Status of an evolution experiment."""
    PROPOSED = "proposed"
    RUNNING = "running"
    COMPLETED = "completed"
    ROLLED_BACK = "rolled_back"
    FAILED = "failed"


class ExperimentType(Enum):
    """Type of experiment."""
    CONFIGURATION = "configuration"
    PLACEMENT = "placement"
    SCALING = "scaling"
    MIGRATION = "migration"
    SCHEDULING = "scheduling"


class RollbackReason(Enum):
    """Reason for rolling back an experiment."""
    PERFORMANCE_DEGRADATION = "performance_degradation"
    ERROR_RATE_INCREASE = "error_rate_increase"
    COST_OVERRUN = "cost_overrun"
    MANUAL_TRIGGER = "manual_trigger"
    TIMEOUT = "timeout"
    SAFETY_VIOLATION = "safety_violation"


class MetricComparison(Enum):
    """How to compare metrics."""
    LOWER_IS_BETTER = "lower_is_better"
    HIGHER_IS_BETTER = "higher_is_better"
    TARGET_VALUE = "target_value"


@dataclass
class MetricThreshold:
    """Threshold for metric-based decisions."""
    metric_name: str
    comparison: MetricComparison
    baseline_value: float
    degradation_threshold: float  # Percentage degradation that triggers rollback
    improvement_threshold: float  # Percentage improvement to consider success


@dataclass
class ExperimentConfig:
    """Configuration for an experiment."""
    experiment_type: ExperimentType
    target_component: str
    change_description: str
    baseline_config: dict[str, Any]
    experiment_config: dict[str, Any]
    duration_seconds: int = 300  # 5 minutes default
    sample_interval_seconds: int = 10
    rollback_on_degradation: bool = True
    confidence_level: float = 0.95


@dataclass
class MetricSample:
    """A single metric sample during experiment."""
    timestamp: datetime
    metric_name: str
    value: float
    source: str  # 'baseline' or 'experiment'


@dataclass
class ExperimentResult:
    """Result of a completed experiment."""
    experiment_id: str
    status: ExperimentStatus
    started_at: datetime
    ended_at: datetime
    baseline_samples: list[MetricSample]
    experiment_samples: list[MetricSample]
    statistical_significance: float
    improvement_percentage: float
    rollback_reason: RollbackReason | None = None
    recommendation: str = ""


@dataclass
class Experiment:
    """An evolution experiment."""
    id: str
    config: ExperimentConfig
    status: ExperimentStatus
    created_at: datetime
    started_at: datetime | None = None
    ended_at: datetime | None = None
    baseline_samples: list[MetricSample] = field(default_factory=list)
    experiment_samples: list[MetricSample] = field(default_factory=list)
    rollback_reason: RollbackReason | None = None
    result: ExperimentResult | None = None


@dataclass
class ABTestConfig:
    """Configuration for A/B testing."""
    name: str
    variant_a_config: dict[str, Any]
    variant_b_config: dict[str, Any]
    traffic_split: float = 0.5  # 50/50 split
    success_metric: str = "latency_p99"
    minimum_sample_size: int = 100
    significance_threshold: float = 0.05


@dataclass
class ABTestVariant:
    """Results for one variant of an A/B test."""
    name: str
    config: dict[str, Any]
    sample_count: int = 0
    metric_sum: float = 0.0
    metric_squared_sum: float = 0.0
    conversions: int = 0

    @property
    def mean(self) -> float:
        if self.sample_count == 0:
            return 0.0
        return self.metric_sum / self.sample_count

    @property
    def variance(self) -> float:
        if self.sample_count < 2:
            return 0.0
        mean = self.mean
        return (self.metric_squared_sum - self.sample_count * mean * mean) / (self.sample_count - 1)


@dataclass
class ABTestResult:
    """Result of an A/B test."""
    test_id: str
    variant_a: ABTestVariant
    variant_b: ABTestVariant
    winner: str | None = None
    confidence: float = 0.0
    improvement: float = 0.0
    is_significant: bool = False


@dataclass
class ABTest:
    """An A/B test for configuration changes."""
    id: str
    config: ABTestConfig
    variant_a: ABTestVariant
    variant_b: ABTestVariant
    created_at: datetime
    started_at: datetime | None = None
    ended_at: datetime | None = None
    result: ABTestResult | None = None
    active: bool = True


class RegressionType(Enum):
    """Type of performance regression."""
    LATENCY_INCREASE = "latency_increase"
    THROUGHPUT_DECREASE = "throughput_decrease"
    ERROR_RATE_INCREASE = "error_rate_increase"
    RESOURCE_USAGE_INCREASE = "resource_usage_increase"
    AVAILABILITY_DECREASE = "availability_decrease"


@dataclass
class RegressionAlert:
    """Alert for detected performance regression."""
    id: str
    regression_type: RegressionType
    metric_name: str
    baseline_value: float
    current_value: float
    change_percentage: float
    detected_at: datetime
    severity: str  # 'low', 'medium', 'high', 'critical'
    affected_components: list[str]
    suggested_action: str


@dataclass
class RegressionDetector:
    """Detects performance regressions."""
    name: str
    metrics_to_monitor: list[str]
    baseline_window_hours: int = 24
    detection_threshold: float = 20.0  # Percentage change to trigger
    alerts: list[RegressionAlert] = field(default_factory=list)

    def check_for_regression(
        self,
        metric_name: str,
        baseline_value: float,
        current_value: float,
        component: str
    ) -> RegressionAlert | None:
        """Check if a metric shows regression."""
        if baseline_value == 0:
            return None

        change_pct = ((current_value - baseline_value) / baseline_value) * 100

        # Determine if this is a regression based on metric type
        is_regression = False
        regression_type = RegressionType.LATENCY_INCREASE

        if "latency" in metric_name.lower() or "p99" in metric_name.lower():
            # Higher latency is bad
            if change_pct > self.detection_threshold:
                is_regression = True
                regression_type = RegressionType.LATENCY_INCREASE
        elif "throughput" in metric_name.lower() or "qps" in metric_name.lower():
            # Lower throughput is bad
            if change_pct < -self.detection_threshold:
                is_regression = True
                regression_type = RegressionType.THROUGHPUT_DECREASE
        elif "error" in metric_name.lower():
            # Higher error rate is bad
            if change_pct > self.detection_threshold:
                is_regression = True
                regression_type = RegressionType.ERROR_RATE_INCREASE
        elif "cpu" in metric_name.lower() or "memory" in metric_name.lower():
            # Higher resource usage might be regression
            if change_pct > self.detection_threshold * 1.5:  # Stricter threshold
                is_regression = True
                regression_type = RegressionType.RESOURCE_USAGE_INCREASE
        elif "availability" in metric_name.lower():
            # Lower availability is bad - very sensitive
            if change_pct < -self.detection_threshold / 10:  # Much more sensitive
                is_regression = True
                regression_type = RegressionType.AVAILABILITY_DECREASE

        if not is_regression:
            return None

        # Determine severity
        abs_change = abs(change_pct)
        if abs_change > 100:
            severity = "critical"
        elif abs_change > 50:
            severity = "high"
        elif abs_change > 30:
            severity = "medium"
        else:
            severity = "low"

        alert = RegressionAlert(
            id=str(uuid.uuid4())[:8],
            regression_type=regression_type,
            metric_name=metric_name,
            baseline_value=baseline_value,
            current_value=current_value,
            change_percentage=change_pct,
            detected_at=datetime.now(),
            severity=severity,
            affected_components=[component],
            suggested_action=self._suggest_action(regression_type, severity)
        )

        self.alerts.append(alert)
        return alert

    def _suggest_action(self, regression_type: RegressionType, severity: str) -> str:
        """Suggest action based on regression type and severity."""
        actions = {
            RegressionType.LATENCY_INCREASE: "Investigate recent changes; consider scaling or caching",
            RegressionType.THROUGHPUT_DECREASE: "Check for bottlenecks; verify resource allocation",
            RegressionType.ERROR_RATE_INCREASE: "Review error logs; check for deployment issues",
            RegressionType.RESOURCE_USAGE_INCREASE: "Scale resources or optimize queries",
            RegressionType.AVAILABILITY_DECREASE: "Check health endpoints; verify circuit breakers"
        }
        base_action = actions.get(regression_type, "Investigate and monitor")

        if severity == "critical":
            return f"URGENT: {base_action}. Consider immediate rollback."
        return base_action


@dataclass
class EvolutionMetrics:
    """Metrics tracking for evolution engine."""
    total_experiments: int = 0
    successful_experiments: int = 0
    rolled_back_experiments: int = 0
    failed_experiments: int = 0
    total_ab_tests: int = 0
    significant_ab_tests: int = 0
    regressions_detected: int = 0
    regressions_prevented: int = 0
    average_improvement: float = 0.0
    improvement_samples: list[float] = field(default_factory=list)

    def record_experiment(self, result: ExperimentResult) -> None:
        """Record experiment result in metrics."""
        self.total_experiments += 1

        if result.status == ExperimentStatus.COMPLETED:
            self.successful_experiments += 1
            if result.improvement_percentage > 0:
                self.improvement_samples.append(result.improvement_percentage)
                self._update_average_improvement()
        elif result.status == ExperimentStatus.ROLLED_BACK:
            self.rolled_back_experiments += 1
            self.regressions_prevented += 1
        elif result.status == ExperimentStatus.FAILED:
            self.failed_experiments += 1

    def record_ab_test(self, result: ABTestResult) -> None:
        """Record A/B test result in metrics."""
        self.total_ab_tests += 1
        if result.is_significant:
            self.significant_ab_tests += 1

    def record_regression(self, alert: RegressionAlert) -> None:
        """Record regression detection in metrics."""
        self.regressions_detected += 1

    def _update_average_improvement(self) -> None:
        """Update running average of improvements."""
        if self.improvement_samples:
            self.average_improvement = sum(self.improvement_samples) / len(self.improvement_samples)

    @property
    def success_rate(self) -> float:
        if self.total_experiments == 0:
            return 0.0
        return self.successful_experiments / self.total_experiments

    @property
    def rollback_rate(self) -> float:
        if self.total_experiments == 0:
            return 0.0
        return self.rolled_back_experiments / self.total_experiments


class ExperimentRunner:
    """Runs evolution experiments with safety guarantees."""

    def __init__(self, regression_detector: RegressionDetector):
        self.regression_detector = regression_detector
        self.experiments: dict[str, Experiment] = {}
        self.metric_thresholds: list[MetricThreshold] = []
        self._metric_collectors: dict[str, Callable] = {}

    def register_metric_collector(
        self,
        metric_name: str,
        collector: Callable[[], float]
    ) -> None:
        """Register a function to collect a metric."""
        self._metric_collectors[metric_name] = collector

    def add_threshold(self, threshold: MetricThreshold) -> None:
        """Add a metric threshold for experiment evaluation."""
        self.metric_thresholds.append(threshold)

    async def propose_experiment(
        self,
        config: ExperimentConfig
    ) -> Experiment:
        """Create a proposed experiment."""
        experiment = Experiment(
            id=str(uuid.uuid4())[:8],
            config=config,
            status=ExperimentStatus.PROPOSED,
            created_at=datetime.now()
        )
        self.experiments[experiment.id] = experiment
        return experiment

    async def run_experiment(
        self,
        experiment_id: str,
        apply_change: Callable[[dict[str, Any]], None],
        rollback_change: Callable[[dict[str, Any]], None]
    ) -> ExperimentResult:
        """Run an experiment with automatic rollback on degradation."""
        experiment = self.experiments.get(experiment_id)
        if not experiment:
            raise ValueError(f"Experiment {experiment_id} not found")

        if experiment.status != ExperimentStatus.PROPOSED:
            raise ValueError(f"Experiment {experiment_id} is not in PROPOSED state")

        experiment.status = ExperimentStatus.RUNNING
        experiment.started_at = datetime.now()

        try:
            # Collect baseline samples
            await self._collect_samples(
                experiment,
                experiment.config.baseline_config,
                is_baseline=True
            )

            # Apply experimental change
            apply_change(experiment.config.experiment_config)

            # Collect experiment samples
            await self._collect_samples(
                experiment,
                experiment.config.experiment_config,
                is_baseline=False
            )

            # Analyze results
            result = self._analyze_experiment(experiment)

            # Check for degradation and rollback if needed
            if result.improvement_percentage < 0 and experiment.config.rollback_on_degradation:
                rollback_change(experiment.config.baseline_config)
                experiment.status = ExperimentStatus.ROLLED_BACK
                result.status = ExperimentStatus.ROLLED_BACK
                result.rollback_reason = RollbackReason.PERFORMANCE_DEGRADATION
            else:
                experiment.status = ExperimentStatus.COMPLETED
                result.status = ExperimentStatus.COMPLETED

            experiment.result = result
            experiment.ended_at = datetime.now()
            result.ended_at = experiment.ended_at

            return result

        except Exception as e:
            experiment.status = ExperimentStatus.FAILED
            experiment.ended_at = datetime.now()
            result = ExperimentResult(
                experiment_id=experiment.id,
                status=ExperimentStatus.FAILED,
                started_at=experiment.started_at,
                ended_at=experiment.ended_at,
                baseline_samples=experiment.baseline_samples,
                experiment_samples=experiment.experiment_samples,
                statistical_significance=0.0,
                improvement_percentage=0.0,
                recommendation=f"Experiment failed: {str(e)}"
            )
            experiment.result = result
            return result

    async def _collect_samples(
        self,
        experiment: Experiment,
        config: dict[str, Any],
        is_baseline: bool
    ) -> None:
        """Collect metric samples for baseline or experiment."""
        samples_needed = experiment.config.duration_seconds // experiment.config.sample_interval_seconds

        for _ in range(samples_needed):
            for metric_name, collector in self._metric_collectors.items():
                try:
                    value = collector()
                    sample = MetricSample(
                        timestamp=datetime.now(),
                        metric_name=metric_name,
                        value=value,
                        source="baseline" if is_baseline else "experiment"
                    )
                    if is_baseline:
                        experiment.baseline_samples.append(sample)
                    else:
                        experiment.experiment_samples.append(sample)
                except Exception:
                    pass  # Skip failed metric collection

            await asyncio.sleep(experiment.config.sample_interval_seconds)

    def _analyze_experiment(self, experiment: Experiment) -> ExperimentResult:
        """Analyze experiment results."""
        # Group samples by metric
        baseline_by_metric: dict[str, list[float]] = {}
        experiment_by_metric: dict[str, list[float]] = {}

        for sample in experiment.baseline_samples:
            if sample.metric_name not in baseline_by_metric:
                baseline_by_metric[sample.metric_name] = []
            baseline_by_metric[sample.metric_name].append(sample.value)

        for sample in experiment.experiment_samples:
            if sample.metric_name not in experiment_by_metric:
                experiment_by_metric[sample.metric_name] = []
            experiment_by_metric[sample.metric_name].append(sample.value)

        # Calculate improvements for each metric
        improvements: list[float] = []
        for metric_name in baseline_by_metric:
            if metric_name not in experiment_by_metric:
                continue

            baseline_values = baseline_by_metric[metric_name]
            experiment_values = experiment_by_metric[metric_name]

            if not baseline_values or not experiment_values:
                continue

            baseline_mean = sum(baseline_values) / len(baseline_values)
            experiment_mean = sum(experiment_values) / len(experiment_values)

            if baseline_mean == 0:
                continue

            # Determine direction based on metric type
            if "latency" in metric_name.lower() or "error" in metric_name.lower():
                # Lower is better
                improvement = ((baseline_mean - experiment_mean) / baseline_mean) * 100
            else:
                # Higher is better (throughput, availability)
                improvement = ((experiment_mean - baseline_mean) / baseline_mean) * 100

            improvements.append(improvement)

        # Calculate overall improvement
        overall_improvement = sum(improvements) / len(improvements) if improvements else 0.0

        # Calculate statistical significance (simplified t-test)
        significance = self._calculate_significance(
            baseline_by_metric,
            experiment_by_metric
        )

        # Generate recommendation
        if overall_improvement > 5:
            recommendation = "Strong positive result. Recommend adopting change."
        elif overall_improvement > 0:
            recommendation = "Modest improvement. Consider adopting with monitoring."
        elif overall_improvement > -5:
            recommendation = "Marginal degradation. Monitor and re-evaluate."
        else:
            recommendation = "Significant degradation. Do not adopt."

        return ExperimentResult(
            experiment_id=experiment.id,
            status=ExperimentStatus.COMPLETED,
            started_at=experiment.started_at,
            ended_at=datetime.now(),
            baseline_samples=experiment.baseline_samples,
            experiment_samples=experiment.experiment_samples,
            statistical_significance=significance,
            improvement_percentage=overall_improvement,
            recommendation=recommendation
        )

    def _calculate_significance(
        self,
        baseline: dict[str, list[float]],
        experiment: dict[str, list[float]]
    ) -> float:
        """Calculate statistical significance using simplified t-test."""
        all_p_values: list[float] = []

        for metric_name in baseline:
            if metric_name not in experiment:
                continue

            b_values = baseline[metric_name]
            e_values = experiment[metric_name]

            if len(b_values) < 2 or len(e_values) < 2:
                continue

            b_mean = sum(b_values) / len(b_values)
            e_mean = sum(e_values) / len(e_values)

            b_var = sum((x - b_mean) ** 2 for x in b_values) / (len(b_values) - 1)
            e_var = sum((x - e_mean) ** 2 for x in e_values) / (len(e_values) - 1)

            # Pooled standard error
            se = ((b_var / len(b_values)) + (e_var / len(e_values))) ** 0.5

            if se == 0:
                continue

            t_stat = abs(e_mean - b_mean) / se

            # Approximate p-value from t-stat (simplified)
            # Higher t = lower p-value = more significant
            p_value = max(0.001, min(0.5, 1.0 / (1 + t_stat)))
            all_p_values.append(p_value)

        if not all_p_values:
            return 0.0

        # Return average significance (1 - p-value)
        return 1.0 - (sum(all_p_values) / len(all_p_values))


class ABTestManager:
    """Manages A/B tests for configuration changes."""

    def __init__(self):
        self.tests: dict[str, ABTest] = {}
        self._variant_assignments: dict[str, str] = {}  # entity_id -> variant

    def create_test(self, config: ABTestConfig) -> ABTest:
        """Create a new A/B test."""
        test = ABTest(
            id=str(uuid.uuid4())[:8],
            config=config,
            variant_a=ABTestVariant(
                name="A",
                config=config.variant_a_config
            ),
            variant_b=ABTestVariant(
                name="B",
                config=config.variant_b_config
            ),
            created_at=datetime.now()
        )
        self.tests[test.id] = test
        return test

    def start_test(self, test_id: str) -> None:
        """Start an A/B test."""
        test = self.tests.get(test_id)
        if test:
            test.started_at = datetime.now()

    def assign_variant(self, test_id: str, entity_id: str) -> str:
        """Assign an entity to a variant."""
        test = self.tests.get(test_id)
        if not test or not test.active or not test.started_at:
            return "A"  # Default to control

        # Check if already assigned
        key = f"{test_id}:{entity_id}"
        if key in self._variant_assignments:
            return self._variant_assignments[key]

        # Assign based on traffic split
        variant = "B" if random.random() < test.config.traffic_split else "A"
        self._variant_assignments[key] = variant
        return variant

    def get_variant_config(self, test_id: str, variant: str) -> dict[str, Any]:
        """Get configuration for a variant."""
        test = self.tests.get(test_id)
        if not test:
            return {}

        if variant == "A":
            return test.variant_a.config
        return test.variant_b.config

    def record_metric(
        self,
        test_id: str,
        variant: str,
        metric_value: float,
        is_conversion: bool = False
    ) -> None:
        """Record a metric for a variant."""
        test = self.tests.get(test_id)
        if not test or not test.active:
            return

        if variant == "A":
            v = test.variant_a
        else:
            v = test.variant_b

        v.sample_count += 1
        v.metric_sum += metric_value
        v.metric_squared_sum += metric_value * metric_value
        if is_conversion:
            v.conversions += 1

    def analyze_test(self, test_id: str) -> ABTestResult:
        """Analyze A/B test results."""
        test = self.tests.get(test_id)
        if not test:
            raise ValueError(f"Test {test_id} not found")

        # Calculate improvement
        if test.variant_a.mean == 0:
            improvement = 0.0
        else:
            improvement = ((test.variant_b.mean - test.variant_a.mean) / test.variant_a.mean) * 100

        # Calculate significance using t-test
        significance = self._calculate_significance(test)

        # Determine winner
        winner = None
        if significance < test.config.significance_threshold:
            if improvement > 0:
                winner = "B"
            elif improvement < 0:
                winner = "A"

        result = ABTestResult(
            test_id=test.id,
            variant_a=test.variant_a,
            variant_b=test.variant_b,
            winner=winner,
            confidence=1 - significance,
            improvement=improvement,
            is_significant=significance < test.config.significance_threshold
        )

        test.result = result
        test.ended_at = datetime.now()
        return result

    def _calculate_significance(self, test: ABTest) -> float:
        """Calculate p-value for test significance."""
        a = test.variant_a
        b = test.variant_b

        if a.sample_count < 2 or b.sample_count < 2:
            return 1.0  # Not enough samples

        # Two-sample t-test
        a_mean = a.mean
        b_mean = b.mean
        a_var = a.variance
        b_var = b.variance

        # Pooled standard error
        se = ((a_var / a.sample_count) + (b_var / b.sample_count)) ** 0.5

        if se == 0:
            return 1.0

        t_stat = abs(b_mean - a_mean) / se

        # Approximate p-value
        return max(0.001, min(1.0, 1.0 / (1 + t_stat * 0.5)))

    def stop_test(self, test_id: str) -> None:
        """Stop an A/B test."""
        test = self.tests.get(test_id)
        if test:
            test.active = False


class EvolutionEngine:
    """
    Main evolution engine combining experiments, A/B tests,
    regression detection, and metrics tracking.
    """

    def __init__(self):
        self.regression_detector = RegressionDetector(
            name="default",
            metrics_to_monitor=[]
        )
        self.experiment_runner = ExperimentRunner(self.regression_detector)
        self.ab_test_manager = ABTestManager()
        self.metrics = EvolutionMetrics()

    def register_metric(
        self,
        name: str,
        collector: Callable[[], float],
        thresholds: MetricThreshold | None = None
    ) -> None:
        """Register a metric for monitoring and experiments."""
        self.experiment_runner.register_metric_collector(name, collector)
        self.regression_detector.metrics_to_monitor.append(name)
        if thresholds:
            self.experiment_runner.add_threshold(thresholds)

    async def run_experiment(
        self,
        config: ExperimentConfig,
        apply_change: Callable[[dict[str, Any]], None],
        rollback_change: Callable[[dict[str, Any]], None]
    ) -> ExperimentResult:
        """Run an evolution experiment."""
        experiment = await self.experiment_runner.propose_experiment(config)
        result = await self.experiment_runner.run_experiment(
            experiment.id,
            apply_change,
            rollback_change
        )
        self.metrics.record_experiment(result)
        return result

    def create_ab_test(self, config: ABTestConfig) -> ABTest:
        """Create an A/B test."""
        test = self.ab_test_manager.create_test(config)
        return test

    def start_ab_test(self, test_id: str) -> None:
        """Start an A/B test."""
        self.ab_test_manager.start_test(test_id)

    def assign_ab_variant(self, test_id: str, entity_id: str) -> str:
        """Assign entity to A/B test variant."""
        return self.ab_test_manager.assign_variant(test_id, entity_id)

    def record_ab_metric(
        self,
        test_id: str,
        variant: str,
        metric_value: float,
        is_conversion: bool = False
    ) -> None:
        """Record A/B test metric."""
        self.ab_test_manager.record_metric(test_id, variant, metric_value, is_conversion)

    def analyze_ab_test(self, test_id: str) -> ABTestResult:
        """Analyze A/B test results."""
        result = self.ab_test_manager.analyze_test(test_id)
        self.metrics.record_ab_test(result)
        return result

    def check_regression(
        self,
        metric_name: str,
        baseline_value: float,
        current_value: float,
        component: str
    ) -> RegressionAlert | None:
        """Check for performance regression."""
        alert = self.regression_detector.check_for_regression(
            metric_name,
            baseline_value,
            current_value,
            component
        )
        if alert:
            self.metrics.record_regression(alert)
        return alert

    def get_metrics(self) -> EvolutionMetrics:
        """Get current evolution metrics."""
        return self.metrics

    def get_active_experiments(self) -> list[Experiment]:
        """Get all active experiments."""
        return [
            e for e in self.experiment_runner.experiments.values()
            if e.status == ExperimentStatus.RUNNING
        ]

    def get_active_ab_tests(self) -> list[ABTest]:
        """Get all active A/B tests."""
        return [
            t for t in self.ab_test_manager.tests.values()
            if t.active
        ]

    def get_regression_alerts(self) -> list[RegressionAlert]:
        """Get all regression alerts."""
        return self.regression_detector.alerts


# Factory functions

def create_metric_threshold(
    metric_name: str,
    comparison: MetricComparison,
    baseline_value: float,
    degradation_threshold: float = 20.0,
    improvement_threshold: float = 5.0
) -> MetricThreshold:
    """Create a metric threshold."""
    return MetricThreshold(
        metric_name=metric_name,
        comparison=comparison,
        baseline_value=baseline_value,
        degradation_threshold=degradation_threshold,
        improvement_threshold=improvement_threshold
    )


def create_experiment_config(
    experiment_type: ExperimentType,
    target_component: str,
    change_description: str,
    baseline_config: dict[str, Any],
    experiment_config: dict[str, Any],
    duration_seconds: int = 300,
    rollback_on_degradation: bool = True
) -> ExperimentConfig:
    """Create an experiment configuration."""
    return ExperimentConfig(
        experiment_type=experiment_type,
        target_component=target_component,
        change_description=change_description,
        baseline_config=baseline_config,
        experiment_config=experiment_config,
        duration_seconds=duration_seconds,
        rollback_on_degradation=rollback_on_degradation
    )


def create_ab_test_config(
    name: str,
    variant_a_config: dict[str, Any],
    variant_b_config: dict[str, Any],
    success_metric: str = "latency_p99",
    traffic_split: float = 0.5,
    minimum_sample_size: int = 100,
    significance_threshold: float = 0.05
) -> ABTestConfig:
    """Create an A/B test configuration."""
    return ABTestConfig(
        name=name,
        variant_a_config=variant_a_config,
        variant_b_config=variant_b_config,
        success_metric=success_metric,
        traffic_split=traffic_split,
        minimum_sample_size=minimum_sample_size,
        significance_threshold=significance_threshold
    )


def create_regression_detector(
    name: str,
    metrics_to_monitor: list[str],
    detection_threshold: float = 20.0
) -> RegressionDetector:
    """Create a regression detector."""
    return RegressionDetector(
        name=name,
        metrics_to_monitor=metrics_to_monitor,
        detection_threshold=detection_threshold
    )


def create_evolution_engine() -> EvolutionEngine:
    """Create an evolution engine instance."""
    return EvolutionEngine()

if __name__ == "__main__":
    import argparse
    import time

    parser = argparse.ArgumentParser(description="Visual Shell Evolution Engine")
    parser.add_argument("--budget", type=int, help="Time budget in seconds")
    parser.add_argument("--intent", type=str, help="Intent file path")
    args = parser.parse_args()

    print("🚀 Visual Shell Evolution Engine starting...")
    if args.intent:
        print(f"📜 Intent loaded from {args.intent}")

    start_time = time.time()
    engine = create_evolution_engine()

    # Simulate the loop with budget check
    try:
        while True:
            if args.budget:
                elapsed = time.time() - start_time
                if elapsed >= args.budget:
                    print(f"⏰ Budget of {args.budget}s reached. Graceful termination.")
                    break

            # In a real implementation, this would run experiments from intent
            time.sleep(5)
            print("🔄 Running visual experiment...")
    except KeyboardInterrupt:
        pass
