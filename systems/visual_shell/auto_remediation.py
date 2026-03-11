"""
Auto-Remediation - Phase 54

Predictive auto-remediation for automatically fixing predicted issues.
"""

import asyncio
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class RemediationStatus(Enum):
    """Status of a remediation action."""
    PENDING = "pending"
    RUNNING = "running"
    SUCCESS = "success"
    FAILED = "failed"
    ROLLED_BACK = "rolled_back"
    SKIPPED = "skipped"
    TIMEOUT = "timeout"


class RemediationType(Enum):
    """Types of remediation actions."""
    RESTART = "restart"
    SCALE_UP = "scale_up"
    SCALE_DOWN = "scale_down"
    MIGRATE = "migrate"
    THROTTLE = "throttle"
    CLEAR_CACHE = "clear_cache"
    RECONNECT = "reconnect"
    FAILOVER = "failover"
    INCREASE_RESOURCES = "increase_resources"
    DECREASE_RESOURCES = "decrease_resources"
    CUSTOM = "custom"


class TriggerType(Enum):
    """What triggered the remediation."""
    ANOMALY_DETECTED = "anomaly_detected"
    PREDICTION = "prediction"
    THRESHOLD_BREACH = "threshold_breach"
    HEALTH_CHECK_FAILURE = "health_check_failure"
    MANUAL = "manual"
    SCHEDULED = "scheduled"


class RiskLevel(Enum):
    """Risk level of a remediation action."""
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"


@dataclass
class RemediationContext:
    """Context for a remediation action."""
    service_name: str
    metric_name: str
    current_value: float
    threshold: float
    anomaly_id: str | None = None
    prediction_confidence: float = 0.0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class RemediationAction:
    """A single remediation action."""
    action_id: str
    action_type: RemediationType
    target: str
    parameters: dict[str, Any] = field(default_factory=dict)
    timeout_seconds: float = 60.0
    retry_count: int = 3
    retry_delay: float = 5.0
    requires_approval: bool = False
    risk_level: RiskLevel = RiskLevel.MEDIUM


@dataclass
class RemediationStep:
    """A step in a remediation plan."""
    step_id: str
    sequence: int
    action: RemediationAction
    status: RemediationStatus = RemediationStatus.PENDING
    started_at: float | None = None
    completed_at: float | None = None
    error_message: str | None = None
    rollback_action: RemediationAction | None = None


@dataclass
class RemediationPlan:
    """A complete remediation plan."""
    plan_id: str
    trigger_type: TriggerType
    context: RemediationContext
    steps: list[RemediationStep] = field(default_factory=list)
    status: RemediationStatus = RemediationStatus.PENDING
    created_at: float = field(default_factory=time.time)
    started_at: float | None = None
    completed_at: float | None = None
    success: bool = False
    rollback_on_failure: bool = True


@dataclass
class RemediationResult:
    """Result of a remediation execution."""
    plan_id: str
    success: bool
    steps_completed: int
    steps_total: int
    duration_seconds: float
    error_message: str | None = None
    rolled_back: bool = False
    learnings: list[str] = field(default_factory=list)


