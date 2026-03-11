"""
Intent-Based Infrastructure - Phase 58

Configure infrastructure through high-level intent declarations.
"""

import asyncio
import re
import time
import uuid
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class IntentStatus(Enum):
    """Status of an intent."""
    PENDING = "pending"
    PARSING = "parsing"
    VALIDATING = "validating"
    PLANNING = "planning"
    EXECUTING = "executing"
    COMPLETED = "completed"
    FAILED = "failed"
    CONFLICT = "conflict"
    ROLLED_BACK = "rolled_back"
    CANCELLED = "cancelled"


class IntentType(Enum):
    """Types of intents."""
    DEPLOYMENT = "deployment"
    SCALING = "scaling"
    NETWORKING = "networking"
    SECURITY = "security"
    STORAGE = "storage"
    PERFORMANCE = "performance"
    AVAILABILITY = "availability"
    COST = "cost"
    CUSTOM = "custom"


class ConstraintType(Enum):
    """Types of constraints."""
    HARD = "hard"          # Must be satisfied
    SOFT = "soft"          # Should be satisfied if possible
    PREFERENCE = "preference"  # Nice to have


class ValidationSeverity(Enum):
    """Severity of validation issues."""
    INFO = "info"
    WARNING = "warning"
    ERROR = "error"
    CRITICAL = "critical"


class ConflictResolution(Enum):
    """How to resolve conflicts."""
    OVERRIDE = "override"
    MERGE = "merge"
    REJECT = "reject"
    DEFER = "defer"
    ESCALATE = "escalate"


@dataclass
class IntentConstraint:
    """A constraint on an intent."""
    name: str
    constraint_type: ConstraintType
    value: Any
    description: str = ""
    priority: int = 0


@dataclass
class IntentResource:
    """Resource specification in an intent."""
    resource_type: str
    name: str
    properties: dict[str, Any] = field(default_factory=dict)
    dependencies: list[str] = field(default_factory=list)


@dataclass
class IntentSpec:
    """Specification of an intent."""
    intent_type: IntentType
    description: str
    resources: list[IntentResource] = field(default_factory=list)
    constraints: list[IntentConstraint] = field(default_factory=list)
    labels: dict[str, str] = field(default_factory=dict)
    annotations: dict[str, str] = field(default_factory=dict)


@dataclass
class Intent:
    """A high-level infrastructure intent."""
    intent_id: str
    name: str
    spec: IntentSpec
    status: IntentStatus = IntentStatus.PENDING
    created_at: float = field(default_factory=time.time)
    updated_at: float = field(default_factory=time.time)
    owner: str = ""
    version: int = 1
    parent_intent: str | None = None
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class ValidationIssue:
    """An issue found during validation."""
    severity: ValidationSeverity
    message: str
    location: str = ""
    suggestion: str = ""


@dataclass
class ValidationResult:
    """Result of intent validation."""
    valid: bool
    issues: list[ValidationIssue] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)
    suggestions: list[str] = field(default_factory=list)


@dataclass
class ConflictInfo:
    """Information about an intent conflict."""
    intent_a: str
    intent_b: str
    resource: str
    conflict_type: str
    resolution: ConflictResolution
    details: str = ""


@dataclass
class ExecutionStep:
    """A step in intent execution."""
    step_id: str
    description: str
    action: str
    target: str
    status: IntentStatus = IntentStatus.PENDING
    started_at: float | None = None
    completed_at: float | None = None
    error: str | None = None
    rollback_action: str | None = None


@dataclass
class ExecutionPlan:
    """Plan for executing an intent."""
    plan_id: str
    intent_id: str
    steps: list[ExecutionStep] = field(default_factory=list)
    estimated_duration: float = 0.0
    risk_level: str = "low"
    dependencies: list[str] = field(default_factory=list)


