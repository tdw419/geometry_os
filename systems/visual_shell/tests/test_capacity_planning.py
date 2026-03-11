"""
Tests for Capacity Planning (Phase 55)

Tests ML-based capacity planning and resource optimization.
"""

import time

import pytest

from systems.visual_shell.capacity_planning import (
    CapacityForecast,
    CapacityForecaster,
    CapacityMetric,
    CapacityPlan,
    CapacityPlanner,
    CapacityRecommendation,
    ConfidenceLevel,
    CostAnalyzer,
    PlanningHorizon,
    RecommendationType,
    ResourceOptimizer,
    ResourceType,
    ResourceUsage,
    UsageCollector,
    create_capacity_metric,
    create_capacity_planner,
    create_resource_usage,
)


class TestResourceType:
    """Tests for ResourceType enum."""

    def test_resource_types(self):
        assert ResourceType.CPU.value == "cpu"
        assert ResourceType.MEMORY.value == "memory"
        assert ResourceType.STORAGE.value == "storage"
        assert ResourceType.NETWORK.value == "network"
        assert ResourceType.GPU.value == "gpu"
        assert ResourceType.CONTAINERS.value == "containers"
        assert ResourceType.CONNECTIONS.value == "connections"


class TestPlanningHorizon:
    """Tests for PlanningHorizon enum."""

    def test_horizons(self):
        assert PlanningHorizon.SHORT_TERM.value == "short_term"
        assert PlanningHorizon.MEDIUM_TERM.value == "medium_term"
        assert PlanningHorizon.LONG_TERM.value == "long_term"


class TestRecommendationType:
    """Tests for RecommendationType enum."""

    def test_types(self):
        assert RecommendationType.SCALE_UP.value == "scale_up"
        assert RecommendationType.SCALE_DOWN.value == "scale_down"
        assert RecommendationType.MIGRATE.value == "migrate"
        assert RecommendationType.CONSOLIDATE.value == "consolidate"
        assert RecommendationType.SPLIT.value == "split"
        assert RecommendationType.UPGRADE.value == "upgrade"
        assert RecommendationType.DOWNGRADE.value == "downgrade"
        assert RecommendationType.OPTIMIZE.value == "optimize"


class TestConfidenceLevel:
    """Tests for ConfidenceLevel enum."""

    def test_levels(self):
        assert ConfidenceLevel.LOW.value == "low"
        assert ConfidenceLevel.MEDIUM.value == "medium"
        assert ConfidenceLevel.HIGH.value == "high"
        assert ConfidenceLevel.VERY_HIGH.value == "very_high"


class TestResourceUsage:
    """Tests for ResourceUsage."""

    def test_usage_creation(self):
        usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=50.0,
            total=100.0,
        )
        assert usage.resource_type == ResourceType.CPU
        assert usage.used == 50.0
        assert usage.total == 100.0

    def test_utilization(self):
        usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=75.0,
            total=100.0,
        )
        assert usage.utilization == 75.0

    def test_utilization_zero_total(self):
        usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=50.0,
            total=0.0,
        )
        assert usage.utilization == 0.0

    def test_available(self):
        usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=30.0,
            total=100.0,
        )
        assert usage.available == 70.0

    def test_timestamp_default(self):
        usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=50.0,
            total=100.0,
        )
        assert usage.timestamp > 0


class TestCapacityMetric:
    """Tests for CapacityMetric."""

    def test_metric_creation(self):
        metric = CapacityMetric(
            name="cpu_usage",
            resource_type=ResourceType.CPU,
            current_value=75.0,
            unit="percent",
        )
        assert metric.name == "cpu_usage"
        assert metric.current_value == 75.0

    def test_metric_defaults(self):
        metric = CapacityMetric(
            name="cpu",
            resource_type=ResourceType.CPU,
            current_value=50.0,
            unit="percent",
        )
        assert metric.threshold_warning == 80.0
        assert metric.threshold_critical == 95.0
        assert metric.trend == 0.0
        assert metric.history == []


