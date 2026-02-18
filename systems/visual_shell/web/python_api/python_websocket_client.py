"""
Neural Heatmap WebSocket Client

Connects to the Neural Heatmap WebSocket server for real-time data streaming.
Part of Neural Heatmap Phase 2.3 - Python API Expansion.

Example:
    >>> from neural_heatmap import NeuralHeatmapWebSocketClient
    >>> client = NeuralHeatmapWebSocketClient(url="ws://localhost:8080/ws")
    >>> await client.connect()
    >>> await client.subscribe_heatmap()
    >>> async for update in client.listen():
    ...     print(f"Update: {update}")
"""

import asyncio
import json
import logging
from typing import Optional, Callable, AsyncIterator, Dict, Any, List
from dataclasses import dataclass, asdict
from enum import Enum

try:
    import websockets
    from websockets.client import WebSocketClientProtocol
    WEBSOCKETS_AVAILABLE = True
except ImportError:
    WEBSOCKETS_AVAILABLE = False
    WebSocketClientProtocol = None


# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class MessageType(Enum):
    """WebSocket message types"""
    # Client -> Server
    SUBSCRIBE_HEATMAP = "subscribe_heatmap"
    UNSUBSCRIBE_HEATMAP = "unsubscribe_heatmap"
    SUBSCRIBE_CORRELATIONS = "subscribe_correlations"
    UNSUBSCRIBE_CORRELATIONS = "unsubscribe_correlations"
    SUBSCRIBE_TEMPORAL = "subscribe_temporal"
    UNSUBSCRIBE_TEMPORAL = "unsubscribe_temporal"
    SUBSCRIBE_ANOMALIES = "subscribe_anomalies"
    UNSUBSCRIBE_ANOMALIES = "unsubscribe_anomalies"
    GET_CORRELATION_MATRIX = "get_correlation_matrix"
    GET_TEMPORAL_PATTERNS = "get_temporal_patterns"
    GET_ANOMALIES = "get_anomalies"
    SET_FILTER = "set_filter"
    EXPORT_DATA = "export_data"
    SET_THEME = "set_theme"
    SET_LAYOUT = "set_layout"

    # Server -> Client
    HEATMAP_UPDATE = "heatmap_update"
    CORRELATION_UPDATE = "correlation_update"
    TEMPORAL_UPDATE = "temporal_update"
    ANOMALY_UPDATE = "anomaly_update"
    DATA = "data"
    ERROR = "error"


@dataclass
class HeatmapUpdate:
    """Heatmap update data"""
    timestamp: float
    model_id: str
    intensity: float
    location: Dict[str, float]
    layer: Optional[str] = None

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'HeatmapUpdate':
        return cls(**data)


@dataclass
class CorrelationUpdate:
    """Correlation matrix update data"""
    timestamp: float
    matrix: List[List[float]]
    labels: List[str]
    metadata: Optional[Dict[str, Any]] = None

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'CorrelationUpdate':
        return cls(**data)


@dataclass
class TemporalUpdate:
    """Temporal pattern update data"""
    timestamp: float
    patterns: List[Dict[str, Any]]
    trends: List[Dict[str, Any]]
    state_changes: List[Dict[str, Any]]

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'TemporalUpdate':
        return cls(**data)


@dataclass
class AnomalyUpdate:
    """Anomaly detection update data"""
    timestamp: float
    anomalies: List[Dict[str, Any]]
    severity: str
    description: str

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> 'AnomalyUpdate':
        return cls(**data)


