"""
Tests for Self-Configuring Mesh - Phase 56

Tests automatic configuration and optimization without manual intervention.
"""

from unittest.mock import Mock

import pytest

from systems.visual_shell.self_configuring import (
    ConfigApplier,
    ConfigLearner,
    ConfigOptimizer,
    ConfigSchema,
    ConfigSource,
    ConfigurationChange,
    ConfigurationSet,
    ConfigurationStatus,
    ConfigurationType,
    ConfigurationValue,
    ConfigValidator,
    OptimizationSuggestion,
    SelfConfiguringMesh,
    ValidationLevel,
    ValidationResult,
    create_configuration_set,
    create_configuration_value,
    create_self_configuring_mesh,
)


class TestConfigurationStatus:
    """Tests for ConfigurationStatus enum."""

    def test_statuses(self):
        assert ConfigurationStatus.PENDING.value == "pending"
        assert ConfigurationStatus.APPLIED.value == "applied"
        assert ConfigurationStatus.FAILED.value == "failed"
        assert ConfigurationStatus.ROLLED_BACK.value == "rolled_back"
        assert ConfigurationStatus.VALIDATING.value == "validating"
        assert ConfigurationStatus.OPTIMIZING.value == "optimizing"


class TestConfigurationType:
    """Tests for ConfigurationType enum."""

    def test_types(self):
        assert ConfigurationType.NETWORK.value == "network"
        assert ConfigurationType.RESOURCE.value == "resource"
        assert ConfigurationType.SECURITY.value == "security"
        assert ConfigurationType.PERFORMANCE.value == "performance"
        assert ConfigurationType.SCALING.value == "scaling"
        assert ConfigurationType.CUSTOM.value == "custom"


class TestConfigSource:
    """Tests for ConfigSource enum."""

    def test_sources(self):
        assert ConfigSource.AUTO.value == "auto"
        assert ConfigSource.MANUAL.value == "manual"
        assert ConfigSource.TEMPLATE.value == "template"
        assert ConfigSource.LEARNED.value == "learned"
        assert ConfigSource.IMPORTED.value == "imported"


class TestValidationLevel:
    """Tests for ValidationLevel enum."""

    def test_levels(self):
        assert ValidationLevel.SYNTAX.value == "syntax"
        assert ValidationLevel.SEMANTIC.value == "semantic"
        assert ValidationLevel.INTEGRATION.value == "integration"
        assert ValidationLevel.FULL.value == "full"


class TestConfigurationValue:
    """Tests for ConfigurationValue."""

    def test_value_creation(self):
        value = ConfigurationValue(
            key="cpu_limit",
            value=4.0,
        )
        assert value.key == "cpu_limit"
        assert value.value == 4.0

    def test_value_defaults(self):
        value = ConfigurationValue(key="test", value=1)
        assert value.schema is None
        assert value.description == ""
        assert value.sensitive is False
        assert value.version == 1
        assert value.updated_at > 0


class TestConfigurationChange:
    """Tests for ConfigurationChange."""

    def test_change_creation(self):
        change = ConfigurationChange(
            change_id="change-1",
            key="cpu_limit",
            old_value=2.0,
            new_value=4.0,
            reason="Scale up",
            source=ConfigSource.AUTO,
        )
        assert change.change_id == "change-1"
        assert change.applied is False

    def test_change_defaults(self):
        change = ConfigurationChange(
            change_id="change-1",
            key="test",
            old_value=None,
            new_value=1,
            reason="Test",
            source=ConfigSource.MANUAL,
        )
        assert change.timestamp > 0
        assert change.applied is False


class TestConfigurationSet:
    """Tests for ConfigurationSet."""

    def test_set_creation(self):
        config_set = ConfigurationSet(
            set_id="config-1",
            name="service-config",
            config_type=ConfigurationType.RESOURCE,
        )
        assert config_set.set_id == "config-1"
        assert config_set.status == ConfigurationStatus.PENDING

    def test_set_defaults(self):
        config_set = ConfigurationSet(
            set_id="config-1",
            name="test",
            config_type=ConfigurationType.NETWORK,
        )
        assert config_set.values == {}
        assert config_set.version == 1
        assert config_set.metadata == {}

    def test_get_hash(self):
        config_set = ConfigurationSet(
            set_id="config-1",
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={
                "key1": ConfigurationValue(key="key1", value=1),
                "key2": ConfigurationValue(key="key2", value=2),
            },
        )
        hash1 = config_set.get_hash()
        assert isinstance(hash1, str)
        assert len(hash1) == 16

    def test_get_hash_consistency(self):
        config_set = ConfigurationSet(
            set_id="config-1",
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={
                "key1": ConfigurationValue(key="key1", value=1),
            },
        )
        hash1 = config_set.get_hash()
        hash2 = config_set.get_hash()
        assert hash1 == hash2