class IntentParser:
    """Parses intent declarations."""

    def __init__(self):
        self._parsers: dict[IntentType, Callable[[dict[str, Any]], IntentSpec]] = {}
        self._default_parser = self._parse_generic

    def register_parser(
        self,
        intent_type: IntentType,
        parser: Callable[[dict[str, Any]], IntentSpec],
    ) -> None:
        """Register a parser for an intent type."""
        self._parsers[intent_type] = parser

    def parse(self, declaration: dict[str, Any]) -> Intent:
        """Parse an intent declaration."""
        intent_id = declaration.get("intent_id", f"intent-{uuid.uuid4().hex[:8]}")
        name = declaration.get("name", intent_id)
        intent_type_str = declaration.get("type", "custom")

        try:
            intent_type = IntentType(intent_type_str.lower())
        except ValueError:
            intent_type = IntentType.CUSTOM

        # Get parser
        parser = self._parsers.get(intent_type, self._default_parser)
        spec = parser(declaration.get("spec", declaration))

        return Intent(
            intent_id=intent_id,
            name=name,
            spec=spec,
            owner=declaration.get("owner", ""),
            metadata=declaration.get("metadata", {}),
        )

    def _parse_generic(self, spec: dict[str, Any]) -> IntentSpec:
        """Generic parser for any intent."""
        intent_type_str = spec.get("type", "custom")
        try:
            intent_type = IntentType(intent_type_str.lower())
        except ValueError:
            intent_type = IntentType.CUSTOM

        resources = []
        for res in spec.get("resources", []):
            resources.append(IntentResource(
                resource_type=res.get("type", "unknown"),
                name=res.get("name", "unnamed"),
                properties=res.get("properties", {}),
                dependencies=res.get("dependencies", []),
            ))

        constraints = []
        for con in spec.get("constraints", []):
            constraint_type_str = con.get("type", "soft")
            try:
                constraint_type = ConstraintType(constraint_type_str.lower())
            except ValueError:
                constraint_type = ConstraintType.SOFT

            constraints.append(IntentConstraint(
                name=con.get("name", "unnamed"),
                constraint_type=constraint_type,
                value=con.get("value"),
                description=con.get("description", ""),
                priority=con.get("priority", 0),
            ))

        return IntentSpec(
            intent_type=intent_type,
            description=spec.get("description", ""),
            resources=resources,
            constraints=constraints,
            labels=spec.get("labels", {}),
            annotations=spec.get("annotations", {}),
        )

    def parse_natural_language(self, text: str) -> Intent:
        """Parse natural language intent declaration."""
        # Simple keyword-based parsing
        intent_type = self._detect_intent_type(text)
        resources = self._extract_resources(text)
        constraints = self._extract_constraints(text)

        spec = IntentSpec(
            intent_type=intent_type,
            description=text,
            resources=resources,
            constraints=constraints,
        )

        return Intent(
            intent_id=f"intent-{uuid.uuid4().hex[:8]}",
            name=text[:50],  # First 50 chars as name
            spec=spec,
        )

    def _detect_intent_type(self, text: str) -> IntentType:
        """Detect intent type from text."""
        text_lower = text.lower()

        if any(kw in text_lower for kw in ["deploy", "run", "start", "launch"]):
            return IntentType.DEPLOYMENT
        elif any(kw in text_lower for kw in ["scale", "replicas", "instances"]):
            return IntentType.SCALING
        elif any(kw in text_lower for kw in ["network", "connect", "route", "firewall"]):
            return IntentType.NETWORKING
        elif any(kw in text_lower for kw in ["secure", "encrypt", "auth", "permission"]):
            return IntentType.SECURITY
        elif any(kw in text_lower for kw in ["store", "disk", "volume", "backup"]):
            return IntentType.STORAGE
        elif any(kw in text_lower for kw in ["fast", "latency", "performance", "optimize"]):
            return IntentType.PERFORMANCE
        elif any(kw in text_lower for kw in ["available", "ha", "redundant", "failover"]):
            return IntentType.AVAILABILITY
        elif any(kw in text_lower for kw in ["cost", "budget", "cheap", "save"]):
            return IntentType.COST

        return IntentType.CUSTOM

    def _extract_resources(self, text: str) -> list[IntentResource]:
        """Extract resource specifications from text."""
        resources = []

        # Look for common patterns
        patterns = [
            (r"(\d+)\s*(?:instances?|replicas?|pods?|containers?)", "compute"),
            (r"(\d+)\s*(?:gb|gib)\s*(?:memory|ram)", "memory"),
            (r"(\d+)\s*(?:cpu|cores?)", "cpu"),
            (r"(\d+)\s*(?:gb|gib)\s*(?:storage|disk)", "storage"),
        ]

        for pattern, resource_type in patterns:
            matches = re.findall(pattern, text.lower())
            for match in matches:
                resources.append(IntentResource(
                    resource_type=resource_type,
                    name=f"{resource_type}-{len(resources)}",
                    properties={"amount": int(match)},
                ))

        return resources

    def _extract_constraints(self, text: str) -> list[IntentConstraint]:
        """Extract constraints from text."""
        constraints = []

        # Look for constraint patterns
        if "must" in text.lower():
            constraints.append(IntentConstraint(
                name="hard_requirement",
                constraint_type=ConstraintType.HARD,
                value=True,
                description="Extracted from 'must' keyword",
            ))

        if "should" in text.lower() or "preferably" in text.lower():
            constraints.append(IntentConstraint(
                name="soft_requirement",
                constraint_type=ConstraintType.SOFT,
                value=True,
                description="Extracted from 'should' keyword",
            ))

        # Extract specific constraints
        latency_match = re.search(r"latency\s*(?:<|under|below)\s*(\d+)", text.lower())
        if latency_match:
            constraints.append(IntentConstraint(
                name="max_latency_ms",
                constraint_type=ConstraintType.HARD,
                value=int(latency_match.group(1)),
                description="Maximum latency constraint",
            ))

        cost_match = re.search(r"(?:budget|cost)\s*(?:<|under|below)\s*\$?(\d+)", text.lower())
        if cost_match:
            constraints.append(IntentConstraint(
                name="max_cost",
                constraint_type=ConstraintType.HARD,
                value=float(cost_match.group(1)),
                description="Maximum cost constraint",
            ))

        return constraints