class NeuralHeatmapWebSocketClient:
    """
    WebSocket client for real-time Neural Heatmap data.

    Attributes:
        url: WebSocket server URL
        connected: Connection status
        subscriptions: Active subscriptions

    Example:
        >>> client = NeuralHeatmapWebSocketClient("ws://localhost:8080/ws")
        >>> await client.connect()
        >>> await client.subscribe_heatmap()
        >>> async for msg in client.listen():
        ...     if msg.type == "heatmap_update":
        ...         update = HeatmapUpdate.from_dict(msg.data)
        ...         print(f"Activity: {update.intensity}")
    """

    def __init__(
        self,
        url: str = "ws://localhost:8080/ws",
        reconnect: bool = True,
        reconnect_delay: float = 5.0,
        max_retries: int = 10
    ):
        """
        Initialize the WebSocket client.

        Args:
            url: WebSocket server URL
            reconnect: Auto-reconnect on disconnect
            reconnect_delay: Delay between reconnect attempts (seconds)
            max_retries: Maximum reconnect attempts
        """
        if not WEBSOCKETS_AVAILABLE:
            raise ImportError(
                "websockets package is required. "
                "Install it with: pip install websockets"
            )

        self.url = url
        self.reconnect = reconnect
        self.reconnect_delay = reconnect_delay
        self.max_retries = max_retries

        self._ws: Optional[WebSocketClientProtocol] = None
        self._connected = False
        self._subscriptions: set = set()
        self._message_queue: asyncio.Queue = asyncio.Queue()
        self._reconnect_count = 0
        self._reconnect_task: Optional[asyncio.Task] = None

        # Callbacks for different message types
        self._callbacks: Dict[str, List[Callable]] = {}

        logger.info(f"[WebSocketClient] Initialized with url={url}")

    @property
    def connected(self) -> bool:
        """Check if connected to server"""
        return self._connected

    @property
    def subscriptions(self) -> set:
        """Get active subscriptions"""
        return self._subscriptions.copy()

    async def connect(self) -> bool:
        """
        Connect to the WebSocket server.

        Returns:
            True if connection successful, False otherwise
        """
        try:
            logger.info(f"[WebSocketClient] Connecting to {self.url}...")
            self._ws = await websockets.connect(self.url)
            self._connected = True
            self._reconnect_count = 0

            # Start message listener
            asyncio.create_task(self._listen_messages())

            logger.info("[WebSocketClient] Connected successfully")
            return True

        except Exception as e:
            logger.error(f"[WebSocketClient] Connection failed: {e}")
            if self.reconnect and self._reconnect_count < self.max_retries:
                self._reconnect_count += 1
                logger.info(
                    f"[WebSocketClient] Reconnecting in {self.reconnect_delay}s "
                    f"(attempt {self._reconnect_count}/{self.max_retries})"
                )
                await asyncio.sleep(self.reconnect_delay)
                return await self.connect()
            return False

    async def disconnect(self) -> None:
        """Disconnect from the WebSocket server"""
        self._connected = False
        if self._reconnect_task:
            self._reconnect_task.cancel()

        if self._ws:
            await self._ws.close()
            self._ws = None

        logger.info("[WebSocketClient] Disconnected")

    async def _listen_messages(self) -> None:
        """Listen for incoming messages"""
        try:
            async for message in self._ws:
                try:
                    data = json.loads(message)
                    await self._handle_message(data)
                except json.JSONDecodeError as e:
                    logger.error(f"[WebSocketClient] Invalid JSON: {e}")
                except Exception as e:
                    logger.error(f"[WebSocketClient] Message handling error: {e}")
        except websockets.exceptions.ConnectionClosed:
            logger.warning("[WebSocketClient] Connection closed")
            self._connected = False
            if self.reconnect:
                self._reconnect_task = asyncio.create_task(self._auto_reconnect())
        except Exception as e:
            logger.error(f"[WebSocketClient] Listen error: {e}")
            self._connected = False

    async def _auto_reconnect(self) -> None:
        """Auto-reconnect logic"""
        while self.reconnect and not self._connected:
            if self._reconnect_count >= self.max_retries:
                logger.error("[WebSocketClient] Max reconnect attempts reached")
                break

            self._reconnect_count += 1
            await asyncio.sleep(self.reconnect_delay)

            if await self.connect():
                # Resubscribe to previous subscriptions
                for sub in list(self._subscriptions):
                    await self._send_subscription(sub)

    async def _handle_message(self, data: Dict[str, Any]) -> None:
        """Handle incoming message"""
        msg_type = data.get("type")
        payload = data.get("data", data)

        # Add to queue for listen() iterator
        await self._message_queue.put({"type": msg_type, "data": payload})

        # Call registered callbacks
        if msg_type in self._callbacks:
            for callback in self._callbacks[msg_type]:
                try:
                    if asyncio.iscoroutinefunction(callback):
                        await callback(payload)
                    else:
                        callback(payload)
                except Exception as e:
                    logger.error(f"[WebSocketClient] Callback error: {e}")

    async def listen(self) -> AsyncIterator[Dict[str, Any]]:
        """
        Iterate over incoming messages.

        Yields:
            Dict with 'type' and 'data' keys

        Example:
            >>> async for msg in client.listen():
            ...     print(f"{msg['type']}: {msg['data']}")
        """
        while self._connected or not self._message_queue.empty():
            try:
                msg = await asyncio.wait_for(
                    self._message_queue.get(),
                    timeout=1.0
                )
                yield msg
            except asyncio.TimeoutError:
                continue

    def on(self, message_type: str, callback: Callable) -> None:
        """
        Register a callback for a message type.

        Args:
            message_type: Message type to listen for
            callback: Function to call when message received

        Example:
            >>> def on_heatmap(data):
            ...     print(f"Heatmap: {data}")
            >>> client.on("heatmap_update", on_heatmap)
        """
        if message_type not in self._callbacks:
            self._callbacks[message_type] = []
        self._callbacks[message_type].append(callback)

    def off(self, message_type: str, callback: Callable = None) -> None:
        """
        Unregister a callback.

        Args:
            message_type: Message type
            callback: Specific callback to remove (None removes all)
        """
        if callback is None:
            self._callbacks.pop(message_type, None)
        elif message_type in self._callbacks:
            self._callbacks[message_type] = [
                cb for cb in self._callbacks[message_type]
                if cb != callback
            ]

    async def _send(self, msg_type: MessageType, data: Dict[str, Any] = None) -> bool:
        """Send a message to the server"""
        if not self._connected or not self._ws:
            logger.warning("[WebSocketClient] Not connected")
            return False

        message = {
            "type": msg_type.value,
            "data": data or {}
        }

        try:
            await self._ws.send(json.dumps(message))
            return True
        except Exception as e:
            logger.error(f"[WebSocketClient] Send error: {e}")
            return False

    async def _send_subscription(self, msg_type: MessageType) -> bool:
        """Send subscription and track it"""
        success = await self._send(msg_type)
        if success:
            if "subscribe" in msg_type.value:
                self._subscriptions.add(msg_type.value)
            elif "unsubscribe" in msg_type.value:
                self._subscriptions.discard(msg_type.value)
        return success

    # Subscription methods
    async def subscribe_heatmap(self) -> bool:
        """Subscribe to heatmap updates"""
        return await self._send_subscription(MessageType.SUBSCRIBE_HEATMAP)

    async def unsubscribe_heatmap(self) -> bool:
        """Unsubscribe from heatmap updates"""
        return await self._send_subscription(MessageType.UNSUBSCRIBE_HEATMAP)

    async def subscribe_correlations(self) -> bool:
        """Subscribe to correlation matrix updates"""
        return await self._send_subscription(MessageType.SUBSCRIBE_CORRELATIONS)

    async def unsubscribe_correlations(self) -> bool:
        """Unsubscribe from correlation updates"""
        return await self._send_subscription(MessageType.UNSUBSCRIBE_CORRELATIONS)

    async def subscribe_temporal(self) -> bool:
        """Subscribe to temporal pattern updates"""
        return await self._send_subscription(MessageType.SUBSCRIBE_TEMPORAL)

    async def unsubscribe_temporal(self) -> bool:
        """Unsubscribe from temporal updates"""
        return await self._send_subscription(MessageType.UNSUBSCRIBE_TEMPORAL)

    async def subscribe_anomalies(self) -> bool:
        """Subscribe to anomaly detection updates"""
        return await self._send_subscription(MessageType.SUBSCRIBE_ANOMALIES)

    async def unsubscribe_anomalies(self) -> bool:
        """Unsubscribe from anomaly updates"""
        return await self._send_subscription(MessageType.UNSUBSCRIBE_ANOMALIES)

    # Query methods
    async def get_correlation_matrix(
        self,
        model_ids: Optional[List[str]] = None,
        layer_ids: Optional[List[str]] = None
    ) -> bool:
        """
        Request correlation matrix data.

        Args:
            model_ids: Filter by model IDs
            layer_ids: Filter by layer IDs
        """
        return await self._send(MessageType.GET_CORRELATION_MATRIX, {
            "model_ids": model_ids,
            "layer_ids": layer_ids
        })

    async def get_temporal_patterns(
        self,
        model_id: Optional[str] = None,
        time_window: Optional[int] = None
    ) -> bool:
        """
        Request temporal pattern data.

        Args:
            model_id: Filter by model ID
            time_window: Time window in milliseconds
        """
        return await self._send(MessageType.GET_TEMPORAL_PATTERNS, {
            "model_id": model_id,
            "time_window": time_window
        })

    async def get_anomalies(
        self,
        severity: Optional[str] = None,
        limit: Optional[int] = None
    ) -> bool:
        """
        Request anomaly detection data.

        Args:
            severity: Filter by severity (low, medium, high, critical)
            limit: Maximum number of anomalies to return
        """
        return await self._send(MessageType.GET_ANOMALIES, {
            "severity": severity,
            "limit": limit
        })

    # Configuration methods
    async def set_filter(
        self,
        model_ids: Optional[List[str]] = None,
        layer_ids: Optional[List[str]] = None,
        intensity_range: Optional[tuple] = None,
        spatial_bounds: Optional[Dict[str, Any]] = None
    ) -> bool:
        """
        Set data filter.

        Args:
            model_ids: Filter by model IDs
            layer_ids: Filter by layer IDs
            intensity_range: (min, max) intensity range
            spatial_bounds: {min_x, min_y, max_x, max_y} spatial bounds
        """
        filter_data = {}
        if model_ids:
            filter_data["model_ids"] = model_ids
        if layer_ids:
            filter_data["layer_ids"] = layer_ids
        if intensity_range:
            filter_data["intensity_range"] = intensity_range
        if spatial_bounds:
            filter_data["spatial_bounds"] = spatial_bounds

        return await self._send(MessageType.SET_FILTER, filter_data)

    async def clear_filter(self) -> bool:
        """Clear all filters"""
        return await self._send(MessageType.SET_FILTER, {})

    async def export_data(
        self,
        data_type: str,
        format: str,
        filename: Optional[str] = None
    ) -> bool:
        """
        Export data to file.

        Args:
            data_type: Type of data (correlation, temporal, anomalies)
            format: Export format (csv, json, tensorboard)
            filename: Optional filename
        """
        return await self._send(MessageType.EXPORT_DATA, {
            "data_type": data_type,
            "format": format,
            "filename": filename
        })

    async def set_theme(self, theme_name: str) -> bool:
        """
        Set visualization theme.

        Args:
            theme_name: Theme name (thermal, plasma, holographic, contour)
        """
        return await self._send(MessageType.SET_THEME, {"theme": theme_name})

    async def set_layout(self, layout_config: Dict[str, Any]) -> bool:
        """
        Set layout configuration.

        Args:
            layout_config: Layout configuration dict
        """
        return await self._send(MessageType.SET_LAYOUT, layout_config)

    async def __aenter__(self):
        """Async context manager entry"""
        await self.connect()
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit"""
        await self.disconnect()


# Convenience function for quick connection
async def connect(
    url: str = "ws://localhost:8080/ws",
    **kwargs
) -> NeuralHeatmapWebSocketClient:
    """
    Connect to Neural Heatmap WebSocket server.

    Args:
        url: WebSocket server URL
        **kwargs: Additional arguments for NeuralHeatmapWebSocketClient

    Returns:
        Connected WebSocket client

    Example:
        >>> client = await connect("ws://localhost:8080/ws")
        >>> await client.subscribe_heatmap()
    """
    client = NeuralHeatmapWebSocketClient(url, **kwargs)
    await client.connect()
    return client
