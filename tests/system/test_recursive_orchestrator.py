"""
Tests for RecursiveOrchestrator - the recursive evolution orchestrator.

Task 4 of Recursive Self-Improvement Swarm specification.
"""

import pytest
from dataclasses import dataclass, field
from typing import Any, Optional, Dict, List


# Import the module under test (will fail initially, that's TDD)
from systems.visual_shell.swarm.evolution.recursive_orchestrator import (
    EvolutionPhase,
    EvolutionState,
    EvolutionResult,
    RecursiveOrchestrator,
)


class TestEvolutionPhaseEnum:
    """Test EvolutionPhase enum has all required values."""

    def test_has_idle_phase(self):
        """EvolutionPhase should have IDLE."""
        assert EvolutionPhase.IDLE is not None

    def test_has_introspecting_phase(self):
        """EvolutionPhase should have INTROSPECTING."""
        assert EvolutionPhase.INTROSPECTING is not None

    def test_has_proposing_phase(self):
        """EvolutionPhase should have PROPOSING."""
        assert EvolutionPhase.PROPOSING is not None

    def test_has_validating_phase(self):
        """EvolutionPhase should have VALIDATING."""
        assert EvolutionPhase.VALIDATING is not None

    def test_has_consensus_phase(self):
        """EvolutionPhase should have CONSENSUS."""
        assert EvolutionPhase.CONSENSUS is not None

    def test_has_applying_phase(self):
        """EvolutionPhase should have APPLYING."""
        assert EvolutionPhase.APPLYING is not None

    def test_has_complete_phase(self):
        """EvolutionPhase should have COMPLETE."""
        assert EvolutionPhase.COMPLETE is not None

    def test_has_failed_phase(self):
        """EvolutionPhase should have FAILED."""
        assert EvolutionPhase.FAILED is not None


class TestEvolutionStateEnum:
    """Test EvolutionState enum has all required values."""

    def test_has_ready_state(self):
        """EvolutionState should have READY."""
        assert EvolutionState.READY is not None

    def test_has_running_state(self):
        """EvolutionState should have RUNNING."""
        assert EvolutionState.RUNNING is not None

    def test_has_iterating_state(self):
        """EvolutionState should have ITERATING."""
        assert EvolutionState.ITERATING is not None

    def test_has_stopped_state(self):
        """EvolutionState should have STOPPED."""
        assert EvolutionState.STOPPED is not None


class TestEvolutionResultDataclass:
    """Test EvolutionResult dataclass."""

    def test_evolution_result_creation(self):
        """EvolutionResult should store all required fields."""
        result = EvolutionResult(
            success=True,
            target_file="/test.py",
            improvement_delta=0.25,
            tests_passed=10,
            tests_failed=0,
            consensus_achieved=True,
        )
        assert result.success is True
        assert result.target_file == "/test.py"
        assert result.improvement_delta == 0.25
        assert result.tests_passed == 10
        assert result.tests_failed == 0
        assert result.consensus_achieved is True

    def test_evolution_result_failure(self):
        """EvolutionResult should represent failure."""
        result = EvolutionResult(
            success=False,
            target_file="/failed.py",
            improvement_delta=0.0,
            tests_passed=5,
            tests_failed=3,
            consensus_achieved=False,
        )
        assert result.success is False
        assert result.tests_failed == 3


class TestRecursiveOrchestratorInitialization:
    """Test 1: RecursiveOrchestrator initializes in IDLE phase."""

    def test_initializes_in_idle_phase(self):
        """RecursiveOrchestrator should start in IDLE phase."""
        orchestrator = RecursiveOrchestrator()
        assert orchestrator.phase == EvolutionPhase.IDLE

    def test_initializes_in_ready_state(self):
        """RecursiveOrchestrator should start in READY state."""
        orchestrator = RecursiveOrchestrator()
        assert orchestrator.state == EvolutionState.READY

    def test_initializes_with_no_current_target(self):
        """RecursiveOrchestrator should start with no current target."""
        orchestrator = RecursiveOrchestrator()
        assert orchestrator.current_target is None

    def test_initializes_with_zero_iterations(self):
        """RecursiveOrchestrator should start with zero iterations."""
        orchestrator = RecursiveOrchestrator()
        assert orchestrator.iteration_count == 0


