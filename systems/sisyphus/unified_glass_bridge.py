"""
Unified Glass Box Bridge - Multi-Stream Daemon Visualization
Routes thoughts, tokens, and gravity updates to Glass Box.

Features:
- Unified API for all daemon streams (thoughts, tokens, gravity)
- Multiple transport backends (socket, shared memory, HTTP)
- Stream multiplexing with type routing
- Real-time multi-stream output for Glass Box
"""

import json
import logging
import threading
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from multiprocessing import shared_memory
from typing import Any

import numpy as np

try:
    from .compositor_bridge import CompositorBridge
    from .native_hilbert import NativeHilbertLUT
    from .thought_serializer import ThoughtSerializer
    HAS_COMPOSITOR = True
except ImportError:
    HAS_COMPOSITOR = False
    CompositorBridge = None
    ThoughtSerializer = None
    NativeHilbertLUT = None

logger = logging.getLogger("UnifiedGlassBridge")


class StreamType(Enum):
    """Stream types for multi-stream routing."""
    THOUGHT = "thought"       # General daemon thoughts
    TOKEN = "token"           # LLM token streaming
    GRAVITY = "gravity"       # File gravity updates
    TELEMETRY = "telemetry"   # System telemetry
    RIPPLE = "ripple"         # Tectonic ripples


class TransportType(Enum):
    """Available transport mechanisms."""
    SOCKET = "socket"         # Unix socket to compositor
    SHARED_MEMORY = "shm"     # Shared memory buffer
    HTTP = "http"             # HTTP/WebSocket broadcast
    ALL = "all"               # Broadcast to all available


@dataclass
class StreamMessage:
    """Unified message format for all stream types."""
    stream_type: StreamType
    msg_type: str
    payload: dict[str, Any]
    timestamp: float = field(default_factory=time.time)
    sequence: int = 0

    def to_dict(self) -> dict[str, Any]:
        return {
            "stream_type": self.stream_type.value,
            "msg_type": self.msg_type,
            "payload": self.payload,
            "timestamp": self.timestamp,
            "sequence": self.sequence
        }

    def to_json(self) -> str:
        return json.dumps(self.to_dict())


@dataclass
class MultiStreamStats:
    """Statistics for multi-stream output."""
    thoughts_sent: int = 0
    tokens_sent: int = 0
    gravity_updates_sent: int = 0
    ripples_sent: int = 0
    telemetry_sent: int = 0
    errors: int = 0
    start_time: float = field(default_factory=time.time)

    def record(self, stream_type: StreamType, success: bool):
        if success:
            if stream_type == StreamType.THOUGHT:
                self.thoughts_sent += 1
            elif stream_type == StreamType.TOKEN:
                self.tokens_sent += 1
            elif stream_type == StreamType.GRAVITY:
                self.gravity_updates_sent += 1
            elif stream_type == StreamType.RIPPLE:
                self.ripples_sent += 1
            elif stream_type == StreamType.TELEMETRY:
                self.telemetry_sent += 1
        else:
            self.errors += 1

    def summary(self) -> str:
        elapsed = time.time() - self.start_time
        total = (self.thoughts_sent + self.tokens_sent +
                 self.gravity_updates_sent + self.ripples_sent +
                 self.telemetry_sent)
        rate = total / elapsed if elapsed > 0 else 0
        return (
            f"Multi-Stream Stats: {total} messages ({rate:.1f}/s) | "
            f"Thoughts: {self.thoughts_sent} | "
            f"Tokens: {self.tokens_sent} | "
            f"Gravity: {self.gravity_updates_sent} | "
            f"Ripples: {self.ripples_sent} | "
            f"Errors: {self.errors}"
        )


