"""End-to-end tests for Tectonic Evolution pipeline."""
import pytest
from unittest.mock import AsyncMock, MagicMock, patch


@pytest.mark.asyncio
async def test_full_tectonic_pipeline():
    """
    Test the complete tectonic evolution flow:
    1. MetabolismMonitor detects IPC degradation
    2. TectonicStage triggers optimization
    3. MasterStage creates proposal from result
    4. EvolutionDaemon broadcasts visual event
    """
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    from systems.evolution_daemon.stages.tectonic_stage import TectonicShiftResult
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    # Setup
    daemon = EvolutionDaemon()
    daemon.visual_connected = True  # Enable visual feedback
    daemon.webmcp = MagicMock()
    daemon.webmcp.connect = AsyncMock(return_value=True)
    daemon.webmcp.broadcast_event = AsyncMock(return_value=True)
    daemon.webmcp.place_text = AsyncMock(return_value=True)
    daemon.tectonic_stage.initialize = AsyncMock(return_value=True)

    # Simulate tectonic shift result
    mock_result = TectonicShiftResult(
        success=True,
        generations_run=5,
        baseline_ipc=0.45,
        final_ipc=0.50,
        improvement_pct=0.111,
        best_mutation_id="shift-gen05-var02"
    )
    daemon.tectonic_stage.trigger_tectonic_shift = AsyncMock(return_value=mock_result)

    # Run pipeline
    await daemon.tectonic_stage.initialize()
    result = await daemon.tectonic_stage.trigger_tectonic_shift("metabolism_degradation")
    await daemon.visualize_tectonic_shift(result)

    # Verify
    assert result.success is True
    assert result.improvement_pct > 0
    daemon.webmcp.broadcast_event.assert_called()


@pytest.mark.asyncio
async def test_tectonic_autonomous_healing():
    """
    Test that substrate degradation triggers automatic tectonic healing.
    """
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    monitor = MetabolismMonitor(baseline_ipc=0.50, degradation_threshold=0.10)

    # Simulate degradation
    current_ipc = 0.40  # 20% drop
    should_heal = monitor.is_ipc_degraded(current_ipc)

    assert should_heal is True, "Should detect degradation and trigger healing"


@pytest.mark.asyncio
async def test_master_creates_proposal_from_tectonic():
    """Test that MasterStage creates proposals from tectonic results."""
    from systems.evolution_daemon.stages.master_stage import MasterStage, CapabilityType

    master = MasterStage()

    mock_result = MagicMock(
        success=True,
        best_shader_code="fn main() { trap_enter(); trap_ret(); check_timer_interrupt(); }",
        improvement_pct=0.15,
        best_mutation_id="shift-gen05-var02",
        final_ipc=0.50
    )

    proposal = await master.propose_from_tectonic_result(mock_result)

    assert proposal is not None
    assert proposal.capability_type == CapabilityType.SHADER_PARAMETER


@pytest.mark.asyncio
async def test_tectonic_stats_tracking():
    """Test that TectonicStage tracks statistics properly."""
    from systems.evolution_daemon.stages.tectonic_stage import TectonicStage

    stage = TectonicStage()
    await stage.initialize()

    stats = stage.get_stats()

    assert "baseline_ipc" in stats
    assert "shifts_performed" in stats
    assert "config" in stats
    assert stats["baseline_ipc"] > 0
