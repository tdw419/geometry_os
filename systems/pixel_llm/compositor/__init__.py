"""
Compositor Integration Module for Pixel LLM

This module provides simple integration APIs for using Pixel LLM with the
Geometry OS compositor for real-time image captioning and visual understanding.

Quick Start:
    ```python
    from pixel_llm.compositor import CompositorIntegrator, quick_caption

    # Option 1: Use the integrator for more control
    integrator = CompositorIntegrator()
    await integrator.initialize()
    caption = await integrator.caption_frame(frame)
    await integrator.shutdown()

    # Option 2: Use quick_caption for one-liner usage
    caption = await quick_caption(frame)
    ```

Components:
    - CompositorIntegrator: Main integration class for real-time captioning
    - CompositorConfig: Configuration for the integrator
    - quick_caption: Convenience function for simple use cases
"""

from .api import (
    CompositorConfig,
    CompositorIntegrator,
    quick_caption,
)

__all__ = [
    "CompositorConfig",
    "CompositorIntegrator",
    "quick_caption",
]

__version__ = "0.1.0"
