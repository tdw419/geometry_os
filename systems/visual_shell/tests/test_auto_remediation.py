"""
Tests for Auto-Remediation (Phase 54)

Tests predictive auto-remediation for automatically fixing predicted issues.
"""

from unittest.mock import Mock

import pytest

from systems.visual_shell.auto_remediation import (
    ActionExecutor,
    ActionPlanner,
    RemediationAction,
    RemediationContext,
    RemediationEngine,
    RemediationLearner,
    RemediationPlan,
    RemediationResult,
    RemediationStatus,
    RemediationStep,
    RemediationType,
    RiskLevel,
    RollbackManager,
    TriggerType,
    create_remediation_action,
    create_remediation_context,
    create_remediation_engine,
)


class TestRemediationStatus:
    """Tests for RemediationStatus enum."""

    def test_statuses(self):
        assert RemediationStatus.PENDING.value == "pending"
        assert RemediationStatus.RUNNING.value == "running"
        assert RemediationStatus.SUCCESS.value == "success"
        assert RemediationStatus.FAILED.value == "failed"
        assert RemediationStatus.ROLLED_BACK.value == "rolled_back"
        assert RemediationStatus.SKIPPED.value == "skipped"
        assert RemediationStatus.TIMEOUT.value == "timeout"


class TestRemediationType:
    """Tests for RemediationType enum."""

    def test_types(self):
        assert RemediationType.RESTART.value == "restart"
        assert RemediationType.SCALE_UP.value == "scale_up"
        assert RemediationType.SCALE_DOWN.value == "scale_down"
        assert RemediationType.MIGRATE.value == "migrate"
        assert RemediationType.FAILOVER.value == "failover"
        assert RemediationType.CUSTOM.value == "custom"


class TestTriggerType:
    """Tests for TriggerType enum."""

    def test_triggers(self):
        assert TriggerType.ANOMALY_DETECTED.value == "anomaly_detected"
        assert TriggerType.PREDICTION.value == "prediction"
        assert TriggerType.THRESHOLD_BREACH.value == "threshold_breach"
        assert TriggerType.HEALTH_CHECK_FAILURE.value == "health_check_failure"
        assert TriggerType.MANUAL.value == "manual"


class TestRiskLevel:
    """Tests for RiskLevel enum."""

    def test_levels(self):
        assert RiskLevel.LOW.value == "low"
        assert RiskLevel.MEDIUM.value == "medium"
        assert RiskLevel.HIGH.value == "high"
        assert RiskLevel.CRITICAL.value == "critical"


class TestRemediationContext:
    """Tests for RemediationContext."""

    def test_context_creation(self):
        context = RemediationContext(
            service_name="api-server",
            metric_name="cpu_usage",
            current_value=95.0,
            threshold=80.0,
        )
        assert context.service_name == "api-server"
        assert context.metric_name == "cpu_usage"
        assert context.current_value == 95.0
        assert context.threshold == 80.0

    def test_context_defaults(self):
        context = RemediationContext(
            service_name="test",
            metric_name="test",
            current_value=1.0,
            threshold=0.5,
        )
        assert context.anomaly_id is None
        assert context.prediction_confidence == 0.0
        assert context.metadata == {}


class TestRemediationAction:
    """Tests for RemediationAction."""

    def test_action_creation(self):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.RESTART,
            target="api-server",
        )
        assert action.action_id == "action-1"
        assert action.action_type == RemediationType.RESTART
        assert action.target == "api-server"

    def test_action_defaults(self):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.RESTART,
            target="api-server",
        )
        assert action.parameters == {}
        assert action.timeout_seconds == 60.0
        assert action.retry_count == 3
        assert action.requires_approval is False
        assert action.risk_level == RiskLevel.MEDIUM