class IntentValidator:
    """Validates intents for feasibility and correctness."""

    def __init__(self):
        self._validators: list[Callable[[Intent], ValidationResult]] = []
        self._resource_limits: dict[str, tuple[float, float]] = {}
        self._quota_checker: Callable[[str, str, float], bool] | None = None

    def add_validator(
        self,
        validator: Callable[[Intent], ValidationResult],
    ) -> None:
        """Add a custom validator."""
        self._validators.append(validator)

    def set_resource_limit(
        self,
        resource_type: str,
        min_value: float,
        max_value: float,
    ) -> None:
        """Set limits for a resource type."""
        self._resource_limits[resource_type] = (min_value, max_value)

    def set_quota_checker(
        self,
        checker: Callable[[str, str, float], bool],
    ) -> None:
        """Set quota checking function."""
        self._quota_checker = checker

    def validate(self, intent: Intent) -> ValidationResult:
        """Validate an intent."""
        issues = []
        warnings = []
        suggestions = []

        # Validate resources
        for resource in intent.spec.resources:
            resource_issues = self._validate_resource(resource)
            issues.extend(resource_issues)

        # Validate constraints
        for constraint in intent.spec.constraints:
            constraint_issues = self._validate_constraint(constraint)
            issues.extend(constraint_issues)

        # Check for conflicting constraints
        conflict_issues = self._check_constraint_conflicts(intent.spec.constraints)
        issues.extend(conflict_issues)

        # Run custom validators
        for validator in self._validators:
            try:
                result = validator(intent)
                issues.extend([
                    ValidationIssue(
                        severity=ValidationSeverity.ERROR if not result.valid else ValidationSeverity.INFO,
                        message=issue,
                    ) for issue in result.issues
                ])
                warnings.extend(result.warnings)
                suggestions.extend(result.suggestions)
            except Exception as e:
                issues.append(ValidationIssue(
                    severity=ValidationSeverity.WARNING,
                    message=f"Validator error: {str(e)}",
                ))

        # Determine if valid
        has_errors = any(
            issue.severity in (ValidationSeverity.ERROR, ValidationSeverity.CRITICAL)
            for issue in issues
        )

        return ValidationResult(
            valid=not has_errors,
            issues=issues,
            warnings=warnings,
            suggestions=suggestions,
        )

    def _validate_resource(self, resource: IntentResource) -> list[ValidationIssue]:
        """Validate a resource specification."""
        issues = []

        # Check resource type
        if not resource.resource_type:
            issues.append(ValidationIssue(
                severity=ValidationSeverity.ERROR,
                message="Resource type is required",
                location=f"resources.{resource.name}",
            ))

        # Check limits
        if resource.resource_type in self._resource_limits:
            min_val, max_val = self._resource_limits[resource.resource_type]
            amount = resource.properties.get("amount", 0)

            if amount < min_val:
                issues.append(ValidationIssue(
                    severity=ValidationSeverity.ERROR,
                    message=f"Resource amount {amount} below minimum {min_val}",
                    location=f"resources.{resource.name}",
                    suggestion=f"Increase to at least {min_val}",
                ))
            elif amount > max_val:
                issues.append(ValidationIssue(
                    severity=ValidationSeverity.WARNING,
                    message=f"Resource amount {amount} above recommended maximum {max_val}",
                    location=f"resources.{resource.name}",
                    suggestion=f"Consider reducing to {max_val}",
                ))

        return issues

    def _validate_constraint(self, constraint: IntentConstraint) -> list[ValidationIssue]:
        """Validate a constraint."""
        issues = []

        if not constraint.name:
            issues.append(ValidationIssue(
                severity=ValidationSeverity.ERROR,
                message="Constraint name is required",
            ))

        if constraint.value is None:
            issues.append(ValidationIssue(
                severity=ValidationSeverity.WARNING,
                message=f"Constraint '{constraint.name}' has no value",
            ))

        return issues

    def _check_constraint_conflicts(
        self,
        constraints: list[IntentConstraint],
    ) -> list[ValidationIssue]:
        """Check for conflicting constraints."""
        issues = []

        # Group constraints by name
        by_name: dict[str, list[IntentConstraint]] = defaultdict(list)
        for constraint in constraints:
            by_name[constraint.name].append(constraint)

        # Check for conflicts
        for name, group in by_name.items():
            if len(group) > 1:
                values = [c.value for c in group]
                if len(set(str(v) for v in values)) > 1:
                    issues.append(ValidationIssue(
                        severity=ValidationSeverity.WARNING,
                        message=f"Multiple constraints with name '{name}' have different values",
                        suggestion="Consider consolidating constraints",
                    ))

        return issues

    def get_validation_stats(self) -> dict[str, Any]:
        """Get validation statistics."""
        return {
            "validators": len(self._validators),
            "resource_types_with_limits": len(self._resource_limits),
        }


