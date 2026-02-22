"""Tests for TectonicStage integration."""
import pytest
import asyncio
from systems.evolution_daemon.stages.tectonic_stage import TectonicStage, TectonicShiftResult


@pytest.mark.asyncio
async def test_tectonic_stage_initialization():
    """Test TectonicStage initializes with correct defaults."""
    stage = TectonicStage()

    assert stage.config is not None
    assert stage.config.generations == 10
    assert stage.config.mutation_rate == 0.05
    assert stage.fitness_service is None  # Not initialized yet
    assert stage.mutation_engine is None


@pytest.mark.asyncio
async def test_tectonic_stage_initialize():
    """Test TectonicStage initialization creates services."""
    stage = TectonicStage()

    result = await stage.initialize()

    assert result is True
    assert stage.fitness_service is not None
    assert stage.mutation_engine is not None
    assert stage.baseline_ipc > 0


@pytest.mark.asyncio
async def test_trigger_tectonic_shift_returns_result():
    """Test that trigger_tectonic_shift returns a TectonicShiftResult."""
    stage = TectonicStage()
    await stage.initialize()

    result = await stage.trigger_tectonic_shift()

    assert isinstance(result, TectonicShiftResult)
    assert result.generations_run >= 0
    assert result.baseline_ipc > 0


@pytest.mark.asyncio
async def test_tectonic_shift_result_dataclass():
    """Test TectonicShiftResult dataclass structure."""
    result = TectonicShiftResult(
        success=True,
        generations_run=5,
        baseline_ipc=0.45,
        final_ipc=0.50,
        improvement_pct=0.111,
        best_mutation_id="test-mutation",
        best_shader_code="fn main() {}"
    )

    assert result.success is True
    assert result.generations_run == 5
    assert result.baseline_ipc == 0.45
    assert result.final_ipc == 0.50
    assert abs(result.improvement_pct - 0.111) < 0.001
    assert result.best_mutation_id == "test-mutation"
    assert result.best_shader_code == "fn main() {}"
    assert result.error is None
    assert result.timestamp is not None


@pytest.mark.asyncio
async def test_should_trigger_shift():
    """Test should_trigger_shift logic."""
    stage = TectonicStage()
    await stage.initialize()

    # With baseline established, degradation > 10% should trigger
    current_ipc = stage.baseline_ipc * 0.85  # 15% degradation
    assert stage.should_trigger_shift(current_ipc) is True

    # Degradation < 10% should not trigger
    current_ipc = stage.baseline_ipc * 0.95  # 5% degradation
    assert stage.should_trigger_shift(current_ipc) is False


@pytest.mark.asyncio
async def test_get_stats():
    """Test get_stats returns correct statistics."""
    stage = TectonicStage()
    await stage.initialize()

    stats = stage.get_stats()

    assert "baseline_ipc" in stats
    assert "shifts_performed" in stats
    assert "last_shift_success" in stats
    assert "total_improvement" in stats
    assert "config" in stats

    assert stats["baseline_ipc"] > 0
    assert stats["shifts_performed"] == 0
    assert stats["config"]["generations"] == 10
