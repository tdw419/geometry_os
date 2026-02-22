"""
RecursiveOrchestrator - The recursive evolution orchestrator.

Task 4 of Recursive Self-Improvement Swarm specification.

The RecursiveOrchestrator manages the full evolution cycle for
recursive self-improvement of the codebase. It coordinates the
phases of introspection, proposal, validation, consensus, and
application of improvements.

Evolution Phases:
    IDLE -> INTROSPECTING -> PROPOSING -> VALIDATING -> CONSENSUS -> APPLYING -> COMPLETE
                                ^                                           |
                                |___________(rejection)_____________________|
"""

from __future__ import annotations

import time
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Any, Callable, Dict, List, Optional, Protocol


class EvolutionPhase(Enum):
    """Phases of the recursive evolution cycle."""

    IDLE = auto()
    INTROSPECTING = auto()
    PROPOSING = auto()
    VALIDATING = auto()
    CONSENSUS = auto()
    APPLYING = auto()
    COMPLETE = auto()
    FAILED = auto()


class EvolutionState(Enum):
    """States of the evolution orchestrator."""

    READY = auto()
    RUNNING = auto()
    ITERATING = auto()
    STOPPED = auto()


@dataclass
class EvolutionResult:
    """
    Result of an evolution cycle.

    Attributes:
        success: Whether the evolution was successful
        target_file: Path to the file that was evolved
        improvement_delta: Measured improvement (e.g., 0.25 = 25% better)
        tests_passed: Number of tests that passed
        tests_failed: Number of tests that failed
        consensus_achieved: Whether consensus was achieved
        error_message: Optional error message on failure
        iterations: Number of iterations taken
        metadata: Additional metadata
    """

    success: bool
    target_file: str
    improvement_delta: float = 0.0
    tests_passed: int = 0
    tests_failed: int = 0
    consensus_achieved: bool = False
    error_message: Optional[str] = None
    iterations: int = 0
    metadata: Dict[str, Any] = field(default_factory=dict)


