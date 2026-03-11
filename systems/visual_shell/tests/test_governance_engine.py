"""
Tests for Phase 61: Autonomous Governance

Comprehensive tests for policy-based autonomous decisions.
"""

from datetime import datetime

import pytest

from systems.visual_shell.governance_engine import (
    AuditEvent,
    BudgetGuardrail,
    BudgetLimit,
    BudgetStatus,
    BudgetType,
    ComplianceChecker,
    CompliancePolicy,
    GovernanceAuditLog,
    GovernanceDecisionStatus,
    # Classes
    PolicyEngine,
    # Dataclasses
    PolicyRule,
    PolicyStatus,
    # Enums
    PolicyType,
    ViolationSeverity,
    create_autonomous_governor,
    create_budget_limit,
    create_compliance_policy,
    # Factory functions
    create_policy_rule,
)


class TestEnums:
    """Test enum definitions."""

    def test_policy_type_values(self):
        assert PolicyType.SCALING.value == "scaling"
        assert PolicyType.PLACEMENT.value == "placement"
        assert PolicyType.RESOURCE_LIMIT.value == "resource_limit"
        assert PolicyType.COST_CONTROL.value == "cost_control"
        assert PolicyType.SECURITY.value == "security"
        assert PolicyType.COMPLIANCE.value == "compliance"
        assert PolicyType.PERFORMANCE.value == "performance"

    def test_policy_status_values(self):
        assert PolicyStatus.ACTIVE.value == "active"
        assert PolicyStatus.SUSPENDED.value == "suspended"
        assert PolicyStatus.DEPRECATED.value == "deprecated"
        assert PolicyStatus.DRAFT.value == "draft"

    def test_violation_severity_values(self):
        assert ViolationSeverity.LOW.value == "low"
        assert ViolationSeverity.MEDIUM.value == "medium"
        assert ViolationSeverity.HIGH.value == "high"
        assert ViolationSeverity.CRITICAL.value == "critical"

    def test_budget_type_values(self):
        assert BudgetType.DAILY.value == "daily"
        assert BudgetType.WEEKLY.value == "weekly"
        assert BudgetType.MONTHLY.value == "monthly"
        assert BudgetType.QUARTERLY.value == "quarterly"

    def test_budget_status_values(self):
        assert BudgetStatus.NORMAL.value == "normal"
        assert BudgetStatus.WARNING.value == "warning"
        assert BudgetStatus.CRITICAL.value == "critical"
        assert BudgetStatus.EXCEEDED.value == "exceeded"

    def test_decision_status_values(self):
        assert GovernanceDecisionStatus.PROPOSED.value == "proposed"
        assert GovernanceDecisionStatus.APPROVED.value == "approved"
        assert GovernanceDecisionStatus.REJECTED.value == "rejected"
        assert GovernanceDecisionStatus.EXECUTING.value == "executing"
        assert GovernanceDecisionStatus.COMPLETED.value == "completed"
        assert GovernanceDecisionStatus.ROLLED_BACK.value == "rolled_back"
        assert GovernanceDecisionStatus.FAILED.value == "failed"


class TestPolicyRule:
    """Test PolicyRule dataclass."""

    def test_create_policy_rule(self):
        rule = PolicyRule(
            id="rule-001",
            name="max-replicas",
            policy_type=PolicyType.SCALING,
            description="Limit max replicas to 10",
            condition="context.get('replicas', 0) <= 10",
            action="deny"
        )
        assert rule.id == "rule-001"
        assert rule.policy_type == PolicyType.SCALING
        assert rule.status == PolicyStatus.ACTIVE

    def test_create_policy_rule_factory(self):
        rule = create_policy_rule(
            name="cost-limit",
            policy_type=PolicyType.COST_CONTROL,
            description="Limit monthly cost",
            condition="context.get('cost', 0) <= 1000",
            priority=50
        )
        assert rule.name == "cost-limit"
        assert rule.priority == 50


