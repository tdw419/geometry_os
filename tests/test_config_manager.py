"""
Tests for Centralized Configuration Management System.

These tests verify:
- Configuration loading from multiple sources
- Type-safe access and validation
- Multi-instance deployment
- Configuration change tracking
- Deployment verification
"""

from __future__ import annotations

import json
import os
import tempfile
import threading
import time
from datetime import datetime, timezone
from pathlib import Path
from unittest.mock import patch, MagicMock

import pytest

# Import modules under test
from core.config_manager import (
    ConfigManager,
    ConfigSource,
    ConfigDataType,
    ConfigSchema,
    ConfigEntry,
    ConfigChangeEvent,
    DeploymentRecord,
    ConfigValidationError,
    get_config,
    reset_config,
)
from core.config_deployer import (
    ConfigDeployer,
    DeploymentStrategy,
    DeploymentStatus,
    InstanceStatus,
    InstanceInfo,
    DeploymentPlan,
    VerificationResult,
    HealthCheckResult,
    get_deployer,
)


class TestConfigManager:
    """Tests for ConfigManager."""
    
    @pytest.fixture(autouse=True)
    def reset_singleton(self):
        """Reset singleton before and after each test."""
        reset_config()
        yield
        reset_config()
    
    @pytest.fixture
    def temp_config_dir(self):
        """Create a temporary directory for config files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)
    
    @pytest.fixture
    def config_manager(self, temp_config_dir):
        """Create a ConfigManager instance."""
        return ConfigManager(config_dir=temp_config_dir)
    
    def test_singleton_pattern(self, temp_config_dir):
        """Test that get_config returns a singleton."""
        config1 = get_config(config_dir=temp_config_dir)
        config2 = get_config()
        
        assert config1 is config2
    
    def test_default_values_loaded(self, config_manager):
        """Test that default values from schema are loaded."""
        # Check a default value
        assert config_manager.get("debug_mode") is False
        assert config_manager.get("log_level") == "INFO"
        assert config_manager.get("visual_shell.fps_target") == 60
    
    def test_get_with_default(self, config_manager):
        """Test getting values with defaults."""
        assert config_manager.get("nonexistent_key", default="default") == "default"
        assert config_manager.get_int("nonexistent", default=42) == 42
        assert config_manager.get_bool("nonexistent", default=True) is True
    
    def test_type_safe_access(self, config_manager):
        """Test type-safe getter methods."""
        config_manager.set("test_int", 42)
        config_manager.set("test_bool", True)
        config_manager.set("test_float", 3.14)
        config_manager.set("test_string", "hello")
        config_manager.set("test_list", [1, 2, 3])
        config_manager.set("test_dict", {"key": "value"})
        
        assert config_manager.get_int("test_int") == 42
        assert config_manager.get_bool("test_bool") is True
        assert config_manager.get_float("test_float") == 3.14
        assert config_manager.get_string("test_string") == "hello"
        assert config_manager.get_list("test_list") == [1, 2, 3]
        assert config_manager.get_dict("test_dict") == {"key": "value"}
    
    def test_set_and_get(self, config_manager):
        """Test setting and getting values."""
        config_manager.set("test_key", "test_value")
        
        assert config_manager.get("test_key") == "test_value"
        
        entry = config_manager._entries.get("test_key")
        assert entry is not None
        assert entry.source == ConfigSource.RUNTIME
    
    def test_source_priority(self, config_manager):
        """Test that higher priority sources override lower ones."""
        # Set a default
        config_manager.set("test", "default", ConfigSource.DEFAULT)
        assert config_manager.get("test") == "default"
        
        # Override with runtime
        config_manager.set("test", "runtime", ConfigSource.RUNTIME)
        assert config_manager.get("test") == "runtime"
        
        # Override with CLI
        config_manager.set("test", "cli", ConfigSource.CLI_OVERRIDE)
        assert config_manager.get("test") == "cli"
        
        # Runtime can't override CLI
        config_manager.set("test", "runtime2", ConfigSource.RUNTIME)
        assert config_manager.get("test") == "cli"
    
    def test_environment_variable_loading(self, temp_config_dir):
        """Test loading configuration from environment variables."""
        with patch.dict(os.environ, {
            "GOOGLE_API_KEY": "test-api-key",
            "DEBUG_MODE": "true",
            "GEOM_NEURAL_BATCH_SIZE": "64",
        }):
            config = ConfigManager(config_dir=temp_config_dir)
            
            assert config.get("google_api_key") == "test-api-key"
            assert config.get_bool("debug_mode") is True
            assert config.get_int("neural.batch_size") == 64
    
    def test_config_file_loading_yaml(self, temp_config_dir):
        """Test loading configuration from YAML file."""
        yaml_content = """