class TestRemediationStep:
    """Tests for RemediationStep."""

    def test_step_creation(self):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.RESTART,
            target="api-server",
        )
        step = RemediationStep(
            step_id="step-1",
            sequence=0,
            action=action,
        )
        assert step.step_id == "step-1"
        assert step.status == RemediationStatus.PENDING

    def test_step_defaults(self):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.RESTART,
            target="api-server",
        )
        step = RemediationStep(
            step_id="step-1",
            sequence=0,
            action=action,
        )
        assert step.started_at is None
        assert step.completed_at is None
        assert step.error_message is None
        assert step.rollback_action is None


class TestRemediationPlan:
    """Tests for RemediationPlan."""

    @pytest.fixture
    def plan(self):
        context = RemediationContext(
            service_name="api-server",
            metric_name="cpu_usage",
            current_value=95.0,
            threshold=80.0,
        )
        return RemediationPlan(
            plan_id="plan-1",
            trigger_type=TriggerType.THRESHOLD_BREACH,
            context=context,
        )

    def test_plan_creation(self, plan):
        assert plan.plan_id == "plan-1"
        assert plan.trigger_type == TriggerType.THRESHOLD_BREACH
        assert plan.status == RemediationStatus.PENDING

    def test_plan_defaults(self, plan):
        assert plan.steps == []
        assert plan.started_at is None
        assert plan.success is False
        assert plan.rollback_on_failure is True


class TestRemediationResult:
    """Tests for RemediationResult."""

    def test_result_creation(self):
        result = RemediationResult(
            plan_id="plan-1",
            success=True,
            steps_completed=3,
            steps_total=3,
            duration_seconds=10.5,
        )
        assert result.plan_id == "plan-1"
        assert result.success is True
        assert result.steps_completed == 3

    def test_result_defaults(self):
        result = RemediationResult(
            plan_id="plan-1",
            success=False,
            steps_completed=1,
            steps_total=3,
            duration_seconds=5.0,
        )
        assert result.error_message is None
        assert result.rolled_back is False
        assert result.learnings == []


class TestActionPlanner:
    """Tests for ActionPlanner."""

    @pytest.fixture
    def planner(self):
        return ActionPlanner()

    @pytest.fixture
    def context(self):
        return RemediationContext(
            service_name="api-server",
            metric_name="cpu_usage",
            current_value=95.0,
            threshold=80.0,
        )

    def test_planner_creation(self, planner):
        assert len(planner._strategies) == 0

    def test_register_strategy(self, planner, context):
        def custom_strategy(ctx):
            return [RemediationAction(
                action_id="custom-1",
                action_type=RemediationType.CUSTOM,
                target=ctx.service_name,
            )]

        planner.register_strategy("cpu_*", custom_strategy)
        actions = planner.plan_actions(context)
        assert len(actions) == 1
        assert actions[0].action_type == RemediationType.CUSTOM

    def test_plan_actions_default(self, planner, context):
        actions = planner.plan_actions(context)
        # Default actions should be generated
        assert len(actions) > 0

    def test_plan_actions_wildcard(self, planner):
        def wildcard_strategy(ctx):
            return [RemediationAction(
                action_id="wildcard-1",
                action_type=RemediationType.RESTART,
                target=ctx.service_name,
            )]

        planner.register_strategy("*", wildcard_strategy)
        context = RemediationContext(
            service_name="any-service",
            metric_name="any_metric",
            current_value=100.0,
            threshold=50.0,
        )
        actions = planner.plan_actions(context)
        assert len(actions) >= 1

    def test_set_risk_threshold(self, planner):
        planner.set_risk_threshold(RiskLevel.LOW)
        assert planner._risk_threshold == RiskLevel.LOW

    def test_should_require_approval(self, planner):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.RESTART,
            target="api-server",
            risk_level=RiskLevel.HIGH,
        )
        assert planner.should_require_approval(action) is True

        action.risk_level = RiskLevel.LOW
        assert planner.should_require_approval(action) is False


