"""Glyph Virtual Machine - CPU interpreter for glyph applications.

Executes glyph bytecode in the Spatial Program Coordinator.

Features:
- 32 general-purpose registers (32-bit each)
- 64KB memory address space
- Stack for call/return
- Interrupt handling
- Syscall interface

Usage:
    vm = GlyphVM()
    vm.load_app(app_bytes)
    vm.run()
"""

from dataclasses import dataclass, field
from typing import List, Optional, Callable, Tuple
from enum import IntFlag

from .opcodes import (
    Opcode, CompareFlags,
    R0, R1, R2, R3,
    R_REGION_ORIGIN, R_INT_PAYLOAD, R_INT_TYPE, R_INT_SOURCE,
)
from .types import SyscallID, ErrorCode


@dataclass
class VMState:
    """Snapshot of VM state for debugging."""
    pc: int = 0
    registers: List[int] = field(default_factory=lambda: [0] * 32)
    memory: bytearray = field(default_factory=bytearray)
    halted: bool = False
    error: Optional[str] = None
    flags: int = 0
    stack: List[int] = field(default_factory=list)
    frame: int = 0  # Current frame count


class GlyphVM:
    """Glyph Virtual Machine for executing spatial apps.

    Attributes:
        registers: 32 general-purpose 32-bit registers
        memory: 64KB address space
        pc: Program counter (byte offset into memory)
        halted: True if HALT executed
        flags: Comparison flags (ZERO, NEGATIVE, etc.)
        stack: Call stack for CALL/RET
    """

    MEMORY_SIZE = 65536  # 64KB
    MAX_STEPS = 100000   # Prevent infinite loops

    def __init__(self, syscall_handler: Optional[Callable] = None):
        """Initialize VM.

        Args:
            syscall_handler: Optional callback for SYNC instruction.
                Signature: (syscall_id: int, arg1: int, arg2: int) -> int
        """
        self.registers = [0] * 32
        self.memory = bytearray(self.MEMORY_SIZE)
        self.pc = 0
        self.halted = False
        self.error: Optional[str] = None
        self.flags = 0
        self.stack: List[int] = []
        self.frame = 0
        self._syscall_handler = syscall_handler

        # Execution metrics
        self._steps = 0
        self._syscall_count = 0

    @property
    def zero_flag(self) -> bool:
        return bool(self.flags & CompareFlags.ZERO)

    @property
    def negative_flag(self) -> bool:
        return bool(self.flags & CompareFlags.NEGATIVE)

    def reset(self):
        """Reset VM to initial state."""
        self.registers = [0] * 32
        self.memory = bytearray(self.MEMORY_SIZE)
        self.pc = 0
        self.halted = False
        self.error = None
        self.flags = 0
        self.stack = []
        self._steps = 0
        self._syscall_count = 0

    def load_app(self, app_bytes: bytes, origin_x: int = 0, origin_y: int = 0) -> bool:
        """Load app binary into VM memory.

        Args:
            app_bytes: Raw app binary (header + code)
            origin_x: Allocated region X coordinate
            origin_y: Allocated region Y coordinate

        Returns:
            True if loaded successfully
        """
        if len(app_bytes) > self.MEMORY_SIZE:
            self.error = "App too large"
            return False

        # Copy app to memory
        self.memory[:len(app_bytes)] = app_bytes

        # Set region origin register
        self.registers[R_REGION_ORIGIN] = (origin_x << 16) | origin_y

        # Entry point is at byte 16 (after header)
        self.pc = 16

        return True

    def set_interrupt(self, int_type: int, payload: int, source: int = 0):
        """Set interrupt registers before execution.

        Args:
            int_type: Interrupt type (KEYBOARD=1, MOUSE=2)
            payload: Keycode or button
            source: Device seat
        """
        self.registers[R_INT_TYPE] = int_type
        self.registers[R_INT_PAYLOAD] = payload
        self.registers[R_INT_SOURCE] = source

    def step(self) -> bool:
        """Execute one instruction.

        Returns:
            True if execution should continue, False if halted
        """
        if self.halted:
            return False

        if self._steps >= self.MAX_STEPS:
            self.error = "Max steps exceeded"
            self.halted = True
            return False

        if self.pc >= self.MEMORY_SIZE - 3:
            self.error = "PC out of bounds"
            self.halted = True
            return False

        # Fetch instruction
        opcode = self.memory[self.pc]
        rd = self.memory[self.pc + 1]
        rs1 = self.memory[self.pc + 2]
        rs2 = self.memory[self.pc + 3]

        # Execute
        self._steps += 1

        try:
            next_pc = self._execute(opcode, rd, rs1, rs2)
            if next_pc is not None:
                self.pc = next_pc
            else:
                self.pc += 4
        except Exception as e:
            self.error = f"Execution error: {e}"
            self.halted = True
            return False

        return not self.halted

    def run(self, max_frames: int = 1) -> int:
        """Run until HALT or max frames.

        Args:
            max_frames: Maximum frames to execute (0 = until halt)

        Returns:
            Number of instructions executed
        """
        initial_steps = self._steps
        frames_run = 0

        while not self.halted:
            if max_frames > 0 and frames_run >= max_frames:
                break
            if not self.step():
                break
            frames_run += 1

        return self._steps - initial_steps

    def _execute(self, opcode: int, rd: int, rs1: int, rs2: int) -> Optional[int]:
        """Execute single instruction.

        Returns:
            Next PC if jump, None for sequential
        """
        # Control flow
        if opcode == Opcode.NOP:
            return None

        if opcode == Opcode.HALT:
            self.halted = True
            return None

        if opcode == Opcode.JMP:
            return self.registers[rs1]

        if opcode == Opcode.JEQ:
            if self.zero_flag:
                return self.registers[rs1]
            return None

        if opcode == Opcode.JNE:
            if not self.zero_flag:
                return self.registers[rs1]
            return None

        if opcode == Opcode.JLT:
            if self.negative_flag and not self.zero_flag:
                return self.registers[rs1]
            return None

        if opcode == Opcode.JGT:
            if not self.negative_flag and not self.zero_flag:
                return self.registers[rs1]
            return None

        if opcode == Opcode.JLE:
            if self.zero_flag or self.negative_flag:
                return self.registers[rs1]
            return None

        if opcode == Opcode.JGE:
            if self.zero_flag or not self.negative_flag:
                return self.registers[rs1]
            return None

        if opcode == Opcode.CALL:
            self.stack.append(self.pc + 4)
            return self.registers[rs1]

        if opcode == Opcode.RET:
            if not self.stack:
                self.halted = True
                return None
            return self.stack.pop()

        # Data movement
        if opcode == Opcode.MOV:
            self.registers[rd] = self.registers[rs1] & 0xFFFFFFFF
            return None

        if opcode == Opcode.MOVI or opcode == Opcode.LDI:
            self.registers[rd] = rs2 & 0xFFFFFFFF
            return None

        if opcode == Opcode.LD:
            addr = self.registers[rs1]
            if 0 <= addr < self.MEMORY_SIZE - 3:
                # Load 4 bytes as little-endian
                self.registers[rd] = (
                    self.memory[addr] |
                    (self.memory[addr + 1] << 8) |
                    (self.memory[addr + 2] << 16) |
                    (self.memory[addr + 3] << 24)
                )
            return None

        if opcode == Opcode.ST:
            addr = self.registers[rs1]
            if 0 <= addr < self.MEMORY_SIZE - 3:
                val = self.registers[rd]
                self.memory[addr] = val & 0xFF
                self.memory[addr + 1] = (val >> 8) & 0xFF
                self.memory[addr + 2] = (val >> 16) & 0xFF
                self.memory[addr + 3] = (val >> 24) & 0xFF
            return None

        if opcode == Opcode.LOAD_OFF:
            addr = self.registers[rs1] + rs2
            if 0 <= addr < self.MEMORY_SIZE - 3:
                self.registers[rd] = (
                    self.memory[addr] |
                    (self.memory[addr + 1] << 8) |
                    (self.memory[addr + 2] << 16) |
                    (self.memory[addr + 3] << 24)
                )
            return None

        if opcode == Opcode.STORE_OFF:
            addr = self.registers[rs1] + rs2
            if 0 <= addr < self.MEMORY_SIZE - 3:
                val = self.registers[rd]
                self.memory[addr] = val & 0xFF
                self.memory[addr + 1] = (val >> 8) & 0xFF
                self.memory[addr + 2] = (val >> 16) & 0xFF
                self.memory[addr + 3] = (val >> 24) & 0xFF
            return None

        # Arithmetic
        if opcode == Opcode.ADD:
            self.registers[rd] = (self.registers[rd] + self.registers[rs1]) & 0xFFFFFFFF
            return None

        if opcode == Opcode.SUB:
            self.registers[rd] = (self.registers[rd] - self.registers[rs1]) & 0xFFFFFFFF
            return None

        if opcode == Opcode.MUL:
            self.registers[rd] = (self.registers[rd] * self.registers[rs1]) & 0xFFFFFFFF
            return None

        if opcode == Opcode.DIV:
            if self.registers[rs1] != 0:
                self.registers[rd] = self.registers[rd] // self.registers[rs1]
            return None

        if opcode == Opcode.MOD:
            if self.registers[rs1] != 0:
                self.registers[rd] = self.registers[rd] % self.registers[rs1]
            return None

        if opcode == Opcode.ADDI:
            self.registers[rd] = (self.registers[rd] + rs2) & 0xFFFFFFFF
            return None

        if opcode == Opcode.SUBI:
            self.registers[rd] = (self.registers[rd] - rs2) & 0xFFFFFFFF
            return None

        # Logic
        if opcode == Opcode.AND:
            self.registers[rd] = self.registers[rd] & self.registers[rs1]
            return None

        if opcode == Opcode.OR:
            self.registers[rd] = self.registers[rd] | self.registers[rs1]
            return None

        if opcode == Opcode.XOR:
            self.registers[rd] = self.registers[rd] ^ self.registers[rs1]
            return None

        if opcode == Opcode.NOT:
            self.registers[rd] = (~self.registers[rd]) & 0xFFFFFFFF
            return None

        if opcode == Opcode.SHL:
            self.registers[rd] = (self.registers[rd] << (self.registers[rs1] & 31)) & 0xFFFFFFFF
            return None

        if opcode == Opcode.SHR:
            self.registers[rd] = self.registers[rd] >> (self.registers[rs1] & 31)
            return None

        # Compare
        if opcode == Opcode.CMP:
            result = self.registers[rd] - self.registers[rs1]
            self._update_flags(result)
            return None

        if opcode == Opcode.CMPI:
            result = self.registers[rd] - rs2
            self._update_flags(result)
            return None

        # Stack
        if opcode == Opcode.PUSH:
            self.stack.append(self.registers[rd])
            return None

        if opcode == Opcode.POP:
            if self.stack:
                self.registers[rd] = self.stack.pop()
            return None

        # Special
        if opcode == Opcode.SYNC:
            self._handle_sync()
            return None

        if opcode == Opcode.DRAW:
            # DRAW writes to display buffer (placeholder)
            # In real implementation, this updates the glyph grid
            return None

        # Unknown opcode
        self.error = f"Unknown opcode: 0x{opcode:02X}"
        self.halted = True
        return None

    def _update_flags(self, result: int):
        """Update comparison flags based on result."""
        # Convert to signed 32-bit for comparison
        signed_result = result if result < 0x80000000 else result - 0x100000000

        self.flags = 0
        if signed_result == 0:
            self.flags |= CompareFlags.ZERO
        if signed_result < 0:
            self.flags |= CompareFlags.NEGATIVE

    def _handle_sync(self):
        """Handle SYNC (syscall) instruction."""
        self._syscall_count += 1

        syscall_id = self.registers[R0]
        arg1 = self.registers[R1]
        arg2 = self.registers[R2]

        if self._syscall_handler:
            # External handler
            result = self._syscall_handler(syscall_id, arg1, arg2)
        else:
            # Built-in handler
            result = self._builtin_syscall(syscall_id, arg1, arg2)

        self.registers[R3] = result

    def _builtin_syscall(self, syscall_id: int, arg1: int, arg2: int) -> int:
        """Built-in syscall handler."""
        if syscall_id == SyscallID.GET_TIME:
            return self.frame

        if syscall_id == SyscallID.REQUEST_FOCUS:
            return 1  # Success

        if syscall_id == SyscallID.YIELD_FOCUS:
            return 1  # Success

        # Default: return error
        return ErrorCode.INVALID_ARGS

    def get_state(self) -> VMState:
        """Get current VM state snapshot."""
        return VMState(
            pc=self.pc,
            registers=self.registers.copy(),
            memory=bytearray(self.memory),
            halted=self.halted,
            error=self.error,
            flags=self.flags,
            stack=self.stack.copy(),
            frame=self.frame,
        )


def assemble(instructions: List[Tuple[int, int, int, int]]) -> bytes:
    """Assemble list of (opcode, rd, rs1, rs2) tuples to bytes.

    Args:
        instructions: List of 4-tuples

    Returns:
        Bytecode as bytes
    """
    result = bytearray()
    for opcode, rd, rs1, rs2 in instructions:
        result.extend([opcode, rd, rs1, rs2])
    return bytes(result)
