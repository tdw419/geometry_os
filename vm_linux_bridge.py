"""
Geometry OS: VM Linux Bridge

Provides a unified interface for executing commands in Linux VMs.
Supports multiple backends: QEMU, WGPU Hypervisor, Host (for testing).
"""

from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Optional
import subprocess
import time
import json
import asyncio

try:
    import websockets
except ImportError:
    websockets = None


@dataclass
class CommandResult:
    """Result of executing a command in the VM."""
    stdout: str
    stderr: str
    exit_code: int
    duration_ms: int = 0


class VMLinuxBridge(ABC):
    """
    Abstract base class for Linux VM bridges.

    Implementations:
    - HostBridge: Execute on host (for testing)
    - QEMUBridge: Execute via linux_bridge.py -> QEMU
    - WGPUBridge: Execute via wgpu_linux_hypervisor.js
    """

    @abstractmethod
    async def execute(self, command: str, timeout: int = 30) -> CommandResult:
        """
        Execute a command in the VM.

        Args:
            command: Shell command to execute
            timeout: Timeout in seconds

        Returns:
            CommandResult with stdout, stderr, exit_code
        """
        pass

    @abstractmethod
    async def start(self) -> bool:
        """
        Start/boot the VM.

        Returns:
            True if started successfully
        """
        pass

    @abstractmethod
    async def stop(self) -> bool:
        """
        Stop/shutdown the VM.

        Returns:
            True if stopped successfully
        """
        pass

    @abstractmethod
    def is_ready(self) -> bool:
        """
        Check if VM is ready to accept commands.

        Returns:
            True if VM is booted and ready
        """
        pass

    @abstractmethod
    def get_info(self) -> dict:
        """
        Get VM information.

        Returns:
            Dict with vm_type, status, kernel, etc.
        """
        pass


class HostBridge(VMLinuxBridge):
    """
    Execute commands on the host machine (for testing/development).
    This is the original behavior of map_terminal.py.
    """

    def __init__(self):
        self._ready = True
        self._vm_type = "host"

    async def execute(self, command: str, timeout: int = 30) -> CommandResult:
        """Execute command on host via subprocess."""
        start_time = time.time()

        try:
            result = subprocess.run(
                command,
                shell=True,
                capture_output=True,
                text=True,
                timeout=timeout
            )

            duration_ms = int((time.time() - start_time) * 1000)

            return CommandResult(
                stdout=result.stdout,
                stderr=result.stderr,
                exit_code=result.returncode,
                duration_ms=duration_ms
            )

        except subprocess.TimeoutExpired:
            return CommandResult(
                stdout="",
                stderr="Command timed out",
                exit_code=-1,
                duration_ms=timeout * 1000
            )
        except Exception as e:
            return CommandResult(
                stdout="",
                stderr=str(e),
                exit_code=-1,
                duration_ms=0
            )

    async def start(self) -> bool:
        """Host is always ready."""
        self._ready = True
        return True

    async def stop(self) -> bool:
        """Nothing to stop for host."""
        self._ready = False
        return True

    def is_ready(self) -> bool:
        """Host is always ready."""
        return self._ready

    def get_info(self) -> dict:
        """Get host info."""
        return {
            "vm_type": self._vm_type,
            "status": "ready" if self._ready else "stopped",
            "kernel": "host",
            "backend": "subprocess"
        }


class QEMUBridge(VMLinuxBridge):
    """
    Execute commands via linux_bridge.py which manages QEMU.

    Connects to WebSocket on port 8767.
    """

    def __init__(self, kernel_path: str, initrd_path: str, disk_image: str, bridge_port: int = 8767):
        if websockets is None:
            raise ImportError("websockets not installed. Run: pip install websockets")

        self.kernel_path = kernel_path
        self.initrd_path = initrd_path
        self.disk_image = disk_image
        self.bridge_port = bridge_port
        self.bridge_url = f"ws://localhost:{bridge_port}"

        self.session_id: Optional[str] = None
        self._ready = False
        self._vm_type = "qemu"

    async def _send_command(self, command: dict) -> dict:
        """Send command to linux_bridge and get response."""
        async with websockets.connect(self.bridge_url) as ws:
            await ws.send(json.dumps(command))
            response = await ws.recv()
            return json.loads(response)

    async def start(self) -> bool:
        """Boot Linux via linux_bridge."""
        try:
            boot_options = {
                "memory": "512M",
                "kernel_path": self.kernel_path,
                "initrd_path": self.initrd_path,
                "disk_image": self.disk_image,
            }
            result = await self._send_command({
                "command": "linux_boot",
                "kernel": "custom",  # Use the 'custom' path in linux_bridge
                "options": boot_options,
            })

            if result.get("status") in ("ready", "booting"):
                self.session_id = result.get("session_id")
                if result.get("status") == "booting":
                    await asyncio.sleep(5)
                self._ready = True
                return True
            else:
                print(f"Failed to boot: {result}")
                return False

        except Exception as e:
            print(f"Failed to connect to linux_bridge: {e}")
            return False

    async def stop(self) -> bool:
        """Terminate the VM session."""
        if not self.session_id:
            return True

        try:
            result = await self._send_command({
                "command": "linux_terminate",
                "session_id": self.session_id
            })
            self._ready = False
            self.session_id = None
            return result.get("success", False)
        except Exception as e:
            print(f"Failed to terminate: {e}")
            return False

    async def execute(self, command: str, timeout: int = 30) -> CommandResult:
        """Execute command in QEMU Linux."""
        if not self.session_id:
            return CommandResult(
                stdout="",
                stderr="No active session. Call start() first.",
                exit_code=-1
            )

        try:
            result = await self._send_command({
                "command": "linux_exec",
                "session_id": self.session_id,
                "command": command,
                "timeout": timeout
            })

            return CommandResult(
                stdout=result.get("stdout", ""),
                stderr=result.get("stderr", ""),
                exit_code=result.get("exit_code", 0),
                duration_ms=result.get("duration_ms", 0)
            )

        except Exception as e:
            return CommandResult(
                stdout="",
                stderr=str(e),
                exit_code=-1
            )

    def is_ready(self) -> bool:
        """Check if VM is ready."""
        return self._ready and self.session_id is not None

    def get_info(self) -> dict:
        """Get VM info."""
        return {
            "vm_type": self._vm_type,
            "status": "ready" if self._ready else "stopped",
            "kernel": self.kernel,
            "session_id": self.session_id,
            "backend": f"linux_bridge:{self.bridge_port}"
        }


