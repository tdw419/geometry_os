"""
Autonomous Scaling - Phase 57

Scale resources automatically based on demand predictions.
"""

import asyncio
import math
import time
import uuid
from collections import deque
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class ScalingDirection(Enum):
    """Direction of scaling."""
    UP = "up"
    DOWN = "down"
    NONE = "none"


class ScalingStatus(Enum):
    """Status of a scaling operation."""
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    FAILED = "failed"
    ROLLED_BACK = "rolled_back"
    CANCELLED = "cancelled"


class ScalingTrigger(Enum):
    """What triggered the scaling."""
    METRIC_THRESHOLD = "metric_threshold"
    PREDICTION = "prediction"
    SCHEDULE = "schedule"
    MANUAL = "manual"
    ANOMALY = "anomaly"
    COST_OPTIMIZATION = "cost_optimization"


class ResourceType(Enum):
    """Types of scalable resources."""
    CONTAINERS = "containers"
    PODS = "pods"
    INSTANCES = "instances"
    CPU = "cpu"
    MEMORY = "memory"
    STORAGE = "storage"
    CUSTOM = "custom"


@dataclass
class ScalingMetrics:
    """Metrics for scaling decisions."""
    cpu_utilization: float = 0.0
    memory_utilization: float = 0.0
    request_rate: float = 0.0
    response_time: float = 0.0
    error_rate: float = 0.0
    queue_depth: int = 0
    active_connections: int = 0
    custom_metrics: dict[str, float] = field(default_factory=dict)
    timestamp: float = field(default_factory=time.time)


@dataclass
class ScalingThreshold:
    """Thresholds for scaling decisions."""
    metric_name: str
    scale_up_threshold: float
    scale_down_threshold: float
    evaluation_window: float = 60.0  # seconds
    cooldown_period: float = 300.0  # seconds
    hysteresis: float = 0.1  # 10% buffer


@dataclass
class ScalingPolicy:
    """Policy for scaling a service."""
    policy_id: str
    name: str
    service_name: str
    resource_type: ResourceType
    min_instances: int = 1
    max_instances: int = 100
    scale_up_increment: int = 1
    scale_down_increment: int = 1
    scale_up_cooldown: float = 60.0
    scale_down_cooldown: float = 300.0
    thresholds: list[ScalingThreshold] = field(default_factory=list)
    enabled: bool = True
    prediction_enabled: bool = True
    cost_aware: bool = True


@dataclass
class ScalingAction:
    """A scaling action to be executed."""
    action_id: str
    service_name: str
    resource_type: ResourceType
    direction: ScalingDirection
    current_count: int
    target_count: int
    trigger: ScalingTrigger
    reason: str
    status: ScalingStatus = ScalingStatus.PENDING
    created_at: float = field(default_factory=time.time)
    started_at: float | None = None
    completed_at: float | None = None
    error_message: str | None = None
    cost_impact: float = 0.0


@dataclass
class ScalingPlan:
    """A plan for scaling operations."""
    plan_id: str
    actions: list[ScalingAction] = field(default_factory=list)
    total_cost_impact: float = 0.0
    predicted_improvement: float = 0.0
    confidence: float = 0.0
    created_at: float = field(default_factory=time.time)


@dataclass
class ScalingEvent:
    """Record of a scaling event."""
    event_id: str
    service_name: str
    action: ScalingAction
    metrics_before: ScalingMetrics
    metrics_after: ScalingMetrics | None = None
    success: bool = False
    duration_seconds: float = 0.0
    timestamp: float = field(default_factory=time.time)