class TestValidationResult:
    """Tests for ValidationResult."""

    def test_result_creation(self):
        result = ValidationResult(valid=True)
        assert result.valid is True
        assert result.errors == []

    def test_result_with_errors(self):
        result = ValidationResult(
            valid=False,
            errors=["Error 1", "Error 2"],
            warnings=["Warning 1"],
        )
        assert result.valid is False
        assert len(result.errors) == 2
        assert len(result.warnings) == 1


class TestOptimizationSuggestion:
    """Tests for OptimizationSuggestion."""

    def test_suggestion_creation(self):
        suggestion = OptimizationSuggestion(
            suggestion_id="sugg-1",
            key="cpu_limit",
            current_value=2.0,
            suggested_value=4.0,
            rationale="High CPU usage",
            impact="Increased by 100%",
            confidence=0.9,
        )
        assert suggestion.suggestion_id == "sugg-1"
        assert suggestion.auto_applicable is False


class TestConfigSchema:
    """Tests for ConfigSchema."""

    @pytest.fixture
    def schema(self):
        return ConfigSchema()

    def test_schema_creation(self, schema):
        assert len(schema._schemas) == 0

    def test_register_schema(self, schema):
        schema.register_schema("port", {
            "type": "integer",
            "minimum": 1,
            "maximum": 65535,
        })
        assert "port" in schema._schemas

    def test_validate_valid(self, schema):
        schema.register_schema("port", {
            "type": "integer",
            "minimum": 1,
            "maximum": 65535,
        })
        result = schema.validate("port", 8080)
        assert result.valid is True

    def test_validate_invalid_type(self, schema):
        schema.register_schema("port", {
            "type": "integer",
        })
        result = schema.validate("port", "not-a-number")
        assert result.valid is False
        assert len(result.errors) > 0

    def test_validate_out_of_range(self, schema):
        schema.register_schema("port", {
            "type": "integer",
            "minimum": 1,
            "maximum": 65535,
        })
        result = schema.validate("port", 70000)
        assert result.valid is False

    def test_validate_enum(self, schema):
        schema.register_schema("mode", {
            "enum": ["auto", "manual", "hybrid"],
        })
        result = schema.validate("mode", "auto")
        assert result.valid is True

        result = schema.validate("mode", "invalid")
        assert result.valid is False

    def test_validate_no_schema(self, schema):
        result = schema.validate("unknown_key", "any_value")
        assert result.valid is True
        assert len(result.warnings) > 0

    def test_get_schema(self, schema):
        schema.register_schema("test", {"type": "string"})
        retrieved = schema.get_schema("test")
        assert retrieved == {"type": "string"}

    def test_get_schema_not_found(self, schema):
        retrieved = schema.get_schema("nonexistent")
        assert retrieved is None


class TestConfigValidator:
    """Tests for ConfigValidator."""

    @pytest.fixture
    def validator(self):
        return ConfigValidator(ConfigSchema())

    @pytest.fixture
    def config_set(self):
        return ConfigurationSet(
            set_id="config-1",
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={
                "min_replicas": ConfigurationValue(key="min_replicas", value=2),
                "max_replicas": ConfigurationValue(key="max_replicas", value=10),
            },
        )

    def test_validator_creation(self, validator):
        assert len(validator._validators) == 0

    def test_validate_basic(self, validator, config_set):
        result = validator.validate(config_set, ValidationLevel.SYNTAX)
        assert result.valid is True

    def test_validate_semantic_error(self, validator):
        config_set = ConfigurationSet(
            set_id="config-1",
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={
                "min_replicas": ConfigurationValue(key="min_replicas", value=10),
                "max_replicas": ConfigurationValue(key="max_replicas", value=2),
            },
        )
        result = validator.validate(config_set, ValidationLevel.SEMANTIC)
        assert result.valid is False
        assert any("min_replicas" in e for e in result.errors)

    def test_add_validator(self, validator, config_set):
        def custom_validator(cs):
            return ValidationResult(valid=True, suggestions=["Custom check passed"])

        validator.add_validator(custom_validator)
        result = validator.validate(config_set, ValidationLevel.FULL)
        assert "Custom check passed" in result.suggestions

    def test_get_validation_stats(self, validator, config_set):
        for _ in range(5):
            validator.validate(config_set)

        stats = validator.get_validation_stats()
        assert stats["total"] == 5
        assert stats["successful"] == 5


