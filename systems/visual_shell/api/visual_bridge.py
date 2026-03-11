"""
Geometry OS Visual Bridge - Multi-VM Multiplexed Streaming

Reads orchestrator state from /dev/shm/geometry_orchestrator to discover
active VMs and their spatial positions, then multiplexes visual streams
to the PixiJS frontend.

Phase 6: Multi-VM Orchestration & Visual Organisms
Phase 7: FFI Bridge Integration for CV/Analysis
"""

import asyncio
import json
import mmap
import os
import struct
import sys
import time
from collections.abc import Callable
from concurrent.futures import ThreadPoolExecutor
from contextlib import asynccontextmanager
from dataclasses import dataclass, field
from typing import Any

import numpy as np
import uvicorn
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../../..")))
try:
    from logger_config import get_logger
except ImportError:
    from .logger_config import get_logger


# Global instances
streamers: dict[str, "MemoryStreamer"] = {}

# Initialize multi_vm_streamer at module level for test compatibility
# The lifespan will properly start/stop the watcher when the app runs
multi_vm_streamer: "MultiVmStreamer" = None  # type: ignore[assignment]


def _init_multi_vm_streamer() -> "MultiVmStreamer":
    """Initialize multi_vm_streamer if not already initialized."""
    global multi_vm_streamer
    if multi_vm_streamer is None:
        multi_vm_streamer = MultiVmStreamer()
    return multi_vm_streamer


def get_multi_vm_streamer() -> "MultiVmStreamer":
    """Get the global multi_vm_streamer instance."""
    return _init_multi_vm_streamer()


@asynccontextmanager
async def lifespan(app: FastAPI):
    """Modern FastAPI lifespan context manager for startup/shutdown.

    Handles:
    - Starting the orchestrator watcher on startup
    - Stopping the watcher and cleaning up resources on shutdown
    - Initializing FFI Bridge for CV/analysis
    """
    global multi_vm_streamer, ffi_bridge
    logger = get_logger(f"{__name__}.lifespan")

    # Ensure multi_vm_streamer is initialized (it should be from import)
    _init_multi_vm_streamer()

    # Initialize FFI Bridge
    _init_ffi_bridge()
    logger.info("FFI Bridge initialized")

    # Startup: Start the orchestrator watcher if not already running
    if not multi_vm_streamer.watcher.running:
        await multi_vm_streamer.start()
        logger.info("Visual Bridge lifespan started")
    else:
        logger.info("Visual Bridge lifespan started (watcher already running)")

    yield  # Application runs here

    # Shutdown: Clean up resources
    logger.info("Visual Bridge shutting down...")

    # Stop the orchestrator watcher
    if multi_vm_streamer and multi_vm_streamer.watcher:
        multi_vm_streamer.watcher.stop()

    # Close all active streamers
    if multi_vm_streamer:
        for vm_id, streamer in list(multi_vm_streamer.streamers.items()):
            try:
                streamer.close()
            except Exception as e:
                logger.error(f"Error closing streamer for {vm_id}: {e}")
        multi_vm_streamer.streamers.clear()

    # Shutdown FFI Bridge
    if ffi_bridge:
        ffi_bridge.shutdown()
        logger.info("FFI Bridge shutdown")

    logger.info("Visual Bridge shutdown complete")


app = FastAPI(title="Geometry OS Visual Bridge - Multi-VM", lifespan=lifespan)

# SECURITY: Configure restrictive CORS instead of wildcard
# In production, replace with actual allowed origins from environment variable
import os

ALLOWED_ORIGINS = os.environ.get(
    "ALLOWED_ORIGINS",
    "http://localhost:3000,http://localhost:8080,http://127.0.0.1:3000,http://127.0.0.1:8080"
).split(",")

app.add_middleware(
    CORSMiddleware,
    allow_origins=ALLOWED_ORIGINS,
    allow_credentials=False,  # SECURITY: Cannot use True with wildcard, use explicit origins
    allow_methods=["GET", "POST", "OPTIONS"],
    allow_headers=["Content-Type", "Authorization"],
)

# Orchestrator state file path
ORCHESTRATOR_SHM_PATH = "/dev/shm/geometry_orchestrator"


@dataclass
class SpatialComponent:
    """Spatial data for an organism."""
    x: float = 0.0
    y: float = 0.0
    radius: float = 10.0
    velocity: dict[str, float] = field(default_factory=lambda: {"x": 0.0, "y": 0.0})


@dataclass
class OrganismState:
    """State of a single VM organism."""
    id: str
    status: str = "Running"
    spatial: SpatialComponent = field(default_factory=SpatialComponent)
    metrics: dict = field(default_factory=dict)
    spawned_at: int = 0


class OrchestratorWatcher:
    """Watches the orchestrator state file for VM discovery."""

    def __init__(self, poll_interval: float = 0.5):
        self.poll_interval = poll_interval
        self.known_organisms: dict[str, OrganismState] = {}
        self.running = False
        self.logger = get_logger(f"{__name__}.OrchestratorWatcher")

    async def watch(self, on_change: callable):
        """Poll the orchestrator state file and call on_change when VMs change."""
        self.running = True
        last_count = 0

        while self.running:
            try:
                state = self.read_state()
                if state:
                    organisms = state.get("organisms", [])
                    current_ids = {o["id"] for o in organisms}

                    # Check for new or removed VMs
                    known_ids = set(self.known_organisms.keys())
                    new_ids = current_ids - known_ids
                    removed_ids = known_ids - current_ids

                    if new_ids or removed_ids or len(organisms) != last_count:
                        # Update known organisms
                        self.known_organisms.clear()
                        for o in organisms:
                            spatial = SpatialComponent(
                                x=o.get("spatial", {}).get("x", 0.0),
                                y=o.get("spatial", {}).get("y", 0.0),
                                radius=o.get("spatial", {}).get("radius", 10.0),
                                velocity=o.get("spatial", {}).get("velocity", {"x": 0.0, "y": 0.0}),
                            )
                            self.known_organisms[o["id"]] = OrganismState(
                                id=o["id"],
                                status=o.get("status", "Running"),
                                spatial=spatial,
                                metrics=o.get("metrics", {}),
                                spawned_at=o.get("spawned_at", 0),
                            )

                        await on_change(new_ids, removed_ids, self.known_organisms)
                        last_count = len(organisms)
            except Exception as e:
                self.logger.error(f"Error reading state: {e}")

            await asyncio.sleep(self.poll_interval)

    def read_state(self) -> dict | None:
        """Read the orchestrator state file."""
        try:
            if not os.path.exists(ORCHESTRATOR_SHM_PATH):
                return None

            with open(ORCHESTRATOR_SHM_PATH) as f:
                return json.load(f)
        except Exception as e:
            self.logger.error(f"Failed to read {ORCHESTRATOR_SHM_PATH}: {e}")
            return None

    def stop(self):
        """Stop the watcher."""
        self.running = False