class TestBudgetLimit:
    """Test BudgetLimit dataclass."""

    def test_create_budget_limit(self):
        budget = BudgetLimit(
            id="budget-001",
            name="monthly-compute",
            budget_type=BudgetType.MONTHLY,
            limit=1000.0
        )
        assert budget.id == "budget-001"
        assert budget.limit == 1000.0
        assert budget.current_spend == 0.0

    def test_create_budget_limit_factory(self):
        budget = create_budget_limit(
            name="weekly-ops",
            budget_type=BudgetType.WEEKLY,
            limit=500.0,
            alert_threshold=0.7,
            critical_threshold=0.9
        )
        assert budget.name == "weekly-ops"
        assert budget.alert_threshold == 0.7

    def test_utilization_percentage(self):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            current_spend=50.0
        )
        assert budget.utilization_percentage == 50.0

    def test_utilization_zero_limit(self):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=0.0
        )
        assert budget.utilization_percentage == 0.0

    def test_check_normal(self):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            grace_period_hours=0.0
        )
        status = budget.check(50.0)
        assert status == BudgetStatus.NORMAL

    def test_check_warning(self):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            alert_threshold=0.8,
            grace_period_hours=0.0
        )
        status = budget.check(85.0)
        assert status == BudgetStatus.WARNING

    def test_check_exceeded(self):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            critical_threshold=1.0,
            grace_period_hours=0.0
        )
        status = budget.check(150.0)
        assert status == BudgetStatus.EXCEEDED

    def test_check_grace_period(self):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            grace_period_hours=1.0
        )
        status = budget.check(150.0)
        # Should be normal during grace period
        assert status == BudgetStatus.NORMAL

    def test_update_spend(self):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            grace_period_hours=0.0
        )
        budget.update_spend(90.0)
        assert budget.current_spend == 90.0
        assert budget.status == BudgetStatus.WARNING

    def test_reset(self):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            current_spend=80.0,
            grace_period_hours=0.0
        )
        budget.status = BudgetStatus.WARNING
        budget.reset()
        assert budget.current_spend == 0.0
        assert budget.status == BudgetStatus.NORMAL


class TestCompliancePolicy:
    """Test CompliancePolicy dataclass."""

    def test_create_compliance_policy(self):
        policy = CompliancePolicy(
            id="policy-001",
            name="data-retention",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_retain_data"]
        )
        assert policy.id == "policy-001"
        assert policy.is_active()

    def test_create_compliance_policy_factory(self):
        policy = create_compliance_policy(
            name="security-policy",
            policy_type=PolicyType.SECURITY,
            requirements=["must_encrypt", "must_audit"]
        )
        assert policy.name == "security-policy"
        assert len(policy.requirements) == 2

    def test_check_compliance_pass(self):
        policy = CompliancePolicy(
            id="policy-001",
            name="test",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_have_key"]
        )
        # The requirement "must_have_key" looks for "have_key" in context
        is_compliant, violations = policy.check_compliance({"have_key": "value"})
        assert is_compliant is True
        assert violations == []

    def test_check_compliance_fail(self):
        policy = CompliancePolicy(
            id="policy-001",
            name="test",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_have_key"]
        )
        is_compliant, violations = policy.check_compliance({})
        assert is_compliant is False
        assert len(violations) == 1


class TestAuditEvent:
    """Test AuditEvent dataclass."""

    def test_create_audit_event(self):
        event = AuditEvent(
            id="event-001",
            timestamp=datetime.now(),
            event_type="decision_proposed",
            decision_id="decision-001",
            description="Test event",
            actor="system"
        )
        assert event.id == "event-001"
        assert event.confidence == 1.0


