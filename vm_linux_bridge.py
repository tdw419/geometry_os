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
