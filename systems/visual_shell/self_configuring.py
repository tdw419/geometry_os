"""
Self-Configuring Mesh - Phase 56

Automatically configure and optimize the mesh without manual intervention.
"""

import hashlib
import json
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class ConfigurationStatus(Enum):
    """Status of a configuration."""
    PENDING = "pending"
    APPLIED = "applied"
    FAILED = "failed"
    ROLLED_BACK = "rolled_back"
    VALIDATING = "validating"
    OPTIMIZING = "optimizing"


class ConfigurationType(Enum):
    """Types of configurations."""
    NETWORK = "network"
    RESOURCE = "resource"
    SECURITY = "security"
    PERFORMANCE = "performance"
    SCALING = "scaling"
    CUSTOM = "custom"


class ConfigSource(Enum):
    """Source of configuration."""
    AUTO = "auto"
    MANUAL = "manual"
    TEMPLATE = "template"
    LEARNED = "learned"
    IMPORTED = "imported"


class ValidationLevel(Enum):
    """Levels of configuration validation."""
    SYNTAX = "syntax"
    SEMANTIC = "semantic"
    INTEGRATION = "integration"
    FULL = "full"


@dataclass
class ConfigurationValue:
    """A single configuration value."""
    key: str
    value: Any
    schema: dict[str, Any] | None = None
    description: str = ""
    sensitive: bool = False
    version: int = 1
    updated_at: float = field(default_factory=time.time)


@dataclass
class ConfigurationChange:
    """A change to configuration."""
    change_id: str
    key: str
    old_value: Any
    new_value: Any
    reason: str
    source: ConfigSource
    timestamp: float = field(default_factory=time.time)
    applied: bool = False


@dataclass
class ConfigurationSet:
    """A set of configurations."""
    set_id: str
    name: str
    config_type: ConfigurationType
    values: dict[str, ConfigurationValue] = field(default_factory=dict)
    status: ConfigurationStatus = ConfigurationStatus.PENDING
    version: int = 1
    created_at: float = field(default_factory=time.time)
    updated_at: float = field(default_factory=time.time)
    metadata: dict[str, Any] = field(default_factory=dict)

    def get_hash(self) -> str:
        """Get hash of current configuration."""
        data = {k: {"value": v.value, "version": v.version}
                for k, v in sorted(self.values.items())}
        return hashlib.sha256(json.dumps(data, sort_keys=True).encode()).hexdigest()[:16]


@dataclass
class ValidationResult:
    """Result of configuration validation."""
    valid: bool
    errors: list[str] = field(default_factory=list)
    warnings: list[str] = field(default_factory=list)
    suggestions: list[str] = field(default_factory=list)


@dataclass
class OptimizationSuggestion:
    """A suggestion for configuration optimization."""
    suggestion_id: str
    key: str
    current_value: Any
    suggested_value: Any
    rationale: str
    impact: str
    confidence: float
    auto_applicable: bool = False


class ConfigSchema:
    """Schema for configuration validation."""

    def __init__(self):
        self._schemas: dict[str, dict[str, Any]] = {}

    def register_schema(self, key: str, schema: dict[str, Any]) -> None:
        """Register a schema for a configuration key."""
        self._schemas[key] = schema

    def validate(self, key: str, value: Any) -> ValidationResult:
        """Validate a value against its schema."""
        errors = []
        warnings = []
        suggestions = []

        if key not in self._schemas:
            return ValidationResult(
                valid=True,
                warnings=[f"No schema registered for {key}"],
            )

        schema = self._schemas[key]

        # Type validation
        expected_type = schema.get("type")
        if expected_type:
            if not self._check_type(value, expected_type):
                errors.append(f"Expected type {expected_type}, got {type(value).__name__}")

        # Range validation
        if "minimum" in schema and isinstance(value, (int, float)):
            if value < schema["minimum"]:
                errors.append(f"Value {value} below minimum {schema['minimum']}")
        if "maximum" in schema and isinstance(value, (int, float)):
            if value > schema["maximum"]:
                errors.append(f"Value {value} above maximum {schema['maximum']}")

        # Enum validation
        if "enum" in schema:
            if value not in schema["enum"]:
                errors.append(f"Value {value} not in allowed values: {schema['enum']}")

        # Pattern validation
        if "pattern" in schema and isinstance(value, str):
            import re
            if not re.match(schema["pattern"], value):
                errors.append(f"Value doesn't match pattern {schema['pattern']}")

        # Suggestions
        if "default" in schema and value != schema["default"]:
            suggestions.append(f"Consider using default value: {schema['default']}")

        return ValidationResult(
            valid=len(errors) == 0,
            errors=errors,
            warnings=warnings,
            suggestions=suggestions,
        )

    def _check_type(self, value: Any, expected_type: str) -> bool:
        """Check if value matches expected type."""
        type_map = {
            "string": str,
            "integer": int,
            "number": (int, float),
            "boolean": bool,
            "array": list,
            "object": dict,
        }
        expected = type_map.get(expected_type)
        if expected:
            return isinstance(value, expected)
        return True

    def get_schema(self, key: str) -> dict[str, Any] | None:
        """Get schema for a key."""
        return self._schemas.get(key)


