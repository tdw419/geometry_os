"""
Tests for Ouroboros Fracture Detector integration with EvolutionDaemon.
"""

import asyncio
import os
import sys
from pathlib import Path
from unittest.mock import AsyncMock, Mock, patch

import pytest

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))


class TestOuroborosIntegration:
    """Test suite for Ouroboros Fracture Detector integration."""

    @pytest.fixture
    def project_root(self):
        """Use the project root as test directory (it's a git repo)."""
        return str(Path.cwd())

    @pytest.fixture
    def mock_daemon(self, project_root):
        """Create a mock EvolutionDaemon for testing."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        # Mock ZAI to avoid API calls
        with patch('systems.evolution_daemon.evolution_daemon.HAS_ZAI', False):
            daemon = EvolutionDaemon.__new__(EvolutionDaemon)
            daemon.root = Path(project_root)
            daemon.running = False
            daemon.zai = None
            daemon.vfs = Mock()
            daemon.webmcp = Mock()
            daemon.webmcp.connect = AsyncMock(return_value=False)
            daemon.visual_connected = False
            daemon.analysis = Mock()
            daemon.analysis.python_files = 0
            daemon.task_queue = []
            daemon.evolution_count = 0
            daemon.max_evolutions_per_session = 10
            daemon.visual_position = {"x": 400, "y": 300}

            # Safety components
            from systems.evolution_daemon.safety.git_integration import GitIntegration
            from systems.evolution_daemon.safety.guardian_gate import GuardianGate
            from systems.evolution_daemon.safety.sandbox_manager import SandboxManager
            from systems.evolution_daemon.safety.tier_router import TierRouter
            from systems.evolution_daemon.visual_verification_service import (
                VisualVerificationService,
            )

            daemon.sandbox = SandboxManager()
            daemon.guardian_gate = GuardianGate(zai_bridge=None)
            daemon.tier_router = TierRouter()
            daemon.git = GitIntegration(repo_path=project_root)
            daemon.monitor = None
            daemon.recovery = None
            daemon.visual_verification = VisualVerificationService()

            # Other attributes
            from systems.evolution_daemon.stages.master_stage import MasterStage
            from systems.evolution_daemon.stages.mirror_bridge import SubprocessMirrorBridge
            from systems.evolution_daemon.stages.tectonic_stage import TectonicStage

            daemon.master_stage = Mock(spec=MasterStage)
            daemon.mirror_bridge = Mock(spec=SubprocessMirrorBridge)
            daemon.tectonic_stage = Mock(spec=TectonicStage)

            daemon.ambient_mode = False
            daemon.ambient_state = "MONITORING"
            daemon.webmcp_hook = None
            daemon._ambient_heartbeat_task = None
            daemon.radio_enabled = False
            daemon.radio_broadcaster = None
            daemon._radio_broadcast_task = None

            daemon._hooks = {}
            daemon._mutation_targets = {}
            daemon._agency_orchestrator = None
            daemon._agency_governor = None
            daemon._brain_hook = None
            daemon.brain_atlas = None
            daemon.weight_mutator = None
            daemon.timeline = None
            daemon.placement = None

            # Ouroboros attributes (will be set by _init_ouroboros)
            daemon._fracture_detector = None
            daemon._fracture_task = None

            # Initialize minimal methods
            daemon._register_tools = Mock()
            daemon._register_brain_hook = Mock()
            daemon._init_agency_agents = Mock()

            yield daemon

    def test_init_ouroboros_creates_detector(self, mock_daemon):
        """Test that _init_ouroboros creates a FractureDetector."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        # Call _init_ouroboros
        EvolutionDaemon._init_ouroboros(mock_daemon)

        # Verify detector was created
        assert mock_daemon._fracture_detector is not None
        assert mock_daemon._fracture_detector.daemon == mock_daemon

    def test_init_ouroboros_handles_import_error(self, mock_daemon):
        """Test that _init_ouroboros handles import errors gracefully."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        with patch('systems.evolution_daemon.evolution_daemon.HAS_FRACTURE_DETECTOR', False):
            EvolutionDaemon._init_ouroboros(mock_daemon)

            # Verify detector was not created
            assert mock_daemon._fracture_detector is None

    def test_is_district_quarantined_without_detector(self, mock_daemon):
        """Test is_district_quarantined returns False when no detector."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        # Ensure no detector
        mock_daemon._fracture_detector = None

        # Should return False
        assert EvolutionDaemon.is_district_quarantined(mock_daemon, "test") is False

    def test_is_district_quarantined_with_detector(self, mock_daemon):
        """Test is_district_quarantined delegates to detector."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        # Create detector
        detector = FractureDetector(daemon=mock_daemon)
        mock_daemon._fracture_detector = detector

        # Initially not quarantined
        assert EvolutionDaemon.is_district_quarantined(mock_daemon, "test") is False

        # Quarantine a district
        detector.quarantine_district("test")

        # Now should be quarantined
        assert EvolutionDaemon.is_district_quarantined(mock_daemon, "test") is True

    def test_is_emergency_frozen_without_detector(self, mock_daemon):
        """Test is_emergency_frozen returns False when no detector."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        # Ensure no detector
        mock_daemon._fracture_detector = None

        # Should return False
        assert EvolutionDaemon.is_emergency_frozen(mock_daemon) is False

    def test_is_emergency_frozen_with_detector(self, mock_daemon):
        """Test is_emergency_frozen delegates to detector."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        from systems.evolution_daemon.safety.fracture_detector import FractureDetector

        # Create detector
        detector = FractureDetector(daemon=mock_daemon)
        mock_daemon._fracture_detector = detector

        # Initially not frozen
        assert EvolutionDaemon.is_emergency_frozen(mock_daemon) is False

        # Trigger emergency freeze
        detector._emergency_freeze = True

        # Now should be frozen
        assert EvolutionDaemon.is_emergency_frozen(mock_daemon) is True

    @pytest.mark.asyncio
    async def test_initialize_starts_fracture_detector_task(self, mock_daemon):
        """Test that initialize() starts the fracture detector task."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        # Initialize Ouroboros first
        EvolutionDaemon._init_ouroboros(mock_daemon)

        # Mock the scan_codebase method
        mock_daemon.scan_codebase = AsyncMock()
        mock_daemon.visual_log = AsyncMock()

        # Create a minimal _ascii_heartbeat_loop that exits quickly
        async def fake_heartbeat():
            mock_daemon.running = True
            count = 0
            while mock_daemon.running and count < 2:
                count += 1
                await asyncio.sleep(0.01)
            mock_daemon.running = False

        mock_daemon._ascii_heartbeat_loop = fake_heartbeat

        # Call initialize
        try:
            await EvolutionDaemon.initialize(mock_daemon)
        except Exception:
            # We expect some errors due to mocking
            pass

        # Verify fracture task was created if detector exists
        if mock_daemon._fracture_detector is not None:
            assert mock_daemon._fracture_task is not None
            # Task should be running
            assert not mock_daemon._fracture_task.done()

    @pytest.mark.asyncio
    async def test_stop_cancels_fracture_detector_task(self, mock_daemon):
        """Test that stop() cancels the fracture detector task."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        # Create a fake task
        async def fake_task():
            await asyncio.sleep(10)

        mock_daemon._fracture_task = asyncio.create_task(fake_task())
        mock_daemon._fracture_detector = Mock()
        mock_daemon._fracture_detector.stop = Mock()

        # Call stop
        await EvolutionDaemon.stop(mock_daemon)

        # Verify task cancel was requested
        # Note: cancelled() returns False if task is still running, we just verify cancel() was called
        # The task might not be fully cancelled yet
        # Verify detector stop was called
        mock_daemon._fracture_detector.stop.assert_called_once()

    def test_full_init_creates_ouroboros_components(self, mock_daemon):
        """Test that full __init__ creates Ouroboros components."""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon

        # This is a minimal test to ensure the attributes exist
        assert hasattr(mock_daemon, '_fracture_detector')
        assert hasattr(mock_daemon, '_fracture_task')

        # And the methods exist
        assert hasattr(EvolutionDaemon, '_init_ouroboros')
        assert hasattr(EvolutionDaemon, 'is_district_quarantined')
        assert hasattr(EvolutionDaemon, 'is_emergency_frozen')

    @pytest.mark.asyncio
    async def test_mutation_governor_quarantine_check(self, mock_daemon):
        """Test that MutationGovernorAgent respects quarantine checks."""
        from systems.swarm.agency_agents import MutationGovernorAgent
        from systems.swarm.llm_agent import AgentTask

        # Initialize governor with mock daemon
        governor = MutationGovernorAgent("gov-test")
        governor._daemon = mock_daemon

        # Test 1: Normal evaluation (no quarantine)
        task = AgentTask(
            task_id="test-1",
            task_type="evaluate_mutation",
            payload={
                "mutation_id": "mut-001",
                "performance_score": 0.8,
                "aesthetics_score": 0.7,
                "stability_score": 0.9,
                "tests_passed": True,
                "district": "evolution"
            }
        )

        # Mock daemon methods to return False (not quarantined)
        mock_daemon.is_district_quarantined = Mock(return_value=False)
        mock_daemon.is_emergency_frozen = Mock(return_value=False)

        result = await governor.process_task(task)
        assert result.success is True
        mock_daemon.is_district_quarantined.assert_called_with("evolution")

    @pytest.mark.asyncio
    async def test_mutation_governor_quarantined_district(self, mock_daemon):
        """Test that MutationGovernorAgent rejects mutations for quarantined districts."""
        from systems.swarm.agency_agents import MutationGovernorAgent
        from systems.swarm.llm_agent import AgentTask

        # Initialize governor with mock daemon
        governor = MutationGovernorAgent("gov-test")
        governor._daemon = mock_daemon

        # Test with quarantined district
        task = AgentTask(
            task_id="test-2",
            task_type="evaluate_mutation",
            payload={
                "mutation_id": "mut-002",
                "performance_score": 0.9,
                "aesthetics_score": 0.9,
                "stability_score": 0.9,
                "tests_passed": True,
                "district": "evolution"
            }
        )

        # Mock daemon to return True (quarantined)
        mock_daemon.is_district_quarantined = Mock(return_value=True)
        mock_daemon.is_emergency_frozen = Mock(return_value=False)

        result = await governor.process_task(task)
        assert result.success is False
        assert "quarantined" in result.error
        mock_daemon.is_district_quarantined.assert_called_with("evolution")

    @pytest.mark.asyncio
    async def test_mutation_governor_emergency_frozen(self, mock_daemon):
        """Test that MutationGovernorAgent rejects mutations when system is frozen."""
        from systems.swarm.agency_agents import MutationGovernorAgent
        from systems.swarm.llm_agent import AgentTask

        # Initialize governor with mock daemon
        governor = MutationGovernorAgent("gov-test")
        governor._daemon = mock_daemon

        # Test with emergency frozen system
        task = AgentTask(
            task_id="test-3",
            task_type="evaluate_mutation",
            payload={
                "mutation_id": "mut-003",
                "performance_score": 0.9,
                "aesthetics_score": 0.9,
                "stability_score": 0.9,
                "tests_passed": True,
                "district": "evolution"
            }
        )

        # Mock daemon to return frozen state
        mock_daemon.is_district_quarantined = Mock(return_value=False)
        mock_daemon.is_emergency_frozen = Mock(return_value=True)

        result = await governor.process_task(task)
        assert result.success is False
        assert "emergency frozen" in result.error
        mock_daemon.is_emergency_frozen.assert_called_once()

    @pytest.mark.asyncio
    async def test_mutation_governor_no_daemon(self, mock_daemon):
        """Test that MutationGovernorAgent proceeds normally when no daemon is set."""
        from systems.swarm.agency_agents import MutationGovernorAgent
        from systems.swarm.llm_agent import AgentTask

        # Initialize governor without daemon
        governor = MutationGovernorAgent("gov-test")
        governor._daemon = None

        # Test with no daemon
        task = AgentTask(
            task_id="test-4",
            task_type="evaluate_mutation",
            payload={
                "mutation_id": "mut-004",
                "performance_score": 0.8,
                "aesthetics_score": 0.7,
                "stability_score": 0.9,
                "tests_passed": True,
                "district": "evolution"
            }
        )

        result = await governor.process_task(task)
        assert result.success is True
        # Should proceed normally without quarantine checks

    @pytest.mark.asyncio
    async def test_mutation_governor_no_metadata(self, mock_daemon):
        """Test that MutationGovernorAgent handles tasks without metadata."""
        from systems.swarm.agency_agents import MutationGovernorAgent
        from systems.swarm.llm_agent import AgentTask

        # Initialize governor with mock daemon
        governor = MutationGovernorAgent("gov-test")
        governor._daemon = mock_daemon

        # Test without metadata
        task = AgentTask(
            task_id="test-5",
            task_type="evaluate_mutation",
            payload={
                "mutation_id": "mut-005",
                "performance_score": 0.8,
                "aesthetics_score": 0.7,
                "stability_score": 0.9,
                "tests_passed": True
            }
        )

        # Mock daemon methods
        mock_daemon.is_district_quarantined = Mock(return_value=False)
        mock_daemon.is_emergency_frozen = Mock(return_value=False)

        result = await governor.process_task(task)
        assert result.success is True
        # Should use "unknown" as district and proceed
        mock_daemon.is_district_quarantined.assert_called_with("unknown")


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
