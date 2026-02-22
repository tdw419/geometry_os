"""
Neural Heatmap Python API

Complete Python API wrapper for the Neural Heatmap visualization system.
Part of Neural Heatmap Phase 2.3 - Python API Expansion.

Quick Start:
    >>> from neural_heatmap import NeuralHeatmapClient, connect
    >>>
    >>> # Connect to server
    >>> client = await connect("http://localhost:8080")
    >>>
    >>> # Get correlation matrix
    >>> matrix = await client.get_correlation_matrix()
    >>>
    >>> # Apply filter and get temporal patterns
    >>> await client.set_filter(layer_ids=["layer1", "layer2"])
    >>> patterns = await client.get_temporal_patterns()
    >>>
    >>> # Export data
    >>> await client.export_correlation_matrix("correlation.csv")
    >>>
    >>> # Stream real-time updates
    >>> await client.subscribe_heatmap()
    >>> async for update in client.stream_updates():
    ...     print(f"Update: {update}")

Documentation:
    See jupyter_examples/ for detailed usage examples.
"""

from .python_api import (
    # Main client
    NeuralHeatmapClient,
    connect,
    quick_export,
    # Data types
    CorrelationMatrix,
    TemporalPattern,
    Anomaly,
    FilterConfig,
    LayoutConfig,
    # Enums
    ExportFormat,
    VisualizationTheme,
    AnalysisMode,
)

from .python_websocket_client import (
    # WebSocket client
    NeuralHeatmapWebSocketClient,
    ws_connect,
    # WebSocket data types
    HeatmapUpdate,
    CorrelationUpdate,
    TemporalUpdate,
    AnomalyUpdate,
    MessageType,
)

__version__ = "2.3.0"
__author__ = "Geometry OS Team"
__all__ = [
    # Version info
    "__version__",
    "__author__",
    # Main client
    "NeuralHeatmapClient",
    "connect",
    "quick_export",
    # WebSocket client
    "NeuralHeatmapWebSocketClient",
    "ws_connect",
    # Data types
    "CorrelationMatrix",
    "TemporalPattern",
    "Anomaly",
    "HeatmapUpdate",
    "CorrelationUpdate",
    "TemporalUpdate",
    "AnomalyUpdate",
    "FilterConfig",
    "LayoutConfig",
    # Enums
    "ExportFormat",
    "VisualizationTheme",
    "AnalysisMode",
    "MessageType",
]


def get_version():
    """Get API version"""
    return __version__


def get_info():
    """Get API information"""
    return {
        "name": "neural_heatmap",
        "version": __version__,
        "author": __author__,
        "description": "Python API for Neural Heatmap visualization system",
    }
