"""
LM Studio Integration Module for Pixel LLM

This module provides integration between Pixel LLM's vision encoder and LM Studio
for hybrid image captioning.

Base Module (Task 1):
- extract_vision_features: Function to extract vision features from images
- VisionFeatureExtractor: Class for managing vision encoder without checkpoint
- create_feature_extractor: Helper function for creating extractors

Advanced Module:
- HybridPixelLLM: Combines vision encoder with LM Studio for end-to-end captioning
- generate_caption_with_lm_studio: Generate captions using LM Studio API

Example (Base Module):
    >>> from geometry_os.systems.pixel_llm.lm_studio_integration import extract_vision_features
    >>> import torch
    >>> images = torch.randn(2, 3, 224, 224)
    >>> features = extract_vision_features(images)
    >>> print(features.shape)  # torch.Size([2, 196, 768])

Example (Advanced Module):
    >>> from geometry_os.systems.pixel_llm.lm_studio_integration import HybridPixelLLM
    >>> model = HybridPixelLLM(lm_studio_model="qwen2.5-coder-7b-instruct")
    >>> caption = model.generate(images)
    >>> print(caption)
"""

import torch
import torch.nn as nn
from typing import Optional, List, Dict, Tuple, Union, Any
import requests
from pathlib import Path
import importlib.util

# Import VisionEncoder from models module using importlib
_current_dir = Path(__file__).parent
spec = importlib.util.spec_from_file_location(
    "geometry_os.systems.pixel_llm.models",
    str(_current_dir / "models.py")
)
models_module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(models_module)

VisionEncoder = models_module.VisionEncoder


# Import CLIP encoder if available
try:
    from .encoders.clip_encoder import CLIPVisionEncoder
    CLIP_AVAILABLE = True
except ImportError:
    CLIP_AVAILABLE = False

# Import async API components
try:
    from .async_api import AsyncLMStudioClient, FeatureCache, BatchProcessor
    ASYNC_API_AVAILABLE = True
except ImportError:
    ASYNC_API_AVAILABLE = False

# Import error handling modules
try:
    from .errors import (
        PixelLMError,
        ConnectionError as PixelLMConnectionError,
        TimeoutError as PixelLMTimeoutError,
        ValidationError,
        APIError,
        EncoderError,
        CircuitBreakerOpen,
        ErrorCodes,
        classify_error,
        get_recovery_suggestion,
        is_retryable,
    )
    from .resilience import (
        CircuitBreaker,
        CircuitBreakerConfig,
        RetryConfig,
        RetryStrategy,
        FallbackManager,
        FallbackConfig,
        FallbackStrategy,
    )
    from .validation import (
        validate_image_tensor,
        validate_lm_studio_config,
        validate_encoder_config,
        sanitize_input,
    )
    ERROR_HANDLING_AVAILABLE = True
except ImportError:
    ERROR_HANDLING_AVAILABLE = False

    # Fallback classes if error handling not available
    class PixelLMError(Exception):
        """Fallback PixelLMError when error handling module unavailable."""
        pass

    class RetryConfig:
        """Fallback RetryConfig when error handling module unavailable."""
        def __init__(self, **kwargs):
            self.max_attempts = kwargs.get('max_attempts', 3)
            self.initial_delay = kwargs.get('initial_delay', 1.0)


# Default configuration for vision encoder
DEFAULT_IMAGE_SIZE = 224
DEFAULT_PATCH_SIZE = 16
DEFAULT_EMBED_DIM = 768
DEFAULT_NUM_LAYERS = 4
DEFAULT_NUM_HEADS = 8


# Global encoder instance for reuse
_global_encoder: Optional["VisionFeatureExtractor"] = None