class MemoryStreamer:
    """Manages high-speed bidirectional streaming between shared memory and WebSockets."""

    def __init__(self, vm_id: str, width: int = 2048, height: int = 2048):
        self.vm_id = vm_id
        self.width = width
        self.height = height
        self.shm_path = f"/dev/shm/geometry_vm_{vm_id}_visual"
        self.ram_shm_path = f"/dev/shm/geometry_vm_{vm_id}"
        self.header_size = 4096
        self.pixel_data_size = width * height * 4  # RGBA8
        self.total_size = self.header_size + self.pixel_data_size

        self.viz_mm: mmap.mmap | None = None
        self.ram_mm: mmap.mmap | None = None
        self.is_streaming = False
        self._closed = False  # Track explicit closure state

        # RAM configuration
        self.ram_size = 512 * 1024 * 1024
        self.whitelist_start = self.ram_size - (1024 * 1024)
        self.whitelist_end = self.ram_size
        self.ring_offset = self.ram_size - (4 * 1024 * 1024)
        self.logger = get_logger(f"{__name__}.MemoryStreamer.{vm_id}")

    def _is_mmap_valid(self, mm: mmap.mmap | None) -> bool:
        """Check if an mmap object is valid and not closed."""
        if mm is None:
            return False
        try:
            # Try to get the size - this will raise ValueError if closed
            mm.size()
            return True
        except (ValueError, AttributeError, OSError):
            return False

    def close(self):
        """Clean up shared memory resources."""
        if self._closed:
            return
        self._closed = True
        self.is_streaming = False

        # Close viz_mm with ValueError handling for already-closed mmaps
        if self._is_mmap_valid(self.viz_mm):
            try:
                self.viz_mm.close()
            except ValueError:
                pass  # Already closed - this is fine
            except Exception as e:
                self.logger.error(f"Error closing viz_mm: {e}")
        self.viz_mm = None

        # Close ram_mm with ValueError handling for already-closed mmaps
        if self._is_mmap_valid(self.ram_mm):
            try:
                self.ram_mm.close()
            except ValueError:
                pass  # Already closed - this is fine
            except Exception as e:
                self.logger.error(f"Error closing ram_mm: {e}")
        self.ram_mm = None

    def __del__(self):
        """Cleanup on garbage collection - handles already-closed mmaps gracefully."""
        try:
            self.close()
        except (ValueError, AttributeError, OSError):
            # Mmap already closed or invalid - this is expected during GC
            pass

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()
        return False

    async def __aenter__(self):
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        self.close()
        return False

    def get_geo_metrics(self) -> dict:
        """Read VirtIO-Geo metrics from the ring header."""
        if not self.ram_mm:
            return {}
        try:
            self.ram_mm.seek(self.ring_offset)
            header_bytes = self.ram_mm.read(64)
            head, tail, c_head, c_tail, size = struct.unpack("<IIIII", header_bytes[0:20])
            if size == 0:
                return {}
            return {
                "geo_active": True,
                "submission_depth": (tail - head) % size,
                "completion_depth": (c_head - c_tail) % size,
                "total_processed": c_head,
            }
        except Exception as e:
            return {"geo_error": str(e)}

    def connect_shm(self) -> bool:
        """Connect to the shared memory segments."""
        try:
            # Reset closed state on new connection attempt
            self._closed = False

            if os.path.exists(self.shm_path):
                fd_viz = os.open(self.shm_path, os.O_RDONLY)
                try:
                    self.viz_mm = mmap.mmap(fd_viz, self.total_size, access=mmap.ACCESS_READ)
                    self.logger.debug(f"Connected to Visual SHM: {self.shm_path}")
                finally:
                    try:
                        os.close(fd_viz)
                    except Exception:
                        pass

            if os.path.exists(self.ram_shm_path):
                fd_ram = os.open(self.ram_shm_path, os.O_RDWR)
                try:
                    self.ram_mm = mmap.mmap(fd_ram, self.ram_size, access=mmap.ACCESS_WRITE)
                    self.logger.debug(f"Connected to RAM SHM: {self.ram_shm_path}")
                finally:
                    try:
                        os.close(fd_ram)
                    except Exception:
                        pass

            return self.viz_mm is not None
        except Exception as e:
            self.logger.error(f"Failed to connect to SHM: {e}")
            return False

    async def handle_commands(self, websocket: WebSocket):
        """Listen for incoming commands from the UI."""
        try:
            while self.is_streaming:
                message = await websocket.receive_text()
                cmd = json.loads(message)

                if cmd.get("type") == "write_memory":
                    addr = cmd.get("address")
                    value = cmd.get("value")

                    if addr is not None and value is not None:
                        if self.whitelist_start <= addr < self.whitelist_end:
                            if self.ram_mm:
                                self.ram_mm.seek(addr)
                                if isinstance(value, int):
                                    self.ram_mm.write(bytes([value & 0xFF]))
                                else:
                                    self.ram_mm.write(bytes(value))
                        else:
                            self.logger.error(f"REJECTED write to 0x{addr:X}")

        except WebSocketDisconnect:
            pass
        except Exception as e:
            self.logger.error(f"Command handler error: {e}")

    async def stream_visuals(self, websocket: WebSocket):
        """Stream visual frames to the UI."""
        try:
            while self.is_streaming:
                if self.viz_mm:
                    self.viz_mm.seek(0)
                    data = self.viz_mm.read(self.total_size)

                    meta_len = struct.unpack("<I", data[0:4])[0]
                    payload = data[0:4] + data[4 : 4 + meta_len] + data[self.header_size :]
                    await websocket.send_bytes(payload)

                await asyncio.sleep(1 / 60)
        except WebSocketDisconnect:
            pass
        except Exception as e:
            self.logger.error(f"Visual stream error: {e}")

    async def stream_geo_metrics(self, websocket: WebSocket):
        """Stream VirtIO-Geo metrics periodically."""
        try:
            while self.is_streaming:
                metrics = self.get_geo_metrics()
                if metrics:
                    await websocket.send_text(json.dumps({"type": "geo_metrics", "data": metrics}))
                await asyncio.sleep(0.5)
        except WebSocketDisconnect:
            pass
        except Exception as e:
            self.logger.error(f"Geo metrics stream error: {e}")

    async def stream(self, websocket: WebSocket):
        """Start bidirectional streaming."""
        if not self.viz_mm and not self.connect_shm():
            await websocket.send_text(json.dumps({"error": "SHM not found"}))
            return

        self.is_streaming = True
        self.logger.info(f"Starting session for VM {self.vm_id}")

        try:
            await asyncio.gather(
                self.stream_visuals(websocket),
                self.handle_commands(websocket),
                self.stream_geo_metrics(websocket),
            )
        finally:
            self.is_streaming = False


