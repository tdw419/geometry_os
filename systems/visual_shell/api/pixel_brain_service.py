"""
PixelBrain Universal Cognitive Service

A singleton service that provides all OS components access to the native
PixelBrain LLM inference pipeline. This replaces external LLM API calls
with GPU-accelerated local inference.

The service provides:
- tokenize/detokenize methods for text <-> token conversion
- async generate() for inference with optional visual feedback
- Integration with VisualBridge for THOUGHT_PULSE emissions
"""

import asyncio
import logging
from pathlib import Path
from typing import TYPE_CHECKING, Any, Optional

if TYPE_CHECKING:
    from systems.visual_shell.api.visual_bridge import VisualBridge
    from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

logger = logging.getLogger(__name__)

# Optional imports with graceful fallback
try:
    from transformers import AutoTokenizer
    TRANSFORMERS_AVAILABLE = True
except ImportError:
    TRANSFORMERS_AVAILABLE = False
    AutoTokenizer = None  # type: ignore

# Default brain path
DEFAULT_BRAIN_PATH = "/home/jericho/zion/projects/geometry_os/geometry_os/tinystories_brain.rts.png"

# Singleton instance
_pixel_brain_service_instance: Optional["PixelBrainService"] = None


class PixelBrainService:
    """
    Universal cognitive service for Geometry OS.

    Wraps PixelBrainPipeline in a singleton pattern with:
    - Tokenization support (transformers or character fallback)
    - Async generation with visual feedback
    - Integration with VisualBridge for THOUGHT_PULSE emissions

    Usage:
        service = get_pixel_brain_service()
        tokens = service.tokenize("Hello world")
        text = service.detokenize(tokens)
        result = await service.generate("Once upon a time", max_tokens=10)
    """

    _instance: Optional["PixelBrainService"] = None
    _initialized: bool = False

    def __new__(cls, *args, **kwargs) -> "PixelBrainService":
        """Singleton pattern - only one instance ever exists."""
        global _pixel_brain_service_instance

        if _pixel_brain_service_instance is not None:
            return _pixel_brain_service_instance

        instance = super().__new__(cls)
        _pixel_brain_service_instance = instance
        return instance

    def __init__(
        self,
        brain_path: str | None = None,
        visual_bridge: Optional["VisualBridge"] = None,
        tokenizer_name: str = "gpt2"
    ):
        """
        Initialize the PixelBrain service.

        Args:
            brain_path: Path to the RTS.PNG brain atlas. Defaults to tinystories_brain.rts.png
            visual_bridge: Optional VisualBridge for emitting THOUGHT_PULSE glyphs
            tokenizer_name: Name of the tokenizer to use (default: gpt2 for TinyStories compatibility)
        """
        # Prevent re-initialization of singleton
        if self._initialized:
            return

        self.brain_path = Path(brain_path or DEFAULT_BRAIN_PATH)
        self.visual_bridge = visual_bridge
        self.tokenizer_name = tokenizer_name

        self.pipeline: PixelBrainPipeline | None = None
        self._tokenizer: Any | None = None
        self._active_persona_monologue: str | None = None
        self._visual_feedback: dict[str, Any] = {
            "accessed_indices": [],
            "glyphs": []
        }

        self._initialize()
        self._initialized = True

    def set_persona(self, monologue: str) -> None:
        """Set the active persona monologue for future generations."""
        self._active_persona_monologue = monologue
        if self.pipeline:
            self.pipeline.active_persona_monologue = monologue
        logger.info("PixelBrain persona updated")

    def clear_persona(self) -> None:
        """Clear the active persona."""
        self._active_persona_monologue = None
        if self.pipeline:
            self.pipeline.active_persona_monologue = None
        logger.info("PixelBrain persona cleared")

    def _initialize(self) -> None:
        """Initialize pipeline and tokenizer."""
        self._initialize_tokenizer()
        self._initialize_pipeline()

    def _initialize_tokenizer(self) -> None:
        """Initialize tokenizer with transformers or fallback."""
        if not TRANSFORMERS_AVAILABLE:
            logger.info("transformers not available, using character-level tokenization fallback")
            self._tokenizer = None
            return

        try:
            self._tokenizer = AutoTokenizer.from_pretrained(self.tokenizer_name)
            logger.info(f"Loaded tokenizer: {self.tokenizer_name}")
        except Exception as e:
            logger.warning(f"Failed to load tokenizer {self.tokenizer_name}: {e}")
            self._tokenizer = None

    def _initialize_pipeline(self) -> None:
        """Initialize PixelBrain pipeline if brain atlas exists."""
        if not self.brain_path.exists():
            logger.warning(f"Brain atlas not found: {self.brain_path}")
            return

        meta_path = Path(str(self.brain_path) + ".meta.json")
        if not meta_path.exists():
            logger.warning(f"Brain metadata not found: {meta_path}")
            return

        try:
            from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
            self.pipeline = PixelBrainPipeline(
                str(self.brain_path),
                visual_bridge=self.visual_bridge
            )

            # Check if pipeline successfully initialized WGPU (pipelines created)
            if not self.pipeline._wgpu_initialized or not self.pipeline.pipelines:
                logger.error("PixelBrain pipeline failed to initialize WGPU pipelines")
                self.pipeline = None
                return

            logger.info(f"PixelBrain pipeline initialized: {self.brain_path}")
        except Exception as e:
            logger.error(f"Failed to initialize PixelBrain pipeline: {e}")
            self.pipeline = None

    def tokenize(self, text: str) -> list[int]:
        """
        Convert text to token IDs.

        Uses transformers tokenizer if available, otherwise falls back
        to character-level encoding.

        Args:
            text: Input text to tokenize

        Returns:
            List of token IDs
        """
        if self._tokenizer is not None:
            return self._tokenizer.encode(text)

        # Fallback: character-level encoding (ASCII/Unicode code points)
        return [ord(c) for c in text]

    def detokenize(self, tokens: list[int]) -> str:
        """
        Convert token IDs to text.

        Uses transformers tokenizer if available, otherwise falls back
        to character-level decoding.

        Args:
            tokens: List of token IDs

        Returns:
            Decoded text string
        """
        if self._tokenizer is not None:
            return self._tokenizer.decode(tokens)

        # Fallback: character-level decoding (ASCII/Unicode code points)
        return "".join(chr(t) if 0 <= t < 0x110000 else "?" for t in tokens)

    def is_available(self) -> bool:
        """
        Check if the PixelBrain service is available for inference.

        Returns:
            True if pipeline is initialized and ready
        """
        return self.pipeline is not None

    async def generate(
        self,
        prompt: str,
        max_tokens: int = 32,
        temperature: float = 1.0,
        emit_visual: bool = True
    ) -> dict[str, Any]:
        """
        Generate text asynchronously with optional visual feedback.

        This method tokenizes the prompt, runs inference through the
        PixelBrain pipeline, and emits THOUGHT_PULSE glyphs for visual
        feedback.

        Args:
            prompt: Input prompt text
            max_tokens: Maximum number of tokens to generate
            temperature: Sampling temperature (currently unused in greedy sampling)
            emit_visual: Whether to emit visual feedback via VisualBridge

        Returns:
            Dictionary containing:
            - text: Generated text
            - tokens: List of generated token IDs
            - visual_feedback: Dict with accessed_indices and glyphs (if emit_visual)
        """
        # Reset visual feedback for this generation
        self._visual_feedback = {
            "accessed_indices": [],
            "glyphs": []
        }

        if not self.is_available():
            logger.warning("PixelBrain not available, returning empty generation")
            return {
                "text": "",
                "tokens": [],
                "visual_feedback": self._visual_feedback
            }

        # Construct full prompt with persona if available
        full_prompt = prompt
        if self._active_persona_monologue:
            full_prompt = f"SYSTEM: {self._active_persona_monologue}\n\nUSER: {prompt}"

        # Tokenize prompt
        prompt_tokens = self.tokenize(full_prompt)

        # Limit prompt length to stay within context window
        if len(prompt_tokens) > 512:
            prompt_tokens = prompt_tokens[:512]

        # Generate tokens through pipeline
        generated_tokens: list[int] = []
        current_position = len(prompt_tokens)

        for i in range(max_tokens):
            # Run forward pass to get next token
            if self.pipeline is None:
                break

            # Generate next token using the pipeline
            new_tokens = self.pipeline.generate(
                prompt_tokens + generated_tokens,
                max_tokens=1
            )

            if not new_tokens:
                break

            next_token = new_tokens[0]
            generated_tokens.append(next_token)

            # Emit visual feedback
            if emit_visual and self.visual_bridge:
                await self._emit_token_visual(next_token, current_position + i)

            # Small delay for visual effect
            await asyncio.sleep(0.05)

        # Decode generated tokens
        generated_text = self.detokenize(generated_tokens)

        result = {
            "text": generated_text,
            "tokens": generated_tokens,
        }

        if emit_visual:
            result["visual_feedback"] = self._visual_feedback

        return result

    async def _emit_token_visual(self, token_id: int, position: int) -> None:
        """
        Emit visual feedback for a generated token.

        Args:
            token_id: The generated token ID
            position: Position in the sequence
        """
        if self.visual_bridge is None:
            return

        try:
            # Emit THOUGHT_PULSE glyph
            self.visual_bridge.emit_thought_pulse(
                token_id=token_id,
                position=(position * 20, 100),  # Simple horizontal layout
                intensity=1.0
            )

            # Track glyph in visual feedback
            self._visual_feedback["glyphs"].append({
                "token_id": token_id,
                "position": position,
                "intensity": 1.0
            })

            # Track accessed indices (simplified - would be actual atlas indices)
            self._visual_feedback["accessed_indices"].append(token_id)

        except Exception as e:
            logger.warning(f"Failed to emit visual feedback: {e}")


def get_pixel_brain_service(
    brain_path: str | None = None,
    visual_bridge: Optional["VisualBridge"] = None,
    tokenizer_name: str = "gpt2"
) -> PixelBrainService:
    """
    Get the singleton PixelBrainService instance.

    Args:
        brain_path: Path to brain atlas (only used on first call)
        visual_bridge: VisualBridge instance (only used on first call)
        tokenizer_name: Tokenizer name (only used on first call)

    Returns:
        The singleton PixelBrainService instance
    """
    global _pixel_brain_service_instance

    if _pixel_brain_service_instance is None:
        _pixel_brain_service_instance = PixelBrainService(
            brain_path=brain_path,
            visual_bridge=visual_bridge,
            tokenizer_name=tokenizer_name
        )

    return _pixel_brain_service_instance


def reset_pixel_brain_service() -> None:
    """
    Reset the singleton instance (for testing).
    """
    global _pixel_brain_service_instance
    _pixel_brain_service_instance = None
