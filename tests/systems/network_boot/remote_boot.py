"""
Remote Boot Protocol - Phase 25

Enables booting containers on remote peers via the mesh network.

Usage:
    # Client-side (boot on remote peer)
    client = RemoteBootClient("peer2.local", port=8775)
    result = await client.boot("alpine.rts.png")

    # Server-side (handle boot requests)
    from systems.network_boot import create_remote_boot_server
    server = await create_remote_boot_server(boot_manager, port=8775)
"""

import asyncio
import json
import logging
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any

logger = logging.getLogger("RemoteBoot")


class RemoteBootStatus(Enum):
    """Status of remote boot operation."""
    PREPARING = "preparing"
    TRANSFERRING = "transferring"
    BOOTING = "booting"
    RUNNING = "running"
    FAILED = "failed"
    CANCELLED = "cancelled"


@dataclass
class RemoteBootProgress:
    """Progress update for remote boot operation."""
    status: RemoteBootStatus
    timestamp: float = field(default_factory=time.time)
    container_id: str | None = None
    vnc_port: int | None = None
    message: str | None = None
    error: str | None = None
    percent: float = 0.0

    @classmethod
    def from_dict(cls, data: dict) -> "RemoteBootProgress":
        return cls(
            status=RemoteBootStatus(data["status"]),
            timestamp=data.get("timestamp", time.time()),
            container_id=data.get("container_id"),
            vnc_port=data.get("vnc_port"),
            message=data.get("message"),
            error=data.get("error"),
            percent=data.get("percent", 0.0),
        )


@dataclass
class RemoteBootResult:
    """Result of remote boot operation."""
    success: bool
    container_id: str | None = None
    vnc_port: int | None = None
    peer_hostname: str | None = None
    error: str | None = None
    elapsed_time: float = 0.0

    @classmethod
    def from_dict(cls, data: dict) -> "RemoteBootResult":
        return cls(
            success=data["success"],
            container_id=data.get("container_id"),
            vnc_port=data.get("vnc_port"),
            peer_hostname=data.get("peer_hostname"),
            error=data.get("error"),
            elapsed_time=data.get("elapsed_time", 0.0),
        )


