"""
Tests for CloneTask and CloneOrchestrator - autonomous UI cloning pipeline.

Task 3 of substrate-cloning spec.
"""

import pytest
from pathlib import Path
from unittest.mock import MagicMock, patch


class TestCloneTask:
    """Tests for CloneTask dataclass."""

    def test_clone_task_dataclass(self):
        """CloneTask should store clone operation metadata."""
        from systems.evolution_daemon.clone_orchestrator import CloneTask

        # Create a task with required fields
        task = CloneTask(
            task_id="clone-001",
            source_tile_id="tile-abc123",
            extraction_result={"widgets": [], "metadata": {}},
            target_name="cloned_panel"
        )

        # Verify fields
        assert task.task_id == "clone-001"
        assert task.source_tile_id == "tile-abc123"
        assert task.extraction_result == {"widgets": [], "metadata": {}}
        assert task.target_name == "cloned_panel"
        assert task.status == "pending"  # Default status
        assert task.generated_wgsl is None  # Not yet generated
        assert task.output_path is None  # Not yet saved
        assert task.error is None  # No error yet


class TestCloneOrchestrator:
    """Tests for CloneOrchestrator class."""

    def test_orchestrator_initializes(self):
        """CloneOrchestrator should initialize with empty task list."""
        from systems.evolution_daemon.clone_orchestrator import CloneOrchestrator

        orchestrator = CloneOrchestrator()

        assert orchestrator.tasks == {}
        assert orchestrator.output_dir.name == "clones"

    def test_orchestrator_accepts_clone_request(self):
        """CloneOrchestrator should accept and queue a clone request."""
        from systems.evolution_daemon.clone_orchestrator import CloneOrchestrator

        orchestrator = CloneOrchestrator()

        # Request a clone
        task_id = orchestrator.request_clone(
            source_tile_id="tile-xyz",
            extraction_result={"widgets": [{"type": "panel", "bbox": [10, 10, 100, 50]}], "metadata": {}},
            target_name="my_panel"
        )

        # Verify task was created
        assert task_id is not None
        assert task_id.startswith("clone-")
        assert task_id in orchestrator.tasks

        task = orchestrator.get_task(task_id)
        assert task.source_tile_id == "tile-xyz"
        assert task.target_name == "my_panel"
        assert task.status == "pending"

    def test_orchestrator_generates_wgsl(self):
        """CloneOrchestrator should generate WGSL from extraction via UITransmuter."""
        from systems.evolution_daemon.clone_orchestrator import CloneOrchestrator

        orchestrator = CloneOrchestrator()

        # Request a clone with sample extraction
        task_id = orchestrator.request_clone(
            source_tile_id="tile-test",
            extraction_result={
                "widgets": [
                    {"type": "panel", "bbox": [0, 0, 200, 100], "text": "Test Panel"}
                ],
                "metadata": {"source_image": "test.png"}
            },
            target_name="test_wgsl"
        )

        # Execute the clone (generates WGSL)
        orchestrator._execute_clone(task_id)

        # Verify WGSL was generated
        task = orchestrator.get_task(task_id)
        assert task.status == "completed"
        assert task.generated_wgsl is not None
        assert "sdRoundedBox" in task.generated_wgsl  # Panel uses sdRoundedBox
        assert task.output_path is not None
        assert task.error is None

    def test_orchestrator_lists_tasks(self):
        """CloneOrchestrator should list all tasks."""
        from systems.evolution_daemon.clone_orchestrator import CloneOrchestrator

        orchestrator = CloneOrchestrator()

        # Initially empty
        assert orchestrator.list_tasks() == []

        # Add some tasks
        task_id1 = orchestrator.request_clone("tile-1", {"widgets": []}, "clone1")
        task_id2 = orchestrator.request_clone("tile-2", {"widgets": []}, "clone2")

        tasks = orchestrator.list_tasks()
        assert len(tasks) == 2
        assert task_id1 in [t.task_id for t in tasks]
        assert task_id2 in [t.task_id for t in tasks]
