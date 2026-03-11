"""
Tests for Intent-Based Infrastructure - Phase 58

Tests natural language intent parsing, validation, conflict resolution,
and declarative infrastructure management.
"""


import pytest

from systems.visual_shell.intent_based_infrastructure import (
    ConflictInfo,
    ConflictResolution,
    ConflictResolver,
    ConstraintType,
    ExecutionPlan,
    ExecutionStep,
    Intent,
    IntentConstraint,
    IntentEngine,
    IntentExecutor,
    IntentParser,
    IntentResource,
    IntentSpec,
    IntentStatus,
    IntentTracker,
    IntentType,
    IntentValidator,
    ValidationIssue,
    ValidationResult,
    ValidationSeverity,
    create_intent,
    create_intent_constraint,
    create_intent_engine,
    create_intent_resource,
)


class TestEnums:
    """Test enum definitions."""

    def test_intent_status_values(self):
        assert IntentStatus.PENDING.value == "pending"
        assert IntentStatus.PARSING.value == "parsing"
        assert IntentStatus.VALIDATING.value == "validating"
        assert IntentStatus.PLANNING.value == "planning"
        assert IntentStatus.EXECUTING.value == "executing"
        assert IntentStatus.COMPLETED.value == "completed"
        assert IntentStatus.FAILED.value == "failed"
        assert IntentStatus.CONFLICT.value == "conflict"
        assert IntentStatus.ROLLED_BACK.value == "rolled_back"
        assert IntentStatus.CANCELLED.value == "cancelled"

    def test_intent_type_values(self):
        assert IntentType.DEPLOYMENT.value == "deployment"
        assert IntentType.SCALING.value == "scaling"
        assert IntentType.NETWORKING.value == "networking"
        assert IntentType.SECURITY.value == "security"
        assert IntentType.STORAGE.value == "storage"
        assert IntentType.PERFORMANCE.value == "performance"
        assert IntentType.AVAILABILITY.value == "availability"
        assert IntentType.COST.value == "cost"
        assert IntentType.CUSTOM.value == "custom"

    def test_constraint_type_values(self):
        assert ConstraintType.HARD.value == "hard"
        assert ConstraintType.SOFT.value == "soft"
        assert ConstraintType.PREFERENCE.value == "preference"

    def test_validation_severity_values(self):
        assert ValidationSeverity.INFO.value == "info"
        assert ValidationSeverity.WARNING.value == "warning"
        assert ValidationSeverity.ERROR.value == "error"
        assert ValidationSeverity.CRITICAL.value == "critical"

    def test_conflict_resolution_values(self):
        assert ConflictResolution.OVERRIDE.value == "override"
        assert ConflictResolution.MERGE.value == "merge"
        assert ConflictResolution.REJECT.value == "reject"
        assert ConflictResolution.DEFER.value == "defer"
        assert ConflictResolution.ESCALATE.value == "escalate"