class TestCapacityForecast:
    """Tests for CapacityForecast."""

    def test_forecast_creation(self):
        forecast = CapacityForecast(
            forecast_id="forecast-1",
            resource_type=ResourceType.CPU,
            horizon=PlanningHorizon.SHORT_TERM,
            current_capacity=100.0,
            predicted_demand=80.0,
            predicted_utilization=80.0,
            confidence=0.85,
        )
        assert forecast.forecast_id == "forecast-1"
        assert forecast.confidence == 0.85

    def test_forecast_defaults(self):
        forecast = CapacityForecast(
            forecast_id="forecast-1",
            resource_type=ResourceType.CPU,
            horizon=PlanningHorizon.SHORT_TERM,
            current_capacity=100.0,
            predicted_demand=50.0,
            predicted_utilization=50.0,
            confidence=0.5,
        )
        assert forecast.time_to_exhaustion is None
        assert forecast.recommendations == []


class TestCapacityRecommendation:
    """Tests for CapacityRecommendation."""

    def test_recommendation_creation(self):
        rec = CapacityRecommendation(
            recommendation_id="rec-1",
            recommendation_type=RecommendationType.SCALE_UP,
            resource_type=ResourceType.CPU,
            target="api-server",
            current_value=80.0,
            recommended_value=120.0,
            estimated_cost_impact=100.0,
            estimated_performance_impact=0.2,
            confidence=ConfidenceLevel.HIGH,
            priority=1,
            rationale="High utilization",
        )
        assert rec.recommendation_id == "rec-1"
        assert rec.recommendation_type == RecommendationType.SCALE_UP

    def test_recommendation_defaults(self):
        rec = CapacityRecommendation(
            recommendation_id="rec-1",
            recommendation_type=RecommendationType.SCALE_UP,
            resource_type=ResourceType.CPU,
            target="server",
            current_value=50.0,
            recommended_value=75.0,
            estimated_cost_impact=10.0,
            estimated_performance_impact=0.1,
            confidence=ConfidenceLevel.MEDIUM,
            priority=2,
            rationale="Test",
        )
        assert rec.metadata == {}


class TestCapacityPlan:
    """Tests for CapacityPlan."""

    def test_plan_creation(self):
        plan = CapacityPlan(
            plan_id="plan-1",
            horizon=PlanningHorizon.SHORT_TERM,
        )
        assert plan.plan_id == "plan-1"
        assert plan.horizon == PlanningHorizon.SHORT_TERM

    def test_plan_defaults(self):
        plan = CapacityPlan(
            plan_id="plan-1",
            horizon=PlanningHorizon.MEDIUM_TERM,
        )
        assert plan.forecasts == []
        assert plan.recommendations == []
        assert plan.total_estimated_cost == 0.0
        assert plan.risk_score == 0.0


class TestUsageCollector:
    """Tests for UsageCollector."""

    @pytest.fixture
    def collector(self):
        return UsageCollector(history_size=100)

    def test_collector_creation(self, collector):
        assert len(collector._usage_history) == len(ResourceType)

    def test_register_collector(self, collector):
        def cpu_collector():
            return ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0,
                total=100.0,
            )

        collector.register_collector(ResourceType.CPU, cpu_collector)
        assert ResourceType.CPU in collector._collectors

    def test_collect(self, collector):
        def cpu_collector():
            return ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0,
                total=100.0,
            )

        collector.register_collector(ResourceType.CPU, cpu_collector)
        usage = collector.collect()

        assert ResourceType.CPU in usage
        assert usage[ResourceType.CPU].utilization == 50.0

    def test_add_usage(self, collector):
        usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=60.0,
            total=100.0,
        )
        collector.add_usage(usage)

        history = collector.get_history(ResourceType.CPU)
        assert len(history) == 1
        assert history[0].utilization == 60.0

    def test_get_history_with_since(self, collector):
        now = time.time()
        old_usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=30.0,
            total=100.0,
            timestamp=now - 100,
        )
        new_usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=50.0,
            total=100.0,
            timestamp=now,
        )

        collector.add_usage(old_usage)
        collector.add_usage(new_usage)

        history = collector.get_history(ResourceType.CPU, since=now - 50)
        assert len(history) == 1

    def test_get_statistics(self, collector):
        for i in range(10):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=float(i * 10),
                total=100.0,
            )
            collector.add_usage(usage)

        stats = collector.get_statistics(ResourceType.CPU)
        assert stats["count"] == 10
        assert stats["min_utilization"] == 0.0
        assert stats["max_utilization"] == 90.0

    def test_get_statistics_empty(self, collector):
        stats = collector.get_statistics(ResourceType.CPU)
        assert stats["count"] == 0


