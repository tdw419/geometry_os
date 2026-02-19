"""
ASCII Scene Graph - Zero-cost AI perception through ASCII visualization.

This module provides ASCII renderers for Neural City, Visual Shell, and
Evolution pipeline states, enabling instant AI understanding without VLM
screenshot processing.

Architecture:
- Renderers implement hook interfaces (NeuralCityHook, VisualShellHook, EvolutionHook)
- Renderers emit .ascii files to .geometry/ascii_scene/
- Visual Bridge monitors and broadcasts file changes via WebSocket
- HUD displays ASCII content in collapsible section

Usage:
    from systems.visual_shell.ascii_scene import wire_all_renderers

    # Wire renderers to broadcasters (call once at startup)
    wire_all_renderers()

Output files:
    - neural_city_map.ascii: 80x24 camera-follow viewport
    - district_focus.ascii: Active district details
    - city_health.ascii: Global PAS and entropy metrics
    - shell_fragments.ascii: YAML-like tree of active windows
    - shell_focus.ascii: Input state (keyboard, mouse)
    - shell_state.ascii: Global metrics
    - evolution_pas.ascii: PAS meter with threshold alert
    - evolution_pipeline.ascii: Stage progress
    - evolution_log.ascii: Self-correction history
"""

import logging
from typing import Optional

logger = logging.getLogger(__name__)

# Module-level renderers (singletons)
_neural_city_renderer = None
_visual_shell_renderer = None
_evolution_renderer = None


def get_neural_city_renderer(output_dir: str = ".geometry/ascii_scene"):
    """
    Get or create the Neural City ASCII renderer.

    Args:
        output_dir: Directory to write .ascii files

    Returns:
        NeuralCityAsciiRenderer instance
    """
    global _neural_city_renderer
    if _neural_city_renderer is None:
        from .renderers import NeuralCityAsciiRenderer
        _neural_city_renderer = NeuralCityAsciiRenderer(output_dir=output_dir)
    return _neural_city_renderer


def get_visual_shell_renderer(output_dir: str = ".geometry/ascii_scene"):
    """
    Get or create the Visual Shell ASCII renderer.

    Args:
        output_dir: Directory to write .ascii files

    Returns:
        VisualShellAsciiRenderer instance
    """
    global _visual_shell_renderer
    if _visual_shell_renderer is None:
        from .renderers import VisualShellAsciiRenderer
        _visual_shell_renderer = VisualShellAsciiRenderer(output_dir=output_dir)
    return _visual_shell_renderer


def get_evolution_renderer(output_dir: str = ".geometry/ascii_scene"):
    """
    Get or create the Evolution ASCII renderer.

    Args:
        output_dir: Directory to write .ascii files

    Returns:
        EvolutionAsciiRenderer instance
    """
    global _evolution_renderer
    if _evolution_renderer is None:
        from .renderers import EvolutionAsciiRenderer
        _evolution_renderer = EvolutionAsciiRenderer(output_dir=output_dir)
    return _evolution_renderer


def wire_neural_city_renderer(broadcaster=None, output_dir: str = ".geometry/ascii_scene"):
    """
    Wire the Neural City ASCII renderer to a broadcaster.

    Args:
        broadcaster: NeuralCityHookBroadcaster instance (if None, creates new)
        output_dir: Directory to write .ascii files

    Returns:
        Tuple of (broadcaster, renderer)
    """
    if broadcaster is None:
        from systems.visual_shell.swarm.consciousness.hooks import NeuralCityHookBroadcaster
        broadcaster = NeuralCityHookBroadcaster()

    renderer = get_neural_city_renderer(output_dir)
    broadcaster.add_hook(renderer)

    logger.info(f"Wired NeuralCityAsciiRenderer to broadcaster")
    return broadcaster, renderer


def wire_visual_shell_renderer(broadcaster=None, output_dir: str = ".geometry/ascii_scene"):
    """
    Wire the Visual Shell ASCII renderer to a broadcaster.

    Args:
        broadcaster: VisualShellHookBroadcaster instance (if None, creates new)
        output_dir: Directory to write .ascii files

    Returns:
        Tuple of (broadcaster, renderer)
    """
    if broadcaster is None:
        from .hooks import VisualShellHookBroadcaster
        broadcaster = VisualShellHookBroadcaster()

    renderer = get_visual_shell_renderer(output_dir)
    broadcaster.add_hook(renderer)

    logger.info(f"Wired VisualShellAsciiRenderer to broadcaster")
    return broadcaster, renderer


def wire_evolution_renderer(broadcaster=None, output_dir: str = ".geometry/ascii_scene"):
    """
    Wire the Evolution ASCII renderer to a broadcaster.

    Args:
        broadcaster: EvolutionHookBroadcaster instance (if None, creates new)
        output_dir: Directory to write .ascii files

    Returns:
        Tuple of (broadcaster, renderer)
    """
    if broadcaster is None:
        from systems.evolution_daemon.hooks import EvolutionHookBroadcaster
        broadcaster = EvolutionHookBroadcaster()

    renderer = get_evolution_renderer(output_dir)
    broadcaster.add_hook(renderer)

    logger.info(f"Wired EvolutionAsciiRenderer to broadcaster")
    return broadcaster, renderer


def wire_all_renderers(output_dir: str = ".geometry/ascii_scene"):
    """
    Wire all ASCII renderers to their respective broadcasters.

    This is the main entry point for enabling ASCII Scene Graph output.

    Args:
        output_dir: Directory to write .ascii files

    Returns:
        Dict with broadcaster and renderer references:
        {
            'neural_city': (broadcaster, renderer),
            'visual_shell': (broadcaster, renderer),
            'evolution': (broadcaster, renderer)
        }
    """
    results = {}

    try:
        results['neural_city'] = wire_neural_city_renderer(output_dir=output_dir)
    except ImportError as e:
        logger.warning(f"Could not wire Neural City renderer: {e}")

    try:
        results['visual_shell'] = wire_visual_shell_renderer(output_dir=output_dir)
    except ImportError as e:
        logger.warning(f"Could not wire Visual Shell renderer: {e}")

    try:
        results['evolution'] = wire_evolution_renderer(output_dir=output_dir)
    except ImportError as e:
        logger.warning(f"Could not wire Evolution renderer: {e}")

    logger.info(f"Wired {len(results)} ASCII Scene Graph renderers")
    return results


# Convenience exports
from .hooks import (
    VisualShellHook,
    VisualShellHookBroadcaster,
    LoggingHook as VisualShellLoggingHook,
    NoOpHook as VisualShellNoOpHook
)

from .renderers import (
    NeuralCityAsciiRenderer,
    VisualShellAsciiRenderer,
    EvolutionAsciiRenderer
)

__all__ = [
    # Renderers
    'NeuralCityAsciiRenderer',
    'VisualShellAsciiRenderer',
    'EvolutionAsciiRenderer',

    # Hooks
    'VisualShellHook',
    'VisualShellHookBroadcaster',
    'VisualShellLoggingHook',
    'VisualShellNoOpHook',

    # Wiring functions
    'get_neural_city_renderer',
    'get_visual_shell_renderer',
    'get_evolution_renderer',
    'wire_neural_city_renderer',
    'wire_visual_shell_renderer',
    'wire_evolution_renderer',
    'wire_all_renderers',
]
