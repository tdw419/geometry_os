# tests/system/test_swarm_production.py
"""
Integration tests for the production swarm pipeline.

Validates the full flow: Coordinator -> Scanner -> Dashboard
"""

import pytest
import asyncio
import tempfile
from pathlib import Path

from systems.visual_shell.swarm.coordinator_agent import CoordinatorAgent
from systems.visual_shell.swarm.health_dashboard import HealthDashboard
from systems.visual_shell.swarm.scanner_agent import ScannerAgent


class TestSwarmProductionPipeline:
    """End-to-end production pipeline tests."""

    @pytest.fixture
    def temp_catalog(self):
        """Create a temporary catalog with test artifacts."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test .rts.png files
            for i in range(3):
                test_file = Path(tmpdir) / f"artifact_{i}.rts.png"
                test_file.write_bytes(b"fake png data " * 100)
            yield tmpdir

    @pytest.mark.asyncio
    async def test_coordinator_dashboard_integration(self):
        """Coordinator and dashboard work together."""
        coordinator = CoordinatorAgent(a2a_url="ws://localhost:8766")
        dashboard = HealthDashboard()

        # Register an agent
        await coordinator.register_agent("scanner-001", {"type": "scanner"})
        dashboard.register_agent("scanner-001", {"type": "scanner"})

        # Submit and assign task
        task_id = await coordinator.submit_task(
            task_type="scan_region",
            params={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        await coordinator.assign_task(task_id, "scanner-001")
        dashboard.update_heartbeat("scanner-001", current_task=task_id)

        # Verify state
        status = coordinator.get_status()
        assert status["active_agents"] == 1

        report = dashboard.generate_report()
        assert "scanner-001" in report

    @pytest.mark.asyncio
    async def test_scanner_produces_artifacts(self, temp_catalog):
        """Scanner finds and hashes artifacts."""
        scanner = ScannerAgent(
            agent_id="scanner-test",
            region={"x": 0, "y": 0, "width": 100, "height": 100},
            catalog_path=temp_catalog
        )

        result = await scanner.scan_region()

        assert result.scanned_at > 0
        assert len(result.artifacts_found) == 3
        assert all("sha256" in a for a in result.artifacts_found)

    @pytest.mark.asyncio
    async def test_error_recovery_flow(self):
        """Coordinator recovers from agent failure."""
        coordinator = CoordinatorAgent(a2a_url="ws://localhost:8766")

        # Submit task
        task_id = await coordinator.submit_task(
            task_type="scan_region",
            params={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        # Assign to agent
        await coordinator.register_agent("scanner-001", {"type": "scanner"})
        await coordinator.assign_task(task_id, "scanner-001")

        # Agent fails
        await coordinator.fail_task(task_id, "scanner-001", error="Connection lost")

        # Verify task is requeued (retry logic)
        task = coordinator.active_tasks.get(task_id)
        if task:
            assert task.status == "pending"
        else:
            # Task was permanently failed after max retries
            assert any(t.task_id == task_id for t in coordinator.task_history)

    @pytest.mark.asyncio
    async def test_full_task_lifecycle(self):
        """Complete task flow: submit -> assign -> complete -> verify."""
        coordinator = CoordinatorAgent(a2a_url="ws://localhost:8766")
        dashboard = HealthDashboard()

        # 1. Register agent
        await coordinator.register_agent("scanner-001", {"type": "scanner"})
        dashboard.register_agent("scanner-001", {"type": "scanner"})

        # 2. Submit task
        task_id = await coordinator.submit_task(
            task_type="scan_region",
            params={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        # 3. Assign task
        await coordinator.assign_task(task_id, "scanner-001")
        dashboard.update_heartbeat("scanner-001", current_task=task_id)

        # 4. Complete task
        await coordinator.complete_task(
            task_id, "scanner-001",
            result={"artifacts_found": 5, "errors": 0}
        )

        dashboard.update_task_stats("scanner-001", completed=1)

        # 5. Verify final state
        status = coordinator.get_status()
        assert status["completed_tasks"] == 1

        dash_state = dashboard.to_dict()
        assert dash_state["agents"]["scanner-001"]["tasks_completed"] == 1