class ConfigValidator:
    """Validates configurations before applying."""

    def __init__(self, schema: ConfigSchema):
        self._schema = schema
        self._validators: list[Callable[[ConfigurationSet], ValidationResult]] = []
        self._validation_history: list[dict[str, Any]] = []

    def add_validator(
        self,
        validator: Callable[[ConfigurationSet], ValidationResult],
    ) -> None:
        """Add a custom validator."""
        self._validators.append(validator)

    def validate(
        self,
        config_set: ConfigurationSet,
        level: ValidationLevel = ValidationLevel.FULL,
    ) -> ValidationResult:
        """Validate a configuration set."""
        all_errors = []
        all_warnings = []
        all_suggestions = []

        # Syntax validation (always)
        for key, config_value in config_set.values.items():
            result = self._schema.validate(key, config_value.value)
            all_errors.extend(result.errors)
            all_warnings.extend(result.warnings)
            all_suggestions.extend(result.suggestions)

        # Semantic validation
        if level in (ValidationLevel.SEMANTIC, ValidationLevel.INTEGRATION, ValidationLevel.FULL):
            semantic_result = self._validate_semantics(config_set)
            all_errors.extend(semantic_result.errors)
            all_warnings.extend(semantic_result.warnings)

        # Integration validation
        if level in (ValidationLevel.INTEGRATION, ValidationLevel.FULL):
            integration_result = self._validate_integration(config_set)
            all_errors.extend(integration_result.errors)
            all_warnings.extend(integration_result.warnings)

        # Custom validators
        if level == ValidationLevel.FULL:
            for validator in self._validators:
                try:
                    result = validator(config_set)
                    all_errors.extend(result.errors)
                    all_warnings.extend(result.warnings)
                    all_suggestions.extend(result.suggestions)
                except Exception as e:
                    all_errors.append(f"Validator error: {str(e)}")

        # Record validation
        self._validation_history.append({
            "set_id": config_set.set_id,
            "level": level.value,
            "valid": len(all_errors) == 0,
            "error_count": len(all_errors),
            "timestamp": time.time(),
        })

        return ValidationResult(
            valid=len(all_errors) == 0,
            errors=all_errors,
            warnings=all_warnings,
            suggestions=all_suggestions,
        )

    def _validate_semantics(self, config_set: ConfigurationSet) -> ValidationResult:
        """Validate semantic correctness."""
        errors = []
        warnings = []

        # Check for conflicting settings
        values = {k: v.value for k, v in config_set.values.items()}

        # Example semantic checks
        if "min_replicas" in values and "max_replicas" in values:
            if values["min_replicas"] > values["max_replicas"]:
                errors.append("min_replicas cannot exceed max_replicas")

        if "cpu_limit" in values and "cpu_request" in values:
            if values["cpu_request"] > values["cpu_limit"]:
                warnings.append("cpu_request exceeds cpu_limit")

        return ValidationResult(
            valid=len(errors) == 0,
            errors=errors,
            warnings=warnings,
        )

    def _validate_integration(self, config_set: ConfigurationSet) -> ValidationResult:
        """Validate integration constraints."""
        errors = []
        warnings = []

        # Check for required configurations
        required_keys = ["service_name", "port"]
        for key in required_keys:
            if key not in config_set.values:
                warnings.append(f"Missing recommended configuration: {key}")

        return ValidationResult(
            valid=len(errors) == 0,
            errors=errors,
            warnings=warnings,
        )

    def get_validation_stats(self) -> dict[str, Any]:
        """Get validation statistics."""
        if not self._validation_history:
            return {"total": 0}

        successful = sum(1 for v in self._validation_history if v["valid"])
        return {
            "total": len(self._validation_history),
            "successful": successful,
            "failed": len(self._validation_history) - successful,
            "success_rate": successful / len(self._validation_history),
        }


