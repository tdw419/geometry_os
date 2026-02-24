# systems/swarm/guilds/providers/base.py
"""Base classes for LLM providers."""

from typing import Protocol, AsyncIterator, runtime_checkable


class LLMProviderError(Exception):
    """Error from an LLM provider."""

    def __init__(
        self,
        message: str,
        *,
        provider: str,
        recoverable: bool = False
    ):
        super().__init__(f"[{provider}] {message}")
        self.provider = provider
        self.recoverable = recoverable


@runtime_checkable
class LLMProvider(Protocol):
    """Interface for LLM code generation providers."""

    name: str

    async def generate(
        self,
        prompt: str,
        *,
        max_tokens: int = 2048,
        temperature: float = 0.7,
    ) -> str:
        """Generate code from prompt."""
        ...

    async def generate_stream(
        self,
        prompt: str,
        **kwargs
    ) -> AsyncIterator[str]:
        """Stream code generation for long outputs."""
        ...
