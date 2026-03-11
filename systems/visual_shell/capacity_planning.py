"""
Capacity Planning - Phase 55

ML-based capacity planning and resource optimization.
"""

import time
import uuid
from collections import deque
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class ResourceType(Enum):
    """Types of resources."""
    CPU = "cpu"
    MEMORY = "memory"
    STORAGE = "storage"
    NETWORK = "network"
    GPU = "gpu"
    CONTAINERS = "containers"
    CONNECTIONS = "connections"


class PlanningHorizon(Enum):
    """Planning time horizons."""
    SHORT_TERM = "short_term"      # Hours
    MEDIUM_TERM = "medium_term"    # Days
    LONG_TERM = "long_term"        # Weeks


class RecommendationType(Enum):
    """Types of recommendations."""
    SCALE_UP = "scale_up"
    SCALE_DOWN = "scale_down"
    MIGRATE = "migrate"
    CONSOLIDATE = "consolidate"
    SPLIT = "split"
    UPGRADE = "upgrade"
    DOWNGRADE = "downgrade"
    OPTIMIZE = "optimize"


class ConfidenceLevel(Enum):
    """Confidence levels for predictions."""
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    VERY_HIGH = "very_high"


@dataclass
class ResourceUsage:
    """Resource usage snapshot."""
    resource_type: ResourceType
    used: float
    total: float
    timestamp: float = field(default_factory=time.time)

    @property
    def utilization(self) -> float:
        """Calculate utilization percentage."""
        if self.total <= 0:
            return 0.0
        return (self.used / self.total) * 100.0

    @property
    def available(self) -> float:
        """Calculate available capacity."""
        return max(0, self.total - self.used)


@dataclass
class CapacityMetric:
    """A metric for capacity planning."""
    name: str
    resource_type: ResourceType
    current_value: float
    unit: str
    threshold_warning: float = 80.0
    threshold_critical: float = 95.0
    trend: float = 0.0
    history: list[tuple[float, float]] = field(default_factory=list)


@dataclass
class CapacityForecast:
    """Forecast of future capacity needs."""
    forecast_id: str
    resource_type: ResourceType
    horizon: PlanningHorizon
    current_capacity: float
    predicted_demand: float
    predicted_utilization: float
    confidence: float
    time_to_exhaustion: float | None = None  # Hours until exhaustion
    recommendations: list[str] = field(default_factory=list)
    created_at: float = field(default_factory=time.time)


@dataclass
class CapacityRecommendation:
    """A capacity recommendation."""
    recommendation_id: str
    recommendation_type: RecommendationType
    resource_type: ResourceType
    target: str
    current_value: float
    recommended_value: float
    estimated_cost_impact: float
    estimated_performance_impact: float
    confidence: ConfidenceLevel
    priority: int
    rationale: str
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class CapacityPlan:
    """A complete capacity plan."""
    plan_id: str
    horizon: PlanningHorizon
    forecasts: list[CapacityForecast] = field(default_factory=list)
    recommendations: list[CapacityRecommendation] = field(default_factory=list)
    total_estimated_cost: float = 0.0
    risk_score: float = 0.0
    created_at: float = field(default_factory=time.time)