class ConflictResolver:
    """Resolves conflicts between intents."""

    def __init__(self):
        self._intents: dict[str, Intent] = {}
        self._resource_allocations: dict[str, set[str]] = {}
        self._conflict_handlers: dict[str, Callable[[ConflictInfo], bool]] = {}
        self._resolution_history: list[ConflictInfo] = []

    def register_intent(self, intent: Intent) -> None:
        """Register an intent for conflict tracking."""
        self._intents[intent.intent_id] = intent

    def unregister_intent(self, intent_id: str) -> None:
        """Unregister an intent."""
        self._intents.pop(intent_id, None)

    def add_conflict_handler(
        self,
        conflict_type: str,
        handler: Callable[[ConflictInfo], bool],
    ) -> None:
        """Add a handler for a conflict type."""
        self._conflict_handlers[conflict_type] = handler

    def detect_conflicts(self, intent: Intent) -> list[ConflictInfo]:
        """Detect conflicts with existing intents."""
        conflicts = []

        for resource in intent.spec.resources:
            resource_key = f"{resource.resource_type}:{resource.name}"

            # Check resource conflicts
            for other_id, other_intent in self._intents.items():
                if other_id == intent.intent_id:
                    continue

                for other_resource in other_intent.spec.resources:
                    other_key = f"{other_resource.resource_type}:{other_resource.name}"

                    if resource_key == other_key:
                        conflicts.append(ConflictInfo(
                            intent_a=intent.intent_id,
                            intent_b=other_id,
                            resource=resource_key,
                            conflict_type="resource_overlap",
                            resolution=ConflictResolution.MERGE,
                            details=f"Both intents reference {resource_key}",
                        ))

            # Check constraint conflicts
            for constraint in intent.spec.constraints:
                for other_id, other_intent in self._intents.items():
                    if other_id == intent.intent_id:
                        continue

                    for other_constraint in other_intent.spec.constraints:
                        if constraint.name == other_constraint.name:
                            if constraint.value != other_constraint.value:
                                if constraint.constraint_type == ConstraintType.HARD:
                                    conflicts.append(ConflictInfo(
                                        intent_a=intent.intent_id,
                                        intent_b=other_id,
                                        resource=constraint.name,
                                        conflict_type="constraint_conflict",
                                        resolution=ConflictResolution.REJECT,
                                        details=f"Conflicting values for {constraint.name}",
                                    ))

        return conflicts

    def resolve(self, conflict: ConflictInfo) -> bool:
        """Resolve a conflict."""
        handler = self._conflict_handlers.get(conflict.conflict_type)

        if handler:
            try:
                result = handler(conflict)
                self._resolution_history.append(conflict)
                return result
            except Exception:
                return False

        # Default resolution based on type
        if conflict.resolution == ConflictResolution.MERGE:
            return True  # Allow merge
        elif conflict.resolution == ConflictResolution.REJECT:
            return False  # Reject new intent
        elif conflict.resolution == ConflictResolution.OVERRIDE:
            return True  # Allow override

        return False  # Default to reject

    def get_conflict_stats(self) -> dict[str, Any]:
        """Get conflict statistics."""
        return {
            "registered_intents": len(self._intents),
            "resolutions": len(self._resolution_history),
            "conflict_types": list(self._conflict_handlers.keys()),
        }