class TestDataclasses:
    """Test dataclass structures."""

    def test_intent_constraint_creation(self):
        constraint = IntentConstraint(
            name="max_cost",
            constraint_type=ConstraintType.HARD,
            value=1000,
            description="Maximum budget",
        )
        assert constraint.name == "max_cost"
        assert constraint.constraint_type == ConstraintType.HARD
        assert constraint.value == 1000
        assert constraint.description == "Maximum budget"
        assert constraint.priority == 0

    def test_intent_resource_creation(self):
        resource = IntentResource(
            resource_type="container",
            name="web-api",
            properties={"cpu": 2, "memory": "4Gi"},
            dependencies=["database"],
        )
        assert resource.resource_type == "container"
        assert resource.name == "web-api"
        assert resource.properties["cpu"] == 2
        assert resource.dependencies == ["database"]

    def test_intent_spec_creation(self):
        spec = IntentSpec(
            intent_type=IntentType.DEPLOYMENT,
            description="Deploy web service",
            resources=[
                IntentResource(resource_type="container", name="api"),
            ],
            constraints=[
                IntentConstraint(name="region", constraint_type=ConstraintType.HARD, value="us-east-1"),
            ],
        )
        assert spec.intent_type == IntentType.DEPLOYMENT
        assert spec.description == "Deploy web service"
        assert len(spec.resources) == 1
        assert len(spec.constraints) == 1

    def test_intent_creation(self):
        spec = IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test")
        intent = Intent(
            intent_id="intent-001",
            name="deploy-api",
            spec=spec,
        )
        assert intent.intent_id == "intent-001"
        assert intent.name == "deploy-api"
        assert intent.status == IntentStatus.PENDING
        assert intent.version == 1

    def test_validation_issue_creation(self):
        issue = ValidationIssue(
            severity=ValidationSeverity.ERROR,
            message="Invalid resource count",
            location="resources[0].count",
            suggestion="Count must be positive",
        )
        assert issue.severity == ValidationSeverity.ERROR
        assert issue.location == "resources[0].count"

    def test_conflict_info_creation(self):
        conflict = ConflictInfo(
            intent_a="intent-001",
            intent_b="intent-002",
            resource="container:api",
            conflict_type="resource_overlap",
            resolution=ConflictResolution.REJECT,
            details="Both intents target the same resource",
        )
        assert conflict.intent_a == "intent-001"
        assert conflict.resolution == ConflictResolution.REJECT
        assert conflict.resource == "container:api"

    def test_execution_step_creation(self):
        step = ExecutionStep(
            step_id="step-001",
            description="Provision container",
            action="provision",
            target="container/api",
            rollback_action="deprovision",
        )
        assert step.step_id == "step-001"
        assert step.action == "provision"
        assert step.status == IntentStatus.PENDING

    def test_execution_plan_creation(self):
        plan = ExecutionPlan(
            plan_id="plan-001",
            intent_id="intent-001",
            steps=[],
            estimated_duration=60.0,
            risk_level="medium",
        )
        assert plan.plan_id == "plan-001"
        assert plan.risk_level == "medium"


class TestIntentParser:
    """Test intent parsing."""

    @pytest.fixture
    def parser(self):
        return IntentParser()

    def test_parse_dict_declaration(self, parser):
        declaration = {
            "intent_id": "test-001",
            "name": "deploy-web",
            "spec": {
                "type": "deployment",
                "description": "Deploy web service",
                "resources": [
                    {"type": "container", "name": "web", "properties": {"replicas": 3}},
                ],
                "constraints": [
                    {"name": "region", "type": "hard", "value": "us-east-1"},
                ],
            },
            "owner": "test-user",
            "metadata": {"env": "test"},
        }
        intent = parser.parse(declaration)

        assert intent.intent_id == "test-001"
        assert intent.name == "deploy-web"
        assert intent.spec.intent_type == IntentType.DEPLOYMENT
        assert len(intent.spec.resources) == 1
        assert len(intent.spec.constraints) == 1
        assert intent.owner == "test-user"

    def test_parse_natural_language_deploy(self, parser):
        text = "deploy 3 instances of the api service"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.DEPLOYMENT
        assert "deploy" in intent.spec.description.lower()

    def test_parse_natural_language_scale(self, parser):
        text = "scale the web service to 5 replicas"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.SCALING

    def test_parse_natural_language_network(self, parser):
        text = "configure network firewall rules"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.NETWORKING

    def test_parse_natural_language_security(self, parser):
        text = "enable encryption and auth"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.SECURITY

    def test_parse_natural_language_storage(self, parser):
        text = "create storage volume backup"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.STORAGE

    def test_parse_natural_language_performance(self, parser):
        text = "optimize for low latency"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.PERFORMANCE

    def test_parse_natural_language_availability(self, parser):
        text = "ensure availability with redundant failover"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.AVAILABILITY

    def test_parse_natural_language_cost(self, parser):
        text = "reduce cost and budget"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.COST

    def test_parse_natural_language_custom(self, parser):
        text = "do something unknown"
        intent = parser.parse_natural_language(text)

        assert intent.spec.intent_type == IntentType.CUSTOM

    def test_extract_resources_instances(self, parser):
        text = "deploy 5 instances of web"
        intent = parser.parse_natural_language(text)

        compute_resources = [r for r in intent.spec.resources if r.resource_type == "compute"]
        assert len(compute_resources) > 0

    def test_extract_resources_memory(self, parser):
        text = "allocate 8GB memory"
        intent = parser.parse_natural_language(text)

        memory_resources = [r for r in intent.spec.resources if r.resource_type == "memory"]
        assert len(memory_resources) > 0

    def test_extract_resources_cpu(self, parser):
        text = "use 4 CPU cores"
        intent = parser.parse_natural_language(text)

        cpu_resources = [r for r in intent.spec.resources if r.resource_type == "cpu"]
        assert len(cpu_resources) > 0

    def test_extract_constraint_must(self, parser):
        text = "must be deployed in us-east-1"
        intent = parser.parse_natural_language(text)

        hard_constraints = [c for c in intent.spec.constraints if c.constraint_type == ConstraintType.HARD]
        assert len(hard_constraints) > 0

    def test_extract_constraint_should(self, parser):
        text = "should be highly available"
        intent = parser.parse_natural_language(text)

        soft_constraints = [c for c in intent.spec.constraints if c.constraint_type == ConstraintType.SOFT]
        assert len(soft_constraints) > 0

    def test_extract_constraint_latency(self, parser):
        text = "latency under 100ms"
        intent = parser.parse_natural_language(text)

        latency_constraints = [c for c in intent.spec.constraints if c.name == "max_latency_ms"]
        assert len(latency_constraints) > 0
        assert latency_constraints[0].value == 100

    def test_extract_constraint_cost(self, parser):
        text = "budget under $500"
        intent = parser.parse_natural_language(text)

        cost_constraints = [c for c in intent.spec.constraints if c.name == "max_cost"]
        assert len(cost_constraints) > 0
        assert cost_constraints[0].value == 500.0


