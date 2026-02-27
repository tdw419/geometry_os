#!/usr/bin/env python3
"""
Shell Bridge: PTY WebSocket Server for GeometricTerminal

Provides real shell access to the GeometricTerminal via WebSocket.
Uses Python's pty module to spawn pseudo-terminals and streams I/O.

Architecture:
[GeometricTerminal.js]
        ↓ WebSocket
[ShellBridge]
        ↓ PTY
[Bash/Zsh Process]

Usage:
    python3 shell_bridge.py

WebSocket Protocol:
    Client → Server: {"type": "input", "data": "ls -la\n"}
    Client → Server: {"type": "resize", "cols": 80, "rows": 24}
    Server → Client: {"type": "output", "data": "file listing..."}
    Server → Client: {"type": "exit", "code": 0}
"""

import asyncio
import fcntl
import json
import os
import pty
import struct
import termios
import logging
from pathlib import Path
from typing import Dict, Optional
from fastapi import FastAPI, WebSocket, WebSocketDisconnect
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [SHELL-BRIDGE] %(message)s'
)
logger = logging.getLogger("ShellBridge")

app = FastAPI(title="Shell Bridge", version="1.0.0")

# Enable CORS for web access
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Repository root
REPO_ROOT = Path(__file__).parent.parent.parent.parent


class PTYSession:
    """
    Manages a single PTY shell session.
    """

    def __init__(self, cols: int = 80, rows: int = 24):
        self.cols = cols
        self.rows = rows
        self.master_fd: Optional[int] = None
        self.slave_fd: Optional[int] = None
        self.process: Optional[asyncio.subprocess.Process] = None
        self.websocket: Optional[WebSocket] = None
        self.output_task: Optional[asyncio.Task] = None

    async def start(self, shell: str = None):
        """Start the PTY shell process."""
        if shell is None:
            shell = os.environ.get('SHELL', '/bin/bash')

        # Create pseudo-terminal
        self.master_fd, self.slave_fd = pty.openpty()

        # Set terminal size
        self._set_winsize(self.slave_fd, self.rows, self.cols)

        # Make master non-blocking
        flags = fcntl.fcntl(self.master_fd, fcntl.F_GETFL)
        fcntl.fcntl(self.master_fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)

        # Spawn shell
        env = os.environ.copy()
        env['TERM'] = 'xterm-256color'
        env['COLUMNS'] = str(self.cols)
        env['LINES'] = str(self.rows)

        self.process = await asyncio.create_subprocess_exec(
            shell,
            stdin=self.slave_fd,
            stdout=self.slave_fd,
            stderr=self.slave_fd,
            env=env,
            cwd=str(REPO_ROOT),
            start_new_session=True
        )

        # Close slave in parent (child has its own copy)
        os.close(self.slave_fd)
        self.slave_fd = None

        logger.info(f"Started PTY shell: {shell} (PID: {self.process.pid})")
        return self.process.pid

    def _set_winsize(self, fd: int, rows: int, cols: int):
        """Set terminal window size."""
        winsize = struct.pack('HHHH', rows, cols, 0, 0)
        fcntl.ioctl(fd, termios.TIOCSWINSZ, winsize)

    async def resize(self, cols: int, rows: int):
        """Resize the terminal."""
        self.cols = cols
        self.rows = rows
        if self.master_fd is not None:
            self._set_winsize(self.master_fd, rows, cols)
            logger.debug(f"Resized terminal to {cols}x{rows}")

    async def write(self, data: str):
        """Write input to the shell."""
        if self.master_fd is not None:
            try:
                os.write(self.master_fd, data.encode('utf-8'))
            except (BlockingIOError, OSError) as e:
                logger.warning(f"Write error: {e}")

    async def read_output(self) -> Optional[str]:
        """Read available output from the shell (non-blocking)."""
        if self.master_fd is None:
            return None

        try:
            # Read up to 64KB
            data = os.read(self.master_fd, 65536)
            return data.decode('utf-8', errors='replace')
        except BlockingIOError:
            return None
        except OSError:
            return None

    async def output_loop(self, websocket: WebSocket):
        """Continuously read and send output to WebSocket."""
        self.websocket = websocket

        loop = asyncio.get_event_loop()

        while self.process and self.process.returncode is None:
            try:
                # Use run_in_executor to avoid blocking
                output = await loop.run_in_executor(None, self._blocking_read)

                if output:
                    await websocket.send_json({
                        "type": "output",
                        "data": output
                    })
                else:
                    # Small delay to avoid busy-waiting
                    await asyncio.sleep(0.01)

            except WebSocketDisconnect:
                logger.info("WebSocket disconnected")
                break
            except Exception as e:
                logger.error(f"Output loop error: {e}")
                break

        # Send exit notification
        if self.process:
            exit_code = self.process.returncode or 0
            try:
                await websocket.send_json({
                    "type": "exit",
                    "code": exit_code
                })
            except:
                pass

        logger.info(f"Output loop ended (exit code: {self.process.returncode if self.process else 'N/A'})")

    def _blocking_read(self) -> Optional[str]:
        """Blocking read for use in executor."""
        if self.master_fd is None:
            return None

        try:
            # Use select to wait for data with timeout
            import select
            readable, _, _ = select.select([self.master_fd], [], [], 0.1)

            if readable:
                data = os.read(self.master_fd, 65536)
                return data.decode('utf-8', errors='replace')
        except (BlockingIOError, OSError):
            pass

        return None

    async def stop(self):
        """Stop the shell session."""
        if self.output_task:
            self.output_task.cancel()
            try:
                await self.output_task
            except asyncio.CancelledError:
                pass

        if self.process and self.process.returncode is None:
            try:
                self.process.terminate()
                await asyncio.wait_for(self.process.wait(), timeout=2.0)
            except:
                try:
                    self.process.kill()
                except:
                    pass

        if self.master_fd is not None:
            try:
                os.close(self.master_fd)
            except:
                pass
            self.master_fd = None

        logger.info("PTY session stopped")


