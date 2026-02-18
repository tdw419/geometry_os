#!/usr/bin/env python3
"""
Geometry OS - Linux Bridge

Bridges WebMCP commands to a real Linux instance (QEMU/LXC).
Enables AI agents to control Linux running on the PixiJS map.

Usage:
    python linux_bridge.py

WebSocket API on port 8767:
    Commands: linux_boot, linux_exec, linux_read_file, linux_write_file,
              linux_screenshot, linux_input, linux_terminate

Environment:
    Set QEMU_PATH to specify QEMU binary (default: qemu-system-x86_64)
    Set ALPINE_IMAGE to specify Alpine Linux ISO (default: alpine.iso)
"""

import asyncio
import json
import subprocess
import base64
import os
import signal
import tempfile
import time
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, Any, Optional, List
from datetime import datetime
import logging

try:
    import websockets
except ImportError:
    print("ERROR: websockets not installed. Run: pip install websockets")
    exit(1)

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("linux-bridge")

# Configuration
BRIDGE_PORT = int(os.environ.get('LINUX_BRIDGE_PORT', '8767'))
QEMU_PATH = os.environ.get('QEMU_PATH', 'qemu-system-x86_64')
ALPINE_IMAGE = os.environ.get('ALPINE_IMAGE', 'alpine.iso')
UBUNTU_IMAGE = os.environ.get('UBUNTU_IMAGE', 'ubuntu.iso')


@dataclass
class LinuxSession:
    """Represents a Linux instance."""
    session_id: str
    kernel: str
    process: Optional[subprocess.Popen] = None
    monitor_socket: Optional[str] = None
    serial_socket: Optional[str] = None
    status: str = 'booting'
    tty_buffer: str = ''
    framebuffer_path: Optional[str] = None
    created_at: datetime = field(default_factory=datetime.now)
    last_activity: datetime = field(default_factory=datetime.now)
    command_history: List[str] = field(default_factory=list)