class ConfigOptimizer:
    """Optimizes configurations based on metrics."""

    def __init__(self):
        self._optimizers: dict[str, Callable[[Any, dict[str, Any]], Any]] = {}
        self._optimization_history: list[OptimizationSuggestion] = []
        self._auto_apply_enabled: set[str] = set()

    def register_optimizer(
        self,
        key: str,
        optimizer: Callable[[Any, dict[str, Any]], Any],
        auto_apply: bool = False,
    ) -> None:
        """Register an optimizer for a configuration key."""
        self._optimizers[key] = optimizer
        if auto_apply:
            self._auto_apply_enabled.add(key)

    def analyze(
        self,
        config_set: ConfigurationSet,
        metrics: dict[str, Any],
    ) -> list[OptimizationSuggestion]:
        """Analyze configuration and suggest optimizations."""
        suggestions = []

        for key, config_value in config_set.values.items():
            if key in self._optimizers:
                try:
                    optimized = self._optimizers[key](config_value.value, metrics)
                    if optimized != config_value.value:
                        suggestion = OptimizationSuggestion(
                            suggestion_id=f"sugg-{uuid.uuid4().hex[:8]}",
                            key=key,
                            current_value=config_value.value,
                            suggested_value=optimized,
                            rationale=f"Optimized based on metrics: {metrics.get(key + '_reason', 'performance')}",
                            impact=self._estimate_impact(key, config_value.value, optimized),
                            confidence=0.8,
                            auto_applicable=key in self._auto_apply_enabled,
                        )
                        suggestions.append(suggestion)
                        self._optimization_history.append(suggestion)
                except Exception:
                    pass

        return suggestions

    def _estimate_impact(
        self,
        key: str,
        current: Any,
        suggested: Any,
    ) -> str:
        """Estimate the impact of a change."""
        if isinstance(current, (int, float)) and isinstance(suggested, (int, float)):
            if suggested > current:
                return f"Increased by {((suggested - current) / current * 100):.1f}%"
            else:
                return f"Decreased by {((current - suggested) / current * 100):.1f}%"
        return "Configuration changed"

    def get_auto_applicable(self, suggestions: list[OptimizationSuggestion]) -> list[OptimizationSuggestion]:
        """Get suggestions that can be auto-applied."""
        return [s for s in suggestions if s.auto_applicable and s.confidence >= 0.9]

    def get_optimization_stats(self) -> dict[str, Any]:
        """Get optimization statistics."""
        if not self._optimization_history:
            return {"total": 0}

        auto_applicable = sum(1 for s in self._optimization_history if s.auto_applicable)
        return {
            "total": len(self._optimization_history),
            "auto_applicable": auto_applicable,
            "manual_required": len(self._optimization_history) - auto_applicable,
            "registered_optimizers": len(self._optimizers),
        }


