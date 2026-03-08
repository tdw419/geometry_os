import socket
import json
import struct
import time
import threading
import logging
import urllib.request
import urllib.error
from typing import Optional, Dict, Any
from .thought_serializer import ThoughtSerializer
from .native_hilbert import NativeHilbertLUT

logger = logging.getLogger("CompositorBridge")

# Heartbeat message opcode
HEARTBEAT_OPCODE = 0xFE
HEARTBEAT_TIMEOUT = 5.0  # seconds
HEARTBEAT_INTERVAL = 2.0  # seconds between heartbeats

class CompositorBridge:
    """
    Manages connection to the compositor socket with heartbeat monitoring.
    Provides real-time thought streaming for Glass Box visualization.
    """

    def __init__(self, socket_path: str = "/tmp/evolution_daemon.sock"):
        self.socket_path = socket_path
        self.socket: Optional[socket.socket] = None
        self.connected = False
        self.last_heartbeat: float = 0
        self.last_heartbeat_response: float = 0
        self._lock = threading.Lock()
        self._heartbeat_thread: Optional[threading.Thread] = None
        self._running = False
        self._reconnect_attempts = 0
        self._max_reconnect_attempts = 5
        self.serializer = ThoughtSerializer(NativeHilbertLUT())

    def connect(self) -> bool:
        """Connect to the compositor socket."""
        with self._lock:
            if self.connected:
                return True

            try:
                self.socket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
                self.socket.settimeout(HEARTBEAT_TIMEOUT)
                self.socket.connect(self.socket_path)
                self.connected = True
                self._reconnect_attempts = 0
                self.last_heartbeat = time.time()
                self.last_heartbeat_response = time.time()
                logger.info(f"Connected to compositor socket: {self.socket_path}")
                return True
            except (FileNotFoundError, ConnectionRefusedError):
                self.connected = False
                return False
            except Exception as e:
                logger.error(f"Failed to connect to compositor: {e}")
                self.connected = False
                return False

    def disconnect(self):
        """Disconnect from the compositor socket."""
        with self._lock:
            self._running = False
            self.connected = False
            if self.socket:
                try:
                    self.socket.close()
                except:
                    pass
                self.socket = None
            logger.info("Disconnected from compositor socket")

    def send_thought(self, payload: Dict[str, Any], msg_type: str = "Thought") -> bool:
        """
        Send a thought/message to the compositor socket.
        Includes both JSON metadata and geometric glyph commands.
        """
        with self._lock:
            if not self.connected or not self.socket:
                return False

            try:
                # 1. High-level JSON message
                message = {
                    "msg_type": msg_type,
                    "sequence": int(time.time() * 1000) % 0xFFFFFFFF,
                    "payload": payload
                }
                json_data = json.dumps(message).encode('utf-8')
                
                # 2. Geometric Glyph Command
                glyph = self.serializer.serialize(payload)
                glyph_cmd = self.serializer.to_glyph_command(glyph)
                
                # Pack: [Length (4b)] [JSON] [Glyph Command (16b)]
                total_payload = json_data + glyph_cmd
                length_bytes = struct.pack('>I', len(total_payload))
                
                self.socket.sendall(length_bytes + total_payload)
                
                # Heartbeat handling
                if msg_type == "Heartbeat":
                    self.socket.settimeout(HEARTBEAT_TIMEOUT)
                    response_length = self.socket.recv(4)
                    if len(response_length) >= 4:
                        length = struct.unpack('>I', response_length)[0]
                        self.socket.recv(length) # Drain response
                        self.last_heartbeat_response = time.time()
                        return True
                
                return True

            except Exception as e:
                logger.error(f"Socket send error: {e}")
                self._handle_disconnect()
                return False

    def send_heartbeat(self) -> bool:
        return self.send_thought({"opcode": HEARTBEAT_OPCODE, "timestamp": time.time()}, msg_type="Heartbeat")

    def _handle_disconnect(self):
        self.connected = False
        if self.socket:
            try: self.socket.close()
            except: pass
            self.socket = None

    def start_heartbeat_loop(self):
        if self._heartbeat_thread and self._heartbeat_thread.is_alive(): return
        self._running = True
        self._heartbeat_thread = threading.Thread(target=self._heartbeat_loop, daemon=True)
        self._heartbeat_thread.start()

    def _heartbeat_loop(self):
        while self._running:
            try:
                if not self.connected:
                    self._reconnect_attempts += 1
                    if self._reconnect_attempts <= self._max_reconnect_attempts:
                        if self.connect(): self._reconnect_attempts = 0
                    else:
                        time.sleep(10)
                        self._reconnect_attempts = 0
                if self.connected:
                    self.send_heartbeat()
                time.sleep(HEARTBEAT_INTERVAL)
            except Exception as e:
                logger.error(f"Heartbeat loop error: {e}")
                time.sleep(1)

    def stop_heartbeat_loop(self):
        self._running = False
        if self._heartbeat_thread: self._heartbeat_thread.join(timeout=2.0)

    # =========================================================================
    # HTTP Broadcast Support (for Glass Box WebSocket integration)
    # =========================================================================

    def send_thought_http(self, payload: Dict[str, Any], http_url: str = "http://localhost:3002/thoughts/broadcast") -> bool:
        """
        Send a thought via HTTP to the visual_bridge WebSocket server.

        This allows the daemon to broadcast thoughts to connected browsers
        without needing a direct Unix socket connection.

        Args:
            payload: The thought payload to send
            http_url: The HTTP endpoint for thought broadcasting

        Returns:
            True if successful, False otherwise
        """
        try:
            # Serialize the thought for glyph command
            glyph = self.serializer.serialize(payload)
            glyph_cmd = self.serializer.to_glyph_command(glyph)

            # Create the full message
            message = {
                "msg_type": "Thought",
                "sequence": int(time.time() * 1000) % 0xFFFFFFFF,
                "payload": payload,
                "glyph": {
                    "hilbert_index": glyph.hilbert_index,
                    "color": glyph.color,
                    "thought_type": glyph.thought_type
                }
            }

            data = json.dumps(message).encode('utf-8')
            req = urllib.request.Request(
                http_url,
                data=data,
                headers={'Content-Type': 'application/json'},
                method='POST'
            )

            with urllib.request.urlopen(req, timeout=5.0) as response:
                if response.status == 200:
                    return True
                logger.error(f"HTTP broadcast failed: {response.status}")
                return False

        except urllib.error.URLError as e:
            logger.debug(f"HTTP broadcast unavailable: {e}")
            return False
        except Exception as e:
            logger.error(f"HTTP broadcast error: {e}")
            return False

    def broadcast_thought(self, thought: Dict[str, Any]) -> bool:
        """
        Broadcast a thought using the best available method.

        Prefers Unix socket if connected, falls back to HTTP broadcast.

        Args:
            thought: The thought payload to broadcast

        Returns:
            True if sent successfully via any method
        """
        # Try socket first
        if self.connected and self.socket:
            if self.send_thought(thought):
                return True

        # Fall back to HTTP broadcast
        return self.send_thought_http(thought)
