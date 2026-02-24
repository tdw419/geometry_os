# tests/swarm/test_providers_mock.py
"""Tests for mock LLM provider."""

import pytest
from systems.swarm.guilds.providers.mock import MockProvider
from systems.swarm.guilds.providers.base import LLMProviderError


class TestMockProvider:
    """Test MockProvider for testing."""

    def test_provider_has_name(self):
        """Provider should have a name."""
        provider = MockProvider()
        assert provider.name == "mock"

    @pytest.mark.asyncio
    async def test_generate_returns_fixed_response(self):
        """Mock generate returns predictable response."""
        provider = MockProvider(response="# Generated code\npass")
        result = await provider.generate("any prompt")
        assert result == "# Generated code\npass"

    @pytest.mark.asyncio
    async def test_generate_respects_max_tokens(self):
        """Mock provider respects max_tokens parameter."""
        provider = MockProvider(response="x" * 1000)
        result = await provider.generate("prompt", max_tokens=10)
        # Mock should truncate to simulate token limit
        assert len(result) <= 40  # ~4 chars per token rough estimate

    @pytest.mark.asyncio
    async def test_generate_can_simulate_failure(self):
        """Mock can simulate provider failure."""
        provider = MockProvider(fail_with="Rate limit exceeded")
        with pytest.raises(LLMProviderError) as exc_info:
            await provider.generate("prompt")
        assert "Rate limit" in str(exc_info.value)

    @pytest.mark.asyncio
    async def test_generate_stream_yields_chunks(self):
        """Mock streaming yields response in chunks."""
        provider = MockProvider(response="line1\nline2\nline3")
        chunks = []
        async for chunk in provider.generate_stream("prompt"):
            chunks.append(chunk)
        assert len(chunks) == 3
        assert chunks[0] == "line1"