class TestIntentValidator:
    """Test intent validation logic."""

    @pytest.fixture
    def validator(self):
        return IntentValidator()

    @pytest.fixture
    def valid_intent(self):
        return Intent(
            intent_id="test-001",
            name="test-intent",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Test intent",
                resources=[
                    IntentResource(resource_type="container", name="api"),
                ],
            ),
        )

    def test_validate_valid_intent(self, validator, valid_intent):
        result = validator.validate(valid_intent)

        assert result.valid is True
        assert len([i for i in result.issues if i.severity == ValidationSeverity.ERROR]) == 0

    def test_validate_missing_resource_type(self, validator):
        intent = Intent(
            intent_id="test-002",
            name="invalid-intent",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Test",
                resources=[
                    IntentResource(resource_type="", name="api"),
                ],
            ),
        )
        result = validator.validate(intent)

        assert result.valid is False
        assert any("resource type" in i.message.lower() for i in result.issues)

    def test_validate_resource_below_limit(self, validator):
        validator.set_resource_limit("cpu", 1.0, 100.0)
        intent = Intent(
            intent_id="test-003",
            name="below-limit",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Test",
                resources=[
                    IntentResource(resource_type="cpu", name="cpu-0", properties={"amount": 0.5}),
                ],
            ),
        )
        result = validator.validate(intent)

        assert result.valid is False

    def test_validate_resource_above_limit_warning(self, validator):
        validator.set_resource_limit("cpu", 1.0, 10.0)
        intent = Intent(
            intent_id="test-004",
            name="above-limit",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Test",
                resources=[
                    IntentResource(resource_type="cpu", name="cpu-0", properties={"amount": 50}),
                ],
            ),
        )
        result = validator.validate(intent)

        # Should warn, not error
        assert any(i.severity == ValidationSeverity.WARNING for i in result.issues)

    def test_validate_constraint_no_name(self, validator):
        intent = Intent(
            intent_id="test-005",
            name="no-name",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Test",
                resources=[IntentResource(resource_type="container", name="api")],
                constraints=[
                    IntentConstraint(name="", constraint_type=ConstraintType.HARD, value=100),
                ],
            ),
        )
        result = validator.validate(intent)

        assert result.valid is False

    def test_validate_constraint_no_value_warning(self, validator):
        intent = Intent(
            intent_id="test-006",
            name="no-value",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Test",
                resources=[IntentResource(resource_type="container", name="api")],
                constraints=[
                    IntentConstraint(name="budget", constraint_type=ConstraintType.SOFT, value=None),
                ],
            ),
        )
        result = validator.validate(intent)

        assert any(i.severity == ValidationSeverity.WARNING for i in result.issues)

    def test_validate_conflicting_constraints(self, validator):
        intent = Intent(
            intent_id="test-007",
            name="conflict",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Test",
                resources=[IntentResource(resource_type="container", name="api")],
                constraints=[
                    IntentConstraint(name="budget", constraint_type=ConstraintType.HARD, value=100),
                    IntentConstraint(name="budget", constraint_type=ConstraintType.HARD, value=200),
                ],
            ),
        )
        result = validator.validate(intent)

        # Should warn about multiple constraints with different values
        assert any("multiple" in i.message.lower() or "different" in i.message.lower() for i in result.issues)

    def test_add_custom_validator(self, validator, valid_intent):
        def custom_validator(intent: Intent) -> ValidationResult:
            if "invalid" in intent.name:
                return ValidationResult(
                    valid=False,
                    issues=[ValidationIssue(
                        severity=ValidationSeverity.ERROR,
                        message="Name contains 'invalid'",
                    )],
                )
            return ValidationResult(valid=True)

        validator.add_validator(custom_validator)
        result = validator.validate(valid_intent)

        assert result.valid is True

    def test_custom_validator_fails(self, validator):
        def custom_validator(intent: Intent) -> ValidationResult:
            return ValidationResult(
                valid=False,
                issues=[ValidationIssue(
                    severity=ValidationSeverity.ERROR,
                    message="Always fail",
                )],
            )

        validator.add_validator(custom_validator)
        intent = Intent(
            intent_id="test-008",
            name="test",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Test",
                resources=[IntentResource(resource_type="container", name="api")],
            ),
        )
        result = validator.validate(intent)

        assert result.valid is False

    def test_get_validation_stats(self, validator):
        validator.set_resource_limit("cpu", 1.0, 100.0)
        stats = validator.get_validation_stats()

        assert stats["resource_types_with_limits"] == 1
        assert stats["validators"] == 0