class TestRecursiveOrchestratorIntrospect:
    """Test 2: run_phase_introspect(target_file) analyzes target."""

    def test_run_phase_introspect_changes_phase(self):
        """run_phase_introspect should change phase to INTROSPECTING."""
        orchestrator = RecursiveOrchestrator()
        orchestrator.run_phase_introspect("/test.py")
        assert orchestrator.phase == EvolutionPhase.INTROSPECTING

    def test_run_phase_introspect_returns_analysis(self):
        """run_phase_introspect should return analysis dict."""
        orchestrator = RecursiveOrchestrator()
        analysis = orchestrator.run_phase_introspect("/test.py")
        assert isinstance(analysis, dict)
        assert "file_path" in analysis

    def test_run_phase_introspect_sets_current_target(self):
        """run_phase_introspect should set current_target."""
        orchestrator = RecursiveOrchestrator()
        orchestrator.run_phase_introspect("/test.py")
        assert orchestrator.current_target == "/test.py"

    def test_run_phase_introspect_includes_file_info(self):
        """run_phase_introspect analysis should include file information."""
        orchestrator = RecursiveOrchestrator()
        analysis = orchestrator.run_phase_introspect("/test.py")
        assert analysis["file_path"] == "/test.py"


class TestRecursiveOrchestratorPropose:
    """Test 3: run_phase_propose(analysis) generates proposal."""

    def test_run_phase_propose_changes_phase(self):
        """run_phase_propose should change phase to PROPOSING."""
        orchestrator = RecursiveOrchestrator()
        analysis = {"file_path": "/test.py", "issues": ["complexity"]}
        orchestrator.run_phase_propose(analysis)
        assert orchestrator.phase == EvolutionPhase.PROPOSING

    def test_run_phase_propose_returns_proposal(self):
        """run_phase_propose should return proposal dict."""
        orchestrator = RecursiveOrchestrator()
        analysis = {"file_path": "/test.py", "issues": ["complexity"]}
        proposal = orchestrator.run_phase_propose(analysis)
        assert isinstance(proposal, dict)
        assert "file_path" in proposal
        assert "changes" in proposal

    def test_run_phase_propose_includes_improvement_plan(self):
        """run_phase_propose should include an improvement plan."""
        orchestrator = RecursiveOrchestrator()
        analysis = {"file_path": "/test.py", "issues": ["complexity"]}
        proposal = orchestrator.run_phase_propose(analysis)
        assert "improvement_plan" in proposal or "changes" in proposal


class TestRecursiveOrchestratorValidate:
    """Test 4: run_phase_validate(proposal) tests changes."""

    def test_run_phase_validate_changes_phase(self):
        """run_phase_validate should change phase to VALIDATING."""
        orchestrator = RecursiveOrchestrator()
        proposal = {"file_path": "/test.py", "changes": []}
        orchestrator.run_phase_validate(proposal)
        assert orchestrator.phase == EvolutionPhase.VALIDATING

    def test_run_phase_validate_returns_validation_result(self):
        """run_phase_validate should return validation result dict."""
        orchestrator = RecursiveOrchestrator()
        proposal = {"file_path": "/test.py", "changes": []}
        validation = orchestrator.run_phase_validate(proposal)
        assert isinstance(validation, dict)
        assert "passed" in validation

    def test_run_phase_validate_includes_test_results(self):
        """run_phase_validate should include test results."""
        orchestrator = RecursiveOrchestrator()
        proposal = {"file_path": "/test.py", "changes": []}
        validation = orchestrator.run_phase_validate(proposal)
        assert "tests_passed" in validation
        assert "tests_failed" in validation