class WGPUBridge(VMLinuxBridge):
    """
    Execute commands via wgpu_linux_hypervisor.js in browser.

    Uses Chrome DevTools Protocol to call JavaScript functions.
    """

    def __init__(self, cdp_ws, cdp_port: int = 9222):
        """
        Args:
            cdp_ws: WebSocket connection to Chrome DevTools
            cdp_port: Chrome DevTools port (default 9222)
        """
        self.cdp_ws = cdp_ws
        self.cdp_port = cdp_port

        self._ready = False
        self._vm_type = "wgpu"
        self._msg_id = 0

    async def _send_js(self, js_code: str) -> dict:
        """Send JavaScript to browser and get result."""
        self._msg_id += 1
        payload = {
            "id": self._msg_id,
            "method": "Runtime.evaluate",
            "params": {
                "expression": js_code,
                "returnByValue": True
            }
        }

        if hasattr(self.cdp_ws, 'send'):
            await self.cdp_ws.send(json.dumps(payload))
            response = await asyncio.wait_for(self.cdp_ws.recv(), timeout=5.0)
            return json.loads(response)
        else:
            return {"result": {"result": {"value": None}}}

    async def start(self) -> bool:
        """Initialize WGPU hypervisor in browser."""
        try:
            result = await self._send_js(
                "typeof window.wgpuHypervisor !== 'undefined'"
            )
            exists = result.get("result", {}).get("result", {}).get("value", False)

            if not exists:
                js_code = """
                    (async () => {
                        if (typeof WGPULinuxHypervisor === 'undefined') {
                            console.error('WGPULinuxHypervisor not loaded');
                            return false;
                        }
                        window.wgpuHypervisor = new WGPULinuxHypervisor({
                            width: 800,
                            height: 600,
                            cyclesPerFrame: 1000
                        });
                        await window.wgpuHypervisor.init();
                        return true;
                    })()
                """
                await self._send_js(js_code)
                await asyncio.sleep(1)

            self._ready = True
            return True

        except Exception as e:
            print(f"Failed to start WGPU hypervisor: {e}")
            return False

    async def stop(self) -> bool:
        """Stop WGPU hypervisor."""
        try:
            await self._send_js("window.wgpuHypervisor?.stop()")
            self._ready = False
            return True
        except Exception as e:
            print(f"Failed to stop: {e}")
            return False

    async def execute(self, command: str, timeout: int = 30) -> CommandResult:
        """Execute command in WGPU Linux (mock for now)."""
        if not self._ready:
            return CommandResult(
                stdout="",
                stderr="WGPU hypervisor not ready",
                exit_code=-1
            )

        start_time = time.time()

        js_code = f"""
            (async () => {{
                const mockOutputs = {{
                    'uname -a': 'Linux wgpu 5.15.0-wgpu #1 GPU RISC-V',
                    'pwd': '/root',
                    'whoami': 'root',
                    'ls': 'bin  dev  etc  home  root  usr',
                    'df -h': '/dev/gpu0    128M   64M   64M  50% /'
                }};

                return {{
                    stdout: mockOutputs['{command}'] || '[WGPU] $ {command}\\nExecuted on GPU',
                    stderr: '',
                    exit_code: 0
                }};
            }})()
        """

        try:
            result = await self._send_js(js_code)
            value = result.get("result", {}).get("result", {}).get("value", {})

            if isinstance(value, dict):
                return CommandResult(
                    stdout=value.get("stdout", ""),
                    stderr=value.get("stderr", ""),
                    exit_code=value.get("exit_code", 0),
                    duration_ms=int((time.time() - start_time) * 1000)
                )
            else:
                return CommandResult(
                    stdout=str(value) if value else "",
                    stderr="",
                    exit_code=0,
                    duration_ms=int((time.time() - start_time) * 1000)
                )

        except Exception as e:
            return CommandResult(
                stdout="",
                stderr=str(e),
                exit_code=-1
            )

    def is_ready(self) -> bool:
        """Check if WGPU hypervisor is ready."""
        return self._ready

    def get_info(self) -> dict:
        """Get VM info."""
        return {
            "vm_type": self._vm_type,
            "status": "ready" if self._ready else "stopped",
            "kernel": "wgpu-riscv",
            "backend": "wgpu_linux_hypervisor.js"
        }
