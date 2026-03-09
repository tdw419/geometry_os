"""Register File for GeoASM Neural Assembly.

Provides 8 registers (R0-R7) for neural state management:
- R0, R1: Scalar registers (single float values)
- R2, R3, R4: Vector registers (64-dim hidden states)
- R5, R6, R7: Scalar registers

GPU-compatible buffer export/import for zero-copy execution.
"""

import numpy as np
from typing import Union

# Register name constants
R0, R1, R2, R3, R4, R5, R6, R7 = range(8)

# Hidden dimension for vector registers
HIDDEN_DIM = 64

# Buffer layout constants
SCALAR_OFFSET = 0
SCALAR_COUNT = 8
VECTOR_OFFSET = SCALAR_COUNT
VECTOR_SIZE = HIDDEN_DIM
VECTOR_COUNT = 3  # R2, R3, R4 are vectors

TOTAL_FLOATS = SCALAR_COUNT + (VECTOR_COUNT * VECTOR_SIZE)

# Which registers are vectors
VECTOR_REGISTERS = {R2, R3, R4}


class RegisterFile:
    """8-register file for GeoASM neural state management.

    Layout:
        - R0, R1: Scalar registers
        - R2, R3, R4: Vector registers (64-dim hidden states)
        - R5, R6, R7: Scalar registers

    GPU Buffer Layout (200 floats = 800 bytes):
        [0:8]    - Scalar registers R0-R7
        [8:72]   - Vector register R2 (64 floats)
        [72:136] - Vector register R3 (64 floats)
        [136:200] - Vector register R4 (64 floats)
    """

    def __init__(self):
        """Initialize register file with zeros."""
        # Scalar registers stored in numpy array
        self._scalars = np.zeros(SCALAR_COUNT, dtype=np.float32)

        # Vector registers stored as dict of numpy arrays
        self._vectors = {
            R2: np.zeros(HIDDEN_DIM, dtype=np.float32),
            R3: np.zeros(HIDDEN_DIM, dtype=np.float32),
            R4: np.zeros(HIDDEN_DIM, dtype=np.float32),
        }

    def get(self, reg: int) -> float:
        """Get scalar register value.

        Args:
            reg: Register index (0-7)

        Returns:
            Scalar value in register

        Raises:
            ValueError: If register index is invalid
        """
        self._validate_register(reg)
        return float(self._scalars[reg])

    def set(self, reg: int, value: float) -> None:
        """Set scalar register value.

        Args:
            reg: Register index (0-7)
            value: Scalar value to set

        Raises:
            ValueError: If register index is invalid
        """
        self._validate_register(reg)
        self._scalars[reg] = np.float32(value)

    def get_vector(self, reg: int) -> np.ndarray:
        """Get vector register value.

        Args:
            reg: Register index (must be R2, R3, or R4)

        Returns:
            64-dim numpy array (float32)

        Raises:
            ValueError: If register is not a vector register
        """
        if reg not in VECTOR_REGISTERS:
            raise ValueError(
                f"Register R{reg} is not a vector register. "
                f"Vector registers are: R2, R3, R4"
            )
        return self._vectors[reg].copy()

    def set_vector(self, reg: int, value: np.ndarray) -> None:
        """Set vector register value.

        Args:
            reg: Register index (must be R2, R3, or R4)
            value: 64-dim numpy array

        Raises:
            ValueError: If register is not a vector register or
                       value has wrong dimension
        """
        if reg not in VECTOR_REGISTERS:
            raise ValueError(
                f"Register R{reg} is not a vector register. "
                f"Vector registers are: R2, R3, R4"
            )

        if value.shape != (HIDDEN_DIM,):
            raise ValueError(
                f"Expected vector of size {HIDDEN_DIM}, got {value.shape[0]}"
            )

        self._vectors[reg] = value.astype(np.float32).copy()

    def to_buffer(self) -> np.ndarray:
        """Export register state to contiguous GPU-compatible buffer.

        Buffer layout:
            [0:8]     - Scalars R0-R7
            [8:72]    - Vector R2
            [72:136]  - Vector R3
            [136:200] - Vector R4

        Returns:
            Contiguous float32 array of size 200 (800 bytes)
        """
        buffer = np.zeros(TOTAL_FLOATS, dtype=np.float32)

        # Copy scalars
        buffer[0:SCALAR_COUNT] = self._scalars

        # Copy vectors
        buffer[8:72] = self._vectors[R2]
        buffer[72:136] = self._vectors[R3]
        buffer[136:200] = self._vectors[R4]

        return buffer

    def from_buffer(self, buffer: np.ndarray) -> None:
        """Import register state from buffer.

        Args:
            buffer: Float32 array of size 200

        Raises:
            ValueError: If buffer has wrong size
        """
        if len(buffer) != TOTAL_FLOATS:
            raise ValueError(
                f"Expected buffer of size {TOTAL_FLOATS}, got {len(buffer)}"
            )

        # Extract scalars
        self._scalars = buffer[0:SCALAR_COUNT].astype(np.float32).copy()

        # Extract vectors
        self._vectors[R2] = buffer[8:72].astype(np.float32).copy()
        self._vectors[R3] = buffer[72:136].astype(np.float32).copy()
        self._vectors[R4] = buffer[136:200].astype(np.float32).copy()

    def _validate_register(self, reg: int) -> None:
        """Validate register index.

        Args:
            reg: Register index to validate

        Raises:
            ValueError: If register index is invalid
        """
        if not (0 <= reg <= 7):
            raise ValueError(
                f"Invalid register index: {reg}. Must be 0-7."
            )
