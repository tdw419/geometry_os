"""
Tests for Evolution Daemon Checkpoint/Restore functionality.

Task 11 from STATE_V4.md: Evolution Daemon: Add State Checkpoint/Restore for Crash Recovery

Tests:
(a) Serialize daemon state to .loop/checkpoint.json every 60 seconds
(b) On startup, detect existing checkpoint and offer restore option
(c) Add --force-clean flag to ignore checkpoint
(d) Log checkpoint events to .loop/evolution.log with timestamps
(e) Validate checkpoint integrity before restore (checksum fields)
"""

import json
import sys
import tempfile
from datetime import datetime
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.sisyphus.daemon import CheckpointManager, SisyphusDaemon


class TestCheckpointManagerBasic:
    """Tests for basic CheckpointManager functionality."""

    def test_checkpoint_manager_import(self):
        """CheckpointManager should be importable."""
        from systems.sisyphus.daemon import CheckpointManager
        assert CheckpointManager is not None

    def test_checkpoint_manager_instantiation(self):
        """CheckpointManager should instantiate with checkpoint path."""
        manager = CheckpointManager(checkpoint_path="/tmp/test_checkpoint.json")
        assert manager is not None
        assert manager.checkpoint_path == Path("/tmp/test_checkpoint.json")

    def test_checkpoint_manager_default_path(self):
        """CheckpointManager should default to .loop/checkpoint.json."""
        manager = CheckpointManager()
        assert manager.checkpoint_path == Path(".loop/checkpoint.json")


class TestCheckpointSave:
    """Tests for checkpoint save functionality."""

    def test_save_creates_checkpoint_file(self):
        """save_checkpoint should create checkpoint file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            state = {
                "task_id": 1,
                "task_name": "Test Task",
                "timestamp": datetime.now().isoformat()
            }
            manager.save_checkpoint(state)

            assert checkpoint_path.exists()

    def test_save_includes_checksum(self):
        """save_checkpoint should include checksum field."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            state = {
                "task_id": 1,
                "task_name": "Test Task"
            }
            manager.save_checkpoint(state)

            with open(checkpoint_path) as f:
                saved = json.load(f)

            assert "checksum" in saved

    def test_save_includes_required_fields(self):
        """save_checkpoint should include task_id and timestamp."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            state = {
                "task_id": 5,
                "task_name": "Test Task"
            }
            manager.save_checkpoint(state)

            with open(checkpoint_path) as f:
                saved = json.load(f)

            assert saved["task_id"] == 5
            assert "timestamp" in saved


class TestCheckpointLoad:
    """Tests for checkpoint load functionality."""

    def test_load_returns_none_if_no_checkpoint(self):
        """load_checkpoint should return None if no checkpoint exists."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "nonexistent.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            result = manager.load_checkpoint()
            assert result is None

    def test_load_returns_saved_state(self):
        """load_checkpoint should return the saved state."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            state = {
                "task_id": 3,
                "task_name": "Loaded Task"
            }
            manager.save_checkpoint(state)

            loaded = manager.load_checkpoint()
            assert loaded["task_id"] == 3
            assert loaded["task_name"] == "Loaded Task"

    def test_load_validates_checksum(self):
        """load_checkpoint should validate checksum and return None if invalid."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            state = {
                "task_id": 1,
                "task_name": "Test"
            }
            manager.save_checkpoint(state)

            # Corrupt the checkpoint
            with open(checkpoint_path) as f:
                data = json.load(f)
            data["checksum"] = "invalid_checksum"
            with open(checkpoint_path, 'w') as f:
                json.dump(data, f)

            # Load should return None due to invalid checksum
            loaded = manager.load_checkpoint()
            assert loaded is None

    def test_load_deletes_invalid_checkpoint(self):
        """load_checkpoint should delete corrupted checkpoint file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            state = {"task_id": 1}
            manager.save_checkpoint(state)

            # Corrupt the checkpoint
            with open(checkpoint_path, 'w') as f:
                json.dump({"checksum": "bad", "task_id": 1}, f)

            manager.load_checkpoint()
            assert not checkpoint_path.exists()


class TestCheckpointClear:
    """Tests for checkpoint clearing."""

    def test_clear_removes_checkpoint_file(self):
        """clear_checkpoint should remove the checkpoint file."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            manager.save_checkpoint({"task_id": 1})
            assert checkpoint_path.exists()

            manager.clear_checkpoint()
            assert not checkpoint_path.exists()

    def test_clear_handles_missing_file(self):
        """clear_checkpoint should handle missing file gracefully."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "nonexistent.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            # Should not raise
            manager.clear_checkpoint()


class TestCheckpointExists:
    """Tests for checkpoint existence check."""

    def test_exists_returns_false_for_missing(self):
        """checkpoint_exists should return False if no checkpoint."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "nonexistent.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            assert not manager.checkpoint_exists()

    def test_exists_returns_true_for_valid_checkpoint(self):
        """checkpoint_exists should return True for valid checkpoint."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            manager.save_checkpoint({"task_id": 1})

            assert manager.checkpoint_exists()


class TestDaemonCheckpointIntegration:
    """Tests for daemon integration with checkpointing."""

    def test_daemon_has_checkpoint_manager(self):
        """SisyphusDaemon should have checkpoint_manager attribute."""
        daemon = SisyphusDaemon()
        assert hasattr(daemon, 'checkpoint_manager')

    def test_daemon_checkpoint_on_task_start(self):
        """Daemon should save checkpoint when starting a task."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            daemon = SisyphusDaemon()
            daemon.checkpoint_manager = CheckpointManager(checkpoint_path=checkpoint_path)

            # Simulate task start
            daemon._save_task_checkpoint(task_id=5, task_name="Test Task")

            assert checkpoint_path.exists()
            with open(checkpoint_path) as f:
                data = json.load(f)
            assert data["task_id"] == 5


class TestForceCleanFlag:
    """Tests for --force-clean flag."""

    def test_force_clean_clears_checkpoint(self):
        """Daemon with force_clean should clear existing checkpoint."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            manager = CheckpointManager(checkpoint_path=checkpoint_path)

            # Create checkpoint
            manager.save_checkpoint({"task_id": 1})
            assert checkpoint_path.exists()

            # Simulate force_clean
            daemon = SisyphusDaemon(force_clean=True)
            daemon.checkpoint_manager = manager
            daemon._handle_existing_checkpoint()

            assert not checkpoint_path.exists()


class TestCheckpointLogging:
    """Tests for checkpoint logging."""

    def test_save_logs_to_evolution_log(self):
        """save_checkpoint should log to evolution.log."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            log_path = Path(tmpdir) / "evolution.log"
            manager = CheckpointManager(
                checkpoint_path=checkpoint_path,
                log_path=log_path
            )

            manager.save_checkpoint({"task_id": 1})

            assert log_path.exists()
            with open(log_path) as f:
                content = f.read()
            assert "checkpoint" in content.lower()

    def test_load_logs_restore_event(self):
        """load_checkpoint should log restore event."""
        with tempfile.TemporaryDirectory() as tmpdir:
            checkpoint_path = Path(tmpdir) / "checkpoint.json"
            log_path = Path(tmpdir) / "evolution.log"
            manager = CheckpointManager(
                checkpoint_path=checkpoint_path,
                log_path=log_path
            )

            manager.save_checkpoint({"task_id": 1})
            manager.load_checkpoint()

            with open(log_path) as f:
                content = f.read()
            assert "restore" in content.lower() or "load" in content.lower()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