class FFIBridge:
    """
    Python FFI Bridge for Visual Shell CV/Analysis.

    Provides safe execution of whitelisted numpy/scipy functions
    for real-time computer vision and data analysis operations.
    """

    def __init__(self, registry_path: str | None = None):
        self.logger = get_logger(f"{__name__}.FFIBridge")
        self.functions: dict[str, dict] = {}
        self.id_to_name: dict[int, str] = {}
        self.executor = ThreadPoolExecutor(max_workers=4)
        self._loaded = False

        if registry_path is None:
            # Default registry path relative to this file
            registry_path = os.path.join(
                os.path.dirname(__file__),
                "..", "..", "..", "visual-vm", "ffi_registry.json"
            )

        self.registry_path = registry_path
        self._load_registry()

    def _load_registry(self) -> bool:
        """Load the FFI function registry."""
        try:
            if not os.path.exists(self.registry_path):
                self.logger.warning(f"FFI registry not found: {self.registry_path}")
                return False

            with open(self.registry_path) as f:
                data = json.load(f)

            self.functions = data.get("functions", {})
            self.id_to_name = {
                meta["id"]: name
                for name, meta in self.functions.items()
            }
            self.dangerous_patterns = data.get("dangerousPatterns", [])
            self._loaded = True
            self.logger.info(f"Loaded {len(self.functions)} FFI functions")
            return True
        except Exception as e:
            self.logger.error(f"Failed to load FFI registry: {e}")
            return False

    def is_whitelisted(self, func_name: str) -> bool:
        """Check if a function is whitelisted."""
        return func_name in self.functions

    def get_function_by_id(self, func_id: int) -> str | None:
        """Get function name by ID."""
        return self.id_to_name.get(func_id)

    def get_whitelisted_functions(self) -> list[str]:
        """Get list of all whitelisted functions."""
        return list(self.functions.keys())

    def get_function_info(self, func_name: str) -> dict | None:
        """Get metadata for a function."""
        return self.functions.get(func_name)

    def _resolve_function(self, func_name: str) -> Callable | None:
        """Resolve a function name to a callable."""
        if not self.is_whitelisted(func_name):
            return None

        try:
            parts = func_name.split(".")
            if parts[0] == "numpy":
                module = np
                for part in parts[1:]:
                    if part == "linalg":
                        module = np.linalg
                    else:
                        module = getattr(module, part)
                return module
            elif parts[0] == "scipy":
                import scipy
                module = scipy
                for part in parts[1:]:
                    if part == "optimize":
                        module = scipy.optimize
                    elif part == "signal":
                        module = scipy.signal
                    elif part == "ndimage":
                        module = scipy.ndimage
                    else:
                        module = getattr(module, part)
                return module
            elif func_name in ("len", "range", "enumerate", "zip", "map", "filter"):
                return eval(func_name)  # Safe: only builtins in whitelist
            return None
        except Exception as e:
            self.logger.error(f"Failed to resolve function {func_name}: {e}")
            return None

    async def execute(
        self,
        func_name: str,
        args: list[Any],
        kwargs: dict | None = None
    ) -> dict:
        """
        Execute a whitelisted Python function.

        Returns a dict with:
        - status: "ok" or "error"
        - result: the function result (serialized)
        - error: error message if status is "error"
        """
        if not self._loaded:
            return {"status": "error", "error": "FFI registry not loaded"}

        if not self.is_whitelisted(func_name):
            return {"status": "error", "error": f"Function '{func_name}' is not whitelisted"}

        func = self._resolve_function(func_name)
        if func is None:
            return {"status": "error", "error": f"Could not resolve function '{func_name}'"}

        kwargs = kwargs or {}

        try:
            # Run in thread pool to avoid blocking
            loop = asyncio.get_event_loop()
            result = await loop.run_in_executor(
                self.executor,
                lambda: func(*args, **kwargs)
            )

            # Serialize result
            serialized = self._serialize_result(result)
            return {"status": "ok", "result": serialized}
        except Exception as e:
            self.logger.error(f"FFI execution error for {func_name}: {e}")
            return {"status": "error", "error": str(e)}

    def _serialize_result(self, result: Any) -> Any:
        """Serialize a result for JSON transmission."""
        if isinstance(result, np.ndarray):
            return {
                "__ndarray__": True,
                "data": result.tolist(),
                "dtype": str(result.dtype),
                "shape": list(result.shape)
            }
        elif isinstance(result, (np.integer, np.floating)):
            return float(result) if isinstance(result, np.floating) else int(result)
        elif isinstance(result, tuple):
            return {"__tuple__": True, "data": [self._serialize_result(x) for x in result]}
        elif isinstance(result, dict):
            return {k: self._serialize_result(v) for k, v in result.items()}
        elif isinstance(result, list):
            return [self._serialize_result(x) for x in result]
        else:
            return result

    def shutdown(self):
        """Shutdown the executor."""
        self.executor.shutdown(wait=False)


# Global FFI Bridge instance
ffi_bridge: FFIBridge = None  # type: ignore[assignment]


def _init_ffi_bridge() -> FFIBridge:
    """Initialize the FFI bridge."""
    global ffi_bridge
    if ffi_bridge is None:
        ffi_bridge = FFIBridge()
    return ffi_bridge


