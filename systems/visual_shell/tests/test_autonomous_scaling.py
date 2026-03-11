"""
Tests for Autonomous Scaling - Phase 57

Tests automatic scaling based on demand predictions.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.autonomous_scaling import (
    CostAwareScaler,
    DemandPredictor,
    ResourceType,
    ScalingAction,
    ScalingCoordinator,
    ScalingDirection,
    ScalingEngine,
    ScalingEvent,
    ScalingMetrics,
    ScalingPlan,
    ScalingPolicy,
    ScalingPredictor,
    ScalingStatus,
    ScalingThreshold,
    ScalingTrigger,
    create_scaling_engine,
    create_scaling_metrics,
    create_scaling_policy,
    create_scaling_threshold,
)


class TestScalingDirection:
    """Tests for ScalingDirection enum."""

    def test_directions(self):
        assert ScalingDirection.UP.value == "up"
        assert ScalingDirection.DOWN.value == "down"
        assert ScalingDirection.NONE.value == "none"


class TestScalingStatus:
    """Tests for ScalingStatus enum."""

    def test_statuses(self):
        assert ScalingStatus.PENDING.value == "pending"
        assert ScalingStatus.IN_PROGRESS.value == "in_progress"
        assert ScalingStatus.COMPLETED.value == "completed"
        assert ScalingStatus.FAILED.value == "failed"
        assert ScalingStatus.ROLLED_BACK.value == "rolled_back"
        assert ScalingStatus.CANCELLED.value == "cancelled"


class TestScalingTrigger:
    """Tests for ScalingTrigger enum."""

    def test_triggers(self):
        assert ScalingTrigger.METRIC_THRESHOLD.value == "metric_threshold"
        assert ScalingTrigger.PREDICTION.value == "prediction"
        assert ScalingTrigger.SCHEDULE.value == "schedule"
        assert ScalingTrigger.MANUAL.value == "manual"
        assert ScalingTrigger.ANOMALY.value == "anomaly"


class TestResourceType:
    """Tests for ResourceType enum."""

    def test_types(self):
        assert ResourceType.CONTAINERS.value == "containers"
        assert ResourceType.PODS.value == "pods"
        assert ResourceType.INSTANCES.value == "instances"
        assert ResourceType.CPU.value == "cpu"
        assert ResourceType.MEMORY.value == "memory"


class TestScalingMetrics:
    """Tests for ScalingMetrics."""

    def test_metrics_creation(self):
        metrics = ScalingMetrics(
            cpu_utilization=75.0,
            memory_utilization=60.0,
        )
        assert metrics.cpu_utilization == 75.0
        assert metrics.memory_utilization == 60.0

    def test_metrics_defaults(self):
        metrics = ScalingMetrics()
        assert metrics.cpu_utilization == 0.0
        assert metrics.memory_utilization == 0.0
        assert metrics.request_rate == 0.0
        assert metrics.response_time == 0.0
        assert metrics.error_rate == 0.0
        assert metrics.queue_depth == 0
        assert metrics.active_connections == 0
        assert metrics.custom_metrics == {}


class TestScalingThreshold:
    """Tests for ScalingThreshold."""

    def test_threshold_creation(self):
        threshold = ScalingThreshold(
            metric_name="cpu",
            scale_up_threshold=80.0,
            scale_down_threshold=30.0,
        )
        assert threshold.metric_name == "cpu"
        assert threshold.scale_up_threshold == 80.0
        assert threshold.scale_down_threshold == 30.0

    def test_threshold_defaults(self):
        threshold = ScalingThreshold(
            metric_name="cpu",
            scale_up_threshold=80.0,
            scale_down_threshold=30.0,
        )
        assert threshold.evaluation_window == 60.0
        assert threshold.cooldown_period == 300.0
        assert threshold.hysteresis == 0.1


class TestScalingPolicy:
    """Tests for ScalingPolicy."""

    def test_policy_creation(self):
        policy = ScalingPolicy(
            policy_id="policy-1",
            name="test-policy",
            service_name="api-server",
            resource_type=ResourceType.CONTAINERS,
        )
        assert policy.policy_id == "policy-1"
        assert policy.service_name == "api-server"

    def test_policy_defaults(self):
        policy = ScalingPolicy(
            policy_id="policy-1",
            name="test",
            service_name="test",
            resource_type=ResourceType.CONTAINERS,
        )
        assert policy.min_instances == 1
        assert policy.max_instances == 100
        assert policy.scale_up_increment == 1
        assert policy.scale_down_increment == 1
        assert policy.enabled is True


class TestScalingAction:
    """Tests for ScalingAction."""

    def test_action_creation(self):
        action = ScalingAction(
            action_id="action-1",
            service_name="api-server",
            resource_type=ResourceType.CONTAINERS,
            direction=ScalingDirection.UP,
            current_count=2,
            target_count=4,
            trigger=ScalingTrigger.METRIC_THRESHOLD,
            reason="High CPU",
        )
        assert action.action_id == "action-1"
        assert action.direction == ScalingDirection.UP

    def test_action_defaults(self):
        action = ScalingAction(
            action_id="action-1",
            service_name="test",
            resource_type=ResourceType.CONTAINERS,
            direction=ScalingDirection.UP,
            current_count=1,
            target_count=2,
            trigger=ScalingTrigger.MANUAL,
            reason="Test",
        )
        assert action.status == ScalingStatus.PENDING
        assert action.created_at > 0
        assert action.error_message is None


class TestScalingPlan:
    """Tests for ScalingPlan."""

    def test_plan_creation(self):
        plan = ScalingPlan(plan_id="plan-1")
        assert plan.plan_id == "plan-1"

    def test_plan_defaults(self):
        plan = ScalingPlan(plan_id="plan-1")
        assert plan.actions == []
        assert plan.total_cost_impact == 0.0
        assert plan.predicted_improvement == 0.0


class TestScalingEvent:
    """Tests for ScalingEvent."""

    def test_event_creation(self):
        action = ScalingAction(
            action_id="action-1",
            service_name="test",
            resource_type=ResourceType.CONTAINERS,
            direction=ScalingDirection.UP,
            current_count=1,
            target_count=2,
            trigger=ScalingTrigger.MANUAL,
            reason="Test",
        )
        metrics = ScalingMetrics(cpu_utilization=90.0)
        event = ScalingEvent(
            event_id="event-1",
            service_name="test",
            action=action,
            metrics_before=metrics,
        )
        assert event.event_id == "event-1"
        assert event.metrics_after is None


class TestDemandPredictor:
    """Tests for DemandPredictor."""

    @pytest.fixture
    def predictor(self):
        return DemandPredictor(history_size=100)

    def test_predictor_creation(self, predictor):
        assert len(predictor._demand_history) == 0

    def test_record_demand(self, predictor):
        predictor.record_demand("api-server", 100.0)
        assert len(predictor._demand_history["api-server"]) == 1

    def test_predict_insufficient_data(self, predictor):
        predicted, confidence = predictor.predict("unknown-service")
        assert predicted == 0.0
        assert confidence == 0.0

    def test_predict_minimal_data(self, predictor):
        predictor.record_demand("api-server", 100.0)
        predicted, confidence = predictor.predict("api-server")
        assert predicted == 100.0
        assert confidence < 0.5

    def test_predict_with_trend(self, predictor):
        # Record increasing demand
        for i in range(50):
            predictor.record_demand(
                "api-server",
                100.0 + i * 10,
                timestamp=time.time() - (50 - i) * 60,
            )

        predicted, confidence = predictor.predict("api-server", horizon_seconds=300)
        # Should predict higher than current
        assert predicted > 100.0

    def test_predict_pattern_stable(self, predictor):
        # Record stable demand
        for i in range(50):
            predictor.record_demand("api-server", 100.0)

        pattern = predictor.predict_pattern("api-server")
        assert pattern["pattern"] == "stable"
        assert pattern["volatility"] < 0.1

    def test_predict_pattern_variable(self, predictor):
        # Record variable demand
        for i in range(50):
            predictor.record_demand("api-server", 100.0 + (i % 10) * 20)

        pattern = predictor.predict_pattern("api-server")
        assert pattern["pattern"] in ("variable", "highly_variable")

    def test_predict_pattern_unknown(self, predictor):
        pattern = predictor.predict_pattern("unknown-service")
        assert pattern["pattern"] == "unknown"

    def test_get_prediction_stats(self, predictor):
        predictor.record_demand("api-server", 100.0)
        predictor.record_demand("db-server", 200.0)

        stats = predictor.get_prediction_stats()
        assert stats["services_tracked"] == 2
        assert stats["total_observations"] == 2


class TestScalingPredictor:
    """Tests for ScalingPredictor."""

    @pytest.fixture
    def predictor(self):
        return ScalingPredictor(DemandPredictor())

    def test_predictor_creation(self, predictor):
        assert predictor is not None

    def test_predict_scaling_need_no_data(self, predictor):
        result = predictor.predict_scaling_need(
            "unknown-service",
            current_instances=2,
            capacity_per_instance=100,
        )
        # With no data, predicted demand is 0, which is < 30% utilization
        # This suggests scaling down, but confidence is 0
        assert result["confidence"] == 0.0
        # The actual behavior is that it will suggest scaling down with low confidence

    def test_predict_scaling_need_scale_up(self, predictor):
        # Record high demand
        for i in range(50):
            predictor._demand_predictor.record_demand(
                "api-server",
                1000.0,  # High demand
            )

        result = predictor.predict_scaling_need(
            "api-server",
            current_instances=2,
            capacity_per_instance=100,  # Total capacity 200
        )
        # Demand (1000) / Capacity (200) = 5.0 utilization
        assert result["needs_scaling"] is True
        assert result["direction"] == ScalingDirection.UP

    def test_predict_scaling_need_scale_down(self, predictor):
        # Record low demand
        for i in range(50):
            predictor._demand_predictor.record_demand(
                "api-server",
                10.0,  # Low demand
            )

        result = predictor.predict_scaling_need(
            "api-server",
            current_instances=10,
            capacity_per_instance=100,  # Total capacity 1000
        )
        # Demand (10) / Capacity (1000) = 0.01 utilization
        assert result["needs_scaling"] is True
        assert result["direction"] == ScalingDirection.DOWN

    def test_record_scaling_event(self, predictor):
        metrics_before = ScalingMetrics(cpu_utilization=90.0)
        metrics_after = ScalingMetrics(cpu_utilization=60.0)

        predictor.record_scaling_event(
            "api-server",
            instances_before=2,
            instances_after=4,
            metrics_before=metrics_before,
            metrics_after=metrics_after,
        )

        assert len(predictor._scaling_history["api-server"]) == 1

    def test_get_optimal_instance_count(self, predictor):
        metrics_before = ScalingMetrics(cpu_utilization=90.0)
        metrics_after = ScalingMetrics(cpu_utilization=70.0)

        predictor.record_scaling_event(
            "api-server",
            instances_before=2,
            instances_after=4,
            metrics_before=metrics_before,
            metrics_after=metrics_after,
        )

        # target_utilization is compared with cpu_utilization directly (both in same units)
        optimal = predictor.get_optimal_instance_count("api-server", target_utilization=70.0)
        assert optimal == 4

    def test_get_optimal_instance_count_no_data(self, predictor):
        optimal = predictor.get_optimal_instance_count("unknown-service")
        assert optimal is None

    def test_get_stats(self, predictor):
        stats = predictor.get_stats()
        assert "services_with_history" in stats
        assert "total_events" in stats


class TestScalingCoordinator:
    """Tests for ScalingCoordinator."""

    @pytest.fixture
    def coordinator(self):
        return ScalingCoordinator()

    @pytest.fixture
    def policy(self):
        return ScalingPolicy(
            policy_id="policy-1",
            name="test",
            service_name="api-server",
            resource_type=ResourceType.CONTAINERS,
        )

    def test_coordinator_creation(self, coordinator):
        assert len(coordinator._dependencies) == 0
        assert len(coordinator._scaling_policies) == 0

    def test_add_dependency(self, coordinator):
        coordinator.add_dependency("api-server", "db-server")
        assert "db-server" in coordinator._dependencies["api-server"]

    def test_remove_dependency(self, coordinator):
        coordinator.add_dependency("api-server", "db-server")
        coordinator.remove_dependency("api-server", "db-server")
        assert "db-server" not in coordinator._dependencies.get("api-server", set())

    def test_register_policy(self, coordinator, policy):
        coordinator.register_policy(policy)
        assert "api-server" in coordinator._scaling_policies

    def test_can_scale(self, coordinator):
        can, reason = coordinator.can_scale("api-server")
        assert can is True
        assert reason == "OK"

    def test_can_scale_locked(self, coordinator):
        coordinator._scaling_locks.add("api-server")
        can, reason = coordinator.can_scale("api-server")
        assert can is False
        assert "already" in reason.lower()

    def test_can_scale_dependency_locked(self, coordinator):
        coordinator.add_dependency("api-server", "db-server")
        coordinator._scaling_locks.add("db-server")
        can, reason = coordinator.can_scale("api-server")
        assert can is False
        assert "db-server" in reason

    def test_acquire_lock(self, coordinator):
        result = coordinator.acquire_lock("api-server")
        assert result is True
        assert "api-server" in coordinator._scaling_locks

    def test_acquire_lock_already_locked(self, coordinator):
        coordinator._scaling_locks.add("api-server")
        result = coordinator.acquire_lock("api-server")
        assert result is False

    def test_release_lock(self, coordinator):
        coordinator._scaling_locks.add("api-server")
        coordinator.release_lock("api-server")
        assert "api-server" not in coordinator._scaling_locks

    def test_plan_coordinated_scaling(self, coordinator, policy):
        coordinator.register_policy(policy)
        plan = coordinator.plan_coordinated_scaling("api-server", 4)

        assert plan.plan_id.startswith("plan-")
        assert len(plan.actions) >= 1

    def test_get_stats(self, coordinator):
        stats = coordinator.get_stats()
        assert "registered_policies" in stats
        assert "dependencies" in stats
        assert "currently_scaling" in stats


class TestCostAwareScaler:
    """Tests for CostAwareScaler."""

    @pytest.fixture
    def scaler(self):
        return CostAwareScaler()

    def test_scaler_creation(self, scaler):
        assert len(scaler._cost_per_instance) == 0

    def test_set_instance_cost(self, scaler):
        scaler.set_instance_cost("standard", 0.10)
        assert scaler._cost_per_instance["standard"] == 0.10

    def test_set_budget_limit(self, scaler):
        scaler.set_budget_limit("api-server", 1000.0)
        assert scaler._budget_limits["api-server"] == 1000.0

    def test_calculate_cost_impact(self, scaler):
        scaler.set_instance_cost("standard", 0.10)
        impact = scaler.calculate_cost_impact(
            "api-server",
            current_instances=2,
            target_instances=4,
            instance_type="standard",
        )
        # 2 * 0.10 * 730 = 146 monthly
        assert impact == 146.0

    def test_calculate_cost_impact_scale_down(self, scaler):
        scaler.set_instance_cost("standard", 0.10)
        impact = scaler.calculate_cost_impact(
            "api-server",
            current_instances=4,
            target_instances=2,
            instance_type="standard",
        )
        # -2 * 0.10 * 730 = -146 monthly
        assert impact == -146.0

    def test_can_afford_scaling_no_budget(self, scaler):
        result = scaler.can_afford_scaling("api-server", 100.0)
        assert result is True

    def test_can_afford_scaling_within_budget(self, scaler):
        scaler.set_budget_limit("api-server", 1000.0)
        scaler.record_spend("api-server", 500.0)
        result = scaler.can_afford_scaling("api-server", 400.0)
        assert result is True

    def test_can_afford_scaling_exceeds_budget(self, scaler):
        scaler.set_budget_limit("api-server", 1000.0)
        scaler.record_spend("api-server", 800.0)
        result = scaler.can_afford_scaling("api-server", 400.0)
        assert result is False

    def test_record_spend(self, scaler):
        scaler.record_spend("api-server", 100.0)
        assert scaler._current_spend["api-server"] == 100.0

    def test_get_cost_optimization_suggestion_scale_down(self, scaler):
        suggestion = scaler.get_cost_optimization_suggestion("api-server", 0.2)
        assert suggestion["suggestion"] == "scale_down"

    def test_get_cost_optimization_suggestion_scale_up(self, scaler):
        suggestion = scaler.get_cost_optimization_suggestion("api-server", 0.95)
        assert suggestion["suggestion"] == "scale_up"

    def test_get_cost_optimization_suggestion_none(self, scaler):
        suggestion = scaler.get_cost_optimization_suggestion("api-server", 0.7)
        assert suggestion is None

    def test_get_stats(self, scaler):
        stats = scaler.get_stats()
        assert "services_with_budgets" in stats
        assert "total_current_spend" in stats


class TestScalingEngine:
    """Tests for ScalingEngine."""

    @pytest.fixture
    def engine(self):
        return ScalingEngine()

    @pytest.fixture
    def policy(self):
        return ScalingPolicy(
            policy_id="policy-1",
            name="test",
            service_name="api-server",
            resource_type=ResourceType.CONTAINERS,
            thresholds=[
                ScalingThreshold(
                    metric_name="cpu",
                    scale_up_threshold=80.0,
                    scale_down_threshold=30.0,
                ),
            ],
        )

    def test_engine_creation(self, engine):
        assert engine._demand_predictor is not None
        assert engine._scaling_predictor is not None
        assert engine._coordinator is not None
        assert engine._cost_scaler is not None

    def test_get_demand_predictor(self, engine):
        predictor = engine.get_demand_predictor()
        assert isinstance(predictor, DemandPredictor)

    def test_get_scaling_predictor(self, engine):
        predictor = engine.get_scaling_predictor()
        assert isinstance(predictor, ScalingPredictor)

    def test_get_coordinator(self, engine):
        coordinator = engine.get_coordinator()
        assert isinstance(coordinator, ScalingCoordinator)

    def test_get_cost_scaler(self, engine):
        scaler = engine.get_cost_scaler()
        assert isinstance(scaler, CostAwareScaler)

    def test_register_policy(self, engine, policy):
        engine.register_policy(policy)
        assert "api-server" in engine._policies

    def test_set_current_instances(self, engine):
        engine.set_current_instances("api-server", 5)
        assert engine._current_instances["api-server"] == 5

    def test_register_executor(self, engine):
        executor = Mock(return_value=True)
        engine.register_executor(ResourceType.CONTAINERS, executor)
        assert ResourceType.CONTAINERS in engine._executors

    def test_evaluate_scaling_no_policy(self, engine):
        metrics = ScalingMetrics(cpu_utilization=90.0)
        action = engine.evaluate_scaling("unknown-service", metrics)
        assert action is None

    def test_evaluate_scaling_disabled(self, engine, policy):
        policy.enabled = False
        engine.register_policy(policy)

        metrics = ScalingMetrics(cpu_utilization=90.0)
        action = engine.evaluate_scaling("api-server", metrics)
        assert action is None

    def test_evaluate_scaling_scale_up(self, engine, policy):
        engine.register_policy(policy)
        engine.set_current_instances("api-server", 2)

        metrics = ScalingMetrics(cpu_utilization=90.0)
        action = engine.evaluate_scaling("api-server", metrics)

        assert action is not None
        assert action.direction == ScalingDirection.UP
        assert action.target_count == 3

    def test_evaluate_scaling_scale_down(self, engine, policy):
        engine.register_policy(policy)
        engine.set_current_instances("api-server", 5)

        metrics = ScalingMetrics(cpu_utilization=20.0)
        action = engine.evaluate_scaling("api-server", metrics)

        assert action is not None
        assert action.direction == ScalingDirection.DOWN
        assert action.target_count == 4

    def test_evaluate_scaling_within_range(self, engine, policy):
        engine.register_policy(policy)
        engine.set_current_instances("api-server", 2)

        metrics = ScalingMetrics(cpu_utilization=50.0)
        action = engine.evaluate_scaling("api-server", metrics)

        assert action is None

    def test_evaluate_scaling_at_max(self, engine, policy):
        policy.max_instances = 3
        engine.register_policy(policy)
        engine.set_current_instances("api-server", 3)

        metrics = ScalingMetrics(cpu_utilization=95.0)
        action = engine.evaluate_scaling("api-server", metrics)

        # Can't scale up at max
        assert action is None

    def test_evaluate_scaling_at_min(self, engine, policy):
        policy.min_instances = 2
        engine.register_policy(policy)
        engine.set_current_instances("api-server", 2)

        metrics = ScalingMetrics(cpu_utilization=10.0)
        action = engine.evaluate_scaling("api-server", metrics)

        # Can't scale down at min
        assert action is None

    @pytest.mark.asyncio
    async def test_execute_scaling(self, engine, policy):
        executor = Mock(return_value=True)
        engine.register_executor(ResourceType.CONTAINERS, executor)
        engine.register_policy(policy)
        engine.set_current_instances("api-server", 2)

        action = ScalingAction(
            action_id="action-1",
            service_name="api-server",
            resource_type=ResourceType.CONTAINERS,
            direction=ScalingDirection.UP,
            current_count=2,
            target_count=4,
            trigger=ScalingTrigger.MANUAL,
            reason="Test",
        )

        success = await engine.execute_scaling(action)
        assert success is True
        assert action.status == ScalingStatus.COMPLETED
        executor.assert_called_once()

    @pytest.mark.asyncio
    async def test_execute_scaling_no_executor(self, engine, policy):
        engine.register_policy(policy)

        action = ScalingAction(
            action_id="action-1",
            service_name="api-server",
            resource_type=ResourceType.CONTAINERS,
            direction=ScalingDirection.UP,
            current_count=2,
            target_count=4,
            trigger=ScalingTrigger.MANUAL,
            reason="Test",
        )

        success = await engine.execute_scaling(action)
        assert success is False
        assert action.status == ScalingStatus.FAILED

    @pytest.mark.asyncio
    async def test_execute_scaling_budget_exceeded(self, engine, policy):
        engine.get_cost_scaler().set_budget_limit("api-server", 10.0)
        engine.get_cost_scaler().record_spend("api-server", 100.0)
        engine.register_policy(policy)

        action = ScalingAction(
            action_id="action-1",
            service_name="api-server",
            resource_type=ResourceType.CONTAINERS,
            direction=ScalingDirection.UP,
            current_count=2,
            target_count=4,
            trigger=ScalingTrigger.MANUAL,
            reason="Test",
            cost_impact=50.0,
        )

        success = await engine.execute_scaling(action)
        assert success is False
        assert action.status == ScalingStatus.CANCELLED

    def test_add_event_handler(self, engine):
        handler = Mock()
        engine.add_event_handler(handler)
        assert handler in engine._event_handlers

    def test_get_policy(self, engine, policy):
        engine.register_policy(policy)
        retrieved = engine.get_policy("api-server")
        assert retrieved == policy

    def test_get_policy_not_found(self, engine):
        retrieved = engine.get_policy("unknown-service")
        assert retrieved is None

    def test_get_current_instances(self, engine):
        engine.set_current_instances("api-server", 5)
        count = engine.get_current_instances("api-server")
        assert count == 5

    def test_get_current_instances_not_found(self, engine):
        count = engine.get_current_instances("unknown-service")
        assert count == 0

    def test_get_stats(self, engine, policy):
        engine.register_policy(policy)
        stats = engine.get_stats()

        assert stats["registered_services"] == 1
        assert "demand_predictor" in stats
        assert "scaling_predictor" in stats
        assert "coordinator" in stats
        assert "cost_scaler" in stats


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_scaling_engine(self):
        engine = create_scaling_engine()
        assert isinstance(engine, ScalingEngine)

    def test_create_scaling_policy(self):
        policy = create_scaling_policy(
            service_name="api-server",
            resource_type=ResourceType.PODS,
            min_instances=2,
            max_instances=10,
        )
        assert isinstance(policy, ScalingPolicy)
        assert policy.service_name == "api-server"
        assert policy.resource_type == ResourceType.PODS
        assert policy.min_instances == 2
        assert policy.max_instances == 10

    def test_create_scaling_metrics(self):
        metrics = create_scaling_metrics(
            cpu_utilization=75.0,
            memory_utilization=60.0,
        )
        assert isinstance(metrics, ScalingMetrics)
        assert metrics.cpu_utilization == 75.0

    def test_create_scaling_threshold(self):
        threshold = create_scaling_threshold(
            metric_name="memory",
            scale_up=85.0,
            scale_down=40.0,
        )
        assert isinstance(threshold, ScalingThreshold)
        assert threshold.metric_name == "memory"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
