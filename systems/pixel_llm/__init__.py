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

from .models import PixelLLM, VisionEncoder, LanguageDecoder, create_pixel_llm
from .trainer import PixelLLMTrainer, PixelLLMConfig
from .data import ImageTextDataset, create_dataloader
from .inference import generate_caption, beam_search_decode
from .lm_studio_integration import (
    VisionFeatureExtractor,
    HybridPixelLLM,
    extract_vision_features,
    generate_caption_with_lm_studio,
)
from .compositor import (
    CompositorConfig,
    CompositorIntegrator,
    quick_caption,
)

__all__ = [
    "PixelLLM",
    "VisionEncoder",
    "LanguageDecoder",
    "create_pixel_llm",
    "PixelLLMTrainer",
    "PixelLLMConfig",
    "ImageTextDataset",
    "create_dataloader",
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
