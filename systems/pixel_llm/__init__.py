"""
Pixel LLM - Vision-Language Model for Geometry OS

A pixel-level image-to-text model that processes images and generates
natural language descriptions using a vision encoder + language decoder
architecture.

Modules:
    models: Core model architecture (VisionEncoder, LanguageDecoder, PixelLLM)
    trainer: Training utilities for PixelLLM
    data: Dataset and preprocessing utilities
    inference: Text generation and inference utilities
    lm_studio_integration: LM Studio API integration for hybrid captioning
    compositor: Simple API for compositor integration
"""

__version__ = "0.1.0"

# Core modules that always exist
from .attention import SpatialAttentionPool
from .normalization import normalize_features

# Optional imports - modules may not be implemented yet
def __getattr__(name):
    """Lazy import for optional modules."""

    # Models module
    if name in ("PixelLLM", "VisionEncoder", "LanguageDecoder", "create_pixel_llm"):
        try:
            from .models import PixelLLM, VisionEncoder, LanguageDecoder, create_pixel_llm
            return locals()[name]
        except ImportError:
            raise ImportError(f"{name} requires models.py to be implemented")

    # Trainer module
    if name in ("PixelLLMTrainer", "PixelLLMConfig"):
        try:
            from .trainer import PixelLLMTrainer, PixelLLMConfig
            return locals()[name]
        except ImportError:
            raise ImportError(f"{name} requires trainer.py to be implemented")

    # Data module
    if name in ("ImageTextDataset", "create_dataloader"):
        try:
            from .data import ImageTextDataset, create_dataloader
            return locals()[name]
        except ImportError:
            raise ImportError(f"{name} requires data.py to be implemented")

    # Inference module
    if name in ("generate_caption", "beam_search_decode"):
        try:
            from .inference import generate_caption, beam_search_decode
            return locals()[name]
        except ImportError:
            raise ImportError(f"{name} requires inference.py to be implemented")

    # LM Studio integration
    if name in ("VisionFeatureExtractor", "HybridPixelLLM", "extract_vision_features", "generate_caption_with_lm_studio"):
        try:
            from .lm_studio_integration import (
                VisionFeatureExtractor,
                HybridPixelLLM,
                extract_vision_features,
                generate_caption_with_lm_studio,
            )
            return locals()[name]
        except ImportError:
            raise ImportError(f"{name} requires lm_studio_integration.py")

    # Compositor integration
    if name in ("CompositorConfig", "CompositorIntegrator", "quick_caption"):
        try:
            from .compositor import (
                CompositorConfig,
                CompositorIntegrator,
                quick_caption,
            )
            return locals()[name]
        except ImportError:
            raise ImportError(f"{name} requires compositor module")

    raise AttributeError(f"module {__name__!r} has no attribute {name!r}")


__all__ = [
    # Always available
    "SpatialAttentionPool",
    "normalize_features",
    # Models (optional)
    "PixelLLM",
    "VisionEncoder",
    "LanguageDecoder",
    "create_pixel_llm",
    # Trainer (optional)
    "PixelLLMTrainer",
    "PixelLLMConfig",
    # Data (optional)
    "ImageTextDataset",
    "create_dataloader",
    # Inference (optional)
    "generate_caption",
    "beam_search_decode",
    # LM Studio Integration
    "VisionFeatureExtractor",
    "HybridPixelLLM",
    "extract_vision_features",
    "generate_caption_with_lm_studio",
    # Compositor Integration
    "CompositorConfig",
    "CompositorIntegrator",
    "quick_caption",
]