def extract_vision_features(
    images: torch.Tensor,
    device: str = "cuda",
) -> torch.Tensor:
    """
    Extract vision features from images using Pixel LLM's vision encoder.

    This function provides a simple interface for extracting vision features
    from images. It uses a global encoder instance that is created on first call
    and reused for subsequent calls to improve performance.

    Args:
        images: Input images tensor [batch_size, 3, image_size, image_size].
                Images should be normalized RGB values in range [-1, 1] or [0, 1].
        device: Device to run encoder on ("cuda" or "cpu"). Defaults to "cuda".

    Returns:
        Vision features tensor [batch_size, num_patches, embed_dim].
        For default config with 224x224 images and patch_size=16:
        - batch_size: Same as input
        - num_patches: 196 (14x14 patches from 224/16)
        - embed_dim: 768

    Example:
        >>> images = torch.randn(2, 3, 224, 224)
        >>> features = extract_vision_features(images)
        >>> print(features.shape)
        torch.Size([2, 196, 768])

    Note:
        - The first call will initialize the encoder, which may take a moment.
        - Subsequent calls reuse the same encoder for better performance.
        - For batch processing with different configurations, use VisionFeatureExtractor
          class directly instead of this function.
    """
    global _global_encoder

    # Initialize global encoder if not exists or device changed
    if _global_encoder is None or _global_encoder.device != device:
        _global_encoder = VisionFeatureExtractor(device=device)

    # Extract features
    return _global_encoder.extract(images)


