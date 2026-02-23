#!/usr/bin/env python3
"""
Terminal WebSocket Bridge - Pure Python PTY Bridge

Provides WebSocket-to-PTY bridging for web terminals.
Does not require Rust API server.

Usage:
    python3 systems/visual_shell/api/terminal_websocket_bridge.py

WebSocket Protocol:
    Connect: ws://localhost:8769/terminal?token=<session_token>

    Client -> Server:
        {"type": "resize", "cols": 120, "rows": 36}
        {"type": "input", "data": "ls -la\\n"}

    Server -> Client:
        {"type": "output", "data": "terminal output..."}
        {"type": "exit", "code": 0}
"""

import asyncio
import json
import os
import pty
import signal
import sys
import fcntl
import struct
import termios
import uuid
from pathlib import Path
from typing import Dict, Optional, Set
from datetime import datetime

try:
    import websockets
    from websockets.server import serve
except ImportError:
    print("Installing websockets...")
    import subprocess
    subprocess.check_call([sys.executable, "-m", "pip", "install", "websockets"])
    import websockets
    from websockets.server import serve

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))


class TerminalSession:
    """Represents a single terminal session with PTY."""

    def __init__(self, session_id: str, cols: int = 120, rows: int = 36,
                 shell: str = "/bin/bash"):
        self.session_id = session_id
        self.cols = cols
        self.rows = rows
        self.shell = shell
        self.master_fd: Optional[int] = None
        self.slave_fd: Optional[int] = None
        self.pid: Optional[int] = None
        self.websocket = None
        self.output_task: Optional[asyncio.Task] = None
        self.created_at = datetime.now()
        self.last_activity = datetime.now()

    async def start(self):
        """Start the PTY process."""
        # Create pseudo-terminal
        self.master_fd, self.slave_fd = pty.openpty()

        # Set initial window size
        self._set_winsize(self.master_fd, self.rows, self.cols)

        # Fork process
        self.pid = os.fork()

        if self.pid == 0:
            # Child process
            os.setsid()

            # Set controlling terminal
            fcntl.ioctl(self.slave_fd, termios.TIOCSCTTY, 0)

            # Duplicate slave to stdin/stdout/stderr
            os.dup2(self.slave_fd, 0)
            os.dup2(self.slave_fd, 1)
            os.dup2(self.slave_fd, 2)

            # Close master
            os.close(self.master_fd)

            # Set environment
            env = os.environ.copy()
            env["TERM"] = "xterm-256color"
            env["COLORTERM"] = "truecolor"
            env["LSCOLORS"] = "GxFxCxDxBxegedabagaced"

            # Execute shell
            try:
                os.execvpe(self.shell, [self.shell], env)
            except Exception as e:
                print(f"Failed to exec shell: {e}", file=sys.stderr)
                os._exit(1)
        else:
            # Parent process
            os.close(self.slave_fd)
            self.slave_fd = None

            # Set non-blocking on master
            flags = fcntl.fcntl(self.master_fd, fcntl.F_GETFL)
            fcntl.fcntl(self.master_fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)

            print(f"🖥️  Started PTY session {self.session_id[:8]} (PID: {self.pid})")

    def _set_winsize(self, fd: int, rows: int, cols: int):
        """Set terminal window size."""
        winsize = struct.pack('HHHH', rows, cols, 0, 0)
        fcntl.ioctl(fd, termios.TIOCSWINSZ, winsize)

    def resize(self, cols: int, rows: int):
        """Resize the terminal."""
        self.cols = cols
        self.rows = rows
        if self.master_fd is not None:
            self._set_winsize(self.master_fd, rows, cols)

    async def write(self, data: str):
        """Write data to the PTY."""
        if self.master_fd is not None:
            try:
                os.write(self.master_fd, data.encode('utf-8'))
                self.last_activity = datetime.now()
            except BlockingIOError:
                pass  # Buffer full, try again later
            except BrokenPipeError:
                pass  # Process died

    async def read_loop(self):
        """Read output from PTY and send to WebSocket."""
        loop = asyncio.get_event_loop()

        while self.master_fd is not None and self.websocket is not None:
            try:
                # Use asyncio to read from the fd
                data = await loop.run_in_executor(None, self._blocking_read)
                if data:
                    self.last_activity = datetime.now()
                    await self.websocket.send(json.dumps({
                        "type": "output",
                        "data": data
                    }))
            except asyncio.CancelledError:
                break
            except Exception as e:
                if "Resource temporarily unavailable" not in str(e):
                    await asyncio.sleep(0.01)

    def _blocking_read(self) -> Optional[str]:
        """Blocking read from master fd."""
        try:
            data = os.read(self.master_fd, 65536)
            return data.decode('utf-8', errors='replace')
        except BlockingIOError:
            return None
        except OSError:
            return None

    def is_alive(self) -> bool:
        """Check if the PTY process is still running."""
        if self.pid is None:
            return False
        try:
            pid, status = os.waitpid(self.pid, os.WNOHANG)
            return pid == 0  # 0 means still running
        except ChildProcessError:
            return False

    async def stop(self):
        """Stop the terminal session."""
        if self.output_task:
            self.output_task.cancel()
            try:
                await self.output_task
            except asyncio.CancelledError:
                pass

        if self.pid is not None:
            try:
                os.kill(self.pid, signal.SIGTERM)
                os.waitpid(self.pid, 0)
            except (ProcessLookupError, ChildProcessError):
                pass

        if self.master_fd is not None:
            try:
                os.close(self.master_fd)
            except OSError:
                pass
            self.master_fd = None

        print(f"🛑 Stopped PTY session {self.session_id[:8]}")