class TestCapacityForecaster:
    """Tests for CapacityForecaster."""

    @pytest.fixture
    def forecaster(self):
        return CapacityForecaster()

    @pytest.fixture
    def history(self):
        history = []
        for i in range(50):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0 + i,  # Growing trend
                total=100.0,
            )
            history.append(usage)
        return history

    def test_forecaster_creation(self, forecaster):
        assert forecaster is not None

    def test_forecast(self, forecaster, history):
        forecast = forecaster.forecast(
            ResourceType.CPU,
            history,
            PlanningHorizon.SHORT_TERM,
        )

        assert forecast.resource_type == ResourceType.CPU
        assert forecast.horizon == PlanningHorizon.SHORT_TERM
        assert forecast.confidence > 0

    def test_forecast_minimal_data(self, forecaster):
        history = [
            ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0,
                total=100.0,
            )
        ]
        forecast = forecaster.forecast(
            ResourceType.CPU,
            history,
            PlanningHorizon.SHORT_TERM,
        )

        # Should still create a forecast with low confidence
        assert forecast.confidence < 0.5

    def test_forecast_no_data(self, forecaster):
        forecast = forecaster.forecast(
            ResourceType.CPU,
            [],
            PlanningHorizon.SHORT_TERM,
        )

        assert forecast is not None
        assert forecast.confidence == 0.3

    def test_forecast_recommendations(self, forecaster, history):
        # Make high utilization
        high_history = [
            ResourceUsage(
                resource_type=ResourceType.CPU,
                used=95.0,
                total=100.0,
            )
            for _ in range(50)
        ]

        forecast = forecaster.forecast(
            ResourceType.CPU,
            high_history,
            PlanningHorizon.SHORT_TERM,
        )

        assert len(forecast.recommendations) > 0

    def test_different_horizons(self, forecaster, history):
        short = forecaster.forecast(ResourceType.CPU, history, PlanningHorizon.SHORT_TERM)
        medium = forecaster.forecast(ResourceType.CPU, history, PlanningHorizon.MEDIUM_TERM)
        long = forecaster.forecast(ResourceType.CPU, history, PlanningHorizon.LONG_TERM)

        assert short.horizon == PlanningHorizon.SHORT_TERM
        assert medium.horizon == PlanningHorizon.MEDIUM_TERM
        assert long.horizon == PlanningHorizon.LONG_TERM


class TestResourceOptimizer:
    """Tests for ResourceOptimizer."""

    @pytest.fixture
    def optimizer(self):
        return ResourceOptimizer()

    @pytest.fixture
    def critical_metric(self):
        return CapacityMetric(
            name="cpu-critical",
            resource_type=ResourceType.CPU,
            current_value=98.0,
            unit="percent",
        )

    @pytest.fixture
    def warning_metric(self):
        return CapacityMetric(
            name="cpu-warning",
            resource_type=ResourceType.CPU,
            current_value=85.0,
            unit="percent",
        )

    @pytest.fixture
    def low_metric(self):
        return CapacityMetric(
            name="cpu-low",
            resource_type=ResourceType.CPU,
            current_value=20.0,
            unit="percent",
            trend=-0.1,
        )

    def test_optimizer_creation(self, optimizer):
        assert len(optimizer._optimization_rules) == 0

    def test_set_cost_per_unit(self, optimizer):
        optimizer.set_cost_per_unit(ResourceType.CPU, 0.10)
        assert optimizer._cost_per_unit[ResourceType.CPU] == 0.10

    def test_add_optimization_rule(self, optimizer):
        def custom_rule(metric):
            return [CapacityRecommendation(
                recommendation_id="custom-1",
                recommendation_type=RecommendationType.CUSTOM,
                resource_type=metric.resource_type,
                target=metric.name,
                current_value=metric.current_value,
                recommended_value=100.0,
                estimated_cost_impact=0.0,
                estimated_performance_impact=0.0,
                confidence=ConfidenceLevel.LOW,
                priority=5,
                rationale="Custom rule",
            )]

        optimizer.add_optimization_rule(custom_rule)
        assert len(optimizer._optimization_rules) == 1

    def test_optimize_critical(self, optimizer, critical_metric):
        recommendations = optimizer.optimize([critical_metric])

        assert len(recommendations) > 0
        assert any(r.recommendation_type == RecommendationType.SCALE_UP for r in recommendations)

    def test_optimize_warning(self, optimizer, warning_metric):
        recommendations = optimizer.optimize([warning_metric])

        assert len(recommendations) > 0
        assert any(r.recommendation_type == RecommendationType.SCALE_UP for r in recommendations)

    def test_optimize_low(self, optimizer, low_metric):
        recommendations = optimizer.optimize([low_metric])

        # Should recommend scaling down for low utilization
        assert any(r.recommendation_type == RecommendationType.SCALE_DOWN for r in recommendations)

    def test_optimize_multiple_metrics(self, optimizer):
        metrics = [
            CapacityMetric(
                name="cpu",
                resource_type=ResourceType.CPU,
                current_value=90.0,
                unit="percent",
            ),
            CapacityMetric(
                name="memory",
                resource_type=ResourceType.MEMORY,
                current_value=30.0,
                unit="percent",
                trend=0,
            ),
        ]

        recommendations = optimizer.optimize(metrics)
        assert len(recommendations) > 0

    def test_recommendations_sorted_by_priority(self, optimizer):
        metrics = [
            CapacityMetric(
                name="critical",
                resource_type=ResourceType.CPU,
                current_value=98.0,
                unit="percent",
            ),
            CapacityMetric(
                name="low",
                resource_type=ResourceType.MEMORY,
                current_value=20.0,
                unit="percent",
                trend=-0.1,
            ),
        ]

        recommendations = optimizer.optimize(metrics)
        priorities = [r.priority for r in recommendations]
        assert priorities == sorted(priorities)