class MultiVmStreamer:
    """Multiplexes visual streams from multiple VMs."""

    def __init__(self):
        self.streamers: dict[str, MemoryStreamer] = {}
        self.watcher = OrchestratorWatcher()
        self.active_websockets: set[WebSocket] = set()
        self.logger = get_logger(f"{__name__}.MultiVmStreamer")
        # Track active thought glyphs for PixelBrain visualization
        self._active_glyphs: list[dict[str, Any]] = []

    async def start(self):
        """Start the orchestrator watcher."""
        asyncio.create_task(self.watcher.watch(self._on_organisms_changed))
        self.logger.info("Started orchestrator watcher")

    async def broadcast_event(self, event_data: dict):
        """Broadcast an arbitrary event to all connected frontends."""
        message = {
            "type": "event",
            "data": event_data
        }
        message_json = json.dumps(message)

        disconnected = set()
        for ws in self.active_websockets:
            try:
                await ws.send_text(message_json)
            except Exception:
                disconnected.add(ws)

        for ws in disconnected:
            self.active_websockets.discard(ws)

    async def _on_organisms_changed(
        self,
        new_ids: set[str],
        removed_ids: set[str],
        organisms: dict[str, OrganismState]
    ):
        """Handle changes in the organism population."""
        if new_ids:
            self.logger.info(f"New organisms: {new_ids}")
        if removed_ids:
            self.logger.info(f"Removed organisms: {removed_ids}")
            for vm_id in removed_ids:
                if vm_id in self.streamers:
                    self.streamers[vm_id].close()
                    del self.streamers[vm_id]

        # Notify all connected websockets about the change
        state_update = {
            "type": "orchestrator_state",
            "organisms": [
                {
                    "id": o.id,
                    "status": o.status,
                    "spatial": {
                        "x": o.spatial.x,
                        "y": o.spatial.y,
                        "radius": o.spatial.radius,
                        "velocity": o.spatial.velocity,
                    },
                    "metrics": o.metrics,
                }
                for o in organisms.values()
            ],
        }

        for ws in list(self.active_websockets):
            try:
                await ws.send_text(json.dumps(state_update))
            except Exception:
                self.active_websockets.discard(ws)

    async def stream_multiplexed(self, websocket: WebSocket):
        """Stream all organisms to a websocket."""
        await websocket.accept()
        self.active_websockets.add(websocket)

        try:
            # Send current state
            state = self.watcher.read_state()
            if state:
                await websocket.send_text(json.dumps({
                    "type": "orchestrator_state",
                    **state
                }))

            # Stream updates
            while True:
                await asyncio.sleep(0.1)

                # Send periodic state updates
                state = self.watcher.read_state()
                if state:
                    await websocket.send_text(json.dumps({
                        "type": "orchestrator_state",
                        **state
                    }))

        except WebSocketDisconnect:
            pass
        finally:
            self.active_websockets.discard(websocket)

    def get_or_create_streamer(self, vm_id: str) -> MemoryStreamer:
        """Get or create a streamer for a VM."""
        if vm_id not in self.streamers:
            self.streamers[vm_id] = MemoryStreamer(vm_id)
        return self.streamers[vm_id]

    # ========================================================================
    # THOUGHT_PULSE Emission (Task 4: PixelBrain Visual Feedback)
    # ========================================================================

    def emit_thought_pulse(
        self,
        token_id: int,
        position: tuple,
        intensity: float = 1.0
    ) -> bool:
        """
        Emit a THOUGHT_PULSE (0xCE) glyph for LLM output visualization.

        This method is called by the PixelBrain inference pipeline when
        generating tokens. Each emitted glyph creates a visual pulse on
        the Visual Shell that can be rendered by the PixiJS frontend.

        Args:
            token_id: The generated token ID (e.g., from tokenizer)
            position: (x, y) screen position for the glyph
            intensity: Pulse brightness (0-1, affects visual intensity)

        Returns:
            True if emission successful

        Example:
            >>> bridge.emit_thought_pulse(
            ...     token_id=15496,  # "Hello"
            ...     position=(100, 100),
            ...     intensity=1.0
            ... )
            True
        """
        # Create thought glyph with THOUGHT_RENDER opcode (0xCE)
        glyph = {
            "opcode": 0xCE,  # THOUGHT_RENDER - triggers pulse effect in WGSL shader
            "token_id": token_id,
            "x": position[0],
            "y": position[1],
            "intensity": max(0.0, min(1.0, intensity)),  # Clamp to [0, 1]
            "timestamp": time.time()
        }

        # Add to active glyphs list
        self._active_glyphs.append(glyph)

        # Log emission for debugging
        self.logger.debug(
            f"Emitted THOUGHT_PULSE: token={token_id}, "
            f"pos=({position[0]}, {position[1]}), "
            f"intensity={intensity:.2f}"
        )

        # Broadcast to all connected WebSocket clients
        async def _broadcast():
            """Broadcast glyph to all connected clients."""
            message = {
                "type": "THOUGHT_PULSE",
                "opcode": glyph["opcode"],
                "token_id": glyph["token_id"],
                "x": glyph["x"],
                "y": glyph["y"],
                "intensity": glyph["intensity"],
                "timestamp": glyph["timestamp"]
            }

            dead_connections = set()
            for ws in list(self.active_websockets):
                try:
                    await ws.send_json(message)
                except Exception:
                    # Connection failed, mark for removal
                    dead_connections.add(ws)

            # Clean up dead connections
            for ws in dead_connections:
                self.active_websockets.discard(ws)

        # Schedule broadcast on event loop
        try:
            loop = asyncio.get_running_loop()
            # Loop is running, schedule broadcast as task
            asyncio.create_task(_broadcast())
        except RuntimeError:
            # No running event loop available (e.g., synchronous test context)
            # Try to create a new loop for broadcast
            try:
                asyncio.run(_broadcast())
            except Exception as e:
                self.logger.debug(f"Could not broadcast THOUGHT_PULSE: {e}")

        return True

    def has_active_glyphs(self) -> bool:
        """
        Check if there are active thought glyphs.

        Returns:
            True if there are pending glyphs to render
        """
        return len(self._active_glyphs) > 0

    def get_active_glyphs(self) -> list[dict[str, Any]]:
        """
        Get list of active thought glyphs.

        Returns a copy of the internal glyphs list to prevent
        external mutation.

        Returns:
            List of glyph dictionaries, each containing:
            - opcode: 0xCE (THOUGHT_RENDER)
            - token_id: The token that was generated
            - x, y: Screen position
            - intensity: Visual intensity (0-1)
            - timestamp: Unix timestamp of emission
        """
        return self._active_glyphs.copy()

    def emit_atlas_glow(
        self,
        weight_indices: list[int],
        intensity: float = 1.0,
        duration_ms: int = 500
    ) -> bool:
        """
        Emit an ATLAS_GLOW event highlighting accessed weight pixels.

        This visualizes which parts of the brain atlas are being used
        during inference, making the model's "thinking" visible.

        Args:
            weight_indices: List of Hilbert indices that were accessed
            intensity: Glow intensity (0-1)
            duration_ms: How long the glow should last

        Returns:
            True if emission successful
        """
        if not weight_indices:
            return False

        glow = {
            "type": "ATLAS_GLOW",
            "indices": weight_indices[:100],  # Limit to first 100 for performance
            "intensity": max(0.0, min(1.0, intensity)),
            "duration_ms": duration_ms,
            "timestamp": time.time()
        }

        async def _broadcast():
            """Broadcast glow to all connected clients."""
            dead_sockets = set()
            for ws in list(self.active_websockets):
                try:
                    await ws.send_json(glow)
                except Exception:
                    dead_sockets.add(ws)
            # Clean up dead connections
            self.active_websockets -= dead_sockets

        # Schedule broadcast on event loop
        self._dispatch_event(glow)
        return True

    def _dispatch_event(self, event: dict[str, Any]) -> None:
        """Helper to dispatch an event to all connected WebSocket clients."""
        async def _broadcast():
            dead_sockets = set()
            for ws in list(self.active_websockets):
                try:
                    await ws.send_json(event)
                except Exception:
                    dead_sockets.add(ws)
            self.active_websockets -= dead_sockets

        try:
            loop = asyncio.get_running_loop()
            loop.create_task(_broadcast())
        except RuntimeError:
            try:
                asyncio.run(_broadcast())
            except Exception:
                pass

    def emit_kernel_hotspot(self, function_name: str, duration_ms: float) -> None:
        """Emit KERNEL_HOTSPOT event to highlight performance bottlenecks."""
        msg = {
            "type": "KERNEL_HOTSPOT",
            "function": function_name,
            "duration": duration_ms,
            "opcode": 0xDA, # ANALYZE_HOT_PATHS
            "timestamp": time.time()
        }
        self._dispatch_event(msg)

    def emit_kernel_rewrite(self, function_name: str, speedup: float) -> None:
        """Emit KERNEL_REWRITE event to highlight self-modification."""
        msg = {
            "type": "KERNEL_REWRITE",
            "function": function_name,
            "speedup": speedup,
            "opcode": 0xDF, # KERNEL_REWRITE
            "timestamp": time.time()
        }
        self._dispatch_event(msg)

    def emit_tectonic_ripple(self, x: float, y: float, z: float, force: float, radius: float) -> None:
        """Emit TECTONIC_RIPPLE event for visual expansion/collapse waves."""
        msg = {
            "type": "TECTONIC_RIPPLE",
            "x": x,
            "y": y,
            "z": z,
            "force": force,
            "radius": radius,
            "timestamp": time.time()
        }
        self._dispatch_event(msg)

    def emit_camera_saccade(self, x: float, y: float, z: float, duration_ms: int = 1000) -> None:
        """Emit CAMERA_SACCADE event to move the visual viewport."""
        msg = {
            "type": "CAMERA_SACCADE",
            "x": x,
            "y": y,
            "z": z,
            "duration": duration_ms,
            "timestamp": time.time()
        }
        self._dispatch_event(msg)

    # ========================================================================
    # ATTENTION_UPDATE Emission (Task 9.2: Glass Box Introspection)
    # ========================================================================

    def _calculate_attention_entropy(self, weights: list[float]) -> float:
        """
        Calculate entropy of attention distribution.

        Args:
            weights: List of attention weights (softmax scores)

        Returns:
            Entropy in bits (0 = focused, log2(n) = uniform)
        """
        # Handle numpy arrays
        if isinstance(weights, np.ndarray):
            weights = weights.tolist()

        if not weights or len(weights) == 0:
            return 0.0

        # Filter out zero values to avoid log(0)
        non_zero_weights = [w for w in weights if w > 0]
        if not non_zero_weights:
            return 0.0

        # Calculate probabilities
        total = sum(non_zero_weights)
        probabilities = [w / total for w in non_zero_weights]

        # Calculate entropy: H = -sum(p * log2(p))
        entropy = 0.0
        for p in probabilities:
            entropy -= p * np.log2(p)

        return entropy

    def emit_attention_update(
        self,
        layer: int,
        head: int,
        weights: list[float]
    ) -> bool:
        """
        Emit an ATTENTION_UPDATE event for real-time attention visualization.

        This method is called by the PixelBrain inference pipeline after
        computing attention weights. It broadcasts the weights to connected
        WebSocket clients for visualization by AttentionVisualizer.js.

        Args:
            layer: Transformer layer index (0-7 for TinyStories-1M)
            head: Attention head index (0-7 for 8-head attention)
            weights: List of attention weights (softmax scores)

        Returns:
            True if emission successful

        Example:
            >>> bridge.emit_attention_update(
            ...     layer=0,
            ...     head=2,
            ...     weights=[0.1, 0.2, 0.3, 0.15, 0.25]
            ... )
            True
        """
        if weights is None:
            return False

        # Ensure weights is a list (convert numpy array if needed)
        if isinstance(weights, np.ndarray):
            weights = weights.tolist()

        # Clamp layer and head to valid ranges
        layer = max(0, min(layer, 7))
        head = max(0, min(head, 7))

        # Calculate max_weight and entropy
        max_weight = max(weights)
        entropy = self._calculate_attention_entropy(weights)

        # Create the ATTENTION_UPDATE message
        update = {
            "type": "ATTENTION_UPDATE",
            "timestamp": time.time(),
            "layer": layer,
            "head": head,
            "weights": weights,
            "max_weight": max_weight,
            "entropy": entropy
        }

        async def _broadcast():
            """Broadcast attention update to all connected clients."""
            dead_sockets = set()
            for ws in list(self.active_websockets):
                try:
                    await ws.send_json(update)
                except Exception:
                    dead_sockets.add(ws)
            # Clean up dead connections
            self.active_websockets -= dead_sockets

        # Schedule broadcast on event loop
        try:
            loop = asyncio.get_running_loop()
            loop.create_task(_broadcast())
        except RuntimeError:
            # No running event loop - try to run synchronously
            try:
                asyncio.run(_broadcast())
            except Exception:
                pass  # Silently fail in test contexts

        self.logger.debug(
            f"Emitted ATTENTION_UPDATE: layer={layer}, head={head}, "
            f"weights_len={len(weights)}"
        )

        return True


