"""
Phase 61: Autonomous Governance

Policy-based autonomous decisions with guardrails.

Provides policy engine with declarative rules, budget guardrails,
compliance policy enforcement, and audit trail for autonomous decisions.
"""

import uuid
from collections import defaultdict
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from enum import Enum
from typing import Any


class PolicyType(Enum):
    """Type of governance policy."""
    SCALING = "scaling"
    PLACEMENT = "placement"
    RESOURCE_LIMIT = "resource_limit"
    COST_CONTROL = "cost_control"
    SECURITY = "security"
    COMPLIANCE = "compliance"
    PERFORMANCE = "performance"


class PolicyStatus(Enum):
    """Status of a policy."""
    ACTIVE = "active"
    SUSPENDED = "suspended"
    DEPRECATED = "deprecated"
    DRAFT = "draft"


class ViolationSeverity(Enum):
    """Severity of policy violation."""
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"


class BudgetType(Enum):
    """Type of budget limit."""
    DAILY = "daily"
    WEEKLY = "weekly"
    MONTHLY = "monthly"
    QUARTERLY = "quarterly"


class BudgetStatus(Enum):
    """Status of budget guardrail."""
    NORMAL = "normal"
    WARNING = "warning"
    CRITICAL = "critical"
    EXCEEDED = "exceeded"


class GovernanceDecisionStatus(Enum):
    """Status of an autonomous decision."""
    PROPOSED = "proposed"
    APPROVED = "approved"
    REJECTED = "rejected"
    EXECUTING = "executing"
    COMPLETED = "completed"
    ROLLED_BACK = "rolled_back"
    FAILED = "failed"


@dataclass
class PolicyRule:
    """A declarative policy rule."""
    id: str
    name: str
    policy_type: PolicyType
    description: str = ""
    status: PolicyStatus = PolicyStatus.ACTIVE
    condition: str = ""
    action: str = ""
    priority: int = 100
    created_at: datetime = field(default_factory=datetime.now)
    updated_at: datetime = field(default_factory=datetime.now)
    violation_count: int = 0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class BudgetLimit:
    """A budget guardrail configuration."""
    id: str
    name: str
    budget_type: BudgetType
    limit: float
    current_spend: float = 0.0
    alert_threshold: float = 0.8
    critical_threshold: float = 1.0
    grace_period_hours: float = 1.0
    status: BudgetStatus = BudgetStatus.NORMAL
    created_at: datetime = field(default_factory=datetime.now)
    violation_events: list[datetime] = field(default_factory=list)
    metadata: dict[str, Any] = field(default_factory=dict)

    @property
    def utilization_percentage(self) -> float:
        """Get utilization as percentage of limit."""
        if self.limit == 0:
            return 0.0
        return (self.current_spend / self.limit) * 100

    def check(self, spend: float) -> BudgetStatus:
        """Check if spending violates limit."""
        if self.limit == 0:
            return BudgetStatus.NORMAL

        utilization = spend / self.limit

        if self.grace_period_hours > 0:
            grace_end = self.created_at + timedelta(hours=self.grace_period_hours)
            if datetime.now() < grace_end:
                return BudgetStatus.NORMAL

        if utilization > self.critical_threshold:
            return BudgetStatus.EXCEEDED
        elif utilization > self.alert_threshold:
            return BudgetStatus.WARNING
        elif utilization > 1.0:
            return BudgetStatus.CRITICAL

        return BudgetStatus.NORMAL

    def update_spend(self, amount: float) -> None:
        """Update current spend."""
        self.current_spend = amount
        new_status = self.check(amount)
        if new_status != self.status:
            self.status = new_status

    def reset(self) -> None:
        """Reset budget tracking."""
        self.current_spend = 0.0
        self.violation_events = []
        self.status = BudgetStatus.NORMAL


