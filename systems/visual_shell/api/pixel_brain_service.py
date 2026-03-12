"""
PixelBrain Universal Cognitive Service

A singleton service that provides all OS components access to the native
PixelBrain LLM inference pipeline. This replaces external LLM API calls
with GPU-accelerated local inference.

The service provides:
- tokenize/detokenize methods for text <-> token conversion
- async generate() for inference with optional visual feedback
- Integration with VisualBridge for THOUGHT_PULSE emissions
- Frame-based caching to avoid redundant inference
- Batch processing support for multiple frames
- Performance metrics logging (latency, throughput)
"""

import asyncio
import logging
import time
from pathlib import Path
from typing import TYPE_CHECKING, Any, Optional

from systems.pixel_brain.async_inference import FrameCache, PerformanceMetrics

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

# Default brain path - FP16 GPT-Neo-125M with working attention
DEFAULT_BRAIN_PATH = "/home/jericho/zion/projects/geometry_os/geometry_os/gpt_neo_125m_brain_fp16.rts.png"

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
        tokenizer_name: str = "gpt2",
        frame_cache_size: int = 1000,
        metrics_log_interval: int = 100,
    ):
        """
        Initialize the PixelBrain service.

        Args:
            brain_path: Path to the RTS.PNG brain atlas. Defaults to tinystories_brain.rts.png
            visual_bridge: Optional VisualBridge for emitting THOUGHT_PULSE glyphs
            tokenizer_name: Name of the tokenizer to use (default: gpt2 for TinyStories compatibility)
            frame_cache_size: Maximum number of frames to cache for deduplication
            metrics_log_interval: Log performance metrics every N frames
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

        # Frame caching and performance metrics
        self._frame_cache = FrameCache(max_size=frame_cache_size)
        self._metrics = PerformanceMetrics(log_interval=metrics_log_interval)
        self._batch_size = 8  # Default batch size for batch processing

        self._initialize()
        self._initialized = True

    def set_visual_bridge(self, visual_bridge: Optional["VisualBridge"]) -> None:
        """
        Set or update the visual bridge for atlas glow visualization.

        This allows connecting the visual bridge after service initialization,
        enabling the Neural City UI to see weight access during inference.

        Args:
            visual_bridge: VisualBridge instance (from get_multi_vm_streamer())
        """
        self.visual_bridge = visual_bridge
        if self.pipeline:
            self.pipeline.visual_bridge = visual_bridge
        logger.info("PixelBrain visual bridge connected")

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
        emit_visual: bool = True,
        use_cache: bool = True,
        frame_data: Any | None = None,
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
            use_cache: Whether to use frame caching for deduplication
            frame_data: Optional frame data for caching (uses prompt if not provided)

        Returns:
            Dictionary containing:
            - text: Generated text
            - tokens: List of generated token IDs
            - visual_feedback: Dict with accessed_indices and glyphs (if emit_visual)
            - cache_hit: Whether result came from cache
        """
        start_time = time.time()

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
                "visual_feedback": self._visual_feedback,
                "cache_hit": False,
            }

        # Check frame cache if enabled
        cache_key = frame_data if frame_data is not None else prompt
        if use_cache:
            cached_result = await self._frame_cache.get(cache_key)
            if cached_result is not None:
                latency_ms = (time.time() - start_time) * 1000
                self._metrics.record_latency(latency_ms)
                self._metrics.record_frame(len(prompt.encode()))
                logger.debug(f"Frame cache hit for prompt: {prompt[:50]}...")
                cached_result["cache_hit"] = True
                return cached_result

        # Construct full prompt with persona if available
        full_prompt = prompt
        if self._active_persona_monologue:
            full_prompt = f"SYSTEM: {self._active_persona_monologue}\n\nUSER: {prompt}"

        # Tokenize prompt
        prompt_tokens = self.tokenize(full_prompt)

        # Limit prompt length to stay within context window
        if len(prompt_tokens) > 512:
            prompt_tokens = prompt_tokens[:512]

        # Clear KV-cache for clean generation state
        if hasattr(self.pipeline, 'clear_kv_cache'):
            self.pipeline.clear_kv_cache()

        # Generate tokens through pipeline (batch generation for efficiency)
        if self.pipeline is None:
            logger.warning("Pipeline not available")
            return {
                "text": "",
                "tokens": [],
                "visual_feedback": self._visual_feedback,
                "cache_hit": False,
            }

        # Use pipeline's batch generation - much faster than per-token calls
        generated_tokens = self.pipeline.generate(
            prompt_tokens,
            max_tokens=max_tokens
        )

        # Emit visual feedback for all generated tokens (non-blocking)
        if emit_visual and self.visual_bridge:
            current_position = len(prompt_tokens)
            for i, token in enumerate(generated_tokens):
                # Fire-and-forget visual emission
                asyncio.create_task(self._emit_token_visual(token, current_position + i))

        # Decode generated tokens
        generated_text = self.detokenize(generated_tokens)

        result = {
            "text": generated_text,
            "tokens": generated_tokens,
            "cache_hit": False,
        }

        if emit_visual:
            result["visual_feedback"] = self._visual_feedback

        # Record metrics
        latency_ms = (time.time() - start_time) * 1000
        self._metrics.record_latency(latency_ms)
        self._metrics.record_frame(len(prompt.encode()))

        # Cache result if caching enabled
        if use_cache:
            await self._frame_cache.put(cache_key, result)

        return result

    async def generate_batch(
        self,
        prompts: list[str],
        max_tokens: int = 32,
        temperature: float = 1.0,
        emit_visual: bool = False,
        use_cache: bool = True,
        batch_size: int | None = None,
    ) -> list[dict[str, Any]]:
        """
        Generate text for multiple prompts in batches.

        Processes prompts in configurable batch sizes for efficient
        GPU utilization while maintaining cache benefits.

        Args:
            prompts: List of input prompt texts
            max_tokens: Maximum tokens per generation
            temperature: Sampling temperature
            emit_visual: Whether to emit visual feedback
            use_cache: Whether to use frame caching
            batch_size: Override default batch size (uses self._batch_size if None)

        Returns:
            List of result dictionaries in same order as input prompts
        """
        actual_batch_size = batch_size or self._batch_size
        results: list[dict[str, Any]] = []

        for i in range(0, len(prompts), actual_batch_size):
            batch_prompts = prompts[i:i + actual_batch_size]

            # Process batch concurrently
            tasks = [
                self.generate(
                    prompt=p,
                    max_tokens=max_tokens,
                    temperature=temperature,
                    emit_visual=emit_visual,
                    use_cache=use_cache,
                )
                for p in batch_prompts
            ]
            batch_results = await asyncio.gather(*tasks)
            results.extend(batch_results)

            # Log cache stats every 100 frames
            if len(results) % 100 == 0:
                cache_stats = self._frame_cache.get_stats()
                logger.info(
                    f"PixelBrain frame cache stats at {len(results)} frames: "
                    f"hit_rate={cache_stats['hit_rate']:.2%}, "
                    f"hits={cache_stats['hits']}, misses={cache_stats['misses']}"
                )

        return results

    async def generate_stream(
        self,
        prompt: str,
        max_tokens: int = 32,
        temperature: float = 1.0,
        emit_visual: bool = True,
        use_cache: bool = False,  # Streaming typically doesn't use cache
    ):
        """
        Generate text with streaming output, yielding tokens as they are generated.

        This method provides real-time feedback during generation, useful for
        interactive applications or long-form generation.

        Args:
            prompt: Input prompt text
            max_tokens: Maximum number of tokens to generate
            temperature: Sampling temperature (currently unused)
            emit_visual: Whether to emit visual feedback
            use_cache: Whether to use frame caching (disabled by default for streaming)

        Yields:
            Dictionary containing:
            - token: The generated token ID
            - text: The decoded text for this token
            - position: Current position in sequence
        """
        if not self.is_available():
            return

        # Construct full prompt with persona if available
        full_prompt = prompt
        if self._active_persona_monologue:
            full_prompt = f"SYSTEM: {self._active_persona_monologue}\n\nUSER: {prompt}"

        # Tokenize prompt
        prompt_tokens = self.tokenize(full_prompt)

        # Limit prompt length
        if len(prompt_tokens) > 512:
            prompt_tokens = prompt_tokens[:512]

        # Clear KV-cache for clean generation
        if hasattr(self.pipeline, 'clear_kv_cache'):
            self.pipeline.clear_kv_cache()

        # Ingest prompt tokens (warm up KV-cache)
        for i, token in enumerate(prompt_tokens[:-1]):
            self.pipeline.forward(token, position=i)

        # Stream generated tokens
        current_token = prompt_tokens[-1] if prompt_tokens else 0
        start_pos = len(prompt_tokens) - 1

        for i in range(max_tokens):
            pos = start_pos + i
            logits = self.pipeline.forward(current_token, position=pos)
            next_token = int(np.argmax(logits)) if logits is not None else 0

            # Decode and yield
            token_text = self.detokenize([next_token])
            yield {
                "token": next_token,
                "text": token_text,
                "position": pos,
            }

            # Emit visual feedback
            if emit_visual and self.visual_bridge:
                asyncio.create_task(self._emit_token_visual(next_token, pos))

            current_token = next_token

            if pos >= 1023:  # MAX_SEQ_LEN - 1
                break

    async def generate_frames(
        self,
        frames: list[Any],
        prompts: list[str] | None = None,
        max_tokens: int = 32,
        temperature: float = 1.0,
        emit_visual: bool = False,
        batch_size: int | None = None,
    ) -> list[dict[str, Any]]:
        """
        Generate text for frame data with content-based caching.

        This method is optimized for processing visual frames where
        identical frames should skip redundant inference.

        Args:
            frames: List of frame data (bytes, numpy arrays, or objects with tobytes())
            prompts: Optional prompts per frame (uses default prompt if not provided)
            max_tokens: Maximum tokens per generation
            temperature: Sampling temperature
            emit_visual: Whether to emit visual feedback
            batch_size: Override default batch size

        Returns:
            List of result dictionaries
        """
        if prompts is None:
            prompts = ["Describe this frame"] * len(frames)

        actual_batch_size = batch_size or self._batch_size
        results: list[dict[str, Any]] = []

        for i in range(0, len(frames), actual_batch_size):
            batch_frames = frames[i:i + actual_batch_size]
            batch_prompts = prompts[i:i + actual_batch_size]

            tasks = [
                self.generate(
                    prompt=p,
                    max_tokens=max_tokens,
                    temperature=temperature,
                    emit_visual=emit_visual,
                    use_cache=True,
                    frame_data=f,
                )
                for f, p in zip(batch_frames, batch_prompts)
            ]
            batch_results = await asyncio.gather(*tasks)
            results.extend(batch_results)

            # Log cache stats every 100 frames
            if len(results) % 100 == 0:
                cache_stats = self._frame_cache.get_stats()
                logger.info(
                    f"PixelBrain frame cache stats at {len(results)} frames: "
                    f"hit_rate={cache_stats['hit_rate']:.2%}, "
                    f"hits={cache_stats['hits']}, misses={cache_stats['misses']}"
                )

        return results

    def set_batch_size(self, batch_size: int) -> None:
        """
        Set the default batch size for batch processing.

        Args:
            batch_size: New batch size (must be positive)
        """
        if batch_size < 1:
            raise ValueError("Batch size must be at least 1")
        self._batch_size = batch_size
        logger.info(f"PixelBrain batch size set to {batch_size}")

    def get_batch_size(self) -> int:
        """Get the current default batch size."""
        return self._batch_size

    def get_cache_stats(self) -> dict[str, Any]:
        """Get frame cache statistics including hit rate."""
        return self._frame_cache.get_stats()

    def get_performance_stats(self) -> dict[str, Any]:
        """Get performance metrics statistics."""
        return self._metrics.get_stats()

    def clear_cache(self) -> None:
        """Clear the frame cache."""
        asyncio.create_task(self._frame_cache.clear())
        logger.info("PixelBrain frame cache cleared")

    def reset_metrics(self) -> None:
        """Reset performance metrics."""
        self._metrics.reset()
        self._frame_cache.reset_stats()
        logger.info("PixelBrain metrics reset")

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
    tokenizer_name: str = "gpt2",
    frame_cache_size: int = 1000,
    metrics_log_interval: int = 100,
) -> PixelBrainService:
    """
    Get the singleton PixelBrainService instance.

    Args:
        brain_path: Path to brain atlas (only used on first call)
        visual_bridge: VisualBridge instance (only used on first call)
        tokenizer_name: Tokenizer name (only used on first call)
        frame_cache_size: Maximum cached frames (only used on first call)
        metrics_log_interval: Log metrics every N frames (only used on first call)

    Returns:
        The singleton PixelBrainService instance
    """
    global _pixel_brain_service_instance

    if _pixel_brain_service_instance is None:
        _pixel_brain_service_instance = PixelBrainService(
            brain_path=brain_path,
            visual_bridge=visual_bridge,
            tokenizer_name=tokenizer_name,
            frame_cache_size=frame_cache_size,
            metrics_log_interval=metrics_log_interval,
        )

    return _pixel_brain_service_instance


def reset_pixel_brain_service() -> None:
    """
    Reset the singleton instance (for testing).
    """
    global _pixel_brain_service_instance
    _pixel_brain_service_instance = None


def connect_visual_bridge_to_brain() -> bool:
    """
    Convenience function to connect the visual bridge to PixelBrain.

    This enables atlas glow visualization in the Neural City UI during
    inference. Call this after both the visual bridge and PixelBrain
    service are initialized.

    Returns:
        True if connection successful, False otherwise
    """
    try:
        from systems.visual_shell.api.visual_bridge import get_multi_vm_streamer
        service = get_pixel_brain_service()
        streamer = get_multi_vm_streamer()
        service.set_visual_bridge(streamer)
        logger.info("Visual bridge connected to PixelBrain for Neural City visualization")
        return True
    except Exception as e:
        logger.warning(f"Failed to connect visual bridge to PixelBrain: {e}")
        return False