class TestActionExecutor:
    """Tests for ActionExecutor."""

    @pytest.fixture
    def executor(self):
        return ActionExecutor()

    @pytest.fixture
    def action(self):
        return RemediationAction(
            action_id="action-1",
            action_type=RemediationType.RESTART,
            target="api-server",
            retry_count=1,
            timeout_seconds=5.0,
        )

    def test_executor_creation(self, executor):
        assert len(executor._handlers) == 0

    def test_register_handler(self, executor, action):
        handler = Mock(return_value=True)
        executor.register_handler(RemediationType.RESTART, handler)

        success, error = executor.execute_sync(action)
        assert success is True
        handler.assert_called_once_with(action)

    def test_execute_sync_no_handler(self, executor, action):
        success, error = executor.execute_sync(action)
        assert success is False
        assert "No handler registered" in error

    def test_execute_sync_failure(self, executor, action):
        handler = Mock(return_value=False)
        executor.register_handler(RemediationType.RESTART, handler)

        success, error = executor.execute_sync(action)
        assert success is False

    def test_execute_sync_exception(self, executor, action):
        handler = Mock(side_effect=Exception("Test error"))
        executor.register_handler(RemediationType.RESTART, handler)

        success, error = executor.execute_sync(action)
        assert success is False
        assert "Test error" in error

    @pytest.mark.asyncio
    async def test_execute_async(self, executor, action):
        handler = Mock(return_value=True)
        executor.register_handler(RemediationType.RESTART, handler)

        success, error = await executor.execute(action)
        assert success is True

    @pytest.mark.asyncio
    async def test_execute_async_retry(self, executor):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.RESTART,
            target="api-server",
            retry_count=3,
            retry_delay=0.01,
        )

        # Fail twice, succeed third time
        call_count = [0]
        def flaky_handler(a):
            call_count[0] += 1
            return call_count[0] >= 3

        executor.register_handler(RemediationType.RESTART, flaky_handler)
        success, error = await executor.execute(action)
        assert success is True
        assert call_count[0] == 3

    def test_set_timeout_handler(self, executor):
        timeout_handler = Mock()
        executor.set_timeout_handler(timeout_handler)
        assert executor._timeout_handler == timeout_handler


class TestRollbackManager:
    """Tests for RollbackManager."""

    @pytest.fixture
    def rollback_manager(self):
        return RollbackManager()

    def test_rollback_manager_creation(self, rollback_manager):
        assert len(rollback_manager._rollback_history) == 0

    def test_create_rollback_action_scale_up(self, rollback_manager):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.SCALE_UP,
            target="api-server",
            parameters={"replicas": 3},
        )
        rollback = rollback_manager.create_rollback_action(action)
        assert rollback is not None
        assert rollback.action_type == RemediationType.SCALE_DOWN

    def test_create_rollback_action_scale_down(self, rollback_manager):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.SCALE_DOWN,
            target="api-server",
            parameters={"replicas": 1},
        )
        rollback = rollback_manager.create_rollback_action(action)
        assert rollback is not None
        assert rollback.action_type == RemediationType.SCALE_UP

    def test_create_rollback_action_migrate(self, rollback_manager):
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.MIGRATE,
            target="container-1",
            parameters={"target_peer": "peer-2"},
        )
        rollback = rollback_manager.create_rollback_action(action)
        assert rollback is not None
        assert rollback.parameters.get("reverse") is True

    def test_register_rollback_handler(self, rollback_manager):
        handler = Mock(return_value=True)
        rollback_manager.register_rollback_handler(RemediationType.SCALE_DOWN, handler)
        assert RemediationType.SCALE_DOWN in rollback_manager._rollback_handlers

    @pytest.mark.asyncio
    async def test_rollback(self, rollback_manager):
        handler = Mock(return_value=True)
        rollback_manager.register_rollback_handler(RemediationType.SCALE_DOWN, handler)

        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.SCALE_UP,
            target="api-server",
            parameters={"replicas": 2},
        )
        rollback_action = rollback_manager.create_rollback_action(action)

        step = RemediationStep(
            step_id="step-1",
            sequence=0,
            action=action,
            status=RemediationStatus.SUCCESS,
            rollback_action=rollback_action,
        )

        result = await rollback_manager.rollback([step])
        assert result is True
        assert step.status == RemediationStatus.ROLLED_BACK

    def test_get_rollback_stats(self, rollback_manager):
        stats = rollback_manager.get_rollback_stats()
        assert stats["total"] == 0