class IntentExecutor:
    """Executes intents to realize infrastructure state."""

    def __init__(self):
        self._executors: dict[str, Callable[[ExecutionStep], bool]] = {}
        self._rollback_handlers: dict[str, Callable[[ExecutionStep], bool]] = {}
        self._execution_history: list[dict[str, Any]] = []
        self._dry_run_mode: bool = False

    def register_executor(
        self,
        action_type: str,
        executor: Callable[[ExecutionStep], bool],
        rollback_handler: Callable[[ExecutionStep], bool] | None = None,
    ) -> None:
        """Register an executor for an action type."""
        self._executors[action_type] = executor
        if rollback_handler:
            self._rollback_handlers[action_type] = rollback_handler

    def set_dry_run(self, enabled: bool) -> None:
        """Enable/disable dry run mode."""
        self._dry_run_mode = enabled

    def create_plan(self, intent: Intent) -> ExecutionPlan:
        """Create an execution plan for an intent."""
        plan_id = f"plan-{uuid.uuid4().hex[:8]}"
        steps = []

        # Create steps for each resource
        for i, resource in enumerate(intent.spec.resources):
            steps.append(ExecutionStep(
                step_id=f"step-{plan_id}-{i}",
                description=f"Provision {resource.resource_type}: {resource.name}",
                action="provision",
                target=f"{resource.resource_type}/{resource.name}",
                rollback_action="deprovision",
            ))

        # Add constraint validation steps
        for i, constraint in enumerate(intent.spec.constraints):
            steps.append(ExecutionStep(
                step_id=f"step-{plan_id}-constraint-{i}",
                description=f"Validate constraint: {constraint.name}",
                action="validate_constraint",
                target=constraint.name,
            ))

        # Calculate estimated duration
        estimated_duration = len(steps) * 10  # 10 seconds per step

        # Determine risk level
        risk_level = "low"
        hard_constraints = [c for c in intent.spec.constraints if c.constraint_type == ConstraintType.HARD]
        if len(hard_constraints) > 3:
            risk_level = "medium"
        if len(intent.spec.resources) > 10:
            risk_level = "high"

        return ExecutionPlan(
            plan_id=plan_id,
            intent_id=intent.intent_id,
            steps=steps,
            estimated_duration=estimated_duration,
            risk_level=risk_level,
            dependencies=[r.name for r in intent.spec.resources if r.dependencies],
        )

    async def execute(self, plan: ExecutionPlan) -> tuple[bool, list[ExecutionStep]]:
        """Execute an execution plan."""
        completed_steps = []

        for step in plan.steps:
            step.status = IntentStatus.EXECUTING
            step.started_at = time.time()

            if self._dry_run_mode:
                # Dry run - just mark as completed
                step.status = IntentStatus.COMPLETED
                step.completed_at = time.time()
                completed_steps.append(step)
                continue

            # Find executor
            executor = self._executors.get(step.action)
            if not executor:
                step.status = IntentStatus.FAILED
                step.error = f"No executor for action: {step.action}"

                # Rollback
                await self._rollback(completed_steps)
                return False, completed_steps

            # Execute
            try:
                success = await asyncio.get_event_loop().run_in_executor(
                    None, executor, step
                )

                step.completed_at = time.time()

                if success:
                    step.status = IntentStatus.COMPLETED
                    completed_steps.append(step)
                else:
                    step.status = IntentStatus.FAILED
                    step.error = "Executor returned false"

                    # Rollback
                    await self._rollback(completed_steps)
                    return False, completed_steps

            except Exception as e:
                step.status = IntentStatus.FAILED
                step.error = str(e)
                step.completed_at = time.time()

                # Rollback
                await self._rollback(completed_steps)
                return False, completed_steps

        # Record execution
        self._execution_history.append({
            "plan_id": plan.plan_id,
            "intent_id": plan.intent_id,
            "steps_completed": len(completed_steps),
            "success": True,
            "timestamp": time.time(),
        })

        return True, completed_steps

    async def _rollback(self, steps: list[ExecutionStep]) -> None:
        """Rollback completed steps."""
        for step in reversed(steps):
            if step.status != IntentStatus.COMPLETED:
                continue

            rollback_handler = self._rollback_handlers.get(step.rollback_action)
            if rollback_handler:
                try:
                    await asyncio.get_event_loop().run_in_executor(
                        None, rollback_handler, step
                    )
                    step.status = IntentStatus.ROLLED_BACK
                except Exception:
                    pass

    def get_execution_stats(self) -> dict[str, Any]:
        """Get execution statistics."""
        if not self._execution_history:
            return {"total_executions": 0}

        successful = sum(1 for e in self._execution_history if e["success"])
        return {
            "total_executions": len(self._execution_history),
            "successful": successful,
            "failed": len(self._execution_history) - successful,
            "success_rate": successful / len(self._execution_history),
            "registered_executors": len(self._executors),
        }