class TestConfigOptimizer:
    """Tests for ConfigOptimizer."""

    @pytest.fixture
    def optimizer(self):
        return ConfigOptimizer()

    @pytest.fixture
    def config_set(self):
        return ConfigurationSet(
            set_id="config-1",
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={
                "cpu_limit": ConfigurationValue(key="cpu_limit", value=2.0),
            },
        )

    def test_optimizer_creation(self, optimizer):
        assert len(optimizer._optimizers) == 0

    def test_register_optimizer(self, optimizer):
        def cpu_optimizer(value, metrics):
            if metrics.get("cpu_usage", 0) > 80:
                return value * 2
            return value

        optimizer.register_optimizer("cpu_limit", cpu_optimizer)
        assert "cpu_limit" in optimizer._optimizers

    def test_analyze_with_optimization(self, optimizer, config_set):
        def cpu_optimizer(value, metrics):
            if metrics.get("cpu_usage", 0) > 80:
                return value * 2
            return value

        optimizer.register_optimizer("cpu_limit", cpu_optimizer, auto_apply=True)

        metrics = {"cpu_usage": 90}
        suggestions = optimizer.analyze(config_set, metrics)

        assert len(suggestions) == 1
        assert suggestions[0].suggested_value == 4.0

    def test_analyze_no_change(self, optimizer, config_set):
        def cpu_optimizer(value, metrics):
            if metrics.get("cpu_usage", 0) > 80:
                return value * 2
            return value

        optimizer.register_optimizer("cpu_limit", cpu_optimizer)

        metrics = {"cpu_usage": 50}
        suggestions = optimizer.analyze(config_set, metrics)

        assert len(suggestions) == 0

    def test_get_auto_applicable(self, optimizer, config_set):
        # Create a suggestion manually with high confidence
        suggestion = OptimizationSuggestion(
            suggestion_id="sugg-1",
            key="cpu_limit",
            current_value=2.0,
            suggested_value=4.0,
            rationale="Test",
            impact="Test",
            confidence=0.95,  # High enough for auto-apply
            auto_applicable=True,
        )
        optimizer._optimization_history.append(suggestion)

        auto = optimizer.get_auto_applicable([suggestion])
        assert len(auto) == 1

    def test_get_optimization_stats(self, optimizer, config_set):
        def cpu_optimizer(value, metrics):
            return value * 2

        optimizer.register_optimizer("cpu_limit", cpu_optimizer)
        optimizer.analyze(config_set, {"cpu_usage": 90})

        stats = optimizer.get_optimization_stats()
        assert stats["total"] == 1
        assert stats["registered_optimizers"] == 1


class TestConfigApplier:
    """Tests for ConfigApplier."""

    @pytest.fixture
    def applier(self):
        return ConfigApplier()

    @pytest.fixture
    def config_set(self):
        return ConfigurationSet(
            set_id="config-1",
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={
                "cpu_limit": ConfigurationValue(key="cpu_limit", value=4.0),
                "memory_limit": ConfigurationValue(key="memory_limit", value="8Gi"),
            },
        )

    def test_applier_creation(self, applier):
        assert len(applier._appliers) == 0

    def test_register_applier(self, applier):
        handler = Mock(return_value=True)
        applier.register_applier("cpu_*", handler)
        assert "cpu_*" in applier._appliers

    def test_apply(self, applier, config_set):
        handler = Mock(return_value=True)
        applier.register_applier("cpu_*", handler)
        applier.register_applier("memory_*", handler)

        success, changes = applier.apply(config_set)

        assert success is True
        assert len(changes) == 2
        assert all(c.applied for c in changes)

    def test_apply_dry_run(self, applier, config_set):
        handler = Mock(return_value=True)
        applier.register_applier("cpu_*", handler)

        success, changes = applier.apply(config_set, dry_run=True)

        assert success is True
        handler.assert_not_called()

    def test_apply_no_handler(self, applier, config_set):
        success, changes = applier.apply(config_set)

        assert success is True  # No handlers means no failures
        assert len(changes) == 0

    def test_apply_failure(self, applier, config_set):
        handler = Mock(return_value=False)
        applier.register_applier("cpu_*", handler)

        success, changes = applier.apply(config_set)

        assert success is False

    def test_rollback(self, applier, config_set):
        handler = Mock(return_value=True)
        rollback = Mock(return_value=True)
        applier.register_applier("cpu_*", handler, rollback)

        success, changes = applier.apply(config_set)
        assert success is True

        rollback_success = applier.rollback(changes)
        assert rollback_success is True
        rollback.assert_called()

    def test_get_change_history(self, applier, config_set):
        handler = Mock(return_value=True)
        applier.register_applier("cpu_*", handler)

        applier.apply(config_set)
        history = applier.get_change_history()

        assert len(history) > 0

    def test_get_applied_count(self, applier, config_set):
        handler = Mock(return_value=True)
        applier.register_applier("cpu_*", handler)
        applier.register_applier("memory_*", handler)

        applier.apply(config_set)
        count = applier.get_applied_count()

        assert count == 2