class DemandPredictor:
    """Predicts future demand for services."""

    def __init__(self, history_size: int = 1000):
        self._history_size = history_size
        self._demand_history: dict[str, deque] = {}
        self._prediction_models: dict[str, Any] = {}

    def record_demand(
        self,
        service_name: str,
        demand: float,
        timestamp: float | None = None,
    ) -> None:
        """Record a demand observation."""
        if service_name not in self._demand_history:
            self._demand_history[service_name] = deque(maxlen=self._history_size)

        self._demand_history[service_name].append({
            "demand": demand,
            "timestamp": timestamp or time.time(),
        })

    def predict(
        self,
        service_name: str,
        horizon_seconds: float = 300.0,
    ) -> tuple[float, float]:
        """Predict future demand and confidence."""
        if service_name not in self._demand_history:
            return 0.0, 0.0

        history = list(self._demand_history[service_name])
        if len(history) < 10:
            # Not enough data
            if history:
                return history[-1]["demand"], 0.3
            return 0.0, 0.0

        # Simple trend-based prediction
        values = [h["demand"] for h in history[-50:]]
        current = values[-1]

        # Calculate trend
        if len(values) >= 10:
            recent = values[-10:]
            older = values[-20:-10] if len(values) >= 20 else values[:10]
            trend = (sum(recent) / len(recent) - sum(older) / len(older)) / len(older) if sum(older) > 0 else 0
        else:
            trend = 0

        # Project forward
        periods = horizon_seconds / 60  # Assuming data is per-minute
        predicted = current * (1 + trend * periods)

        # Confidence based on data quantity and trend stability
        confidence = min(0.9, len(history) / 100) * (1 - abs(trend) * 0.5)
        confidence = max(0.1, min(0.9, confidence))

        return predicted, confidence

    def predict_pattern(self, service_name: str) -> dict[str, Any]:
        """Analyze demand pattern."""
        if service_name not in self._demand_history:
            return {"pattern": "unknown", "volatility": 0}

        history = list(self._demand_history[service_name])
        if len(history) < 10:
            return {"pattern": "insufficient_data", "volatility": 0}

        values = [h["demand"] for h in history]
        mean = sum(values) / len(values)
        variance = sum((v - mean) ** 2 for v in values) / len(values)
        std_dev = math.sqrt(variance)

        volatility = std_dev / mean if mean > 0 else 0

        if volatility < 0.1:
            pattern = "stable"
        elif volatility < 0.3:
            pattern = "variable"
        else:
            pattern = "highly_variable"

        return {
            "pattern": pattern,
            "volatility": volatility,
            "mean_demand": mean,
            "std_dev": std_dev,
            "min": min(values),
            "max": max(values),
        }

    def get_prediction_stats(self) -> dict[str, Any]:
        """Get prediction statistics."""
        return {
            "services_tracked": len(self._demand_history),
            "total_observations": sum(len(h) for h in self._demand_history.values()),
        }


class ScalingPredictor:
    """Predicts when scaling will be needed."""

    def __init__(self, demand_predictor: DemandPredictor):
        self._demand_predictor = demand_predictor
        self._scaling_history: dict[str, list[dict[str, Any]]] = {}

    def predict_scaling_need(
        self,
        service_name: str,
        current_instances: int,
        capacity_per_instance: float,
        horizon_seconds: float = 300.0,
    ) -> dict[str, Any]:
        """Predict if scaling will be needed."""
        predicted_demand, confidence = self._demand_predictor.predict(
            service_name, horizon_seconds
        )

        current_capacity = current_instances * capacity_per_instance
        utilization = predicted_demand / current_capacity if current_capacity > 0 else 0

        result = {
            "predicted_demand": predicted_demand,
            "predicted_utilization": utilization,
            "confidence": confidence,
            "needs_scaling": False,
            "direction": ScalingDirection.NONE,
            "recommended_instances": current_instances,
            "time_to_scale": None,
        }

        if utilization > 0.9:
            # Will need scale up
            result["needs_scaling"] = True
            result["direction"] = ScalingDirection.UP
            result["recommended_instances"] = math.ceil(predicted_demand / (capacity_per_instance * 0.7))

            # Estimate time to scale
            if utilization > 1.0:
                result["time_to_scale"] = 0  # Already exceeded
            else:
                result["time_to_scale"] = horizon_seconds * (1 - utilization / 0.9)

        elif utilization < 0.3:
            # Can scale down
            result["needs_scaling"] = True
            result["direction"] = ScalingDirection.DOWN
            result["recommended_instances"] = max(1, math.ceil(predicted_demand / (capacity_per_instance * 0.6)))

        return result

    def record_scaling_event(
        self,
        service_name: str,
        instances_before: int,
        instances_after: int,
        metrics_before: ScalingMetrics,
        metrics_after: ScalingMetrics,
    ) -> None:
        """Record a scaling event for learning."""
        if service_name not in self._scaling_history:
            self._scaling_history[service_name] = []

        self._scaling_history[service_name].append({
            "instances_before": instances_before,
            "instances_after": instances_after,
            "metrics_before": metrics_before,
            "metrics_after": metrics_after,
            "timestamp": time.time(),
        })

    def get_optimal_instance_count(
        self,
        service_name: str,
        target_utilization: float = 0.7,
    ) -> int | None:
        """Get optimal instance count from history."""
        if service_name not in self._scaling_history:
            return None

        history = self._scaling_history[service_name]
        if not history:
            return None

        # Find the most successful scaling
        best = None
        best_score = -1

        for event in history:
            if event["metrics_after"]:
                util = event["metrics_after"].cpu_utilization
                score = 1 - abs(util - target_utilization)
                if score > best_score:
                    best_score = score
                    best = event["instances_after"]

        return best

    def get_stats(self) -> dict[str, Any]:
        """Get scaling predictor statistics."""
        return {
            "services_with_history": len(self._scaling_history),
            "total_events": sum(len(h) for h in self._scaling_history.values()),
        }