class IntentTracker:
    """Tracks intent status and history."""

    def __init__(self):
        self._intents: dict[str, Intent] = {}
        self._history: list[dict[str, Any]] = []
        self._status_handlers: list[Callable[[Intent], None]] = []

    def track(self, intent: Intent) -> None:
        """Start tracking an intent."""
        self._intents[intent.intent_id] = intent
        self._record_event(intent, "created")

    def update_status(
        self,
        intent_id: str,
        status: IntentStatus,
        message: str = "",
    ) -> Intent | None:
        """Update intent status."""
        if intent_id not in self._intents:
            return None

        intent = self._intents[intent_id]
        old_status = intent.status
        intent.status = status
        intent.updated_at = time.time()

        self._record_event(intent, f"status_change: {old_status.value} -> {status.value}")

        # Notify handlers
        for handler in self._status_handlers:
            try:
                handler(intent)
            except Exception:
                pass

        return intent

    def get_intent(self, intent_id: str) -> Intent | None:
        """Get an intent by ID."""
        return self._intents.get(intent_id)

    def get_intents(
        self,
        status: IntentStatus | None = None,
        intent_type: IntentType | None = None,
    ) -> list[Intent]:
        """Get intents with optional filtering."""
        intents = list(self._intents.values())

        if status:
            intents = [i for i in intents if i.status == status]
        if intent_type:
            intents = [i for i in intents if i.spec.intent_type == intent_type]

        return intents

    def add_status_handler(self, handler: Callable[[Intent], None]) -> None:
        """Add a handler for status changes."""
        self._status_handlers.append(handler)

    def _record_event(self, intent: Intent, event: str) -> None:
        """Record an event in history."""
        self._history.append({
            "intent_id": intent.intent_id,
            "event": event,
            "status": intent.status.value,
            "timestamp": time.time(),
        })

    def get_history(self, intent_id: str | None = None) -> list[dict[str, Any]]:
        """Get event history."""
        if intent_id:
            return [h for h in self._history if h["intent_id"] == intent_id]
        return self._history

    def get_stats(self) -> dict[str, Any]:
        """Get tracker statistics."""
        by_status = defaultdict(int)
        for intent in self._intents.values():
            by_status[intent.status.value] += 1

        return {
            "total_intents": len(self._intents),
            "by_status": dict(by_status),
            "history_events": len(self._history),
        }


