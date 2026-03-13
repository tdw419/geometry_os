"""Tests for Glyph VM."""
import pytest
from systems.spatial_coordinator.glyph_vm import GlyphVM, assemble
from systems.spatial_coordinator.opcodes import (
    Opcode, R0, R1, R2, R3,
    R_INT_PAYLOAD, R_INT_TYPE,
)
from systems.spatial_coordinator.types import SyscallID


class TestVMInitialization:
    """Test VM initialization."""

    def test_default_state(self):
        """VM should initialize with default state."""
        vm = GlyphVM()
        assert len(vm.registers) == 32
        assert all(r == 0 for r in vm.registers)
        assert len(vm.memory) == 65536
        assert vm.pc == 0
        assert vm.halted is False
        assert vm.error is None

    def test_reset(self):
        """Reset should clear state."""
        vm = GlyphVM()
        vm.registers[0] = 42
        vm.pc = 100
        vm.halted = True

        vm.reset()

        assert vm.registers[0] == 0
        assert vm.pc == 0
        assert vm.halted is False


class TestBasicInstructions:
    """Test basic instruction execution."""

    def test_nop(self):
        """NOP should do nothing."""
        vm = GlyphVM()
        code = assemble([
            (Opcode.NOP, 0, 0, 0),
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)  # Run until halt

        assert vm.halted
        assert vm.error is None

    def test_halt(self):
        """HALT should stop execution."""
        vm = GlyphVM()
        code = assemble([(Opcode.HALT, 0, 0, 0)])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)  # Run until halt

        assert vm.halted

    def test_mov(self):
        """MOV should copy register."""
        vm = GlyphVM()
        vm.registers[1] = 42

        code = assemble([
            (Opcode.MOV, 0, 1, 0),   # R0 = R1
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 42

    def test_movi(self):
        """MOVI should load immediate."""
        vm = GlyphVM()

        code = assemble([
            (Opcode.MOVI, 0, 0, 123),   # R0 = 123
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 123


class TestArithmetic:
    """Test arithmetic instructions."""

    def test_add(self):
        """ADD should add registers."""
        vm = GlyphVM()
        vm.registers[0] = 10
        vm.registers[1] = 5

        code = assemble([
            (Opcode.ADD, 0, 1, 0),   # R0 += R1
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 15

    def test_sub(self):
        """SUB should subtract registers."""
        vm = GlyphVM()
        vm.registers[0] = 10
        vm.registers[1] = 3

        code = assemble([
            (Opcode.SUB, 0, 1, 0),   # R0 -= R1
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 7

    def test_mul(self):
        """MUL should multiply registers."""
        vm = GlyphVM()
        vm.registers[0] = 6
        vm.registers[1] = 7

        code = assemble([
            (Opcode.MUL, 0, 1, 0),   # R0 *= R1
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 42

    def test_div(self):
        """DIV should divide registers."""
        vm = GlyphVM()
        vm.registers[0] = 20
        vm.registers[1] = 4

        code = assemble([
            (Opcode.DIV, 0, 1, 0),   # R0 /= R1
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 5

    def test_addi(self):
        """ADDI should add immediate."""
        vm = GlyphVM()
        vm.registers[0] = 10

        code = assemble([
            (Opcode.ADDI, 0, 0, 5),   # R0 += 5
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 15


class TestCompare:
    """Test comparison instructions."""

    def test_cmp_equal(self):
        """CMP should set zero flag when equal."""
        vm = GlyphVM()
        vm.registers[0] = 5
        vm.registers[1] = 5

        code = assemble([
            (Opcode.CMP, 0, 1, 0),   # Compare R0, R1
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.zero_flag

    def test_cmp_less(self):
        """CMP should set negative flag when less."""
        vm = GlyphVM()
        vm.registers[0] = 3
        vm.registers[1] = 5

        code = assemble([
            (Opcode.CMP, 0, 1, 0),   # Compare R0, R1
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.negative_flag
        assert not vm.zero_flag


class TestJumps:
    """Test jump instructions."""

    def test_jeq_taken(self):
        """JEQ should jump when zero flag set."""
        vm = GlyphVM()
        vm.registers[0] = 5
        vm.registers[1] = 5
        vm.registers[2] = 32  # Jump target

        code = assemble([
            (Opcode.CMP, 0, 1, 0),      # 16: Compare
            (Opcode.JEQ, 0, 2, 0),      # 20: Jump if equal to addr in R2
            (Opcode.MOVI, 0, 0, 99),    # 24: Skip this
            (Opcode.HALT, 0, 0, 0),     # 28
            (Opcode.MOVI, 0, 0, 42),    # 32: Jump here
            (Opcode.HALT, 0, 0, 0),     # 36
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 42

    def test_jne_not_taken(self):
        """JNE should not jump when zero flag set."""
        vm = GlyphVM()
        vm.registers[0] = 5
        vm.registers[1] = 5

        code = assemble([
            (Opcode.CMP, 0, 1, 0),      # Compare
            (Opcode.MOVI, 2, 0, 40),    # R2 = 40 (jump target)
            (Opcode.JNE, 0, 2, 0),      # Should NOT jump
            (Opcode.MOVI, 0, 0, 42),    # Execute this
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 42


class TestCallReturn:
    """Test CALL/RET instructions."""

    def test_call_ret(self):
        """CALL and RET should work together."""
        vm = GlyphVM()
        vm.registers[5] = 40  # Subroutine address

        code = assemble([
            (Opcode.MOVI, 0, 0, 0),     # 16: R0 = 0
            (Opcode.CALL, 0, 5, 0),     # 20: Call subroutine
            (Opcode.HALT, 0, 0, 0),     # 24: Halt
            # Pad to 40
            (Opcode.NOP, 0, 0, 0),      # 28
            (Opcode.NOP, 0, 0, 0),      # 32
            (Opcode.NOP, 0, 0, 0),      # 36
            # Subroutine at 40
            (Opcode.ADDI, 0, 0, 10),    # 40: R0 += 10
            (Opcode.RET, 0, 0, 0),      # 44: Return
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 10


class TestMemory:
    """Test memory instructions."""

    def test_store_load(self):
        """ST and LD should work together."""
        vm = GlyphVM()
        vm.registers[0] = 12345
        vm.registers[1] = 1000  # Memory address

        code = assemble([
            (Opcode.ST, 0, 1, 0),       # mem[1000] = R0
            (Opcode.MOVI, 0, 0, 0),     # R0 = 0
            (Opcode.LD, 0, 1, 0),       # R0 = mem[1000]
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 12345


class TestSyscalls:
    """Test syscall handling."""

    def test_sync_get_time(self):
        """SYNC with GET_TIME should return frame."""
        vm = GlyphVM()
        vm.frame = 100
        vm.registers[R0] = SyscallID.GET_TIME

        code = assemble([
            (Opcode.SYNC, 0, 0, 0),
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[R3] == 100

    def test_sync_custom_handler(self):
        """SYNC should call custom handler."""
        called = []

        def handler(syscall_id, arg1, arg2):
            called.append((syscall_id, arg1, arg2))
            return 42

        vm = GlyphVM(syscall_handler=handler)
        vm.registers[R0] = 0x99
        vm.registers[R1] = 10
        vm.registers[R2] = 20

        code = assemble([
            (Opcode.SYNC, 0, 0, 0),
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert called == [(0x99, 10, 20)]
        assert vm.registers[R3] == 42


class TestInterrupts:
    """Test interrupt handling."""

    def test_interrupt_registers(self):
        """Should read interrupt from special registers."""
        vm = GlyphVM()
        vm.set_interrupt(int_type=1, payload=0x20, source=0)

        # Copy interrupt payload to R0
        code = assemble([
            (Opcode.MOV, 0, R_INT_PAYLOAD, 0),   # R0 = INT_PAYLOAD
            (Opcode.HALT, 0, 0, 0),
        ])
        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.run(max_frames=0)

        assert vm.registers[0] == 0x20


class TestCounterApp:
    """Test a realistic counter application."""

    def test_counter_increments_on_space(self):
        """Counter should increment when spacebar pressed."""
        vm = GlyphVM()
        vm.set_interrupt(int_type=1, payload=0x20)  # Keyboard, spacebar

        # Counter in memory at address 100
        counter_addr = 100

        code = assemble([
            # Load counter
            (Opcode.MOVI, 1, 0, counter_addr),  # R1 = counter address
            (Opcode.LD, 0, 1, 0),               # R0 = counter value

            # Check if spacebar
            (Opcode.CMP, R_INT_PAYLOAD, 0, 0x20),  # This won't work directly
            # Actually: compare INT_PAYLOAD with 0x20
            (Opcode.MOVI, 2, 0, 0x20),          # R2 = 0x20 (spacebar)
            (Opcode.CMP, R_INT_PAYLOAD, 2, 0),  # Compare INT_PAYLOAD, R2
            (Opcode.JNE, 0, 3, 0),              # Jump if not equal (addr in R3)

            # Increment counter
            (Opcode.ADDI, 0, 0, 1),             # R0 += 1
            (Opcode.ST, 0, 1, 0),               # counter = R0

            # Halt
            (Opcode.HALT, 0, 0, 0),

            # Skip target (not equal)
            (Opcode.HALT, 0, 0, 0),
        ])

        # Set jump target
        vm.registers[3] = 44  # Address of skip target

        vm.load_app(b'GEOS' + b'\x00' * 12 + code)
        vm.memory[counter_addr:counter_addr+4] = (5).to_bytes(4, 'little')  # Initial value
        vm.run(max_frames=0)

        # Counter should be incremented
        result = int.from_bytes(vm.memory[counter_addr:counter_addr+4], 'little')
        assert result == 6