class ConfigApplier:
    """Applies configurations to the system."""

    def __init__(self):
        self._appliers: dict[str, Callable[[str, Any], bool]] = {}
        self._rollback_handlers: dict[str, Callable[[str, Any], bool]] = {}
        self._applied_configs: dict[str, ConfigurationChange] = {}
        self._change_history: list[ConfigurationChange] = []

    def register_applier(
        self,
        key_pattern: str,
        applier: Callable[[str, Any], bool],
        rollback_handler: Callable[[str, Any], bool] | None = None,
    ) -> None:
        """Register an applier for a configuration key pattern."""
        self._appliers[key_pattern] = applier
        if rollback_handler:
            self._rollback_handlers[key_pattern] = rollback_handler

    def apply(
        self,
        config_set: ConfigurationSet,
        dry_run: bool = False,
    ) -> tuple[bool, list[ConfigurationChange]]:
        """Apply a configuration set."""
        changes = []
        all_success = True

        for key, config_value in config_set.values.items():
            # Find matching applier
            applier = self._find_applier(key)
            if not applier:
                continue

            # Create change record
            change = ConfigurationChange(
                change_id=f"change-{uuid.uuid4().hex[:8]}",
                key=key,
                old_value=None,  # Would need to fetch current
                new_value=config_value.value,
                reason=f"Applied from {config_set.name}",
                source=ConfigSource.AUTO,
            )

            if not dry_run:
                try:
                    success = applier(key, config_value.value)
                    change.applied = success
                    if not success:
                        all_success = False
                except Exception:
                    change.applied = False
                    all_success = False
            else:
                change.applied = True  # Dry run always succeeds

            changes.append(change)
            self._change_history.append(change)

        return all_success, changes

    def rollback(self, changes: list[ConfigurationChange]) -> bool:
        """Rollback applied changes."""
        all_success = True

        for change in reversed(changes):
            if not change.applied:
                continue

            rollback_handler = self._find_rollback_handler(change.key)
            if rollback_handler:
                try:
                    success = rollback_handler(change.key, change.old_value)
                    if not success:
                        all_success = False
                except Exception:
                    all_success = False

        return all_success

    def _find_applier(self, key: str) -> Callable[[str, Any], bool] | None:
        """Find applier for a key."""
        # Exact match first
        if key in self._appliers:
            return self._appliers[key]

        # Pattern match
        for pattern, applier in self._appliers.items():
            if "*" in pattern:
                prefix = pattern.rstrip("*")
                if key.startswith(prefix):
                    return applier

        return None

    def _find_rollback_handler(self, key: str) -> Callable[[str, Any], bool] | None:
        """Find rollback handler for a key."""
        if key in self._rollback_handlers:
            return self._rollback_handlers[key]

        for pattern, handler in self._rollback_handlers.items():
            if "*" in pattern:
                prefix = pattern.rstrip("*")
                if key.startswith(prefix):
                    return handler

        return None

    def get_change_history(self, limit: int = 100) -> list[ConfigurationChange]:
        """Get recent change history."""
        return self._change_history[-limit:]

    def get_applied_count(self) -> int:
        """Get count of applied changes."""
        return sum(1 for c in self._change_history if c.applied)


class ConfigLearner:
    """Learns optimal configurations from system behavior."""

    def __init__(self):
        self._observations: list[dict[str, Any]] = []
        self._learned_configs: dict[str, Any] = {}
        self._max_observations = 10000

    def observe(
        self,
        config: dict[str, Any],
        metrics: dict[str, float],
        outcome: str,
    ) -> None:
        """Record an observation of config performance."""
        observation = {
            "config": config.copy(),
            "metrics": metrics.copy(),
            "outcome": outcome,
            "timestamp": time.time(),
        }
        self._observations.append(observation)

        # Trim if needed
        if len(self._observations) > self._max_observations:
            self._observations = self._observations[-self._max_observations:]

        # Update learned configs
        self._update_learned_configs(config, metrics, outcome)

    def _update_learned_configs(
        self,
        config: dict[str, Any],
        metrics: dict[str, float],
        outcome: str,
    ) -> None:
        """Update learned configurations based on observation."""
        if outcome != "success":
            return

        # Track successful configurations
        for key, value in config.items():
            if key not in self._learned_configs:
                self._learned_configs[key] = {"values": [], "count": 0}

            self._learned_configs[key]["values"].append(value)
            self._learned_configs[key]["count"] += 1

    def get_recommended_config(self, key: str) -> Any | None:
        """Get recommended configuration based on learning."""
        if key not in self._learned_configs:
            return None

        values = self._learned_configs[key]["values"]
        if not values:
            return None

        # Return most common value
        from collections import Counter
        counter = Counter(str(v) for v in values)
        most_common_str = counter.most_common(1)[0][0]

        # Find original value
        for v in values:
            if str(v) == most_common_str:
                return v

        return values[-1]

    def get_confidence(self, key: str) -> float:
        """Get confidence level for a learned config."""
        if key not in self._learned_configs:
            return 0.0

        count = self._learned_configs[key]["count"]
        return min(1.0, count / 100)  # Full confidence after 100 observations

    def get_learning_stats(self) -> dict[str, Any]:
        """Get learning statistics."""
        return {
            "total_observations": len(self._observations),
            "learned_keys": len(self._learned_configs),
            "avg_confidence": sum(self.get_confidence(k) for k in self._learned_configs) / max(1, len(self._learned_configs)),
        }


