"""
Tests for Swarm agents using native PixelBrain LLM backend.

Task 8.2: Migrate Swarm agents to use SwarmLLMBackend
- Tests that SwarmLLMBackend is importable and functional
- Tests singleton pattern works correctly
- Tests async generation capabilities
"""

import pytest
import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))


class TestSwarmLLMBackendImport:
    """Tests for SwarmLLMBackend import and initialization."""

    def test_llm_backend_importable(self):
        """SwarmLLMBackend should be importable from systems.swarm.llm_backend."""
        from systems.swarm.llm_backend import SwarmLLMBackend, get_swarm_llm_backend
        assert SwarmLLMBackend is not None
        assert callable(get_swarm_llm_backend)

    def test_backend_class_has_required_methods(self):
        """SwarmLLMBackend should have required interface methods."""
        from systems.swarm.llm_backend import SwarmLLMBackend

        # Check required methods exist
        assert hasattr(SwarmLLMBackend, 'is_available')
        assert hasattr(SwarmLLMBackend, 'generate')
        assert hasattr(SwarmLLMBackend, 'generate_code')
        assert hasattr(SwarmLLMBackend, 'analyze')

        # Check they're callable
        backend = SwarmLLMBackend()
        assert callable(backend.is_available)
        assert callable(backend.generate)
        assert callable(backend.generate_code)
        assert callable(backend.analyze)


class TestSwarmLLMBackendSingleton:
    """Tests for singleton pattern."""

    def test_get_swarm_llm_backend_returns_instance(self):
        """get_swarm_llm_backend should return a SwarmLLMBackend instance."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        # Reset to ensure clean state
        reset_swarm_llm_backend()

        backend = get_swarm_llm_backend()
        assert backend is not None

    def test_singleton_returns_same_instance(self):
        """get_swarm_llm_backend should return the same instance each time."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        reset_swarm_llm_backend()

        backend1 = get_swarm_llm_backend()
        backend2 = get_swarm_llm_backend()

        assert backend1 is backend2

    def test_reset_creates_new_instance(self):
        """reset_swarm_llm_backend should allow creating a new instance."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        backend1 = get_swarm_llm_backend()
        reset_swarm_llm_backend()
        backend2 = get_swarm_llm_backend()

        assert backend1 is not backend2


class TestSwarmLLMBackendGeneration:
    """Tests for LLM generation capabilities."""

    @pytest.mark.asyncio
    async def test_backend_can_generate_text(self):
        """Backend generate method should return a string."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = get_swarm_llm_backend()

        # This may skip if PixelBrain not available
        if not backend.is_available():
            pytest.skip("PixelBrain not available - skipping generation test")

        result = await backend.generate("test prompt", max_tokens=5)
        assert isinstance(result, str)

    @pytest.mark.asyncio
    async def test_backend_handles_unavailable_gracefully(self):
        """Backend should return fallback message when unavailable."""
        from systems.swarm.llm_backend import SwarmLLMBackend

        # Create backend that will be unavailable
        backend = SwarmLLMBackend()
        backend.service = None  # Force unavailable

        result = await backend.generate("test prompt", max_tokens=5)

        assert isinstance(result, str)
        assert "not available" in result.lower()

    @pytest.mark.asyncio
    async def test_backend_generate_code_returns_string(self):
        """Backend generate_code should return a string."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = get_swarm_llm_backend()

        if not backend.is_available():
            pytest.skip("PixelBrain not available")

        result = await backend.generate_code("add two numbers", max_tokens=50)
        assert isinstance(result, str)

    @pytest.mark.asyncio
    async def test_backend_analyze_returns_string(self):
        """Backend analyze should return a string."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = get_swarm_llm_backend()

        if not backend.is_available():
            pytest.skip("PixelBrain not available")

        result = await backend.analyze("sample content", "what is this?", max_tokens=20)
        assert isinstance(result, str)