class UsageCollector:
    """Collects resource usage data."""

    def __init__(self, history_size: int = 1000):
        self._history_size = history_size
        self._usage_history: dict[ResourceType, deque] = {
            rt: deque(maxlen=history_size) for rt in ResourceType
        }
        self._collectors: dict[ResourceType, Callable[[], ResourceUsage]] = {}

    def register_collector(
        self,
        resource_type: ResourceType,
        collector: Callable[[], ResourceUsage],
    ) -> None:
        """Register a usage collector for a resource type."""
        self._collectors[resource_type] = collector

    def collect(self) -> dict[ResourceType, ResourceUsage]:
        """Collect current usage for all resource types."""
        usage = {}
        for resource_type, collector in self._collectors.items():
            try:
                result = collector()
                self._usage_history[resource_type].append(result)
                usage[resource_type] = result
            except Exception:
                pass
        return usage

    def add_usage(self, usage: ResourceUsage) -> None:
        """Manually add a usage snapshot."""
        self._usage_history[usage.resource_type].append(usage)

    def get_history(
        self,
        resource_type: ResourceType,
        since: float | None = None,
    ) -> list[ResourceUsage]:
        """Get usage history for a resource type."""
        history = list(self._usage_history.get(resource_type, []))
        if since:
            history = [h for h in history if h.timestamp >= since]
        return history

    def get_statistics(
        self,
        resource_type: ResourceType,
    ) -> dict[str, float]:
        """Get statistics for a resource type."""
        history = list(self._usage_history.get(resource_type, []))
        if not history:
            return {"count": 0}

        utilizations = [h.utilization for h in history]
        return {
            "count": len(history),
            "avg_utilization": sum(utilizations) / len(utilizations),
            "max_utilization": max(utilizations),
            "min_utilization": min(utilizations),
            "current_utilization": utilizations[-1] if utilizations else 0,
        }


class CapacityForecaster:
    """Forecasts future capacity needs."""

    def __init__(self):
        self._models: dict[ResourceType, dict[PlanningHorizon, Any]] = {}
        self._history_size = 1000

    def forecast(
        self,
        resource_type: ResourceType,
        history: list[ResourceUsage],
        horizon: PlanningHorizon,
    ) -> CapacityForecast:
        """Generate a capacity forecast."""
        if len(history) < 10:
            return self._create_minimal_forecast(resource_type, horizon, history)

        # Calculate trend
        values = [h.utilization for h in history[-50:]]
        trend = self._calculate_trend(values)

        # Project future utilization
        current = values[-1] if values else 0
        horizon_hours = self._get_horizon_hours(horizon)

        # Simple linear projection
        predicted_utilization = current + (trend * horizon_hours)

        # Estimate time to exhaustion
        time_to_exhaustion = None
        if trend > 0 and current < 100:
            time_to_exhaustion = (100 - current) / trend

        # Calculate confidence based on data quality
        confidence = self._calculate_confidence(history, trend)

        # Generate recommendations
        recommendations = self._generate_recommendations(
            current, predicted_utilization, trend, time_to_exhaustion
        )

        return CapacityForecast(
            forecast_id=f"forecast-{uuid.uuid4().hex[:8]}",
            resource_type=resource_type,
            horizon=horizon,
            current_capacity=history[-1].total if history else 0,
            predicted_demand=predicted_utilization / 100 * (history[-1].total if history else 1),
            predicted_utilization=min(100, max(0, predicted_utilization)),
            confidence=confidence,
            time_to_exhaustion=time_to_exhaustion,
            recommendations=recommendations,
        )

    def _create_minimal_forecast(
        self,
        resource_type: ResourceType,
        horizon: PlanningHorizon,
        history: list[ResourceUsage],
    ) -> CapacityForecast:
        """Create a forecast with minimal data."""
        current = history[-1] if history else None
        return CapacityForecast(
            forecast_id=f"forecast-{uuid.uuid4().hex[:8]}",
            resource_type=resource_type,
            horizon=horizon,
            current_capacity=current.total if current else 0,
            predicted_demand=current.utilization if current else 0,
            predicted_utilization=current.utilization if current else 0,
            confidence=0.3,
            recommendations=["Insufficient data for accurate forecasting"],
        )

    def _calculate_trend(self, values: list[float]) -> float:
        """Calculate trend (change per hour)."""
        if len(values) < 2:
            return 0.0

        # Simple linear regression
        n = len(values)
        x = list(range(n))
        y = values

        sum_x = sum(x)
        sum_y = sum(y)
        sum_xy = sum(xi * yi for xi, yi in zip(x, y))
        sum_xx = sum(xi * xi for xi in x)

        denominator = n * sum_xx - sum_x * sum_x
        if denominator == 0:
            return 0.0

        slope = (n * sum_xy - sum_x * sum_y) / denominator
        return slope

    def _get_horizon_hours(self, horizon: PlanningHorizon) -> float:
        """Get horizon in hours."""
        if horizon == PlanningHorizon.SHORT_TERM:
            return 24.0
        elif horizon == PlanningHorizon.MEDIUM_TERM:
            return 168.0  # 7 days
        else:
            return 720.0  # 30 days

    def _calculate_confidence(
        self,
        history: list[ResourceUsage],
        trend: float,
    ) -> float:
        """Calculate forecast confidence."""
        # Base confidence on data quantity
        data_confidence = min(1.0, len(history) / 100)

        # Reduce confidence for volatile trends
        if abs(trend) > 1.0:
            trend_confidence = 0.7
        else:
            trend_confidence = 1.0

        return data_confidence * trend_confidence * 0.8

    def _generate_recommendations(
        self,
        current: float,
        predicted: float,
        trend: float,
        time_to_exhaustion: float | None,
    ) -> list[str]:
        """Generate recommendations based on forecast."""
        recommendations = []

        if predicted > 90:
            recommendations.append("Urgent: Scale up resources immediately")
        elif predicted > 75:
            recommendations.append("Consider scaling up resources soon")
        elif predicted < 30:
            recommendations.append("Opportunity to scale down and save costs")

        if time_to_exhaustion and time_to_exhaustion < 24:
            recommendations.append(
                f"Capacity exhaustion predicted in {time_to_exhaustion:.1f} hours"
            )

        if trend > 0.5:
            recommendations.append("Sustained growth pattern detected")

        if not recommendations:
            recommendations.append("Capacity levels are healthy")

        return recommendations