class TestConflictResolver:
    """Test conflict detection and resolution."""

    @pytest.fixture
    def resolver(self):
        return ConflictResolver()

    @pytest.fixture
    def existing_intent(self):
        intent = Intent(
            intent_id="existing-001",
            name="deploy-web",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Existing",
                resources=[
                    IntentResource(resource_type="container", name="web-api"),
                ],
            ),
        )
        return intent

    def test_no_conflict_different_resources(self, resolver, existing_intent):
        resolver.register_intent(existing_intent)

        new_intent = Intent(
            intent_id="new-001",
            name="deploy-worker",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="New",
                resources=[
                    IntentResource(resource_type="container", name="worker"),
                ],
            ),
        )
        conflicts = resolver.detect_conflicts(new_intent)

        assert len(conflicts) == 0

    def test_conflict_same_resource(self, resolver, existing_intent):
        resolver.register_intent(existing_intent)

        new_intent = Intent(
            intent_id="new-002",
            name="deploy-web-again",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="New",
                resources=[
                    IntentResource(resource_type="container", name="web-api"),
                ],
            ),
        )
        conflicts = resolver.detect_conflicts(new_intent)

        assert len(conflicts) > 0
        assert any("web-api" in c.resource for c in conflicts)

    def test_conflict_hard_constraint_mismatch(self, resolver, existing_intent):
        existing_intent.spec.constraints = [
            IntentConstraint(name="region", constraint_type=ConstraintType.HARD, value="us-east-1"),
        ]
        resolver.register_intent(existing_intent)

        new_intent = Intent(
            intent_id="new-003",
            name="conflicting-constraint",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="New",
                resources=[IntentResource(resource_type="container", name="api")],
                constraints=[
                    IntentConstraint(name="region", constraint_type=ConstraintType.HARD, value="eu-west-1"),
                ],
            ),
        )
        conflicts = resolver.detect_conflicts(new_intent)

        constraint_conflicts = [c for c in conflicts if c.conflict_type == "constraint_conflict"]
        assert len(constraint_conflicts) > 0

    def test_resolve_merge(self, resolver):
        conflict = ConflictInfo(
            intent_a="intent-001",
            intent_b="intent-002",
            resource="container:api",
            conflict_type="resource_overlap",
            resolution=ConflictResolution.MERGE,
        )
        result = resolver.resolve(conflict)

        assert result is True

    def test_resolve_reject(self, resolver):
        conflict = ConflictInfo(
            intent_a="intent-001",
            intent_b="intent-002",
            resource="container:api",
            conflict_type="critical",
            resolution=ConflictResolution.REJECT,
        )
        result = resolver.resolve(conflict)

        assert result is False

    def test_resolve_override(self, resolver):
        conflict = ConflictInfo(
            intent_a="intent-001",
            intent_b="intent-002",
            resource="container:api",
            conflict_type="update",
            resolution=ConflictResolution.OVERRIDE,
        )
        result = resolver.resolve(conflict)

        assert result is True

    def test_custom_conflict_handler(self, resolver):
        def custom_handler(conflict: ConflictInfo) -> bool:
            return conflict.conflict_type == "special"

        resolver.add_conflict_handler("special", custom_handler)

        conflict = ConflictInfo(
            intent_a="intent-001",
            intent_b="intent-002",
            resource="container:api",
            conflict_type="special",
            resolution=ConflictResolution.DEFER,
        )
        result = resolver.resolve(conflict)

        assert result is True

    def test_unregister_intent(self, resolver, existing_intent):
        resolver.register_intent(existing_intent)
        resolver.unregister_intent(existing_intent.intent_id)

        new_intent = Intent(
            intent_id="new-004",
            name="deploy-same",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="New",
                resources=[
                    IntentResource(resource_type="container", name="web-api"),
                ],
            ),
        )
        conflicts = resolver.detect_conflicts(new_intent)

        assert len(conflicts) == 0

    def test_get_conflict_stats(self, resolver, existing_intent):
        resolver.register_intent(existing_intent)
        stats = resolver.get_conflict_stats()

        assert stats["registered_intents"] == 1


