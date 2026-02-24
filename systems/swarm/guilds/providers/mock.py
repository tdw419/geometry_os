# systems/swarm/guilds/providers/mock.py
"""Mock LLM provider for unit testing guild agents."""

from typing import AsyncIterator, Optional
from systems.swarm.guilds.providers.base import LLMProviderError


class MockProvider:
    """Mock LLM provider for unit testing guild agents."""

    def __init__(
        self,
        response: str = "# Mock generated code\npass",
        fail_with: Optional[str] = None
    ):
        self.name = "mock"
        self._response = response
        self._fail_with = fail_with

    async def generate(
        self,
        prompt: str,
        *,
        max_tokens: int = 2048,
        temperature: float = 0.7,
    ) -> str:
        """Generate mock response."""
        if self._fail_with:
            raise LLMProviderError(
                self._fail_with,
                provider=self.name,
                recoverable="rate limit" in self._fail_with.lower()
            )

        # Simulate token truncation (rough: 4 chars per token)
        max_chars = max_tokens * 4
        return self._response[:max_chars]

    async def generate_stream(
        self,
        prompt: str,
        **kwargs
    ) -> AsyncIterator[str]:
        """Stream mock response line by line."""
        for line in self._response.split("\n"):
            yield line