class TerminalWebSocketBridge:
    """
    WebSocket bridge for terminal sessions.

    Endpoints:
        GET  /health - Health check
        POST /terminal/session - Create new session
        WS   /terminal?token=<id> - WebSocket terminal
    """

    def __init__(self, port: int = 8769):
        self.port = port
        self.sessions: Dict[str, TerminalSession] = {}
        self.lock_file = "/tmp/terminal_ws_bridge.pid"

    def _is_already_running(self) -> bool:
        """Check if another instance is running."""
        if not os.path.exists(self.lock_file):
            return False

        try:
            with open(self.lock_file, 'r') as f:
                pid = int(f.read().strip())

            # Check if process exists
            os.kill(pid, 0)
            return True
        except (ValueError, ProcessLookupError, PermissionError):
            return False

    def _acquire_lock(self):
        """Acquire PID lock."""
        with open(self.lock_file, 'w') as f:
            f.write(str(os.getpid()))

    def _release_lock(self):
        """Release PID lock."""
        if os.path.exists(self.lock_file):
            os.remove(self.lock_file)

    async def create_session(self, cols: int = 120, rows: int = 36,
                             shell: str = "/bin/bash") -> str:
        """Create a new terminal session."""
        session_id = str(uuid.uuid4())
        session = TerminalSession(session_id, cols, rows, shell)
        await session.start()
        self.sessions[session_id] = session
        return session_id

    async def handle_websocket(self, websocket, path: str):
        """Handle WebSocket connection for terminal."""
        # Extract token from path
        token = None
        if '?' in path:
            query = path.split('?', 1)[1]
            for param in query.split('&'):
                if param.startswith('token='):
                    token = param.split('=', 1)[1]
                    break

        # If no token or not found, create a new session
        if not token or token not in self.sessions:
            # Auto-create session
            session_id = await self.create_session()
            session = self.sessions[session_id]
            print(f"📱 Auto-created session {session_id[:8]} for connection")
        else:
            session = self.sessions[token]

        session.websocket = websocket

        # Start output task
        session.output_task = asyncio.create_task(session.read_loop())

        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                    msg_type = data.get("type")

                    if msg_type == "resize":
                        cols = data.get("cols", 120)
                        rows = data.get("rows", 36)
                        session.resize(cols, rows)

                    elif msg_type == "input":
                        input_data = data.get("data", "")
                        await session.write(input_data)

                except json.JSONDecodeError:
                    # Raw input (backward compatibility)
                    await session.write(message)

        except websockets.exceptions.ConnectionClosed:
            pass
        finally:
            session.websocket = None
            if session.output_task:
                session.output_task.cancel()

    async def handle_http(self, path: str, method: str = "GET",
                          body: bytes = b"") -> tuple:
        """Handle HTTP requests."""
        if path == "/health":
            return (200, {"status": "ok", "sessions": len(self.sessions)})

        elif path == "/terminal/session" and method == "POST":
            try:
                data = json.loads(body) if body else {}
                cols = data.get("cols", 120)
                rows = data.get("rows", 36)
                shell = data.get("shell", "/bin/bash")

                session_id = await self.create_session(cols, rows, shell)
                return (200, {"session_id": session_id, "cols": cols, "rows": rows})
            except Exception as e:
                return (500, {"error": str(e)})

        elif path.startswith("/terminal/"):
            session_id = path.split("/terminal/", 1)[1].rstrip("/")
            if session_id in self.sessions:
                session = self.sessions[session_id]
                return (200, {
                    "session_id": session_id,
                    "cols": session.cols,
                    "rows": session.rows,
                    "alive": session.is_alive()
                })
            return (404, {"error": "Session not found"})

        return (404, {"error": "Not found"})

    async def ws_handler(self, websocket, path: str):
        """Main WebSocket handler with path routing."""
        if path.startswith("/terminal"):
            await self.handle_websocket(websocket, path)
        else:
            await websocket.close(1000, "Unknown path")

    async def run(self):
        """Run the bridge server."""
        if self._is_already_running():
            print(f"❌ Terminal WebSocket Bridge already running")
            return

        self._acquire_lock()

        try:
            print(f"🌐 Terminal WebSocket Bridge starting on port {self.port}")
            print(f"   WebSocket: ws://localhost:{self.port}/terminal")
            print(f"   Health:    http://localhost:{self.port}/health")
            print(f"")
            print(f"Protocol:")
            print(f'   Send: {{"type": "resize", "cols": 120, "rows": 36}}')
            print(f'   Send: {{"type": "input", "data": "ls -la\\n"}}')
            print(f'   Recv: {{"type": "output", "data": "..."}}')
            print(f"")

            async with serve(self.ws_handler, "0.0.0.0", self.port):
                # Cleanup task
                asyncio.create_task(self._cleanup_loop())
                await asyncio.Future()

        finally:
            self._release_lock()

    async def _cleanup_loop(self):
        """Periodically cleanup dead sessions."""
        while True:
            await asyncio.sleep(30)

            dead_sessions = []
            for session_id, session in self.sessions.items():
                if not session.is_alive():
                    dead_sessions.append(session_id)

            for session_id in dead_sessions:
                session = self.sessions.pop(session_id)
                await session.stop()
                print(f"🧹 Cleaned up dead session {session_id[:8]}")


async def main():
    bridge = TerminalWebSocketBridge(port=8769)
    await bridge.run()


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\n👋 Shutdown complete")