class ResourceOptimizer:
    """Optimizes resource allocation."""

    def __init__(self):
        self._optimization_rules: list[Callable[[CapacityMetric], list[CapacityRecommendation]]] = []
        self._cost_per_unit: dict[ResourceType, float] = {
            ResourceType.CPU: 0.05,
            ResourceType.MEMORY: 0.01,
            ResourceType.STORAGE: 0.001,
            ResourceType.NETWORK: 0.0001,
            ResourceType.GPU: 0.50,
        }

    def set_cost_per_unit(
        self,
        resource_type: ResourceType,
        cost: float,
    ) -> None:
        """Set cost per unit for a resource type."""
        self._cost_per_unit[resource_type] = cost

    def add_optimization_rule(
        self,
        rule: Callable[[CapacityMetric], list[CapacityRecommendation]],
    ) -> None:
        """Add an optimization rule."""
        self._optimization_rules.append(rule)

    def optimize(
        self,
        metrics: list[CapacityMetric],
        constraints: dict[str, Any] | None = None,
    ) -> list[CapacityRecommendation]:
        """Generate optimization recommendations."""
        recommendations = []

        for metric in metrics:
            # Apply default rules
            recommendations.extend(self._default_optimizations(metric))

            # Apply custom rules
            for rule in self._optimization_rules:
                try:
                    recommendations.extend(rule(metric))
                except Exception:
                    pass

        # Sort by priority
        recommendations.sort(key=lambda r: r.priority)

        return recommendations

    def _default_optimizations(
        self,
        metric: CapacityMetric,
    ) -> list[CapacityRecommendation]:
        """Generate default optimization recommendations."""
        recommendations = []
        current = metric.current_value

        if current > metric.threshold_critical:
            # Critical - need immediate scale up
            recommended = current * 1.5
            recommendations.append(CapacityRecommendation(
                recommendation_id=f"rec-{uuid.uuid4().hex[:8]}",
                recommendation_type=RecommendationType.SCALE_UP,
                resource_type=metric.resource_type,
                target=metric.name,
                current_value=current,
                recommended_value=recommended,
                estimated_cost_impact=self._estimate_cost(
                    metric.resource_type, current, recommended
                ),
                estimated_performance_impact=0.3,
                confidence=ConfidenceLevel.HIGH,
                priority=1,
                rationale=f"Critical utilization ({current:.1f}%) requires immediate scaling",
            ))

        elif current > metric.threshold_warning:
            # Warning - plan for scale up
            recommended = current * 1.3
            recommendations.append(CapacityRecommendation(
                recommendation_id=f"rec-{uuid.uuid4().hex[:8]}",
                recommendation_type=RecommendationType.SCALE_UP,
                resource_type=metric.resource_type,
                target=metric.name,
                current_value=current,
                recommended_value=recommended,
                estimated_cost_impact=self._estimate_cost(
                    metric.resource_type, current, recommended
                ),
                estimated_performance_impact=0.15,
                confidence=ConfidenceLevel.MEDIUM,
                priority=2,
                rationale=f"Approaching capacity threshold ({current:.1f}%)",
            ))

        elif current < 30 and metric.trend <= 0:
            # Under-utilized - can scale down
            recommended = max(current * 1.5, 30)  # Keep at least 30% headroom
            recommendations.append(CapacityRecommendation(
                recommendation_id=f"rec-{uuid.uuid4().hex[:8]}",
                recommendation_type=RecommendationType.SCALE_DOWN,
                resource_type=metric.resource_type,
                target=metric.name,
                current_value=current,
                recommended_value=recommended,
                estimated_cost_impact=-self._estimate_cost(
                    metric.resource_type, recommended, current
                ),
                estimated_performance_impact=-0.05,
                confidence=ConfidenceLevel.MEDIUM,
                priority=3,
                rationale=f"Under-utilized ({current:.1f}%), opportunity to reduce costs",
            ))

        return recommendations

    def _estimate_cost(
        self,
        resource_type: ResourceType,
        current: float,
        recommended: float,
    ) -> float:
        """Estimate cost impact of a change."""
        cost_per_unit = self._cost_per_unit.get(resource_type, 0.01)
        return (recommended - current) * cost_per_unit


