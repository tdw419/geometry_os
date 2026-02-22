"""
Neural Heatmap Python API

Complete Python API wrapper for the Neural Heatmap visualization system.
Part of Neural Heatmap Phase 2.3 - Python API Expansion.

Example:
    >>> from neural_heatmap import NeuralHeatmapClient
    >>> client = NeuralHeatmapClient(url="http://localhost:8080")
    >>> await client.connect()
    >>>
    >>> # Get correlation matrix
    >>> corr_matrix = await client.get_correlation_matrix()
    >>>
    >>> # Apply filter
    >>> await client.set_filter(layer_ids=["layer1", "layer2"])
    >>>
    >>> # Get temporal patterns
    >>> patterns = await client.get_temporal_patterns()
    >>>
    >>> # Export data
    >>> await client.export_correlation_matrix("correlation.csv")
"""

import asyncio
import json
import logging
from typing import Optional, Dict, Any, List, Union
from pathlib import Path
from dataclasses import dataclass, field, asdict
from datetime import datetime
from enum import Enum

try:
    import aiohttp
    AIOHTTP_AVAILABLE = True
except ImportError:
    AIOHTTP_AVAILABLE = False

try:
    import pandas as pd
    PANDAS_AVAILABLE = True
except ImportError:
    PANDAS_AVAILABLE = False

try:
    import numpy as np
    NUMPY_AVAILABLE = True
except ImportError:
    NUMPY_AVAILABLE = False

from .python_websocket_client import (
    NeuralHeatmapWebSocketClient,
    connect as ws_connect,
    HeatmapUpdate,
    CorrelationUpdate,
    TemporalUpdate,
    AnomalyUpdate
)

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class ExportFormat(Enum):
    """Data export formats"""
    CSV = "csv"
    JSON = "json"
    TENSORBOARD = "tensorboard"
    PARQUET = "parquet"


class VisualizationTheme(Enum):
    """Visualization themes"""
    THERMAL = "thermal"
    PLASMA = "plasma"
    HOLOGRAPHIC = "holographic"
    CONTOUR = "contour"
    CUSTOM = "custom"


class AnalysisMode(Enum):
    """Analysis modes"""
    ENTROPY = "entropy"
    LAYER = "layer"
    ACTIVITY = "activity"
    GRADIENT = "gradient"


@dataclass
class CorrelationMatrix:
    """Correlation matrix data structure"""
    matrix: List[List[float]]
    labels: List[str]
    timestamp: float
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_dataframe(self):
        """Convert to pandas DataFrame if available"""
        if not PANDAS_AVAILABLE:
            raise ImportError("pandas is required for DataFrame conversion")
        return pd.DataFrame(self.matrix, index=self.labels, columns=self.labels)

    def to_numpy(self):
        """Convert to numpy array if available"""
        if not NUMPY_AVAILABLE:
            raise ImportError("numpy is required for numpy conversion")
        return np.array(self.matrix)


@dataclass
class TemporalPattern:
    """Temporal pattern data structure"""
    pattern_type: str  # 'periodic', 'trend', 'state_change'
    frequency: Optional[float] = None
    amplitude: Optional[float] = None
    phase: Optional[float] = None
    confidence: float = 0.0
    start_time: Optional[float] = None
    end_time: Optional[float] = None
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class Anomaly:
    """Anomaly detection data structure"""
    anomaly_type: str
    severity: str  # 'low', 'medium', 'high', 'critical'
    timestamp: float
    location: Optional[Dict[str, float]] = None
    layer: Optional[str] = None
    model_id: Optional[str] = None
    score: float = 0.0
    description: str = ""
    metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class FilterConfig:
    """Filter configuration"""
    model_ids: Optional[List[str]] = None
    layer_ids: Optional[List[str]] = None
    intensity_range: Optional[tuple] = None  # (min, max)
    spatial_bounds: Optional[Dict[str, float]] = None  # {min_x, min_y, max_x, max_y}
    time_range: Optional[tuple] = None  # (start_ms, end_ms)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary"""
        result = {}
        if self.model_ids:
            result["model_ids"] = self.model_ids
        if self.layer_ids:
            result["layer_ids"] = self.layer_ids
        if self.intensity_range:
            result["intensity_range"] = self.intensity_range
        if self.spatial_bounds:
            result["spatial_bounds"] = self.spatial_bounds
        if self.time_range:
            result["time_range"] = self.time_range
        return result


