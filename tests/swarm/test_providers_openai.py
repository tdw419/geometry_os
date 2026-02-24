# tests/swarm/test_providers_openai.py
"""Tests for OpenAI LLM provider."""

import pytest
from unittest.mock import AsyncMock, patch, MagicMock
from systems.swarm.guilds.providers.openai import OpenAIProvider
from systems.swarm.guilds.providers.base import LLMProviderError


class TestOpenAIProvider:
    """Test OpenAI provider implementation."""

    def test_provider_name(self):
        """Provider name should be openai."""
        provider = OpenAIProvider(api_key="test-key")
        assert provider.name == "openai"

    def test_requires_api_key(self):
        """Provider should require API key."""
        with pytest.raises(ValueError, match="api_key"):
            OpenAIProvider()

    @pytest.mark.asyncio
    async def test_generate_calls_openai_api(self):
        """Generate should call OpenAI API correctly."""
        with patch("systems.swarm.guilds.providers.openai.AsyncOpenAI") as mock_client:
            mock_response = MagicMock()
            mock_response.choices = [MagicMock()]
            mock_response.choices[0].message.content = "def hello(): pass"

            mock_client.return_value.chat.completions.create = AsyncMock(
                return_value=mock_response
            )

            provider = OpenAIProvider(api_key="test-key")
            result = await provider.generate("Write a hello function")

            assert result == "def hello(): pass"
            mock_client.return_value.chat.completions.create.assert_called_once()

    @pytest.mark.asyncio
    async def test_generate_handles_rate_limit(self):
        """Should raise recoverable error on rate limit."""
        with patch("systems.swarm.guilds.providers.openai.AsyncOpenAI") as mock_client:
            mock_error = Exception("Rate limit exceeded")

            mock_client.return_value.chat.completions.create = AsyncMock(
                side_effect=mock_error
            )

            provider = OpenAIProvider(api_key="test-key")
            with pytest.raises(LLMProviderError) as exc_info:
                await provider.generate("prompt")

            assert exc_info.value.recoverable is True

    @pytest.mark.asyncio
    async def test_generate_handles_auth_error(self):
        """Should raise non-recoverable error on auth failure."""
        with patch("systems.swarm.guilds.providers.openai.AsyncOpenAI") as mock_client:
            mock_error = Exception("Invalid authentication")

            mock_client.return_value.chat.completions.create = AsyncMock(
                side_effect=mock_error
            )

            provider = OpenAIProvider(api_key="test-key")
            with pytest.raises(LLMProviderError) as exc_info:
                await provider.generate("prompt")

            assert exc_info.value.recoverable is False