class CostAnalyzer:
    """Analyzes infrastructure costs."""

    def __init__(self):
        self._cost_history: list[dict[str, Any]] = []
        self._pricing: dict[str, float] = {}

    def set_pricing(self, resource_name: str, cost_per_unit: float) -> None:
        """Set pricing for a resource."""
        self._pricing[resource_name] = cost_per_unit

    def estimate_monthly_cost(
        self,
        resources: dict[str, float],
    ) -> float:
        """Estimate monthly cost for resources."""
        total = 0.0
        for resource_name, amount in resources.items():
            cost_per_unit = self._pricing.get(resource_name, 0)
            total += amount * cost_per_unit * 730  # Hours in a month
        return total

    def compare_options(
        self,
        current: dict[str, float],
        recommended: dict[str, float],
    ) -> dict[str, Any]:
        """Compare cost of current vs recommended configuration."""
        current_cost = self.estimate_monthly_cost(current)
        recommended_cost = self.estimate_monthly_cost(recommended)

        return {
            "current_monthly_cost": current_cost,
            "recommended_monthly_cost": recommended_cost,
            "difference": recommended_cost - current_cost,
            "percentage_change": ((recommended_cost - current_cost) / current_cost * 100) if current_cost > 0 else 0,
        }

    def record_cost(
        self,
        resources: dict[str, float],
        cost: float,
        timestamp: float | None = None,
    ) -> None:
        """Record a cost snapshot."""
        self._cost_history.append({
            "resources": resources.copy(),
            "cost": cost,
            "timestamp": timestamp or time.time(),
        })

    def get_cost_trend(self, days: int = 30) -> dict[str, Any]:
        """Get cost trend over time."""
        cutoff = time.time() - (days * 24 * 3600)
        recent = [c for c in self._cost_history if c["timestamp"] >= cutoff]

        if len(recent) < 2:
            return {"trend": 0, "data_points": len(recent)}

        costs = [c["cost"] for c in recent]
        return {
            "trend": (costs[-1] - costs[0]) / len(costs) if costs else 0,
            "data_points": len(recent),
            "min_cost": min(costs),
            "max_cost": max(costs),
            "avg_cost": sum(costs) / len(costs),
        }