class TestGovernanceAuditLog:
    """Test GovernanceAuditLog class."""

    def test_create_audit_log(self):
        log = GovernanceAuditLog()
        assert log.events == []
        assert log.max_events == 10000

    def test_record_event(self):
        log = GovernanceAuditLog()
        event = AuditEvent(
            id="event-001",
            timestamp=datetime.now(),
            event_type="test",
            decision_id="dec-001",
            description="Test"
        )
        log.record_event(event)
        assert len(log.events) == 1

    def test_get_events(self):
        log = GovernanceAuditLog()
        for i in range(5):
            log.record_event(AuditEvent(
                id=f"event-{i}",
                timestamp=datetime.now(),
                event_type="test",
                decision_id="dec-001",
                description="Test"
            ))
        events = log.get_events(limit=3)
        assert len(events) == 3

    def test_get_events_by_type(self):
        log = GovernanceAuditLog()
        log.record_event(AuditEvent(
            id="event-1",
            timestamp=datetime.now(),
            event_type="type_a",
            decision_id="dec-001",
            description="Test"
        ))
        log.record_event(AuditEvent(
            id="event-2",
            timestamp=datetime.now(),
            event_type="type_b",
            decision_id="dec-001",
            description="Test"
        ))
        log.record_event(AuditEvent(
            id="event-3",
            timestamp=datetime.now(),
            event_type="type_a",
            decision_id="dec-001",
            description="Test"
        ))
        type_a = log.get_events_by_type("type_a")
        assert len(type_a) == 2

    def test_get_events_by_decision(self):
        log = GovernanceAuditLog()
        log.record_event(AuditEvent(
            id="event-1",
            timestamp=datetime.now(),
            event_type="test",
            decision_id="dec-001",
            description="Test"
        ))
        log.record_event(AuditEvent(
            id="event-2",
            timestamp=datetime.now(),
            event_type="test",
            decision_id="dec-002",
            description="Test"
        ))
        events = log.get_events_by_decision("dec-001")
        assert len(events) == 1

    def test_max_events_trimming(self):
        log = GovernanceAuditLog(max_events=5)
        for i in range(10):
            log.record_event(AuditEvent(
                id=f"event-{i}",
                timestamp=datetime.now(),
                event_type="test",
                decision_id="dec-001",
                description="Test"
            ))
        assert len(log.events) == 5

    def test_export_log(self):
        log = GovernanceAuditLog()
        log.record_event(AuditEvent(
            id="event-1",
            timestamp=datetime.now(),
            event_type="test",
            decision_id="dec-001",
            description="Test",
            actor="system",
            outcome="success"
        ))
        exported = log.export_log()
        assert len(exported) == 1
        assert exported[0]["id"] == "event-1"


class TestPolicyEngine:
    """Test PolicyEngine class."""

    @pytest.fixture
    def engine(self):
        return PolicyEngine()

    def test_create_engine(self, engine):
        assert engine.policies == {}

    def test_create_policy(self, engine):
        policy = engine.create_policy(
            name="max-replicas",
            policy_type=PolicyType.SCALING,
            description="Limit replicas",
            condition="context.get('replicas', 0) <= 10",
            action="deny"
        )
        assert policy.id in engine.policies
        assert policy.status == PolicyStatus.DRAFT

    def test_activate_policy(self, engine):
        policy = engine.create_policy(
            name="test",
            policy_type=PolicyType.SCALING,
            description="Test",
            condition="True",
            action="allow"
        )
        engine.activate_policy(policy.id)
        assert engine.policies[policy.id].status == PolicyStatus.ACTIVE

    def test_suspend_policy(self, engine):
        policy = engine.create_policy(
            name="test",
            policy_type=PolicyType.SCALING,
            description="Test",
            condition="True",
            action="allow"
        )
        engine.activate_policy(policy.id)
        engine.suspend_policy(policy.id)
        assert engine.policies[policy.id].status == PolicyStatus.SUSPENDED

    def test_evaluate_policies_pass(self, engine):
        policy = engine.create_policy(
            name="test",
            policy_type=PolicyType.SCALING,
            description="Test",
            condition="context.get('value', 0) < 100",
            action="allow"
        )
        engine.activate_policy(policy.id)
        results = engine.evaluate_policies({"value": 50})
        assert len(results) == 1
        assert results[0][1] is True

    def test_evaluate_policies_fail(self, engine):
        policy = engine.create_policy(
            name="test",
            policy_type=PolicyType.SCALING,
            description="Test",
            condition="context.get('value', 0) < 100",
            action="deny"
        )
        engine.activate_policy(policy.id)
        results = engine.evaluate_policies({"value": 150})
        assert results[0][1] is False

    def test_get_active_policies(self, engine):
        policy1 = engine.create_policy(
            name="active",
            policy_type=PolicyType.SCALING,
            description="Test",
            condition="True",
            action="allow"
        )
        policy2 = engine.create_policy(
            name="draft",
            policy_type=PolicyType.SCALING,
            description="Test",
            condition="True",
            action="allow"
        )
        engine.activate_policy(policy1.id)
        # policy2 stays in draft
        active = engine.get_active_policies()
        assert len(active) == 1