# Note: multi_vm_streamer is initialized at module import time for test compatibility
# The lifespan context manager handles proper startup/shutdown of the watcher


@app.get("/status")
async def get_status():
    """Get current bridge status."""
    state = multi_vm_streamer.watcher.read_state()
    return {
        "status": "online",
        "active_vms": list(multi_vm_streamer.streamers.keys()),
        "known_organisms": list(multi_vm_streamer.watcher.known_organisms.keys()),
        "orchestrator_state": state,
        "whitelist": {"start": "0x1FF00000", "end": "0x20000000", "size": "1MB"},
    }


@app.get("/organisms")
async def get_organisms():
    """Get all known organisms from the orchestrator."""
    state = multi_vm_streamer.watcher.read_state()
    if state:
        return state.get("organisms", [])
    return []


@app.websocket("/ws/v1/memory/{vm_id}")
async def websocket_single_vm(websocket: WebSocket, vm_id: str):
    """Stream a single VM's memory visualization."""
    await websocket.accept()
    streamer = multi_vm_streamer.get_or_create_streamer(vm_id)
    await streamer.stream(websocket)


@app.websocket("/ws/v1/orchestrator")
async def websocket_orchestrator(websocket: WebSocket):
    """Stream orchestrator state (all organisms)."""
    await multi_vm_streamer.stream_multiplexed(websocket)


@app.websocket("/ws/v1/multiplexed")
async def websocket_multiplexed(websocket: WebSocket):
    """Stream all VMs with their spatial positions."""
    await multi_vm_streamer.stream_multiplexed(websocket)


# ============================================================================
# Glass Box Thought Streaming (Phase 7: Sisyphus Daemon Integration)
# ============================================================================

# Known thought types for filtering
KNOWN_THOUGHT_TYPES = {
    "token", "gravity", "task", "task_start", "task_complete", "task_failure",
    "gvn", "dna_synthesis", "heuristic", "checkpoint", "kernel_rewrite",
    "slice", "attention", "memory", "compute",
    "weight_region", "brain_sector", "weight_mutation"  # HybridBrain Glass Box integration
}

# Default filter: all types enabled
DEFAULT_FILTER_TYPES = set(KNOWN_THOUGHT_TYPES)


@dataclass
class ThoughtConnection:
    """Tracks a WebSocket connection with its filter settings."""
    websocket: WebSocket
    enabled_types: set[str]  # Empty set = all types enabled
    created_at: float = field(default_factory=time.time)
    messages_sent: int = 0
    messages_filtered: int = 0


# Store for active thought stream connections with filter settings
active_thought_connections: dict[WebSocket, ThoughtConnection] = {}
active_token_connections: set[WebSocket] = set()


@app.websocket("/ws/v1/thoughts")
async def websocket_thoughts(websocket: WebSocket, types: str | None = None):
    """
    Stream Sisyphus daemon thoughts for Glass Box visualization.

    Protocol:
    - Client connects and receives thought updates in real-time
    - Thoughts are sent as JSON with msg_type="Thought" and payload containing:
        - type: thought type (task_start, gvn, slice, heuristic, checkpoint, etc.)
        - content: thought content string
        - hilbert_index: position on Hilbert curve
        - color: RGBA tuple
        - timestamp: Unix timestamp

    Query Parameters:
    - types: Comma-separated list of thought types to filter (e.g., "?types=token,gravity,task")
             If not specified, all thought types are sent.
    """
    await websocket.accept()

    # Parse filter types from query parameter
    enabled_types: set[str] = set()
    if types:
        # Parse comma-separated types
        requested_types = [t.strip().lower() for t in types.split(",")]
        enabled_types = {t for t in requested_types if t in KNOWN_THOUGHT_TYPES}

        # If user specified types but none are valid, default to all
        if not enabled_types:
            enabled_types = set()  # Empty = all types

    # Create connection with filter settings
    conn = ThoughtConnection(
        websocket=websocket,
        enabled_types=enabled_types
    )
    active_thought_connections[websocket] = conn

    # Log filter settings
    filter_desc = f"filtered to: {enabled_types}" if enabled_types else "all types"
    logger = get_logger(f"{__name__}.ws_thoughts")
    logger.info(f"New thought stream connection ({filter_desc})")

    try:
        # Send initial connection message with current filter settings
        await websocket.send_text(json.dumps({
            "msg_type": "Connected",
            "message": "Glass Box Thought Stream active",
            "timestamp": time.time(),
            "filter": {
                "enabled_types": list(enabled_types) if enabled_types else "all",
                "available_types": list(KNOWN_THOUGHT_TYPES)
            }
        }))

        # Keep connection alive and send periodic pings
        while True:
            await asyncio.sleep(30)  # Ping every 30 seconds
            await websocket.send_text(json.dumps({
                "msg_type": "Ping",
                "timestamp": time.time()
            }))

    except WebSocketDisconnect:
        pass
    finally:
        active_thought_connections.pop(websocket, None)