@dataclass
class CompliancePolicy:
    """A compliance policy definition."""
    id: str
    name: str
    policy_type: PolicyType
    description: str = ""
    status: PolicyStatus = PolicyStatus.ACTIVE
    requirements: list[str] = field(default_factory=list)
    check_interval_seconds: float = 3600.0
    created_at: datetime = field(default_factory=datetime.now)
    last_check: datetime | None = None
    last_violation: datetime | None = None
    violation_count: int = 0
    metadata: dict[str, Any] = field(default_factory=dict)

    def is_active(self) -> bool:
        return self.status == PolicyStatus.ACTIVE

    def check_compliance(self, context: dict[str, Any]) -> tuple[bool, list[str]]:
        """Check compliance against requirements."""
        violations = []
        for req in self.requirements:
            if req.startswith("must_"):
                key = req[5:]
                if key not in context:
                    violations.append(f"Missing required field: {key}")
        return len(violations) == 0, violations


@dataclass
class AuditEvent:
    """An audit event for autonomous decisions."""
    id: str
    timestamp: datetime
    event_type: str
    decision_id: str
    description: str
    actor: str = ""
    outcome: str = ""
    confidence: float = 1.0
    reasoning: str = ""
    constraints_violated: list[str] = field(default_factory=list)
    rollback_performed: bool = False
    rollback_reason: str = ""
    previous_state: dict[str, Any] = field(default_factory=dict)
    new_state: dict[str, Any] = field(default_factory=dict)
    duration_ms: float = 0.0
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class GovernanceAuditLog:
    """Immutable audit trail for autonomous decisions."""
    events: list[AuditEvent] = field(default_factory=list)
    max_events: int = 10000

    def record_event(self, event: AuditEvent) -> None:
        """Record an audit event."""
        self.events.append(event)
        if len(self.events) > self.max_events:
            self.events = self.events[-self.max_events:]

    def get_events(self, limit: int = 100) -> list[AuditEvent]:
        """Get recent events."""
        return self.events[-limit:]

    def get_events_by_type(self, event_type: str) -> list[AuditEvent]:
        """Get all events of a specific type."""
        return [e for e in self.events if e.event_type == event_type]

    def get_events_by_decision(self, decision_id: str) -> list[AuditEvent]:
        """Get all events for a decision."""
        return [e for e in self.events if e.decision_id == decision_id]

    def export_log(self) -> list[dict]:
        """Export audit log as list of dicts."""
        return [
            {
                "id": e.id,
                "timestamp": e.timestamp.isoformat(),
                "event_type": e.event_type,
                "decision_id": e.decision_id,
                "description": e.description,
                "actor": e.actor,
                "outcome": e.outcome,
                "confidence": e.confidence,
            }
            for e in self.events
        ]


@dataclass
class AutonomousDecision:
    """An autonomous decision with full context."""
    id: str
    description: str
    actor: str
    reasoning: str
    constraints: dict[str, Any]
    action: str
    action_params: dict[str, Any]
    confidence: float = 1.0
    status: GovernanceDecisionStatus = GovernanceDecisionStatus.PROPOSED
    proposed_at: datetime = field(default_factory=datetime.now)
    approved_at: datetime | None = None
    executed_at: datetime | None = None
    completed_at: datetime | None = None
    rolled_back_at: datetime | None = None
    failed_at: datetime | None = None
    constraints_violated: list[str] = field(default_factory=list)
    rollback_reason: str = ""
    metadata: dict[str, Any] = field(default_factory=dict)


class PolicyEngine:
    """Engine for managing governance policies."""

    def __init__(self):
        self.policies: dict[str, PolicyRule] = {}
        self.audit_log = GovernanceAuditLog()

    def create_policy(
        self,
        name: str,
        policy_type: PolicyType,
        description: str,
        condition: str,
        action: str,
        priority: int = 100
    ) -> PolicyRule:
        """Create a new policy."""
        policy = PolicyRule(
            id=str(uuid.uuid4())[:8],
            name=name,
            policy_type=policy_type,
            description=description,
            condition=condition,
            action=action,
            priority=priority,
            status=PolicyStatus.DRAFT,
            created_at=datetime.now()
        )
        self.policies[policy.id] = policy
        self.audit_log.record_event(AuditEvent(
            id=str(uuid.uuid4())[:8],
            timestamp=datetime.now(),
            event_type="policy_created",
            decision_id=policy.id,
            description=f"Policy {name} created",
            actor="system",
            outcome="created",
            confidence=1.0
        ))
        return policy

    def activate_policy(self, policy_id: str) -> None:
        """Activate a policy."""
        policy = self.policies.get(policy_id)
        if policy:
            policy.status = PolicyStatus.ACTIVE
            policy.updated_at = datetime.now()

    def suspend_policy(self, policy_id: str) -> None:
        """Suspend a policy."""
        policy = self.policies.get(policy_id)
        if policy:
            policy.status = PolicyStatus.SUSPENDED
            policy.updated_at = datetime.now()

    def evaluate_policies(self, context: dict[str, Any]) -> list[tuple[PolicyRule, bool, str]]:
        """Evaluate all active policies against context."""
        results = []
        for policy in self.policies.values():
            if policy.status != PolicyStatus.ACTIVE:
                continue
            try:
                result = eval(policy.condition, {"context": context})
                results.append((policy, result, ""))
            except Exception as e:
                results.append((policy, False, str(e)))
        return results

    def get_active_policies(self) -> list[PolicyRule]:
        """Get all active policies."""
        return [p for p in self.policies.values() if p.status == PolicyStatus.ACTIVE]