class UnifiedGlassBridge:
    """
    Unified bridge for routing all daemon streams to Glass Box.

    Supports:
    - Thoughts: Task status, GVN optimizations, heuristics
    - Tokens: LLM token streaming with Hilbert mapping
    - Gravity: File orb position updates from tectonic engine
    - Telemetry: System health metrics
    - Ripples: Tectonic physical impulses

    Transports:
    - Socket: Unix socket to compositor (low latency)
    - Shared Memory: Direct VRAM mapping (highest bandwidth)
    - HTTP: WebSocket broadcast (remote clients)
    """

    # Stream type to opcode mapping
    OPCODES = {
        StreamType.THOUGHT: 0xCE,      # THOUGHT_RENDER
        StreamType.TOKEN: 0xCD,        # TOKEN_RENDER_3D
        StreamType.GRAVITY: 0xC0,      # GRAVITY_UPDATE
        StreamType.TELEMETRY: 0xC1,    # TELEMETRY_UPDATE
        StreamType.RIPPLE: 0xC2,       # RIPPLE_RENDER
    }

    # Semantic colors per stream type (RGBA)
    STREAM_COLORS = {
        StreamType.THOUGHT: (0.0, 1.0, 1.0, 1.0),      # Cyan
        StreamType.TOKEN: (1.0, 1.0, 0.0, 1.0),        # Yellow
        StreamType.GRAVITY: (0.0, 1.0, 0.0, 1.0),      # Green
        StreamType.TELEMETRY: (0.5, 0.5, 1.0, 1.0),    # Light Blue
        StreamType.RIPPLE: (1.0, 0.5, 0.0, 1.0),       # Orange
    }

    def __init__(
        self,
        socket_path: str = "/tmp/evolution_daemon.sock",
        shm_name: str = "glass_box_shm",
        shm_size: int = 2 * 1024 * 1024,  # 2MB for multi-stream
        http_url: str = "http://localhost:3002/thoughts/broadcast",
        enable_socket: bool = True,
        enable_shm: bool = True,
        enable_http: bool = True,
        hilbert_order: int = 8
    ):
        """
        Initialize the unified bridge.

        Args:
            socket_path: Unix socket path for compositor connection
            shm_name: Shared memory buffer name
            shm_size: Size of shared memory buffer in bytes
            http_url: HTTP endpoint for WebSocket broadcast
            enable_socket: Enable socket transport
            enable_shm: Enable shared memory transport
            enable_http: Enable HTTP transport
            hilbert_order: Hilbert curve order for coordinate mapping
        """
        self.socket_path = socket_path
        self.shm_name = shm_name
        self.shm_size = shm_size
        self.http_url = http_url

        # Transport enable flags
        self.enable_socket = enable_socket and HAS_COMPOSITOR
        self.enable_shm = enable_shm
        self.enable_http = enable_http

        # Initialize transports
        self._socket_bridge: CompositorBridge | None = None
        self._shm: shared_memory.SharedMemory | None = None
        self._shm_buffer: np.ndarray | None = None
        self._shm_lock = threading.Lock()

        # Hilbert LUT for coordinate mapping
        self.hilbert = NativeHilbertLUT() if HAS_COMPOSITOR and NativeHilbertLUT else None
        self.hilbert_order = hilbert_order
        self.grid_size = 2 ** hilbert_order

        # Thought serializer for glyph commands
        self.serializer = ThoughtSerializer(self.hilbert) if HAS_COMPOSITOR and ThoughtSerializer else None

        # Sequence counter for message ordering
        self._sequence = 0
        self._sequence_lock = threading.Lock()

        # Statistics
        self.stats = MultiStreamStats()

        # Stream subscribers (for multi-stream output)
        self._subscribers: dict[StreamType, list[Callable[[StreamMessage], None]]] = {
            st: [] for st in StreamType
        }

        # Buffer offsets for shared memory multi-stream layout
        # Layout: [Header:64B][Thoughts:512KB][Tokens:512KB][Gravity:256KB][Telemetry:128KB][Ripples:128KB]
        self._shm_offsets = {
            StreamType.THOUGHT: 64,
            StreamType.TOKEN: 64 + 512 * 1024,
            StreamType.GRAVITY: 64 + 512 * 1024 + 512 * 1024,
            StreamType.TELEMETRY: 64 + 512 * 1024 + 512 * 1024 + 256 * 1024,
            StreamType.RIPPLE: 64 + 512 * 1024 + 512 * 1024 + 256 * 1024 + 128 * 1024,
        }
        self._shm_write_pos: dict[StreamType, int] = dict.fromkeys(StreamType, 0)

        logger.info("UnifiedGlassBridge initialized")

    # =========================================================================
    # Transport Management
    # =========================================================================

    def connect(self) -> bool:
        """
        Connect all enabled transports.

        Returns:
            True if at least one transport connected successfully
        """
        success = False

        # Connect socket transport
        if self.enable_socket:
            try:
                self._socket_bridge = CompositorBridge(socket_path=self.socket_path)
                if self._socket_bridge.connect():
                    logger.info(f"Socket transport connected: {self.socket_path}")
                    success = True
                else:
                    logger.warning("Socket transport failed to connect")
                    self._socket_bridge = None
            except Exception as e:
                logger.error(f"Socket transport error: {e}")
                self._socket_bridge = None

        # Connect shared memory transport
        if self.enable_shm:
            try:
                self._shm = shared_memory.SharedMemory(
                    name=self.shm_name,
                    create=True,
                    size=self.shm_size
                )
                self._shm_buffer = np.ndarray(
                    (self.shm_size,),
                    dtype=np.uint8,
                    buffer=self._shm.buf
                )
                logger.info(f"Shared memory transport connected: {self.shm_name}")
                success = True
            except FileExistsError:
                # Already exists, connect to it
                try:
                    self._shm = shared_memory.SharedMemory(name=self.shm_name)
                    self._shm_buffer = np.ndarray(
                        (self.shm_size,),
                        dtype=np.uint8,
                        buffer=self._shm.buf
                    )
                    logger.info(f"Connected to existing shared memory: {self.shm_name}")
                    success = True
                except Exception as e:
                    logger.error(f"Shared memory connection error: {e}")
                    self._shm = None
            except Exception as e:
                logger.error(f"Shared memory transport error: {e}")
                self._shm = None

        # HTTP transport doesn't need connection
        if self.enable_http:
            logger.info(f"HTTP transport enabled: {self.http_url}")
            success = True  # HTTP is always "connected"

        return success

    def disconnect(self):
        """Disconnect all transports."""
        if self._socket_bridge:
            self._socket_bridge.disconnect()
            self._socket_bridge = None
            logger.info("Socket transport disconnected")

        if self._shm:
            with self._shm_lock:
                self._shm.close()
                try:
                    self._shm.unlink()
                    logger.info(f"Shared memory unlinked: {self.shm_name}")
                except:
                    pass
                self._shm = None
                self._shm_buffer = None

    # =========================================================================
    # Unified Stream API
    # =========================================================================

    def _next_sequence(self) -> int:
        """Get the next message sequence number."""
        with self._sequence_lock:
            self._sequence += 1
            return self._sequence

    def stream(
        self,
        stream_type: StreamType,
        msg_type: str,
        payload: dict[str, Any],
        transport: TransportType = TransportType.ALL
    ) -> bool:
        """
        Stream a message of any type via the unified bridge.

        Args:
            stream_type: Type of stream (thought, token, gravity, etc.)
            msg_type: Specific message type within the stream
            payload: Message payload data
            transport: Which transport to use

        Returns:
            True if sent successfully via at least one transport
        """
        message = StreamMessage(
            stream_type=stream_type,
            msg_type=msg_type,
            payload=payload,
            timestamp=time.time(),
            sequence=self._next_sequence()
        )

        # Notify subscribers
        self._notify_subscribers(message)

        success = False

        # Send via requested transport(s)
        if transport in (TransportType.ALL, TransportType.SOCKET):
            if self._send_via_socket(message):
                success = True

        if transport in (TransportType.ALL, TransportType.SHARED_MEMORY):
            if self._send_via_shm(message):
                success = True

        if transport in (TransportType.ALL, TransportType.HTTP):
            if self._send_via_http(message):
                success = True

        self.stats.record(stream_type, success)
        return success

    # =========================================================================
    # Convenience Methods for Each Stream Type
    # =========================================================================

    def stream_thought(
        self,
        thought_type: str,
        content: dict[str, Any],
        transport: TransportType = TransportType.ALL
    ) -> bool:
        """
        Stream a daemon thought.

        Args:
            thought_type: Type (task_start, task_complete, gvn, heuristic, etc.)
            content: Thought content
            transport: Which transport to use
        """
        payload = {"type": thought_type, **content}
        return self.stream(StreamType.THOUGHT, thought_type, payload, transport)

    def stream_token(
        self,
        token: str,
        token_type: str = "identifier",
        coords: tuple[int, int, int] | None = None,
        transport: TransportType = TransportType.ALL
    ) -> bool:
        """
        Stream an LLM token.

        Args:
            token: The token string
            token_type: Token type (keyword, string, number, etc.)
            coords: Optional (x, y, z) coordinates (auto-calculated if None)
            transport: Which transport to use
        """
        # Calculate Hilbert coordinates if not provided
        if coords is None and self.hilbert:
            h = self._hash_content(token)
            x, y, z = self.hilbert.d2xyz(self.grid_size, h)
            coords = (x, y, z)

        payload = {
            "token": token,
            "token_type": token_type,
            "coords": coords,
            "color": self.STREAM_COLORS[StreamType.TOKEN]
        }
        return self.stream(StreamType.TOKEN, "token_render", payload, transport)

    def stream_gravity(
        self,
        updates: list[dict[str, Any]],
        transport: TransportType = TransportType.ALL
    ) -> bool:
        """
        Stream gravity engine updates.

        Args:
            updates: List of orb position updates
            transport: Which transport to use
        """
        payload = {
            "updates": updates,
            "count": len(updates),
            "color": self.STREAM_COLORS[StreamType.GRAVITY]
        }
        return self.stream(StreamType.GRAVITY, "gravity_update", payload, transport)

    def stream_ripple(
        self,
        x: float,
        y: float,
        z: float,
        force: float,
        radius: float,
        transport: TransportType = TransportType.ALL
    ) -> bool:
        """
        Stream a tectonic ripple event.

        Args:
            x, y, z: Ripple epicenter coordinates
            force: Force magnitude (positive=repulsion, negative=attraction)
            radius: Effect radius
            transport: Which transport to use
        """
        payload = {
            "x": x, "y": y, "z": z,
            "force": force,
            "radius": radius,
            "color": self.STREAM_COLORS[StreamType.RIPPLE]
        }
        return self.stream(StreamType.RIPPLE, "ripple_render", payload, transport)

    def stream_telemetry(
        self,
        metrics: dict[str, Any],
        transport: TransportType = TransportType.ALL
    ) -> bool:
        """
        Stream system telemetry.

        Args:
            metrics: Telemetry metrics dictionary
            transport: Which transport to use
        """
        payload = {
            "metrics": metrics,
            "color": self.STREAM_COLORS[StreamType.TELEMETRY]
        }
        return self.stream(StreamType.TELEMETRY, "telemetry_update", payload, transport)

    # =========================================================================
    # Transport Implementations
    # =========================================================================

    def _send_via_socket(self, message: StreamMessage) -> bool:
        """Send message via Unix socket to compositor."""
        if not self._socket_bridge:
            return False

        try:
            # Use the compositor bridge's send_thought method
            return self._socket_bridge.send_thought(
                message.to_dict(),
                msg_type=message.msg_type
            )
        except Exception as e:
            logger.error(f"Socket send error: {e}")
            return False

    def _send_via_shm(self, message: StreamMessage) -> bool:
        """Send message via shared memory buffer."""
        if not self._shm_buffer is not None:
            return False

        with self._shm_lock:
            try:
                # Get stream-specific offset
                base_offset = self._shm_offsets.get(message.stream_type, 64)
                max_size = 128 * 1024 if message.stream_type in (StreamType.TELEMETRY, StreamType.RIPPLE) else 512 * 1024

                # Serialize message
                data = message.to_json().encode('utf-8')
                data_len = len(data)

                # Check bounds
                write_offset = self._shm_write_pos.get(message.stream_type, 0)
                if write_offset + data_len + 8 > max_size:
                    # Wrap around
                    write_offset = 0

                # Write: [length:4][sequence:4][json data]
                abs_offset = base_offset + write_offset
                self._shm_buffer[abs_offset:abs_offset+4] = np.frombuffer(
                    data_len.to_bytes(4, 'little'), dtype=np.uint8
                )
                self._shm_buffer[abs_offset+4:abs_offset+8] = np.frombuffer(
                    message.sequence.to_bytes(4, 'little'), dtype=np.uint8
                )
                self._shm_buffer[abs_offset+8:abs_offset+8+data_len] = np.frombuffer(
                    data, dtype=np.uint8
                )

                # Update write position
                self._shm_write_pos[message.stream_type] = write_offset + data_len + 8

                # Update header with latest sequence per stream
                header_offset = message.stream_type.value.__hash__() % 64
                self._shm_buffer[header_offset:header_offset+4] = np.frombuffer(
                    message.sequence.to_bytes(4, 'little'), dtype=np.uint8
                )

                return True

            except Exception as e:
                logger.error(f"SHM write error: {e}")
                return False

    def _send_via_http(self, message: StreamMessage) -> bool:
        """Send message via HTTP broadcast."""
        if not self.enable_http:
            return False

        try:
            import urllib.request

            data = message.to_json().encode('utf-8')
            req = urllib.request.Request(
                self.http_url,
                data=data,
                headers={'Content-Type': 'application/json'},
                method='POST'
            )

            with urllib.request.urlopen(req, timeout=2.0) as response:
                return response.status == 200

        except Exception as e:
            logger.debug(f"HTTP send failed: {e}")
            return False

    # =========================================================================
    # Subscriber System
    # =========================================================================

    def subscribe(self, stream_type: StreamType, callback: Callable[[StreamMessage], None]):
        """
        Subscribe to a stream type.

        Args:
            stream_type: Stream type to subscribe to
            callback: Function to call with each message
        """
        self._subscribers[stream_type].append(callback)
        logger.debug(f"Subscribed to {stream_type.value} stream")

    def unsubscribe(self, stream_type: StreamType, callback: Callable[[StreamMessage], None]):
        """Unsubscribe from a stream type."""
        if callback in self._subscribers[stream_type]:
            self._subscribers[stream_type].remove(callback)

    def _notify_subscribers(self, message: StreamMessage):
        """Notify all subscribers of a new message."""
        for callback in self._subscribers.get(message.stream_type, []):
            try:
                callback(message)
            except Exception as e:
                logger.error(f"Subscriber callback error: {e}")

    # =========================================================================
    # Utility Methods
    # =========================================================================

    def _hash_content(self, content: str) -> int:
        """Map content to a Hilbert index using SHA-256."""
        import hashlib
        h = hashlib.sha256(content.encode('utf-8')).digest()
        val = int.from_bytes(h[:4], byteorder='little')
        return val % (self.grid_size * self.grid_size)

    def get_stats(self) -> dict[str, Any]:
        """Get current statistics."""
        return {
            "thoughts_sent": self.stats.thoughts_sent,
            "tokens_sent": self.stats.tokens_sent,
            "gravity_updates_sent": self.stats.gravity_updates_sent,
            "ripples_sent": self.stats.ripples_sent,
            "telemetry_sent": self.stats.telemetry_sent,
            "errors": self.stats.errors,
            "uptime": time.time() - self.stats.start_time,
            "socket_connected": self._socket_bridge is not None and self._socket_bridge.connected,
            "shm_connected": self._shm is not None,
            "http_enabled": self.enable_http,
        }

    def get_stats_summary(self) -> str:
        """Get human-readable statistics summary."""
        return self.stats.summary()