@app.websocket("/ws/v1/tokens")
async def websocket_tokens(websocket: WebSocket):
    """Stream LLM tokens for Mind's Eye visualization."""
    await websocket.accept()
    active_token_connections.add(websocket)
    try:
        await websocket.send_text(json.dumps({
            "msg_type": "Connected",
            "message": "Mind's Eye Token Stream active",
            "timestamp": time.time()
        }))
        while True:
            await asyncio.sleep(30)
            await websocket.send_text(json.dumps({"msg_type": "Ping", "timestamp": time.time()}))
    except WebSocketDisconnect:
        pass
    finally:
        active_token_connections.discard(websocket)


async def broadcast_thought(thought: dict):
    """Broadcast a thought to all connected thought stream clients with filtering."""
    global active_thought_connections

    # Get thought type for filtering
    thought_type = thought.get("type", "").lower()

    message = {
        "msg_type": "Thought",
        "sequence": int(time.time() * 1000) % 0xFFFFFFFF,
        "payload": thought
    }
    message_json = json.dumps(message)

    disconnected = []
    for ws, conn in list(active_thought_connections.items()):
        try:
            # Server-side filtering: check if this thought type is enabled for this connection
            if conn.enabled_types and thought_type not in conn.enabled_types:
                conn.messages_filtered += 1
                continue

            await ws.send_text(message_json)
            conn.messages_sent += 1
        except Exception:
            disconnected.append(ws)

    for ws in disconnected:
        active_thought_connections.pop(ws, None)


async def broadcast_event(event_data: dict):
    """
    Broadcast an arbitrary event to all connected thought stream clients.
    Used for PERSONA_ACTIVE and other system events.
    """
    global active_thought_connections

    message = {
        "msg_type": "Event",
        "sequence": int(time.time() * 1000) % 0xFFFFFFFF,
        "payload": event_data
    }
    message_json = json.dumps(message)

    disconnected = []
    for ws in list(active_thought_connections.keys()):
        try:
            await ws.send_text(message_json)
        except Exception:
            disconnected.append(ws)

    for ws in disconnected:
        active_thought_connections.pop(ws, None)


async def broadcast_token(token_data: dict):
    """Broadcast a token to all connected Mind's Eye clients."""
    global active_token_connections
    message = {
        "msg_type": "Token",
        "sequence": int(time.time() * 1000) % 0xFFFFFFFF,
        "payload": token_data
    }
    disconnected = set()
    for ws in active_token_connections:
        try:
            await ws.send_text(json.dumps(message))
        except Exception:
            disconnected.add(ws)
    for ws in disconnected:
        active_token_connections.discard(ws)


@app.post("/thoughts/broadcast")
async def broadcast_thought_endpoint(thought: dict):
    """HTTP endpoint for broadcasting thoughts."""
    await broadcast_thought(thought)
    active_count = len(active_thought_connections)
    return {"status": "ok", "broadcast_to": active_count}


@app.get("/thoughts/stats")
async def get_thought_stats():
    """Get statistics about active thought stream connections."""
    connections = []
    total_sent = 0
    total_filtered = 0

    for ws, conn in active_thought_connections.items():
        connections.append({
            "enabled_types": list(conn.enabled_types) if conn.enabled_types else "all",
            "messages_sent": conn.messages_sent,
            "messages_filtered": conn.messages_filtered,
            "connected_for_seconds": time.time() - conn.created_at
        })
        total_sent += conn.messages_sent
        total_filtered += conn.messages_filtered

    return {
        "active_connections": len(active_thought_connections),
        "total_messages_sent": total_sent,
        "total_messages_filtered": total_filtered,
        "available_types": list(KNOWN_THOUGHT_TYPES),
        "connections": connections
    }


@app.post("/thoughts/filter")
async def update_thought_filter(filter_request: dict):
    """Update filter settings for a specific connection (via connection ID)."""
    # This is a placeholder for future connection management
    # For now, filters are set at connection time via query parameter
    return {
        "status": "ok",
        "message": "Filters are set at connection time via ?types= parameter",
        "available_types": list(KNOWN_THOUGHT_TYPES)
    }


@app.post("/tokens/broadcast")
async def broadcast_token_endpoint(token_data: dict):
    """HTTP endpoint for broadcasting tokens."""
    await broadcast_token(token_data)
    return {"status": "ok", "broadcast_to": len(active_token_connections)}


# ============================================================================
# HybridBrain Glass Box Integration (Weight Region Visualization)
# ============================================================================

# Global HybridBrain instance (lazy-loaded)
_hybrid_brain_instance = None
_hybrid_brain_path = "gpt_neo_125m_brain_fixed.rts.png"


def get_hybrid_brain():
    """Get or create the global HybridBrain instance."""
    global _hybrid_brain_instance
    if _hybrid_brain_instance is None:
        try:
            from systems.visual_shell.wgsl.hybrid_brain import HybridBrain
            _hybrid_brain_instance = HybridBrain(_hybrid_brain_path)
            logger.info(f"Loaded HybridBrain from {_hybrid_brain_path}")
        except Exception as e:
            logger.error(f"Failed to load HybridBrain: {e}")
            return None
    return _hybrid_brain_instance


@app.get("/brain/sectors")
async def get_brain_sectors():
    """Get list of all weight sectors in the brain."""
    brain = get_hybrid_brain()
    if brain is None:
        return {"error": "Brain not loaded", "sectors": []}

    sectors = brain.metadata.get("layout", {}).get("sectors", {})
    sector_list = []
    for name, info in sectors.items():
        sector_list.append({
            "name": name,
            "start": info.get("start", 0),
            "end": info.get("end", 0),
            "shape": info.get("shape"),
            "size": info.get("end", 0) - info.get("start", 0)
        })

    return {
        "brain_path": _hybrid_brain_path,
        "sectors": sector_list,
        "total_sectors": len(sector_list)
    }


@app.get("/brain/sector/{sector_name}")
async def get_brain_sector(sector_name: str):
    """Get weight data for a specific sector."""
    brain = get_hybrid_brain()
    if brain is None:
        return {"error": "Brain not loaded"}

    weights = brain.get_weight_region(sector_name)
    if weights is None:
        return {"error": f"Sector '{sector_name}' not found"}

    # Convert to JSON-serializable format
    return {
        "sector_name": sector_name,
        "shape": list(weights.shape),
        "size": int(weights.size),
        "mean": float(weights.mean()),
        "std": float(weights.std()),
        "min": float(weights.min()),
        "max": float(weights.max()),
        # For visualization: histogram bins
        "histogram": {
            "bins": list(np.histogram(weights, bins=20)[1].astype(float)),
            "counts": list(np.histogram(weights, bins=20)[0].astype(int))
        }
    }