class ActionPlanner:
    """Plans remediation actions based on context."""

    def __init__(self):
        self._strategies: dict[str, Callable[[RemediationContext], list[RemediationAction]]] = {}
        self._risk_threshold = RiskLevel.HIGH
        self._approval_required_above = RiskLevel.MEDIUM

    def register_strategy(
        self,
        metric_pattern: str,
        strategy: Callable[[RemediationContext], list[RemediationAction]],
    ) -> None:
        """Register a remediation strategy for a metric pattern."""
        self._strategies[metric_pattern] = strategy

    def plan_actions(self, context: RemediationContext) -> list[RemediationAction]:
        """Plan remediation actions for the given context."""
        actions = []

        # Find matching strategies
        for pattern, strategy in self._strategies.items():
            if self._matches_pattern(context.metric_name, pattern):
                try:
                    actions.extend(strategy(context))
                except Exception:
                    pass

        # Default strategies if no custom ones match
        if not actions:
            actions = self._default_actions(context)

        # Sort by risk level (low risk first)
        risk_order = {RiskLevel.LOW: 0, RiskLevel.MEDIUM: 1, RiskLevel.HIGH: 2, RiskLevel.CRITICAL: 3}
        actions.sort(key=lambda a: risk_order.get(a.risk_level, 1))

        return actions

    def _matches_pattern(self, metric_name: str, pattern: str) -> bool:
        """Check if metric name matches pattern."""
        if pattern == "*":
            return True
        if "*" in pattern:
            prefix = pattern.rstrip("*")
            return metric_name.startswith(prefix)
        return metric_name == pattern

    def _default_actions(self, context: RemediationContext) -> list[RemediationAction]:
        """Generate default remediation actions."""
        actions = []

        # High value - scale up or restart
        if context.current_value > context.threshold:
            actions.append(RemediationAction(
                action_id=f"restart-{uuid.uuid4().hex[:8]}",
                action_type=RemediationType.RESTART,
                target=context.service_name,
                risk_level=RiskLevel.MEDIUM,
            ))
            actions.append(RemediationAction(
                action_id=f"scale-{uuid.uuid4().hex[:8]}",
                action_type=RemediationType.SCALE_UP,
                target=context.service_name,
                parameters={"replicas": 2},
                risk_level=RiskLevel.LOW,
            ))

        return actions

    def set_risk_threshold(self, level: RiskLevel) -> None:
        """Set the maximum allowed risk level."""
        self._risk_threshold = level

    def should_require_approval(self, action: RemediationAction) -> bool:
        """Check if action requires approval."""
        risk_order = {RiskLevel.LOW: 0, RiskLevel.MEDIUM: 1, RiskLevel.HIGH: 2, RiskLevel.CRITICAL: 3}
        return risk_order.get(action.risk_level, 0) >= risk_order.get(self._approval_required_above, 1)


class ActionExecutor:
    """Executes remediation actions."""

    def __init__(self):
        self._handlers: dict[RemediationType, Callable[[RemediationAction], bool]] = {}
        self._timeout_handler: Callable[[RemediationAction], None] | None = None

    def register_handler(
        self,
        action_type: RemediationType,
        handler: Callable[[RemediationAction], bool],
    ) -> None:
        """Register a handler for an action type."""
        self._handlers[action_type] = handler

    def set_timeout_handler(self, handler: Callable[[RemediationAction], None]) -> None:
        """Set handler for action timeouts."""
        self._timeout_handler = handler

    async def execute(self, action: RemediationAction) -> tuple[bool, str | None]:
        """Execute a remediation action."""
        handler = self._handlers.get(action.action_type)

        if not handler:
            return False, f"No handler registered for {action.action_type.value}"

        # Try with retries
        last_error = None
        for attempt in range(action.retry_count):
            try:
                # Run with timeout
                result = await asyncio.wait_for(
                    asyncio.get_event_loop().run_in_executor(None, handler, action),
                    timeout=action.timeout_seconds,
                )
                if result:
                    return True, None
            except TimeoutError:
                last_error = "Action timed out"
                if self._timeout_handler:
                    self._timeout_handler(action)
            except Exception as e:
                last_error = str(e)

            if attempt < action.retry_count - 1:
                await asyncio.sleep(action.retry_delay)

        return False, last_error

    def execute_sync(self, action: RemediationAction) -> tuple[bool, str | None]:
        """Execute a remediation action synchronously."""
        handler = self._handlers.get(action.action_type)

        if not handler:
            return False, f"No handler registered for {action.action_type.value}"

        try:
            result = handler(action)
            return result, None
        except Exception as e:
            return False, str(e)


