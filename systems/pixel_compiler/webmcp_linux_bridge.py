"""WebMCP Linux Bridge - Connects AI agents to Linux via WebSocket."""

import asyncio
import json
import subprocess
import os
import select
import time
import uuid
from pathlib import Path
from typing import Optional, Dict, Any


class LinuxBridge:
    """
    Bridges WebMCP commands to a Linux QEMU instance.

    Manages QEMU process lifecycle, serial console I/O, and command execution.
    """

    def __init__(self):
        self.session_id: Optional[str] = None
        self.status: str = 'stopped'
        self._process: Optional[subprocess.Popen] = None
        self._qemu_root: Path = Path(__file__).parent.parent.parent  # Project root (systems/pixel_compiler/..)

    def _build_qemu_command(self) -> str:
        """Build the QEMU command string."""
        kernel_path = self._qemu_root / 'kernel'
        initrd_path = self._qemu_root / 'initrd'
        disk_path = self._qemu_root / 'alpine_disk.qcow2'

        cmd = (
            f'qemu-system-x86_64 '
            f'-m 1024 '
            f'-kernel {kernel_path} '
            f'-initrd {initrd_path} '
            f'-append "console=ttyS0" '
            f'-drive file={disk_path},if=virtio,format=qcow2 '
            f'-nographic '
            f'-serial mon:stdio'
        )
        return cmd

    def boot(self) -> Dict[str, Any]:
        """Start the Linux QEMU instance."""
        if self._process is not None:
            return {
                'session_id': self.session_id,
                'status': 'already_running',
                'error': 'Linux instance already running'
            }

        self.session_id = f'linux-{uuid.uuid4().hex[:8]}'
        self.status = 'booting'

        cmd = self._build_qemu_command()

        self._process = subprocess.Popen(
            cmd,
            shell=True,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            cwd=str(self._qemu_root)
        )

        return {
            'session_id': self.session_id,
            'status': 'booting',
            'pid': self._process.pid
        }

    def shutdown(self) -> Dict[str, Any]:
        """Shutdown the Linux instance."""
        if self._process is None:
            return {'status': 'already_stopped'}

        if self._process.poll() is None:  # Process is still running
            self._process.terminate()
            try:
                self._process.wait(timeout=5)
            except subprocess.TimeoutExpired:
                self._process.kill()

        self._process = None
        self.status = 'stopped'
        session_id = self.session_id
        self.session_id = None

        return {
            'status': 'stopped',
            'session_id': session_id
        }

    def exec_command(self, command: str, timeout: float = 30.0) -> Dict[str, Any]:
        """Execute a command in the Linux instance via serial console."""
        if self._process is None or self._process.poll() is not None:
            return {
                'error': 'Linux instance not running',
                'exit_code': -1
            }

        try:
            # Send command with newline
            cmd_bytes = f'{command}\n'.encode('utf-8')
            self._process.stdin.write(cmd_bytes)
            self._process.stdin.flush()

            # Read output until we see a shell prompt or timeout
            output = b''
            start_time = time.time()

            while time.time() - start_time < timeout:
                # Check if there's data to read
                readable, _, _ = select.select([self._process.stdout], [], [], 0.1)

                if readable:
                    chunk = self._process.stdout.read(1024)
                    if chunk:
                        output += chunk

                    # Check for shell prompt (simple heuristic)
                    if b'# ' in output or b'$ ' in output or b'~# ' in output:
                        break

            # Decode output
            stdout_text = output.decode('utf-8', errors='replace')

            return {
                'stdout': stdout_text,
                'stderr': '',
                'exit_code': 0,
                'command': command,
                'timeout': time.time() - start_time >= timeout
            }

        except Exception as e:
            return {
                'error': str(e),
                'exit_code': -1
            }

    def read_file(self, path: str) -> Dict[str, Any]:
        """Read a file from the Linux filesystem."""
        # Escape the path for shell safety
        safe_path = path.replace('"', '\\"')
        result = self.exec_command(f'cat "{safe_path}"')

        if 'error' in result and 'not running' in result['error']:
            return result

        return {
            'content': result.get('stdout', ''),
            'path': path,
            'success': 'error' not in result or result.get('exit_code') == 0
        }

    def write_file(self, path: str, content: str) -> Dict[str, Any]:
        """Write a file to the Linux filesystem."""
        # Use heredoc for multi-line content
        safe_path = path.replace("'", "'\\''")
        safe_content = content.replace("'", "'\\''")

        result = self.exec_command(f"echo '{safe_content}' > '{safe_path}'")

        return {
            'success': result.get('exit_code') == 0,
            'path': path,
            'bytes_written': len(content) if result.get('exit_code') == 0 else 0
        }

    def handle_command(self, data: Dict[str, Any]) -> Dict[str, Any]:
        """Route incoming WebSocket commands to appropriate handlers."""
        command = data.get('command', '')

        if command == 'boot':
            return self.boot()
        elif command == 'shutdown':
            return self.shutdown()
        elif command == 'exec':
            return self.exec_command(data.get('cmd', ''))
        elif command == 'read_file':
            return self.read_file(data.get('path', '/'))
        elif command == 'write_file':
            return self.write_file(
                data.get('path', '/tmp/file'),
                data.get('content', '')
            )
        elif command == 'status':
            return {
                'session_id': self.session_id,
                'status': self.status,
                'running': self._process is not None and self._process.poll() is None
            }
        else:
            return {
                'error': f'Unknown command: {command}',
                'available_commands': ['boot', 'shutdown', 'exec', 'read_file', 'write_file', 'status']
            }

    def get_status(self) -> Dict[str, Any]:
        """Get current bridge status."""
        return {
            'session_id': self.session_id,
            'status': self.status,
            'running': self._process is not None and self._process.poll() is None,
            'pid': self._process.pid if self._process else None
        }

    async def handle_websocket_message(self, websocket, message: str) -> str:
        """Handle a single WebSocket message."""
        try:
            data = json.loads(message)
            result = self.handle_command(data)
            return json.dumps(result)
        except json.JSONDecodeError:
            return json.dumps({'error': 'Invalid JSON'})
        except Exception as e:
            return json.dumps({'error': str(e)})


async def websocket_handler(websocket, bridge: LinuxBridge):
    """Handle WebSocket connections."""
    try:
        async for message in websocket:
            response = await bridge.handle_websocket_message(websocket, message)
            await websocket.send(response)
    except Exception as e:
        print(f"WebSocket error: {e}")


async def main():
    """Run the Linux Bridge WebSocket server."""
    import websockets

    bridge = LinuxBridge()

    async with websockets.serve(
        lambda ws: websocket_handler(ws, bridge),
        'localhost',
        8767
    ):
        print('Linux Bridge running on ws://localhost:8767')
        await asyncio.Future()  # Run forever


if __name__ == '__main__':
    asyncio.run(main())
