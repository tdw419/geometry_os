"""Tests for Foundry Core System."""
import pytest
import tempfile
import os
from pathlib import Path

from systems.foundry.forge import Forge, ForgeTarget, ForgeOperation


class TestForgeTarget:
    """Test ForgeTarget enum."""

    def test_target_values(self):
        """ForgeTarget should have expected values."""
        assert ForgeTarget.SHADER.value == "shader"
        assert ForgeTarget.GEOASM.value == "geoasm"
        assert ForgeTarget.STRATEGY.value == "strategy"
        assert ForgeTarget.VISUAL.value == "visual"

    def test_target_count(self):
        """Should have 4 target types."""
        assert len(ForgeTarget) == 4


class TestForgeOperation:
    """Test ForgeOperation dataclass."""

    def test_operation_creation(self):
        """ForgeOperation should be created with all fields."""
        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path="test.wgsl",
            operation="modify",
            patch="// test",
            reason="Testing"
        )
        assert op.target == ForgeTarget.SHADER
        assert op.path == "test.wgsl"
        assert op.operation == "modify"
        assert op.patch == "// test"
        assert op.reason == "Testing"
        assert op.operation_id != ""

    def test_operation_auto_id(self):
        """Operations should auto-generate unique IDs."""
        op1 = ForgeOperation(
            target=ForgeTarget.SHADER,
            path="test.wgsl",
            operation="modify",
            patch="// test"
        )
        op2 = ForgeOperation(
            target=ForgeTarget.SHADER,
            path="test.wgsl",
            operation="modify",
            patch="// different"
        )
        assert op1.operation_id != op2.operation_id

    def test_operation_timestamp(self):
        """Operations should have timestamps."""
        import time
        before = time.time()
        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path="test.wgsl",
            operation="modify"
        )
        after = time.time()
        assert before <= op.timestamp <= after