class CapacityPlanner:
    """Main capacity planning system."""

    def __init__(self):
        self._collector = UsageCollector()
        self._forecaster = CapacityForecaster()
        self._optimizer = ResourceOptimizer()
        self._cost_analyzer = CostAnalyzer()
        self._plans: list[CapacityPlan] = []

    def get_collector(self) -> UsageCollector:
        """Get the usage collector."""
        return self._collector

    def get_forecaster(self) -> CapacityForecaster:
        """Get the capacity forecaster."""
        return self._forecaster

    def get_optimizer(self) -> ResourceOptimizer:
        """Get the resource optimizer."""
        return self._optimizer

    def get_cost_analyzer(self) -> CostAnalyzer:
        """Get the cost analyzer."""
        return self._cost_analyzer

    def collect_usage(self) -> dict[ResourceType, ResourceUsage]:
        """Collect current usage."""
        return self._collector.collect()

    def create_plan(
        self,
        horizon: PlanningHorizon,
        metrics: list[CapacityMetric] | None = None,
    ) -> CapacityPlan:
        """Create a capacity plan."""
        forecasts = []
        recommendations = []

        # Generate forecasts for each resource type
        for resource_type in ResourceType:
            history = self._collector.get_history(resource_type)
            if history:
                forecast = self._forecaster.forecast(resource_type, history, horizon)
                forecasts.append(forecast)

        # Generate optimization recommendations
        if metrics:
            recommendations = self._optimizer.optimize(metrics)

        # Calculate total estimated cost
        total_cost = sum(
            r.estimated_cost_impact for r in recommendations
        )

        # Calculate risk score
        risk_score = self._calculate_risk_score(forecasts)

        plan = CapacityPlan(
            plan_id=f"plan-{uuid.uuid4().hex[:8]}",
            horizon=horizon,
            forecasts=forecasts,
            recommendations=recommendations,
            total_estimated_cost=total_cost,
            risk_score=risk_score,
        )

        self._plans.append(plan)
        return plan

    def _calculate_risk_score(
        self,
        forecasts: list[CapacityForecast],
    ) -> float:
        """Calculate overall risk score."""
        if not forecasts:
            return 0.0

        risks = []
        for forecast in forecasts:
            if forecast.predicted_utilization > 90:
                risks.append(1.0)
            elif forecast.predicted_utilization > 80:
                risks.append(0.7)
            elif forecast.predicted_utilization > 70:
                risks.append(0.4)
            else:
                risks.append(0.1)

        return sum(risks) / len(risks)

    def get_plans(self, limit: int = 10) -> list[CapacityPlan]:
        """Get recent capacity plans."""
        return sorted(self._plans, key=lambda p: p.created_at, reverse=True)[:limit]

    def get_plan(self, plan_id: str) -> CapacityPlan | None:
        """Get a specific plan."""
        for plan in self._plans:
            if plan.plan_id == plan_id:
                return plan
        return None

    def get_summary(self) -> dict[str, Any]:
        """Get capacity planning summary."""
        summary = {
            "total_plans": len(self._plans),
            "resource_statistics": {},
        }

        for resource_type in ResourceType:
            stats = self._collector.get_statistics(resource_type)
            if stats["count"] > 0:
                summary["resource_statistics"][resource_type.value] = stats

        return summary


def create_capacity_planner() -> CapacityPlanner:
    """Factory function to create a capacity planner."""
    return CapacityPlanner()


def create_resource_usage(
    resource_type: ResourceType,
    used: float,
    total: float,
) -> ResourceUsage:
    """Factory function to create a resource usage snapshot."""
    return ResourceUsage(
        resource_type=resource_type,
        used=used,
        total=total,
    )


def create_capacity_metric(
    name: str,
    resource_type: ResourceType,
    current_value: float,
    unit: str,
    **kwargs,
) -> CapacityMetric:
    """Factory function to create a capacity metric."""
    return CapacityMetric(
        name=name,
        resource_type=resource_type,
        current_value=current_value,
        unit=unit,
        **kwargs,
    )