class ScalingCoordinator:
    """Coordinates scaling across multiple services."""

    def __init__(self):
        self._dependencies: dict[str, set[str]] = {}
        self._scaling_policies: dict[str, ScalingPolicy] = {}
        self._pending_scaling: dict[str, ScalingAction] = {}
        self._scaling_locks: set[str] = set()

    def add_dependency(
        self,
        service_name: str,
        depends_on: str,
    ) -> None:
        """Add a dependency between services."""
        if service_name not in self._dependencies:
            self._dependencies[service_name] = set()
        self._dependencies[service_name].add(depends_on)

    def remove_dependency(
        self,
        service_name: str,
        depends_on: str,
    ) -> None:
        """Remove a dependency."""
        if service_name in self._dependencies:
            self._dependencies[service_name].discard(depends_on)

    def register_policy(self, policy: ScalingPolicy) -> None:
        """Register a scaling policy."""
        self._scaling_policies[policy.service_name] = policy

    def can_scale(self, service_name: str) -> tuple[bool, str]:
        """Check if a service can be scaled."""
        # Check if already scaling
        if service_name in self._scaling_locks:
            return False, "Service is already being scaled"

        # Check dependencies
        if service_name in self._dependencies:
            for dep in self._dependencies[service_name]:
                if dep in self._scaling_locks:
                    return False, f"Dependency {dep} is being scaled"

        return True, "OK"

    def acquire_lock(self, service_name: str) -> bool:
        """Acquire scaling lock for a service."""
        can, _ = self.can_scale(service_name)
        if can:
            self._scaling_locks.add(service_name)
            return True
        return False

    def release_lock(self, service_name: str) -> None:
        """Release scaling lock."""
        self._scaling_locks.discard(service_name)

    def plan_coordinated_scaling(
        self,
        service_name: str,
        target_instances: int,
    ) -> ScalingPlan:
        """Plan scaling that considers dependencies."""
        plan = ScalingPlan(plan_id=f"plan-{uuid.uuid4().hex[:8]}")

        # Get the main service action
        policy = self._scaling_policies.get(service_name)
        if not policy:
            return plan

        current = self._get_current_instances(service_name)
        direction = ScalingDirection.UP if target_instances > current else ScalingDirection.DOWN

        # Create main action
        action = ScalingAction(
            action_id=f"action-{uuid.uuid4().hex[:8]}",
            service_name=service_name,
            resource_type=policy.resource_type,
            direction=direction,
            current_count=current,
            target_count=target_instances,
            trigger=ScalingTrigger.PREDICTION,
            reason="Coordinated scaling",
        )
        plan.actions.append(action)

        # Check if dependencies need scaling
        self._add_dependency_actions(service_name, direction, plan)

        # Calculate total impact
        plan.total_cost_impact = sum(a.cost_impact for a in plan.actions)

        return plan

    def _add_dependency_actions(
        self,
        service_name: str,
        direction: ScalingDirection,
        plan: ScalingPlan,
    ) -> None:
        """Add scaling actions for dependencies."""
        if service_name not in self._dependencies:
            return

        for dep in self._dependencies[service_name]:
            dep_policy = self._scaling_policies.get(dep)
            if not dep_policy or not dep_policy.enabled:
                continue

            # Scale dependencies in same direction
            current = self._get_current_instances(dep)
            if direction == ScalingDirection.UP:
                target = min(current + 1, dep_policy.max_instances)
            else:
                target = max(current - 1, dep_policy.min_instances)

            if target != current:
                action = ScalingAction(
                    action_id=f"action-{uuid.uuid4().hex[:8]}",
                    service_name=dep,
                    resource_type=dep_policy.resource_type,
                    direction=direction,
                    current_count=current,
                    target_count=target,
                    trigger=ScalingTrigger.PREDICTION,
                    reason=f"Dependency of {service_name}",
                )
                plan.actions.append(action)

    def _get_current_instances(self, service_name: str) -> int:
        """Get current instance count for a service."""
        # Would be implemented to query actual state
        return 1

    def get_stats(self) -> dict[str, Any]:
        """Get coordinator statistics."""
        return {
            "registered_policies": len(self._scaling_policies),
            "dependencies": sum(len(deps) for deps in self._dependencies.values()),
            "currently_scaling": len(self._scaling_locks),
        }


