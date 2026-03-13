"""Sample Glyph Applications.

These are demo applications that run on the Glyph VM.

Available Apps:
- counter: Simple counter that increments on spacebar
- text_display: Text editor with keyboard input

Usage:
    from systems.spatial_coordinator.apps import AppLoader

    loader = AppLoader()
    loader.load_app("counter")
    loader.tick()
    print(loader.render_text(0))
"""

from .app_loader import AppLoader

__all__ = ['AppLoader']