class LinuxBridge:
    """
    Bridges WebMCP to Linux instances.
    
    Architecture:
        WebMCP Tools --WebSocket--> LinuxBridge --QEMU/LXC--> Linux
    """
    
    def __init__(self):
        self.sessions: Dict[str, LinuxSession] = {}
        self.ws_clients = set()
        self.session_counter = 0
        self.temp_dir = tempfile.mkdtemp(prefix='linux-bridge-')
        logger.info(f"Linux Bridge initialized, temp dir: {self.temp_dir}")
    
    async def boot_linux(self, kernel: str = 'alpine', options: dict = None) -> dict:
        """
        Boot a Linux instance.
        
        Args:
            kernel: 'alpine', 'ubuntu', or 'custom'
            options: Boot options (tty_rows, tty_cols, memory, etc.)
        
        Returns:
            {session_id, status, message}
        """
        options = options or {}
        
        # Generate session ID
        self.session_counter += 1
        session_id = f"linux-{self.session_counter}"
        
        # Select kernel image
        if kernel == 'alpine':
            image = ALPINE_IMAGE
        elif kernel == 'ubuntu':
            image = UBUNTU_IMAGE
        else:
            image = kernel

        # Get paths from options
        kernel_path = options.get('kernel_path', 'vmlinuz-virt')
        initrd_path = options.get('initrd_path', 'initramfs-virt')
        disk_image = options.get('disk_image', image)

        # For 'custom' kernel, check the actual boot files exist
        if kernel == 'custom' or kernel_path:
            # Check kernel and initrd exist
            kernel_exists = Path(kernel_path).exists()
            initrd_exists = Path(initrd_path).exists()
            disk_exists = Path(disk_image).exists() if disk_image else False

            if not kernel_exists:
                # Try common locations
                for search_path in [Path.cwd(), Path('/home/jericho/zion/projects/geometry_os/geometry_os')]:
                    if (search_path / kernel_path).exists():
                        kernel_path = str(search_path / kernel_path)
                        kernel_exists = True
                        break

            if not initrd_exists:
                for search_path in [Path.cwd(), Path('/home/jericho/zion/projects/geometry_os/geometry_os')]:
                    if (search_path / initrd_path).exists():
                        initrd_path = str(search_path / initrd_path)
                        initrd_exists = True
                        break

            if not disk_exists and disk_image:
                for search_path in [Path.cwd(), Path('/home/jericho/zion/projects/geometry_os/geometry_os')]:
                    if (search_path / disk_image).exists():
                        disk_image = str(search_path / disk_image)
                        disk_exists = True
                        break

            if not kernel_exists or not initrd_exists:
                logger.warning(f"Boot files not found: kernel={kernel_path} ({kernel_exists}), initrd={initrd_path} ({initrd_exists}), creating mock session")
                return await self._create_mock_session(session_id, kernel)

            # Update options with resolved paths
            options['kernel_path'] = kernel_path
            options['initrd_path'] = initrd_path
            options['disk_image'] = disk_image
        else:
            # Check if ISO image exists (for alpine/ubuntu)
            if not Path(image).exists():
                for search_path in [Path.cwd(), Path('/home/jericho/zion/projects/geometry_os/geometry_os')]:
                    candidate = search_path / image
                    if candidate.exists():
                        image = str(candidate)
                        break
                else:
                    logger.warning(f"Image not found: {image}, creating mock session")
                    return await self._create_mock_session(session_id, kernel)
        
        # Create session
        session = LinuxSession(
            session_id=session_id,
            kernel=kernel,
            status='booting'
        )
        
        # Create sockets
        monitor_socket = f"{self.temp_dir}/{session_id}-monitor.sock"
        serial_socket = f"{self.temp_dir}/{session_id}-serial.sock"
        
        session.monitor_socket = monitor_socket
        session.serial_socket = serial_socket
        
        # QEMU command
        memory = options.get('memory', '512M')
        kernel_path = options.get('kernel_path', 'vmlinuz-virt')
        initrd_path = options.get('initrd_path', 'initramfs-virt')
        disk_image = options.get('disk_image', image) # Fallback to original 'image' for compatibility

        qemu_cmd = [
            QEMU_PATH,
            '-m', memory,
            '-kernel', kernel_path,
            '-initrd', initrd_path,
            '-drive', f'file={disk_image},format=raw,id=hd0',
            '-device', 'virtio-blk-pci,drive=hd0',
            '-append', 'root=/dev/vda console=ttyS0',
            '-nographic',
            '-enable-kvm',  # Use KVM for speed
            '-smp', '2',
            # Networking to allow guest to access host services (e.g., at 10.0.2.2)
            '-netdev', 'user,id=net0',
            '-device', 'virtio-net-pci,netdev=net0',
        ]
        
        # Sockets for communication
        qemu_cmd.extend([
            '-serial', f'unix:{serial_socket},server,nowait',
            '-monitor', f'unix:{monitor_socket},server,nowait',
        ])

        
        # Remove KVM if not available
        try:
            subprocess.run(['ls', '/dev/kvm'], check=True, capture_output=True)
        except:
            logger.warning("KVM not available, using emulation (slower)")
            qemu_cmd = [c for c in qemu_cmd if c != '-enable-kvm']
        
        try:
            logger.info(f"Starting QEMU: {' '.join(qemu_cmd[:5])}...")
            session.process = subprocess.Popen(
                qemu_cmd,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE
            )
            session.status = 'booting'
            self.sessions[session_id] = session
            
            # Wait for boot
            await asyncio.sleep(5)
            session.status = 'ready'
            
            return {
                'session_id': session_id,
                'status': 'ready',
                'kernel': kernel,
                'message': f'Linux {kernel} booted successfully'
            }
            
        except Exception as e:
            logger.error(f"Failed to boot Linux: {e}")
            session.status = 'error'
            return {
                'session_id': session_id,
                'status': 'error',
                'error': str(e)
            }
    
    async def _create_mock_session(self, session_id: str, kernel: str) -> dict:
        """Create a mock Linux session for demo/testing."""
        session = LinuxSession(
            session_id=session_id,
            kernel=kernel,
            status='ready',
            tty_buffer=f"{kernel} linux-bridge 5.15.0 #1 SMP\n{session_id} login: "
        )
        self.sessions[session_id] = session
        
        return {
            'session_id': session_id,
            'status': 'ready',
            'kernel': kernel,
            'message': f'Mock {kernel} session created (no QEMU image)'
        }
    
    async def exec_command(self, session_id: str, command: str, timeout: int = 30) -> dict:
        """
        Execute a command in Linux.
        
        Args:
            session_id: Session to execute in
            command: Shell command
            timeout: Timeout in seconds
        
        Returns:
            {stdout, stderr, exit_code, duration_ms}
        """
        session = self.sessions.get(session_id)
        if not session:
            return {'error': f'Session not found: {session_id}'}
        
        session.last_activity = datetime.now()
        session.command_history.append(command)
        
        start_time = time.time()
        
        # Mock execution for demo
        if session.process is None:
            return await self._mock_exec(session, command)
        
        # Real execution via serial socket
        try:
            # Connect to serial socket
            reader, writer = await asyncio.wait_for(
                asyncio.open_unix_connection(session.serial_socket),
                timeout=5
            )
            
            # Send command
            writer.write(f"{command}\n".encode())
            await writer.drain()
            
            # Read output (simplified)
            await asyncio.sleep(0.5)
            output = b""
            try:
                while True:
                    chunk = await asyncio.wait_for(reader.read(4096), timeout=0.1)
                    if not chunk:
                        break
                    output += chunk
            except asyncio.TimeoutError:
                pass
            
            writer.close()
            await writer.wait_closed()
            
            duration = int((time.time() - start_time) * 1000)
            
            return {
                'stdout': output.decode('utf-8', errors='replace'),
                'stderr': '',
                'exit_code': 0,
                'duration_ms': duration
            }
            
        except Exception as e:
            return {
                'stdout': '',
                'stderr': str(e),
                'exit_code': 1,
                'duration_ms': 0
            }
    
    async def _mock_exec(self, session: LinuxSession, command: str) -> dict:
        """Mock command execution for demo."""
        await asyncio.sleep(0.1)  # Simulate latency
        
        # Simulate some commands
        if command == 'uname -a':
            stdout = f"Linux {session.session_id} 5.15.0-generic #1 SMP x86_64 GNU/Linux"
        elif command == 'pwd':
            stdout = "/root"
        elif command == 'ls -la':
            stdout = "total 24\ndrwxr-xr-x 3 root root 4096 .\ndrwxr-xr-x 3 root root 4096 ..\n-rw-r--r-- 1 root root  220 .bashrc"
        elif command.startswith('cat '):
            stdout = f"File contents of {command[4:]}"
        elif command.startswith('echo '):
            stdout = command[5:]
        elif command == 'whoami':
            stdout = "root"
        elif command == 'df -h':
            stdout = "Filesystem      Size  Used Avail Use% Mounted on\n/dev/sda1       4.0G  1.2G  2.8G  30% /"
        else:
            stdout = f"[{session.kernel}] $ {command}\nCommand executed (mock)"
        
        session.tty_buffer += f"$ {command}\n{stdout}\n"
        
        return {
            'stdout': stdout,
            'stderr': '',
            'exit_code': 0,
            'duration_ms': 50
        }
    
    async def read_file(self, session_id: str, path: str, encoding: str = 'text') -> dict:
        """Read file from Linux."""
        session = self.sessions.get(session_id)
        if not session:
            return {'error': f'Session not found: {session_id}'}
        
        # Use cat command
        result = await self.exec_command(session_id, f'cat {path}')
        
        if result.get('exit_code') == 0:
            content = result['stdout']
            if encoding == 'base64':
                content = base64.b64encode(content.encode()).decode()
            
            return {
                'content': content,
                'path': path,
                'size': len(result['stdout']),
                'encoding': encoding
            }
        else:
            return {
                'error': f'Failed to read file: {result.get("stderr", "Unknown error")}',
                'path': path
            }
    
    async def write_file(self, session_id: str, path: str, content: str, encoding: str = 'text') -> dict:
        """Write file to Linux."""
        session = self.sessions.get(session_id)
        if not session:
            return {'error': f'Session not found: {session_id}'}
        
        if encoding == 'base64':
            content = base64.b64decode(content).decode()
        
        # Use heredoc to write file
        escaped_content = content.replace("'", "'\\''")
        command = f"echo '{escaped_content}' > {path}"
        result = await self.exec_command(session_id, command)
        
        if result.get('exit_code') == 0:
            return {
                'success': True,
                'path': path,
                'bytes_written': len(content)
            }
        else:
            return {
                'success': False,
                'error': result.get('stderr', 'Unknown error'),
                'path': path
            }
    
    async def screenshot(self, session_id: str, region: dict = None) -> dict:
        """Capture Linux framebuffer."""
        session = self.sessions.get(session_id)
        if not session:
            return {'error': f'Session not found: {session_id}'}
        
        # Mock screenshot for demo
        # Real implementation would use QEMU screendump or VNC
        mock_png = base64.b64encode(b"MOCK_PNG_DATA").decode()
        
        return {
            'image': mock_png,
            'width': 800,
            'height': 600,
            'format': 'png',
            'region': region
        }
    
    async def send_input(self, session_id: str, input_type: str, **kwargs) -> dict:
        """Send input to Linux."""
        session = self.sessions.get(session_id)
        if not session:
            return {'error': f'Session not found: {session_id}'}
        
        if input_type == 'text':
            text = kwargs.get('text', '')
            # Send to serial
            return {'success': True, 'input': text}
        elif input_type == 'key':
            key = kwargs.get('key', '')
            return {'success': True, 'key': key}
        elif input_type == 'mouse':
            x = kwargs.get('x', 0)
            y = kwargs.get('y', 0)
            return {'success': True, 'mouse': (x, y)}
        
        return {'success': False, 'error': 'Unknown input type'}
    
    async def install_package(self, session_id: str, package: str, manager: str = 'apk') -> dict:
        """Install a package."""
        if manager == 'apk':
            cmd = f'apk add {package}'
        elif manager == 'apt':
            cmd = f'apt-get install -y {package}'
        else:
            return {'success': False, 'error': f'Unknown package manager: {manager}'}
        
        result = await self.exec_command(session_id, cmd, timeout=120)
        
        return {
            'success': result.get('exit_code') == 0,
            'package': package,
            'output': result.get('stdout', '')
        }
    
    async def terminate(self, session_id: str) -> dict:
        """Terminate a Linux session."""
        session = self.sessions.get(session_id)
        if not session:
            return {'error': f'Session not found: {session_id}'}
        
        if session.process:
            session.process.terminate()
            try:
                session.process.wait(timeout=5)
            except:
                session.process.kill()
        
        del self.sessions[session_id]
        
        return {
            'success': True,
            'session_id': session_id,
            'message': 'Session terminated'
        }
    
    async def list_sessions(self) -> dict:
        """List all active sessions."""
        return {
            'sessions': [
                {
                    'session_id': s.session_id,
                    'kernel': s.kernel,
                    'status': s.status,
                    'created_at': s.created_at.isoformat(),
                    'last_activity': s.last_activity.isoformat()
                }
                for s in self.sessions.values()
            ]
        }
    
    async def handle_command(self, data: dict) -> dict:
        """Route command to appropriate handler."""
        cmd = data.get('command', data.get('name'))
        
        if cmd == 'linux_boot':
            return await self.boot_linux(
                data.get('kernel', 'alpine'),
                data.get('options')
            )
        elif cmd == 'linux_exec':
            return await self.exec_command(
                data.get('session_id'),
                data.get('command'),
                data.get('timeout', 30)
            )
        elif cmd == 'linux_read_file':
            return await self.read_file(
                data.get('session_id'),
                data.get('path'),
                data.get('encoding', 'text')
            )
        elif cmd == 'linux_write_file':
            return await self.write_file(
                data.get('session_id'),
                data.get('path'),
                data.get('content'),
                data.get('encoding', 'text')
            )
        elif cmd == 'linux_screenshot':
            return await self.screenshot(
                data.get('session_id'),
                data.get('region')
            )
        elif cmd == 'linux_input':
            return await self.send_input(
                data.get('session_id'),
                data.get('type', 'text'),
                **{k: v for k, v in data.items() if k not in ['command', 'session_id', 'type']}
            )
        elif cmd == 'linux_install_package':
            return await self.install_package(
                data.get('session_id'),
                data.get('package'),
                data.get('manager', 'apk')
            )
        elif cmd == 'linux_terminate':
            return await self.terminate(data.get('session_id'))
        elif cmd == 'linux_list_sessions':
            return await self.list_sessions()
        
        return {'error': f'Unknown command: {cmd}'}
    
    async def handle_websocket(self, websocket, path=None):
        """Handle WebSocket connection."""
        self.ws_clients.add(websocket)
        client_addr = websocket.remote_address if hasattr(websocket, 'remote_address') else 'unknown'
        logger.info(f"Client connected: {client_addr}")
        
        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                    logger.debug(f"Received command: {data.get('command', data.get('name'))}")
                    
                    response = await self.handle_command(data)
                    response['_timestamp'] = datetime.now().isoformat()
                    
                    await websocket.send(json.dumps(response))
                    
                except json.JSONDecodeError:
                    await websocket.send(json.dumps({'error': 'Invalid JSON'}))
                except Exception as e:
                    logger.exception(f"Error handling command")
                    await websocket.send(json.dumps({'error': str(e)}))
                    
        except websockets.exceptions.ConnectionClosed:
            pass
        finally:
            self.ws_clients.discard(websocket)
            logger.info(f"Client disconnected: {client_addr}")
    
    async def cleanup(self):
        """Clean up all sessions."""
        logger.info("Cleaning up sessions...")
        for session_id in list(self.sessions.keys()):
            await self.terminate(session_id)


async def main():
    """Run the Linux Bridge server."""
    bridge = LinuxBridge()
    
    logger.info("")
    logger.info("═══════════════════════════════════════════════════════════")
    logger.info("     Geometry OS - Linux Bridge")
    logger.info("═══════════════════════════════════════════════════════════")
    logger.info(f"  WebSocket: ws://localhost:{BRIDGE_PORT}")
    logger.info(f"  Temp Dir:  {bridge.temp_dir}")
    logger.info("")
    logger.info("  Commands:")
    logger.info("    linux_boot, linux_exec, linux_read_file, linux_write_file")
    logger.info("    linux_screenshot, linux_input, linux_terminate")
    logger.info("")
    logger.info("═══════════════════════════════════════════════════════════")
    logger.info("")
    
    async with websockets.serve(bridge.handle_websocket, 'localhost', BRIDGE_PORT):
        try:
            await asyncio.Future()  # Run forever
        except asyncio.CancelledError:
            pass
        finally:
            await bridge.cleanup()


if __name__ == '__main__':
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        logger.info("\nShutdown requested")
