"""
VisionDaemon - GPU inference daemon for UI understanding.

Provides a Unix socket interface for multi-agent access to Florence-2
visual understanding capabilities.
"""

import asyncio
import json
import os
import signal
from pathlib import Path
from typing import Any, Optional

from systems.vision.florence_model import FlorenceModel
from systems.vision.pipeline_executor import PipelineExecutor


class VisionDaemon:
    """
    GPU inference daemon for visual UI understanding.

    Listens on a Unix socket and handles pipeline requests from
    multiple clients (ShotcutAgent, AreaAgents, VisualShell, etc.)

    Usage:
        daemon = VisionDaemon(socket_path="/tmp/vision_daemon.sock")
        await daemon.start()
        # ... daemon runs until stopped ...
        await daemon.stop()
    """

    DEFAULT_SOCKET_PATH = "/tmp/vision_daemon.sock"

    def __init__(
        self,
        socket_path: str = DEFAULT_SOCKET_PATH,
        eager_load: bool = False
    ):
        """
        Initialize the VisionDaemon.

        Args:
            socket_path: Path to Unix socket for IPC
            eager_load: If True, load model immediately; if False, load on first request
        """
        self.socket_path = socket_path
        self.eager_load = eager_load
        self._model: Optional[FlorenceModel] = None
        self._executor: Optional[PipelineExecutor] = None
        self._server: Optional[asyncio.Server] = None
        self._running = False

    @property
    def model(self) -> FlorenceModel:
        """Lazy-load the Florence-2 model on first access."""
        if self._model is None:
            self._model = FlorenceModel()
            self._model.load()
            self._executor = PipelineExecutor(self._model)
        return self._model

    @property
    def executor(self) -> PipelineExecutor:
        """Get the pipeline executor (triggers model load if needed)."""
        _ = self.model  # Trigger lazy load
        return self._executor

    async def start(self) -> None:
        """Start the daemon and begin accepting connections."""
        # Remove stale socket file if it exists
        if os.path.exists(self.socket_path):
            os.unlink(self.socket_path)

        # Eager load model if requested
        if self.eager_load:
            _ = self.model

        # Create Unix socket server
        self._server = await asyncio.start_unix_server(
            self._handle_client,
            path=self.socket_path
        )

        self._running = True

        # Setup signal handlers for graceful shutdown
        loop = asyncio.get_event_loop()
        for sig in (signal.SIGINT, signal.SIGTERM):
            loop.add_signal_handler(sig, lambda: asyncio.create_task(self.stop()))

        addr = self.socket_path
        print(f"VisionDaemon listening on {addr}")

    async def stop(self) -> None:
        """Gracefully stop the daemon."""
        self._running = False

        if self._server:
            self._server.close()
            await self._server.wait_closed()

        # Clean up socket file
        if os.path.exists(self.socket_path):
            os.unlink(self.socket_path)

        print("VisionDaemon stopped")

    async def _handle_client(
        self,
        reader: asyncio.StreamReader,
        writer: asyncio.StreamWriter
    ) -> None:
        """Handle a single client connection."""
        try:
            # Read request (length-prefixed JSON)
            data = await reader.read(1024 * 1024 * 10)  # 10MB max
            if not data:
                return

            request = json.loads(data.decode("utf-8"))
            response = await self.handle_request(request)

            # Send response
            response_data = json.dumps(response).encode("utf-8")
            writer.write(response_data)
            await writer.drain()

        except json.JSONDecodeError as e:
            error_response = {
                "success": False,
                "error": f"Invalid JSON: {e}",
                "results": {},
                "latency_ms": 0
            }
            writer.write(json.dumps(error_response).encode("utf-8"))
            await writer.drain()
        except Exception as e:
            error_response = {
                "success": False,
                "error": str(e),
                "results": {},
                "latency_ms": 0
            }
            writer.write(json.dumps(error_response).encode("utf-8"))
            await writer.drain()
        finally:
            writer.close()
            await writer.wait_closed()

    async def handle_request(self, request: dict) -> dict:
        """
        Process a pipeline request.

        Args:
            request: Dict with 'image' (base64) and 'steps' (list)

        Returns:
            Dict with 'success', 'results', 'latency_ms', 'error'
        """
        import time
        import base64
        from PIL import Image
        import io

        start_time = time.time()

        try:
            # Validate request
            if "image" not in request:
                raise ValueError("Missing 'image' in request")
            if "steps" not in request:
                raise ValueError("Missing 'steps' in request")

            # Decode image
            image_data = base64.b64decode(request["image"])
            image = Image.open(io.BytesIO(image_data))

            # Execute pipeline
            steps = request["steps"]
            result = await self.executor.execute(image, steps)

            latency_ms = int((time.time() - start_time) * 1000)

            return {
                "success": True,
                "results": result.results,
                "latency_ms": latency_ms,
                "error": None
            }

        except Exception as e:
            latency_ms = int((time.time() - start_time) * 1000)
            return {
                "success": False,
                "error": str(e),
                "results": {},
                "latency_ms": latency_ms
            }


async def main():
    """Entry point for running the daemon standalone."""
    daemon = VisionDaemon(eager_load=True)
    await daemon.start()

    # Keep running until stopped
    while daemon._running:
        await asyncio.sleep(1)


if __name__ == "__main__":
    asyncio.run(main())