class RollbackManager:
    """Manages rollback of failed remediations."""

    def __init__(self):
        self._rollback_handlers: dict[RemediationType, Callable[[RemediationAction], bool]] = {}
        self._rollback_history: list[dict[str, Any]] = []
        self._max_history = 1000

    def register_rollback_handler(
        self,
        action_type: RemediationType,
        handler: Callable[[RemediationAction], bool],
    ) -> None:
        """Register a rollback handler for an action type."""
        self._rollback_handlers[action_type] = handler

    def create_rollback_action(self, action: RemediationAction) -> RemediationAction | None:
        """Create a rollback action for the given action."""
        if action.action_type == RemediationType.SCALE_UP:
            return RemediationAction(
                action_id=f"rollback-{action.action_id}",
                action_type=RemediationType.SCALE_DOWN,
                target=action.target,
                parameters={"replicas": action.parameters.get("replicas", 1)},
                risk_level=RiskLevel.LOW,
            )
        elif action.action_type == RemediationType.SCALE_DOWN:
            return RemediationAction(
                action_id=f"rollback-{action.action_id}",
                action_type=RemediationType.SCALE_UP,
                target=action.target,
                parameters={"replicas": action.parameters.get("replicas", 1)},
                risk_level=RiskLevel.LOW,
            )
        elif action.action_type == RemediationType.MIGRATE:
            return RemediationAction(
                action_id=f"rollback-{action.action_id}",
                action_type=RemediationType.MIGRATE,
                target=action.target,
                parameters={"reverse": True, **action.parameters},
                risk_level=RiskLevel.MEDIUM,
            )
        return None

    async def rollback(self, steps: list[RemediationStep]) -> bool:
        """Rollback completed steps in reverse order."""
        # Get completed steps in reverse order
        completed = [s for s in steps if s.status == RemediationStatus.SUCCESS]
        completed.reverse()

        all_success = True
        for step in completed:
            if not step.rollback_action:
                continue

            handler = self._rollback_handlers.get(step.rollback_action.action_type)
            if not handler:
                continue

            try:
                result = await asyncio.get_event_loop().run_in_executor(
                    None, handler, step.rollback_action
                )
                if result:
                    step.status = RemediationStatus.ROLLED_BACK
                else:
                    all_success = False
            except Exception:
                all_success = False

            # Record rollback
            self._rollback_history.append({
                "step_id": step.step_id,
                "action_id": step.rollback_action.action_id,
                "success": all_success,
                "timestamp": time.time(),
            })

        # Trim history
        if len(self._rollback_history) > self._max_history:
            self._rollback_history = self._rollback_history[-self._max_history:]

        return all_success

    def get_rollback_stats(self) -> dict[str, Any]:
        """Get rollback statistics."""
        if not self._rollback_history:
            return {"total": 0}

        successful = sum(1 for r in self._rollback_history if r["success"])
        return {
            "total": len(self._rollback_history),
            "successful": successful,
            "failed": len(self._rollback_history) - successful,
            "success_rate": successful / len(self._rollback_history),
        }