@app.get("/brain/sector/{sector_name}/heatmap")
async def get_sector_heatmap(sector_name: str, width: int = 64, height: int = 64):
    """Get a 2D heatmap visualization of a weight sector."""
    brain = get_hybrid_brain()
    if brain is None:
        return {"error": "Brain not loaded"}

    weights = brain.get_weight_region(sector_name)
    if weights is None:
        return {"error": f"Sector '{sector_name}' not found"}

    # Reshape to 2D if needed
    flat = weights.flatten()
    total = width * height

    if len(flat) < total:
        # Pad with zeros
        flat = np.pad(flat, (0, total - len(flat)), mode='constant')
    else:
        flat = flat[:total]

    # Reshape and normalize
    grid = flat.reshape(height, width)

    # Normalize to 0-255 for visualization
    grid_min, grid_max = grid.min(), grid.max()
    if grid_max > grid_min:
        normalized = ((grid - grid_min) / (grid_max - grid_min) * 255).astype(np.uint8)
    else:
        normalized = np.zeros((height, width), dtype=np.uint8)

    return {
        "sector_name": sector_name,
        "width": width,
        "height": height,
        "data": normalized.tolist(),  # 2D array of 0-255 values
        "min": float(grid_min),
        "max": float(grid_max)
    }


@app.post("/brain/mutate")
async def mutate_brain_sector(request: dict):
    """Apply a mutation to a brain sector and broadcast the change."""
    brain = get_hybrid_brain()
    if brain is None:
        return {"error": "Brain not loaded"}

    sector_name = request.get("sector")
    mutation_type = request.get("mutation_type", "noise")
    mutation_scale = request.get("scale", 0.01)

    if not sector_name:
        return {"error": "Missing 'sector' in request"}

    # Define mutation function
    def mutation_fn(weights):
        if mutation_type == "noise":
            noise = np.random.randn(*weights.shape).astype(np.float32) * mutation_scale * weights.std()
            return weights + noise
        elif mutation_type == "scale":
            return weights * (1.0 + mutation_scale * np.random.randn())
        else:
            return weights

    # Apply mutation
    success = brain.mutate_weights(sector_name, mutation_fn)

    if success:
        # Broadcast mutation event to Glass Box
        await broadcast_thought({
            "type": "weight_mutation",
            "sector": sector_name,
            "mutation_type": mutation_type,
            "scale": mutation_scale,
            "content": f"Mutated {sector_name} with {mutation_type} (scale={mutation_scale})",
            "timestamp": time.time()
        })

        return {"status": "ok", "sector": sector_name, "mutation_type": mutation_type}
    else:
        return {"status": "error", "message": f"Failed to mutate sector '{sector_name}'"}


@app.post("/brain/generate")
async def generate_with_attention(request: dict):
    """Generate text with attention pattern capture and broadcast to Glass Box.

    Request body:
    {
        "prompt": "The computer",
        "max_tokens": 10,
        "broadcast_attention": true
    }
    """
    brain = get_hybrid_brain()
    if brain is None:
        return {"error": "Brain not loaded"}

    prompt = request.get("prompt", "The")
    max_tokens = request.get("max_tokens", 10)
    broadcast = request.get("broadcast_attention", True)

    # Tokenize
    from transformers import AutoTokenizer
    tokenizer = AutoTokenizer.from_pretrained("EleutherAI/gpt-neo-125M")
    prompt_tokens = tokenizer.encode(prompt)

    # Attention callback for broadcasting
    attention_events = []

    def attention_callback(token_id, attention_data):
        attention_events.append(attention_data)
        if broadcast:
            # This will be collected and broadcast after generation
            pass

    # Generate with attention capture
    result = brain.generate_with_attention(
        prompt_tokens,
        max_tokens=max_tokens,
        attention_callback=attention_callback
    )

    # Decode output
    output_text = tokenizer.decode(result["tokens"])

    # Broadcast attention events to Glass Box
    if broadcast:
        for event in attention_events:
            await broadcast_thought({
                "type": "attention",
                "token_id": event["token_id"],
                "step": event["step"],
                "seq_len": event["seq_len"],
                "num_layers": event["num_layers"],
                "content": f"Attention step {event['step']}: token={event['token_id']}",
                "patterns": event["patterns"][:3],  # First 3 layers only to keep message small
                "timestamp": time.time()
            })

    return {
        "status": "ok",
        "prompt": prompt,
        "output": output_text,
        "tokens": result["tokens"],
        "attention_steps": len(attention_events)
    }


@app.get("/brain/attention/heatmap")
async def get_attention_heatmap():
    """Generate a test attention heatmap visualization."""
    brain = get_hybrid_brain()
    if brain is None:
        return {"error": "Brain not loaded"}

    # Run a simple generation to get attention patterns
    from transformers import AutoTokenizer
    tokenizer = AutoTokenizer.from_pretrained("EleutherAI/gpt-neo-125M")

    prompt = "The"
    prompt_tokens = tokenizer.encode(prompt)

    result = brain.generate_with_attention(prompt_tokens, max_tokens=5)

    # Create heatmap from last layer's attention
    if result["attention_history"]:
        last_step = result["attention_history"][-1]
        if last_step["patterns"]:
            last_layer = last_step["patterns"][-1]
            attention = last_layer["last_token_attention"]

            # Normalize for visualization
            arr = np.array(attention)
            arr = (arr - arr.min()) / (arr.max() - arr.min() + 1e-10)

            return {
                "attention": arr.tolist(),
                "seq_len": len(attention),
                "layer": last_layer["layer"],
                "entropy": last_layer["entropy"]
            }

    return {"error": "No attention data"}


# ============================================================================
# PixelBrain Native Inference API (Phase 3: Cognitive Core)
# ============================================================================

# Active PixelBrain connections for streaming visual feedback
active_pixel_brain_connections: set[WebSocket] = set()


@app.websocket("/ws/v1/pixel_brain")
async def websocket_pixel_brain(websocket: WebSocket):
    """
    WebSocket endpoint for PixelBrain native LLM inference.

    Protocol:
    - Client sends: {"type": "generate", "prompt": "...", "max_tokens": 50, "request_id": "..."}
    - Server streams: {"type": "token", "token_id": N, "text": "...", "visual_feedback": {...}}
    - Server sends final: {"type": "complete", "text": "...", "tokens": [...], "visual_feedback": {...}}
    """
    await websocket.accept()
    active_pixel_brain_connections.add(websocket)

    try:
        # Send connection confirmation
        await websocket.send_text(json.dumps({
            "type": "connected",
            "message": "PixelBrain native inference ready",
            "timestamp": time.time()
        }))

        while True:
            message = await websocket.receive_text()
            try:
                data = json.loads(message)
            except json.JSONDecodeError:
                await websocket.send_text(json.dumps({
                    "type": "error",
                    "error": "Invalid JSON"
                }))
                continue

            msg_type = data.get("type")

            if msg_type == "generate":
                await _handle_pixel_brain_generate(websocket, data)
            elif msg_type == "ping":
                await websocket.send_text(json.dumps({"type": "pong"}))
            else:
                await websocket.send_text(json.dumps({
                    "type": "error",
                    "error": f"Unknown message type: {msg_type}"
                }))

    except WebSocketDisconnect:
        pass
    finally:
        active_pixel_brain_connections.discard(websocket)