class TestBudgetGuardrail:
    """Test BudgetGuardrail class."""

    @pytest.fixture
    def guardrail(self):
        return BudgetGuardrail()

    def test_create_guardrail(self, guardrail):
        assert guardrail.budgets == {}

    def test_add_budget(self, guardrail):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            grace_period_hours=0.0
        )
        guardrail.add_budget(budget)
        assert "budget-001" in guardrail.budgets

    def test_check_budget_normal(self, guardrail):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            grace_period_hours=0.0
        )
        guardrail.add_budget(budget)
        status, remaining = guardrail.check_budget("budget-001", 50.0)
        assert status == BudgetStatus.NORMAL
        assert remaining == 50.0

    def test_check_budget_not_found(self, guardrail):
        status, remaining = guardrail.check_budget("nonexistent", 50.0)
        assert status == BudgetStatus.NORMAL

    def test_update_spend(self, guardrail):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            grace_period_hours=0.0
        )
        guardrail.add_budget(budget)
        guardrail.update_spend("budget-001", 50.0)
        assert guardrail.budgets["budget-001"].current_spend == 50.0

    def test_get_warnings(self, guardrail):
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            current_spend=90.0,
            grace_period_hours=0.0
        )
        budget.status = BudgetStatus.WARNING
        guardrail.add_budget(budget)
        warnings = guardrail.get_warnings()
        assert len(warnings) == 1


class TestComplianceChecker:
    """Test ComplianceChecker class."""

    @pytest.fixture
    def checker(self):
        return ComplianceChecker()

    def test_create_checker(self, checker):
        assert checker.policies == {}

    def test_add_policy(self, checker):
        policy = CompliancePolicy(
            id="policy-001",
            name="test",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_have_x"]
        )
        checker.add_policy(policy)
        assert "policy-001" in checker.policies

    def test_check_compliance_pass(self, checker):
        policy = CompliancePolicy(
            id="policy-001",
            name="test",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_have_x"]
        )
        checker.add_policy(policy)
        # The requirement "must_have_x" looks for "have_x" in context
        is_compliant, violations = checker.check_compliance(
            "policy-001",
            {"have_x": "value"}
        )
        assert is_compliant is True

    def test_check_compliance_not_found(self, checker):
        is_compliant, violations = checker.check_compliance("nonexistent", {})
        assert is_compliant is True

    def test_check_all_compliance(self, checker):
        policy1 = CompliancePolicy(
            id="policy-001",
            name="test1",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_have_x"]
        )
        policy2 = CompliancePolicy(
            id="policy-002",
            name="test2",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_have_y"]
        )
        checker.add_policy(policy1)
        checker.add_policy(policy2)
        results = checker.check_all_compliance({"must_have_x": "a", "must_have_y": "b"})
        assert len(results) == 2

    def test_get_violations(self, checker):
        policy = CompliancePolicy(
            id="policy-001",
            name="test",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_have_x"],
            violation_count=5
        )
        checker.add_policy(policy)
        violations = checker.get_violations()
        assert len(violations) == 1