class TestSwarmAgentIntegration:
    """Tests for swarm agent integration with native LLM."""

    def test_agent_can_import_backend(self):
        """Agents should be able to import and use the backend."""
        # This tests that the import path works from agent context
        from systems.swarm.llm_backend import (
            SwarmLLMBackend,
            get_swarm_llm_backend,
            reset_swarm_llm_backend
        )

        reset_swarm_llm_backend()
        backend = get_swarm_llm_backend()

        assert backend is not None
        assert hasattr(backend, 'generate')

    @pytest.mark.asyncio
    async def test_agent_style_generation(self):
        """Test agent-style generation with system prompts."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = get_swarm_llm_backend()

        if not backend.is_available():
            pytest.skip("PixelBrain not available")

        # Agent-style prompt with system context
        system_prompt = "You are a code reviewer agent. Be concise."
        result = await backend.generate(
            prompt="Review this code: def add(a, b): return a + b",
            system_prompt=system_prompt,
            max_tokens=50
        )

        assert isinstance(result, str)


class TestSwarmLLMBackendInterface:
    """Tests for interface compatibility with existing LLM clients."""

    def test_backend_has_is_available_method(self):
        """Backend should have is_available() method like LLMNarrativeClient."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = get_swarm_llm_backend()

        # Should return boolean
        result = backend.is_available()
        assert isinstance(result, bool)

    def test_backend_supports_temperature_parameter(self):
        """Backend should support temperature parameter for generation."""
        from systems.swarm.llm_backend import SwarmLLMBackend

        # Check method signature
        import inspect
        sig = inspect.signature(SwarmLLMBackend.generate)
        params = sig.parameters

        assert 'temperature' in params
        assert params['temperature'].default == 0.7

    def test_backend_supports_max_tokens_parameter(self):
        """Backend should support max_tokens parameter."""
        from systems.swarm.llm_backend import SwarmLLMBackend

        import inspect
        sig = inspect.signature(SwarmLLMBackend.generate)
        params = sig.parameters

        assert 'max_tokens' in params
        assert params['max_tokens'].default == 100

    def test_backend_supports_system_prompt_parameter(self):
        """Backend should support system_prompt parameter."""
        from systems.swarm.llm_backend import SwarmLLMBackend

        import inspect
        sig = inspect.signature(SwarmLLMBackend.generate)
        params = sig.parameters

        assert 'system_prompt' in params


class TestSwarmLLMAgentBase:
    """Tests for SwarmLLMAgent base class."""

    def test_agent_importable(self):
        """SwarmLLMAgent should be importable."""
        from systems.swarm.llm_agent import SwarmLLMAgent
        assert SwarmLLMAgent is not None

    def test_engineer_agent_importable(self):
        """EngineerAgent should be importable."""
        from systems.swarm.llm_agent import EngineerAgent
        assert EngineerAgent is not None

    def test_reviewer_agent_importable(self):
        """ReviewerAgent should be importable."""
        from systems.swarm.llm_agent import ReviewerAgent
        assert ReviewerAgent is not None

    def test_architect_agent_importable(self):
        """ArchitectAgent should be importable."""
        from systems.swarm.llm_agent import ArchitectAgent
        assert ArchitectAgent is not None

    def test_create_agent_factory(self):
        """create_agent factory should create correct agent types."""
        from systems.swarm.llm_agent import create_agent, EngineerAgent, ReviewerAgent, ArchitectAgent

        engineer = create_agent("engineer", "test-eng-1")
        assert isinstance(engineer, EngineerAgent)
        assert engineer.agent_id == "test-eng-1"

        reviewer = create_agent("reviewer", "test-rev-1")
        assert isinstance(reviewer, ReviewerAgent)

        architect = create_agent("architect", "test-arch-1")
        assert isinstance(architect, ArchitectAgent)

    def test_agent_has_system_prompt(self):
        """Agents should have system prompts defined."""
        from systems.swarm.llm_agent import create_agent

        engineer = create_agent("engineer", "test")
        prompt = engineer.get_system_prompt()
        assert prompt is not None
        assert "Engineer" in prompt

    def test_agent_lazy_loads_backend(self):
        """Agent should lazy-load the backend on first access."""
        from systems.swarm.llm_agent import create_agent
        from systems.swarm.llm_backend import reset_swarm_llm_backend

        reset_swarm_llm_backend()

        agent = create_agent("engineer", "test")
        # Backend should be None initially
        assert agent._backend is None

        # Accessing backend property should load it
        backend = agent.backend
        assert backend is not None

    def test_agent_task_dataclass(self):
        """AgentTask dataclass should work correctly."""
        from systems.swarm.llm_agent import AgentTask

        task = AgentTask(
            task_id="test-1",
            task_type="generate_code",
            payload={"description": "test"}
        )

        assert task.task_id == "test-1"
        assert task.task_type == "generate_code"
        assert task.priority == 0

    def test_agent_result_dataclass(self):
        """AgentResult dataclass should work correctly."""
        from systems.swarm.llm_agent import AgentResult

        result = AgentResult(
            task_id="test-1",
            success=True,
            output="done"
        )

        assert result.task_id == "test-1"
        assert result.success is True
        assert result.output == "done"