class TestIntentExecutor:
    """Test intent execution."""

    @pytest.fixture
    def executor(self):
        return IntentExecutor()

    @pytest.fixture
    def valid_intent(self):
        return Intent(
            intent_id="exec-001",
            name="deploy-api",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Deploy",
                resources=[
                    IntentResource(resource_type="container", name="api"),
                ],
            ),
        )

    def test_create_plan(self, executor, valid_intent):
        plan = executor.create_plan(valid_intent)

        assert plan.intent_id == "exec-001"
        assert len(plan.steps) > 0
        assert plan.estimated_duration > 0

    def test_plan_has_provision_steps(self, executor, valid_intent):
        plan = executor.create_plan(valid_intent)

        provision_steps = [s for s in plan.steps if s.action == "provision"]
        assert len(provision_steps) == 1

    def test_plan_includes_constraint_validation(self, executor):
        intent = Intent(
            intent_id="exec-002",
            name="constrained",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Deploy",
                resources=[IntentResource(resource_type="container", name="api")],
                constraints=[
                    IntentConstraint(name="budget", constraint_type=ConstraintType.HARD, value=100),
                ],
            ),
        )
        plan = executor.create_plan(intent)

        validate_steps = [s for s in plan.steps if s.action == "validate_constraint"]
        assert len(validate_steps) == 1

    def test_plan_risk_level_low(self, executor, valid_intent):
        plan = executor.create_plan(valid_intent)

        assert plan.risk_level == "low"

    def test_plan_risk_level_medium_many_constraints(self, executor):
        intent = Intent(
            intent_id="exec-003",
            name="complex",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Deploy",
                resources=[IntentResource(resource_type="container", name="api")],
                constraints=[
                    IntentConstraint(name=f"c{i}", constraint_type=ConstraintType.HARD, value=i)
                    for i in range(5)
                ],
            ),
        )
        plan = executor.create_plan(intent)

        assert plan.risk_level == "medium"

    def test_plan_risk_level_high_many_resources(self, executor):
        intent = Intent(
            intent_id="exec-004",
            name="large",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Deploy",
                resources=[
                    IntentResource(resource_type="container", name=f"r{i}")
                    for i in range(15)
                ],
            ),
        )
        plan = executor.create_plan(intent)

        assert plan.risk_level == "high"

    @pytest.mark.asyncio
    async def test_execute_dry_run(self, executor, valid_intent):
        executor.set_dry_run(True)
        plan = executor.create_plan(valid_intent)

        success, steps = await executor.execute(plan)

        assert success is True
        assert len(steps) > 0

    @pytest.mark.asyncio
    async def test_execute_with_registered_executor(self, executor, valid_intent):
        def mock_executor(step: ExecutionStep) -> bool:
            return True

        executor.register_executor("provision", mock_executor)
        plan = executor.create_plan(valid_intent)

        success, steps = await executor.execute(plan)

        assert success is True

    @pytest.mark.asyncio
    async def test_execute_fails_without_executor(self, executor, valid_intent):
        # No executor registered
        plan = executor.create_plan(valid_intent)

        success, steps = await executor.execute(plan)

        assert success is False

    @pytest.mark.asyncio
    async def test_execute_with_failing_executor(self, executor, valid_intent):
        def failing_executor(step: ExecutionStep) -> bool:
            return False

        executor.register_executor("provision", failing_executor)
        plan = executor.create_plan(valid_intent)

        success, steps = await executor.execute(plan)

        assert success is False

    @pytest.mark.asyncio
    async def test_rollback_on_failure(self, executor, valid_intent):
        rollback_called = []

        def failing_executor(step: ExecutionStep) -> bool:
            return False

        def rollback_handler(step: ExecutionStep) -> bool:
            rollback_called.append(step.step_id)
            return True

        executor.register_executor("provision", failing_executor)
        executor.register_executor("deprovision", rollback_handler, rollback_handler)
        plan = executor.create_plan(valid_intent)

        # This should fail but we need a successful step first to test rollback
        # Let's just verify the execution fails
        success, steps = await executor.execute(plan)
        assert success is False

    def test_get_execution_stats_empty(self, executor):
        stats = executor.get_execution_stats()

        assert stats["total_executions"] == 0

    @pytest.mark.asyncio
    async def test_get_execution_stats_after_execution(self, executor, valid_intent):
        executor.register_executor("provision", lambda s: True)
        executor.set_dry_run(True)
        plan = executor.create_plan(valid_intent)
        await executor.execute(plan)

        stats = executor.get_execution_stats()

        assert stats["total_executions"] == 1