async def _handle_pixel_brain_generate(websocket: WebSocket, data: dict):
    """Handle PIXEL_BRAIN_GENERATE WebSocket request."""
    from systems.visual_shell.api.pixel_brain_service import (
        get_pixel_brain_service,
    )

    request_id = data.get("request_id")
    prompt = data.get("prompt", "")
    max_tokens = data.get("max_tokens", 32)
    temperature = data.get("temperature", 1.0)

    # Get the PixelBrain service
    service = get_pixel_brain_service(visual_bridge=None)

    if not service.is_available():
        await websocket.send_text(json.dumps({
            "type": "error",
            "request_id": request_id,
            "error": "PixelBrain service not available (pipeline not initialized)",
            "error_code": "SERVICE_UNAVAILABLE"
        }))
        return

    try:
        # Run generation
        result = await service.generate(
            prompt=prompt,
            max_tokens=max_tokens,
            temperature=temperature,
            emit_visual=True
        )

        # Send completion message
        response = {
            "type": "complete",
            "request_id": request_id,
            "text": result.get("text", ""),
            "tokens": result.get("tokens", []),
            "visual_feedback": result.get("visual_feedback", {})
        }
        await websocket.send_text(json.dumps(response))

    except Exception as e:
        await websocket.send_text(json.dumps({
            "type": "error",
            "request_id": request_id,
            "error": str(e),
            "error_code": "GENERATION_FAILED"
        }))


@app.post("/pixel_brain/generate")
async def pixel_brain_generate_http(request: dict):
    """
    HTTP endpoint for PixelBrain generation (non-streaming).

    Request body:
    {
        "prompt": "Once upon a time",
        "max_tokens": 32,
        "temperature": 1.0
    }
    """
    from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service

    prompt = request.get("prompt", "")
    max_tokens = request.get("max_tokens", 32)
    temperature = request.get("temperature", 1.0)

    service = get_pixel_brain_service()

    if not service.is_available():
        return {
            "success": False,
            "error": "PixelBrain service not available",
            "error_code": "SERVICE_UNAVAILABLE"
        }

    try:
        result = await service.generate(
            prompt=prompt,
            max_tokens=max_tokens,
            temperature=temperature,
            emit_visual=False
        )

        return {
            "success": True,
            "text": result.get("text", ""),
            "tokens": result.get("tokens", [])
        }

    except Exception as e:
        return {
            "success": False,
            "error": str(e),
            "error_code": "GENERATION_FAILED"
        }


# ============================================================================
# FFI Bridge API Endpoints (Phase 7: CV/Analysis Integration)
# ============================================================================

# Initialize FFI Bridge at module level for test compatibility
_init_ffi_bridge()


class FFIExecuteRequest(BaseModel):
    """Request model for FFI execution."""
    function: str
    args: list[Any] = []
    kwargs: dict = {}


class FFIExecuteResponse(BaseModel):
    """Response model for FFI execution."""
    status: str
    result: Any = None
    error: str | None = None


@app.get("/ffi/functions")
async def get_ffi_functions():
    """Get all whitelisted FFI functions."""
    if not ffi_bridge or not ffi_bridge._loaded:
        return {"status": "error", "error": "FFI Bridge not initialized"}

    return {
        "status": "ok",
        "functions": ffi_bridge.functions,
        "count": len(ffi_bridge.functions)
    }


@app.get("/ffi/functions/{func_name}")
async def get_ffi_function_info(func_name: str):
    """Get info about a specific FFI function."""
    if not ffi_bridge or not ffi_bridge._loaded:
        return {"status": "error", "error": "FFI Bridge not initialized"}

    info = ffi_bridge.get_function_info(func_name)
    if info is None:
        return {"status": "error", "error": f"Function '{func_name}' not found"}

    return {"status": "ok", "function": func_name, "info": info}


@app.post("/ffi/execute", response_model=FFIExecuteResponse)
async def execute_ffi_function(request: FFIExecuteRequest):
    """
    Execute an FFI function.

    Example:
        POST /ffi/execute
        {
            "function": "numpy.sum",
            "args": [[[1, 2, 3], [4, 5, 6]]],
            "kwargs": {"axis": 0}
        }
    """
    if not ffi_bridge or not ffi_bridge._loaded:
        return FFIExecuteResponse(status="error", error="FFI Bridge not initialized")

    result = await ffi_bridge.execute(request.function, request.args, request.kwargs)
    return FFIExecuteResponse(**result)


@app.post("/ffi/analyze/memory/{vm_id}")
async def analyze_vm_memory(vm_id: str, operation: str = "mean"):
    """
    Analyze VM memory region using FFI.

    Supported operations: mean, std, sum, min, max, argmax, argmin
    """
    if not ffi_bridge or not ffi_bridge._loaded:
        return {"status": "error", "error": "FFI Bridge not initialized"}

    streamer = multi_vm_streamer.get_or_create_streamer(vm_id)
    if not streamer.ram_mm:
        if not streamer.connect_shm():
            return {"status": "error", "error": f"Cannot connect to VM {vm_id} memory"}

    try:
        # Read a sample region (first 1MB of RAM for analysis)
        streamer.ram_mm.seek(0)
        sample_data = streamer.ram_mm.read(1024 * 1024)
        arr = np.frombuffer(sample_data, dtype=np.uint8)

        # Execute the requested operation
        func_name = f"numpy.{operation}"
        if not ffi_bridge.is_whitelisted(func_name):
            return {"status": "error", "error": f"Operation '{operation}' not supported"}

        result = await ffi_bridge.execute(func_name, [arr])

        return {
            "status": "ok",
            "vm_id": vm_id,
            "operation": operation,
            "sample_size": len(arr),
            "result": result.get("result"),
            "error": result.get("error")
        }
    except Exception as e:
        return {"status": "error", "error": str(e)}


@app.websocket("/ws/v1/ffi")
async def websocket_ffi(websocket: WebSocket):
    """
    WebSocket endpoint for real-time FFI operations.

    Protocol:
    - Client sends: {"type": "execute", "function": "numpy.sum", "args": [...], "kwargs": {...}}
    - Server responds: {"type": "result", "status": "ok", "result": ...}
    """
    await websocket.accept()
    logger = get_logger(f"{__name__}.ws_ffi")

    # Add to visual broadcast list so engine receives visual events (Task 9.2)
    multi_vm_streamer.active_websockets.add(websocket)

    if not ffi_bridge or not ffi_bridge._loaded:
        await websocket.send_json({"type": "error", "error": "FFI Bridge not initialized"})
        await websocket.close()
        return

    try:
        while True:
            message = await websocket.receive_text()
            try:
                data = json.loads(message)
            except json.JSONDecodeError:
                await websocket.send_json({"type": "error", "error": "Invalid JSON"})
                continue

            msg_type = data.get("type")

            if msg_type == "execute":
                func_name = data.get("function")
                args = data.get("args", [])
                kwargs = data.get("kwargs", {})

                if not func_name:
                    await websocket.send_json({"type": "error", "error": "Missing function name"})
                    continue

                result = await ffi_bridge.execute(func_name, args, kwargs)
                await websocket.send_json({"type": "result", **result})

            elif msg_type == "list_functions":
                await websocket.send_json({
                    "type": "functions",
                    "functions": ffi_bridge.get_whitelisted_functions()
                })

            elif msg_type == "ping":
                await websocket.send_json({"type": "pong"})

            else:
                await websocket.send_json({"type": "error", "error": f"Unknown message type: {msg_type}"})

    except WebSocketDisconnect:
        logger.debug("FFI WebSocket disconnected")
    except Exception as e:
        logger.error(f"FFI WebSocket error: {e}")


# Initialize multi_vm_streamer at module level for test compatibility
# This must be after class definitions to avoid NameError
_init_multi_vm_streamer()


if __name__ == "__main__":
    port = int(os.environ.get("BRIDGE_PORT", 3002))
    logger = get_logger(__name__)
    logger.info(f"Starting Multi-VM Visual Bridge on port {port}")
    uvicorn.run(app, host="0.0.0.0", port=port)
