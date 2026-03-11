"""
Swarm Agent LLM Backend

Provides unified LLM access for all swarm agents using PixelBrain.
Agents no longer call external APIs - they use the native cognitive core.

Usage:
    backend = SwarmLLMBackend()
    code = await backend.generate_code("Write a sorting function")
"""

import logging

logger = logging.getLogger(__name__)


class SwarmLLMBackend:
    """
    LLM backend for swarm agents using PixelBrain native inference.

    This replaces any external API calls (OpenAI, Anthropic, LM Studio)
    with local GPU-accelerated inference.
    """

    def __init__(self):
        self.service = None
        self._initialize()

    def _initialize(self):
        """Initialize connection to PixelBrainService."""
        try:
            from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
            self.service = get_pixel_brain_service()
            logger.info("SwarmLLMBackend connected to PixelBrainService")
        except ImportError as e:
            logger.warning(f"PixelBrainService not available: {e}")
            self.service = None
        except Exception as e:
            logger.warning(f"Failed to initialize PixelBrainService: {e}")
            self.service = None

    def is_available(self) -> bool:
        """Check if backend is ready."""
        if self.service is None:
            return False
        return self.service.is_available()

    async def generate(
        self,
        prompt: str,
        max_tokens: int = 100,
        temperature: float = 0.7,
        system_prompt: str | None = None
    ) -> str:
        """
        Generate text completion.

        Args:
            prompt: Input prompt
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature
            system_prompt: Optional system prompt (prepended to main prompt)

        Returns:
            Generated text
        """
        if not self.is_available():
            return "[PixelBrain not available - check brain atlas]"

        full_prompt = prompt
        if system_prompt:
            full_prompt = f"{system_prompt}\n\n{prompt}"

        result = await self.service.generate(
            prompt=full_prompt,
            max_tokens=max_tokens,
            temperature=temperature,
            emit_visual=True
        )

        return result.get('text', '')

    async def generate_code(
        self,
        description: str,
        language: str = "python",
        max_tokens: int = 500
    ) -> str:
        """
        Generate code from description.

        Args:
            description: What code to generate
            language: Programming language
            max_tokens: Maximum tokens

        Returns:
            Generated code
        """
        prompt = f"Write {language} code that: {description}\n\nCode:"
        return await self.generate(prompt, max_tokens=max_tokens, temperature=0.3)

    async def analyze(
        self,
        content: str,
        question: str,
        max_tokens: int = 200
    ) -> str:
        """
        Analyze content and answer question.

        Args:
            content: Content to analyze
            question: Question about the content
            max_tokens: Maximum tokens

        Returns:
            Analysis result
        """
        prompt = f"Content:\n{content}\n\nQuestion: {question}\n\nAnswer:"
        return await self.generate(prompt, max_tokens=max_tokens, temperature=0.5)


# Global singleton
_backend_instance: SwarmLLMBackend | None = None


def get_swarm_llm_backend() -> SwarmLLMBackend:
    """Get global SwarmLLMBackend singleton."""
    global _backend_instance
    if _backend_instance is None:
        _backend_instance = SwarmLLMBackend()
    return _backend_instance


def reset_swarm_llm_backend():
    """Reset the singleton instance (for testing)."""
    global _backend_instance
    _backend_instance = None