class RemoteBootClient:
    """
    Client for initiating remote boot operations.

    Connects to RemoteBootServer on a peer node and streams
    boot progress back to the caller.
    """

    def __init__(
        self,
        peer_hostname: str,
        peer_port: int = 8775,
        timeout: float = 300.0,
    ):
        """
        Initialize remote boot client.

        Args:
            peer_hostname: Target peer hostname
            peer_port: Remote boot server port (default 8775)
            timeout: Maximum time to wait for boot completion
        """
        self.peer_hostname = peer_hostname
        self.peer_port = peer_port
        self.timeout = timeout
        self._session: Any | None = None
        self._cancel_requested = False

    async def _get_session(self):
        """Get or create HTTP session."""
        import aiohttp

        if self._session is None or self._session.closed:
            timeout = aiohttp.ClientTimeout(total=self.timeout)
            self._session = aiohttp.ClientSession(timeout=timeout)
        return self._session

    async def close(self):
        """Close HTTP session."""
        if self._session and not self._session.closed:
            await self._session.close()

    async def boot(
        self,
        rts_file: str,
        progress_callback: Callable[[RemoteBootProgress], None] | None = None,
        ephemeral: bool = False,
        name: str | None = None,
    ) -> RemoteBootResult:
        """
        Boot a container on the remote peer.

        Args:
            rts_file: Path to .rts.png file to boot
            progress_callback: Optional callback for progress updates
            ephemeral: Boot in ephemeral mode (changes discarded)
            name: Optional container name

        Returns:
            RemoteBootResult with success status and container info
        """
        start_time = time.time()
        self._cancel_requested = False

        # Read file content
        rts_path = Path(rts_file)
        if not rts_path.exists():
            return RemoteBootResult(
                success=False,
                error=f"File not found: {rts_file}",
                elapsed_time=0.0,
            )

        file_size = rts_path.stat().st_size
        file_name = rts_path.name

        logger.info(f"Starting remote boot of {file_name} ({file_size} bytes) to {self.peer_hostname}")

        try:
            import aiohttp
            session = await self._get_session()
            url = f"http://{self.peer_hostname}:{self.peer_port}/boot"

            # Prepare multipart upload
            with open(rts_path, "rb") as f:
                form = aiohttp.FormData()
                form.add_field("file", f, filename=file_name, content_type="image/png")
                form.add_field("ephemeral", str(ephemeral).lower())
                if name:
                    form.add_field("name", name)

                # Stream response for progress updates
                async with session.post(url, data=form) as response:
                    if response.status != 200:
                        error = await response.text()
                        return RemoteBootResult(
                            success=False,
                            error=f"Remote boot failed: {error}",
                            elapsed_time=time.time() - start_time,
                        )

                    # Read streaming response (newline-delimited JSON)
                    buffer = ""
                    async for chunk in response.content:
                        if self._cancel_requested:
                            await self._cancel_boot()
                            return RemoteBootResult(
                                success=False,
                                error="Boot cancelled by user",
                                elapsed_time=time.time() - start_time,
                            )

                        buffer += chunk.decode("utf-8")

                        # Process complete JSON messages
                        for line in buffer.split("\n"):
                            if not line.strip():
                                continue
                            try:
                                data = json.loads(line)
                                progress = RemoteBootProgress.from_dict(data)

                                if progress_callback:
                                    progress_callback(progress)

                                # Check for completion
                                if progress.status == RemoteBootStatus.RUNNING:
                                    return RemoteBootResult(
                                        success=True,
                                        container_id=progress.container_id,
                                        vnc_port=progress.vnc_port,
                                        peer_hostname=self.peer_hostname,
                                        elapsed_time=time.time() - start_time,
                                    )

                                if progress.status == RemoteBootStatus.FAILED:
                                    return RemoteBootResult(
                                        success=False,
                                        error=progress.error or "Remote boot failed",
                                        elapsed_time=time.time() - start_time,
                                    )

                            except json.JSONDecodeError:
                                logger.warning(f"Invalid JSON in progress: {line}")

                    # If we get here, stream ended without completion
                    return RemoteBootResult(
                        success=False,
                        error="Remote boot stream ended without completion",
                        elapsed_time=time.time() - start_time,
                    )

        except TimeoutError:
            return RemoteBootResult(
                success=False,
                error=f"Timeout connecting to {self.peer_hostname}",
                elapsed_time=time.time() - start_time,
            )
        except Exception as e:
            logger.error(f"Remote boot error: {e}")
            return RemoteBootResult(
                success=False,
                error=str(e),
                elapsed_time=time.time() - start_time,
            )

    async def _cancel_boot(self):
        """Send cancel request to remote server."""
        try:
            session = await self._get_session()
            url = f"http://{self.peer_hostname}:{self.peer_port}/cancel"
            await session.post(url, json={"container_id": None})
        except Exception as e:
            logger.warning(f"Failed to send cancel request: {e}")

    def cancel(self):
        """Request cancellation of ongoing boot."""
        self._cancel_requested = True

    async def status(self, container_id: str) -> dict[str, Any] | None:
        """
        Get status of a remote container.

        Args:
            container_id: Container ID to check

        Returns:
            Status dict or None if not found
        """
        try:
            session = await self._get_session()
            url = f"http://{self.peer_hostname}:{self.peer_port}/status"
            async with session.post(url, json={"container_id": container_id}) as response:
                if response.status == 200:
                    return await response.json()
                return None
        except Exception as e:
            logger.warning(f"Failed to get remote status: {e}")
            return None