class SelfConfiguringMesh:
    """Main self-configuring mesh system."""

    def __init__(self):
        self._schema = ConfigSchema()
        self._validator = ConfigValidator(self._schema)
        self._optimizer = ConfigOptimizer()
        self._applier = ConfigApplier()
        self._learner = ConfigLearner()
        self._config_sets: dict[str, ConfigurationSet] = {}
        self._templates: dict[str, ConfigurationSet] = {}
        self._change_handlers: list[Callable[[ConfigurationChange], None]] = []

    def get_schema(self) -> ConfigSchema:
        """Get the configuration schema."""
        return self._schema

    def get_validator(self) -> ConfigValidator:
        """Get the configuration validator."""
        return self._validator

    def get_optimizer(self) -> ConfigOptimizer:
        """Get the configuration optimizer."""
        return self._optimizer

    def get_applier(self) -> ConfigApplier:
        """Get the configuration applier."""
        return self._applier

    def get_learner(self) -> ConfigLearner:
        """Get the configuration learner."""
        return self._learner

    def create_config_set(
        self,
        name: str,
        config_type: ConfigurationType,
        values: dict[str, Any] | None = None,
    ) -> ConfigurationSet:
        """Create a new configuration set."""
        config_set = ConfigurationSet(
            set_id=f"config-{uuid.uuid4().hex[:8]}",
            name=name,
            config_type=config_type,
        )

        if values:
            for key, value in values.items():
                config_set.values[key] = ConfigurationValue(
                    key=key,
                    value=value,
                )

        self._config_sets[config_set.set_id] = config_set
        return config_set

    def register_template(self, template: ConfigurationSet) -> None:
        """Register a configuration template."""
        self._templates[template.name] = template

    def from_template(
        self,
        template_name: str,
        overrides: dict[str, Any] | None = None,
    ) -> ConfigurationSet | None:
        """Create configuration set from template."""
        if template_name not in self._templates:
            return None

        template = self._templates[template_name]
        config_set = ConfigurationSet(
            set_id=f"config-{uuid.uuid4().hex[:8]}",
            name=f"{template_name}-instance",
            config_type=template.config_type,
            values={k: ConfigurationValue(
                key=k,
                value=v.value,
                schema=v.schema,
                description=v.description,
            ) for k, v in template.values.items()},
        )

        if overrides:
            for key, value in overrides.items():
                config_set.values[key] = ConfigurationValue(key=key, value=value)

        self._config_sets[config_set.set_id] = config_set
        return config_set

    def validate(
        self,
        config_set: ConfigurationSet,
        level: ValidationLevel = ValidationLevel.FULL,
    ) -> ValidationResult:
        """Validate a configuration set."""
        return self._validator.validate(config_set, level)

    def optimize(
        self,
        config_set: ConfigurationSet,
        metrics: dict[str, Any],
        auto_apply: bool = False,
    ) -> tuple[ConfigurationSet, list[OptimizationSuggestion]]:
        """Optimize a configuration set."""
        suggestions = self._optimizer.analyze(config_set, metrics)
        optimized_set = ConfigurationSet(
            set_id=f"optimized-{config_set.set_id}",
            name=f"{config_set.name}-optimized",
            config_type=config_set.config_type,
            values={k: ConfigurationValue(
                key=k,
                value=v.value,
                schema=v.schema,
                description=v.description,
            ) for k, v in config_set.values.items()},
        )

        # Apply suggestions
        auto_suggestions = self._optimizer.get_auto_applicable(suggestions) if auto_apply else []

        for suggestion in auto_suggestions:
            if suggestion.key in optimized_set.values:
                optimized_set.values[suggestion.key].value = suggestion.suggested_value

        return optimized_set, suggestions

    def apply(
        self,
        config_set: ConfigurationSet,
        dry_run: bool = False,
    ) -> tuple[bool, list[ConfigurationChange]]:
        """Apply a configuration set."""
        # Validate first
        result = self.validate(config_set)
        if not result.valid:
            return False, []

        # Apply
        success, changes = self._applier.apply(config_set, dry_run)

        # Notify handlers
        for change in changes:
            for handler in self._change_handlers:
                try:
                    handler(change)
                except Exception:
                    pass

        # Update config set status
        if success:
            config_set.status = ConfigurationStatus.APPLIED
        else:
            config_set.status = ConfigurationStatus.FAILED

        return success, changes

    def auto_configure(
        self,
        service_name: str,
        metrics: dict[str, Any],
    ) -> ConfigurationSet | None:
        """Automatically generate and apply optimal configuration."""
        # Check for learned config
        learned_values = {}
        for key in ["cpu_limit", "memory_limit", "replicas", "timeout"]:
            recommended = self._learner.get_recommended_config(key)
            if recommended is not None:
                confidence = self._learner.get_confidence(key)
                if confidence >= 0.7:
                    learned_values[key] = recommended

        # Create config set
        config_set = self.create_config_set(
            name=f"{service_name}-auto",
            config_type=ConfigurationType.RESOURCE,
            values=learned_values,
        )

        # Optimize
        optimized_set, suggestions = self.optimize(config_set, metrics, auto_apply=True)

        # Validate and apply
        result = self.validate(optimized_set)
        if result.valid:
            success, _ = self.apply(optimized_set)
            if success:
                return optimized_set

        return None

    def get_config_set(self, set_id: str) -> ConfigurationSet | None:
        """Get a configuration set by ID."""
        return self._config_sets.get(set_id)

    def get_config_sets(self, config_type: ConfigurationType | None = None) -> list[ConfigurationSet]:
        """Get all configuration sets, optionally filtered by type."""
        sets = list(self._config_sets.values())
        if config_type:
            sets = [s for s in sets if s.config_type == config_type]
        return sets

    def add_change_handler(self, handler: Callable[[ConfigurationChange], None]) -> None:
        """Add a handler for configuration changes."""
        self._change_handlers.append(handler)

    def get_stats(self) -> dict[str, Any]:
        """Get system statistics."""
        return {
            "total_config_sets": len(self._config_sets),
            "templates": len(self._templates),
            "validation": self._validator.get_validation_stats(),
            "optimization": self._optimizer.get_optimization_stats(),
            "learning": self._learner.get_learning_stats(),
            "applied_changes": self._applier.get_applied_count(),
        }


def create_self_configuring_mesh() -> SelfConfiguringMesh:
    """Factory function to create a self-configuring mesh."""
    return SelfConfiguringMesh()


def create_configuration_set(
    name: str,
    config_type: ConfigurationType,
    values: dict[str, Any] | None = None,
) -> ConfigurationSet:
    """Factory function to create a configuration set."""
    config_set = ConfigurationSet(
        set_id=f"config-{uuid.uuid4().hex[:8]}",
        name=name,
        config_type=config_type,
    )

    if values:
        for key, value in values.items():
            config_set.values[key] = ConfigurationValue(key=key, value=value)

    return config_set


def create_configuration_value(
    key: str,
    value: Any,
    **kwargs,
) -> ConfigurationValue:
    """Factory function to create a configuration value."""
    return ConfigurationValue(key=key, value=value, **kwargs)