@dataclass
class LayoutConfig:
    """Layout configuration"""
    panel_positions: Dict[str, Dict[str, float]] = field(default_factory=dict)
    panel_sizes: Dict[str, Dict[str, float]] = field(default_factory=dict)
    visibility: Dict[str, bool] = field(default_factory=dict)
    z_order: List[str] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary"""
        return {
            "panel_positions": self.panel_positions,
            "panel_sizes": self.panel_sizes,
            "visibility": self.visibility,
            "z_order": self.z_order
        }


class NeuralHeatmapClient:
    """
    Main Python API client for Neural Heatmap.

    Provides both HTTP REST API access and WebSocket real-time streaming.

    Attributes:
        url: Base URL of the Neural Heatmap server
        connected: Connection status
        ws_client: WebSocket client for real-time data

    Example:
        >>> client = NeuralHeatmapClient(url="http://localhost:8080")
        >>> await client.connect()
        >>>
        >>> # REST API calls
        >>> matrix = await client.get_correlation_matrix()
        >>>
        >>> # WebSocket streaming
        >>> await client.subscribe_heatmap()
        >>> async for update in client.stream_updates():
        ...     print(f"Update: {update}")
    """

    def __init__(
        self,
        url: str = "http://localhost:8080",
        ws_url: Optional[str] = None,
        auto_connect: bool = False,
        session: Optional[aiohttp.ClientSession] = None
    ):
        """
        Initialize the Neural Heatmap client.

        Args:
            url: Base URL of the Neural Heatmap server
            ws_url: WebSocket URL (defaults to ws://<host>/ws)
            auto_connect: Automatically connect on initialization
            session: Existing aiohttp session to use
        """
        if not AIOHTTP_AVAILABLE:
            raise ImportError(
                "aiohttp package is required. "
                "Install it with: pip install aiohttp"
            )

        self.url = url.rstrip("/")
        self.ws_url = ws_url or self._convert_to_ws_url(url)
        self._session = session
        self._owned_session = session is None
        self._connected = False

        # WebSocket client (lazy initialization)
        self._ws_client: Optional[NeuralHeatmapWebSocketClient] = None

        # Current filter state
        self._current_filter: Optional[FilterConfig] = None

        # Current theme
        self._current_theme: VisualizationTheme = VisualizationTheme.THERMAL

        logger.info(f"[NeuralHeatmapClient] Initialized with url={url}")

    def _convert_to_ws_url(self, http_url: str) -> str:
        """Convert HTTP URL to WebSocket URL"""
        url = http_url.rstrip("/")
        if url.startswith("https://"):
            return url.replace("https://", "wss://", 1) + "/ws"
        elif url.startswith("http://"):
            return url.replace("http://", "ws://", 1) + "/ws"
        return url

    @property
    def connected(self) -> bool:
        """Check if connected to server"""
        return self._connected

    @property
    def ws_client(self) -> Optional[NeuralHeatmapWebSocketClient]:
        """Get WebSocket client (creates if needed)"""
        if self._ws_client is None:
            self._ws_client = NeuralHeatmapWebSocketClient(self.ws_url)
        return self._ws_client

    async def connect(self) -> bool:
        """
        Connect to the Neural Heatmap server.

        Returns:
            True if connection successful
        """
        try:
            # Create session if needed
            if self._owned_session and self._session is None:
                self._session = aiohttp.ClientSession()

            # Test connection with health check
            async with self._session.get(f"{self.url}/health") as resp:
                if resp.status == 200:
                    self._connected = True
                    logger.info("[NeuralHeatmapClient] Connected successfully")
                    return True

        except Exception as e:
            logger.error(f"[NeuralHeatmapClient] Connection failed: {e}")
            return False

    async def disconnect(self) -> None:
        """Disconnect from the server"""
        self._connected = False

        # Disconnect WebSocket
        if self._ws_client:
            await self._ws_client.disconnect()

        # Close session if we own it
        if self._owned_session and self._session:
            await self._session.close()
            self._session = None

        logger.info("[NeuralHeatmapClient] Disconnected")

    async def _request(
        self,
        method: str,
        endpoint: str,
        data: Optional[Dict[str, Any]] = None,
        params: Optional[Dict[str, Any]] = None
    ) -> Dict[str, Any]:
        """Make HTTP request"""
        url = f"{self.url}{endpoint}"

        try:
            async with self._session.request(
                method,
                url,
                json=data,
                params=params
            ) as resp:
                if resp.status == 200:
                    return await resp.json()
                else:
                    error_text = await resp.text()
                    logger.error(f"[NeuralHeatmapClient] Request error: {error_text}")
                    return {"error": error_text}

        except Exception as e:
            logger.error(f"[NeuralHeatmapClient] Request failed: {e}")
            return {"error": str(e)}

    # ========================================
    # Correlation Matrix Methods
    # ========================================

    async def get_correlation_matrix(
        self,
        model_ids: Optional[List[str]] = None,
        layer_ids: Optional[List[str]] = None,
        as_dataframe: bool = False
    ) -> Union[CorrelationMatrix, "pd.DataFrame"]:
        """
        Get correlation matrix data.

        Args:
            model_ids: Filter by model IDs
            layer_ids: Filter by layer IDs
            as_dataframe: Return as pandas DataFrame

        Returns:
            CorrelationMatrix or DataFrame

        Example:
            >>> matrix = await client.get_correlation_matrix()
            >>> print(matrix.matrix)
            >>> df = await client.get_correlation_matrix(as_dataframe=True)
            >>> print(df.describe())
        """
        params = {}
        if model_ids:
            params["model_ids"] = ",".join(model_ids)
        if layer_ids:
            params["layer_ids"] = ",".join(layer_ids)

        data = await self._request("GET", "/api/correlation", params=params)

        if "error" in data:
            raise Exception(f"Failed to get correlation matrix: {data['error']}")

        matrix = CorrelationMatrix(
            matrix=data["matrix"],
            labels=data["labels"],
            timestamp=data.get("timestamp", datetime.now().timestamp()),
            metadata=data.get("metadata", {})
        )

        if as_dataframe:
            return matrix.to_dataframe()
        return matrix

    async def download_correlation_matrix(
        self,
        filepath: Union[str, Path],
        model_ids: Optional[List[str]] = None,
        layer_ids: Optional[List[str]] = None
    ) -> None:
        """
        Download correlation matrix to file.

        Args:
            filepath: Output file path
            model_ids: Filter by model IDs
            layer_ids: Filter by layer IDs
        """
        matrix = await self.get_correlation_matrix(model_ids, layer_ids)

        filepath = Path(filepath)
        suffix = filepath.suffix.lower()

        if suffix == ".csv":
            if not PANDAS_AVAILABLE:
                raise ImportError("pandas is required for CSV export")
            df = matrix.to_dataframe()
            df.to_csv(filepath)
        elif suffix == ".json":
            with open(filepath, "w") as f:
                json.dump(asdict(matrix), f, indent=2)
        elif suffix == ".parquet":
            if not PANDAS_AVAILABLE:
                raise ImportError("pandas is required for Parquet export")
            df = matrix.to_dataframe()
            df.to_parquet(filepath)
        else:
            raise ValueError(f"Unsupported file format: {suffix}")

        logger.info(f"[NeuralHeatmapClient] Saved correlation matrix to {filepath}")

    async def export_correlation_matrix(
        self,
        filename: str,
        format: ExportFormat = ExportFormat.CSV
    ) -> Dict[str, Any]:
        """
        Export correlation matrix via server-side export.

        Args:
            filename: Output filename
            format: Export format

        Returns:
            Export result dict
        """
        return await self._request("POST", "/api/export/correlation", {
            "filename": filename,
            "format": format.value
        })

    # ========================================
    # Temporal Pattern Methods
    # ========================================

    async def get_temporal_patterns(
        self,
        model_id: Optional[str] = None,
        time_window: Optional[int] = None,
        pattern_types: Optional[List[str]] = None
    ) -> List[TemporalPattern]:
        """
        Get temporal pattern data.

        Args:
            model_id: Filter by model ID
            time_window: Time window in milliseconds
            pattern_types: Filter by pattern types

        Returns:
            List of TemporalPattern objects

        Example:
            >>> patterns = await client.get_temporal_patterns()
            >>> for p in patterns:
            ...     print(f"{p.pattern_type}: {p.confidence}")
        """
        params = {}
        if model_id:
            params["model_id"] = model_id
        if time_window:
            params["time_window"] = time_window
        if pattern_types:
            params["pattern_types"] = ",".join(pattern_types)

        data = await self._request("GET", "/api/temporal", params=params)

        if "error" in data:
            raise Exception(f"Failed to get temporal patterns: {data['error']}")

        return [
            TemporalPattern(**p) for p in data.get("patterns", [])
        ]

    async def get_temporal_statistics(
        self,
        model_id: Optional[str] = None
    ) -> Dict[str, Any]:
        """
        Get temporal statistics.

        Args:
            model_id: Filter by model ID

        Returns:
            Statistics dict with trends, periodicity, etc.
        """
        params = {}
        if model_id:
            params["model_id"] = model_id

        return await self._request("GET", "/api/temporal/stats", params=params)

    # ========================================
    # Anomaly Detection Methods
    # ========================================

    async def get_anomalies(
        self,
        severity: Optional[str] = None,
        limit: Optional[int] = None,
        model_id: Optional[str] = None
    ) -> List[Anomaly]:
        """
        Get detected anomalies.

        Args:
            severity: Filter by severity (low, medium, high, critical)
            limit: Maximum number to return
            model_id: Filter by model ID

        Returns:
            List of Anomaly objects

        Example:
            >>> anomalies = await client.get_anomalies(severity="high")
            >>> for a in anomalies:
            ...     print(f"{a.severity}: {a.description}")
        """
        params = {}
        if severity:
            params["severity"] = severity
        if limit:
            params["limit"] = limit
        if model_id:
            params["model_id"] = model_id

        data = await self._request("GET", "/api/anomalies", params=params)

        if "error" in data:
            raise Exception(f"Failed to get anomalies: {data['error']}")

        return [
            Anomaly(**a) for a in data.get("anomalies", [])
        ]

    async def download_anomalies(
        self,
        filepath: Union[str, Path],
        severity: Optional[str] = None,
        limit: Optional[int] = None
    ) -> None:
        """
        Download anomalies to file.

        Args:
            filepath: Output file path
            severity: Filter by severity
            limit: Maximum number to return
        """
        anomalies = await self.get_anomalies(severity, limit)

        filepath = Path(filepath)
        suffix = filepath.suffix.lower()

        if suffix == ".csv":
            if not PANDAS_AVAILABLE:
                raise ImportError("pandas is required for CSV export")
            df = pd.DataFrame([asdict(a) for a in anomalies])
            df.to_csv(filepath, index=False)
        elif suffix == ".json":
            with open(filepath, "w") as f:
                json.dump([asdict(a) for a in anomalies], f, indent=2)
        else:
            raise ValueError(f"Unsupported file format: {suffix}")

        logger.info(f"[NeuralHeatmapClient] Saved {len(anomalies)} anomalies to {filepath}")

    # ========================================
    # Filter Methods
    # ========================================

    async def set_filter(
        self,
        model_ids: Optional[List[str]] = None,
        layer_ids: Optional[List[str]] = None,
        intensity_range: Optional[tuple] = None,
        spatial_bounds: Optional[Dict[str, float]] = None,
        time_range: Optional[tuple] = None
    ) -> bool:
        """
        Set data filter.

        Args:
            model_ids: Filter by model IDs
            layer_ids: Filter by layer IDs
            intensity_range: (min, max) intensity range
            spatial_bounds: {min_x, min_y, max_x, max_y} bounds
            time_range: (start_ms, end_ms) time range

        Example:
            >>> await client.set_filter(
            ...     layer_ids=["layer1", "layer2"],
            ...     intensity_range=(0.5, 1.0)
            ... )
        """
        filter_config = FilterConfig(
            model_ids=model_ids,
            layer_ids=layer_ids,
            intensity_range=intensity_range,
            spatial_bounds=spatial_bounds,
            time_range=time_range
        )

        result = await self._request("POST", "/api/filter", filter_config.to_dict())

        if "error" not in result:
            self._current_filter = filter_config
            return True
        return False

    async def clear_filter(self) -> bool:
        """Clear all filters"""
        result = await self._request("POST", "/api/filter", {})
        if "error" not in result:
            self._current_filter = None
            return True
        return False

    @property
    def current_filter(self) -> Optional[FilterConfig]:
        """Get current filter configuration"""
        return self._current_filter

    # ========================================
    # Theme and Layout Methods
    # ========================================

    async def set_theme(self, theme: Union[str, VisualizationTheme]) -> bool:
        """
        Set visualization theme.

        Args:
            theme: Theme name or VisualizationTheme enum

        Example:
            >>> await client.set_theme(VisualizationTheme.PLASMA)
            >>> await client.set_theme("holographic")
        """
        if isinstance(theme, VisualizationTheme):
            theme = theme.value

        result = await self._request("POST", "/api/theme", {"theme": theme})

        if "error" not in result:
            self._current_theme = VisualizationTheme(theme)
            return True
        return False

    async def set_layout(self, layout: Union[Dict[str, Any], LayoutConfig]) -> bool:
        """
        Set layout configuration.

        Args:
            layout: Layout configuration dict or LayoutConfig object

        Example:
            >>> await client.set_layout({
            ...     "panel_positions": {"heatmap": {"x": 0, "y": 0}},
            ...     "visibility": {"correlation": True}
            ... })
        """
        if isinstance(layout, LayoutConfig):
            layout = layout.to_dict()

        result = await self._request("POST", "/api/layout", layout)
        return "error" not in result

    async def get_layout(self) -> Dict[str, Any]:
        """Get current layout configuration"""
        return await self._request("GET", "/api/layout")

    # ========================================
    # Multi-Model Comparison Methods
    # ========================================

    async def compare_models(
        self,
        model_ids: List[str],
        metrics: Optional[List[str]] = None
    ) -> Dict[str, Any]:
        """
        Compare multiple models.

        Args:
            model_ids: List of model IDs to compare
            metrics: Metrics to compare (default: all)

        Returns:
            Comparison data dict

        Example:
            >>> comparison = await client.compare_models(["model1", "model2"])
            >>> print(comparison["similarity_matrix"])
        """
        data = {"model_ids": model_ids}
        if metrics:
            data["metrics"] = metrics

        return await self._request("POST", "/api/compare", data)

    # ========================================
    # WebSocket Streaming Methods
    # ========================================

    async def subscribe_heatmap(self) -> bool:
        """Subscribe to real-time heatmap updates"""
        if self._ws_client is None:
            self._ws_client = NeuralHeatmapWebSocketClient(self.ws_url)
            await self._ws_client.connect()
        return await self._ws_client.subscribe_heatmap()

    async def subscribe_correlations(self) -> bool:
        """Subscribe to real-time correlation updates"""
        if self._ws_client is None:
            self._ws_client = NeuralHeatmapWebSocketClient(self.ws_url)
            await self._ws_client.connect()
        return await self._ws_client.subscribe_correlations()

    async def subscribe_temporal(self) -> bool:
        """Subscribe to real-time temporal pattern updates"""
        if self._ws_client is None:
            self._ws_client = NeuralHeatmapWebSocketClient(self.ws_url)
            await self._ws_client.connect()
        return await self._ws_client.subscribe_temporal()

    async def subscribe_anomalies(self) -> bool:
        """Subscribe to real-time anomaly detection updates"""
        if self._ws_client is None:
            self._ws_client = NeuralHeatmapWebSocketClient(self.ws_url)
            await self._ws_client.connect()
        return await self._ws_client.subscribe_anomalies()

    async def unsubscribe_heatmap(self) -> bool:
        """Unsubscribe from heatmap updates"""
        if self._ws_client:
            return await self._ws_client.unsubscribe_heatmap()
        return False

    async def stream_updates(
        self,
        message_types: Optional[List[str]] = None
    ):
        """
        Stream real-time updates.

        Args:
            message_types: Filter by message types

        Yields:
            Update data objects

        Example:
            >>> async for update in client.stream_updates():
            ...     if isinstance(update, HeatmapUpdate):
            ...         print(f"Activity: {update.intensity}")
        """
        if not self._ws_client or not self._ws_client.connected:
            raise RuntimeError("WebSocket not connected. Call subscribe_* first.")

        async for msg in self._ws_client.listen():
            msg_type = msg["type"]
            data = msg["data"]

            # Filter by message types if specified
            if message_types and msg_type not in message_types:
                continue

            # Convert to appropriate data type
            if msg_type == "heatmap_update":
                yield HeatmapUpdate.from_dict(data)
            elif msg_type == "correlation_update":
                yield CorrelationUpdate.from_dict(data)
            elif msg_type == "temporal_update":
                yield TemporalUpdate.from_dict(data)
            elif msg_type == "anomaly_update":
                yield AnomalyUpdate.from_dict(data)
            else:
                yield data

    # ========================================
    # Export Methods
    # ========================================

    async def export_tensorboard(
        self,
        output_dir: Union[str, Path],
        run_name: str = "neural_heatmap"
    ) -> str:
        """
        Export data for TensorBoard visualization.

        Args:
            output_dir: Output directory path
            run_name: TensorBoard run name

        Returns:
            Path to exported data
        """
        output_dir = Path(output_dir)
        log_dir = output_dir / run_name
        log_dir.mkdir(parents=True, exist_ok=True)

        # Export correlation matrix
        matrix = await self.get_correlation_matrix()
        with open(log_dir / "correlation.json", "w") as f:
            json.dump(asdict(matrix), f)

        # Export temporal patterns
        patterns = await self.get_temporal_patterns()
        with open(log_dir / "temporal_patterns.json", "w") as f:
            json.dump([asdict(p) for p in patterns], f)

        # Export anomalies
        anomalies = await self.get_anomalies()
        with open(log_dir / "anomalies.json", "w") as f:
            json.dump([asdict(a) for a in anomalies], f)

        logger.info(f"[NeuralHeatmapClient] Exported TensorBoard data to {log_dir}")
        return str(log_dir)

    async def export_all(
        self,
        output_dir: Union[str, Path],
        formats: Optional[List[ExportFormat]] = None
    ) -> Dict[str, str]:
        """
        Export all data in multiple formats.

        Args:
            output_dir: Output directory path
            formats: Export formats (default: [CSV, JSON])

        Returns:
            Dict mapping data type to file path
        """
        if formats is None:
            formats = [ExportFormat.CSV, ExportFormat.JSON]

        output_dir = Path(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)

        exported = {}

        # Export correlation matrix
        if ExportFormat.CSV in formats:
            corr_path = output_dir / "correlation.csv"
            await self.download_correlation_matrix(corr_path)
            exported["correlation_csv"] = str(corr_path)

        if ExportFormat.JSON in formats:
            corr_path = output_dir / "correlation.json"
            await self.download_correlation_matrix(corr_path)
            exported["correlation_json"] = str(corr_path)

        # Export temporal patterns
        patterns = await self.get_temporal_patterns()
        if ExportFormat.JSON in formats:
            patterns_path = output_dir / "temporal_patterns.json"
            with open(patterns_path, "w") as f:
                json.dump([asdict(p) for p in patterns], f)
            exported["temporal"] = str(patterns_path)

        # Export anomalies
        anomalies = await self.get_anomalies()
        if ExportFormat.JSON in formats:
            anomalies_path = output_dir / "anomalies.json"
            with open(anomalies_path, "w") as f:
                json.dump([asdict(a) for a in anomalies], f)
            exported["anomalies"] = str(anomalies_path)

        if ExportFormat.CSV in formats:
            anomalies_path = output_dir / "anomalies.csv"
            await self.download_anomalies(anomalies_path)
            exported["anomalies_csv"] = str(anomalies_path)

        logger.info(f"[NeuralHeatmapClient] Exported all data to {output_dir}")
        return exported

    # ========================================
    # Context Manager Support
    # ========================================

    async def __aenter__(self):
        """Async context manager entry"""
        await self.connect()
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit"""
        await self.disconnect()


# ========================================
# Convenience Functions
# ========================================

async def connect(
    url: str = "http://localhost:8080",
    **kwargs
) -> NeuralHeatmapClient:
    """
    Connect to Neural Heatmap server.

    Args:
        url: Server URL
        **kwargs: Additional arguments for NeuralHeatmapClient

    Returns:
        Connected NeuralHeatmapClient

    Example:
        >>> client = await connect("http://localhost:8080")
        >>> matrix = await client.get_correlation_matrix()
    """
    client = NeuralHeatmapClient(url, **kwargs)
    await client.connect()
    return client


async def quick_export(
    url: str = "http://localhost:8080",
    output_dir: str = "./neural_heatmap_export"
) -> Dict[str, str]:
    """
    Quick export all data from server.

    Args:
        url: Server URL
        output_dir: Output directory path

    Returns:
        Dict mapping data type to file path
    """
    async with await connect(url) as client:
        return await client.export_all(output_dir)


# ========================================
# Module Exports
# ========================================

__all__ = [
    # Main client
    "NeuralHeatmapClient",
    # WebSocket client
    "NeuralHeatmapWebSocketClient",
    "connect",
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
    # Convenience
    "quick_export",
]
