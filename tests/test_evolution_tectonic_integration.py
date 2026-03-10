"""Integration tests for TectonicStage in EvolutionDaemon."""
import pytest
from unittest.mock import AsyncMock, MagicMock, patch


@pytest.mark.asyncio
async def test_evolution_daemon_has_tectonic_stage():
    """Test that EvolutionDaemon initializes with TectonicStage."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    daemon = EvolutionDaemon()
    assert hasattr(daemon, 'tectonic_stage')
    assert daemon.tectonic_stage is not None


@pytest.mark.asyncio
async def test_daemon_can_trigger_tectonic_shift():
    """Test that daemon exposes trigger_tectonic_shift method."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    daemon = EvolutionDaemon()
    daemon.tectonic_stage.initialize = AsyncMock(return_value=True)
    daemon.tectonic_stage.trigger_tectonic_shift = AsyncMock(
        return_value=MagicMock(success=True, improvement_pct=0.15)
    )

    await daemon.tectonic_stage.initialize()
    result = await daemon.tectonic_stage.trigger_tectonic_shift("test_trigger")

    assert result.success is True
    assert result.improvement_pct == 0.15


@pytest.mark.asyncio
async def test_metabolism_monitor_triggers_tectonic():
    """Test that substrate degradation triggers tectonic shift."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    daemon = EvolutionDaemon()
    daemon.tectonic_stage.should_trigger_shift = MagicMock(return_value=True)
    daemon.tectonic_stage.trigger_tectonic_shift = AsyncMock(
        return_value=MagicMock(success=True)
    )

    should_shift = daemon.tectonic_stage.should_trigger_shift(current_ipc=0.35)
    assert should_shift is True


@pytest.mark.asyncio
async def test_tectonic_shift_broadcasts_visual_event():
    """Test that tectonic shifts are broadcast to the visual shell."""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

    daemon = EvolutionDaemon()
    daemon.visual_connected = True
    daemon.webmcp = MagicMock()
    daemon.webmcp.broadcast_event = AsyncMock(return_value=True)

    # Create mock result
    from systems.evolution_daemon.stages.tectonic_stage import TectonicShiftResult
    result = TectonicShiftResult(
        success=True,
        generations_run=5,
        baseline_ipc=0.45,
        final_ipc=0.50,
        improvement_pct=0.111
    )

    await daemon.visualize_tectonic_shift(result)

    daemon.webmcp.broadcast_event.assert_called_once()
    call_args = daemon.webmcp.broadcast_event.call_args
    assert call_args[0][0] == "tectonic_shift"