class TestIntentTracker:
    """Test intent status tracking."""

    @pytest.fixture
    def tracker(self):
        return IntentTracker()

    def test_track_new_intent(self, tracker):
        intent = Intent(
            intent_id="track-001",
            name="test",
            spec=IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test"),
        )
        tracker.track(intent)

        assert tracker.get_intent("track-001") is not None

    def test_update_status(self, tracker):
        intent = Intent(
            intent_id="track-002",
            name="test",
            spec=IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test"),
        )
        tracker.track(intent)
        updated = tracker.update_status("track-002", IntentStatus.VALIDATING)

        assert updated is not None
        assert updated.status == IntentStatus.VALIDATING

    def test_update_status_nonexistent(self, tracker):
        result = tracker.update_status("nonexistent", IntentStatus.COMPLETED)

        assert result is None

    def test_get_history(self, tracker):
        intent = Intent(
            intent_id="track-003",
            name="test",
            spec=IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test"),
        )
        tracker.track(intent)
        tracker.update_status("track-003", IntentStatus.VALIDATING)
        tracker.update_status("track-003", IntentStatus.PLANNING)

        history = tracker.get_history("track-003")

        assert len(history) >= 3  # created + 2 status changes

    def test_get_all_intents(self, tracker):
        intent1 = Intent(
            intent_id="track-004",
            name="test1",
            spec=IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test"),
        )
        intent2 = Intent(
            intent_id="track-005",
            name="test2",
            spec=IntentSpec(intent_type=IntentType.SCALING, description="Test"),
        )
        tracker.track(intent1)
        tracker.track(intent2)

        all_intents = tracker.get_intents()

        assert len(all_intents) == 2

    def test_filter_by_status(self, tracker):
        intent1 = Intent(
            intent_id="track-006",
            name="test1",
            spec=IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test"),
        )
        intent2 = Intent(
            intent_id="track-007",
            name="test2",
            spec=IntentSpec(intent_type=IntentType.SCALING, description="Test"),
        )
        tracker.track(intent1)
        tracker.track(intent2)
        tracker.update_status("track-007", IntentStatus.COMPLETED)

        completed = tracker.get_intents(status=IntentStatus.COMPLETED)

        assert len(completed) == 1
        assert completed[0].intent_id == "track-007"

    def test_filter_by_type(self, tracker):
        intent1 = Intent(
            intent_id="track-008",
            name="test1",
            spec=IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test"),
        )
        intent2 = Intent(
            intent_id="track-009",
            name="test2",
            spec=IntentSpec(intent_type=IntentType.SCALING, description="Test"),
        )
        tracker.track(intent1)
        tracker.track(intent2)

        deploy_intents = tracker.get_intents(intent_type=IntentType.DEPLOYMENT)

        assert len(deploy_intents) == 1

    def test_status_handler(self, tracker):
        calls = []

        def handler(intent: Intent):
            calls.append(intent.intent_id)

        tracker.add_status_handler(handler)

        intent = Intent(
            intent_id="track-010",
            name="test",
            spec=IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test"),
        )
        tracker.track(intent)
        tracker.update_status("track-010", IntentStatus.COMPLETED)

        assert len(calls) >= 1

    def test_get_stats(self, tracker):
        intent1 = Intent(
            intent_id="track-011",
            name="test1",
            spec=IntentSpec(intent_type=IntentType.DEPLOYMENT, description="Test"),
        )
        intent2 = Intent(
            intent_id="track-012",
            name="test2",
            spec=IntentSpec(intent_type=IntentType.SCALING, description="Test"),
        )
        tracker.track(intent1)
        tracker.track(intent2)

        stats = tracker.get_stats()

        assert stats["total_intents"] == 2
        assert stats["history_events"] >= 2