class TestRemediationLearner:
    """Tests for RemediationLearner."""

    @pytest.fixture
    def learner(self):
        return RemediationLearner()

    @pytest.fixture
    def plan(self):
        context = RemediationContext(
            service_name="api-server",
            metric_name="cpu_usage",
            current_value=95.0,
            threshold=80.0,
        )
        action = RemediationAction(
            action_id="action-1",
            action_type=RemediationType.RESTART,
            target="api-server",
        )
        step = RemediationStep(
            step_id="step-1",
            sequence=0,
            action=action,
        )
        return RemediationPlan(
            plan_id="plan-1",
            trigger_type=TriggerType.THRESHOLD_BREACH,
            context=context,
            steps=[step],
        )

    def test_learner_creation(self, learner):
        assert len(learner._outcomes) == 0

    def test_record_outcome(self, learner, plan):
        result = RemediationResult(
            plan_id=plan.plan_id,
            success=True,
            steps_completed=1,
            steps_total=1,
            duration_seconds=5.0,
        )
        learner.record_outcome(plan, result)
        assert len(learner._outcomes) == 1

    def test_get_success_rate(self, learner, plan):
        result = RemediationResult(
            plan_id=plan.plan_id,
            success=True,
            steps_completed=1,
            steps_total=1,
            duration_seconds=5.0,
        )
        learner.record_outcome(plan, result)

        rate = learner.get_success_rate("cpu_usage", TriggerType.THRESHOLD_BREACH)
        assert rate == 1.0

    def test_get_success_rate_unknown(self, learner):
        rate = learner.get_success_rate("unknown_metric", TriggerType.MANUAL)
        assert rate == 0.5  # Default for unknown

    def test_get_recommended_actions(self, learner, plan):
        result = RemediationResult(
            plan_id=plan.plan_id,
            success=True,
            steps_completed=1,
            steps_total=1,
            duration_seconds=5.0,
        )
        learner.record_outcome(plan, result)

        recommended = learner.get_recommended_actions(
            plan.context, TriggerType.THRESHOLD_BREACH
        )
        assert RemediationType.RESTART in recommended

    def test_get_stats(self, learner, plan):
        result = RemediationResult(
            plan_id=plan.plan_id,
            success=True,
            steps_completed=1,
            steps_total=1,
            duration_seconds=5.0,
        )
        learner.record_outcome(plan, result)

        stats = learner.get_stats()
        assert stats["total_outcomes"] == 1
        assert stats["successful"] == 1
        assert stats["success_rate"] == 1.0


