# tests/evolution_daemon/test_substrate_cloning_e2e.py
"""
End-to-end test for Substrate Cloning pipeline.
"""
import pytest
from pathlib import Path


class TestSubstrateCloningE2E:
    """End-to-end tests for complete cloning pipeline."""

    @pytest.mark.asyncio
    async def test_full_clone_pipeline(self):
        """
        Complete pipeline:
        1. Simulate extraction result
        2. Transmute to WGSL
        3. Verify output file
        """
        from systems.evolution_daemon.clone_orchestrator import CloneOrchestrator

        orchestrator = CloneOrchestrator()

        # Simulate extraction from a simple UI
        extraction = {
            "widgets": [
                {"type": "button", "text": "Open", "bbox": [50, 50, 150, 90]},
                {"type": "button", "text": "Save", "bbox": [160, 50, 260, 90]},
                {"type": "menu", "text": "File", "bbox": [0, 0, 40, 25]},
                {"type": "panel", "text": "", "bbox": [0, 100, 800, 600]}
            ],
            "metadata": {
                "source_resolution": [800, 600],
                "clickable_count": 3
            }
        }

        task_id = orchestrator.request_clone(
            source_tile_id="test-vm",
            extraction_result=extraction,
            target_name="test_ui_clone"
        )

        # Execute the clone pipeline
        orchestrator._execute_clone(task_id)

        # Get the completed task
        task = orchestrator.get_task(task_id)

        # Verify completion
        assert task.status == "completed"
        assert task.generated_wgsl is not None
        assert "@fragment" in task.generated_wgsl

        # Verify output file
        assert task.output_path is not None
        assert task.output_path.exists()

        # Verify content
        wgsl_content = task.output_path.read_text()
        assert len(wgsl_content) > 100

    @pytest.mark.asyncio
    async def test_clone_handles_empty_ui(self):
        """Cloning empty UI should produce minimal shader."""
        from systems.evolution_daemon.clone_orchestrator import CloneOrchestrator

        orchestrator = CloneOrchestrator()

        extraction = {
            "widgets": [],
            "metadata": {"source_resolution": [640, 480]}
        }

        task_id = orchestrator.request_clone(
            source_tile_id="empty-vm",
            extraction_result=extraction,
            target_name="empty_clone"
        )

        # Execute the clone pipeline
        orchestrator._execute_clone(task_id)

        # Get the completed task
        task = orchestrator.get_task(task_id)

        assert task.status == "completed"
        assert task.generated_wgsl is not None