class CostAwareScaler:
    """Considers costs in scaling decisions."""

    def __init__(self):
        self._cost_per_instance: dict[str, float] = {}
        self._budget_limits: dict[str, float] = {}
        self._current_spend: dict[str, float] = {}
        self._cost_history: list[dict[str, Any]] = []

    def set_instance_cost(
        self,
        instance_type: str,
        cost_per_hour: float,
    ) -> None:
        """Set cost per instance type."""
        self._cost_per_instance[instance_type] = cost_per_hour

    def set_budget_limit(
        self,
        service_name: str,
        monthly_limit: float,
    ) -> None:
        """Set budget limit for a service."""
        self._budget_limits[service_name] = monthly_limit

    def calculate_cost_impact(
        self,
        service_name: str,
        current_instances: int,
        target_instances: int,
        instance_type: str = "standard",
    ) -> float:
        """Calculate cost impact of scaling."""
        cost_per_hour = self._cost_per_instance.get(instance_type, 0.1)
        instance_delta = target_instances - current_instances

        # Monthly impact
        monthly_hours = 730
        return instance_delta * cost_per_hour * monthly_hours

    def can_afford_scaling(
        self,
        service_name: str,
        cost_impact: float,
    ) -> bool:
        """Check if scaling is within budget."""
        if service_name not in self._budget_limits:
            return True  # No budget set

        limit = self._budget_limits[service_name]
        current = self._current_spend.get(service_name, 0)

        return (current + cost_impact) <= limit

    def record_spend(
        self,
        service_name: str,
        amount: float,
    ) -> None:
        """Record spending for a service."""
        if service_name not in self._current_spend:
            self._current_spend[service_name] = 0
        self._current_spend[service_name] += amount

        self._cost_history.append({
            "service": service_name,
            "amount": amount,
            "timestamp": time.time(),
        })

    def get_cost_optimization_suggestion(
        self,
        service_name: str,
        current_utilization: float,
    ) -> dict[str, Any] | None:
        """Get cost optimization suggestion."""
        if current_utilization < 0.3:
            # Under-utilized, can scale down
            return {
                "suggestion": "scale_down",
                "rationale": f"Low utilization ({current_utilization:.1%})",
                "potential_savings": "20-40%",
            }
        elif current_utilization > 0.9:
            # Over-utilized, might need scale up (costs more)
            return {
                "suggestion": "scale_up",
                "rationale": f"High utilization ({current_utilization:.1%})",
                "potential_cost": "10-20% increase",
            }
        return None

    def get_stats(self) -> dict[str, Any]:
        """Get cost scaler statistics."""
        return {
            "services_with_budgets": len(self._budget_limits),
            "total_current_spend": sum(self._current_spend.values()),
            "cost_events": len(self._cost_history),
        }


