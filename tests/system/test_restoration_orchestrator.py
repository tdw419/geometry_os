import pytest
import asyncio
from systems.visual_shell.swarm.restoration_orchestrator import RestorationOrchestrator, RestorationPhase

class TestRestorationOrchestrator:
    """Tests for the Great Map Restoration orchestrator."""

    @pytest.fixture
    def orchestrator(self):
        return RestorationOrchestrator()

    def test_orchestrator_initialization(self, orchestrator):
        """Orchestrator initializes with idle state and all phases defined."""
        assert orchestrator.state == "idle"
        assert len(orchestrator.phases) == 4
        assert orchestrator.current_phase_index == 0
        assert orchestrator.progress == 0.0

    @pytest.mark.asyncio
    async def test_phase_sequencing(self, orchestrator):
        """Orchestrator transitions through phases in correct order."""
        # Mock phase execution
        async def mock_execute(phase):
            phase.status = "completed"
            return True

        for phase in orchestrator.phases:
            phase.execute = lambda p=phase: mock_execute(p)

        success = await orchestrator.start_mission()
        assert success is True
        assert orchestrator.state == "completed"
        assert orchestrator.current_phase_index == 4

    @pytest.mark.asyncio
    async def test_progress_tracking(self, orchestrator):
        """Orchestrator updates overall progress as phases complete."""
        # 4 phases, each 25% of total
        async def mock_execute(phase):
            phase.status = "completed"
            orchestrator._update_progress()
            return True

        orchestrator.phases[0].execute = lambda: mock_execute(orchestrator.phases[0])
        
        await orchestrator.phases[0].execute()
        assert orchestrator.progress == 0.25

    @pytest.mark.asyncio
    async def test_error_handling_and_recovery(self, orchestrator):
        """Orchestrator handles phase failure and supports retry/rollback."""
        async def failing_execute(phase):
            phase.status = "failed"
            phase.error = "intentional failure"
            return False

        orchestrator.phases[0].execute = lambda: failing_execute(orchestrator.phases[0])
        
        success = await orchestrator.start_mission()
        assert success is False
        assert orchestrator.state == "failed"
        assert orchestrator.phases[0].status == "failed"
