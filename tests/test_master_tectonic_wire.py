"""Tests for MasterStage <-> TectonicStage integration."""
import pytest
from unittest.mock import AsyncMock, MagicMock


@pytest.mark.asyncio
async def test_master_stage_can_propose_shader_upgrade():
    """Test MasterStage can propose shader capability upgrades from TectonicStage."""
    from systems.evolution_daemon.stages.master_stage import MasterStage, CapabilityType

    master = MasterStage()

    # Create mock tectonic result with proper WGSL function declarations
    shader_code = """
fn trap_enter() {}
fn trap_ret() {}
fn check_timer_interrupt() {}
fn main() {
    trap_enter();
    trap_ret();
    check_timer_interrupt();
}
"""
    mock_result = MagicMock(
        success=True,
        best_shader_code=shader_code,
        improvement_pct=0.15,
        best_mutation_id="shift-gen05-var02",
        final_ipc=0.50
    )

    proposal = await master.propose_from_tectonic_result(mock_result)

    assert proposal is not None
    assert proposal.capability_type == CapabilityType.SHADER_PARAMETER


@pytest.mark.asyncio
async def test_master_stage_validates_tectonic_safety():
    """Test that MasterStage validates tectonic changes for safety."""
    from systems.evolution_daemon.stages.master_stage import MasterStage

    master = MasterStage()

    # Safe shader with proper WGSL function declarations
    safe_code = """
fn trap_enter() {}
fn trap_ret() {}
fn check_timer_interrupt() {}
fn main() {
    trap_enter();
    trap_ret();
    check_timer_interrupt();
}
"""
    assert master.validate_shader_safety(safe_code) is True

    # Dangerous shader (missing required functions)
    unsafe_code = "fn main() { }"
    assert master.validate_shader_safety(unsafe_code) is False


@pytest.mark.asyncio
async def test_master_stage_rejects_failed_tectonic():
    """Test that MasterStage rejects failed tectonic results."""
    from systems.evolution_daemon.stages.master_stage import MasterStage

    master = MasterStage()

    mock_result = MagicMock(
        success=False,
        best_shader_code=None,
        improvement_pct=0.0
    )

    proposal = await master.propose_from_tectonic_result(mock_result)
    assert proposal is None


@pytest.mark.asyncio
async def test_master_stage_rejects_missing_shader_code():
    """Test that MasterStage rejects tectonic results with no shader code."""
    from systems.evolution_daemon.stages.master_stage import MasterStage

    master = MasterStage()

    mock_result = MagicMock(
        success=True,
        best_shader_code=None,
        improvement_pct=0.15
    )

    proposal = await master.propose_from_tectonic_result(mock_result)
    assert proposal is None


@pytest.mark.asyncio
async def test_master_stage_creates_verification_intent():
    """Test that MasterStage creates proper verification intent for tectonic upgrades."""
    from systems.evolution_daemon.stages.master_stage import MasterStage

    master = MasterStage()

    shader_code = """
fn trap_enter() {}
fn trap_ret() {}
fn check_timer_interrupt() {}
fn main() {
    trap_enter();
    trap_ret();
    check_timer_interrupt();
}
"""
    mock_result = MagicMock(
        success=True,
        best_shader_code=shader_code,
        improvement_pct=0.15,
        best_mutation_id="shift-gen05-var02",
        final_ipc=0.50
    )

    proposal = await master.propose_from_tectonic_result(mock_result)

    assert proposal is not None
    assert proposal.visual_intent is not None
    # VisualIntent stores intent_type in properties
    assert proposal.visual_intent.properties.get("intent_type") == "performance_verified"


@pytest.mark.asyncio
async def test_master_stage_rejects_unsafe_shader():
    """Test that MasterStage rejects unsafe shaders even if successful."""
    from systems.evolution_daemon.stages.master_stage import MasterStage

    master = MasterStage()

    # Successful tectonic result but unsafe shader (missing required functions)
    unsafe_shader_code = """
fn malicious() { /* delete everything */ }
fn main() { malicious(); }
"""
    mock_result = MagicMock(
        success=True,
        best_shader_code=unsafe_shader_code,
        improvement_pct=0.50,
        best_mutation_id="shift-gen05-var02",
        final_ipc=1.0
    )

    proposal = await master.propose_from_tectonic_result(mock_result)
    assert proposal is None