class BudgetGuardrail:
    """Budget guardrails for cost control."""

    def __init__(self):
        self.budgets: dict[str, BudgetLimit] = {}
        self.audit_log = GovernanceAuditLog()

    def add_budget(self, budget: BudgetLimit) -> None:
        """Add a budget guardrail."""
        self.budgets[budget.id] = budget

    def check_budget(self, budget_id: str, amount: float) -> tuple[BudgetStatus, float | None]:
        """Check if a budget allows an amount."""
        budget = self.budgets.get(budget_id)
        if not budget:
            return BudgetStatus.NORMAL, None
        status = budget.check(budget.current_spend + amount)
        remaining = budget.limit - budget.current_spend - amount
        return status, remaining

    def update_spend(self, budget_id: str, amount: float) -> None:
        """Update current spend for a budget."""
        budget = self.budgets.get(budget_id)
        if budget:
            budget.update_spend(amount)

    def get_warnings(self) -> list[tuple[BudgetLimit, float]]:
        """Get all budgets in warning state."""
        return [
            (b, b.utilization_percentage)
            for b in self.budgets.values()
            if b.status in (BudgetStatus.WARNING, BudgetStatus.CRITICAL)
        ]


class ComplianceChecker:
    """Checks compliance with policies."""

    def __init__(self):
        self.policies: dict[str, CompliancePolicy] = {}
        self.audit_log = GovernanceAuditLog()

    def add_policy(self, policy: CompliancePolicy) -> None:
        """Add a compliance policy."""
        self.policies[policy.id] = policy

    def check_compliance(self, policy_id: str, context: dict[str, Any]) -> tuple[bool, list[str]]:
        """Check compliance for a policy."""
        policy = self.policies.get(policy_id)
        if not policy:
            return True, []
        return policy.check_compliance(context)

    def check_all_compliance(self, context: dict[str, Any]) -> dict[str, tuple[bool, list[str]]]:
        """Check all compliance policies."""
        results = {}
        for policy_id, policy in self.policies.items():
            if policy.is_active():
                results[policy_id] = policy.check_compliance(context)
        return results

    def get_violations(self) -> list[tuple[CompliancePolicy, int]]:
        """Get all policies with violations."""
        return [
            (p, p.violation_count)
            for p in self.policies.values()
            if p.violation_count > 0
        ]


