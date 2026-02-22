"""
Compositor Integration API for Pixel LLM

Provides a simple API for integrating Pixel LLM with the Geometry OS compositor
for real-time image captioning and visual understanding.
"""

from typing import Optional, Dict, Any, List
from dataclasses import dataclass
import asyncio
from pathlib import Path

try:
    from ..lm_studio_integration import (
        VisionFeatureExtractor,
        extract_vision_features,
        generate_caption_with_lm_studio,
    )
    from ..inference import generate_caption
    from ..models import PixelLLM
except ImportError:
    # Fallback for standalone usage
    from pixel_llm.lm_studio_integration import (
        VisionFeatureExtractor,
        extract_vision_features,
        generate_caption_with_lm_studio,
    )
    from pixel_llm.inference import generate_caption
    from pixel_llm.models import PixelLLM


@dataclass
class CompositorConfig:
    """Configuration for compositor integration."""

    # Vision encoder settings
    encoder_type: str = "dinov2"  # dinov2, clip, or random
    device: str = "cuda"  # cuda, cpu, or mps
    image_size: int = 224

    # LM Studio settings
    lm_studio_base_url: str = "http://localhost:1234/v1"
    lm_studio_model: str = "qwen2.5-coder-7b-instruct"

    # Performance settings
    batch_size: int = 1
    max_concurrent_requests: int = 4
    cache_enabled: bool = True
    cache_size: int = 100

    # Captioning settings
    max_length: int = 100
    temperature: float = 0.7
    num_beams: int = 1


class CompositorIntegrator:
    """
    Simple integration API for Pixel LLM with the compositor.

    Provides a high-level interface for real-time image captioning
    and visual understanding in the Geometry OS compositor.

    Example:
        ```python
        from pixel_llm.compositor import CompositorIntegrator

        integrator = CompositorIntegrator()
        caption = await integrator.caption_frame(frame_np_array)
        print(caption)  # "A red square on a white background"
        ```
    """

    def __init__(
        self,
        config: Optional[CompositorConfig] = None,
        model: Optional[PixelLLM] = None,
    ):
        """
        Initialize the compositor integrator.

        Args:
            config: Configuration for the integrator. If None, uses defaults.
            model: Pre-trained PixelLLM model. If None, uses LM Studio integration.
        """
        self.config = config or CompositorConfig()
        self.model = model
        self._feature_extractor: Optional[VisionFeatureExtractor] = None
        self._feature_cache: Dict[str, Any] = {}
        self._initialized = False

    async def initialize(self) -> None:
        """Initialize the integrator and load models."""
        if self._initialized:
            return

        # Initialize vision feature extractor
        self._feature_extractor = VisionFeatureExtractor(
            encoder_type=self.config.encoder_type,
            device=self.config.device,
        )

        self._initialized = True

    async def caption_frame(
        self,
        frame,
        use_cache: bool = True,
    ) -> str:
        """
        Generate a caption for a single frame.

        Args:
            frame: Input frame (numpy array, PIL Image, or path to image)
            use_cache: Whether to use cached features for identical frames

        Returns:
            Generated caption string

        Example:
            ```python
            caption = await integrator.caption_frame(frame)
            # Returns: "A bright red square with rounded corners"
            ```
        """
        if not self._initialized:
            await self.initialize()

        # Extract vision features
        features = await self._extract_features(frame, use_cache=use_cache)

        # Generate caption using LM Studio
        caption = await generate_caption_with_lm_studio(
            features=features,
            base_url=self.config.lm_studio_base_url,
            model=self.config.lm_studio_model,
            max_length=self.config.max_length,
            temperature=self.config.temperature,
        )

        return caption

    async def caption_batch(
        self,
        frames: List,
        use_cache: bool = True,
    ) -> List[str]:
        """
        Generate captions for multiple frames in batch.

        Args:
            frames: List of input frames
            use_cache: Whether to use cached features

        Returns:
            List of generated captions

        Example:
            ```python
            captions = await integrator.caption_batch([frame1, frame2, frame3])
            # Returns: ["A red square", "A blue circle", "A green triangle"]
            ```
        """
        if not self._initialized:
            await self.initialize()

        captions = []
        for frame in frames:
            caption = await self.caption_frame(frame, use_cache=use_cache)
            captions.append(caption)

        return captions

    async def _extract_features(
        self,
        frame,
        use_cache: bool = True,
    ) -> Any:
        """
        Extract vision features from a frame.

        Args:
            frame: Input frame
            use_cache: Whether to use cached features

        Returns:
            Extracted vision features
        """
        # Generate cache key from frame
        cache_key = None
        if use_cache and self.config.cache_enabled:
            # Simple hash-based cache key (in production, use perceptual hash)
            if hasattr(frame, 'tobytes'):
                cache_key = hash(frame.tobytes())
            elif isinstance(frame, (str, Path)):
                cache_key = hash(str(frame))

            if cache_key and cache_key in self._feature_cache:
                return self._feature_cache[cache_key]

        # Extract features
        features = await extract_vision_features(
            frame,
            encoder_type=self.config.encoder_type,
            device=self.config.device,
        )

        # Cache features
        if cache_key and use_cache and self.config.cache_enabled:
            # Manage cache size
            if len(self._feature_cache) >= self.config.cache_size:
                # Remove oldest entry (simple FIFO)
                oldest_key = next(iter(self._feature_cache))
                del self._feature_cache[oldest_key]
            self._feature_cache[cache_key] = features

        return features

    def clear_cache(self) -> None:
        """Clear the feature cache."""
        self._feature_cache.clear()

    def get_cache_stats(self) -> Dict[str, int]:
        """
        Get statistics about the feature cache.

        Returns:
            Dictionary with cache statistics
        """
        return {
            "size": len(self._feature_cache),
            "max_size": self.config.cache_size,
            "enabled": self.config.cache_enabled,
        }

    async def shutdown(self) -> None:
        """Shutdown the integrator and release resources."""
        self._feature_extractor = None
        self._feature_cache.clear()
        self._initialized = False


# Convenience functions for quick integration

async def quick_caption(
    frame,
    encoder_type: str = "dinov2",
    device: str = "cuda",
    lm_studio_url: str = "http://localhost:1234/v1",
) -> str:
    """
    Quick caption generation without needing to manage the integrator.

    Args:
        frame: Input frame (numpy array, PIL Image, or path to image)
        encoder_type: Type of vision encoder to use
        device: Device to run on (cuda, cpu, or mps)
        lm_studio_url: URL for LM Studio API

    Returns:
        Generated caption string

    Example:
        ```python
        from pixel_llm.compositor import quick_caption

        caption = await quick_caption(frame)
        # One-line integration!
        ```
    """
    config = CompositorConfig(
        encoder_type=encoder_type,
        device=device,
        lm_studio_base_url=lm_studio_url,
    )
    integrator = CompositorIntegrator(config)
    try:
        return await integrator.caption_frame(frame)
    finally:
        await integrator.shutdown()


__all__ = [
    "CompositorConfig",
    "CompositorIntegrator",
    "quick_caption",
]