class ScalingEngine:
    """Main engine for autonomous scaling."""

    def __init__(self):
        self._demand_predictor = DemandPredictor()
        self._scaling_predictor = ScalingPredictor(self._demand_predictor)
        self._coordinator = ScalingCoordinator()
        self._cost_scaler = CostAwareScaler()
        self._policies: dict[str, ScalingPolicy] = {}
        self._current_instances: dict[str, int] = {}
        self._scaling_history: list[ScalingEvent] = []
        self._last_scale_time: dict[str, float] = {}
        self._executors: dict[ResourceType, Callable[[ScalingAction], bool]] = {}
        self._event_handlers: list[Callable[[ScalingEvent], None]] = []

    def get_demand_predictor(self) -> DemandPredictor:
        """Get the demand predictor."""
        return self._demand_predictor

    def get_scaling_predictor(self) -> ScalingPredictor:
        """Get the scaling predictor."""
        return self._scaling_predictor

    def get_coordinator(self) -> ScalingCoordinator:
        """Get the scaling coordinator."""
        return self._coordinator

    def get_cost_scaler(self) -> CostAwareScaler:
        """Get the cost-aware scaler."""
        return self._cost_scaler

    def register_policy(self, policy: ScalingPolicy) -> None:
        """Register a scaling policy."""
        self._policies[policy.service_name] = policy
        self._coordinator.register_policy(policy)

        if policy.service_name not in self._current_instances:
            self._current_instances[policy.service_name] = policy.min_instances

    def set_current_instances(
        self,
        service_name: str,
        count: int,
    ) -> None:
        """Set current instance count for a service."""
        self._current_instances[service_name] = count

    def register_executor(
        self,
        resource_type: ResourceType,
        executor: Callable[[ScalingAction], bool],
    ) -> None:
        """Register an executor for a resource type."""
        self._executors[resource_type] = executor

    def evaluate_scaling(
        self,
        service_name: str,
        metrics: ScalingMetrics,
    ) -> ScalingAction | None:
        """Evaluate if scaling is needed."""
        if service_name not in self._policies:
            return None

        policy = self._policies[service_name]
        if not policy.enabled:
            return None

        # Record demand
        self._demand_predictor.record_demand(service_name, metrics.request_rate)

        # Check cooldown
        last_scale = self._last_scale_time.get(service_name, 0)
        cooldown_remaining = (last_scale + policy.scale_up_cooldown) - time.time()
        if cooldown_remaining > 0:
            return None

        # Check thresholds
        current = self._current_instances.get(service_name, policy.min_instances)

        for threshold in policy.thresholds:
            value = self._get_metric_value(metrics, threshold.metric_name)

            if value > threshold.scale_up_threshold:
                if current < policy.max_instances:
                    return self._create_action(
                        service_name, policy, current,
                        min(current + policy.scale_up_increment, policy.max_instances),
                        ScalingTrigger.METRIC_THRESHOLD,
                        f"{threshold.metric_name} exceeded threshold",
                    )

            elif value < threshold.scale_down_threshold:
                if current > policy.min_instances:
                    return self._create_action(
                        service_name, policy, current,
                        max(current - policy.scale_down_increment, policy.min_instances),
                        ScalingTrigger.METRIC_THRESHOLD,
                        f"{threshold.metric_name} below threshold",
                    )

        # Check predictions
        if policy.prediction_enabled:
            prediction = self._scaling_predictor.predict_scaling_need(
                service_name,
                current,
                capacity_per_instance=100,  # Would be configured
            )

            if prediction["needs_scaling"] and prediction["confidence"] >= 0.7:
                target = max(policy.min_instances,
                            min(policy.max_instances, prediction["recommended_instances"]))
                if target != current:
                    return self._create_action(
                        service_name, policy, current, target,
                        ScalingTrigger.PREDICTION,
                        f"Predicted need: {prediction['direction'].value}",
                    )

        return None

    def _get_metric_value(self, metrics: ScalingMetrics, metric_name: str) -> float:
        """Get metric value by name."""
        metric_map = {
            "cpu": metrics.cpu_utilization,
            "memory": metrics.memory_utilization,
            "request_rate": metrics.request_rate,
            "response_time": metrics.response_time,
            "error_rate": metrics.error_rate,
            "queue_depth": float(metrics.queue_depth),
            "connections": float(metrics.active_connections),
        }
        return metric_map.get(metric_name, metrics.custom_metrics.get(metric_name, 0))

    def _create_action(
        self,
        service_name: str,
        policy: ScalingPolicy,
        current: int,
        target: int,
        trigger: ScalingTrigger,
        reason: str,
    ) -> ScalingAction:
        """Create a scaling action."""
        cost_impact = self._cost_scaler.calculate_cost_impact(
            service_name, current, target
        )

        return ScalingAction(
            action_id=f"action-{uuid.uuid4().hex[:8]}",
            service_name=service_name,
            resource_type=policy.resource_type,
            direction=ScalingDirection.UP if target > current else ScalingDirection.DOWN,
            current_count=current,
            target_count=target,
            trigger=trigger,
            reason=reason,
            cost_impact=cost_impact,
        )

    async def execute_scaling(self, action: ScalingAction) -> bool:
        """Execute a scaling action."""
        # Check if we can scale
        can_scale, reason = self._coordinator.can_scale(action.service_name)
        if not can_scale:
            action.status = ScalingStatus.CANCELLED
            action.error_message = reason
            return False

        # Check budget
        if not self._cost_scaler.can_afford_scaling(
            action.service_name, action.cost_impact
        ):
            action.status = ScalingStatus.CANCELLED
            action.error_message = "Budget limit exceeded"
            return False

        # Acquire lock
        if not self._coordinator.acquire_lock(action.service_name):
            action.status = ScalingStatus.CANCELLED
            action.error_message = "Could not acquire scaling lock"
            return False

        try:
            action.status = ScalingStatus.IN_PROGRESS
            action.started_at = time.time()

            # Get executor
            executor = self._executors.get(action.resource_type)
            if not executor:
                action.status = ScalingStatus.FAILED
                action.error_message = f"No executor for {action.resource_type.value}"
                return False

            # Execute
            success = await asyncio.get_event_loop().run_in_executor(
                None, executor, action
            )

            action.completed_at = time.time()

            if success:
                action.status = ScalingStatus.COMPLETED
                self._current_instances[action.service_name] = action.target_count
                self._last_scale_time[action.service_name] = time.time()

                # Record cost
                self._cost_scaler.record_spend(
                    action.service_name,
                    action.cost_impact / 730  # Hourly rate
                )
            else:
                action.status = ScalingStatus.FAILED
                action.error_message = "Executor returned false"

            return success

        finally:
            self._coordinator.release_lock(action.service_name)

    def add_event_handler(
        self,
        handler: Callable[[ScalingEvent], None],
    ) -> None:
        """Add a handler for scaling events."""
        self._event_handlers.append(handler)

    def get_policy(self, service_name: str) -> ScalingPolicy | None:
        """Get scaling policy for a service."""
        return self._policies.get(service_name)

    def get_current_instances(self, service_name: str) -> int:
        """Get current instance count."""
        return self._current_instances.get(service_name, 0)

    def get_scaling_history(
        self,
        service_name: str | None = None,
        limit: int = 100,
    ) -> list[ScalingEvent]:
        """Get scaling history."""
        history = self._scaling_history
        if service_name:
            history = [e for e in history if e.service_name == service_name]
        return history[-limit:]

    def get_stats(self) -> dict[str, Any]:
        """Get engine statistics."""
        return {
            "registered_services": len(self._policies),
            "demand_predictor": self._demand_predictor.get_prediction_stats(),
            "scaling_predictor": self._scaling_predictor.get_stats(),
            "coordinator": self._coordinator.get_stats(),
            "cost_scaler": self._cost_scaler.get_stats(),
            "total_scaling_events": len(self._scaling_history),
        }


def create_scaling_engine() -> ScalingEngine:
    """Factory function to create a scaling engine."""
    return ScalingEngine()


def create_scaling_policy(
    service_name: str,
    resource_type: ResourceType = ResourceType.CONTAINERS,
    **kwargs,
) -> ScalingPolicy:
    """Factory function to create a scaling policy."""
    return ScalingPolicy(
        policy_id=f"policy-{uuid.uuid4().hex[:8]}",
        name=f"{service_name}-policy",
        service_name=service_name,
        resource_type=resource_type,
        **kwargs,
    )


def create_scaling_metrics(**kwargs) -> ScalingMetrics:
    """Factory function to create scaling metrics."""
    return ScalingMetrics(**kwargs)


def create_scaling_threshold(
    metric_name: str,
    scale_up: float,
    scale_down: float,
    **kwargs,
) -> ScalingThreshold:
    """Factory function to create a scaling threshold."""
    return ScalingThreshold(
        metric_name=metric_name,
        scale_up_threshold=scale_up,
        scale_down_threshold=scale_down,
        **kwargs,
    )