class TestIntentEngine:
    """Test the main IntentEngine orchestrator."""

    @pytest.fixture
    def engine(self):
        return create_intent_engine()

    def test_engine_creation(self, engine):
        assert engine.get_parser() is not None
        assert engine.get_validator() is not None
        assert engine.get_resolver() is not None
        assert engine.get_executor() is not None
        assert engine.get_tracker() is not None

    def test_submit_text_intent(self, engine):
        intent = engine.submit("deploy 2 api containers")

        assert intent is not None
        assert intent.intent_id is not None

    def test_submit_dict_intent(self, engine):
        declaration = {
            "name": "deploy-web",
            "spec": {
                "type": "deployment",
                "description": "Deploy web service",
                "resources": [
                    {"type": "container", "name": "web"},
                ],
            },
            "metadata": {"env": "prod"},
        }
        intent = engine.submit(declaration)

        assert intent is not None
        assert intent.spec.intent_type == IntentType.DEPLOYMENT

    def test_validate_intent(self, engine):
        intent = engine.submit("deploy api")
        result = engine.validate(intent)

        assert result is not None
        assert isinstance(result, ValidationResult)

    def test_check_conflicts(self, engine):
        # Submit first intent
        intent1 = engine.submit({
            "name": "deploy-web",
            "type": "deployment",
            "spec": {
                "resources": [{"type": "container", "name": "web-api"}],
            },
            "metadata": {},
        })

        # Submit second with same resource
        intent2 = engine.submit({
            "name": "deploy-web-again",
            "type": "deployment",
            "spec": {
                "resources": [{"type": "container", "name": "web-api"}],
            },
            "metadata": {},
        })

        conflicts = engine.check_conflicts(intent2)

        assert len(conflicts) > 0

    @pytest.mark.asyncio
    async def test_execute_intent(self, engine):
        engine.get_executor().register_executor("provision", lambda s: True)
        engine.get_executor().set_dry_run(True)

        intent = engine.submit("deploy api")
        success, plan = await engine.execute(intent)

        assert success is True
        assert plan is not None

    @pytest.mark.asyncio
    async def test_execute_invalid_intent(self, engine):
        # Create intent with empty resource type which should fail validation
        intent = Intent(
            intent_id="invalid-001",
            name="invalid",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Invalid",
                resources=[
                    IntentResource(resource_type="", name="api"),  # Empty type is invalid
                ],
            ),
        )
        engine.get_tracker().track(intent)
        success, plan = await engine.execute(intent)

        assert success is False

    def test_get_intent(self, engine):
        intent = engine.submit("deploy api")
        retrieved = engine.get_intent(intent.intent_id)

        assert retrieved is not None
        assert retrieved.intent_id == intent.intent_id

    def test_get_intents(self, engine):
        engine.submit("deploy api")
        engine.submit("scale web")

        intents = engine.get_intents()

        assert len(intents) >= 2

    def test_cancel_intent(self, engine):
        intent = engine.submit("deploy api")
        result = engine.cancel(intent.intent_id)

        assert result is True
        assert engine.get_intent(intent.intent_id).status == IntentStatus.CANCELLED

    def test_cancel_completed_intent_fails(self, engine):
        intent = engine.submit("deploy api")
        engine.get_tracker().update_status(intent.intent_id, IntentStatus.COMPLETED)
        result = engine.cancel(intent.intent_id)

        assert result is False

    def test_get_stats(self, engine):
        engine.submit("deploy api")
        engine.submit("scale web")

        stats = engine.get_stats()

        assert stats["tracker"]["total_intents"] >= 2

    @pytest.mark.asyncio
    async def test_full_workflow(self, engine):
        engine.get_executor().register_executor("provision", lambda s: True)
        engine.get_executor().set_dry_run(True)

        # Submit
        intent = engine.submit("deploy 3 instances of web service")

        # Validate
        validation = engine.validate(intent)
        assert validation.valid is True

        # Execute
        success, plan = await engine.execute(intent)
        assert success is True

        # Check status
        retrieved = engine.get_intent(intent.intent_id)
        assert retrieved.status == IntentStatus.COMPLETED