# =========================================================================
# Integration Helper
# =========================================================================

def create_unified_bridge_for_daemon(
    daemon_type: str = "sisyphus",
    enable_all_transports: bool = True
) -> UnifiedGlassBridge:
    """
    Create a pre-configured unified bridge for daemon integration.

    Args:
        daemon_type: Type of daemon ("sisyphus" or "evolution")
        enable_all_transports: Enable all available transports

    Returns:
        Configured UnifiedGlassBridge instance
    """
    config = {
        "sisyphus": {
            "socket_path": "/tmp/evolution_daemon.sock",
            "shm_name": "glass_box_sisyphus",
        },
        "evolution": {
            "socket_path": "/tmp/evolution_daemon.sock",
            "shm_name": "glass_box_evolution",
        }
    }

    daemon_config = config.get(daemon_type, config["sisyphus"])

    return UnifiedGlassBridge(
        socket_path=daemon_config["socket_path"],
        shm_name=daemon_config["shm_name"],
        enable_socket=enable_all_transports,
        enable_shm=enable_all_transports,
        enable_http=enable_all_transports,
    )


# =========================================================================
# Test/Demo
# =========================================================================

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)

    print("=" * 60)
    print("Unified Glass Box Bridge - Multi-Stream Demo")
    print("=" * 60)

    # Create bridge
    bridge = UnifiedGlassBridge(
        enable_socket=False,  # Socket may not be available
        enable_shm=True,
        enable_http=False
    )

    print("\nConnecting transports...")
    connected = bridge.connect()
    print(f"Connected: {connected}")

    print("\n--- Streaming Multi-Stream Output ---\n")

    # Stream some thoughts
    print("Streaming thoughts...")
    for i in range(3):
        bridge.stream_thought("task_start", {"task_id": i, "task_name": f"Task_{i}"})
        time.sleep(0.1)

    # Stream some tokens
    print("Streaming tokens...")
    tokens = ["def", "calculate", "(", "x", ",", "y", ")", ":", "return", "x", "+", "y"]
    for token in tokens:
        bridge.stream_token(token, token_type="keyword" if token in ["def", "return"] else "identifier")
        time.sleep(0.05)

    # Stream gravity updates
    print("Streaming gravity updates...")
    gravity_updates = [
        {"path": "kernel.rs", "x": 100.0, "y": 150.0, "z": 10.0},
        {"path": "app.py", "x": 200.0, "y": 250.0, "z": 50.0},
        {"path": "config.json", "x": 300.0, "y": 350.0, "z": 100.0},
    ]
    bridge.stream_gravity(gravity_updates)

    # Stream a ripple
    print("Streaming ripple...")
    bridge.stream_ripple(x=500.0, y=500.0, z=50.0, force=100.0, radius=200.0)

    # Stream telemetry
    print("Streaming telemetry...")
    bridge.stream_telemetry({
        "cpu": 45.2,
        "memory": 1024.5,
        "fps": 60,
        "entropy": 0.75
    })

    print("\n--- Statistics ---")
    print(bridge.get_stats_summary())

    print("\n--- Full Stats ---")
    print(json.dumps(bridge.get_stats(), indent=2))

    # Cleanup
    bridge.disconnect()
    print("\nDemo complete.")