class TestCostAnalyzer:
    """Tests for CostAnalyzer."""

    @pytest.fixture
    def analyzer(self):
        return CostAnalyzer()

    def test_analyzer_creation(self, analyzer):
        assert len(analyzer._cost_history) == 0

    def test_set_pricing(self, analyzer):
        analyzer.set_pricing("cpu_hour", 0.05)
        assert analyzer._pricing["cpu_hour"] == 0.05

    def test_estimate_monthly_cost(self, analyzer):
        analyzer.set_pricing("cpu_hour", 0.05)
        analyzer.set_pricing("memory_gb", 0.01)

        resources = {"cpu_hour": 10, "memory_gb": 20}
        cost = analyzer.estimate_monthly_cost(resources)

        # 10 * 0.05 * 730 + 20 * 0.01 * 730
        expected = (10 * 0.05 + 20 * 0.01) * 730
        assert abs(cost - expected) < 0.01  # Allow floating point tolerance

    def test_compare_options(self, analyzer):
        analyzer.set_pricing("cpu_hour", 0.05)

        current = {"cpu_hour": 10}
        recommended = {"cpu_hour": 15}

        comparison = analyzer.compare_options(current, recommended)

        assert "current_monthly_cost" in comparison
        assert "recommended_monthly_cost" in comparison
        assert comparison["difference"] > 0

    def test_compare_options_cost_savings(self, analyzer):
        analyzer.set_pricing("cpu_hour", 0.05)

        current = {"cpu_hour": 20}
        recommended = {"cpu_hour": 10}

        comparison = analyzer.compare_options(current, recommended)

        assert comparison["difference"] < 0
        assert comparison["percentage_change"] < 0

    def test_record_cost(self, analyzer):
        analyzer.record_cost({"cpu": 10}, 100.0)
        assert len(analyzer._cost_history) == 1

    def test_get_cost_trend(self, analyzer):
        # Record some costs
        for i in range(5):
            analyzer.record_cost(
                {"cpu": 10},
                100.0 + i * 10,
                timestamp=time.time() - (5 - i) * 24 * 3600,
            )

        trend = analyzer.get_cost_trend(days=10)

        assert trend["data_points"] == 5
        assert "trend" in trend
        assert "avg_cost" in trend

    def test_get_cost_trend_insufficient_data(self, analyzer):
        trend = analyzer.get_cost_trend()
        assert trend["data_points"] == 0