debug_mode: true
log_level: DEBUG
neural:
  model_path: /path/to/model
  batch_size: 32
"""
        config_file = temp_config_dir / "config.yaml"
        config_file.write_text(yaml_content)
        
        config = ConfigManager(config_dir=temp_config_dir)
        
        assert config.get_bool("debug_mode") is True
        assert config.get("log_level") == "DEBUG"
        assert config.get("neural.model_path") == "/path/to/model"
        assert config.get_int("neural.batch_size") == 32
    
    def test_config_file_loading_json(self, temp_config_dir):
        """Test loading configuration from JSON file."""
        json_content = {
            "debug_mode": True,
            "log_level": "DEBUG",
            "neural": {
                "model_path": "/path/to/model",
                "batch_size": 32
            }
        }
        config_file = temp_config_dir / "config.json"
        config_file.write_text(json.dumps(json_content))
        
        config = ConfigManager(config_dir=temp_config_dir)
        
        assert config.get_bool("debug_mode") is True
        assert config.get("log_level") == "DEBUG"
        assert config.get("neural.model_path") == "/path/to/model"
    
    def test_local_config_overrides_deployed(self, temp_config_dir):
        """Test that local config overrides deployed config."""
        # Deployed config
        deployed = temp_config_dir / "config.yaml"
        deployed.write_text("log_level: INFO\n")
        
        # Local override
        local = temp_config_dir / "config.local.yaml"
        local.write_text("log_level: DEBUG\n")
        
        config = ConfigManager(config_dir=temp_config_dir)
        
        assert config.get("log_level") == "DEBUG"
        entry = config._entries.get("log_level")
        assert entry.source == ConfigSource.LOCAL_FILE
    
    def test_instance_specific_overrides(self, temp_config_dir):
        """Test instance-specific configuration overrides."""
        # Base config
        base = temp_config_dir / "config.yaml"
        base.write_text("debug_mode: false\ninstance.role: primary\n")
        
        # Instance override
        instance_config = temp_config_dir / "config.test-instance.yaml"
        instance_config.write_text("instance.role: worker\n")
        
        config = ConfigManager(
            config_dir=temp_config_dir,
            instance_id="test-instance",
        )
        
        assert config.get_bool("debug_mode") is False
        assert config.get("instance.role") == "worker"
    
    def test_get_section(self, config_manager):
        """Test getting a configuration section."""
        config_manager.set("neural.model_path", "/model")
        config_manager.set("neural.batch_size", 32)
        config_manager.set("neural.inference_device", "cuda")
        config_manager.set("other.key", "value")
        
        section = config_manager.get_section("neural")
        
        assert section == {
            "model_path": "/model",
            "batch_size": 32,
            "inference_device": "cuda",
        }
    
    def test_validation(self, config_manager):
        """Test configuration validation."""
        # Set invalid value
        config_manager.set("visual_shell.fps_target", 500)  # Max is 240
        
        errors = config_manager.validate()
        
        assert "visual_shell.fps_target" in errors
    
    def test_validation_required_fields(self, config_manager):
        """Test validation of required fields."""
        # Register a required schema
        schema = ConfigSchema(
            key="required_key",
            data_type=ConfigDataType.STRING,
            description="A required key",
            required=True,
        )
        config_manager.register_schema(schema)
        
        missing = config_manager.validate_required()
        
        assert "required_key" in missing
    
    def test_change_tracking(self, config_manager):
        """Test configuration change tracking."""
        changes = []
        
        def listener(event):
            changes.append(event)
        
        config_manager.add_change_listener(listener)
        
        config_manager.set("test_key", "value1")
        config_manager.set("test_key", "value2")
        
        assert len(changes) == 2
        assert changes[0].old_value is None
        assert changes[0].new_value == "value1"
        assert changes[1].old_value == "value1"
        assert changes[1].new_value == "value2"
    
    def test_export_config(self, config_manager):
        """Test exporting configuration."""
        config_manager.set("key1", "value1")
        config_manager.set("key2", 42)
        config_manager.set("section.subkey", "subvalue")
        
        exported = config_manager.export_config()
        
        assert exported["key1"] == "value1"
        assert exported["key2"] == 42
        assert exported["section"]["subkey"] == "subvalue"
    
    def test_export_config_with_secrets_redacted(self, config_manager):
        """Test that secrets are redacted in export."""
        config_manager.set("secret_key", "secret_value")
        # Mark as secret
        schema = ConfigSchema(
            key="secret_key",
            data_type=ConfigDataType.SECRET,
            description="A secret",
            secret=True,
        )
        config_manager.register_schema(schema)
        config_manager.set("secret_key", "secret_value")
        
        exported = config_manager.export_config(include_secrets=False)
        
        assert exported["secret_key"] == "***REDACTED***"
    
    def test_export_to_file(self, config_manager, temp_config_dir):
        """Test exporting configuration to file."""
        config_manager.set("key1", "value1")
        
        export_path = temp_config_dir / "export.json"
        config_manager.export_to_json(export_path)
        
        assert export_path.exists()
        data = json.loads(export_path.read_text())
        assert data["key1"] == "value1"
    
    def test_config_hash(self, config_manager):
        """Test configuration hash computation."""
        hash1 = config_manager.compute_config_hash()
        
        config_manager.set("new_key", "new_value")
        hash2 = config_manager.compute_config_hash()
        
        assert hash1 != hash2
    
    def test_deployment_tracking(self, config_manager):
        """Test deployment record tracking."""
        record = config_manager.create_deployment(
            instance_ids=["inst1", "inst2"],
            description="Test deployment",
        )
        
        assert record.deployment_id.startswith("deploy-")
        assert record.status == "pending"
        assert len(record.instance_ids) == 2
        
        # Update deployment
        updated = config_manager.update_deployment(
            record.deployment_id,
            status="completed",
            verification_results={"inst1": True, "inst2": True},
        )
        
        assert updated.status == "completed"
        assert updated.verification_results == {"inst1": True, "inst2": True}
    
    def test_generate_report(self, config_manager):
        """Test configuration report generation."""
        report = config_manager.generate_report()
        
        assert "instance_id" in report
        assert "config_hash" in report
        assert "total_keys" in report
        assert "is_valid" in report
        assert "sources" in report
    
    def test_auto_reload_disabled_by_default(self, config_manager):
        """Test that auto-reload is disabled by default."""
        assert config_manager._auto_reload is False
        assert config_manager._reload_thread is None
    
    def test_auto_reload_enabled(self, temp_config_dir):
        """Test auto-reload functionality."""
        config = ConfigManager(
            config_dir=temp_config_dir,
            auto_reload=True,
            reload_interval=0.5,
        )
        
        assert config._auto_reload is True
        assert config._reload_thread is not None
        
        # Clean up
        reset_config()


class TestConfigDeployer:
    """Tests for ConfigDeployer."""
    
    @pytest.fixture
    def temp_dir(self):
        """Create a temporary directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)
    
    @pytest.fixture
    def deployer(self, temp_dir):
        """Create a ConfigDeployer instance."""
        return ConfigDeployer(
            config_dir=temp_dir,
            state_dir=temp_dir / ".deployments",
        )
    
    @pytest.fixture
    def config_file(self, temp_dir):
        """Create a test configuration file."""
        config = temp_dir / "config.yaml"
        config.write_text("debug_mode: true\nlog_level: DEBUG\n")
        return config
    
    def test_register_instance(self, deployer):
        """Test instance registration."""
        instance = deployer.register_instance(
            instance_id="test-instance",
            address="192.168.1.100",
            port=8080,
            metadata={"env": "test"},
        )
        
        assert instance.instance_id == "test-instance"
        assert instance.address == "192.168.1.100"
        assert instance.port == 8080
        assert instance.metadata["env"] == "test"
    
    def test_list_instances(self, deployer):
        """Test listing instances."""
        deployer.register_instance("inst1")
        deployer.register_instance("inst2")
        deployer.register_instance("inst3")
        
        instances = deployer.list_instances()
        
        assert len(instances) == 3
    
    def test_check_instance_health_local(self, deployer):
        """Test health check for local instance."""
        deployer.register_instance("local-inst")
        
        result = deployer.check_instance_health("local-inst")
        
        # Local instances should be healthy
        assert result.status == InstanceStatus.HEALTHY
    
    def test_check_instance_health_offline(self, deployer):
        """Test health check for offline instance."""
        deployer.register_instance(
            "offline-inst",
            address="192.168.255.255",  # Non-routable
            port=9999,
        )
        
        result = deployer.check_instance_health("offline-inst", timeout=1.0)
        
        # Should be offline (can't connect)
        assert result.status in [InstanceStatus.OFFLINE, InstanceStatus.UNHEALTHY]
    
    def test_create_deployment_plan(self, deployer, config_file):
        """Test creating a deployment plan."""
        deployer.register_instance("inst1")
        deployer.register_instance("inst2")
        
        plan = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=["inst1", "inst2"],
            strategy=DeploymentStrategy.ROLLING,
            batch_size=1,
        )
        
        assert plan.deployment_id.startswith("deploy-")
        assert plan.strategy == DeploymentStrategy.ROLLING
        assert len(plan.instances) == 2
        assert len(plan.steps) > 0
    
    def test_deployment_strategies(self, deployer, config_file):
        """Test different deployment strategies."""
        deployer.register_instance("inst1")
        deployer.register_instance("inst2")
        deployer.register_instance("inst3")
        
        # All at once
        plan_all = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=["inst1", "inst2", "inst3"],
            strategy=DeploymentStrategy.ALL_AT_ONCE,
        )
        deploy_steps = [s for s in plan_all.steps if "Deploy" in s.name]
        assert len(deploy_steps) == 1
        
        # Rolling
        plan_rolling = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=["inst1", "inst2", "inst3"],
            strategy=DeploymentStrategy.ROLLING,
            batch_size=1,
        )
        deploy_steps = [s for s in plan_rolling.steps if "Deploy" in s.name]
        assert len(deploy_steps) == 3  # One per instance
        
        # Canary
        plan_canary = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=["inst1", "inst2", "inst3"],
            strategy=DeploymentStrategy.CANARY,
            canary_count=1,
        )
        canary_step = [s for s in plan_canary.steps if "Canary" in s.name]
        assert len(canary_step) >= 1
    
    def test_execute_deployment(self, deployer, config_file):
        """Test executing a deployment."""
        deployer.register_instance("inst1")
        
        plan = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=["inst1"],
            strategy=DeploymentStrategy.ALL_AT_ONCE,
        )
        
        progress_events = []
        def callback(p):
            progress_events.append(p)
        
        result = deployer.execute_deployment(
            deployment_id=plan.deployment_id,
            config_path=config_file,
            progress_callback=callback,
        )
        
        assert result.status == DeploymentStatus.COMPLETED
        assert len(progress_events) > 0
    
    def test_verify_deployment(self, deployer, config_file):
        """Test deployment verification."""
        instance = deployer.register_instance("inst1")
        
        plan = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=["inst1"],
            strategy=DeploymentStrategy.ALL_AT_ONCE,
        )
        
        # Execute deployment
        deployer.execute_deployment(
            deployment_id=plan.deployment_id,
            config_path=config_file,
        )
        
        # Verify
        results = deployer.verify_deployment(plan.deployment_id)
        
        assert "inst1" in results
    
    def test_list_deployments(self, deployer, config_file):
        """Test listing deployments."""
        deployer.register_instance("inst1")
        
        plan = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=["inst1"],
            strategy=DeploymentStrategy.ALL_AT_ONCE,
        )
        
        deployments = deployer.list_deployments()
        
        assert len(deployments) >= 1
        assert any(d.deployment_id == plan.deployment_id for d in deployments)
    
    def test_deployment_progress_listener(self, deployer, config_file):
        """Test deployment progress notifications."""
        deployer.register_instance("inst1")
        
        events = []
        deployer.add_progress_listener(lambda p: events.append(p))
        
        plan = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=["inst1"],
            strategy=DeploymentStrategy.ALL_AT_ONCE,
        )
        
        deployer.execute_deployment(
            deployment_id=plan.deployment_id,
            config_path=config_file,
        )
        
        assert len(events) > 0