class AutonomousGovernor:
    """Main governance engine combining all components."""

    def __init__(self):
        self.policy_engine = PolicyEngine()
        self.budget_guardrail = BudgetGuardrail()
        self.compliance_checker = ComplianceChecker()
        self.audit_log = GovernanceAuditLog()
        self.decisions: dict[str, AutonomousDecision] = {}

    def propose_decision(
        self,
        description: str,
        actor: str,
        reasoning: str,
        constraints: dict[str, Any],
        action: str,
        action_params: dict[str, Any],
        confidence: float = 1.0
    ) -> AutonomousDecision:
        """Propose a new autonomous decision."""
        decision = AutonomousDecision(
            id=str(uuid.uuid4())[:8],
            description=description,
            actor=actor,
            reasoning=reasoning,
            constraints=constraints,
            action=action,
            action_params=action_params,
            confidence=confidence,
            status=GovernanceDecisionStatus.PROPOSED,
            proposed_at=datetime.now()
        )
        self.decisions[decision.id] = decision
        self.audit_log.record_event(AuditEvent(
            id=str(uuid.uuid4())[:8],
            timestamp=datetime.now(),
            event_type="decision_proposed",
            decision_id=decision.id,
            description=description,
            actor=actor,
            outcome="proposed",
            confidence=confidence,
            reasoning=reasoning
        ))
        return decision

    def approve_decision(self, decision_id: str) -> str:
        """Approve a proposed decision."""
        decision = self.decisions.get(decision_id)
        if not decision:
            raise ValueError(f"Decision {decision_id} not found")
        if decision.status != GovernanceDecisionStatus.PROPOSED:
            raise ValueError(f"Decision {decision_id} is not in PROPOSED state")

        violations = self._validate_constraints(decision.constraints)
        if violations:
            decision.constraints_violated = violations
            raise ValueError(f"Constraints violated: {violations}")

        decision.status = GovernanceDecisionStatus.APPROVED
        decision.approved_at = datetime.now()

        self.audit_log.record_event(AuditEvent(
            id=str(uuid.uuid4())[:8],
            timestamp=datetime.now(),
            event_type="decision_approved",
            decision_id=decision_id,
            description=decision.description,
            actor=decision.actor,
            outcome="approved",
            confidence=decision.confidence,
            reasoning=decision.reasoning
        ))
        return decision_id

    def reject_decision(self, decision_id: str, reason: str = "") -> None:
        """Reject a proposed decision."""
        decision = self.decisions.get(decision_id)
        if not decision:
            raise ValueError(f"Decision {decision_id} not found")
        if decision.status != GovernanceDecisionStatus.PROPOSED:
            raise ValueError(f"Decision {decision_id} is not in PROPOSED state")

        decision.status = GovernanceDecisionStatus.REJECTED
        decision.metadata["rejection_reason"] = reason

        self.audit_log.record_event(AuditEvent(
            id=str(uuid.uuid4())[:8],
            timestamp=datetime.now(),
            event_type="decision_rejected",
            decision_id=decision_id,
            description=f"Rejected: {reason}",
            actor=decision.actor,
            outcome="rejected",
            confidence=decision.confidence
        ))

    def execute_decision(self, decision_id: str) -> bool:
        """Execute an approved decision."""
        decision = self.decisions.get(decision_id)
        if not decision:
            raise ValueError(f"Decision {decision_id} not found")
        if decision.status != GovernanceDecisionStatus.APPROVED:
            raise ValueError(f"Decision {decision_id} is not in APPROVED state")

        decision.status = GovernanceDecisionStatus.EXECUTING
        decision.executed_at = datetime.now()

        self.audit_log.record_event(AuditEvent(
            id=str(uuid.uuid4())[:8],
            timestamp=datetime.now(),
            event_type="decision_executing",
            decision_id=decision_id,
            description=f"Executing: {decision.action}",
            actor=decision.actor,
            outcome="executing",
            confidence=decision.confidence
        ))

        success = self._apply_action(decision_id, decision.action, decision.action_params)

        if success:
            decision.status = GovernanceDecisionStatus.COMPLETED
            decision.completed_at = datetime.now()
            self.audit_log.record_event(AuditEvent(
                id=str(uuid.uuid4())[:8],
                timestamp=datetime.now(),
                event_type="decision_completed",
                decision_id=decision_id,
                description=decision.description,
                actor=decision.actor,
                outcome="completed",
                confidence=decision.confidence,
                duration_ms=(
                    (decision.completed_at - decision.executed_at).total_seconds() * 1000
                    if decision.completed_at else 0
                )
            ))
            return True
        else:
            decision.status = GovernanceDecisionStatus.FAILED
            decision.failed_at = datetime.now()
            self.audit_log.record_event(AuditEvent(
                id=str(uuid.uuid4())[:8],
                timestamp=datetime.now(),
                event_type="decision_failed",
                decision_id=decision_id,
                description="Execution failed",
                actor=decision.actor,
                outcome="failed",
                confidence=decision.confidence,
                rollback_performed=True
            ))
            return False

    def rollback_decision(self, decision_id: str, reason: str) -> bool:
        """Rollback a completed or executing decision."""
        decision = self.decisions.get(decision_id)
        if not decision:
            raise ValueError(f"Decision {decision_id} not found")
        if decision.status not in (GovernanceDecisionStatus.COMPLETED, GovernanceDecisionStatus.EXECUTING):
            raise ValueError(f"Decision {decision_id} cannot be rolled back")

        decision.status = GovernanceDecisionStatus.ROLLED_BACK
        decision.rolled_back_at = datetime.now()
        decision.rollback_reason = reason

        self.audit_log.record_event(AuditEvent(
            id=str(uuid.uuid4())[:8],
            timestamp=datetime.now(),
            event_type="decision_rolled_back",
            decision_id=decision_id,
            description=f"Rolled back: {reason}",
            actor=decision.actor,
            outcome="rolled_back",
            confidence=decision.confidence,
            rollback_performed=True,
            rollback_reason=reason
        ))
        return True

    def _validate_constraints(self, constraints: dict[str, Any]) -> list[str]:
        """Validate that constraints are met."""
        violations = []
        for budget in self.budget_guardrail.budgets.values():
            if "cost" in constraints:
                status, _ = self.budget_guardrail.check_budget(
                    budget.id, constraints["cost"]
                )
                if status == BudgetStatus.EXCEEDED:
                    violations.append(f"Budget {budget.name} exceeded")
        return violations

    def _apply_action(self, decision_id: str, action: str, params: dict[str, Any]) -> bool:
        """Apply an action (placeholder)."""
        return True

    def get_decision(self, decision_id: str) -> AutonomousDecision | None:
        """Get a decision by ID."""
        return self.decisions.get(decision_id)

    def get_statistics(self) -> dict:
        """Get decision statistics."""
        status_counts = defaultdict(int)
        for decision in self.decisions.values():
            status_counts[decision.status.value] += 1
        return {
            "total_decisions": len(self.decisions),
            **dict(status_counts)
        }

    def get_health_status(self) -> dict:
        """Get overall governance health status."""
        stats = self.get_statistics()
        failed_count = stats.get("failed", 0)
        rolled_back_count = stats.get("rolled_back", 0)
        total = stats["total_decisions"]

        if failed_count > 0:
            status = "unhealthy"
        elif total > 0 and rolled_back_count / total > 0.1:
            status = "warning"
        else:
            status = "healthy"

        return {
            "status": status,
            "statistics": stats,
            "budget_warnings": len(self.budget_guardrail.get_warnings()),
            "policy_violations": sum(
                p.violation_count for p in self.policy_engine.policies.values()
            )
        }