class TestAutonomousGovernor:
    """Test AutonomousGovernor class."""

    @pytest.fixture
    def governor(self):
        return create_autonomous_governor()

    def test_create_governor(self, governor):
        assert governor.policy_engine is not None
        assert governor.budget_guardrail is not None
        assert governor.compliance_checker is not None
        assert governor.audit_log is not None

    def test_propose_decision(self, governor):
        decision = governor.propose_decision(
            description="Scale up replicas",
            actor="autoscaler",
            reasoning="High CPU usage",
            constraints={"cost": 50.0},
            action="scale_up",
            action_params={"replicas": 5},
            confidence=0.9
        )
        assert decision.id in governor.decisions
        assert decision.status == GovernanceDecisionStatus.PROPOSED

    def test_approve_decision(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        decision_id = governor.approve_decision(decision.id)
        assert decision_id == decision.id
        assert governor.decisions[decision.id].status == GovernanceDecisionStatus.APPROVED

    def test_approve_decision_not_found(self, governor):
        with pytest.raises(ValueError, match="not found"):
            governor.approve_decision("nonexistent")

    def test_approve_decision_wrong_status(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        governor.approve_decision(decision.id)
        with pytest.raises(ValueError, match="not in PROPOSED state"):
            governor.approve_decision(decision.id)

    def test_reject_decision(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        governor.reject_decision(decision.id, "Too risky")
        assert governor.decisions[decision.id].status == GovernanceDecisionStatus.REJECTED

    def test_execute_decision(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        governor.approve_decision(decision.id)
        success = governor.execute_decision(decision.id)
        assert success is True
        assert governor.decisions[decision.id].status == GovernanceDecisionStatus.COMPLETED

    def test_execute_decision_not_approved(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        with pytest.raises(ValueError, match="not in APPROVED state"):
            governor.execute_decision(decision.id)

    def test_rollback_decision(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        governor.approve_decision(decision.id)
        governor.execute_decision(decision.id)
        success = governor.rollback_decision(decision.id, "Issues detected")
        assert success is True
        assert governor.decisions[decision.id].status == GovernanceDecisionStatus.ROLLED_BACK

    def test_rollback_decision_not_allowed(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        with pytest.raises(ValueError, match="cannot be rolled back"):
            governor.rollback_decision(decision.id, "Test")

    def test_get_decision(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        retrieved = governor.get_decision(decision.id)
        assert retrieved.id == decision.id

    def test_get_statistics(self, governor):
        # Create multiple decisions with different statuses
        d1 = governor.propose_decision("Test1", "system", "test", {}, "test", {})
        governor.approve_decision(d1.id)

        d2 = governor.propose_decision("Test2", "system", "test", {}, "test", {})
        governor.reject_decision(d2.id, "Rejected")

        stats = governor.get_statistics()
        assert stats["total_decisions"] == 2
        assert stats["approved"] == 1
        assert stats["rejected"] == 1

    def test_get_health_status_healthy(self, governor):
        d = governor.propose_decision("Test", "system", "test", {}, "test", {})
        governor.approve_decision(d.id)
        governor.execute_decision(d.id)

        health = governor.get_health_status()
        assert health["status"] == "healthy"

    def test_get_health_status_warning(self, governor):
        # Create 10 decisions, 2 rolled back (> 10%)
        for i in range(10):
            d = governor.propose_decision(f"Test{i}", "system", "test", {}, "test", {})
            governor.approve_decision(d.id)
            governor.execute_decision(d.id)
            if i < 2:
                governor.rollback_decision(d.id, "Test")

        health = governor.get_health_status()
        assert health["status"] == "warning"

    def test_audit_events_recorded(self, governor):
        decision = governor.propose_decision(
            description="Test",
            actor="system",
            reasoning="Test",
            constraints={},
            action="test",
            action_params={}
        )
        governor.approve_decision(decision.id)
        governor.execute_decision(decision.id)

        events = governor.audit_log.get_events_by_decision(decision.id)
        assert len(events) >= 3  # proposed, approved, completed


class TestIntegration:
    """Integration tests for governance engine."""

    def test_full_decision_lifecycle(self):
        """Test complete decision lifecycle."""
        governor = create_autonomous_governor()

        # Add budget
        budget = create_budget_limit(
            name="monthly-budget",
            budget_type=BudgetType.MONTHLY,
            limit=1000.0,
            grace_period_hours=0.0
        )
        governor.budget_guardrail.add_budget(budget)

        # Propose decision
        decision = governor.propose_decision(
            description="Scale up for traffic spike",
            actor="autoscaler",
            reasoning="CPU at 85%, need more capacity",
            constraints={"cost": 50.0},
            action="scale_up",
            action_params={"replicas": 3, "service": "api"},
            confidence=0.95
        )

        assert decision.status == GovernanceDecisionStatus.PROPOSED

        # Approve
        governor.approve_decision(decision.id)
        assert governor.decisions[decision.id].status == GovernanceDecisionStatus.APPROVED

        # Execute
        success = governor.execute_decision(decision.id)
        assert success is True
        assert governor.decisions[decision.id].status == GovernanceDecisionStatus.COMPLETED

        # Check audit trail
        events = governor.audit_log.get_events_by_decision(decision.id)
        assert len(events) >= 3

    def test_budget_constraint_enforcement(self):
        """Test budget constraints are enforced."""
        governor = create_autonomous_governor()

        # Add tight budget
        budget = create_budget_limit(
            name="tight-budget",
            budget_type=BudgetType.DAILY,
            limit=100.0,
            current_spend=90.0,
            grace_period_hours=0.0
        )
        # Update status to reflect spend
        budget.status = budget.check(budget.current_spend)
        governor.budget_guardrail.add_budget(budget)

        # Try to propose decision exceeding budget
        decision = governor.propose_decision(
            description="Expensive operation",
            actor="system",
            reasoning="Need expensive resources",
            constraints={"cost": 50.0},  # Would exceed budget
            action="allocate",
            action_params={"resources": "gpu"},
            confidence=0.8
        )

        # Try to approve - should fail budget check
        with pytest.raises(ValueError, match="Constraints violated"):
            governor.approve_decision(decision.id)

    def test_compliance_policy_enforcement(self):
        """Test compliance policies are enforced."""
        governor = create_autonomous_governor()

        # Add compliance policy
        policy = create_compliance_policy(
            name="data-policy",
            policy_type=PolicyType.COMPLIANCE,
            requirements=["must_have_approval"]
        )
        governor.compliance_checker.add_policy(policy)


class TestEdgeCases:
    """Test edge cases and error handling."""

    def test_empty_governor_statistics(self):
        """Test statistics with no decisions."""
        governor = create_autonomous_governor()
        stats = governor.get_statistics()
        assert stats["total_decisions"] == 0

    def test_budget_zero_limit(self):
        """Test budget with zero limit."""
        budget = BudgetLimit(
            id="budget-001",
            name="test",
            budget_type=BudgetType.DAILY,
            limit=0.0
        )
        assert budget.utilization_percentage == 0.0
        status = budget.check(0.0)
        assert status == BudgetStatus.NORMAL

    def test_policy_invalid_condition(self):
        """Test policy with invalid condition."""
        engine = PolicyEngine()
        policy = engine.create_policy(
            name="invalid",
            policy_type=PolicyType.SCALING,
            description="Invalid condition",
            condition="this is not valid python",
            action="deny"
        )
        engine.activate_policy(policy.id)
        results = engine.evaluate_policies({})
        assert results[0][1] is False  # Should fail gracefully

    def test_audit_log_empty(self):
        """Test audit log with no events."""
        log = GovernanceAuditLog()
        assert log.get_events() == []
        assert log.get_events_by_type("test") == []
        assert log.get_events_by_decision("test") == []

    def test_multiple_policies_priority(self):
        """Test that policies are stored correctly."""
        engine = PolicyEngine()
        p1 = engine.create_policy("low", PolicyType.SCALING, "Test", "True", "a", priority=10)
        p2 = engine.create_policy("high", PolicyType.SCALING, "Test", "True", "a", priority=100)
        engine.activate_policy(p1.id)
        engine.activate_policy(p2.id)
        active = engine.get_active_policies()
        assert len(active) == 2
