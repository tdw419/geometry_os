# systems/swarm/guilds/providers/openai.py
"""OpenAI LLM provider implementation."""

import os
from typing import AsyncIterator, Optional
from systems.swarm.guilds.providers.base import LLMProviderError

# For mocking in tests
AsyncOpenAI = None


def _get_openai():
    global AsyncOpenAI
    if AsyncOpenAI is None:
        try:
            from openai import AsyncOpenAI as _AsyncOpenAI
            AsyncOpenAI = _AsyncOpenAI
        except ImportError:
            pass
    return AsyncOpenAI


class OpenAIProvider:
    """OpenAI API provider for code generation."""

    def __init__(
        self,
        api_key: Optional[str] = None,
        model: str = "gpt-4",
    ):
        if not api_key:
            api_key = os.environ.get("OPENAI_API_KEY")
        if not api_key:
            raise ValueError("OpenAI API key required (api_key or OPENAI_API_KEY env)")

        self.name = "openai"
        self._api_key = api_key
        self._model = model
        self._client = None

    def _get_client(self):
        """Lazy initialization of OpenAI client."""
        if self._client is None:
            AsyncOpenAI = _get_openai()
            if not AsyncOpenAI:
                raise LLMProviderError(
                    "openai package not installed. Run: pip install openai",
                    provider=self.name,
                    recoverable=False
                )
            self._client = AsyncOpenAI(api_key=self._api_key)
        return self._client

    async def generate(
        self,
        prompt: str,
        *,
        max_tokens: int = 2048,
        temperature: float = 0.7,
    ) -> str:
        """Generate code using OpenAI API."""
        client = self._get_client()

        try:
            response = await client.chat.completions.create(
                model=self._model,
                messages=[
                    {
                        "role": "system",
                        "content": "You are a code generator. Return only code, no explanations."
                    },
                    {"role": "user", "content": prompt}
                ],
                max_tokens=max_tokens,
                temperature=temperature,
            )
            return response.choices[0].message.content

        except Exception as e:
            error_str = str(e).lower()
            error_name = type(e).__name__
            is_rate_limit = "rate" in error_str or "429" in error_str
            is_auth = "auth" in error_str or "401" in error_str

            raise LLMProviderError(
                str(e),
                provider=self.name,
                recoverable=is_rate_limit and not is_auth
            )

    async def generate_stream(
        self,
        prompt: str,
        **kwargs
    ) -> AsyncIterator[str]:
        """Stream code generation (not implemented for OpenAI yet)."""
        result = await self.generate(prompt, **kwargs)
        yield result
