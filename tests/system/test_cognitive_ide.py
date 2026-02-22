import pytest
import asyncio
from systems.visual_shell.swarm.ide.cognitive_ide import CognitiveIDE
from systems.visual_shell.swarm.coordinator_agent import CoordinatorAgent
from systems.visual_shell.swarm.consciousness.consciousness_state import ConsciousnessState
from systems.visual_shell.swarm.consciousness.consensus_engine import ConsensusEngine

class TestCognitiveIDE:
    """Tests for the Cognitive IDE neural application."""

    @pytest.fixture
    def ide(self):
        coordinator = CoordinatorAgent()
        consciousness = ConsciousnessState()
        consensus = ConsensusEngine(agreement_threshold=0.8)
        return CognitiveIDE(coordinator, consciousness, consensus)

    @pytest.mark.asyncio
    async def test_session_lifecycle(self, ide):
        """IDE processes a coding session from prompt to completion."""
        session_id = await ide.create_session("Add rate limiting to the API")
        
        success = await ide.run_session(session_id)
        assert success is True
        
        status = ide.get_session_status(session_id)
        assert status["state"] == "complete"
        assert status["progress"] == 1.0

    @pytest.mark.asyncio
    async def test_consensus_requirement(self, ide):
        """IDE requires consensus on design before implementation."""
        # Mock consensus failure
        async def mock_fail(s): return False
        ide._verify_consensus = mock_fail
        
        session_id = await ide.create_session("Complex breaking change")
        success = await ide.run_session(session_id)
        
        assert success is False
        assert ide.active_sessions[session_id].state == "failed"

    def test_progress_calculation(self, ide):
        """IDE correctly calculates progress percentage based on state."""
        session_id = "test-1"
        from systems.visual_shell.swarm.ide.cognitive_ide import IDESession
        session = IDESession("test")
        ide.active_sessions[session_id] = session
        
        session.state = "research"
        assert ide._calculate_progress(session) == 0.0
        
        session.state = "implementation"
        assert ide._calculate_progress(session) == 0.5
        
        session.state = "complete"
        assert ide._calculate_progress(session) == 1.0