class TestSwarmLLMAgentAsync:
    """Async tests for SwarmLLMAgent."""

    @pytest.mark.asyncio
    async def test_engineer_agent_process_task(self):
        """EngineerAgent should process generate_code tasks."""
        from systems.swarm.llm_agent import create_agent, AgentTask

        agent = create_agent("engineer", "test-eng")

        task = AgentTask(
            task_id="task-1",
            task_type="generate_code",
            payload={"description": "add two numbers", "language": "python"}
        )

        result = await agent.run_task(task)

        assert result.task_id == "task-1"
        # Success depends on LLM availability, but should not crash

    @pytest.mark.asyncio
    async def test_reviewer_agent_process_task(self):
        """ReviewerAgent should process review_code tasks."""
        from systems.swarm.llm_agent import create_agent, AgentTask

        agent = create_agent("reviewer", "test-rev")

        task = AgentTask(
            task_id="task-2",
            task_type="review_code",
            payload={"code": "def add(a, b): return a + b"}
        )

        result = await agent.run_task(task)

        assert result.task_id == "task-2"
        # Should complete without error

    @pytest.mark.asyncio
    async def test_architect_agent_process_task(self):
        """ArchitectAgent should process design_module tasks."""
        from systems.swarm.llm_agent import create_agent, AgentTask

        agent = create_agent("architect", "test-arch")

        task = AgentTask(
            task_id="task-3",
            task_type="design_module",
            payload={"requirements": "Create a logging module"}
        )

        result = await agent.run_task(task)

        assert result.task_id == "task-3"

    @pytest.mark.asyncio
    async def test_agent_handles_unknown_task_type(self):
        """Agent should handle unknown task types gracefully."""
        from systems.swarm.llm_agent import create_agent, AgentTask

        agent = create_agent("engineer", "test")

        task = AgentTask(
            task_id="task-unknown",
            task_type="unknown_type",
            payload={}
        )

        result = await agent.run_task(task)

        assert result.success is False
        assert "Unknown task type" in result.error

    @pytest.mark.asyncio
    async def test_agent_generate_with_history(self):
        """Agent generate with history should include context."""
        from systems.swarm.llm_agent import create_agent

        agent = create_agent("engineer", "test")

        # First interaction
        await agent.generate("First prompt", max_tokens=10)

        # Second interaction with history
        result = await agent.generate("Second prompt", max_tokens=10, use_history=True)

        # History should be tracked
        assert len(agent._message_history) >= 2

    @pytest.mark.asyncio
    async def test_agent_clear_history(self):
        """Agent clear_history should reset message history."""
        from systems.swarm.llm_agent import create_agent

        agent = create_agent("engineer", "test")

        await agent.generate("Test", max_tokens=10)
        assert len(agent._message_history) > 0

        agent.clear_history()
        assert len(agent._message_history) == 0