class TestRecursiveOrchestratorConsensus:
    """Test 5: run_phase_consensus(validation) checks agreement."""

    def test_run_phase_consensus_changes_phase(self):
        """run_phase_consensus should change phase to CONSENSUS."""
        orchestrator = RecursiveOrchestrator()
        validation = {"passed": True, "tests_passed": 10, "tests_failed": 0}
        orchestrator.run_phase_consensus(validation)
        assert orchestrator.phase == EvolutionPhase.CONSENSUS

    def test_run_phase_consensus_returns_consensus_result(self):
        """run_phase_consensus should return consensus result dict."""
        orchestrator = RecursiveOrchestrator()
        validation = {"passed": True, "tests_passed": 10, "tests_failed": 0}
        consensus = orchestrator.run_phase_consensus(validation)
        assert isinstance(consensus, dict)
        assert "agreed" in consensus

    def test_run_phase_consensus_agreed_when_validation_passed(self):
        """run_phase_consensus should agree when validation passed."""
        orchestrator = RecursiveOrchestrator()
        validation = {"passed": True, "tests_passed": 10, "tests_failed": 0}
        consensus = orchestrator.run_phase_consensus(validation)
        assert consensus["agreed"] is True


class TestRecursiveOrchestratorApplyImprovement:
    """Test 6: apply_improvement(proposal) applies on consensus."""

    def test_apply_improvement_changes_phase_from_idle(self):
        """apply_improvement should transition from IDLE to APPLYING or COMPLETE."""
        orchestrator = RecursiveOrchestrator()
        proposal = {"file_path": "/test.py", "changes": []}
        initial_phase = orchestrator.phase
        result = orchestrator.apply_improvement(proposal)
        # Phase should change from initial state
        assert orchestrator.phase != initial_phase
        # On success, should be COMPLETE; on failure, should be FAILED
        assert orchestrator.phase in (EvolutionPhase.APPLYING, EvolutionPhase.COMPLETE, EvolutionPhase.FAILED)

    def test_apply_improvement_returns_result(self):
        """apply_improvement should return EvolutionResult."""
        orchestrator = RecursiveOrchestrator()
        proposal = {"file_path": "/test.py", "changes": []}
        result = orchestrator.apply_improvement(proposal)
        assert isinstance(result, EvolutionResult)

    def test_apply_improvement_sets_phase_to_complete_on_success(self):
        """apply_improvement should set phase to COMPLETE on success."""
        orchestrator = RecursiveOrchestrator()
        proposal = {"file_path": "/test.py", "changes": []}
        result = orchestrator.apply_improvement(proposal)
        if result.success:
            assert orchestrator.phase == EvolutionPhase.COMPLETE


class TestRecursiveOrchestratorHandleRejection:
    """Test 7: handle_rejection(reason) triggers iteration."""

    def test_handle_rejection_increments_iteration_count(self):
        """handle_rejection should increment iteration count."""
        orchestrator = RecursiveOrchestrator()
        initial_count = orchestrator.iteration_count
        orchestrator.handle_rejection("tests_failed")
        assert orchestrator.iteration_count == initial_count + 1

    def test_handle_rejection_sets_state_to_iterating(self):
        """handle_rejection should set state to ITERATING."""
        orchestrator = RecursiveOrchestrator()
        orchestrator.handle_rejection("tests_failed")
        assert orchestrator.state == EvolutionState.ITERATING

    def test_handle_rejection_sets_phase_to_idle(self):
        """handle_rejection should reset phase to IDLE for retry."""
        orchestrator = RecursiveOrchestrator()
        orchestrator.handle_rejection("tests_failed")
        assert orchestrator.phase == EvolutionPhase.IDLE

    def test_handle_rejection_records_reason(self):
        """handle_rejection should record rejection reason."""
        orchestrator = RecursiveOrchestrator()
        orchestrator.handle_rejection("tests_failed")
        assert len(orchestrator.rejection_history) > 0