class TestRemediationEngine:
    """Tests for RemediationEngine."""

    @pytest.fixture
    def engine(self):
        return RemediationEngine()

    @pytest.fixture
    def context(self):
        return RemediationContext(
            service_name="api-server",
            metric_name="cpu_usage",
            current_value=95.0,
            threshold=80.0,
        )

    def test_engine_creation(self, engine):
        assert engine._planner is not None
        assert engine._executor is not None
        assert engine._rollback is not None
        assert engine._learner is not None

    def test_get_planner(self, engine):
        planner = engine.get_planner()
        assert isinstance(planner, ActionPlanner)

    def test_get_executor(self, engine):
        executor = engine.get_executor()
        assert isinstance(executor, ActionExecutor)

    def test_get_rollback_manager(self, engine):
        rollback = engine.get_rollback_manager()
        assert isinstance(rollback, RollbackManager)

    def test_get_learner(self, engine):
        learner = engine.get_learner()
        assert isinstance(learner, RemediationLearner)

    def test_create_plan(self, engine, context):
        plan = engine.create_plan(TriggerType.THRESHOLD_BREACH, context)
        assert plan.plan_id.startswith("plan-")
        assert plan.trigger_type == TriggerType.THRESHOLD_BREACH
        assert plan.context == context

    def test_get_plan(self, engine, context):
        plan = engine.create_plan(TriggerType.THRESHOLD_BREACH, context)
        retrieved = engine.get_plan(plan.plan_id)
        assert retrieved == plan

    def test_get_plan_not_found(self, engine):
        plan = engine.get_plan("nonexistent")
        assert plan is None

    @pytest.mark.asyncio
    async def test_execute_plan(self, engine, context):
        # Register handler
        handler = Mock(return_value=True)
        engine.get_executor().register_handler(RemediationType.RESTART, handler)
        engine.get_executor().register_handler(RemediationType.SCALE_UP, handler)

        plan = engine.create_plan(TriggerType.THRESHOLD_BREACH, context)
        result = await engine.execute_plan(plan)

        assert result.plan_id == plan.plan_id
        assert result.steps_total > 0

    @pytest.mark.asyncio
    async def test_execute_plan_no_handler(self, engine, context):
        plan = engine.create_plan(TriggerType.THRESHOLD_BREACH, context)
        result = await engine.execute_plan(plan)

        # Without handlers, should fail
        assert result.success is False

    @pytest.mark.asyncio
    async def test_execute_plan_already_running(self, engine, context):
        handler = Mock(return_value=True)
        engine.get_executor().register_handler(RemediationType.RESTART, handler)
        engine.get_executor().register_handler(RemediationType.SCALE_UP, handler)

        plan = engine.create_plan(TriggerType.THRESHOLD_BREACH, context)
        plan.status = RemediationStatus.RUNNING
        engine._running.add(plan.plan_id)

        result = await engine.execute_plan(plan)
        assert result.success is False
        assert "already running" in result.error_message

    def test_add_approval_handler(self, engine):
        handler = Mock(return_value=True)
        engine.add_approval_handler(handler)
        assert handler in engine._approval_handlers

    def test_add_result_handler(self, engine):
        handler = Mock()
        engine.add_result_handler(handler)
        assert handler in engine._result_handlers

    def test_get_active_plans(self, engine, context):
        plan1 = engine.create_plan(TriggerType.THRESHOLD_BREACH, context)
        plan1.status = RemediationStatus.RUNNING

        context2 = RemediationContext(
            service_name="db-server",
            metric_name="memory_usage",
            current_value=90.0,
            threshold=80.0,
        )
        plan2 = engine.create_plan(TriggerType.PREDICTION, context2)
        plan2.status = RemediationStatus.SUCCESS

        active = engine.get_active_plans()
        assert plan1 in active
        assert plan2 not in active

    def test_get_stats(self, engine, context):
        plan = engine.create_plan(TriggerType.THRESHOLD_BREACH, context)
        stats = engine.get_stats()

        assert stats["total_plans"] == 1
        assert "learner" in stats
        assert "rollback" in stats


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_remediation_engine(self):
        engine = create_remediation_engine()
        assert isinstance(engine, RemediationEngine)

    def test_create_remediation_context(self):
        context = create_remediation_context(
            service_name="api-server",
            metric_name="cpu_usage",
            current_value=95.0,
            threshold=80.0,
            anomaly_id="anomaly-1",
        )
        assert isinstance(context, RemediationContext)
        assert context.service_name == "api-server"
        assert context.anomaly_id == "anomaly-1"

    def test_create_remediation_action(self):
        action = create_remediation_action(
            action_type=RemediationType.RESTART,
            target="api-server",
            parameters={"graceful": True},
        )
        assert isinstance(action, RemediationAction)
        assert action.action_type == RemediationType.RESTART
        assert action.parameters["graceful"] is True


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