class RemediationLearner:
    """Learns from remediation outcomes to improve future decisions."""

    def __init__(self):
        self._outcomes: list[dict[str, Any]] = []
        self._success_rates: dict[str, dict[str, int]] = {}
        self._max_outcomes = 10000

    def record_outcome(
        self,
        plan: RemediationPlan,
        result: RemediationResult,
    ) -> None:
        """Record a remediation outcome for learning."""
        outcome = {
            "plan_id": plan.plan_id,
            "trigger_type": plan.trigger_type.value,
            "metric_name": plan.context.metric_name,
            "service_name": plan.context.service_name,
            "action_types": [s.action.action_type.value for s in plan.steps],
            "success": result.success,
            "duration_seconds": result.duration_seconds,
            "timestamp": time.time(),
        }

        self._outcomes.append(outcome)

        # Update success rates
        key = f"{plan.context.metric_name}:{plan.trigger_type.value}"
        if key not in self._success_rates:
            self._success_rates[key] = {"success": 0, "total": 0}
        self._success_rates[key]["total"] += 1
        if result.success:
            self._success_rates[key]["success"] += 1

        # Trim outcomes
        if len(self._outcomes) > self._max_outcomes:
            self._outcomes = self._outcomes[-self._max_outcomes:]

    def get_success_rate(
        self,
        metric_name: str,
        trigger_type: TriggerType,
    ) -> float:
        """Get success rate for a metric and trigger type."""
        key = f"{metric_name}:{trigger_type.value}"
        if key not in self._success_rates:
            return 0.5  # Unknown, assume 50%
        stats = self._success_rates[key]
        if stats["total"] == 0:
            return 0.5
        return stats["success"] / stats["total"]

    def get_recommended_actions(
        self,
        context: RemediationContext,
        trigger_type: TriggerType,
    ) -> list[RemediationType]:
        """Get recommended action types based on past success."""
        key = f"{context.metric_name}:{trigger_type.value}"

        # Find successful actions for this context
        action_success: dict[RemediationType, int] = {}
        action_total: dict[RemediationType, int] = {}

        for outcome in self._outcomes:
            if outcome["metric_name"] == context.metric_name:
                for action_type in outcome["action_types"]:
                    rt = RemediationType(action_type)
                    action_total[rt] = action_total.get(rt, 0) + 1
                    if outcome["success"]:
                        action_success[rt] = action_success.get(rt, 0) + 1

        # Calculate success rates and sort
        rates = []
        for action_type, total in action_total.items():
            success = action_success.get(action_type, 0)
            rate = success / total if total > 0 else 0
            rates.append((action_type, rate))

        rates.sort(key=lambda x: x[1], reverse=True)
        return [r[0] for r in rates]

    def get_stats(self) -> dict[str, Any]:
        """Get learner statistics."""
        if not self._outcomes:
            return {"total_outcomes": 0}

        successful = sum(1 for o in self._outcomes if o["success"])
        return {
            "total_outcomes": len(self._outcomes),
            "successful": successful,
            "failed": len(self._outcomes) - successful,
            "success_rate": successful / len(self._outcomes),
            "unique_metrics": len(set(o["metric_name"] for o in self._outcomes)),
        }