class TestConfigIntegration:
    """Integration tests for configuration management."""
    
    @pytest.fixture
    def temp_dir(self):
        """Create a temporary directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)
    
    def test_full_deployment_workflow(self, temp_dir):
        """Test complete deployment workflow from config to verification."""
        # Reset singletons
        reset_config()
        
        # Create configuration
        config_dir = temp_dir / "config"
        config_dir.mkdir()
        
        config_file = config_dir / "config.yaml"
        config_file.write_text("""
debug_mode: false
log_level: INFO
neural:
  model_path: /models/brain.rts.png
  batch_size: 16
evolution:
  enabled: true
  check_interval_seconds: 30
""")
        
        # Initialize config manager
        config = ConfigManager(config_dir=config_dir)
        
        # Verify config loaded
        assert config.get("neural.model_path") == "/models/brain.rts.png"
        assert config.get_int("neural.batch_size") == 16
        
        # Create deployer
        deployer = ConfigDeployer(
            config_dir=config_dir,
            state_dir=temp_dir / ".deployments",
        )
        
        # Register instances
        instances = []
        for i in range(3):
            inst = deployer.register_instance(f"instance-{i}")
            instances.append(inst)
        
        # Create deployment plan
        plan = deployer.create_deployment_plan(
            config_path=config_file,
            instance_ids=[i.instance_id for i in instances],
            strategy=DeploymentStrategy.ROLLING,
            batch_size=1,
        )
        
        assert plan is not None
        assert plan.strategy == DeploymentStrategy.ROLLING
        
        # Execute deployment
        result = deployer.execute_deployment(
            deployment_id=plan.deployment_id,
            config_path=config_file,
        )
        
        assert result.status == DeploymentStatus.COMPLETED
        
        # Verify deployment
        verification = deployer.verify_deployment(plan.deployment_id)
        
        assert len(verification) == 3
        
        # Clean up
        reset_config()
    
    def test_multi_instance_config_override(self, temp_dir):
        """Test configuration with instance-specific overrides."""
        reset_config()
        
        config_dir = temp_dir / "config"
        config_dir.mkdir()
        
        # Base config
        base_config = config_dir / "config.yaml"
        base_config.write_text("""
