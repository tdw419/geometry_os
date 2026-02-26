"""Tests for VibeAgentOrchestrator - multi-agent CLI for parallel evolution."""

import pytest
from unittest.mock import MagicMock, patch, AsyncMock
from systems.evolution_daemon.vibe_orchestrator import (
    VibeAgentOrchestrator,
    AgentTrack,
    VibeSession,
)


class TestVibeAgentOrchestrator:
    def test_orchestrator_initialization(self):
        """Orchestrator initializes with agent tracks."""
        orchestrator = VibeAgentOrchestrator()
        assert orchestrator is not None
        assert len(orchestrator.tracks) == 5  # Shader, Logic, Performance, Data, UI

    def test_agent_tracks_defined(self):
        """Agent tracks have correct specializations."""
        orchestrator = VibeAgentOrchestrator()

        assert AgentTrack.SHADER in orchestrator.tracks
        assert AgentTrack.LOGIC in orchestrator.tracks
        assert AgentTrack.PERFORMANCE in orchestrator.tracks
        assert AgentTrack.DATA in orchestrator.tracks
        assert AgentTrack.UI in orchestrator.tracks

        # Verify specialization descriptions
        assert "WGSL" in orchestrator.tracks[AgentTrack.SHADER] or "GLSL" in orchestrator.tracks[AgentTrack.SHADER]
        assert "algorithm" in orchestrator.tracks[AgentTrack.LOGIC].lower()
        assert "memory" in orchestrator.tracks[AgentTrack.PERFORMANCE].lower() or "optimization" in orchestrator.tracks[AgentTrack.PERFORMANCE].lower()

    @pytest.mark.asyncio
    async def test_start_vibe_session(self):
        """Can start a vibe coding session with parallel agents."""
        orchestrator = VibeAgentOrchestrator()

        session = await orchestrator.start_session(
            goal="Implement thermal shader with heat gradient",
            tracks=[AgentTrack.SHADER, AgentTrack.LOGIC],
        )

        assert session is not None
        assert session.status == "running"
        assert len(session.active_agents) == 2
        assert AgentTrack.SHADER in session.active_agents
        assert AgentTrack.LOGIC in session.active_agents
        assert session.goal == "Implement thermal shader with heat gradient"

    @pytest.mark.asyncio
    async def test_session_has_unique_id(self):
        """Each session gets a unique ID."""
        orchestrator = VibeAgentOrchestrator()

        session1 = await orchestrator.start_session(
            goal="Task 1",
            tracks=[AgentTrack.LOGIC],
        )
        session2 = await orchestrator.start_session(
            goal="Task 2",
            tracks=[AgentTrack.LOGIC],
        )

        assert session1.session_id != session2.session_id

    @pytest.mark.asyncio
    async def test_get_session_by_id(self):
        """Can retrieve a session by its ID."""
        orchestrator = VibeAgentOrchestrator()

        session = await orchestrator.start_session(
            goal="Test goal",
            tracks=[AgentTrack.LOGIC],
        )

        retrieved = orchestrator.get_session(session.session_id)
        assert retrieved is not None
        assert retrieved.session_id == session.session_id
        assert retrieved.goal == session.goal

    @pytest.mark.asyncio
    async def test_list_active_sessions(self):
        """Can list all active sessions."""
        orchestrator = VibeAgentOrchestrator()

        # Start multiple sessions
        await orchestrator.start_session("Goal 1", [AgentTrack.LOGIC])
        await orchestrator.start_session("Goal 2", [AgentTrack.SHADER])

        active = orchestrator.list_active_sessions()
        assert len(active) == 2

    @pytest.mark.asyncio
    async def test_agent_context_tracking(self):
        """Agents track their context during work."""
        orchestrator = VibeAgentOrchestrator()

        session = await orchestrator.start_session(
            goal="Complex task",
            tracks=[AgentTrack.LOGIC, AgentTrack.PERFORMANCE],
        )

        # Check agents have context
        for track, agent in session.active_agents.items():
            assert agent.track == track
            assert agent.status == "active"
            assert agent.current_task == "Complex task"

    @pytest.mark.asyncio
    async def test_shared_context_between_agents(self):
        """Agents can share context within a session."""
        orchestrator = VibeAgentOrchestrator()

        session = await orchestrator.start_session(
            goal="Collaborative task",
            tracks=[AgentTrack.LOGIC, AgentTrack.DATA],
        )

        # Verify shared context exists
        assert hasattr(session, 'shared_context')
        assert isinstance(session.shared_context, dict)

    @pytest.mark.asyncio
    async def test_wait_for_completion_timeout(self):
        """Wait for completion respects timeout."""
        orchestrator = VibeAgentOrchestrator()

        session = await orchestrator.start_session(
            goal="Test timeout",
            tracks=[AgentTrack.LOGIC],
        )

        # Agents won't complete, should timeout
        results = await orchestrator.wait_for_completion(session, timeout=0.5)
        assert session.status == "timeout"

    @pytest.mark.asyncio
    async def test_wait_for_completion_success(self):
        """Wait for completion returns results when agents finish."""
        orchestrator = VibeAgentOrchestrator()

        session = await orchestrator.start_session(
            goal="Test completion",
            tracks=[AgentTrack.LOGIC],
        )

        # Simulate agent completion
        for agent in session.active_agents.values():
            agent.status = "complete"
            session.add_agent_result(agent.track, {"status": "done"})

        results = await orchestrator.wait_for_completion(session, timeout=1.0)
        assert session.status == "complete"
        assert "logic" in results