class RemoteBootServer:
    """
    Server for handling remote boot requests.

    Runs alongside the existing district server on port 8775.
    """

    def __init__(
        self,
        boot_manager: Any,
        port: int = 8775,
    ):
        """
        Initialize remote boot server.

        Args:
            boot_manager: Boot manager instance (MultiBootManager or mock)
            port: Port to listen on
        """
        self.boot_manager = boot_manager
        self.port = port
        self._active_boots: dict[str, dict[str, Any]] = {}
        self._app: Any | None = None
        self._runner: Any | None = None
        self._server_task: asyncio.Task | None = None

    async def start(self):
        """Start the remote boot server."""
        from aiohttp import web

        app = web.Application(client_max_size=100 * 1024 * 1024)  # 100MB for large images
        app.router.add_post("/boot", self._handle_boot)
        app.router.add_post("/cancel", self._handle_cancel)
        app.router.add_post("/status", self._handle_status)

        self._app = app
        runner = web.AppRunner(app)
        await runner.setup()
        site = web.TCPSite(runner, host="0.0.0.0", port=self.port)
        await site.start()

        self._runner = runner
        logger.info(f"Remote boot server listening on port {self.port}")

    async def stop(self):
        """Stop the remote boot server."""
        if self._runner:
            await self._runner.cleanup()
            self._runner = None
        logger.info("Remote boot server stopped")

    async def _handle_boot(self, request) -> Any:
        """Handle boot request."""
        from aiohttp import web

        start_time = time.time()
        container_id = f"remote-{int(start_time * 1000)}"

        try:
            reader = await request.multipart()
        except Exception:
            return web.json_response({"error": "Invalid multipart request"}, status=400)

        # Get file content
        file_field = None
        options = {}

        async for field in reader:
            if field.name == "file":
                file_field = field
            else:
                options[field.name] = (await field.read()).decode("utf-8")

        if not file_field:
            return web.json_response({"error": "No file provided"}, status=400)

        file_content = await file_field.read()
        file_name = file_field.filename

        # Get options
        ephemeral = options.get("ephemeral", "false").lower() == "true"
        name = options.get("name") or file_name.replace(".rts.png", "")

        logger.info(f"Received boot request for {file_name} ({len(file_content)} bytes)")

        # Save to temp file
        temp_path = Path(f"/tmp/remote-boot-{container_id}.rts.png")
        temp_path.write_bytes(file_content)

        try:
            # Boot the container
            boot_result = await self.boot_manager.boot(
                str(temp_path),
                ephemeral=ephemeral,
                name=name,
            )

            if not boot_result.success:
                return web.json_response(
                    {"status": "failed", "error": boot_result.error or "Boot failed"},
                    status=500,
                )

            # Get container info
            container = self.boot_manager.get_container(name)
            if not container:
                return web.json_response(
                    {"status": "failed", "error": "Container not found after boot"},
                    status=500,
                )

            # Track active boot
            self._active_boots[container_id] = {
                "name": container.name,
                "container": container,
                "start_time": start_time,
            }

            logger.info(f"Remote boot complete: {name} on VNC :{container.vnc_port}")

            return web.json_response({
                "status": "running",
                "container_id": container_id,
                "vnc_port": container.vnc_port,
                "message": f"Container {name} running on VNC :{container.vnc_port}",
            })

        except Exception as e:
            logger.error(f"Boot failed: {e}")
            return web.json_response(
                {"status": "failed", "error": str(e)},
                status=500,
            )

    async def _handle_cancel(self, request) -> Any:
        """Handle cancel request."""
        from aiohttp import web

        try:
            data = await request.json()
            container_id = data.get("container_id")

            if container_id in self._active_boots:
                boot_info = self._active_boots[container_id]
                container = boot_info["container"]

                # Stop the container
                await self.boot_manager.stop(container.name)
                del self._active_boots[container_id]
                return web.json_response({"success": True, "message": f"Container {container_id} stopped"})

            else:
                return web.json_response({"success": False, "error": "Container not found"})

        except Exception as e:
            return web.json_response({"success": False, "error": str(e)})

    async def _handle_status(self, request) -> Any:
        """Handle status request."""
        from aiohttp import web

        try:
            data = await request.json()
            container_id = data.get("container_id")

            if container_id in self._active_boots:
                boot_info = self._active_boots[container_id]
                container = boot_info["container"]

                return web.json_response({
                    "success": True,
                    "status": "running",
                    "name": container.name,
                    "vnc_port": container.vnc_port,
                    "uptime": time.time() - boot_info["start_time"],
                })
            else:
                return web.json_response({"success": False, "error": "Container not found"})

        except Exception as e:
            return web.json_response({"success": False, "error": str(e)})


# Convenience functions
async def create_remote_boot_server(boot_manager, port: int = 8775) -> RemoteBootServer:
    """Create and start a remote boot server."""
    server = RemoteBootServer(boot_manager, port)
    await server.start()
    return server