instance:
  role: primary
debug_mode: false
""")
        
        # Instance-specific config
        instance_config = config_dir / "config.worker-1.yaml"
        instance_config.write_text("""
instance:
  role: worker
debug_mode: true
""")
        
        # Load as primary
        primary_config = ConfigManager(
            config_dir=config_dir,
            instance_id="primary",
        )
        
        assert primary_config.get("instance.role") == "primary"
        assert primary_config.get_bool("debug_mode") is False
        
        # Reset and load as worker
        reset_config()
        worker_config = ConfigManager(
            config_dir=config_dir,
            instance_id="worker-1",
        )
        
        assert worker_config.get("instance.role") == "worker"
        assert worker_config.get_bool("debug_mode") is True
        
        reset_config()
    
    def test_concurrent_config_access(self, temp_dir):
        """Test thread-safe concurrent configuration access."""
        reset_config()
        
        config = ConfigManager(config_dir=temp_dir)
        
        errors = []
        
        def reader_thread():
            try:
                for _ in range(100):
                    config.get("debug_mode")
                    config.get("log_level")
                    config.get_section("neural")
            except Exception as e:
                errors.append(e)
        
        def writer_thread():
            try:
                for i in range(100):
                    config.set(f"dynamic_key_{i % 10}", f"value_{i}")
            except Exception as e:
                errors.append(e)
        
        threads = [
            threading.Thread(target=reader_thread)
            for _ in range(5)
        ] + [
            threading.Thread(target=writer_thread)
            for _ in range(2)
        ]
        
        for t in threads:
            t.start()
        for t in threads:
            t.join()
        
        assert len(errors) == 0
        
        reset_config()


class TestConfigCLI:
    """Tests for configuration CLI."""
    
    @pytest.fixture
    def temp_dir(self):
        """Create a temporary directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)
    
    def test_cli_import(self):
        """Test that CLI module can be imported."""
        from core import config_cli
        assert hasattr(config_cli, 'main')