class TestCapacityPlanner:
    """Tests for CapacityPlanner."""

    @pytest.fixture
    def planner(self):
        return CapacityPlanner()

    def test_planner_creation(self, planner):
        assert planner._collector is not None
        assert planner._forecaster is not None
        assert planner._optimizer is not None
        assert planner._cost_analyzer is not None

    def test_get_collector(self, planner):
        collector = planner.get_collector()
        assert isinstance(collector, UsageCollector)

    def test_get_forecaster(self, planner):
        forecaster = planner.get_forecaster()
        assert isinstance(forecaster, CapacityForecaster)

    def test_get_optimizer(self, planner):
        optimizer = planner.get_optimizer()
        assert isinstance(optimizer, ResourceOptimizer)

    def test_get_cost_analyzer(self, planner):
        analyzer = planner.get_cost_analyzer()
        assert isinstance(analyzer, CostAnalyzer)

    def test_collect_usage(self, planner):
        # Add some usage data
        usage = ResourceUsage(
            resource_type=ResourceType.CPU,
            used=50.0,
            total=100.0,
        )
        planner.get_collector().add_usage(usage)

        collected = planner.collect_usage()
        assert isinstance(collected, dict)

    def test_create_plan(self, planner):
        # Add history
        for i in range(20):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0 + i,
                total=100.0,
            )
            planner.get_collector().add_usage(usage)

        plan = planner.create_plan(PlanningHorizon.SHORT_TERM)

        assert plan.plan_id.startswith("plan-")
        assert plan.horizon == PlanningHorizon.SHORT_TERM
        assert len(plan.forecasts) > 0

    def test_create_plan_with_metrics(self, planner):
        for i in range(20):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=70.0,
                total=100.0,
            )
            planner.get_collector().add_usage(usage)

        metrics = [
            CapacityMetric(
                name="cpu",
                resource_type=ResourceType.CPU,
                current_value=85.0,
                unit="percent",
            )
        ]

        plan = planner.create_plan(PlanningHorizon.MEDIUM_TERM, metrics=metrics)
        assert len(plan.recommendations) > 0

    def test_get_plans(self, planner):
        for i in range(20):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0,
                total=100.0,
            )
            planner.get_collector().add_usage(usage)

        planner.create_plan(PlanningHorizon.SHORT_TERM)
        planner.create_plan(PlanningHorizon.MEDIUM_TERM)

        plans = planner.get_plans()
        assert len(plans) == 2

    def test_get_plans_limit(self, planner):
        for i in range(20):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0,
                total=100.0,
            )
            planner.get_collector().add_usage(usage)

        for _ in range(15):
            planner.create_plan(PlanningHorizon.SHORT_TERM)

        plans = planner.get_plans(limit=5)
        assert len(plans) == 5

    def test_get_plan(self, planner):
        for i in range(20):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0,
                total=100.0,
            )
            planner.get_collector().add_usage(usage)

        plan = planner.create_plan(PlanningHorizon.SHORT_TERM)
        retrieved = planner.get_plan(plan.plan_id)

        assert retrieved == plan

    def test_get_plan_not_found(self, planner):
        plan = planner.get_plan("nonexistent")
        assert plan is None

    def test_get_summary(self, planner):
        for i in range(10):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=50.0 + i * 5,
                total=100.0,
            )
            planner.get_collector().add_usage(usage)

        summary = planner.get_summary()

        assert "total_plans" in summary
        assert "resource_statistics" in summary

    def test_risk_score_calculation(self, planner):
        # Add high utilization history
        for i in range(20):
            usage = ResourceUsage(
                resource_type=ResourceType.CPU,
                used=95.0,
                total=100.0,
            )
            planner.get_collector().add_usage(usage)

        plan = planner.create_plan(PlanningHorizon.SHORT_TERM)

        # High utilization should result in higher risk score
        assert plan.risk_score > 0


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_capacity_planner(self):
        planner = create_capacity_planner()
        assert isinstance(planner, CapacityPlanner)

    def test_create_resource_usage(self):
        usage = create_resource_usage(
            resource_type=ResourceType.CPU,
            used=50.0,
            total=100.0,
        )
        assert isinstance(usage, ResourceUsage)
        assert usage.utilization == 50.0

    def test_create_capacity_metric(self):
        metric = create_capacity_metric(
            name="test-metric",
            resource_type=ResourceType.MEMORY,
            current_value=75.0,
            unit="percent",
            threshold_warning=70.0,
        )
        assert isinstance(metric, CapacityMetric)
        assert metric.threshold_warning == 70.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