class IntentEngine:
    """Main engine for intent-based infrastructure."""

    def __init__(self):
        self._parser = IntentParser()
        self._validator = IntentValidator()
        self._resolver = ConflictResolver()
        self._executor = IntentExecutor()
        self._tracker = IntentTracker()

    def get_parser(self) -> IntentParser:
        """Get the intent parser."""
        return self._parser

    def get_validator(self) -> IntentValidator:
        """Get the intent validator."""
        return self._validator

    def get_resolver(self) -> ConflictResolver:
        """Get the conflict resolver."""
        return self._resolver

    def get_executor(self) -> IntentExecutor:
        """Get the intent executor."""
        return self._executor

    def get_tracker(self) -> IntentTracker:
        """Get the intent tracker."""
        return self._tracker

    def submit(self, declaration: dict[str, Any] | str) -> Intent:
        """Submit an intent declaration."""
        # Parse
        if isinstance(declaration, str):
            intent = self._parser.parse_natural_language(declaration)
        else:
            intent = self._parser.parse(declaration)

        # Track
        self._tracker.track(intent)
        self._resolver.register_intent(intent)

        return intent

    def validate(self, intent: Intent) -> ValidationResult:
        """Validate an intent."""
        self._tracker.update_status(intent.intent_id, IntentStatus.VALIDATING)
        result = self._validator.validate(intent)

        if result.valid:
            self._tracker.update_status(intent.intent_id, IntentStatus.PENDING)
        else:
            self._tracker.update_status(intent.intent_id, IntentStatus.FAILED)

        return result

    def check_conflicts(self, intent: Intent) -> list[ConflictInfo]:
        """Check for conflicts."""
        return self._resolver.detect_conflicts(intent)

    async def execute(self, intent: Intent, dry_run: bool = False) -> tuple[bool, ExecutionPlan]:
        """Execute an intent."""
        # Validate first
        validation = self.validate(intent)
        if not validation.valid:
            return False, ExecutionPlan(plan_id="invalid", intent_id=intent.intent_id)

        # Check conflicts
        conflicts = self.check_conflicts(intent)
        unresolvable = [c for c in conflicts if not self._resolver.resolve(c)]

        if unresolvable:
            self._tracker.update_status(intent.intent_id, IntentStatus.CONFLICT)
            return False, ExecutionPlan(
                plan_id="conflict",
                intent_id=intent.intent_id,
                risk_level="conflict",
            )

        # Create plan
        plan = self._executor.create_plan(intent)
        self._tracker.update_status(intent.intent_id, IntentStatus.PLANNING)

        # Execute
        self._tracker.update_status(intent.intent_id, IntentStatus.EXECUTING)
        self._executor.set_dry_run(dry_run)

        success, steps = await self._executor.execute(plan)

        if success:
            self._tracker.update_status(intent.intent_id, IntentStatus.COMPLETED)
        else:
            self._tracker.update_status(intent.intent_id, IntentStatus.FAILED)

        return success, plan

    def get_intent(self, intent_id: str) -> Intent | None:
        """Get an intent by ID."""
        return self._tracker.get_intent(intent_id)

    def get_intents(
        self,
        status: IntentStatus | None = None,
        intent_type: IntentType | None = None,
    ) -> list[Intent]:
        """Get intents with optional filtering."""
        return self._tracker.get_intents(status, intent_type)

    def cancel(self, intent_id: str) -> bool:
        """Cancel an intent."""
        intent = self._tracker.get_intent(intent_id)
        if not intent:
            return False

        if intent.status in (IntentStatus.COMPLETED, IntentStatus.FAILED, IntentStatus.CANCELLED):
            return False

        self._tracker.update_status(intent_id, IntentStatus.CANCELLED)
        return True

    def get_stats(self) -> dict[str, Any]:
        """Get engine statistics."""
        return {
            "tracker": self._tracker.get_stats(),
            "validator": self._validator.get_validation_stats(),
            "resolver": self._resolver.get_conflict_stats(),
            "executor": self._executor.get_execution_stats(),
        }


def create_intent_engine() -> IntentEngine:
    """Factory function to create an intent engine."""
    return IntentEngine()


def create_intent(
    name: str,
    intent_type: IntentType,
    description: str = "",
    resources: list[IntentResource] | None = None,
    constraints: list[IntentConstraint] | None = None,
) -> Intent:
    """Factory function to create an intent."""
    spec = IntentSpec(
        intent_type=intent_type,
        description=description,
        resources=resources or [],
        constraints=constraints or [],
    )

    return Intent(
        intent_id=f"intent-{uuid.uuid4().hex[:8]}",
        name=name,
        spec=spec,
    )


def create_intent_resource(
    resource_type: str,
    name: str,
    properties: dict[str, Any] | None = None,
    dependencies: list[str] | None = None,
) -> IntentResource:
    """Factory function to create an intent resource."""
    return IntentResource(
        resource_type=resource_type,
        name=name,
        properties=properties or {},
        dependencies=dependencies or [],
    )


def create_intent_constraint(
    name: str,
    value: Any,
    constraint_type: ConstraintType = ConstraintType.SOFT,
    description: str = "",
) -> IntentConstraint:
    """Factory function to create an intent constraint."""
    return IntentConstraint(
        name=name,
        constraint_type=constraint_type,
        value=value,
        description=description,
    )