class TestForge:
    """Test Forge class."""

    @pytest.fixture
    def temp_dir(self):
        """Create a temporary directory for tests."""
        with tempfile.TemporaryDirectory() as d:
            yield d

    @pytest.fixture
    def forge(self, temp_dir):
        """Create a Forge instance with temp directory."""
        return Forge(backup_dir=os.path.join(temp_dir, "backups"), project_root=temp_dir)

    @pytest.fixture
    def sample_shader(self, temp_dir):
        """Create a sample shader file."""
        shader_path = os.path.join(temp_dir, "test.wgsl")
        with open(shader_path, 'w') as f:
            f.write("@compute @workgroup_size(1)\nfn main() {}\n")
        return shader_path

    def test_forge_creation(self, forge):
        """Forge should be created successfully."""
        assert forge is not None
        assert forge.backup_dir.exists()

    def test_inspect_existing_file(self, forge, sample_shader):
        """inspect should read existing file content."""
        content = forge.inspect(ForgeTarget.SHADER, sample_shader)
        assert "@compute" in content
        assert "fn main()" in content

    def test_inspect_nonexistent_file(self, forge):
        """inspect should raise FileNotFoundError for missing files."""
        with pytest.raises(FileNotFoundError):
            forge.inspect(ForgeTarget.SHADER, "nonexistent.wgsl")

    def test_assess_shader(self, forge, sample_shader):
        """assess should analyze shader and return metrics."""
        metrics = forge.assess(ForgeTarget.SHADER, sample_shader)
        assert metrics['status'] == 'analyzed'
        assert metrics['target'] == 'shader'
        assert 'lines' in metrics
        assert 'functions' in metrics
        assert 'complexity_score' in metrics

    def test_assess_detects_compute_entry(self, forge, sample_shader):
        """assess should detect compute entry points."""
        metrics = forge.assess(ForgeTarget.SHADER, sample_shader)
        # entry_points is a count in Forge._assess_shader
        assert metrics['entry_points'] >= 1

    def test_forge_create_operation(self, forge, temp_dir):
        """forge should create new files."""
        new_path = os.path.join(temp_dir, "new.wgsl")
        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path=new_path,
            operation="create",
            patch="// new file\nfn test() {}"
        )
        success = forge.forge(op)
        assert success
        assert os.path.exists(new_path)
        with open(new_path) as f:
            assert "new file" in f.read()

    def test_forge_modify_operation(self, forge, sample_shader):
        """forge should modify existing files."""
        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path=sample_shader,
            operation="modify",
            patch="// modified\nfn main() {}"
        )
        success = forge.forge(op)
        assert success
        with open(sample_shader) as f:
            content = f.read()
            assert "modified" in content

    def test_forge_creates_backup(self, forge, sample_shader):
        """forge should create backups when modifying."""
        original_content = open(sample_shader).read()

        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path=sample_shader,
            operation="modify",
            patch="// modified"
        )
        forge.forge(op)

        # Check backup was created
        assert op.operation_id in forge._backups
        backup_path = forge._backups[op.operation_id]
        assert os.path.exists(backup_path)

        # Backup should have original content
        with open(backup_path) as f:
            assert f.read() == original_content

    def test_rollback_modify(self, forge, sample_shader):
        """rollback should restore modified file."""
        original_content = open(sample_shader).read()

        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path=sample_shader,
            operation="modify",
            patch="// completely different content"
        )
        forge.forge(op)

        # Verify modification
        with open(sample_shader) as f:
            assert "different" in f.read()

        # Rollback
        success = forge.rollback(op.operation_id)
        assert success

        # Should have original content
        with open(sample_shader) as f:
            assert f.read() == original_content

    def test_history_tracks_operations(self, forge, sample_shader):
        """history should track all operations."""
        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path=sample_shader,
            operation="modify",
            patch="// test"
        )
        forge.forge(op)

        history = forge.history
        assert len(history) == 1
        assert history[0]['operation_id'] == op.operation_id
        assert history[0]['success'] == True

    def test_rollback_nonexistent_operation(self, forge):
        """rollback should fail for unknown operations."""
        success = forge.rollback("nonexistent_id")
        assert not success

    def test_forge_invalid_operation(self, forge, sample_shader):
        """forge should reject invalid operations."""
        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path=sample_shader,
            operation="invalid_op"
        )
        with pytest.raises(ValueError):
            forge.forge(op)

    def test_assess_geoasm_program(self, forge, temp_dir):
        """assess should analyze GeoASM programs."""
        program_path = os.path.join(temp_dir, "test.asm")
        with open(program_path, 'w') as f:
            f.write("EMBED R0, R1\nATTEND R1, R2\nSAMPLE R2, R3\n")

        metrics = forge.assess(ForgeTarget.GEOASM, program_path)
        assert 'instruction_count' in metrics or 'error' in metrics


class TestForgeSafety:
    """Test Forge safety integration."""

    @pytest.fixture
    def temp_dir(self):
        with tempfile.TemporaryDirectory() as d:
            yield d

    @pytest.fixture
    def forge(self, temp_dir):
        return Forge(backup_dir=os.path.join(temp_dir, "backups"), project_root=temp_dir)

    def test_safety_checker_exists(self, forge):
        """Forge should have a safety checker."""
        assert forge.safety is not None

    def test_dangerous_patch_blocked(self, forge, temp_dir):
        """Dangerous patches should be blocked."""
        file_path = os.path.join(temp_dir, "test.wgsl")
        with open(file_path, 'w') as f:
            f.write("fn test() {}")

        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path=file_path,
            operation="modify",
            patch="rm -rf /"  # Dangerous command
        )
        success = forge.forge(op)
        assert not success  # Should be blocked

    def test_safe_patch_allowed(self, forge, temp_dir):
        """Safe patches should be allowed."""
        file_path = os.path.join(temp_dir, "test.wgsl")
        with open(file_path, 'w') as f:
            f.write("fn test() {}")

        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path=file_path,
            operation="modify",
            patch="// Safe comment\nfn test() {}"
        )
        success = forge.forge(op)
        assert success
