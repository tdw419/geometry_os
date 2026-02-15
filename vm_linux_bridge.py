"""
Geometry OS: VM Linux Bridge

Provides a unified interface for executing commands in Linux VMs.
Supports multiple backends: QEMU, WGPU Hypervisor, Host (for testing).
"""

from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import Optional


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