# Active sessions (terminal_id -> PTYSession)
sessions: Dict[str, PTYSession] = {}


@app.get("/health")
async def health():
    """Health check endpoint."""
    return {
        "status": "ok",
        "active_sessions": len(sessions),
        "repo_root": str(REPO_ROOT)
    }


@app.websocket("/ws/shell/{terminal_id}")
async def shell_websocket(terminal_id: str, websocket: WebSocket):
    """
    WebSocket endpoint for shell sessions.

    Protocol:
    - Client sends: {"type": "input", "data": "..."} or {"type": "resize", "cols": N, "rows": N}
    - Server sends: {"type": "output", "data": "..."} or {"type": "exit", "code": N}
    """
    await websocket.accept()
    logger.info(f"WebSocket connected: {terminal_id}")

    session = PTYSession()

    try:
        # Start shell
        pid = await session.start()
        await websocket.send_json({
            "type": "ready",
            "pid": pid,
            "cols": session.cols,
            "rows": session.rows
        })

        sessions[terminal_id] = session

        # Start output loop in background
        output_task = asyncio.create_task(session.output_loop(websocket))

        # Handle incoming messages
        while True:
            try:
                message = await asyncio.wait_for(
                    websocket.receive_text(),
                    timeout=300.0  # 5 minute timeout
                )

                data = json.loads(message)
                msg_type = data.get("type")

                if msg_type == "input":
                    await session.write(data.get("data", ""))

                elif msg_type == "resize":
                    cols = data.get("cols", 80)
                    rows = data.get("rows", 24)
                    await session.resize(cols, rows)

                elif msg_type == "ping":
                    await websocket.send_json({"type": "pong"})

            except asyncio.TimeoutError:
                # Send keepalive
                try:
                    await websocket.send_json({"type": "ping"})
                except:
                    break

    except WebSocketDisconnect:
        logger.info(f"WebSocket disconnected: {terminal_id}")

    except Exception as e:
        logger.error(f"WebSocket error: {e}")

    finally:
        # Cleanup
        await session.stop()
        if terminal_id in sessions:
            del sessions[terminal_id]
        logger.info(f"Session cleaned up: {terminal_id}")


@app.post("/api/shell/create")
async def create_shell(terminal_id: str, cols: int = 80, rows: int = 24):
    """Create a new shell session (REST endpoint for pre-creation)."""
    if terminal_id in sessions:
        return {"error": "Session already exists", "terminal_id": terminal_id}

    session = PTYSession(cols, rows)
    sessions[terminal_id] = session

    return {
        "status": "created",
        "terminal_id": terminal_id,
        "websocket_url": f"/ws/shell/{terminal_id}"
    }


@app.delete("/api/shell/{terminal_id}")
async def destroy_shell(terminal_id: str):
    """Destroy a shell session."""
    if terminal_id not in sessions:
        return {"error": "Session not found"}

    session = sessions[terminal_id]
    await session.stop()
    del sessions[terminal_id]

    return {"status": "destroyed", "terminal_id": terminal_id}


@app.get("/api/shell/list")
async def list_shells():
    """List all active shell sessions."""
    return {
        "sessions": [
            {
                "id": tid,
                "cols": s.cols,
                "rows": s.rows,
                "pid": s.process.pid if s.process else None
            }
            for tid, s in sessions.items()
        ]
    }


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Shell Bridge for GeometricTerminal")
    parser.add_argument("--port", type=int, default=8767, help="Port to listen on")
    parser.add_argument("--host", default="0.0.0.0", help="Host to bind to")
    args = parser.parse_args()

    print(f"""
╔══════════════════════════════════════════════════════════════╗
║              SHELL BRIDGE - GeometricTerminal                ║
╠══════════════════════════════════════════════════════════════╣
║  WebSocket: ws://{args.host}:{args.port}/ws/shell/<id>          ║
║  Health:    http://{args.host}:{args.port}/health               ║
║  Repo:      {REPO_ROOT.name:<47} ║
╚══════════════════════════════════════════════════════════════╝
    """)

    uvicorn.run(app, host=args.host, port=args.port, log_level="info")
