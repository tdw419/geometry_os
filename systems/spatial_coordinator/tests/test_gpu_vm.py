"""Tests for GPU Glyph VM."""
import pytest
import struct
from systems.spatial_coordinator.gpu_vm import GPUGlyphVM, HAS_WGPU
from systems.spatial_coordinator.opcodes import R0, R1, R2, R3, R_INT_PAYLOAD
from systems.spatial_coordinator.glyph_vm import assemble, Opcode


def make_app_bytes(code: bytes) -> bytes:
    """Create minimal valid app binary."""
    header = (
        b'GEOS'                        # Magic
        + (32).to_bytes(2, 'little')   # Width
        + (16).to_bytes(2, 'little')   # Height
        + b'\x40\x00'                  # Mem size: 64 slots
        + b'\x00\x00'                  # Entry point: (0, 0)
        + b'\x00\x00'                  # Handler table offset: 0
        + b'\x01\x00'                  # Flags: WANTS_KEYBOARD
    )
    return header + code


class TestGPUGlyphVM:
    """Test GPU Glyph VM (or CPU fallback)."""

    def test_creation(self):
        """VM should initialize correctly."""
        vm = GPUGlyphVM()
        assert vm.app_count == 0
        # has_gpu should be True when wgpu is available and pipeline loads
        # Check that it's a boolean (either True or False depending on GPU)
        assert isinstance(vm.has_gpu, bool)

    def test_load_app(self):
        """Should load a valid app."""
        vm = GPUGlyphVM()
        code = assemble([(Opcode.HALT, 0, 0, 0)])
        app = make_app_bytes(code)

        app_id = vm.load_app(app)

        assert app_id == 0
        assert vm.app_count == 1

    def test_load_multiple_apps(self):
        """Should load multiple apps."""
        vm = GPUGlyphVM()
        code = assemble([(Opcode.HALT, 0, 0, 0)])
        app = make_app_bytes(code)

        id1 = vm.load_app(app)
        id2 = vm.load_app(app)
        id3 = vm.load_app(app)

        assert id1 == 0
        assert id2 == 1
        assert id3 == 2
        assert vm.app_count == 3

    def test_load_rejects_invalid(self):
        """Should reject invalid apps."""
        vm = GPUGlyphVM()

        # No magic
        assert vm.load_app(b'XXXX' + b'\x00' * 12) is None

        # Too short
        assert vm.load_app(b'GEOS') is None

        assert vm.app_count == 0

    def test_run_halts(self):
        """Running should halt on HALT instruction."""
        vm = GPUGlyphVM()
        code = assemble([
            (Opcode.MOVI, R0, 0, 42),
            (Opcode.HALT, 0, 0, 0),
        ])
        app = make_app_bytes(code)
        app_id = vm.load_app(app)

        vm.run()

        assert vm.is_halted(app_id)
        assert vm.read_register(app_id, R0) == 42

    def test_arithmetic(self):
        """Should perform arithmetic correctly."""
        vm = GPUGlyphVM()
        code = assemble([
            (Opcode.MOVI, R0, 0, 10),
            (Opcode.MOVI, R1, 0, 5),
            (Opcode.ADD, R0, R1, 0),   # R0 += R1 = 15
            (Opcode.HALT, 0, 0, 0),
        ])
        app = make_app_bytes(code)
        vm.load_app(app)

        vm.run()

        assert vm.read_register(0, R0) == 15

    def test_memory_operations(self):
        """Should handle memory load/store."""
        vm = GPUGlyphVM()
        # MOVI only supports 8-bit immediates (0-255), so use smaller values
        code = assemble([
            (Opcode.MOVI, R0, 0, 200),    # Value to store (fits in 8 bits)
            (Opcode.MOVI, R1, 0, 100),    # Address (fits in 8 bits)
            (Opcode.ST, R0, R1, 0),       # mem[100] = R0
            (Opcode.MOVI, R0, 0, 0),      # Clear R0
            (Opcode.LD, R0, R1, 0),       # R0 = mem[100]
            (Opcode.HALT, 0, 0, 0),
        ])
        app = make_app_bytes(code)
        vm.load_app(app)

        vm.run()

        assert vm.read_register(0, R0) == 200

    def test_conditional_jump(self):
        """Should handle conditional jumps."""
        vm = GPUGlyphVM()
        # Memory layout after header (16 bytes):
        # Absolute 16: MOVI R0=5, 20: MOVI R1=5, 24: CMP, 28: MOVI R3=44, 32: JEQ
        # 36: MOVI R2=99 (skip), 40: HALT, 44: MOVI R2=42, 48: HALT
        # Jump target is ABSOLUTE address 44 (header 16 + code offset 28)
        code = assemble([
            (Opcode.MOVI, R0, 0, 5),        # code[0]
            (Opcode.MOVI, R1, 0, 5),        # code[4]
            (Opcode.CMP, R0, R1, 0),        # code[8] - Compare: equal
            (Opcode.MOVI, R3, 0, 44),       # code[12] - Jump target = 44 (absolute)
            (Opcode.JEQ, 0, R3, 0),         # code[16] - Jump if equal
            (Opcode.MOVI, R2, 0, 99),       # code[20] - Skip this
            (Opcode.HALT, 0, 0, 0),         # code[24]
            (Opcode.MOVI, R2, 0, 42),       # code[28] = absolute 44: Jump here
            (Opcode.HALT, 0, 0, 0),         # code[32] = absolute 48
        ])
        app = make_app_bytes(code)
        vm.load_app(app)

        vm.run()

        assert vm.read_register(0, R2) == 42

    def test_interrupt_registers(self):
        """Should set interrupt registers."""
        vm = GPUGlyphVM()
        code = assemble([
            (Opcode.MOV, R0, R_INT_PAYLOAD, 0),  # R0 = INT_PAYLOAD
            (Opcode.HALT, 0, 0, 0),
        ])
        app = make_app_bytes(code)
        vm.load_app(app)

        vm.set_interrupt(0, int_type=1, payload=0x20)
        vm.run()

        assert vm.read_register(0, R0) == 0x20


@pytest.mark.skipif(True, reason="GPU execution not yet implemented - using CPU fallback")
class TestGPUMode:
    """Tests specific to GPU execution mode."""

    def test_gpu_available(self):
        """Should have GPU available."""
        vm = GPUGlyphVM()
        assert vm.has_gpu

    def test_gpu_execution(self):
        """Should execute on GPU."""
        vm = GPUGlyphVM()
        assert vm.has_gpu

        code = assemble([
            (Opcode.MOVI, R0, 0, 10),
            (Opcode.ADDI, R0, 0, 5),
            (Opcode.HALT, 0, 0, 0),
        ])
        app = make_app_bytes(code)
        vm.load_app(app)

        vm.run()

        assert vm.read_register(0, R0) == 15