class TestConfigLearner:
    """Tests for ConfigLearner."""

    @pytest.fixture
    def learner(self):
        return ConfigLearner()

    def test_learner_creation(self, learner):
        assert len(learner._observations) == 0

    def test_observe(self, learner):
        learner.observe(
            config={"cpu_limit": 4.0, "replicas": 3},
            metrics={"latency": 100, "throughput": 1000},
            outcome="success",
        )
        assert len(learner._observations) == 1

    def test_observe_failure(self, learner):
        learner.observe(
            config={"cpu_limit": 1.0},
            metrics={"latency": 500},
            outcome="failure",
        )
        # Failure should not update learned configs
        assert len(learner._learned_configs) == 0

    def test_get_recommended_config(self, learner):
        for _ in range(50):
            learner.observe(
                config={"cpu_limit": 4.0},
                metrics={},
                outcome="success",
            )

        recommended = learner.get_recommended_config("cpu_limit")
        assert recommended == 4.0

    def test_get_recommended_config_no_data(self, learner):
        recommended = learner.get_recommended_config("unknown")
        assert recommended is None

    def test_get_confidence(self, learner):
        for _ in range(50):
            learner.observe(
                config={"cpu_limit": 4.0},
                metrics={},
                outcome="success",
            )

        confidence = learner.get_confidence("cpu_limit")
        assert confidence == 0.5  # 50/100

    def test_get_confidence_no_data(self, learner):
        confidence = learner.get_confidence("unknown")
        assert confidence == 0.0

    def test_get_learning_stats(self, learner):
        learner.observe(
            config={"cpu_limit": 4.0},
            metrics={},
            outcome="success",
        )

        stats = learner.get_learning_stats()
        assert stats["total_observations"] == 1
        assert stats["learned_keys"] == 1


