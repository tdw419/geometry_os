"""Tests for GeoASM Register File."""
import pytest
import numpy as np


class TestRegisterFile:
    """Test suite for RegisterFile class."""

    def test_import_register_file(self):
        """Test that RegisterFile can be imported."""
        from systems.visual_shell.geoasm.register_file import RegisterFile
        assert RegisterFile is not None

    def test_register_constants(self):
        """Test that register name constants are defined."""
        from systems.visual_shell.geoasm.register_file import (
            R0, R1, R2, R3, R4, R5, R6, R7
        )
        assert R0 == 0
        assert R1 == 1
        assert R2 == 2
        assert R3 == 3
        assert R4 == 4
        assert R5 == 5
        assert R6 == 6
        assert R7 == 7

    def test_hidden_dim_constant(self):
        """Test that HIDDEN_DIM is defined."""
        from systems.visual_shell.geoasm.register_file import HIDDEN_DIM
        assert HIDDEN_DIM == 64

    def test_create_register_file(self):
        """Test creating a RegisterFile instance."""
        from systems.visual_shell.geoasm.register_file import RegisterFile
        rf = RegisterFile()
        assert rf is not None

    def test_get_scalar_register_default_zero(self):
        """Test that scalar registers default to 0.0."""
        from systems.visual_shell.geoasm.register_file import RegisterFile, R0
        rf = RegisterFile()
        assert rf.get(R0) == 0.0

    def test_set_and_get_scalar_register(self):
        """Test setting and getting scalar registers."""
        from systems.visual_shell.geoasm.register_file import RegisterFile, R0, R1
        rf = RegisterFile()

        rf.set(R0, 42.0)
        assert rf.get(R0) == 42.0

        rf.set(R1, 3.14)
        assert np.isclose(rf.get(R1), 3.14)

    def test_get_vector_register_default_zeros(self):
        """Test that vector registers default to zeros."""
        from systems.visual_shell.geoasm.register_file import RegisterFile, R2, HIDDEN_DIM
        rf = RegisterFile()
        vec = rf.get_vector(R2)
        assert vec.shape == (HIDDEN_DIM,)
        assert np.allclose(vec, np.zeros(HIDDEN_DIM))

    def test_set_and_get_vector_register(self):
        """Test setting and getting vector registers."""
        from systems.visual_shell.geoasm.register_file import RegisterFile, R2, R3, R4, HIDDEN_DIM
        rf = RegisterFile()

        # Test R2
        vec2 = np.random.randn(HIDDEN_DIM).astype(np.float32)
        rf.set_vector(R2, vec2)
        assert np.allclose(rf.get_vector(R2), vec2)

        # Test R3
        vec3 = np.random.randn(HIDDEN_DIM).astype(np.float32)
        rf.set_vector(R3, vec3)
        assert np.allclose(rf.get_vector(R3), vec3)

        # Test R4
        vec4 = np.random.randn(HIDDEN_DIM).astype(np.float32)
        rf.set_vector(R4, vec4)
        assert np.allclose(rf.get_vector(R4), vec4)

    def test_scalar_registers_r5_r6_r7(self):
        """Test that R5, R6, R7 are scalar registers."""
        from systems.visual_shell.geoasm.register_file import RegisterFile, R5, R6, R7
        rf = RegisterFile()

        rf.set(R5, 100.0)
        assert rf.get(R5) == 100.0

        rf.set(R6, 7.0)
        assert rf.get(R6) == 7.0

        rf.set(R7, 999.0)
        assert rf.get(R7) == 999.0

    def test_invalid_register_index_raises(self):
        """Test that invalid register index raises ValueError."""
        from systems.visual_shell.geoasm.register_file import RegisterFile
        rf = RegisterFile()

        with pytest.raises(ValueError, match="Invalid register index"):
            rf.get(8)

        with pytest.raises(ValueError, match="Invalid register index"):
            rf.set(8, 1.0)

        with pytest.raises(ValueError, match="Invalid register index"):
            rf.get(-1)

    def test_vector_register_on_non_vector_raises(self):
        """Test that get_vector on non-vector registers raises ValueError."""
        from systems.visual_shell.geoasm.register_file import RegisterFile, R0, R1, R5, R6, R7
        rf = RegisterFile()

        for reg in [R0, R1, R5, R6, R7]:
            with pytest.raises(ValueError, match="not a vector register"):
                rf.get_vector(reg)

            with pytest.raises(ValueError, match="not a vector register"):
                rf.set_vector(reg, np.zeros(64, dtype=np.float32))

    def test_vector_wrong_dimension_raises(self):
        """Test that set_vector with wrong dimension raises ValueError."""
        from systems.visual_shell.geoasm.register_file import RegisterFile, R2, HIDDEN_DIM
        rf = RegisterFile()

        wrong_vec = np.zeros(32, dtype=np.float32)  # Wrong size
        with pytest.raises(ValueError, match=f"Expected vector of size {HIDDEN_DIM}"):
            rf.set_vector(R2, wrong_vec)

    def test_to_buffer_returns_float32_array(self):
        """Test that to_buffer returns contiguous float32 array."""
        from systems.visual_shell.geoasm.register_file import RegisterFile
        rf = RegisterFile()

        buffer = rf.to_buffer()
        assert isinstance(buffer, np.ndarray)
        assert buffer.dtype == np.float32
        assert buffer.flags['C_CONTIGUOUS']

    def test_to_buffer_size(self):
        """Test that to_buffer returns correct size (200 floats = 800 bytes)."""
        from systems.visual_shell.geoasm.register_file import (
            RegisterFile, SCALAR_COUNT, VECTOR_COUNT, HIDDEN_DIM, TOTAL_FLOATS
        )
        rf = RegisterFile()

        buffer = rf.to_buffer()
        expected_size = SCALAR_COUNT + (VECTOR_COUNT * HIDDEN_DIM)
        assert len(buffer) == expected_size
        assert len(buffer) == TOTAL_FLOATS
        assert buffer.nbytes == TOTAL_FLOATS * 4  # 4 bytes per float32

    def test_from_buffer_imports_state(self):
        """Test that from_buffer imports state correctly."""
        from systems.visual_shell.geoasm.register_file import (
            RegisterFile, R0, R1, R2, R3, R4, R5, R6, R7, TOTAL_FLOATS
        )
        rf = RegisterFile()

        # Create a buffer with known values
        buffer = np.zeros(TOTAL_FLOATS, dtype=np.float32)
        buffer[0] = 10.0  # R0
        buffer[1] = 20.0  # R1
        buffer[2] = 30.0  # R2 (vector, but setting scalar slot)

        # Set vector values (R2 starts at offset 8)
        buffer[8:72] = np.arange(64, dtype=np.float32)  # R2 vector

        rf.from_buffer(buffer)

        assert rf.get(R0) == 10.0
        assert rf.get(R1) == 20.0
        assert np.allclose(rf.get_vector(R2), np.arange(64, dtype=np.float32))

    def test_to_buffer_from_buffer_roundtrip(self):
        """Test that to_buffer and from_buffer are inverses."""
        from systems.visual_shell.geoasm.register_file import (
            RegisterFile, R0, R1, R2, R3, R4, R5, R6, R7
        )
        rf1 = RegisterFile()

        # Set some values
        rf1.set(R0, 1.0)
        rf1.set(R1, 2.0)
        rf1.set_vector(R2, np.ones(64, dtype=np.float32) * 3.0)
        rf1.set_vector(R3, np.ones(64, dtype=np.float32) * 4.0)
        rf1.set_vector(R4, np.ones(64, dtype=np.float32) * 5.0)
        rf1.set(R5, 6.0)
        rf1.set(R6, 7.0)
        rf1.set(R7, 8.0)

        # Export to buffer
        buffer = rf1.to_buffer()

        # Import into new register file
        rf2 = RegisterFile()
        rf2.from_buffer(buffer)

        # Verify all values match
        assert rf2.get(R0) == 1.0
        assert rf2.get(R1) == 2.0
        assert np.allclose(rf2.get_vector(R2), np.ones(64, dtype=np.float32) * 3.0)
        assert np.allclose(rf2.get_vector(R3), np.ones(64, dtype=np.float32) * 4.0)
        assert np.allclose(rf2.get_vector(R4), np.ones(64, dtype=np.float32) * 5.0)
        assert rf2.get(R5) == 6.0
        assert rf2.get(R6) == 7.0
        assert rf2.get(R7) == 8.0

    def test_buffer_layout_constants(self):
        """Test that buffer layout constants are defined correctly."""
        from systems.visual_shell.geoasm.register_file import (
            SCALAR_OFFSET, SCALAR_COUNT, VECTOR_OFFSET,
            VECTOR_SIZE, VECTOR_COUNT, TOTAL_FLOATS, HIDDEN_DIM
        )

        assert SCALAR_OFFSET == 0
        assert SCALAR_COUNT == 8
        assert VECTOR_OFFSET == SCALAR_COUNT
        assert VECTOR_SIZE == HIDDEN_DIM
        assert VECTOR_COUNT == 3  # R2, R3, R4
        assert TOTAL_FLOATS == SCALAR_COUNT + (VECTOR_COUNT * VECTOR_SIZE)
        assert TOTAL_FLOATS == 200  # 8 scalars + 3 * 64 vectors

    def test_gpu_buffer_export_size(self):
        """Test that GPU buffer export is exactly 800 bytes."""
        from systems.visual_shell.geoasm.register_file import RegisterFile
        rf = RegisterFile()

        buffer = rf.to_buffer()
        assert buffer.nbytes == 800  # 200 floats * 4 bytes