class TestConfigValidation:
    """Tests for configuration validation."""
    
    @pytest.fixture(autouse=True)
    def reset_singleton(self):
        """Reset singleton before and after each test."""
        reset_config()
        yield
        reset_config()
    
    @pytest.fixture
    def config_manager(self):
        """Create a ConfigManager instance."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield ConfigManager(config_dir=Path(tmpdir))
    
    def test_integer_validation(self, config_manager):
        """Test integer range validation."""
        # Valid values
        config_manager.set("visual_shell.fps_target", 60)
        errors = config_manager.validate()
        assert "visual_shell.fps_target" not in errors
        
        # Below minimum
        config_manager.set("visual_shell.fps_target", 0)
        errors = config_manager.validate()
        assert "visual_shell.fps_target" in errors
        
        # Above maximum
        config_manager.set("visual_shell.fps_target", 500)
        errors = config_manager.validate()
        assert "visual_shell.fps_target" in errors
    
    def test_enum_validation(self, config_manager):
        """Test enum/allowed values validation."""
        # Valid value
        config_manager.set("log_level", "DEBUG")
        errors = config_manager.validate()
        assert "log_level" not in errors
        
        # Invalid value
        config_manager.set("log_level", "INVALID")
        errors = config_manager.validate()
        assert "log_level" in errors
    
    def test_type_validation(self, config_manager):
        """Test type validation during set operations."""
        # Setting an out-of-range integer should still work but create validation errors
        config_manager.set("visual_shell.fps_target", 500)  # Max is 240
        
        errors = config_manager.validate()
        assert "visual_shell.fps_target" in errors
        
        # Check that the error mentions the constraint
        entry_errors = errors["visual_shell.fps_target"]
        assert any("240" in e for e in entry_errors)  # Error should mention max value
    
    def test_deprecated_key_warning(self, config_manager):
        """Test deprecated key handling."""
        # Set deprecated key
        config_manager.set("is_clone", True)
        
        schema = config_manager.get_schema("is_clone")
        assert schema is not None
        assert schema.deprecated is True
        assert schema.replacement_key == "instance.is_clone"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