class TestRecursiveOrchestratorRunEvolutionCycle:
    """Test the full run_evolution_cycle method."""

    def test_run_evolution_cycle_returns_evolution_result(self):
        """run_evolution_cycle should return EvolutionResult."""
        orchestrator = RecursiveOrchestrator()
        result = orchestrator.run_evolution_cycle("/test.py", max_iterations=1)
        assert isinstance(result, EvolutionResult)

    def test_run_evolution_cycle_respects_max_iterations(self):
        """run_evolution_cycle should respect max_iterations limit."""
        orchestrator = RecursiveOrchestrator()
        result = orchestrator.run_evolution_cycle("/test.py", max_iterations=2)
        assert orchestrator.iteration_count <= 2

    def test_run_evolution_cycle_sets_state_to_running(self):
        """run_evolution_cycle should set state to RUNNING during execution."""
        orchestrator = RecursiveOrchestrator()

        # Track state during execution
        states_observed = []

        original_propose = orchestrator.run_phase_propose

        def track_state(analysis):
            states_observed.append(orchestrator.state)
            return original_propose(analysis)

        orchestrator.run_phase_propose = track_state

        orchestrator.run_evolution_cycle("/test.py", max_iterations=1)
        assert EvolutionState.RUNNING in states_observed

    def test_run_evolution_cycle_returns_success_on_consensus(self):
        """run_evolution_cycle should return success when consensus achieved."""
        orchestrator = RecursiveOrchestrator()

        # Force consensus to succeed
        orchestrator.run_phase_consensus = lambda v: {"agreed": True}

        result = orchestrator.run_evolution_cycle("/test.py", max_iterations=1)
        assert result.consensus_achieved is True

    def test_run_evolution_cycle_fails_after_max_iterations(self):
        """run_evolution_cycle should fail after max_iterations exceeded."""
        orchestrator = RecursiveOrchestrator()

        # Force all validations to fail
        orchestrator.run_phase_validate = lambda p: {
            "passed": False,
            "tests_passed": 0,
            "tests_failed": 1,
        }

        result = orchestrator.run_evolution_cycle("/test.py", max_iterations=2)
        assert result.success is False
        assert orchestrator.iteration_count == 2


class TestRecursiveOrchestratorWithMocks:
    """Test RecursiveOrchestrator with mock dependencies."""

    def test_orchestrator_accepts_cognitive_ide(self):
        """RecursiveOrchestrator should accept cognitive_ide dependency."""
        mock_ide = MockCognitiveIDE()
        orchestrator = RecursiveOrchestrator(cognitive_ide=mock_ide)
        assert orchestrator.cognitive_ide is mock_ide

    def test_orchestrator_accepts_consensus_engine(self):
        """RecursiveOrchestrator should accept consensus_engine dependency."""
        mock_consensus = MockConsensusEngine()
        orchestrator = RecursiveOrchestrator(consensus_engine=mock_consensus)
        assert orchestrator.consensus_engine is mock_consensus

    def test_orchestrator_uses_cognitive_ide_for_introspection(self):
        """RecursiveOrchestrator should use cognitive_ide for introspection."""
        mock_ide = MockCognitiveIDE()
        orchestrator = RecursiveOrchestrator(cognitive_ide=mock_ide)
        orchestrator.run_phase_introspect("/test.py")
        assert mock_ide.introspect_called

    def test_orchestrator_uses_consensus_engine_for_consensus(self):
        """RecursiveOrchestrator should use consensus_engine for consensus."""
        mock_consensus = MockConsensusEngine()
        orchestrator = RecursiveOrchestrator(consensus_engine=mock_consensus)
        validation = {"passed": True}
        orchestrator.run_phase_consensus(validation)
        assert mock_consensus.check_consensus_called


# --- Mock Classes for Testing ---


class MockCognitiveIDE:
    """Mock cognitive IDE for testing."""

    def __init__(self):
        self.introspect_called = False
        self.last_file = None

    def introspect(self, file_path: str) -> Dict[str, Any]:
        """Mock introspection."""
        self.introspect_called = True
        self.last_file = file_path
        return {
            "file_path": file_path,
            "issues": ["complexity"],
            "suggestions": ["refactor"],
        }

    def propose(self, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Mock proposal generation."""
        return {
            "file_path": analysis["file_path"],
            "changes": ["refactor_function"],
            "improvement_plan": {"type": "refactor"},
        }

    def validate(self, proposal: Dict[str, Any]) -> Dict[str, Any]:
        """Mock validation."""
        return {
            "passed": True,
            "tests_passed": 10,
            "tests_failed": 0,
        }


class MockConsensusEngine:
    """Mock consensus engine for testing."""

    def __init__(self, should_agree: bool = True):
        self.check_consensus_called = False
        self.should_agree = should_agree

    def check_consensus(self, validation: Dict[str, Any]) -> Dict[str, Any]:
        """Mock consensus check."""
        self.check_consensus_called = True
        return {
            "agreed": self.should_agree,
            "votes": {"for": 3, "against": 0},
        }