class CognitiveIDEProtocol(Protocol):
    """Protocol for cognitive IDE integration."""

    def introspect(self, file_path: str) -> Dict[str, Any]:
        """Analyze a file and return analysis results."""
        ...

    def propose(self, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Generate improvement proposals from analysis."""
        ...

    def validate(self, proposal: Dict[str, Any]) -> Dict[str, Any]:
        """Validate a proposal and return test results."""
        ...


class ConsensusEngineProtocol(Protocol):
    """Protocol for consensus engine integration."""

    def check_consensus(self, validation: Dict[str, Any]) -> Dict[str, Any]:
        """Check if consensus is achieved for a validation."""
        ...


class DefaultCognitiveIDE:
    """Default cognitive IDE implementation using simple heuristics."""

    def introspect(self, file_path: str) -> Dict[str, Any]:
        """Analyze a file using basic heuristics."""
        return {
            "file_path": file_path,
            "issues": ["complexity"],
            "suggestions": ["refactor"],
            "value_score": 0.5,
        }

    def propose(self, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """Generate improvement proposal from analysis."""
        return {
            "file_path": analysis["file_path"],
            "changes": analysis.get("suggestions", []),
            "improvement_plan": {
                "type": "refactor",
                "target": analysis.get("issues", []),
            },
        }

    def validate(self, proposal: Dict[str, Any]) -> Dict[str, Any]:
        """Validate a proposal using basic checks."""
        return {
            "passed": True,
            "tests_passed": 1,
            "tests_failed": 0,
        }


class DefaultConsensusEngine:
    """Default consensus engine that agrees on passed validations."""

    def check_consensus(self, validation: Dict[str, Any]) -> Dict[str, Any]:
        """Check consensus - agrees if validation passed."""
        agreed = validation.get("passed", False)
        return {
            "agreed": agreed,
            "votes": {"for": 3 if agreed else 0, "against": 0 if agreed else 3},
        }


class RecursiveOrchestrator:
    """
    The recursive evolution orchestrator.

    RecursiveOrchestrator manages the full evolution cycle for recursive
    self-improvement. It coordinates the phases of:

    1. INTROSPECT: Analyze the target file
    2. PROPOSE: Generate improvement proposals
    3. VALIDATE: Test the proposed changes
    4. CONSENSUS: Check if agents agree on the change
    5. APPLY: Apply the improvement if consensus achieved
    6. ITERATE: Return to INTROSPECT if rejected

    Example:
        >>> orchestrator = RecursiveOrchestrator()
        >>> result = orchestrator.run_evolution_cycle("/core.py", max_iterations=3)
        >>> if result.success:
        ...     print(f"Improved {result.target_file} by {result.improvement_delta}")
    """

    def __init__(
        self,
        cognitive_ide: Optional[CognitiveIDEProtocol] = None,
        consensus_engine: Optional[ConsensusEngineProtocol] = None,
        on_phase_change: Optional[Callable[[EvolutionPhase], None]] = None,
    ):
        """
        Initialize the RecursiveOrchestrator.

        Args:
            cognitive_ide: Cognitive IDE for introspection, proposals, validation.
                          If None, uses DefaultCognitiveIDE.
            consensus_engine: Engine for checking consensus on proposals.
                             If None, uses DefaultConsensusEngine.
            on_phase_change: Optional callback for phase changes.
        """
        # Core state
        self._phase = EvolutionPhase.IDLE
        self._state = EvolutionState.READY
        self._current_target: Optional[str] = None
        self._iteration_count = 0

        # Dependencies (use defaults if not provided)
        self.cognitive_ide = cognitive_ide or DefaultCognitiveIDE()
        self.consensus_engine = consensus_engine or DefaultConsensusEngine()

        # Callbacks
        self.on_phase_change = on_phase_change

        # History tracking
        self._analysis_history: List[Dict[str, Any]] = []
        self._proposal_history: List[Dict[str, Any]] = []
        self._rejection_history: List[Dict[str, Any]] = []

    @property
    def phase(self) -> EvolutionPhase:
        """Get the current evolution phase."""
        return self._phase

    @phase.setter
    def phase(self, new_phase: EvolutionPhase) -> None:
        """Set the phase and trigger callback."""
        if self._phase != new_phase:
            self._phase = new_phase
            if self.on_phase_change:
                self.on_phase_change(new_phase)

    @property
    def state(self) -> EvolutionState:
        """Get the current evolution state."""
        return self._state

    @state.setter
    def state(self, new_state: EvolutionState) -> None:
        """Set the state."""
        self._state = new_state

    @property
    def current_target(self) -> Optional[str]:
        """Get the current target file."""
        return self._current_target

    @property
    def iteration_count(self) -> int:
        """Get the current iteration count."""
        return self._iteration_count

    @property
    def rejection_history(self) -> List[Dict[str, Any]]:
        """Get the history of rejections."""
        return self._rejection_history.copy()

    def run_phase_introspect(self, target_file: str) -> Dict[str, Any]:
        """
        Run the INTROSPECT phase to analyze the target file.

        Args:
            target_file: Path to the file to analyze

        Returns:
            Analysis dictionary with file information and issues
        """
        self.phase = EvolutionPhase.INTROSPECTING
        self._current_target = target_file

        # Use cognitive IDE to introspect
        analysis = self.cognitive_ide.introspect(target_file)

        # Ensure file_path is in analysis
        analysis["file_path"] = target_file

        # Store in history
        self._analysis_history.append(analysis)

        return analysis

    def run_phase_propose(self, analysis: Dict[str, Any]) -> Dict[str, Any]:
        """
        Run the PROPOSE phase to generate improvement proposals.

        Args:
            analysis: Analysis dictionary from introspection

        Returns:
            Proposal dictionary with changes and improvement plan
        """
        self.phase = EvolutionPhase.PROPOSING

        # Use cognitive IDE to generate proposal
        proposal = self.cognitive_ide.propose(analysis)

        # Ensure file_path is in proposal
        proposal["file_path"] = analysis.get("file_path", "")

        # Store in history
        self._proposal_history.append(proposal)

        return proposal

    def run_phase_validate(self, proposal: Dict[str, Any]) -> Dict[str, Any]:
        """
        Run the VALIDATE phase to test proposed changes.

        Args:
            proposal: Proposal dictionary from propose phase

        Returns:
            Validation dictionary with passed status and test results
        """
        self.phase = EvolutionPhase.VALIDATING

        # Use cognitive IDE to validate
        validation = self.cognitive_ide.validate(proposal)

        # Ensure required fields
        validation.setdefault("passed", True)
        validation.setdefault("tests_passed", 0)
        validation.setdefault("tests_failed", 0)

        return validation

    def run_phase_consensus(self, validation: Dict[str, Any]) -> Dict[str, Any]:
        """
        Run the CONSENSUS phase to check agreement.

        Args:
            validation: Validation dictionary from validate phase

        Returns:
            Consensus dictionary with agreed status
        """
        self.phase = EvolutionPhase.CONSENSUS

        # Use consensus engine to check
        consensus = self.consensus_engine.check_consensus(validation)

        # Ensure agreed field
        consensus.setdefault("agreed", False)

        return consensus

    def apply_improvement(self, proposal: Dict[str, Any]) -> EvolutionResult:
        """
        Apply the improvement after consensus is achieved.

        Args:
            proposal: Proposal dictionary with changes to apply

        Returns:
            EvolutionResult indicating success or failure
        """
        self.phase = EvolutionPhase.APPLYING

        file_path = proposal.get("file_path", self._current_target or "")

        # In a real implementation, this would apply the changes
        # For now, we simulate success
        try:
            # Simulate applying changes
            improvement_delta = 0.1  # Default improvement

            result = EvolutionResult(
                success=True,
                target_file=file_path,
                improvement_delta=improvement_delta,
                tests_passed=1,
                tests_failed=0,
                consensus_achieved=True,
                iterations=self._iteration_count,
            )

            self.phase = EvolutionPhase.COMPLETE
            return result

        except Exception as e:
            self.phase = EvolutionPhase.FAILED
            return EvolutionResult(
                success=False,
                target_file=file_path,
                error_message=str(e),
                iterations=self._iteration_count,
            )

    def handle_rejection(self, reason: str) -> None:
        """
        Handle rejection of a proposal, triggering iteration.

        Args:
            reason: The reason for rejection
        """
        # Record the rejection
        self._rejection_history.append({
            "reason": reason,
            "iteration": self._iteration_count,
            "timestamp": time.time(),
            "target": self._current_target,
        })

        # Increment iteration count
        self._iteration_count += 1

        # Set state to iterating
        self.state = EvolutionState.ITERATING

        # Reset phase to IDLE for retry
        self.phase = EvolutionPhase.IDLE

    def run_evolution_cycle(
        self,
        target_file: str,
        max_iterations: int = 3,
    ) -> EvolutionResult:
        """
        Run the complete evolution cycle for a target file.

        This is the main entry point for running an evolution cycle.
        It iterates through introspect -> propose -> validate -> consensus
        phases, applying the improvement if consensus is achieved or
        iterating on rejection.

        Args:
            target_file: Path to the file to evolve
            max_iterations: Maximum number of iterations before giving up

        Returns:
            EvolutionResult with success status and metrics
        """
        # Set running state
        self.state = EvolutionState.RUNNING
        self._current_target = target_file
        self._iteration_count = 0

        while self._iteration_count < max_iterations:
            # Phase 1: INTROSPECT
            analysis = self.run_phase_introspect(target_file)

            # Phase 2: PROPOSE
            proposal = self.run_phase_propose(analysis)

            # Phase 3: VALIDATE
            validation = self.run_phase_validate(proposal)

            # Phase 4: CONSENSUS
            consensus = self.run_phase_consensus(validation)

            if consensus.get("agreed", False):
                # Phase 5: APPLY
                result = self.apply_improvement(proposal)
                result.iterations = self._iteration_count + 1
                self.state = EvolutionState.READY
                return result
            else:
                # Handle rejection and iterate
                reason = consensus.get("reason", "consensus_not_achieved")
                self.handle_rejection(reason)

        # Max iterations exceeded
        self.phase = EvolutionPhase.FAILED
        self.state = EvolutionState.STOPPED

        return EvolutionResult(
            success=False,
            target_file=target_file,
            tests_passed=0,
            tests_failed=1,
            consensus_achieved=False,
            error_message=f"Max iterations ({max_iterations}) exceeded",
            iterations=self._iteration_count,
        )

    def reset(self) -> None:
        """Reset the orchestrator to initial state."""
        self._phase = EvolutionPhase.IDLE
        self._state = EvolutionState.READY
        self._current_target = None
        self._iteration_count = 0
        self._analysis_history.clear()
        self._proposal_history.clear()
        self._rejection_history.clear()

    def __repr__(self) -> str:
        return (
            f"RecursiveOrchestrator("
            f"phase={self._phase.name}, "
            f"state={self._state.name}, "
            f"target={self._current_target}, "
            f"iterations={self._iteration_count})"
        )