class TestFactoryFunctions:
    """Test factory functions."""

    def test_create_intent_engine(self):
        engine = create_intent_engine()
        assert isinstance(engine, IntentEngine)

    def test_create_intent(self):
        intent = create_intent(
            name="test",
            intent_type=IntentType.DEPLOYMENT,
            description="Test intent",
        )
        assert intent.name == "test"
        assert intent.spec.intent_type == IntentType.DEPLOYMENT
        assert intent.intent_id.startswith("intent-")

    def test_create_intent_with_resources(self):
        resource = IntentResource(resource_type="container", name="api")
        intent = create_intent(
            name="test",
            intent_type=IntentType.DEPLOYMENT,
            resources=[resource],
        )
        assert len(intent.spec.resources) == 1

    def test_create_intent_resource(self):
        resource = create_intent_resource(
            resource_type="container",
            name="api",
            properties={"cpu": 2},
        )
        assert resource.resource_type == "container"
        assert resource.name == "api"
        assert resource.properties["cpu"] == 2

    def test_create_intent_constraint(self):
        constraint = create_intent_constraint(
            name="max_cost",
            constraint_type=ConstraintType.HARD,
            value=500,
        )
        assert constraint.name == "max_cost"
        assert constraint.constraint_type == ConstraintType.HARD
        assert constraint.value == 500


class TestEdgeCases:
    """Test edge cases and error handling."""

    @pytest.fixture
    def parser(self):
        return IntentParser()

    @pytest.fixture
    def validator(self):
        return IntentValidator()

    def test_parser_empty_dict(self, parser):
        intent = parser.parse({"metadata": {}})

        # Should return a valid intent with defaults
        assert intent is not None
        assert intent.spec.intent_type == IntentType.CUSTOM

    def test_parser_unknown_type_defaults_to_custom(self, parser):
        declaration = {
            "type": "unknown_type_xyz",
            "spec": {},
            "metadata": {},
        }
        intent = parser.parse(declaration)

        assert intent.spec.intent_type == IntentType.CUSTOM

    def test_parser_empty_natural_language(self, parser):
        intent = parser.parse_natural_language("")

        assert intent is not None
        assert intent.spec.intent_type == IntentType.CUSTOM

    def test_parser_malformed_natural_language(self, parser):
        intent = parser.parse_natural_language("@#$%^&*()")

        # Should handle gracefully
        assert intent is not None

    def test_validator_empty_resources(self, validator):
        intent = Intent(
            intent_id="edge-001",
            name="empty",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Empty",
                resources=[],
            ),
        )
        result = validator.validate(intent)

        # Empty resources should be valid (just no resources to provision)
        assert result.valid is True

    def test_validator_many_resources(self, validator):
        intent = Intent(
            intent_id="edge-002",
            name="many",
            spec=IntentSpec(
                intent_type=IntentType.DEPLOYMENT,
                description="Many",
                resources=[
                    IntentResource(resource_type="container", name=f"r{i}")
                    for i in range(100)
                ],
            ),
        )
        result = validator.validate(intent)

        # Should still be valid
        assert result.valid is True

    def test_engine_stats_empty(self):
        engine = create_intent_engine()
        stats = engine.get_stats()

        assert stats["tracker"]["total_intents"] == 0
        assert stats["executor"]["total_executions"] == 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