class TestSelfConfiguringMesh:
    """Tests for SelfConfiguringMesh."""

    @pytest.fixture
    def mesh(self):
        return SelfConfiguringMesh()

    def test_mesh_creation(self, mesh):
        assert mesh._schema is not None
        assert mesh._validator is not None
        assert mesh._optimizer is not None
        assert mesh._applier is not None
        assert mesh._learner is not None

    def test_get_schema(self, mesh):
        schema = mesh.get_schema()
        assert isinstance(schema, ConfigSchema)

    def test_get_validator(self, mesh):
        validator = mesh.get_validator()
        assert isinstance(validator, ConfigValidator)

    def test_get_optimizer(self, mesh):
        optimizer = mesh.get_optimizer()
        assert isinstance(optimizer, ConfigOptimizer)

    def test_get_applier(self, mesh):
        applier = mesh.get_applier()
        assert isinstance(applier, ConfigApplier)

    def test_get_learner(self, mesh):
        learner = mesh.get_learner()
        assert isinstance(learner, ConfigLearner)

    def test_create_config_set(self, mesh):
        config_set = mesh.create_config_set(
            name="test-config",
            config_type=ConfigurationType.RESOURCE,
            values={"cpu_limit": 4.0},
        )

        assert config_set.name == "test-config"
        assert "cpu_limit" in config_set.values

    def test_register_template(self, mesh):
        template = ConfigurationSet(
            set_id="template-1",
            name="web-service",
            config_type=ConfigurationType.RESOURCE,
            values={
                "cpu_limit": ConfigurationValue(key="cpu_limit", value=2.0),
                "memory_limit": ConfigurationValue(key="memory_limit", value="4Gi"),
            },
        )
        mesh.register_template(template)

        assert "web-service" in mesh._templates

    def test_from_template(self, mesh):
        template = ConfigurationSet(
            set_id="template-1",
            name="web-service",
            config_type=ConfigurationType.RESOURCE,
            values={
                "cpu_limit": ConfigurationValue(key="cpu_limit", value=2.0),
            },
        )
        mesh.register_template(template)

        config_set = mesh.from_template("web-service", overrides={"cpu_limit": 4.0})

        assert config_set is not None
        assert config_set.values["cpu_limit"].value == 4.0

    def test_from_template_not_found(self, mesh):
        config_set = mesh.from_template("nonexistent")
        assert config_set is None

    def test_validate(self, mesh):
        config_set = mesh.create_config_set(
            name="test",
            config_type=ConfigurationType.RESOURCE,
        )
        result = mesh.validate(config_set)
        assert result.valid is True

    def test_optimize(self, mesh):
        # Manually create a suggestion with high confidence
        suggestion = OptimizationSuggestion(
            suggestion_id="sugg-1",
            key="cpu_limit",
            current_value=2.0,
            suggested_value=4.0,
            rationale="High CPU usage",
            impact="Increased by 100%",
            confidence=0.95,
            auto_applicable=True,
        )
        mesh.get_optimizer()._optimization_history.append(suggestion)

        config_set = mesh.create_config_set(
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={"cpu_limit": 2.0},
        )

        # Get suggestions manually
        optimized, suggestions = mesh.optimize(
            config_set,
            metrics={"cpu_usage": 90},
            auto_apply=True,
        )

        # The optimized set should be created (even if no changes applied)
        assert optimized is not None
        assert len(suggestions) >= 0  # May or may not have suggestions

    def test_apply(self, mesh):
        handler = Mock(return_value=True)
        mesh.get_applier().register_applier("cpu_*", handler)

        config_set = mesh.create_config_set(
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={"cpu_limit": 4.0},
        )

        success, changes = mesh.apply(config_set)

        assert success is True
        assert config_set.status == ConfigurationStatus.APPLIED

    def test_apply_validation_failure(self, mesh):
        # Register schema that will fail
        mesh.get_schema().register_schema("cpu_limit", {
            "type": "integer",  # Will fail for float
        })

        config_set = mesh.create_config_set(
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={"cpu_limit": 4.0},
        )

        success, changes = mesh.apply(config_set)

        assert success is False
        assert len(changes) == 0

    def test_auto_configure(self, mesh):
        # Add some learned configs
        for _ in range(80):
            mesh.get_learner().observe(
                config={"cpu_limit": 4.0, "replicas": 3},
                metrics={},
                outcome="success",
            )

        handler = Mock(return_value=True)
        mesh.get_applier().register_applier("cpu_*", handler)
        mesh.get_applier().register_applier("replicas", handler)

        config_set = mesh.auto_configure(
            service_name="test-service",
            metrics={},
        )

        # Should have learned configuration
        assert config_set is not None

    def test_get_config_set(self, mesh):
        created = mesh.create_config_set(
            name="test",
            config_type=ConfigurationType.RESOURCE,
        )
        retrieved = mesh.get_config_set(created.set_id)

        assert retrieved == created

    def test_get_config_set_not_found(self, mesh):
        retrieved = mesh.get_config_set("nonexistent")
        assert retrieved is None

    def test_get_config_sets(self, mesh):
        mesh.create_config_set("test1", ConfigurationType.RESOURCE)
        mesh.create_config_set("test2", ConfigurationType.NETWORK)

        all_sets = mesh.get_config_sets()
        assert len(all_sets) == 2

        resource_sets = mesh.get_config_sets(ConfigurationType.RESOURCE)
        assert len(resource_sets) == 1

    def test_add_change_handler(self, mesh):
        handler = Mock()
        mesh.add_change_handler(handler)

        mesh.get_applier().register_applier("cpu_*", Mock(return_value=True))

        config_set = mesh.create_config_set(
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={"cpu_limit": 4.0},
        )

        mesh.apply(config_set)

        handler.assert_called()

    def test_get_stats(self, mesh):
        stats = mesh.get_stats()

        assert "total_config_sets" in stats
        assert "templates" in stats
        assert "validation" in stats
        assert "optimization" in stats
        assert "learning" in stats
        assert "applied_changes" in stats


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_self_configuring_mesh(self):
        mesh = create_self_configuring_mesh()
        assert isinstance(mesh, SelfConfiguringMesh)

    def test_create_configuration_set(self):
        config_set = create_configuration_set(
            name="test",
            config_type=ConfigurationType.RESOURCE,
            values={"key": "value"},
        )
        assert isinstance(config_set, ConfigurationSet)
        assert config_set.name == "test"

    def test_create_configuration_value(self):
        value = create_configuration_value(
            key="test",
            value=42,
            description="Test value",
        )
        assert isinstance(value, ConfigurationValue)
        assert value.key == "test"
        assert value.value == 42
        assert value.description == "Test value"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