class RemediationEngine:
    """Main engine for predictive auto-remediation."""

    def __init__(self):
        self._planner = ActionPlanner()
        self._executor = ActionExecutor()
        self._rollback = RollbackManager()
        self._learner = RemediationLearner()
        self._plans: dict[str, RemediationPlan] = {}
        self._running: set[str] = set()
        self._approval_handlers: list[Callable[[RemediationPlan], bool]] = []
        self._result_handlers: list[Callable[[RemediationResult], None]] = []

    def get_planner(self) -> ActionPlanner:
        """Get the action planner."""
        return self._planner

    def get_executor(self) -> ActionExecutor:
        """Get the action executor."""
        return self._executor

    def get_rollback_manager(self) -> RollbackManager:
        """Get the rollback manager."""
        return self._rollback

    def get_learner(self) -> RemediationLearner:
        """Get the remediation learner."""
        return self._learner

    def create_plan(
        self,
        trigger_type: TriggerType,
        context: RemediationContext,
    ) -> RemediationPlan:
        """Create a remediation plan."""
        plan_id = f"plan-{uuid.uuid4().hex[:8]}"

        # Plan actions
        actions = self._planner.plan_actions(context)

        # Create steps
        steps = []
        for i, action in enumerate(actions):
            rollback_action = self._rollback.create_rollback_action(action)
            steps.append(RemediationStep(
                step_id=f"step-{plan_id}-{i}",
                sequence=i,
                action=action,
                rollback_action=rollback_action,
            ))

        plan = RemediationPlan(
            plan_id=plan_id,
            trigger_type=trigger_type,
            context=context,
            steps=steps,
        )

        self._plans[plan_id] = plan
        return plan

    async def execute_plan(self, plan: RemediationPlan) -> RemediationResult:
        """Execute a remediation plan."""
        if plan.plan_id in self._running:
            return RemediationResult(
                plan_id=plan.plan_id,
                success=False,
                steps_completed=0,
                steps_total=len(plan.steps),
                duration_seconds=0,
                error_message="Plan already running",
            )

        self._running.add(plan.plan_id)
        plan.status = RemediationStatus.RUNNING
        plan.started_at = time.time()

        steps_completed = 0
        error_message = None

        try:
            for step in plan.steps:
                # Check if approval required
                if self._planner.should_require_approval(step.action):
                    approved = await self._request_approval(plan, step)
                    if not approved:
                        step.status = RemediationStatus.SKIPPED
                        continue

                # Execute step
                step.status = RemediationStatus.RUNNING
                step.started_at = time.time()

                success, error = await self._executor.execute(step.action)

                step.completed_at = time.time()

                if success:
                    step.status = RemediationStatus.SUCCESS
                    steps_completed += 1
                else:
                    step.status = RemediationStatus.FAILED
                    step.error_message = error
                    error_message = error

                    if plan.rollback_on_failure:
                        await self._rollback.rollback(plan.steps[:steps_completed + 1])
                        plan.status = RemediationStatus.ROLLED_BACK
                        break

            if plan.status == RemediationStatus.RUNNING:
                plan.status = RemediationStatus.SUCCESS if steps_completed == len(plan.steps) else RemediationStatus.FAILED

        finally:
            self._running.discard(plan.plan_id)
            plan.completed_at = time.time()

        duration = plan.completed_at - plan.started_at
        result = RemediationResult(
            plan_id=plan.plan_id,
            success=plan.status == RemediationStatus.SUCCESS,
            steps_completed=steps_completed,
            steps_total=len(plan.steps),
            duration_seconds=duration,
            error_message=error_message,
            rolled_back=plan.status == RemediationStatus.ROLLED_BACK,
        )

        # Record for learning
        self._learner.record_outcome(plan, result)

        # Notify handlers
        for handler in self._result_handlers:
            try:
                handler(result)
            except Exception:
                pass

        return result

    async def _request_approval(
        self,
        plan: RemediationPlan,
        step: RemediationStep,
    ) -> bool:
        """Request approval for a step."""
        for handler in self._approval_handlers:
            try:
                if handler(plan):
                    return True
            except Exception:
                pass
        return False

    def add_approval_handler(
        self,
        handler: Callable[[RemediationPlan], bool],
    ) -> None:
        """Add an approval handler."""
        self._approval_handlers.append(handler)

    def add_result_handler(
        self,
        handler: Callable[[RemediationResult], None],
    ) -> None:
        """Add a result handler."""
        self._result_handlers.append(handler)

    def get_plan(self, plan_id: str) -> RemediationPlan | None:
        """Get a plan by ID."""
        return self._plans.get(plan_id)

    def get_active_plans(self) -> list[RemediationPlan]:
        """Get all active (running or pending) plans."""
        return [
            p for p in self._plans.values()
            if p.status in (RemediationStatus.RUNNING, RemediationStatus.PENDING)
        ]

    def get_stats(self) -> dict[str, Any]:
        """Get engine statistics."""
        return {
            "total_plans": len(self._plans),
            "active_plans": len(self.get_active_plans()),
            "learner": self._learner.get_stats(),
            "rollback": self._rollback.get_rollback_stats(),
        }


def create_remediation_engine() -> RemediationEngine:
    """Factory function to create a remediation engine."""
    return RemediationEngine()


def create_remediation_context(
    service_name: str,
    metric_name: str,
    current_value: float,
    threshold: float,
    **kwargs,
) -> RemediationContext:
    """Factory function to create a remediation context."""
    return RemediationContext(
        service_name=service_name,
        metric_name=metric_name,
        current_value=current_value,
        threshold=threshold,
        **kwargs,
    )


def create_remediation_action(
    action_type: RemediationType,
    target: str,
    **kwargs,
) -> RemediationAction:
    """Factory function to create a remediation action."""
    return RemediationAction(
        action_id=f"action-{uuid.uuid4().hex[:8]}",
        action_type=action_type,
        target=target,
        **kwargs,
    )