# Factory functions

def create_policy_rule(
    name: str,
    policy_type: PolicyType,
    description: str = "",
    condition: str = "",
    action: str = "",
    priority: int = 100
) -> PolicyRule:
    """Create a policy rule."""
    return PolicyRule(
        id=str(uuid.uuid4())[:8],
        name=name,
        policy_type=policy_type,
        description=description,
        condition=condition,
        action=action,
        priority=priority
    )


def create_budget_limit(
    name: str,
    budget_type: BudgetType,
    limit: float,
    current_spend: float = 0.0,
    alert_threshold: float = 0.8,
    critical_threshold: float = 1.0,
    grace_period_hours: float = 1.0
) -> BudgetLimit:
    """Create a budget limit."""
    return BudgetLimit(
        id=str(uuid.uuid4())[:8],
        name=name,
        budget_type=budget_type,
        limit=limit,
        current_spend=current_spend,
        alert_threshold=alert_threshold,
        critical_threshold=critical_threshold,
        grace_period_hours=grace_period_hours
    )


def create_compliance_policy(
    name: str,
    policy_type: PolicyType,
    requirements: list[str],
    description: str = ""
) -> CompliancePolicy:
    """Create a compliance policy."""
    return CompliancePolicy(
        id=str(uuid.uuid4())[:8],
        name=name,
        policy_type=policy_type,
        description=description,
        requirements=requirements
    )


def create_autonomous_governor() -> AutonomousGovernor:
    """Create an autonomous governor instance."""
    return AutonomousGovernor()