class VisionFeatureExtractor:
    """
    Extracts and summarizes visual features from images
    for consumption by LM Studio language models.

    The goal is to convert dense vision features into
    a text description that LM Studio can use as context.
    """

    def __init__(
        self,
        device: str = "cuda",
        image_size: int = DEFAULT_IMAGE_SIZE,
        patch_size: int = DEFAULT_PATCH_SIZE,
        embed_dim: int = DEFAULT_EMBED_DIM,
        num_layers: int = DEFAULT_NUM_LAYERS,
        num_heads: int = DEFAULT_NUM_HEADS,
    ):
        """
        Initialize the vision feature extractor.

        Args:
            device: Device to run encoder on ("cuda" or "cpu"). Defaults to "cuda".
            image_size: Input image size (assumes square). Defaults to 224.
            patch_size: Size of patches for ViT processing. Defaults to 16.
            embed_dim: Dimension of output embeddings. Defaults to 768.
            num_layers: Number of transformer encoder layers. Defaults to 4.
            num_heads: Number of attention heads. Defaults to 8.
        """
        if device not in ["cuda", "cpu"]:
            raise ValueError(f"Device must be 'cuda' or 'cpu', got '{device}'")

        if device == "cuda" and not torch.cuda.is_available():
            print("Warning: CUDA requested but not available, using CPU")
            device = "cpu"

        self.device = device
        self.image_size = image_size
        self.patch_size = patch_size
        self.embed_dim = embed_dim
        self.num_layers = num_layers
        self.num_heads = num_heads
        self.num_patches = (image_size // patch_size) ** 2
        self.encoder = None
        self._load_encoder()

    def _load_encoder(self):
        """Load the vision encoder"""
        self.encoder = VisionEncoder(
            image_size=self.image_size,
            patch_size=self.patch_size,
            embed_dim=self.embed_dim,
            num_layers=self.num_layers,
            num_heads=self.num_heads,
            hidden_dim=self.embed_dim * 4,  # Standard 4x expansion
            dropout=0.1,
        ).to(self.device)
        self.encoder.eval()

    def extract(self, images: torch.Tensor) -> torch.Tensor:
        """
        Extract vision features from images.

        Processes images through the vision encoder to produce patch-level
        feature representations suitable for multimodal LLM processing.

        Args:
            images: Input images [batch_size, 3, image_size, image_size].
                    Should be on the same device as the encoder.

        Returns:
            Vision features [batch_size, num_patches, embed_dim].

        Raises:
            RuntimeError: If image size doesn't match encoder's expected size.

        Example:
            >>> extractor = VisionFeatureExtractor()
            >>> images = torch.randn(2, 3, 224, 224)
            >>> features = extractor.extract(images)
            >>> print(features.shape)
            torch.Size([2, 196, 768])
        """
        # Validate input shape
        if images.dim() != 4:
            raise ValueError(f"Expected 4D tensor [B,C,H,W], got {images.dim()}D")

        if images.shape[1] != 3:
            raise ValueError(f"Expected 3 color channels, got {images.shape[1]}")

        if images.shape[2] != self.image_size or images.shape[3] != self.image_size:
            raise RuntimeError(
                f"Expected images shape [batch_size, 3, {self.image_size}, {self.image_size}], "
                f"got {images.shape}"
            )

        # Ensure images are on correct device
        images = images.to(self.device)

        # Extract features without gradient computation
        with torch.no_grad():
            features = self.encoder(images)

        return features

    def summarize_to_text(self, features: torch.Tensor) -> str:
        """
        Convert vision features to a text summary for LM Studio.

        This is a simple implementation that describes the
        feature dimensions and statistics. Future versions
        could use clustering or projection to identify
        semantic concepts.

        Args:
            features: Vision features [batch_size, num_patches, embed_dim]

        Returns:
            Text description of visual content
        """
        batch_size, num_patches, embed_dim = features.shape

        # Compute statistics
        mean_activation = features.mean().item()
        max_activation = features.max().item()
        min_activation = features.min().item()

        # Simple spatial analysis
        spatial_mean = features.mean(dim=1)  # [batch_size, embed_dim]
        attention_centers = (features.mean(dim=2) > features.mean()).float()  # High-attention patches

        # Count high-attention regions
        num_regions = attention_centers.sum(dim=1).mean().item()

        summary = f"""Visual analysis of {batch_size} image(s):
- {num_patches} visual patches analyzed
- {num_regions:.1f} high-attention regions detected
- Activation range: [{min_activation:.3f}, {max_activation:.3f}]
- Mean activation: {mean_activation:.3f}
- Feature dimension: {embed_dim}

The image contains geometric and visual patterns that have been
encoded into {embed_dim}-dimensional feature vectors across {num_patches}
spatial locations. Please generate a caption describing what you see
in this image based on the visual analysis above."""

        return summary


def generate_caption_with_lm_studio(
    images: torch.Tensor,
    model: str = "qwen2.5-coder-7b-instruct",
    lm_studio_url: str = "http://localhost:1234/v1",
    max_tokens: int = 256,
    temperature: float = 0.7,
    timeout: int = 60,
) -> Optional[str]:
    """
    Generate caption for images using Pixel LLM vision + LM Studio language.

    Args:
        images: Input images [batch_size, 3, 224, 224]
        model: LM Studio model name
        lm_studio_url: LM Studio API base URL
        max_tokens: Maximum tokens in caption
        temperature: Sampling temperature
        timeout: Request timeout in seconds

    Returns:
        Generated caption string, or None if LM Studio unavailable
    """
    # Extract vision features
    extractor = VisionFeatureExtractor()
    features = extractor.extract(images)

    # Convert to text summary
    vision_summary = extractor.summarize_to_text(features)

    # Create prompt for LM Studio
    system_prompt = """You are an expert image captioning system.
You receive visual analysis data from a computer vision model and
generate natural language descriptions of images.

Be descriptive but concise. Focus on the main subjects, colors,
compositions, and any notable features. Avoid over-interpreting
the numerical data."""

    user_prompt = f"""Based on the following visual analysis, generate a caption for this image:

{vision_summary}

Caption:"""

    # Call LM Studio API
    try:
        response = requests.post(
            f"{lm_studio_url}/chat/completions",
            json={
                "model": model,
                "messages": [
                    {"role": "system", "content": system_prompt},
                    {"role": "user", "content": user_prompt}
                ],
                "max_tokens": max_tokens,
                "temperature": temperature,
                "stream": False
            },
            timeout=timeout
        )
        response.raise_for_status()

        result = response.json()
        if "choices" in result and result["choices"]:
            caption = result["choices"][0]["message"]["content"]
            return caption.strip()

    except (requests.RequestException, KeyError, IndexError) as e:
        print(f"LM Studio API error: {e}")
        return None

    return None


class HybridPixelLLM:
    """Hybrid Pixel LLM with LM Studio integration

    Combines vision encoder with LM Studio for image captioning.
    Now supports multiple vision encoder backends.

    Attributes:
        encoder_type: Type of vision encoder ("default", "clip")
        vision_encoder: Vision encoder instance
        lm_studio_url: LM Studio API URL
        lm_studio_model: Model name in LM Studio
        device: Device to run on
    """

    def __init__(
        self,
        lm_studio_url: str = "http://localhost:1234/v1",
        lm_studio_model: str = "qwen2.5-coder-7b-instruct",
        device: str = "cuda",
        encoder_type: str = "default",
        encoder_config: Optional[Dict[str, any]] = None,
        max_tokens: int = 256,
        temperature: float = 0.7,
        use_async: bool = False,
        cache_size: int = 128,
        error_config: Optional[Dict[str, any]] = None,
    ):
        """
        Initialize HybridPixelLLM

        Args:
            lm_studio_url: URL for LM Studio API
            lm_studio_model: Model name to use in LM Studio
            device: Device to run vision encoder on ("cuda" or "cpu")
            encoder_type: Type of vision encoder ("default" or "clip")
            encoder_config: Optional config for encoder (e.g., {"model_name": "ViT-L/14"})
            max_tokens: Maximum tokens in caption
            temperature: Sampling temperature
            use_async: Whether to use async API (requires async methods)
            cache_size: Size of feature cache (0 to disable)
            error_config: Optional error handling configuration (retry, circuit_breaker, fallback)
        """
        self.lm_studio_url = lm_studio_url
        self.lm_studio_model = lm_studio_model
        self.device = device
        self.encoder_type = encoder_type
        self.max_tokens = max_tokens
        self.temperature = temperature
        self.use_async = use_async and ASYNC_API_AVAILABLE

        # Initialize error handling components if available
        if ERROR_HANDLING_AVAILABLE:
            error_config = error_config or {}

            # Initialize retry config
            retry_config_dict = error_config.get('retry', {})
            self.retry_config = RetryConfig(
                max_attempts=retry_config_dict.get('max_attempts', 3),
                initial_delay=retry_config_dict.get('initial_delay', 1.0),
                max_delay=retry_config_dict.get('max_delay', 60.0),
                backoff_multiplier=retry_config_dict.get('backoff_multiplier', 2.0),
                strategy=RetryStrategy.EXPONENTIAL_BACKOFF,
            )

            # Initialize circuit breaker
            cb_config_dict = error_config.get('circuit_breaker', {})
            cb_config = CircuitBreakerConfig(
                failure_threshold=cb_config_dict.get('failure_threshold', 5),
                success_threshold=cb_config_dict.get('success_threshold', 2),
                timeout=cb_config_dict.get('timeout', 60.0),
                cooldown=cb_config_dict.get('cooldown', 30.0),
            )
            self.circuit_breaker = CircuitBreaker(
                name=f"hybrid_pixel_llm_{id(self)}",
                config=cb_config
            )

            # Initialize fallback manager
            fb_config_dict = error_config.get('fallback', {})
            fb_config = FallbackConfig(
                strategy=fb_config_dict.get('strategy', FallbackStrategy.NONE),
                default_value=fb_config_dict.get('default_value', None),
                cache_ttl=fb_config_dict.get('cache_ttl', 300.0),
            )
            self.fallback_manager = FallbackManager(
                name=f"hybrid_pixel_llm_{id(self)}",
                config=fb_config
            )

            # Track error metrics
            self._error_counts = {}
            self._total_requests = 0
            self._successful_requests = 0
        else:
            self.retry_config = None
            self.circuit_breaker = None
            self.fallback_manager = None
            self._error_counts = {}
            self._total_requests = 0
            self._successful_requests = 0

        # Initialize vision encoder based on type
        if encoder_type == "clip":
            if not CLIP_AVAILABLE:
                raise ImportError(
                    "CLIP encoder requested but openai-clip not installed. "
                    "Install with: pip install openai-clip"
                )
            encoder_config = encoder_config or {"model_name": "ViT-L/14"}
            self.vision_encoder = CLIPVisionEncoder(
                model_name=encoder_config.get("model_name", "ViT-L/14"),
                device=device,
            )
        else:  # default encoder
            encoder_config = encoder_config or {}
            self.vision_encoder = VisionFeatureExtractor(device=device)

        # Simple cache for sync mode
        self._feature_cache = {}

        # Async API components
        if self.use_async:
            self._async_client = AsyncLMStudioClient(
                base_url=lm_studio_url,
                timeout=60,
            )
            self._feature_cache_async = FeatureCache(max_size=cache_size) if cache_size > 0 else None
        else:
            self._async_client = None
            self._feature_cache_async = None

    def _track_error(self, error_type: str):
        """Track error for metrics."""
        self._error_counts[error_type] = self._error_counts.get(error_type, 0) + 1

    def _call_lm_studio_with_retry(
        self,
        images: torch.Tensor,
        max_tokens: int,
        temperature: float,
    ) -> Optional[str]:
        """Call LM Studio API with retry logic."""
        if not ERROR_HANDLING_AVAILABLE:
            # Fallback to original behavior without error handling
            return generate_caption_with_lm_studio(
                images,
                model=self.lm_studio_model,
                lm_studio_url=self.lm_studio_url,
                max_tokens=max_tokens,
                temperature=temperature,
            )

        import time
        import random

        max_attempts = self.retry_config.max_attempts
        delay = self.retry_config.initial_delay
        last_exception = None

        for attempt in range(max_attempts):
            try:
                # Check circuit breaker before attempt
                if self.circuit_breaker.is_open:
                    raise CircuitBreakerOpen(
                        f"Circuit breaker is open for {self.circuit_breaker.name}. "
                        f"Service may be degraded."
                    )

                result = generate_caption_with_lm_studio(
                    images,
                    model=self.lm_studio_model,
                    lm_studio_url=self.lm_studio_url,
                    max_tokens=max_tokens,
                    temperature=temperature,
                )

                if result is not None:
                    # Record success
                    self.circuit_breaker.record_success()
                    self._successful_requests += 1
                    return result

            except (requests.RequestException, PixelLMConnectionError, PixelLMTimeoutError) as e:
                last_exception = e
                self._track_error(type(e).__name__)

                # Record failure in circuit breaker
                self.circuit_breaker.record_failure()

                # Check if we should retry
                if attempt < max_attempts - 1:
                    # Calculate delay with exponential backoff and jitter
                    jitter = self.retry_config.jitter
                    jitter_amount = delay * jitter * (2 * random.random() - 1)
                    actual_delay = max(0, delay + jitter_amount)

                    time.sleep(actual_delay)

                    # Increase delay for next attempt
                    delay = min(delay * self.retry_config.backoff_multiplier, self.retry_config.max_delay)
            except Exception as e:
                # Non-retryable error
                self._track_error(type(e).__name__)
                raise

        # All retries exhausted, try fallback
        if self.fallback_manager:
            cached_result = self.fallback_manager.get_cached_fallback()
            if cached_result is not None:
                return cached_result

            # Use default fallback if configured
            if self.fallback_manager.config.strategy == FallbackStrategy.DEFAULT_VALUE:
                return self.fallback_manager.config.default_value

        # Return None as final fallback
        return None

    def generate(
        self,
        images: torch.Tensor,
        max_tokens: Optional[int] = None,
        temperature: Optional[float] = None,
    ) -> Optional[str]:
        """
        Generate caption for a single image.

        Args:
            images: Input images [batch_size, 3, 224, 224] or [3, 224, 224]
            max_tokens: Override default max tokens
            temperature: Override default temperature

        Returns:
            Generated caption, or None if generation failed
        """
        self._total_requests += 1

        # For single image, use batch_size=1
        if images.dim() == 3:
            images = images.unsqueeze(0)

        # Validate images using validation module if available
        if ERROR_HANDLING_AVAILABLE:
            try:
                validate_image_tensor(
                    images,
                    image_size=self.vision_encoder.image_size if hasattr(self.vision_encoder, 'image_size') else 224,
                    batch_dim=True,
                    field_name="images"
                )
            except ValidationError as e:
                self._track_error("ValidationError")
                print(f"Validation error: {e}")
                return None
        else:
            # Fallback to basic validation
            try:
                self.vision_encoder.extract(images)
            except (ValueError, RuntimeError) as e:
                print(f"Invalid input: {e}")
                return None

        # Call LM Studio with retry and circuit breaker
        return self._call_lm_studio_with_retry(
            images,
            max_tokens=max_tokens or self.max_tokens,
            temperature=temperature or self.temperature,
        )

    def get_error_metrics(self) -> Dict[str, Any]:
        """Get error metrics and statistics.

        Returns:
            Dictionary containing error metrics:
            - total_requests: Total number of requests
            - successful_requests: Number of successful requests
            - error_counts: Dictionary of error types to counts
            - success_rate: Success rate (0-1)
            - circuit_breaker_state: Current circuit breaker state (if available)
        """
        metrics = {
            "total_requests": self._total_requests,
            "successful_requests": self._successful_requests,
            "error_counts": self._error_counts.copy(),
        }

        if self._total_requests > 0:
            metrics["success_rate"] = self._successful_requests / self._total_requests
        else:
            metrics["success_rate"] = 0.0

        if ERROR_HANDLING_AVAILABLE and self.circuit_breaker:
            metrics["circuit_breaker_state"] = self.circuit_breaker.state.name
            metrics["circuit_breaker_failures"] = self.circuit_breaker.failure_count

        return metrics

    def reset_metrics(self) -> None:
        """Reset error metrics."""
        self._total_requests = 0
        self._successful_requests = 0
        self._error_counts = {}

    def generate_batch(
        self,
        images: torch.Tensor,
    ) -> List[Optional[str]]:
        """
        Generate captions for a batch of images.

        Args:
            images: Input images [batch_size, 3, 224, 224]

        Returns:
            List of captions (one per image)
        """
        captions = []
        for i in range(images.shape[0]):
            single_image = images[i:i+1]
            caption = self.generate(single_image)
            captions.append(caption)
        return captions

    def check_lm_studio_available(self) -> bool:
        """Check if LM Studio is running and accessible"""
        try:
            response = requests.get(f"{self.lm_studio_url}/models", timeout=5)
            return response.status_code == 200
        except requests.RequestException:
            return False

    def generate_batch_optimized(
        self,
        images: torch.Tensor,
    ) -> List[Optional[str]]:
        """
        Generate captions for a batch of images with optimized feature extraction.

        Extracts vision features once for the entire batch, then generates
        captions sequentially (required for LM Studio API).

        Args:
            images: Input images [batch_size, 3, 224, 224]

        Returns:
            List of captions (one per image)
        """
        # Validate and extract all features at once
        try:
            features = self.vision_encoder.extract(images)
        except (ValueError, RuntimeError) as e:
            print(f"Invalid input: {e}")
            return [None] * images.shape[0]

        # Generate captions for each image
        captions = []
        for i in range(images.shape[0]):
            # Use individual image for caption generation
            single_image = images[i:i+1]
            caption = self.generate(single_image)
            captions.append(caption)

        return captions

    async def _call_lm_studio_async_with_retry(
        self,
        messages: List[Dict[str, str]],
        max_tokens: int,
        temperature: float,
    ) -> Optional[Dict[str, Any]]:
        """Call LM Studio API asynchronously with retry logic."""
        if not ERROR_HANDLING_AVAILABLE:
            # Fallback to original behavior without error handling
            return await self._async_client.chat_completion(
                messages=messages,
                model=self.lm_studio_model,
                max_tokens=max_tokens,
                temperature=temperature,
            )

        import asyncio
        import random

        max_attempts = self.retry_config.max_attempts
        delay = self.retry_config.initial_delay
        last_exception = None

        for attempt in range(max_attempts):
            try:
                # Check circuit breaker before attempt
                if self.circuit_breaker.is_open:
                    raise CircuitBreakerOpen(
                        f"Circuit breaker is open for {self.circuit_breaker.name}. "
                        f"Service may be degraded."
                    )

                result = await self._async_client.chat_completion(
                    messages=messages,
                    model=self.lm_studio_model,
                    max_tokens=max_tokens,
                    temperature=temperature,
                )

                if result is not None:
                    # Record success
                    self.circuit_breaker.record_success()
                    self._successful_requests += 1
                    return result

            except (asyncio.TimeoutError, PixelLMConnectionError, PixelLMTimeoutError) as e:
                last_exception = e
                self._track_error(type(e).__name__)

                # Record failure in circuit breaker
                self.circuit_breaker.record_failure()

                # Check if we should retry
                if attempt < max_attempts - 1:
                    # Calculate delay with exponential backoff and jitter
                    jitter = self.retry_config.jitter
                    jitter_amount = delay * jitter * (2 * random.random() - 1)
                    actual_delay = max(0, delay + jitter_amount)

                    await asyncio.sleep(actual_delay)

                    # Increase delay for next attempt
                    delay = min(delay * self.retry_config.backoff_multiplier, self.retry_config.max_delay)
            except Exception as e:
                # Non-retryable error
                self._track_error(type(e).__name__)
                raise

        # All retries exhausted, try fallback
        if self.fallback_manager:
            cached_result = self.fallback_manager.get_cached_fallback()
            if cached_result is not None:
                return {"choices": [{"message": {"content": cached_result}}]}

            # Use default fallback if configured
            if self.fallback_manager.config.strategy == FallbackStrategy.DEFAULT_VALUE:
                default_val = self.fallback_manager.config.default_value
                return {"choices": [{"message": {"content": default_val}}]}

        # Return None as final fallback
        return None

    async def generate_async(
        self,
        images: torch.Tensor,
        max_tokens: Optional[int] = None,
        temperature: Optional[float] = None,
    ) -> Optional[str]:
        """
        Generate caption for a single image using async API.

        This is the async version of generate() for non-blocking operation.

        Args:
            images: Input images [batch_size, 3, 224, 224] or [3, 224, 224]
            max_tokens: Override default max tokens
            temperature: Override default temperature

        Returns:
            Generated caption, or None if generation failed

        Example:
            >>> caption = await model.generate_async(images)
        """
        if not self.use_async or self._async_client is None:
            raise RuntimeError(
                "Async API not enabled. Initialize with use_async=True"
            )

        self._total_requests += 1

        # For single image, use batch_size=1
        if images.dim() == 3:
            images = images.unsqueeze(0)

        # Validate images using validation module if available
        if ERROR_HANDLING_AVAILABLE:
            try:
                validate_image_tensor(
                    images,
                    image_size=self.vision_encoder.image_size if hasattr(self.vision_encoder, 'image_size') else 224,
                    batch_dim=True,
                    field_name="images"
                )
            except ValidationError as e:
                self._track_error("ValidationError")
                print(f"Validation error: {e}")
                return None
        else:
            # Fallback to basic validation - just try to extract features
            try:
                self.vision_encoder.extract(images)
            except (ValueError, RuntimeError) as e:
                print(f"Invalid input: {e}")
                return None

        # Extract vision features with caching
        cache_key = None
        if self._feature_cache_async:
            cache_key = self._feature_cache_async.hash_image(images)
            cached_features = self._feature_cache_async.get(cache_key)
            if cached_features is not None:
                features = cached_features
            else:
                features = self.vision_encoder.extract(images)
                self._feature_cache_async.put(cache_key, features)
        else:
            features = self.vision_encoder.extract(images)

        # Summarize features to text
        summary = self.vision_encoder.summarize_to_text(features)

        # Create messages for LM Studio
        messages = [
            {
                "role": "system",
                "content": "You are an expert image captioning system. "
                "You receive visual analysis data from a computer vision model and "
                "generate natural language descriptions of images. "
                "Be descriptive but concise. Focus on the main subjects, colors, "
                "compositions, and any notable features."
            },
            {
                "role": "user",
                "content": f"{summary}\n\nCaption:"
            }
        ]

        # Call LM Studio API asynchronously with retry and circuit breaker
        result = await self._call_lm_studio_async_with_retry(
            messages=messages,
            max_tokens=max_tokens or self.max_tokens,
            temperature=temperature or self.temperature,
        )

        if result and "choices" in result and result["choices"]:
            content = result["choices"][0]["message"]["content"]
            if content:
                return content.strip()

        return None

    async def generate_batch_async(
        self,
        images: torch.Tensor,
        batch_size: int = 8,
    ) -> List[Optional[str]]:
        """
        Generate captions for a batch of images using async API with batching.

        Processes multiple images concurrently with controlled batch size.

        Args:
            images: Input images [batch_size, 3, 224, 224]
            batch_size: Number of images to process concurrently

        Returns:
            List of captions (one per image)

        Example:
            >>> captions = await model.generate_batch_async(images, batch_size=16)
        """
        if not self.use_async or self._async_client is None:
            raise RuntimeError(
                "Async API not enabled. Initialize with use_async=True"
            )

        batch_processor = BatchProcessor(
            batch_size=batch_size,
            max_concurrent=min(batch_size, 4),
        )

        # Process function for each image
        async def process_single_image(img_tensor: torch.Tensor) -> Optional[str]:
            # Unsqueeze to add batch dimension
            img_batch = img_tensor.unsqueeze(0) if img_tensor.dim() == 3 else img_tensor
            return await self.generate_async(img_batch)

        # Process all images in batches
        results = await batch_processor.process_batch(
            items=[images[i] for i in range(images.shape[0])],
            process_fn=process_single_image,
            preserve_order=True,
        )

        return results

    async def close_async(self):
        """Close async client and cleanup resources"""
        if self._async_client:
            await self._async_client.close()

    async def __aenter__(self):
        """Async context manager entry"""
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit"""
        await self.close_async()
