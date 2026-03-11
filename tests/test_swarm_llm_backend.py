"""Tests for Swarm LLM backend using PixelBrain."""

import pytest


def _is_pixel_brain_available():
    """Check if PixelBrain service is available."""
    try:
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend
        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()
        return backend.is_available()
    except Exception:
        return False


# Module-level check for skipif decorator
PIXEL_BRAIN_AVAILABLE = _is_pixel_brain_available()


class TestSwarmLLMBackend:
    """Test swarm agents use PixelBrain for inference."""

    def test_backend_initializes(self):
        """Backend should initialize."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()
        assert backend is not None

    def test_backend_has_generate(self):
        """Backend should have generate() method."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()
        assert hasattr(backend, 'generate')
        assert callable(backend.generate)

    def test_backend_uses_pixel_brain_service(self):
        """Backend should use PixelBrainService."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()
        # service attribute should exist (may be None if PixelBrain not available)
        assert hasattr(backend, 'service')

    def test_backend_is_available(self):
        """Backend should have is_available() method."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()
        assert hasattr(backend, 'is_available')
        assert callable(backend.is_available)
        # Should return a boolean
        result = backend.is_available()
        assert isinstance(result, bool)

    @pytest.mark.asyncio
    @pytest.mark.skipif(not PIXEL_BRAIN_AVAILABLE, reason="PixelBrain not available")
    async def test_backend_generate_returns_string(self):
        """Backend generate() should return string."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()

        result = await backend.generate("test", max_tokens=10)
        assert isinstance(result, str)

    @pytest.mark.asyncio
    @pytest.mark.skipif(not PIXEL_BRAIN_AVAILABLE, reason="PixelBrain not available")
    async def test_backend_generate_with_system_prompt(self):
        """Backend generate() should accept system_prompt."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()

        result = await backend.generate(
            "test",
            max_tokens=10,
            system_prompt="You are a helpful assistant."
        )
        assert isinstance(result, str)

    @pytest.mark.asyncio
    @pytest.mark.skipif(not PIXEL_BRAIN_AVAILABLE, reason="PixelBrain not available")
    async def test_backend_generate_code(self):
        """Backend should have generate_code() helper."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()

        result = await backend.generate_code("print hello", language="python")
        assert isinstance(result, str)

    @pytest.mark.asyncio
    @pytest.mark.skipif(not PIXEL_BRAIN_AVAILABLE, reason="PixelBrain not available")
    async def test_backend_analyze(self):
        """Backend should have analyze() helper."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()

        result = await backend.analyze("some code", "what does this do?")
        assert isinstance(result, str)

    def test_singleton_accessor(self):
        """get_swarm_llm_backend() should return singleton."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        b1 = get_swarm_llm_backend()
        b2 = get_swarm_llm_backend()
        assert b1 is b2

    def test_singleton_returns_same_instance_after_reset(self):
        """After reset, singleton should return new instance."""
        from systems.swarm.llm_backend import get_swarm_llm_backend, reset_swarm_llm_backend

        reset_swarm_llm_backend()
        b1 = get_swarm_llm_backend()
        reset_swarm_llm_backend()
        b2 = get_swarm_llm_backend()
        # After reset, should be different object
        assert b1 is not b2

    @pytest.mark.asyncio
    async def test_backend_generate_returns_unavailable_message_when_not_ready(self):
        """Backend should return helpful message when PixelBrain not available."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend

        reset_swarm_llm_backend()

        # Create backend without PixelBrain service
        backend = SwarmLLMBackend()
        backend.service = None  # Force unavailable

        result = await backend.generate("test", max_tokens=10)
        assert isinstance(result, str)
        assert "not available" in result.lower()


class TestSwarmLLMBackendCodeGeneration:
    """Test code generation helpers."""

    @pytest.mark.asyncio
    @pytest.mark.skipif(not PIXEL_BRAIN_AVAILABLE, reason="PixelBrain not available")
    async def test_generate_code_python(self):
        """Generate Python code from description."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend
        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()

        result = await backend.generate_code(
            "a function that adds two numbers",
            language="python"
        )
        assert isinstance(result, str)

    @pytest.mark.asyncio
    @pytest.mark.skipif(not PIXEL_BRAIN_AVAILABLE, reason="PixelBrain not available")
    async def test_generate_code_javascript(self):
        """Generate JavaScript code from description."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend
        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()

        result = await backend.generate_code(
            "a function that adds two numbers",
            language="javascript"
        )
        assert isinstance(result, str)

    @pytest.mark.asyncio
    @pytest.mark.skipif(not PIXEL_BRAIN_AVAILABLE, reason="PixelBrain not available")
    async def test_analyze_content(self):
        """Analyze content and answer question."""
        from systems.swarm.llm_backend import SwarmLLMBackend, reset_swarm_llm_backend
        reset_swarm_llm_backend()
        backend = SwarmLLMBackend()

        result = await backend.analyze(
            content="def hello(): print('world')",
            question="What does this function do?"
        )
        assert isinstance(result, str)
